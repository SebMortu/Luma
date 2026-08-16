-- ============================================
-- LUMA — Migration : suivi de l'XP du jour (pour le streak lié à l'objectif)
-- ============================================

alter table user_settings add column if not exists xp_gained_today integer not null default 0;
alter table user_settings add column if not exists xp_today_date date;
