# AGENTS.md — Restaurant U

> À placer à la racine du repo (Cursor lit `AGENTS.md`). Copie aussi le cahier des charges dans `docs/cahier-des-charges.md` : c'est la **source de vérité fonctionnelle**. En cas de conflit entre ce fichier et le cahier, le cahier gagne, et tu me signales le conflit.

---

## 1. Mission

Tu es l'ingénieur principal de **Restaurant U** : une plateforme de commande et de livraison de repas pour les restaurants et cantines de l'Université de Yaoundé I.

4 rôles : **client**, **livreur**, **sous-administrateur de restaurant**, **administrateur principal**.
Contexte : Cameroun, téléphones Android d'entrée de gamme, data chère, connexion instable. **Légèreté et robustesse avant tout.**

Avant d'écrire la moindre ligne de code, lis `docs/cahier-des-charges.md` en entier.

## 2. Stack (décidée, ne pas en changer sans me demander)

- **Front** : SvelteKit + TypeScript strict + Tailwind CSS, livré en **PWA** (manifest, service worker via Workbox ou vite-plugin-pwa).
- **Backend / données** : Supabase (PostgreSQL, Auth, Realtime, Edge Functions, pg_cron). **La logique critique vit dans PostgreSQL** (fonctions SQL, contraintes, transactions), pas dans le front.
- **Tests** : Vitest (unitaires), pgTAP ou tests SQL (règles de la base), Playwright (parcours clés).
- **Architecture API-first** : le front ne contient aucune règle métier. Il pourra ainsi être remplacé ou enveloppé (Capacitor / Expo) plus tard sans réécrire le backend.
- Code, tables, colonnes, variables en **anglais**. Interface utilisateur en **français par défaut**, avec i18n prête pour l'anglais (aucun texte en dur dans les composants).

## 3. Méthode de travail (impératif)

1. **Travaille par phases** (section 6). Ne passe jamais à la phase suivante sans ma validation explicite.
2. À chaque phase : (a) plan court, (b) liste des questions ouvertes, (c) implémentation, (d) tests, (e) résumé de ce qui est fait et de ce qui reste.
3. **N'invente aucune règle métier.** Si le cahier est ambigu ou muet, ajoute la question dans `docs/open-questions.md` et propose une option par défaut claire. Ne tranche pas en silence.
4. Petits commits, un sujet à la fois. Migrations SQL versionnées dans `supabase/migrations/`, jamais de modification manuelle de la base.
5. Pas de dépendance inutile. Chaque nouvelle librairie doit être justifiée en une ligne.
6. Budget de performance : page d'accueil client < 150 Ko de JS transféré (gzip), utilisable en 3G, mobile-first (320 px minimum), états de chargement et d'erreur partout.

## 4. Invariants non négociables

Ces règles viennent du cahier (sections 8, 11 à 13, 18, 21, 22). Elles doivent être **garanties par la base de données**, pas seulement par le code applicatif.

### 4.1 Commandes
- Une commande = **un seul restaurant**.
- **Machine à états explicite**, appliquée côté base (fonction `transition_order(order_id, new_status, actor, reason)` + table des transitions autorisées). Statuts : `pending_restaurant`, `confirmed`, `refused`, `searching_driver`, `assigned`, `in_delivery`, `delivered`, `cancelled`, `awaiting_customer_response`.
- Chaque transition est enregistrée : ancien statut, nouveau statut, acteur, motif, horodatage.
- Le **statut de livraison est indépendant du statut de paiement** (colonnes et logique séparées).
- **Snapshots à la création** : nom du plat, prix unitaire, quantité, frais de livraison, taux de commission sont copiés dans la commande. Aucune modification ultérieure de prix ou de configuration ne change une commande existante.

### 4.2 Attribution d'un livreur (concurrence)
- Seuls les livreurs **actifs, disponibles et sans livraison active** reçoivent des propositions.
- Acceptation **atomique** : une seule requête conditionnelle du type `UPDATE ... SET driver_id = $1 WHERE id = $2 AND driver_id IS NULL AND status = 'searching_driver'`, vérifiée par le nombre de lignes affectées. Ajoute une contrainte d'unicité garantissant qu'un livreur n'a qu'**une livraison active** à la fois.
- Écris un **test de concurrence** (N acceptations simultanées → exactement 1 gagnant).
- Si le livreur signale un problème après acceptation : libération de l'affectation, retour en `searching_driver`, nouvelle proposition automatique.
- Relances de recherche configurables (nombre, délai). Après épuisement : alerte à l'admin principal.

