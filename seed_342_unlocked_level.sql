-- ============================================
-- LUMA — Déblocage de niveau confirmé, sans fausses complétions
-- Avant : le test de positionnement marquait toutes les leçons des niveaux
-- inférieurs comme "complétées" pour débloquer l'accès, ce qui affichait à
-- tort des leçons jamais faites comme terminées.
-- Maintenant : un simple indicateur de niveau confirmé, complètement
-- indépendant de la progression réelle des leçons.
-- ============================================

alter table user_settings add column if not exists unlocked_level text;
