-- ============================================
-- LUMA — Audit expert B1 : doubles réponses possibles
-- (fill_blank : may/might récurrent ; reorder : complément de temps fronté)
-- ============================================

update exercises
set content = jsonb_set(content, '{correct_answers}', '["might", "may"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'She '
  and content->>'sentence_after' = ' not have seen the email yet. (pourrait ne pas)';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Recently, the situation has improved."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'The situation has improved recently.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Lately, I''ve been very busy."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'I''ve been very busy lately.';

update exercises
set content = jsonb_set(content, '{alternate_orders}', '["Lately, I have been studying hard."]'::jsonb)
where type = 'reorder'
  and content->>'correct_sentence' = 'I have been studying hard lately.';
