-- ============================================
-- LUMA — Ajout de la traduction manquante
-- (exercice repéré dans la capture d'écran)
-- ============================================

update exercises set content = content || '{"sentence_fr": "Je ne suis pas encore prêt."}'::jsonb
where lesson_id = (select l.id from lessons l join units u on u.id = l.unit_id join languages lg on lg.id = u.language_id where lg.code='en' and u.position=1 and l.position=1)
  and position = 3;
