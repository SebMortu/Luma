-- ============================================
-- LUMA — Audit expert B2 : doubles réponses possibles + fausse précision
-- (fill_blank : must/have to, therefore/consequently/as a result)
-- (matching : connecteurs formels reformulés pour ne plus impliquer une
-- équivalence stricte 1-à-1 qui n'existe pas réellement en anglais)
-- ============================================

update exercises
set content = jsonb_set(content, '{correct_answers}', '["must", "has to"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'The report '
  and content->>'sentence_after' = ' be finished by Friday. (doit)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["therefore", "consequently", "as a result"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'He was late; '
  and content->>'sentence_after' = ', he missed the meeting. (par conséquent)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["consequently", "therefore", "as a result"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'Sales dropped; '
  and content->>'sentence_after' = ', the company cut costs. (par conséquent)';

update exercises
set content = jsonb_set(content, '{correct_answers}', '["consequently", "therefore", "as a result"]'::jsonb)
where type = 'fill_blank'
  and content->>'sentence_before' = 'The system failed; '
  and content->>'sentence_after' = ', we lost the data. (par conséquent)';

update exercises
set content = '{"instruction": "Classe chaque connecteur formel par nuance.", "pairs": [{"left": "consequently", "right": "conséquence (formel)"}, {"left": "hence", "right": "conséquence (très formel/académique)"}, {"left": "thus", "right": "conséquence (formel, à l''écrit)"}], "feedback_correct": "Bien vu !", "feedback_incorrect": "Ces trois mots expriment tous une conséquence formelle — ils sont largement interchangeables, pas des équivalents stricts d''un mot précis."}'::jsonb
where type = 'matching'
and content->>'instruction' = 'Relie le connecteur formel à son équivalent courant.';
