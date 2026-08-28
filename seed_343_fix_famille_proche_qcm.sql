-- ============================================
-- LUMA — Fix : les QCM de "La famille proche" (A0) utilisaient un emoji
-- générique de personne (👩👨👧👦), ambigu même dans un contexte familial.
-- Même correctif que "famille élargie" : question de traduction plutôt
-- que reconnaissance d'image.
-- ============================================

update exercises
set content = '{"question": "\"maman\" = ?", "options": ["grandma", "sister", "dad", "mom"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "\"maman\" se dit \"mom\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
)
and type = 'qcm'
and content->>'question' = '👩 = ?';

update exercises
set content = '{"question": "\"papa\" = ?", "options": ["mom", "brother", "dad", "baby"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"papa\" se dit \"dad\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
)
and type = 'qcm'
and content->>'question' = '👨 = ?';

update exercises
set content = '{"question": "\"sœur\" = ?", "options": ["brother", "grandma", "sister", "baby"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"sœur\" se dit \"sister\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
)
and type = 'qcm'
and content->>'question' = '👧 = ?';

update exercises
set content = '{"question": "\"frère\" = ?", "options": ["mom", "dad", "baby", "brother"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "\"frère\" se dit \"brother\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
)
and type = 'qcm'
and content->>'question' = '👦 = ?';