### 4.3 Code de livraison
- Code unique par livraison, **stocké haché**, usage unique, avec compteur de tentatives limité (configurable). La livraison n'est `delivered` qu'avec un code valide, correspondant à la commande, non utilisé.

### 4.4 Argent
- Montants en **entiers (FCFA, aucune décimale)**, jamais en flottants.
- **Grand livre (`ledger_entries`) en écriture seule** : aucune mise à jour ni suppression, corrections par écriture inverse. Chaque écriture porte : type, montant, commande liée, acteur, horodatage, **clé d'idempotence unique**.
- Distinguer partout : **calculé / confirmé / encaissé / dû / à rembourser / remboursé**.
- Revenu d'un restaurant, commission et gain livreur ne sont **acquis qu'après `delivered`**. Une commande annulée ou non livrée n'est jamais comptée comme vente.
- Commission = pourcentage des **frais de livraison uniquement** (ex. 300 FCFA, 10 % → 30 FCFA plateforme, 270 FCFA livreur).
- Remboursement : **une seule obligation par commande** (contrainte d'unicité), avec suivi `to_refund` → `refunded`, sans doublon.
- Paiement mobile (Orange Money, MTN MoMo) : état `pending_verification`, confirmation manuelle par l'admin, **une seule confirmation possible** (idempotence), identité de l'admin conservée. Une capture d'écran n'est jamais une preuve suffisante : prévoir des champs de référence de transaction.
- Paiement cash : suivre sommes attendues, **réellement reçues** et **reversées** par le livreur, avec détection des écarts.
- Règlements restaurants et livreurs **quotidiens** : calcul, enregistrement des versements, solde restant.

### 4.5 Comptes et sécurité
- Client : prénom, nom, numéro WhatsApp (unique), mot de passe. Identifiant généré **`chiffre + lettre majuscule + 2 chiffres`** (ex. `3A17`), sans doublon, avec gestion du cas de saturation (≈ 26 000 combinaisons : prévoir une alerte à partir d'un seuil de remplissage).
- Connexion client par **identifiant + mot de passe**. Supabase Auth exige un email : utilise un email synthétique dérivé de l'identifiant, ou une authentification personnalisée. Propose-moi l'option la plus propre dans `docs/open-questions.md`.
- Pas d'inscription publique pour restaurants et livreurs : comptes créés uniquement par l'admin principal.
- Récupération de mot de passe : code envoyé par WhatsApp, haché, expirant, usage unique, tentatives limitées. Ne jamais envoyer le mot de passe existant.
- Mots de passe hachés (argon2 ou bcrypt via Supabase Auth). Limitation de débit sur toutes les opérations sensibles.
- **Row Level Security sur toutes les tables.** Un sous-admin ne voit que son restaurant. Un client ne voit que ses commandes. Un livreur ne voit que ses livraisons. Fournis une **matrice rôle × table × opération** dans `docs/rls-matrix.md` et teste-la.
- **Journal d'activité** append-only (action, acteur, cible, horodatage, détails) pour : comptes, prix, modifications et annulations de commandes, paiements, remboursements, règlements, suspensions, interventions admin. Personne ne peut le modifier ou le supprimer via l'application.
- Désactiver / suspendre un compte **ne supprime jamais** son historique (soft state uniquement).

### 4.6 Configuration sans toucher au code
Table `settings` modifiable par l'admin : tarif de livraison, taux de commission, numéro WhatsApp du support, délai de confirmation restaurant, délai de réponse client à une modification, nombre et délai des relances de livraison, limites de tentatives (codes de vérification et de livraison), mode maintenance.

### 4.7 Tâches planifiées
Utilise `pg_cron` (ou équivalent) pour : expiration du délai de confirmation restaurant (→ annulation + remboursement à enregistrer si déjà payé), relances de recherche de livreur, expiration des propositions de modification (→ annulation), expiration des codes. Chaque tâche est **idempotente**.

### 4.8 Mode maintenance
Bloque les **nouvelles** commandes uniquement. Les commandes en cours continuent d'être suivies. Message clair pour les utilisateurs, sans détail technique.

## 5. Modèle de données (point de départ à affiner en phase 0)

`profiles`, `customers`, `restaurants`, `restaurant_admins`, `drivers`, `dishes` (catalogue permanent), `daily_menu_items` (prix du jour, disponibilité), `price_history`, `orders`, `order_items` (snapshot), `order_status_history`, `order_modifications` (proposition + réponse), `deliveries`, `delivery_attempts`, `delivery_codes`, `payments`, `payment_verifications`, `refunds`, `ledger_entries`, `settlements`, `cash_remittances`, `notifications`, `alerts`, `audit_log`, `settings`, `verification_codes`.

Pas d'archivage automatique en V1 : prévoir seulement des index adaptés aux filtres des rapports (période, restaurant, livreur).

## 6. Phases

**Phase 0 — Fondations (aucun écran)**
Livrables : structure du repo, `docs/architecture.md`, schéma SQL complet (migrations), diagramme de la machine à états + table des transitions, `docs/rls-matrix.md`, `docs/open-questions.md`. **Stop et attente de ma validation.**

**Phase 1 — Comptes, rôles, administration de base**
Inscription / connexion client, identifiant `3A17`, création restaurants / sous-admins / livreurs par l'admin, activation / désactivation, suspension client, `settings`, journal d'activité de base, shell PWA installable.

**Phase 2 — Catalogue et menus**
Catalogue permanent, menu quotidien, prix du jour, indisponibilité, historique des prix. Côté client : liste des restaurants, recherche (restaurant, plat, type), page restaurant avec menu du jour.

**Phase 3 — Panier et commande (paiement cash uniquement)**
Panier mono-restaurant, récapitulatif complet (sous-total, frais, total, lieu de livraison : faculté / bâtiment / salle / repère / indications), création de commande avec snapshots, historique, recommander.

**Phase 4 — Cycle de vie complet (fin du MVP)**
Confirmation / refus / expiration par le restaurant, recherche de livreur, acceptation atomique, signalement de problème et réattribution, `in_delivery`, code de livraison, annulation (client avant acceptation, admin après), modification proposée par le restaurant avec réponse du client. Suivi en temps réel (Realtime) et notifications in-app.
**Critère de fin de MVP : un parcours complet client → restaurant → livreur → code de livraison fonctionne en cash, avec tests automatisés des règles de la section 4.**

**Phase 5 — Notifications**
Web Push (Android), centre de notifications in-app, alertes admin. Préparer une interface d'envoi WhatsApp abstraite (adaptateur) sans fournisseur figé.

**Phase 6 — Paiements mobiles, remboursements, finance**
Orange Money / MTN MoMo avec vérification manuelle, remboursements, grand livre complet, cash et reversements, règlements quotidiens, détection des écarts.

**Phase 7 — Pilotage**
Tableau de bord financier avec filtres, rapports PDF et Excel, interface des alertes (en attente / résolues), journal consultable, mode maintenance, stratégie de sauvegarde documentée (plusieurs fois par jour, plusieurs versions, restauration testée).

**Phase 8 — WhatsApp**
Récupération de mot de passe et notifications via un fournisseur WhatsApp Business choisi ensemble. Vérification du changement de numéro.

## 7. Qualité et définition de « terminé »

Une tâche n'est terminée que si :
- elle respecte les invariants de la section 4,
- elle est couverte par des tests (obligatoires pour : machine à états, attribution concurrente, calculs financiers, idempotence des paiements / remboursements, RLS),
- les migrations s'appliquent sur une base vide,
- aucun secret n'est dans le code (variables d'environnement, `.env.example` à jour),
- les messages d'erreur côté utilisateur ne révèlent aucune information technique,
- l'interface est utilisable à une main sur un petit écran Android.

## 8. Premier travail demandé

Exécute la **Phase 0** maintenant. Commence par me présenter :
1. ta compréhension du projet en 10 lignes maximum,
2. les ambiguïtés et risques que tu as repérés dans le cahier,
3. ton plan détaillé de la Phase 0.

Attends mon feu vert avant de générer les migrations.
