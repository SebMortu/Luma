-- ============================================
-- LUMA — Audit expert A2 : doubles réponses possibles
-- (fill_blank : synonymes/quasi-synonymes non acceptés)
-- (reorder : complément de temps fronté, nécessite le fix de code déjà livré
-- sur ExerciseReorder.jsx lors de l'audit A1)
-- ============================================

update exercises
set content = jsonb_set(content, '{correct_answers}', '["quiet", "calm"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'This neighborhood is very '
  and content->>'sentence_after' = ' at night. (calme)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["might", "may", "could"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'It '
  and content->>'sentence_after' = ' snow tomorrow. (il se pourrait)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["may", "might"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'I '
  and content->>'sentence_after' = ' go to the party, I haven''t decided. (il se peut que j''aille)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["must", "have to"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'You '
  and content->>'sentence_after' = ' arrive before 9am. (obligation)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["must", "have to"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'Visitors '
  and content->>'sentence_after' = ' sign in at reception. (doivent)';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Later, she will call you."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'She will call you later.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Friday, we are flying to Rome."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'We are flying to Rome Friday.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Later, I''m going to call her."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'I''m going to call her later.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Today, he may be late."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'He may be late today.';
