-- ============================================
-- LUMA — Fix : les QCM de "La famille élargie" (A0) utilisaient encore un
-- emoji générique impossible à distinguer (oncle vs simple homme adulte).
-- Ces QCM sont piochés par le test de positionnement, d'où le problème visible
-- dès l'inscription. Remplacés par des questions de traduction (français -> anglais).
-- ============================================

update exercises
set content = '{"question": "\"oncle\" = ?", "options": ["aunt", "uncle", "cousin", "grandfather"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"oncle\" se dit \"uncle\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and type = 'qcm'
and content->>'question' = '👨‍🦱 = ?';

update exercises
set content = '{"question": "\"tante\" = ?", "options": ["uncle", "nephew", "niece", "aunt"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "\"tante\" se dit \"aunt\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and type = 'qcm'
and content->>'question' = '👩‍🦱 = ?';

update exercises
set content = '{"question": "\"cousin(e)\" = ?", "options": ["niece", "grandfather", "cousin(e)", "nephew"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"cousin(e)\" se dit \"cousin(e)\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and type = 'qcm'
and content->>'question' = '🧑 = ?';

update exercises
set content = '{"question": "\"grand-père\" = ?", "options": ["uncle", "grandfather", "cousin", "aunt"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"grand-père\" se dit \"grandfather\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and type = 'qcm'
and content->>'question' = '👴 = ?';
