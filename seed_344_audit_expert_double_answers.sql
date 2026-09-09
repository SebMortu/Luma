-- ============================================
-- LUMA — Audit expert final : corrections des doubles réponses possibles
-- (méthode "avocat du diable" — réponses alternatives correctes mais rejetées à tort)
-- ============================================

update exercises
set content = jsonb_set(content, '{correct_answers}', '["swimming", "to swim"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'I like '
  and content->>'sentence_after' = ' (swim) in the sea.';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["waiting", "to wait"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'He hates '
  and content->>'sentence_after' = ' (wait) in line.';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["don''t", "do not"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'I '
  and content->>'sentence_after' = ' understand this. (négation)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["doesn''t like", "does not like"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'He '
  and content->>'sentence_after' = ' (not, like) coffee. (habitude)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["didn''t eat", "did not eat"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'She '
  and content->>'sentence_after' = ' (not, eat) breakfast this morning.';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["can''t", "couldn''t", "cannot", "could not"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'She '
  and content->>'sentence_after' = ' have known, nobody told her. (ne peut pas)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["shouldn''t", "should not"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'You '
  and content->>'sentence_after' = ' have listened to me! (n''aurais pas dû)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["shouldn''t", "should not"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'She '
  and content->>'sentence_after' = ' have trusted him. (n''aurait pas dû)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["didn''t know", "did not know"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'I''d rather he '
  and content->>'sentence_after' = ' (not, know) about this. (didn''t know)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["didn''t worry", "did not worry"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'I''d rather you '
  and content->>'sentence_after' = ' (not, worry) about it. (didn''t worry)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["weren''t", "were not"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'If he '
  and content->>'sentence_after' = ' lazy, he would have finished the project. (weren''t, condition présente)';
