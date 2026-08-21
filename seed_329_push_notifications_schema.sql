-- ============================================
-- LUMA — Notifications push (1/2) : préparation de la base
-- ============================================

-- Empêche les doublons d'abonnement pour un même utilisateur/appareil
alter table push_subscriptions add constraint push_subscriptions_user_endpoint_unique unique (user_id, endpoint);

-- Politiques RLS : chaque utilisateur gère uniquement ses propres abonnements
alter table push_subscriptions enable row level security;

create policy "Users manage their own push subscriptions"
  on push_subscriptions for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
