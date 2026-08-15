-- ============================================
-- LUMA — Migration : catégorie d'examen
-- ============================================

alter table toeic_tests add column if not exists exam_type text not null default 'toeic';
-- Les 3 tests déjà importés restent automatiquement catégorisés 'toeic' grâce à la valeur par défaut.
