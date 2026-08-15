-- ============================================
-- LUMA — Migration : suivi du temps d'apprentissage
-- ============================================

alter table user_settings add column if not exists total_learning_seconds integer not null default 0;
