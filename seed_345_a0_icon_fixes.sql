-- ============================================
-- LUMA — A0 : correction des 4 cas critiques (icônes trompeuses) et des 10
-- conflits d'emoji réutilisés entre leçons + réparation du doublon L29.
-- Solution temporaire en texte pur, en attendant le passage aux vraies images.
-- ============================================

-- Répare le doublon : la 2e leçon "famille élargie" matching (grand-père/neveu/nièce)
-- avait été écrasée par erreur avec le même contenu que la 1ère (oncle/tante/cousin).
-- On cible ici la ligne EXACTE contenant encore "cousin(e)" en position basse (donc dupliquée),
-- via son id précis récupéré par sous-requête ordonnée.
with dupes as (
  select id, row_number() over (order by position) as rn
  from exercises
  where lesson_id = (
    select lessons.id from lessons join units on units.id = lessons.unit_id
    where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
  )
  and type = 'matching'
  and content->>'instruction' = 'Relie le mot anglais à sa traduction.'
)
update exercises
set content = '{"instruction": "Relie le mot anglais à sa traduction (2).", "pairs": [{"left": "grandfather", "right": "grand-père"}, {"left": "nephew", "right": "neveu"}, {"left": "niece", "right": "nièce"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb
where id = (select id from dupes where rn = 2);

update exercises
set content = '{"question": "\"tête\" = ?", "options": ["head", "hand", "foot", "ear"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"tête\" se dit \"head\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5
)
and type = 'qcm'
and content->>'question' = '🗣️ = ?';

update exercises
set content = '{"question": "\"au revoir\" = ?", "options": ["goodbye", "hello", "thank you", "yes"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"au revoir\" se dit \"goodbye\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10
)
and type = 'qcm'
and content->>'question' = '🙋 = ?';

update exercises
set content = '{"question": "\"dedans\" = ?", "options": ["in", "up", "down", "closed"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"dedans\" se dit \"in\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 45
)
and type = 'qcm'
and content->>'question' = '➡️ = ?';

update exercises
set content = '{"question": "\"dehors\" = ?", "options": ["out", "open", "down", "in"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"dehors\" se dit \"out\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 45
)
and type = 'qcm'
and content->>'question' = '⬅️ = ?';

update exercises
set content = '{"question": "\"léger\" = ?", "options": ["light", "heavy", "day", "night"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"léger\" se dit \"light\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 46
)
and type = 'qcm'
and content->>'question' = '💡 = ?';

update exercises
set content = '{"question": "\"grand\" = ?", "options": ["big", "small", "round", "square"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"grand\" se dit \"big\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14
)
and type = 'qcm'
and content->>'question' = '🔵 = ?';

update exercises
set content = '{"question": "\"été\" = ?", "options": ["summer", "spring", "autumn", "winter"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"été\" se dit \"summer\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 30
)
and type = 'qcm'
and content->>'question' = '☀️ = ?';



update exercises
set content = '{"question": "\"parc\" = ?", "options": ["park", "school", "hospital", "shop"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"parc\" se dit \"park\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 24
)
and type = 'qcm'
and content->>'question' = '🏞️ = ?';

update exercises
set content = '{"question": "\"soda\" = ?", "options": ["soda", "juice", "tea", "coffee"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"soda\" se dit \"soda\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 17
)
and type = 'qcm'
and content->>'question' = '🥤 = ?';

update exercises
set content = '{"question": "\"livre\" = ?", "options": ["book", "pen", "pencil", "ruler"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"livre\" se dit \"book\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 18
)
and type = 'qcm'
and content->>'question' = '📖 = ?';


update exercises
set content = '{"question": "\"éclair\" = ?", "options": ["lightning", "thunder", "storm", "fog"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"éclair\" se dit \"lightning\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 44
)
and type = 'qcm'
and content->>'question' = '⚡ = ?';


update exercises
set content = '{"question": "\"après-midi\" = ?", "options": ["afternoon", "morning", "evening", "night"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"après-midi\" se dit \"afternoon\" en anglais."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 38
)
and type = 'qcm'
and content->>'question' = '☀️ = ?';
