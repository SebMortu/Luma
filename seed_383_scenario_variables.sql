-- ============================================
-- LUMA — Moteur narratif : variables persistées dans la session en cours
-- Permet de reprendre un scénario avec son état de variables intact
-- (confiance, argent, indices trouvés...), pas seulement l'historique du
-- dialogue.
-- ============================================

alter table user_scenario_sessions add column if not exists variables jsonb not null default '{}';
