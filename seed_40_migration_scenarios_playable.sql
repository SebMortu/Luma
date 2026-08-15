-- ============================================
-- LUMA — Migration : scénarios jouables
-- ============================================

alter table scenarios add column if not exists is_playable boolean not null default false;
