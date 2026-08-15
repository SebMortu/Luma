-- ===== Unité 2 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Formation affirmative', jsonb_build_object(
  'rule', 'Au présent simple, on ajoute un -s à la 3e personne du singulier (he/she/it). Pour les autres personnes (I/you/we/they), le verbe reste à sa forme de base.',
  'example', jsonb_build_object('en', 'She works in Paris.', 'fr', 'Elle travaille à Paris.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : He ___ every day.", "options": ["work", "works", "working", "worked"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La 3e personne du singulier prend -s : works."}'),
  (2, 'qcm', '{"question": "Complète : They ___ football on Sundays.", "options": ["plays", "play", "playing", "played"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec they, le verbe reste à sa forme de base : play."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " to school. (aller)", "correct_answers": ["goes"], "feedback_correct": "Correct !", "feedback_incorrect": "go devient goes à la 3e personne du singulier."}'),
  (4, 'true_false', '{"statement": "On ajoute toujours -s au verbe, peu importe le sujet.", "correct_answer": false, "feedback_correct": "Exact, seulement à la 3e personne du singulier.", "feedback_incorrect": "En fait c''est faux : le -s ne s''ajoute qu''à la 3e personne du singulier."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Formation négative', jsonb_build_object(
  'rule', 'On utilise do not (don''t) pour I/you/we/they, et does not (doesn''t) pour he/she/it. Le verbe principal repasse à sa forme de base.',
  'example', jsonb_build_object('en', 'He doesn''t like coffee.', 'fr', 'Il n''aime pas le café.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ like fish.", "options": ["don''t", "doesn''t", "not", "no"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec I, on utilise don''t."}'),
  (2, 'qcm', '{"question": "Complète : She ___ eat meat.", "options": ["don''t", "doesn''t", "not", "isn''t"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec she, on utilise doesn''t."}'),
  (3, 'fill_blank', '{"sentence_before": "They ", "sentence_after": " on Saturdays. (ne travaillent pas)", "correct_answers": ["don''t work"], "feedback_correct": "Correct !", "feedback_incorrect": "Il faut don''t + verbe de base."}'),
  (4, 'true_false', '{"statement": "\"He doesn''t likes coffee\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, le -s disparaît avec doesn''t.", "feedback_incorrect": "En fait c''est faux : \"He doesn''t LIKE coffee\", sans -s."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Formation interrogative', jsonb_build_object(
  'rule', 'On place Do (I/you/we/they) ou Does (he/she/it) en début de phrase, suivi du sujet et du verbe à sa forme de base.',
  'example', jsonb_build_object('en', 'Does she speak English?', 'fr', 'Elle parle anglais ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ you speak French?", "options": ["Do", "Does", "Are", "Is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec you, on utilise Do."}'),
  (2, 'qcm', '{"question": "Complète : ___ he play tennis?", "options": ["Do", "Does", "Is", "Are"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec he, on utilise Does."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " they live in London? (Est-ce qu''ils vivent)", "correct_answers": ["Do"], "feedback_correct": "Correct !", "feedback_incorrect": "Avec they, on utilise Do."}'),
  (4, 'true_false', '{"statement": "\"Does she plays tennis?\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, pas de -s après does.", "feedback_incorrect": "En fait c''est faux : \"Does she PLAY tennis?\", sans -s."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Les verbes de routine quotidienne', jsonb_build_object(
  'rule', 'Le present simple sert principalement à décrire des habitudes et routines. Vocabulaire clé : wake up, get up, have breakfast, go to work, come home, go to bed.',
  'example', jsonb_build_object('en', 'I wake up at 7am, then I have breakfast.', 'fr', 'Je me réveille à 7h, puis je prends mon petit-déjeuner.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"wake up\" ?", "options": ["se coucher", "se réveiller", "manger", "travailler"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "wake up = se réveiller."}'),
  (2, 'qcm', '{"question": "Complète : I ___ breakfast at 8am.", "options": ["have", "has", "having", "had"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec I, on utilise have."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " home at 6pm. (rentre)", "correct_answers": ["comes"], "feedback_correct": "Correct !", "feedback_incorrect": "come devient comes à la 3e personne."}'),
  (4, 'true_false', '{"statement": "Le present simple sert à décrire une action en train de se passer maintenant.", "correct_answer": false, "feedback_correct": "Exact, c''est le present continuous qui fait ça.", "feedback_incorrect": "En fait c''est faux : le present simple décrit les habitudes, pas l''instant présent."}')
) as v(position, type, content);

-- ===== Unité 3 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Les articles (a / an / the)', jsonb_build_object(
  'rule', 'a devant un son consonne, an devant un son voyelle, the pour du défini/connu, rien pour les généralités.',
  'example', jsonb_build_object('en', 'I have a car. She has an apple. The car is red.', 'fr', 'J''ai une voiture. Elle a une pomme. La voiture est rouge.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I have ___ apple.", "options": ["a", "an", "the", "rien"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "apple commence par un son voyelle : an apple."}'),
  (2, 'qcm', '{"question": "Complète : I have ___ university degree.", "options": ["a", "an", "the", "rien"], "correct_index": 0, "feedback_correct": "Correct ! university commence par un son \"you\".", "feedback_incorrect": "university a un son consonne \"y\" : a university."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " cats are cute. (généralité)", "correct_answers": ["", "Cats"], "feedback_correct": "Correct !", "feedback_incorrect": "Pour une généralité, pas d''article : Cats are cute."}'),
  (4, 'true_false', '{"statement": "\"I am teacher\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, il manque l''article.", "feedback_incorrect": "En fait c''est faux : il faut \"I am A teacher\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Les pluriels', jsonb_build_object(
  'rule', 'Ajout de -s en général, -es après s/sh/ch/x/z, y→ies après consonne. Pluriels irréguliers à mémoriser (man→men, child→children...).',
  'example', jsonb_build_object('en', 'I have two children and three cats.', 'fr', 'J''ai deux enfants et trois chats.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le pluriel de \"child\" ?", "options": ["childs", "children", "childes", "child"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "child a un pluriel irrégulier : children."}'),
  (2, 'qcm', '{"question": "Quel est le pluriel de \"box\" ?", "options": ["boxs", "boxes", "box", "boxies"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Après x, on ajoute -es : boxes."}'),
  (3, 'fill_blank', '{"sentence_before": "She has three ", "sentence_after": ". (city, au pluriel)", "correct_answers": ["cities"], "feedback_correct": "Correct !", "feedback_incorrect": "y précédé d''une consonne devient ies : cities."}'),
  (4, 'true_false', '{"statement": "Le pluriel de \"man\" est \"mans\".", "correct_answer": false, "feedback_correct": "Exact, c''est un pluriel irrégulier.", "feedback_incorrect": "En fait c''est faux : le pluriel de man est men."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'There is / there are', jsonb_build_object(
  'rule', 'There is + singulier/indénombrable, there are + pluriel. Négatif : there isn''t/aren''t. Interrogatif : is/are there...?',
  'example', jsonb_build_object('en', 'There are three books on the table.', 'fr', 'Il y a trois livres sur la table.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ a cat in the garden.", "options": ["There is", "There are", "It is", "They are"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"a cat\" est singulier : There is."}'),
  (2, 'qcm', '{"question": "Complète : ___ five students in the room.", "options": ["There is", "There are", "It''s", "They is"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"five students\" est pluriel : There are."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " any milk left? (Il y a)", "correct_answers": ["Is there"], "feedback_correct": "Correct !", "feedback_incorrect": "milk est indénombrable, donc singulier : Is there."}'),
  (4, 'true_false', '{"statement": "\"There is many people\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, many people est pluriel.", "feedback_incorrect": "En fait c''est faux : il faut \"There ARE many people\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Adjectifs descriptifs de base', jsonb_build_object(
  'rule', 'L''adjectif se place avant le nom en anglais (contrairement au français), et reste invariable (pas d''accord en genre/nombre).',
  'example', jsonb_build_object('en', 'She has a beautiful red car.', 'fr', 'Elle a une belle voiture rouge.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Comment dit-on \"une voiture rouge\" ?", "options": ["a car red", "a red car", "a red''s car", "red a car"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "L''adjectif se place avant le nom : a red car."}'),
  (2, 'qcm', '{"question": "Quel est le pluriel de l''adjectif dans \"a tall man\" → \"tall men\" ?", "options": ["talls", "tall", "talles", "talling"], "correct_index": 1, "feedback_correct": "Correct, l''adjectif ne change jamais.", "feedback_incorrect": "L''adjectif reste invariable : tall."}'),
  (3, 'fill_blank', '{"sentence_before": "They are ", "sentence_after": " buildings. (grands, pluriel)", "correct_answers": ["tall"], "feedback_correct": "Correct !", "feedback_incorrect": "L''adjectif ne prend jamais de -s : tall."}'),
  (4, 'true_false', '{"statement": "En anglais, l''adjectif s''accorde avec le nom comme en français.", "correct_answer": false, "feedback_correct": "Exact, l''adjectif anglais est invariable.", "feedback_incorrect": "En fait c''est faux : l''adjectif anglais ne s''accorde jamais."}')
) as v(position, type, content);

