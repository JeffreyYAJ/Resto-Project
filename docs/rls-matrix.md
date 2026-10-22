# Matrice RLS — rôle × table × opération

## Rôles

- client
- livreur
- restaurant_admin
- admin
- service_role (backend/data layer)

## Règles générales

- Les rôles applicatifs ne doivent jamais modifier directement les tables de finance sans contrôle centralisé.
- Les comptes ne doivent pas exposer d’informations sensibles hors besoin.
- Les clients ne voient que leurs commandes et informations associées.
- Les sous-admins ne voient que leur restaurant.
- Les livreurs ne voient que leurs livraisons et leur profil.
- Les admin principaux ont un accès global, mais avec journalisation stricte.

## Matrice simplifiée

| Table | Client | Livreur | Restaurant admin | Admin | service_role |
| --- | --- | --- | --- | --- | --- |
| profiles | lecture limitée de son propre profil | lecture limitée de son propre profil | lecture limitée du profil de son restaurant | lecture globale | lecture/écriture complète |
| customers | lecture/écriture sur son propre compte | aucune | aucune | lecture globale / modération | complète |
| restaurants | lecture publique | lecture publique | lecture/écriture sur son restaurant | lecture globale / modération | complète |
| restaurant_admins | aucune | aucune | lecture/écriture de son restaurant | lecture globale | complète |
| drivers | aucune | lecture/écriture sur son propre profil | lecture liée au restaurant | lecture globale / modération | complète |
| dishes | lecture publique | lecture publique | lecture/écriture de son restaurant | lecture globale | complète |
| daily_menu_items | lecture publique | lecture publique | lecture/écriture de son restaurant | lecture globale | complète |
| price_history | lecture publique si nécessaire | lecture publique si nécessaire | lecture sur son restaurant | lecture globale | complète |
| orders | lecture sur ses propres commandes | lecture sur ses livraisons | lecture sur son restaurant | lecture globale | complète |
| order_items | lecture sur ses commandes | lecture sur ses livraisons | lecture sur son restaurant | lecture globale | complète |
| order_status_history | lecture sur ses commandes | lecture sur ses livraisons | lecture sur son restaurant | lecture globale | complète |
| order_modifications | lecture sur ses commandes | lecture sur ses livraisons | lecture sur son restaurant | lecture globale | complète |
| deliveries | aucune | lecture/écriture de ses livraisons | lecture sur son restaurant | lecture globale | complète |
| delivery_attempts | aucune | lecture de ses tentatives | lecture sur son restaurant | lecture globale | complète |
| delivery_codes | aucune | lecture/écriture de ses livraisons | lecture sur son restaurant | lecture globale | complète |
| payments | lecture sur ses paiements | lecture sur ses livraisons | lecture sur son restaurant | lecture globale | complète |
| payment_verifications | lecture sur ses paiements | lecture sur ses livraisons | lecture sur son restaurant | lecture globale | complète |
| refunds | lecture sur ses remboursements | lecture sur ses livraisons | lecture sur son restaurant | lecture globale | complète |
| ledger_entries | aucune | aucune | aucune | lecture globale | écriture seule contrôlée |
| settlements | aucune | lecture sur ses règlements | lecture sur son restaurant | lecture globale | complète |
| cash_remittances | aucune | lecture sur ses remises | lecture sur son restaurant | lecture globale | complète |
| notifications | lecture sur ses notifications | lecture sur ses notifications | lecture sur son restaurant | lecture globale | complète |
| alerts | aucune | lecture sur ses alertes | lecture sur son restaurant | lecture globale | complète |
| audit_log | aucune | aucune | aucune | lecture globale | écriture append-only |
| settings | lecture publique limitée | lecture publique limitée | lecture publique limitée | lecture globale / modif | complète |
| verification_codes | lecture de ses propres codes | lecture de ses propres codes | lecture sur son restaurant | lecture globale | complète |

## Exemples de politiques demandées

- client : SELECT/UPDATE de own profile, own orders, own payments, own notifications.
- restaurant_admin : SELECT/UPDATE de son restaurant, menu, commandes du restaurant, livraisons associées.
- driver : SELECT/UPDATE sur ses livraisons, ses tentative de livraison, ses alertes et notifications.
- admin : accès global aux comptes, paiements, rapports, alertes, réglages, journal.

## Tests requis

- contrôle du périmètre d’un client sur ses commandes uniquement,
- contrôle du périmètre d’un sous-admin sur son restaurant uniquement,
- contrôle du périmètre d’un livreur sur ses livraisons uniquement,
- refus d’accès aux tables de finance pour les profils applicatifs non autorisés,
- vérification de l’append-only du journal d’activité.
