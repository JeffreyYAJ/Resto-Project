# Questions ouvertes et options retenues par défaut

## 1. Authentification client

Question : faut-il utiliser un email synthétique dérivé de l’identifiant client avec Supabase Auth, ou une authentification personnalisée dédiée ?

Option par défaut recommandée : utiliser un email synthétique stable dérivé de l’identifiant (ex. 3A17@resto-u.local) et garder l’authentification côté Supabase Auth, mais avec un mécanisme de login personnalisé basé sur l’identifiant + mot de passe. Cela conserve la compatibilité avec les outils de Supabase et réduit le risque d’intégration.

## 2. Fournisseur WhatsApp

Question : quel fournisseur SaaS utiliser pour les codes de récupération, les notifications et la vérification de numéro ?

Option par défaut recommandée : préparer une couche d’abstraction `notification_service` pour permettre de brancher WhatsApp Business, Twilio, ou un provider local sans modifier le cœur métier.

## 3. Gestion des identifiants clients

Question : comment gérer la saturation des identifiants à 3A17 ?

Option par défaut recommandée : générer l’identifiant aléatoirement parmi les 26 000 possibilités, puis déclencher une alerte si l’utilisation dépasse un seuil de remplissage configurable dans settings.

## 4. Validation de paiement mobile

Question : quel niveau de preuve doit être exigé pour confirmer un paiement mobile ?

Option par défaut recommandée : demander référence de transaction, opérateur, montant attendu, heure, et preuve de dépôt ; jamais accepter uniquement une capture d’écran comme preuve suffisante.

## 5. Tâches planifiées

Question : faut-il centraliser la logique des expirations dans des fonctions SQL ou dans des services externes ?

Option par défaut recommandée : conserver la logique critique dans PostgreSQL via pg_cron et fonctions SQL idempotentes.

## 6. Journal d’activité

Question : à quel niveau de détail détailler les événements ?

Option par défaut recommandée : stocker action, acteur, cible, horodatage et payload JSON léger, sans permettre de modification par les rôles applicatifs.

## 7. Mode maintenance

Question : comment afficher le message sur mobile et sur le web ?

Option par défaut recommandée : bannière simple en français, explicite et sans détails techniques, tout en maintenant les commandes déjà actives.

## 8. Modèle de notifications

Question : faut-il prévoir le Push Web uniquement ou ajouter un centre d’alertes in-app dès le début ?

Option par défaut recommandée : prévoir le centre d’alertes in-app à partir de la phase 1 et le Push Web à la phase 5.
