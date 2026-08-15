-- ===== Unité 21 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Le backshift des temps', jsonb_build_object(
  'rule', 'Au discours rapporté, les temps reculent d''un cran : present->past, present perfect->past perfect, will->would.',
  'example', jsonb_build_object('en', '"I am tired," she said. -> She said she was tired.', 'fr', '"Je suis fatiguée", a-t-elle dit. -> Elle a dit qu''elle était fatiguée.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I am happy\" devient au discours rapporté...", "options": ["she said she is happy", "she said she was happy"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Backshift : was."}'),
  (2, 'qcm', '{"question": "\"I will call you\" devient...", "options": ["he said he will call me", "he said he would call me"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "will->would."}'),
  (3, 'fill_blank', '{"sentence_before": "\"I have finished,\" she said. -> She said she ", "sentence_after": ". (avait fini)", "correct_answers": ["had finished"], "feedback_correct": "Correct !", "feedback_incorrect": "had finished."}'),
  (4, 'true_false', '{"statement": "Au discours rapporté, les temps ne changent jamais.", "correct_answer": false, "feedback_correct": "Exact, c''est le backshift.", "feedback_incorrect": "En fait c''est faux : les temps reculent d''un cran."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Rapporter des affirmations', jsonb_build_object(
  'rule', 'Changement des pronoms et repères : today->that day, tomorrow->the next day, here->there.',
  'example', jsonb_build_object('en', '"I''m leaving tomorrow," she said. -> She said she was leaving the next day.', 'fr', '"Je pars demain", a-t-elle dit. -> Elle a dit qu''elle partait le lendemain.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Tomorrow\" devient au discours rapporté...", "options": ["tomorrow", "the next day", "yesterday", "today"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "tomorrow->the next day."}'),
  (2, 'qcm', '{"question": "\"Here\" devient...", "options": ["here", "there", "where", "now"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "here->there."}'),
  (3, 'fill_blank', '{"sentence_before": "\"I saw him yesterday,\" she said. -> She said she had seen him ", "sentence_after": ". (la veille)", "correct_answers": ["the day before"], "feedback_correct": "Correct !", "feedback_incorrect": "the day before."}'),
  (4, 'true_false', '{"statement": "Les repères de temps et de lieu changent aussi au discours rapporté.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Rapporter des questions fermées', jsonb_build_object(
  'rule', 'ask + if/whether, pas d''inversion, pas de point d''interrogation.',
  'example', jsonb_build_object('en', '"Are you coming?" -> He asked if I was coming.', 'fr', '"Tu viens ?" -> Il a demandé si je venais.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Are you coming?\" devient...", "options": ["he asked if I was coming", "he asked was I coming"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "if + ordre normal."}'),
  (2, 'qcm', '{"question": "Pour une question fermée, on utilise...", "options": ["if/whether", "le mot interrogatif", "rien"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "if/whether."}'),
  (3, 'fill_blank', '{"sentence_before": "\"Do you like coffee?\" -> She asked ", "sentence_after": " I liked coffee. (si)", "correct_answers": ["if"], "feedback_correct": "Correct !", "feedback_incorrect": "if."}'),
  (4, 'true_false', '{"statement": "\"He asked did I like coffee\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, pas d''inversion.", "feedback_incorrect": "En fait c''est faux : \"He asked if I liked coffee\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Rapporter des questions ouvertes', jsonb_build_object(
  'rule', 'Le mot interrogatif est conservé, mais l''ordre sujet-verbe est rétabli.',
  'example', jsonb_build_object('en', '"Where do you live?" -> He asked where I lived.', 'fr', '"Où habites-tu ?" -> Il a demandé où j''habitais.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Where do you live?\" devient...", "options": ["he asked where did I live", "he asked where I lived"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Ordre normal rétabli."}'),
  (2, 'qcm', '{"question": "\"What time is it?\" devient...", "options": ["he asked what time was it", "he asked what time it was"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Ordre normal rétabli."}'),
  (3, 'fill_blank', '{"sentence_before": "\"Where do you work?\" -> She asked ", "sentence_after": ". (où je travaillais)", "correct_answers": ["where I worked"], "feedback_correct": "Correct !", "feedback_incorrect": "where I worked."}'),
  (4, 'true_false', '{"statement": "On garde l''inversion sujet-verbe dans une question ouverte rapportée.", "correct_answer": false, "feedback_correct": "Exact, l''ordre normal est rétabli.", "feedback_incorrect": "En fait c''est faux : pas d''inversion."}')
) as v(position, type, content);

-- ===== Unité 22 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Who, which, that', jsonb_build_object(
  'rule', 'who pour les personnes, which pour les choses/animaux, that pour les deux (informel).',
  'example', jsonb_build_object('en', 'The man who called is my boss.', 'fr', 'L''homme qui a appelé est mon patron.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The man ___ lives next door is a doctor.", "options": ["who", "which", "what", "where"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Personne : who."}'),
  (2, 'qcm', '{"question": "Complète : The book ___ I read was great.", "options": ["who", "which", "whose", "where"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Chose : which."}'),
  (3, 'fill_blank', '{"sentence_before": "This is the car ", "sentence_after": " I bought. (que)", "correct_answers": ["that"], "feedback_correct": "Correct !", "feedback_incorrect": "that."}'),
  (4, 'true_false', '{"statement": "\"Which\" peut s''utiliser pour désigner une personne.", "correct_answer": false, "feedback_correct": "Exact, which désigne une chose.", "feedback_incorrect": "En fait c''est faux : which ne désigne jamais une personne."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Whose et where', jsonb_build_object(
  'rule', 'whose pour la possession, where pour un lieu.',
  'example', jsonb_build_object('en', 'The woman whose car was stolen is here.', 'fr', 'La femme dont la voiture a été volée est ici.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The woman ___ car was stolen is here.", "options": ["who", "whose", "which", "where"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Possession : whose."}'),
  (2, 'qcm', '{"question": "Complète : This is the restaurant ___ we met.", "options": ["who", "whose", "which", "where"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "Lieu : where."}'),
  (3, 'fill_blank', '{"sentence_before": "The man ", "sentence_after": " dog barks is my neighbor. (dont)", "correct_answers": ["whose"], "feedback_correct": "Correct !", "feedback_incorrect": "whose."}'),
  (4, 'true_false', '{"statement": "\"Whose\" exprime la possession.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Relatives déterminatives vs non déterminatives', jsonb_build_object(
  'rule', 'Déterminative = essentielle, pas de virgule. Non déterminative = info supplémentaire, entre virgules, jamais that.',
  'example', jsonb_build_object('en', 'My mother, who lives in Lyon, is visiting me.', 'fr', 'Ma mère, qui vit à Lyon, me rend visite.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Dans une relative non déterminative, peut-on utiliser \"that\" ?", "options": ["Oui", "Non"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Non, jamais that avec des virgules."}'),
  (2, 'qcm', '{"question": "Quelle phrase est non déterminative ?", "options": ["The book that I bought is great", "My brother, who lives in Canada, is visiting"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Les virgules = non déterminative."}'),
  (3, 'fill_blank', '{"sentence_before": "Paris, ", "sentence_after": " is the capital of France, is beautiful. (qui)", "correct_answers": ["which"], "feedback_correct": "Correct !", "feedback_incorrect": "which, non déterminative."}'),
  (4, 'true_false', '{"statement": "Une relative non déterminative apporte une information essentielle à la phrase.", "correct_answer": false, "feedback_correct": "Exact, c''est une info supplémentaire.", "feedback_incorrect": "En fait c''est faux : ce n''est pas essentiel."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Omission du pronom relatif', jsonb_build_object(
  'rule', 'Le pronom relatif peut être omis quand il est objet dans une relative déterminative.',
  'example', jsonb_build_object('en', 'The book (that) I bought is great.', 'fr', 'Le livre que j''ai acheté est génial.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Peut-on omettre \"that\" dans : The book (that) I bought ?", "options": ["Oui", "Non"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Oui, objet omissible."}'),
  (2, 'qcm', '{"question": "Complète : The people ___ work with are friendly.", "options": ["who", "I", "which I", "doit rester"], "correct_index": 1, "feedback_correct": "Correct, le pronom peut être omis.", "feedback_incorrect": "Le pronom peut être omis ici."}'),
  (3, 'fill_blank', '{"sentence_before": "This is the job ", "sentence_after": " I applied for. (que, optionnel)", "correct_answers": ["that"], "feedback_correct": "Correct !", "feedback_incorrect": "that (optionnel)."}'),
  (4, 'true_false', '{"statement": "Le pronom relatif sujet peut aussi être omis.", "correct_answer": false, "feedback_correct": "Exact, seul l''objet peut être omis.", "feedback_incorrect": "En fait c''est faux : le sujet ne peut jamais être omis."}')
) as v(position, type, content);

