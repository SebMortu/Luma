-- ===== Unité 13 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Prépositions de temps (at, on, in)', jsonb_build_object(
  'rule', 'at pour l''heure précise, on pour les jours/dates, in pour les mois/années/périodes longues.',
  'example', jsonb_build_object('en', 'I wake up at 7am. See you on Monday.', 'fr', 'Je me réveille à 7h. À lundi.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I wake up ___ 7am.", "options": ["at", "on", "in", "by"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Heure précise : at."}'),
  (2, 'qcm', '{"question": "Complète : See you ___ Monday.", "options": ["at", "on", "in", "by"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Jour : on."}'),
  (3, 'fill_blank', '{"sentence_before": "My birthday is ", "sentence_after": " June. (en)", "correct_answers": ["in"], "feedback_correct": "Correct !", "feedback_incorrect": "Mois : in."}'),
  (4, 'true_false', '{"statement": "\"At night\" est une exception (on utilise at au lieu de in).", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai, night est une exception."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Prépositions de lieu (at, in, on)', jsonb_build_object(
  'rule', 'at pour un point précis, in pour un espace fermé/ville/pays, on pour une surface/transport public.',
  'example', jsonb_build_object('en', 'The keys are in the drawer.', 'fr', 'Les clés sont dans le tiroir.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The keys are ___ the drawer.", "options": ["at", "in", "on", "by"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Espace fermé : in."}'),
  (2, 'qcm', '{"question": "Complète : I read the news ___ my phone.", "options": ["at", "in", "on", "by"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Surface/support : on."}'),
  (3, 'fill_blank', '{"sentence_before": "We met ", "sentence_after": " the airport. (à)", "correct_answers": ["at"], "feedback_correct": "Correct !", "feedback_incorrect": "Point précis : at."}'),
  (4, 'true_false', '{"statement": "On utilise toujours \"in\" pour un point précis comme un arrêt de bus.", "correct_answer": false, "feedback_correct": "Exact, c''est at.", "feedback_incorrect": "En fait c''est faux : \"at the bus stop\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Donner des directions', jsonb_build_object(
  'rule', 'Vocabulaire pour s''orienter : turn left/right, straight ahead, next to, opposite.',
  'example', jsonb_build_object('en', 'Turn left at the corner.', 'fr', 'Tourne à gauche au coin.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"turn left\" ?", "options": ["tourner à droite", "tourner à gauche", "continuer tout droit", "s''arrêter"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "turn left = tourner à gauche."}'),
  (2, 'qcm', '{"question": "Complète : Go ___ ahead, then turn right.", "options": ["straight", "direct", "forward", "right"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "straight ahead = tout droit."}'),
  (3, 'fill_blank', '{"sentence_before": "The bank is ", "sentence_after": " the pharmacy. (à côté de)", "correct_answers": ["next to"], "feedback_correct": "Correct !", "feedback_incorrect": "next to = à côté de."}'),
  (4, 'true_false', '{"statement": "\"Opposite\" signifie \"à côté de\".", "correct_answer": false, "feedback_correct": "Exact, ça signifie en face de.", "feedback_incorrect": "En fait c''est faux : opposite = en face de."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Combiner temps et lieu dans une phrase', jsonb_build_object(
  'rule', 'Ordre habituel en anglais : lieu puis temps.',
  'example', jsonb_build_object('en', 'I''ll meet you at the café at 6pm on Friday.', 'fr', 'Je te retrouve au café à 18h vendredi.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est l''ordre le plus naturel ?", "options": ["at 6pm at the café", "at the café at 6pm"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Lieu puis temps est le plus naturel."}'),
  (2, 'qcm', '{"question": "Complète : I''ll see you ___ the office ___ 9am.", "options": ["at / at", "in / on", "on / in", "at / in"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "at / at."}'),
  (3, 'fill_blank', '{"sentence_before": "Let''s meet ", "sentence_after": " the entrance at 8pm. (à)", "correct_answers": ["at"], "feedback_correct": "Correct !", "feedback_incorrect": "at = point précis."}'),
  (4, 'true_false', '{"statement": "L''ordre lieu puis temps est le plus naturel en anglais.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

-- ===== Unité 14 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Adverbes de fréquence', jsonb_build_object(
  'rule', 'always, usually, often, sometimes, rarely, never. Se placent avant le verbe principal, après to be.',
  'example', jsonb_build_object('en', 'I always drink coffee. She is never late.', 'fr', 'Je bois toujours du café. Elle n''est jamais en retard.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ drink coffee.", "options": ["always drink", "drink always", "am always drink"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "always avant le verbe : always drink."}'),
  (2, 'qcm', '{"question": "Complète : She is ___ late.", "options": ["never", "drink never", "not never"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "never après to be."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " go to the cinema. (allons parfois)", "correct_answers": ["sometimes go"], "feedback_correct": "Correct !", "feedback_incorrect": "sometimes go."}'),
  (4, 'true_false', '{"statement": "L''adverbe de fréquence se place toujours en début de phrase en anglais.", "correct_answer": false, "feedback_correct": "Exact, il se place avant le verbe ou après to be.", "feedback_incorrect": "En fait c''est faux : pas en début de phrase généralement."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Adverbes de manière', jsonb_build_object(
  'rule', 'Adjectif + -ly (quick→quickly). Irréguliers : good→well, fast→fast.',
  'example', jsonb_build_object('en', 'She speaks English fluently.', 'fr', 'Elle parle anglais couramment.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est l''adverbe de \"quick\" ?", "options": ["quickly", "quickily", "quicly", "quick"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "quick+ly = quickly."}'),
  (2, 'qcm', '{"question": "Quel est l''adverbe de \"good\" ?", "options": ["goodly", "good", "well", "gooder"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "good→well (irrégulier)."}'),
  (3, 'fill_blank', '{"sentence_before": "He drives ", "sentence_after": ". (prudemment)", "correct_answers": ["carefully"], "feedback_correct": "Correct !", "feedback_incorrect": "careful+ly = carefully."}'),
  (4, 'true_false', '{"statement": "\"He plays good\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, il faut well.", "feedback_incorrect": "En fait c''est faux : \"He plays WELL\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'L''échelle de fréquence', jsonb_build_object(
  'rule', 'Comprendre la nuance entre les différents adverbes de fréquence.',
  'example', jsonb_build_object('en', 'I usually wake up early, but I rarely go to bed early.', 'fr', 'Je me réveille généralement tôt, mais je me couche rarement tôt.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel adverbe correspond à environ 90% ?", "options": ["always", "usually", "sometimes", "rarely"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "usually ~90%."}'),
  (2, 'qcm', '{"question": "Quel adverbe correspond à 0% ?", "options": ["rarely", "never", "sometimes", "seldom"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "never = 0%."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " eat fast food. (rarement)", "correct_answers": ["rarely"], "feedback_correct": "Correct !", "feedback_incorrect": "rarely."}'),
  (4, 'true_false', '{"statement": "\"Sometimes\" et \"usually\" ont la même fréquence.", "correct_answer": false, "feedback_correct": "Exact, elles sont différentes.", "feedback_incorrect": "En fait c''est faux : sometimes ~50%, usually ~90%."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Nuancer une opinion', jsonb_build_object(
  'rule', 'Combiner adverbes de manière et de fréquence pour nuancer un avis.',
  'example', jsonb_build_object('en', 'I honestly think she usually works really hard.', 'fr', 'Je pense honnêtement qu''elle travaille généralement très dur.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ works hard.", "options": ["usual", "usually", "usualy", "usuallying"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "usually."}'),
  (2, 'qcm', '{"question": "Quelle phrase est bien nuancée ?", "options": ["She works", "She really works hard", "She work hard"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "really ajoute une nuance."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " don''t know. (honnêtement)", "correct_answers": ["honestly"], "feedback_correct": "Correct !", "feedback_incorrect": "honestly."}'),
  (4, 'true_false', '{"statement": "On peut combiner plusieurs adverbes dans une même phrase.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

