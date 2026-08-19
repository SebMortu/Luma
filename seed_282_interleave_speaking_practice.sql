-- ============================================
-- LUMA — Correction : entrelacer les exercices "speaking_practice" au lieu
-- de les avoir tous regroupés à la fin de la leçon.
-- Suppose que la Leçon 1 / Unité 1 avait 8 exercices classiques (positions
-- 1-8) avant l'ajout des 3 exercices de lecture à voix haute (positions
-- 9, 10, 11, tels qu'insérés par seed_281). Nouvel ordre :
--   1, 2, [voix 1], 3, 4, [voix 2], 5, 6, [voix 3], 7, 8
-- ============================================

-- 0) VÉRIFICATION : lance d'abord cette requête seule. Tu dois voir des
-- positions 1 à 8 pour les types classiques, et 9, 10, 11 pour speaking_practice.
-- Si ce n'est pas le cas, ne lance PAS la mise à jour ci-dessous, dis-le moi.
select position, type from exercises
where lesson_id = (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 1
)
order by position;

-- 1) MISE À JOUR (à lancer seulement si la vérification ci-dessus correspond)
with target_lesson as (
  select lessons.id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 1
)
update exercises
set position = case position
  when 1 then 1
  when 2 then 2
  when 9 then 3   -- 1er exercice de lecture à voix haute
  when 3 then 4
  when 4 then 5
  when 10 then 6  -- 2e exercice de lecture à voix haute
  when 5 then 7
  when 6 then 8
  when 11 then 9  -- 3e exercice de lecture à voix haute
  when 7 then 10
  when 8 then 11
  else position
end
where lesson_id = (select id from target_lesson);
