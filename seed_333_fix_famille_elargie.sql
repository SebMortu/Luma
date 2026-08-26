-- ============================================
-- LUMA — Fix : leçon "La famille élargie" (A0, position 29)
-- L'exercice image -> mot était injouable (impossible de distinguer visuellement
-- "oncle" d'un simple emoji "homme" avec un emoji générique). Remplacé par un
-- exercice de traduction, seul format pertinent pour du vocabulaire relationnel.
-- ============================================

update exercises
set type = 'matching',
    content = '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "uncle", "right": "oncle"}, {"left": "aunt", "right": "tante"}, {"left": "cousin", "right": "cousin(e)"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and type = 'matching'
and content->>'instruction' = 'Relie l''image au bon mot.';
