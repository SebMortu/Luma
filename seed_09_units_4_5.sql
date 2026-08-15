-- ===== Unité 4 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Adjectifs et pronoms possessifs', jsonb_build_object(
  'rule', 'my/your/his/her/its/our/their s''accordent avec le POSSESSEUR, pas avec l''objet possédé (contrairement au français).',
  'example', jsonb_build_object('en', 'She loves her job. He loves his job.', 'fr', 'Elle aime son travail. Il aime son travail.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Comment dit-on \"sa voiture\" (à Marc) ?", "options": ["her car", "his car", "its car", "their car"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Marc est un homme : his car."}'),
  (2, 'qcm', '{"question": "Comment dit-on \"sa voiture\" (à Julie) ?", "options": ["her car", "his car", "its car", "their car"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Julie est une femme : her car."}'),
  (3, 'fill_blank', '{"sentence_before": "This is ", "sentence_after": " house. (notre)", "correct_answers": ["our"], "feedback_correct": "Correct !", "feedback_incorrect": "our = notre."}'),
  (4, 'true_false', '{"statement": "En anglais, le possessif s''accorde avec l''objet possédé comme en français.", "correct_answer": false, "feedback_correct": "Exact, il s''accorde avec le possesseur.", "feedback_incorrect": "En fait c''est faux : il s''accorde avec le possesseur, pas l''objet."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Have got', jsonb_build_object(
  'rule', 'Forme britannique courante pour exprimer la possession. I''ve got / I haven''t got / Have you got...?',
  'example', jsonb_build_object('en', 'I''ve got two sisters.', 'fr', 'J''ai deux sœurs.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ you got a pen?", "options": ["Have", "Has", "Do", "Are"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec you, on utilise Have."}'),
  (2, 'qcm', '{"question": "Complète : She ___ got a car.", "options": ["have", "has", "haves", "having"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec she, on utilise has."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " got any money. (n''ai pas)", "correct_answers": ["haven''t"], "feedback_correct": "Correct !", "feedback_incorrect": "haven''t got = ne pas avoir."}'),
  (4, 'true_false', '{"statement": "\"Have got\" et \"have\" simple peuvent tous les deux exprimer la possession.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai, les deux formes coexistent."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Some et any', jsonb_build_object(
  'rule', 'Some dans les phrases affirmatives et les offres/demandes polies. Any dans les négations et les questions.',
  'example', jsonb_build_object('en', 'I have some bread. I don''t have any milk.', 'fr', 'J''ai du pain. Je n''ai pas de lait.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I don''t have ___ time.", "options": ["some", "any", "a", "an"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Négation : any."}'),
  (2, 'qcm', '{"question": "Complète : Would you like ___ tea?", "options": ["some", "any", "a", "an"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Offre polie : some."}'),
  (3, 'fill_blank', '{"sentence_before": "Do you have ", "sentence_after": " questions? (des)", "correct_answers": ["any"], "feedback_correct": "Correct !", "feedback_incorrect": "Question : any."}'),
  (4, 'true_false', '{"statement": "\"Some\" s''utilise dans les phrases négatives.", "correct_answer": false, "feedback_correct": "Exact, c''est any qui s''utilise dans les négations.", "feedback_incorrect": "En fait c''est faux : any s''utilise dans les négations."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Nombres, dates et heure', jsonb_build_object(
  'rule', 'Vocabulaire des nombres, comment dire une date, et comment dire l''heure.',
  'example', jsonb_build_object('en', 'It''s half past three. My birthday is on June 5th.', 'fr', 'Il est 15h30. Mon anniversaire est le 5 juin.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Comment dit-on \"15h30\" ?", "options": ["half past three", "three thirty", "quarter to four", "les deux premières sont correctes"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "Les deux formulations sont valables."}'),
  (2, 'qcm', '{"question": "Comment se dit \"5\" en anglais ?", "options": ["five", "fifth", "fives", "fifty"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "5 = five."}'),
  (3, 'fill_blank', '{"sentence_before": "My birthday is ", "sentence_after": " June. (en)", "correct_answers": ["in"], "feedback_correct": "Correct !", "feedback_incorrect": "in June = en juin."}'),
  (4, 'true_false', '{"statement": "\"Fifth\" est un nombre ordinal (5e), pas un nombre cardinal (5).", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai, fifth = 5e."}')
) as v(position, type, content);

-- ===== Unité 5 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Formation du present continuous', jsonb_build_object(
  'rule', 'to be + verbe en -ing. Règles d''orthographe : -e muet disparaît (make→making), consonne finale doublée pour les monosyllabes CVC (run→running).',
  'example', jsonb_build_object('en', 'I am reading a book.', 'fr', 'Je suis en train de lire un livre.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ (write) a letter.", "options": ["is writing", "is writeing", "writes", "write"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "write perd son -e : writing."}'),
  (2, 'qcm', '{"question": "Quelle est la forme -ing de \"run\" ?", "options": ["runing", "runeing", "running", "runring"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "run double sa consonne : running."}'),
  (3, 'fill_blank', '{"sentence_before": "They ", "sentence_after": " dinner. (mangent, en ce moment)", "correct_answers": ["are eating"], "feedback_correct": "Correct !", "feedback_incorrect": "are + eating."}'),
  (4, 'true_false', '{"statement": "Le -e final de \"make\" disparaît devant -ing (making).", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai : making, pas makeing."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Present simple vs present continuous', jsonb_build_object(
  'rule', 'Present simple = habitude/vérité générale. Present continuous = action en cours maintenant ou temporaire.',
  'example', jsonb_build_object('en', 'I work in Paris. I am working late tonight.', 'fr', 'Je travaille à Paris. Je travaille tard ce soir.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I usually ___ tea, but today I ___ coffee.", "options": ["drink / am drinking", "drink / drink", "am drinking / am drinking", "am drinking / drink"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Habitude puis exception ponctuelle : drink / am drinking."}'),
  (2, 'qcm', '{"question": "Quelle phrase décrit une habitude ?", "options": ["I am eating breakfast", "I eat breakfast every day", "I am reading now", "She is sleeping"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"every day\" signale une habitude : present simple."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " in a bank. (travaille, tous les jours)", "correct_answers": ["works"], "feedback_correct": "Correct !", "feedback_incorrect": "Habitude = present simple : works."}'),
  (4, 'true_false', '{"statement": "\"I am knowing the answer\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, know est un verbe d''état.", "feedback_incorrect": "En fait c''est faux : know reste au present simple, \"I know\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Les activités et loisirs', jsonb_build_object(
  'rule', 'Vocabulaire des loisirs pour pratiquer le present continuous en contexte.',
  'example', jsonb_build_object('en', 'What are you doing? I''m watching a movie.', 'fr', 'Qu''est-ce que tu fais ? Je regarde un film.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"to watch a movie\" ?", "options": ["lire un livre", "regarder un film", "jouer", "cuisiner"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "watch a movie = regarder un film."}'),
  (2, 'qcm', '{"question": "Complète : What ___ you doing?", "options": ["is", "are", "do", "am"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec you, on utilise are."}'),
  (3, 'fill_blank', '{"sentence_before": "He is ", "sentence_after": " video games. (jouant)", "correct_answers": ["playing"], "feedback_correct": "Correct !", "feedback_incorrect": "play + ing = playing."}'),
  (4, 'true_false', '{"statement": "\"What are you doing?\" se traduit par \"Que fais-tu habituellement ?\"", "correct_answer": false, "feedback_correct": "Exact, ça veut dire \"en ce moment\".", "feedback_incorrect": "En fait c''est faux : ça signifie \"en ce moment\", pas habituellement."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Le futur proche avec le present continuous', jsonb_build_object(
  'rule', 'Le present continuous peut aussi exprimer un projet déjà planifié dans un futur proche.',
  'example', jsonb_build_object('en', 'We are meeting them tomorrow.', 'fr', 'On les rencontre demain.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ my parents this weekend (projet déjà prévu).", "options": ["visit", "am visiting", "visits", "visited"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Projet déjà prévu : present continuous."}'),
  (2, 'qcm', '{"question": "Quelle phrase exprime un projet futur déjà organisé ?", "options": ["I play tennis", "I am playing tennis on Saturday", "I played tennis", "I have played tennis"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"on Saturday\" + continuous = projet déjà prévu."}'),
  (3, 'fill_blank', '{"sentence_before": "They ", "sentence_after": " tomorrow. (partent, déjà prévu)", "correct_answers": ["are leaving"], "feedback_correct": "Correct !", "feedback_incorrect": "are + leaving."}'),
  (4, 'true_false', '{"statement": "Le present continuous peut seulement décrire une action en cours, jamais un futur.", "correct_answer": false, "feedback_correct": "Exact, il peut aussi exprimer un futur proche prévu.", "feedback_incorrect": "En fait c''est faux : il peut exprimer un projet futur déjà planifié."}')
) as v(position, type, content);

