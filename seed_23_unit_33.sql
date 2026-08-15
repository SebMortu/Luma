-- ===== Unité 33 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'La structure it-cleft', jsonb_build_object(
  'rule', 'It + be + élément mis en avant + that/who + reste de la phrase.',
  'example', jsonb_build_object('en', 'It was Sarah who broke the vase.', 'fr', 'C''est Sarah qui a cassé le vase.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : It ___ Sarah who called.", "options": ["is", "was", "had", "has"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "It was Sarah."}'),
  (2, 'qcm', '{"question": "La structure it-cleft sert à...", "options": ["simplifier une phrase", "mettre l''accent sur un élément"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Mettre l''accent."}'),
  (3, 'fill_blank', '{"sentence_before": "It was in 2015 ", "sentence_after": " we first met. (que)", "correct_answers": ["that"], "feedback_correct": "Correct !", "feedback_incorrect": "that."}'),
  (4, 'true_false', '{"statement": "\"It was John who called\" met l''emphase sur \"John\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'La structure what-cleft', jsonb_build_object(
  'rule', 'What + proposition + is/was + élément mis en avant.',
  'example', jsonb_build_object('en', 'What I need is more time.', 'fr', 'Ce dont j''ai besoin, c''est de plus de temps.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : What I need ___ more time.", "options": ["is", "are", "was being"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "is."}'),
  (2, 'qcm', '{"question": "Quelle phrase est une what-cleft ?", "options": ["It was Sarah who called", "What I love is travelling"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "What-cleft commence par What."}'),
  (3, 'fill_blank', '{"sentence_before": "What surprised everyone ", "sentence_after": " how calm she stayed. (était)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "was."}'),
  (4, 'true_false', '{"statement": "La what-cleft commence toujours par \"It\".", "correct_answer": false, "feedback_correct": "Exact, elle commence par What.", "feedback_incorrect": "En fait c''est faux : elle commence par What."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Emphase pour corriger une information', jsonb_build_object(
  'rule', 'Les phrases clivées permettent de corriger fermement une incompréhension.',
  'example', jsonb_build_object('en', 'It wasn''t John who broke the vase, it was Sarah.', 'fr', 'Ce n''était pas John qui a cassé le vase, c''était Sarah.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle structure permet de corriger une erreur avec force ?", "options": ["phrase neutre", "phrase clivée"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Phrase clivée."}'),
  (2, 'qcm', '{"question": "Complète : It''s not the money ___ motivates her, it''s the challenge.", "options": ["that", "who", "which is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "that."}'),
  (3, 'fill_blank', '{"sentence_before": "It ", "sentence_after": " my fault, it was his. (n''était pas)", "correct_answers": ["wasn''t"], "feedback_correct": "Correct !", "feedback_incorrect": "wasn''t."}'),
  (4, 'true_false', '{"statement": "Les phrases clivées se limitent à un usage purement littéraire, jamais à l''oral.", "correct_answer": false, "feedback_correct": "Exact, elles s''utilisent aussi à l''oral.", "feedback_incorrect": "En fait c''est faux : usage aussi oral."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Comparaison avec le français', jsonb_build_object(
  'rule', 'La structure "c''est... que/qui" en français se transpose presque littéralement en anglais.',
  'example', jsonb_build_object('en', 'It was my grandmother who taught me to cook.', 'fr', 'C''est ma grand-mère qui m''a appris à cuisiner.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"C''est Paul qui a fait ça\" se traduit par...", "options": ["Paul did that", "It was Paul who did that"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "It was Paul who did that."}'),
  (2, 'qcm', '{"question": "Cette structure française transpose-t-elle facilement en anglais ?", "options": ["Oui, plutôt facilement", "Non, c''est très différent"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Oui, transposition assez directe."}'),
  (3, 'fill_blank', '{"sentence_before": "It was my grandmother ", "sentence_after": " taught me to cook. (qui)", "correct_answers": ["who"], "feedback_correct": "Correct !", "feedback_incorrect": "who."}'),
  (4, 'true_false', '{"statement": "La structure clivée française et anglaise sont quasiment identiques.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

