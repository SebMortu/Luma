-- ============================================
-- LUMA — Audit A1, exercices "reorder" : plusieurs phrases n'acceptaient
-- qu'un seul ordre de mots, alors qu'une reformulation naturelle (complément
-- de temps en tête de phrase) était tout aussi correcte et aurait été
-- injustement rejetée. Nécessite le correctif de code sur ExerciseReorder.jsx.
-- ============================================

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Every evening we watch TV."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'We watch TV every evening.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["On Sundays I sleep in."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'I sleep in on Sundays.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["We traveled to London by train."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'We traveled by train to London.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Last summer I visited Rome."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'I visited Rome last summer.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Last night I had a fever."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'I had a fever last night.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Yesterday the weather was nice."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'The weather was nice yesterday.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Yesterday she cooked dinner."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'She cooked dinner yesterday.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Yesterday I found an old photo."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'I found an old photo yesterday.';
