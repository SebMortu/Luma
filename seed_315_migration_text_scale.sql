-- ============================================
-- LUMA — Ajout du réglage de taille de texte
-- ============================================
alter table user_settings add column if not exists text_scale text not null default 'normal';
-- Valeurs possibles : 'normal' (100%), 'large' (115%), 'xlarge' (130%)
