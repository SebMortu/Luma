-- ===== Unité 6 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Formation du past simple (verbes réguliers)', jsonb_build_object(
  'rule', 'Base + -ed. Règles d''orthographe : -e muet → +d seulement, consonne+y → ied, monosyllabe CVC → consonne doublée.',
  'example', jsonb_build_object('en', 'I worked yesterday. I stopped smoking.', 'fr', 'J''ai travaillé hier. J''ai arrêté de fumer.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle est la forme au passé de \"like\" ?", "options": ["liked", "likeed", "likied", "likes"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "like perd son -e : liked."}'),
  (2, 'qcm', '{"question": "Quelle est la forme au passé de \"study\" ?", "options": ["studyed", "studied", "studies", "studing"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "y précédé d''une consonne devient ied : studied."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " smoking last year. (ai arrêté)", "correct_answers": ["stopped"], "feedback_correct": "Correct !", "feedback_incorrect": "stop double sa consonne : stopped."}'),
  (4, 'true_false', '{"statement": "Le passé de \"play\" est \"plaied\".", "correct_answer": false, "feedback_correct": "Exact, c''est played.", "feedback_incorrect": "En fait c''est faux : le y précédé d''une voyelle reste : played."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Négation et interrogation au passé', jsonb_build_object(
  'rule', 'did not (didn''t) pour tous les sujets + base verbale. Did + sujet + base verbale pour les questions.',
  'example', jsonb_build_object('en', 'I didn''t call you. Did you watch the film?', 'fr', 'Je ne t''ai pas appelé. Tu as regardé le film ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ call me yesterday.", "options": ["didn''t", "doesn''t", "don''t", "not"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Passé négatif : didn''t."}'),
  (2, 'qcm', '{"question": "Complète : ___ you watch the film?", "options": ["Do", "Does", "Did", "Are"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Question au passé : Did."}'),
  (3, 'fill_blank', '{"sentence_before": "They ", "sentence_after": " the movie. (n''ont pas aimé)", "correct_answers": ["didn''t like"], "feedback_correct": "Correct !", "feedback_incorrect": "didn''t + base verbale."}'),
  (4, 'true_false', '{"statement": "\"Did you worked yesterday?\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, le verbe reste à sa forme de base après did.", "feedback_incorrect": "En fait c''est faux : \"Did you WORK yesterday?\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Les marqueurs temporels du passé', jsonb_build_object(
  'rule', 'Vocabulaire indiquant le passé : yesterday, last week/month/year, ago, in [année].',
  'example', jsonb_build_object('en', 'I visited Rome three years ago.', 'fr', 'J''ai visité Rome il y a trois ans.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"last week\" ?", "options": ["la semaine prochaine", "la semaine dernière", "cette semaine", "chaque semaine"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "last week = la semaine dernière."}'),
  (2, 'qcm', '{"question": "Complète : I saw her two days ___.", "options": ["ago", "before", "last", "past"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "ago se place après la durée."}'),
  (3, 'fill_blank', '{"sentence_before": "We moved here ", "sentence_after": ". (l''année dernière)", "correct_answers": ["last year"], "feedback_correct": "Correct !", "feedback_incorrect": "last year = l''année dernière."}'),
  (4, 'true_false', '{"statement": "\"Ago\" se place avant la durée (ago three years).", "correct_answer": false, "feedback_correct": "Exact, il se place après.", "feedback_incorrect": "En fait c''est faux : \"three years AGO\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Raconter un événement simple', jsonb_build_object(
  'rule', 'Combiner verbes réguliers et marqueurs temporels pour raconter un souvenir bref.',
  'example', jsonb_build_object('en', 'Last summer, I traveled to Spain.', 'fr', 'L''été dernier, j''ai voyagé en Espagne.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Last year, I ___ to Italy.", "options": ["travel", "traveled", "traveling", "travels"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Passé régulier : traveled."}'),
  (2, 'qcm', '{"question": "Quelle phrase est bien au passé ?", "options": ["I visit Rome", "I am visiting Rome", "I visited Rome", "I visits Rome"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "visited est la forme au passé."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " there for a week. (sommes restés)", "correct_answers": ["stayed"], "feedback_correct": "Correct !", "feedback_incorrect": "stay + ed = stayed."}'),
  (4, 'true_false', '{"statement": "On peut combiner plusieurs verbes réguliers au passé dans un même récit.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai, c''est même la base du récit au passé."}')
) as v(position, type, content);

-- ===== Unité 7 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Les verbes irréguliers les plus courants (1)', jsonb_build_object(
  'rule', 'Certains verbes ne suivent pas la règle du -ed : go→went, have→had, do→did, see→saw, come→came.',
  'example', jsonb_build_object('en', 'I went to the cinema. She saw a bear.', 'fr', 'Je suis allé au cinéma. Elle a vu un ours.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le passé de \"go\" ?", "options": ["goed", "went", "gone", "going"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "go→went (irrégulier)."}'),
  (2, 'qcm', '{"question": "Quel est le passé de \"have\" ?", "options": ["haved", "has", "had", "having"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "have→had (irrégulier)."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " a bear in the forest. (ai vu)", "correct_answers": ["saw"], "feedback_correct": "Correct !", "feedback_incorrect": "see→saw (irrégulier)."}'),
  (4, 'true_false', '{"statement": "Le passé de \"come\" est \"comed\".", "correct_answer": false, "feedback_correct": "Exact, c''est came.", "feedback_incorrect": "En fait c''est faux : come→came (irrégulier)."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Les verbes irréguliers les plus courants (2)', jsonb_build_object(
  'rule', 'Suite de verbes fréquents : make→made, take→took, know→knew, think→thought, give→gave.',
  'example', jsonb_build_object('en', 'I made a mistake. She took the train.', 'fr', 'J''ai fait une erreur. Elle a pris le train.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le passé de \"take\" ?", "options": ["taked", "took", "taken", "taking"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "take→took (irrégulier)."}'),
  (2, 'qcm', '{"question": "Quel est le passé de \"think\" ?", "options": ["thinked", "thought", "thinken", "thinking"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "think→thought (irrégulier)."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " me a gift. (a donné)", "correct_answers": ["gave"], "feedback_correct": "Correct !", "feedback_incorrect": "give→gave (irrégulier)."}'),
  (4, 'true_false', '{"statement": "Le passé de \"know\" est \"knowed\".", "correct_answer": false, "feedback_correct": "Exact, c''est knew.", "feedback_incorrect": "En fait c''est faux : know→knew (irrégulier)."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Questions et négations avec les verbes irréguliers', jsonb_build_object(
  'rule', 'Même mécanisme que les verbes réguliers — did + base verbale, même pour les irréguliers.',
  'example', jsonb_build_object('en', 'Did you see him? I didn''t go to the party.', 'fr', 'Tu l''as vu ? Je ne suis pas allé à la fête.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ you go to the party?", "options": ["Did", "Do", "Does", "Were"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Question au passé : Did."}'),
  (2, 'qcm', '{"question": "Complète : I ___ see him yesterday.", "options": ["didn''t", "don''t", "not", "no"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Négation au passé : didn''t."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " my keys? (As-tu vu)", "correct_answers": ["Did you see"], "feedback_correct": "Correct !", "feedback_incorrect": "Did you see est la structure attendue."}'),
  (4, 'true_false', '{"statement": "\"Did you went there?\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, il faut la forme de base après did.", "feedback_incorrect": "En fait c''est faux : \"Did you GO there?\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Raconter un souvenir avec des verbes irréguliers', jsonb_build_object(
  'rule', 'Combiner plusieurs verbes irréguliers dans un récit cohérent.',
  'example', jsonb_build_object('en', 'Yesterday, I woke up late.', 'fr', 'Hier, je me suis réveillé tard.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ up late this morning.", "options": ["waked", "woke", "waking", "wake"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "wake→woke (irrégulier)."}'),
  (2, 'qcm', '{"question": "Quel est le passé de \"eat\" ?", "options": ["eated", "ate", "eaten", "eating"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "eat→ate (irrégulier)."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " the bus to work. (avons pris)", "correct_answers": ["took"], "feedback_correct": "Correct !", "feedback_incorrect": "take→took (irrégulier)."}'),
  (4, 'true_false', '{"statement": "Tous les verbes irréguliers ont une forme différente au passé et au participe passé.", "correct_answer": false, "feedback_correct": "Exact, certains sont identiques (come/came/come).", "feedback_incorrect": "En fait c''est faux : certains verbes ont la même forme au passé et au participe."}')
) as v(position, type, content);

-- ===== Unité 8 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Dénombrable et indénombrable', jsonb_build_object(
  'rule', 'Dénombrable = peut être compté, a un pluriel. Indénombrable = substance/concept, pas de pluriel, pas de a/an.',
  'example', jsonb_build_object('en', 'I have two books. I need some water.', 'fr', 'J''ai deux livres. J''ai besoin d''eau.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Water\" est-il dénombrable ou indénombrable ?", "options": ["Dénombrable", "Indénombrable"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "water est indénombrable."}'),
  (2, 'qcm', '{"question": "Lequel de ces mots est dénombrable ?", "options": ["information", "furniture", "book", "advice"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "book est le seul dénombrable de la liste."}'),
  (3, 'fill_blank', '{"sentence_before": "I need ", "sentence_after": " with this. (de l''aide)", "correct_answers": ["some help"], "feedback_correct": "Correct !", "feedback_incorrect": "help est indénombrable : some help."}'),
  (4, 'true_false', '{"statement": "\"Furniture\" a un pluriel en anglais (furnitures).", "correct_answer": false, "feedback_correct": "Exact, furniture est indénombrable.", "feedback_incorrect": "En fait c''est faux : furniture n''a pas de pluriel."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Much, many, a lot of', jsonb_build_object(
  'rule', 'Many + dénombrable, much + indénombrable, a lot of pour les deux.',
  'example', jsonb_build_object('en', 'I don''t have much time. There are many people here.', 'fr', 'Je n''ai pas beaucoup de temps. Il y a beaucoup de monde ici.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I don''t have ___ money.", "options": ["many", "much", "few", "a"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "money est indénombrable : much."}'),
  (2, 'qcm', '{"question": "Complète : There are ___ students in the class.", "options": ["much", "many", "a lot", "a"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "students est dénombrable : many."}'),
  (3, 'fill_blank', '{"sentence_before": "We have ", "sentence_after": " friends. (beaucoup de)", "correct_answers": ["a lot of"], "feedback_correct": "Correct !", "feedback_incorrect": "a lot of fonctionne pour les deux types."}'),
  (4, 'true_false', '{"statement": "\"Many information\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, information est indénombrable.", "feedback_incorrect": "En fait c''est faux : il faut \"much information\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Comparer des quantités (few, little)', jsonb_build_object(
  'rule', 'A few (dénombrable) et a little (indénombrable) = quelques/un peu (positif). Few/little seuls = pas assez (négatif).',
  'example', jsonb_build_object('en', 'I have a few friends here. I have little time.', 'fr', 'J''ai quelques amis ici. J''ai peu de temps.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I have ___ friends in London. (quelques, positif)", "options": ["a few", "few", "a little", "little"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "friends est dénombrable, sens positif : a few."}'),
  (2, 'qcm', '{"question": "Complète : We have ___ time left. (pas assez)", "options": ["a little", "little", "a few", "many"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "time est indénombrable, sens négatif : little."}'),
  (3, 'fill_blank', '{"sentence_before": "She has ", "sentence_after": " money. (un peu de)", "correct_answers": ["a little"], "feedback_correct": "Correct !", "feedback_incorrect": "money indénombrable, positif : a little."}'),
  (4, 'true_false', '{"statement": "\"Few\" et \"a few\" ont exactement le même sens.", "correct_answer": false, "feedback_correct": "Exact, few est négatif, a few est positif.", "feedback_incorrect": "En fait c''est faux : les nuances sont opposées."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Révision générale A1', jsonb_build_object(
  'rule', 'Cette leçon combine les points clés du niveau A1 : to be, present simple, present continuous, past simple, quantités.',
  'example', jsonb_build_object('en', 'I am a student. I study English every day. Yesterday, I studied for two hours.', 'fr', 'Je suis étudiant. J''étudie l''anglais tous les jours. Hier, j''ai étudié pendant deux heures.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ a teacher.", "options": ["is", "are", "am", "be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec she, on utilise is."}'),
  (2, 'qcm', '{"question": "Complète : Yesterday, I ___ to the cinema.", "options": ["go", "goes", "went", "going"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "yesterday = passé : went."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " a book right now. (suis en train de lire)", "correct_answers": ["am reading"], "feedback_correct": "Correct !", "feedback_incorrect": "am + reading."}'),
  (4, 'true_false', '{"statement": "Le niveau A1 couvre le présent, le passé simple, et les quantités de base.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai, c''est le cœur du niveau A1."}')
) as v(position, type, content);

