-- ===== Unité 9 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Going to (intention, prévision)', jsonb_build_object(
  'rule', 'to be + going to + base verbale pour une intention déjà décidée ou une prédiction avec preuve visible.',
  'example', jsonb_build_object('en', 'I''m going to visit my parents this weekend.', 'fr', 'Je vais rendre visite à mes parents ce week-end.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ going to call her later.", "options": ["am", "is", "are", "be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec I, on utilise am."}'),
  (2, 'qcm', '{"question": "Complète : Look at those clouds! It ___ going to rain.", "options": ["am", "is", "are", "be"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec it, on utilise is."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " to London next year. (allons déménager)", "correct_answers": ["are going to move"], "feedback_correct": "Correct !", "feedback_incorrect": "are going to move."}'),
  (4, 'true_false', '{"statement": "\"I going to work\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, il manque to be.", "feedback_incorrect": "En fait c''est faux : \"I AM going to work\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Will (décision spontanée, prédiction)', jsonb_build_object(
  'rule', 'will + base verbale pour une décision prise au moment de parler, une promesse, ou une prédiction sans preuve.',
  'example', jsonb_build_object('en', 'I think I''ll call him later.', 'fr', 'Je pense que je l''appellerai plus tard.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I think it ___ rain tomorrow.", "options": ["will", "going to", "is", "are"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Prédiction sans preuve : will."}'),
  (2, 'qcm', '{"question": "Quelle phrase exprime une décision spontanée ?", "options": ["I''m going to call him", "I''ll call him", "I call him", "I called him"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Décision à l''instant : I''ll call him."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " with that. (vais t''aider, offre spontanée)", "correct_answers": ["will help you"], "feedback_correct": "Correct !", "feedback_incorrect": "will help you."}'),
  (4, 'true_false', '{"statement": "\"Will\" et \"going to\" sont toujours interchangeables sans aucune nuance.", "correct_answer": false, "feedback_correct": "Exact, il y a une vraie nuance.", "feedback_incorrect": "En fait c''est faux : going to = décision déjà prise, will = décision à l''instant."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Négation et interrogation au futur', jsonb_build_object(
  'rule', 'won''t = will not. Are you going to...? / Will you...? pour les questions.',
  'example', jsonb_build_object('en', 'I won''t be late. Will you marry me?', 'fr', 'Je ne serai pas en retard. Tu veux m''épouser ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ be late, I promise.", "options": ["won''t", "not will", "don''t will", "no will"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "won''t = will not."}'),
  (2, 'qcm', '{"question": "Complète : ___ you going to finish this today?", "options": ["Do", "Are", "Will", "Is"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Are you going to."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " come to the party? (Vas-tu)", "correct_answers": ["Will you"], "feedback_correct": "Correct !", "feedback_incorrect": "Will you."}'),
  (4, 'true_false', '{"statement": "\"Won''t\" est la contraction de \"will not\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Vocabulaire des projets et intentions', jsonb_build_object(
  'rule', 'Vocabulaire utile : plan to, hope to, intend to, next week/month/year.',
  'example', jsonb_build_object('en', 'What are you going to do this summer?', 'fr', 'Qu''est-ce que tu vas faire cet été ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"next month\" ?", "options": ["le mois dernier", "le mois prochain", "ce mois-ci", "chaque mois"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "next month = le mois prochain."}'),
  (2, 'qcm', '{"question": "Complète : What are you going to do this ___?", "options": ["summer", "summered", "summering", "summers"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "summer, forme de base."}'),
  (3, 'fill_blank', '{"sentence_before": "I''m ", "sentence_after": " travel to Italy. (prévois de)", "correct_answers": ["planning to"], "feedback_correct": "Correct !", "feedback_incorrect": "planning to."}'),
  (4, 'true_false', '{"statement": "\"I''m going to move next year\" exprime un projet déjà décidé pour l''avenir.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

-- ===== Unité 10 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Comparatifs (adjectifs courts)', jsonb_build_object(
  'rule', 'Adjectif court (1 syllabe) + -er. Monosyllabe CVC → consonne doublée (big→bigger).',
  'example', jsonb_build_object('en', 'She is taller than me.', 'fr', 'Elle est plus grande que moi.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le comparatif de \"tall\" ?", "options": ["more tall", "taller", "tallest", "tall"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "taller, sans more."}'),
  (2, 'qcm', '{"question": "Quel est le comparatif de \"big\" ?", "options": ["biger", "bigger", "more big", "bigest"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "big double sa consonne : bigger."}'),
  (3, 'fill_blank', '{"sentence_before": "He is ", "sentence_after": " than his brother. (plus vieux)", "correct_answers": ["older"], "feedback_correct": "Correct !", "feedback_incorrect": "old→older."}'),
  (4, 'true_false', '{"statement": "\"More taller\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, on ne double jamais.", "feedback_incorrect": "En fait c''est faux : taller seul suffit."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Comparatifs (adjectifs longs) et irréguliers', jsonb_build_object(
  'rule', 'Adjectif long (2+ syllabes) → more + adjectif. Irréguliers : good→better, bad→worse.',
  'example', jsonb_build_object('en', 'This book is more interesting than that one.', 'fr', 'Ce livre est plus intéressant que celui-là.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le comparatif de \"expensive\" ?", "options": ["expensiver", "more expensive", "expensivest", "most expensive"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Adjectif long : more expensive."}'),
  (2, 'qcm', '{"question": "Quel est le comparatif de \"good\" ?", "options": ["gooder", "more good", "better", "best"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "good→better (irrégulier)."}'),
  (3, 'fill_blank', '{"sentence_before": "This restaurant is ", "sentence_after": " than the last one. (pire)", "correct_answers": ["worse"], "feedback_correct": "Correct !", "feedback_incorrect": "bad→worse (irrégulier)."}'),
  (4, 'true_false', '{"statement": "Le comparatif de \"bad\" est \"more bad\".", "correct_answer": false, "feedback_correct": "Exact, c''est worse.", "feedback_incorrect": "En fait c''est faux : bad→worse, irrégulier."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Superlatifs', jsonb_build_object(
  'rule', 'the + adjectif + -est (courts) ou the most + adjectif (longs). Irréguliers : the best, the worst.',
  'example', jsonb_build_object('en', 'He is the tallest in his class.', 'fr', 'Il est le plus grand de sa classe.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le superlatif de \"tall\" ?", "options": ["taller", "the tallest", "most tall", "tallest"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "the tallest, avec the."}'),
  (2, 'qcm', '{"question": "Quel est le superlatif de \"beautiful\" ?", "options": ["the beautifulest", "the most beautiful", "beautifuler", "most beautiful"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "the most beautiful."}'),
  (3, 'fill_blank', '{"sentence_before": "This is ", "sentence_after": " day of my life. (le pire)", "correct_answers": ["the worst"], "feedback_correct": "Correct !", "feedback_incorrect": "bad→the worst."}'),
  (4, 'true_false', '{"statement": "\"He is tallest\" est grammaticalement correct sans \"the\".", "correct_answer": false, "feedback_correct": "Exact, il faut toujours the.", "feedback_incorrect": "En fait c''est faux : \"He is THE tallest\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'As...as (égalité)', jsonb_build_object(
  'rule', 'as + adjectif + as pour exprimer une égalité. Négatif : not as...as.',
  'example', jsonb_build_object('en', 'My car is as fast as yours.', 'fr', 'Ma voiture est aussi rapide que la tienne.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She is ___ tall ___ her sister.", "options": ["as / as", "so / as", "more / as", "as / than"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "as...as est la structure d''égalité."}'),
  (2, 'qcm', '{"question": "Quelle phrase exprime une égalité ?", "options": ["She is taller than him", "She is as tall as him", "She is the tallest"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "as tall as = égalité."}'),
  (3, 'fill_blank', '{"sentence_before": "This film isn''t ", "sentence_after": " the book. (aussi bon que)", "correct_answers": ["as good as"], "feedback_correct": "Correct !", "feedback_incorrect": "as good as."}'),
  (4, 'true_false', '{"statement": "\"As...as\" exprime une différence, pas une égalité.", "correct_answer": false, "feedback_correct": "Exact, ça exprime une égalité.", "feedback_incorrect": "En fait c''est faux : as...as exprime une égalité."}')
) as v(position, type, content);

