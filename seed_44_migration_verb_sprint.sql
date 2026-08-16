-- ============================================
-- LUMA — Migration : record du défi 60s verbes irréguliers
-- ============================================

alter table user_settings add column if not exists best_verb_sprint_score integer not null default 0;
