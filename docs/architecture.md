# Architecture du projet Restaurant U

## 1. Objectif

Restaurant U est une plateforme de commande et livraison de repas pour les restaurants et cantines de l’Université de Yaoundé I. L’objectif est de fournir un service mobile léger et robuste adapté aux téléphones Android bas de gamme, à des connexions faibles et à des coûts de données élevés.

## 2. Principes d’architecture

- API-first : le front ne contient pas de logique métier.
- Logique critique dans PostgreSQL : contraintes, transactions, fonctions SQL, triggers, machine à états.
- Données robustes avant expérience visuelle : validation côté base, journal d’activité, snapshots, RLS.
- Mobile-first : interface pensée pour 320 px, faible consommation, temps de réponse court.
- PWA : installation facile depuis mobile, cache léger, fonctionnement partiel hors ligne.

## 3. Stack retenue

### Frontend
- SvelteKit
- TypeScript strict
- Tailwind CSS
- PWA via vite-plugin-pwa ou Workbox

### Backend
- Supabase PostgreSQL
- Auth
- Realtime
- Edge Functions
- pg_cron

### Tests
- Vitest (unitaires)
- pgTAP ou tests SQL
- Playwright (parcours clé)

## 4. Structure de repo proposée

```text
.
├── apps/
│   └── web/
│       ├── src/
│       ├── static/
│       ├── package.json
│       └── svelte.config.js
├── supabase/
│   ├── migrations/
│   ├── functions/
│   └── config.toml
├── tests/
│   ├── unit/
│   ├── e2e/
│   └── sql/
├── docs/
│   ├── cahier-des-charges.md
│   ├── architecture.md
│   ├── machine-etats.md
│   ├── rls-matrix.md
│   ├── open-questions.md
│   └── ...
├── README.md
├── .env.example
├── .gitignore
└── package.json (workspace si nécessaire)
```

## 5. Séparation des responsabilités

### Frontend
- affichage des états
- envoi de commandes / requêtes API
- rendu des écrans et de la navigation
- gestion locale d’UI et de cache

### Base de données PostgreSQL
- validation métier essentielle
- machine à états
- contraintes d’intégrité
- règles de sécurité RLS
- calculs de finance
- transaction et idempotence

### Edge Functions / services
- intégrations externes (WhatsApp, notifications, paiements, etc.)
- orchestration d’événements très spécifiques
- tâches planifiées et callbacks

## 6. Sécurité et conformité fonctionnelle

- RLS sur chaque table.
- Journal append-only pour les opérations sensibles.
- Soft delete uniquement, jamais suppression définitive pour les comptes.
- Toutes les transactions financières au moins idempotentes.
- Utilisation des montants en FCFA sous forme d’entiers.

## 7. Règles de conception métier critiques

- Une commande appartient à un seul restaurant.
- Les livraisons sont un domaine séparé du paiement.
- Les prix et frais sont figés à la création de commande.
- L’attribution d’un livreur est atomique.
- Le grand livre est en écriture seule.
- Les comptes sont créés de manière contrôlée par l’admin principal.

## 8. Plan de validation Phase 0

La phase 0 doit produire :
1. structure du repo,
2. architecture technique,
3. schéma SQL initial et migrations,
4. diagramme de machine à états,
5. matrice RLS,
6. questions ouvertes,
7. validation fonctionnelle avant la phase 1.

## 9. Risques architecturaux à surveiller

- changements de statut sans historique fiable,
- double attribution de livreur,
- double remboursement,
- incohérence entre paiement et livraison,
- logique métier dupliquée côté frontend,
- documents fonctionnels non alignés avec les contraintes SQL.

## 10. Conclusion

La base doit être conçue comme un système transactionnel et auditable, avec l’intégrité des règles métier portée par la base de données. Le front n’est qu’une couche d’interaction, pas un lieu de validation métier.
