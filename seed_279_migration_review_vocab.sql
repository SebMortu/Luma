-- ============================================
-- LUMA — Migration : révision espacée pour le vocabulaire des livres
-- (le système existant n'était pas encore branché au front-end)
-- ============================================

alter table user_review_queue alter column item_id drop not null;
alter table user_review_queue add column if not exists content_en text;
alter table user_review_queue add column if not exists content_fr text;
alter table user_review_queue add column if not exists source_label text; -- ex: titre du livre

-- Empêche d'enregistrer deux fois la même phrase de vocabulaire pour un même utilisateur
create unique index if not exists user_review_queue_unique_vocab
  on user_review_queue (user_id, content_en)
  where item_type = 'vocabulary';
