-- ============================================
-- LUMA — Unité 1 (pilote) : 4 nouvelles leçons (positions 5 à 8)
-- ============================================


with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1
)
insert into lessons (unit_id, position, title, content)
select u.id, 5, 'Les couleurs et les nombres (1-20)', '{"rule": "Les couleurs et les nombres sont parmi les premiers mots à connaître pour décrire le monde qui t''entoure. Les nombres de 1 à 12 ont une forme unique, puis de 13 à 19 on ajoute \"-teen\", et les dizaines se terminent en \"-ty\".", "table": [{"subject": "1-5", "affirmative": "one, two, three, four, five", "negative": "—"}, {"subject": "6-10", "affirmative": "six, seven, eight, nine, ten", "negative": "—"}, {"subject": "13-19", "affirmative": "thirteen, fourteen... nineteen", "negative": "—"}, {"subject": "Couleurs", "affirmative": "red, blue, green, yellow, black, white", "negative": "—"}], "example": {"en": "I have three red apples and two blue pens.", "fr": "J''ai trois pommes rouges et deux stylos bleus."}}'::jsonb
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 5
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Comment dit-on \"15\" en anglais ?", "options": ["fivety", "fifteen", "fiveteen", "fifty"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "15 se dit \"fifteen\"."}'),
  (2, 'qcm', '{"question": "Quelle couleur est \"yellow\" ?", "options": ["Rouge", "Vert", "Jaune", "Noir"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Yellow\" veut dire jaune."}'),
  (3, 'fill_blank', '{"sentence_before": "My favorite color is ", "sentence_after": ". (vert)", "correct_answers": ["green"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Vert\" se dit \"green\"."}'),
  (4, 'true_false', '{"statement": "\"Twenty\" means 12.", "correct_answer": false, "feedback_correct": "Exact, \"twenty\" veut dire 20 !", "feedback_incorrect": "Faux — \"twenty\" veut dire 20, pas 12."}'),
  (5, 'matching', '{"instruction": "Relie le chiffre à son mot en anglais.", "pairs": [{"left": "7", "right": "seven"}, {"left": "12", "right": "twelve"}, {"left": "20", "right": "twenty"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "five", "black", "pens."], "correct_sentence": "I have five black pens.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She has ___ (2) cats.", "options": ["one", "two", "too", "second"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"2\" se dit \"two\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The sky is ", "sentence_after": ". (bleu)", "correct_answers": ["blue"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Bleu\" se dit \"blue\"."}')
) as v(position, type, content);


with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1
)
insert into lessons (unit_id, position, title, content)
select u.id, 6, 'Poser des questions simples (What/Where/Who)', '{"rule": "Les mots interrogatifs de base permettent de poser des questions essentielles. \"What\" (quoi/quel), \"Where\" (où), \"Who\" (qui) sont suivis de l''auxiliaire (is/are/do) puis du sujet.", "table": [{"subject": "What", "affirmative": "What is this? (Qu''est-ce que c''est ?)", "negative": "—"}, {"subject": "Where", "affirmative": "Where are you? (Où es-tu ?)", "negative": "—"}, {"subject": "Who", "affirmative": "Who is she? (Qui est-elle ?)", "negative": "—"}], "example": {"en": "What is your name? Where do you live?", "fr": "Comment t''appelles-tu ? Où habites-tu ?"}}'::jsonb
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 6
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ is that man?", "options": ["What", "Where", "Who", "When"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Who\" interroge sur l''identité d''une personne."}'),
  (2, 'qcm', '{"question": "Complète : ___ is my phone?", "options": ["What", "Where", "Who", "Why"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Where\" interroge sur le lieu."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " is this? (Qu''est-ce que c''est ?)", "correct_answers": ["What"], "feedback_correct": "Correct !", "feedback_incorrect": "\"What\" s''utilise pour demander \"quoi\"."}'),
  (4, 'true_false', '{"statement": "\"Who\" is used to ask about a person.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"who\" sert bien à demander qui est quelqu''un."}'),
  (5, 'matching', '{"instruction": "Relie la question au mot interrogatif manquant.", "pairs": [{"left": "___ do you live?", "right": "Where"}, {"left": "___ is your teacher?", "right": "Who"}, {"left": "___ is this?", "right": "What"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Where", "is", "the", "station?"], "correct_sentence": "Where is the station?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Quelle est la bonne réponse à \"Who is she?\"", "options": ["She is my sister.", "She is in Paris.", "She is a book.", "She is Monday."], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Who\" attend une personne comme réponse."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " are you from? (D''où viens-tu ?)", "correct_answers": ["Where"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Where are you from\" = D''où viens-tu."}')
) as v(position, type, content);


with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1
)
insert into lessons (unit_id, position, title, content)
select u.id, 7, 'Les objets du quotidien', '{"rule": "Connaître le nom des objets courants (sac, téléphone, clés...) permet de construire des phrases simples dès le début de ton apprentissage.", "table": [{"subject": "phone", "affirmative": "téléphone", "negative": "—"}, {"subject": "bag", "affirmative": "sac", "negative": "—"}, {"subject": "keys", "affirmative": "clés", "negative": "—"}, {"subject": "watch", "affirmative": "montre", "negative": "—"}], "example": {"en": "My phone and my keys are in my bag.", "fr": "Mon téléphone et mes clés sont dans mon sac."}}'::jsonb
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 7
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Comment dit-on \"clés\" en anglais ?", "options": ["keys", "key", "clefs", "locks"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Clés\" (au pluriel) se dit \"keys\"."}'),
  (2, 'qcm', '{"question": "Que signifie \"watch\" dans ce contexte ?", "options": ["Regarder", "Montre", "Voiture", "Sac"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Watch\" veut aussi dire \"montre\" (l''objet)."}'),
  (3, 'fill_blank', '{"sentence_before": "I can''t find my ", "sentence_after": ". (téléphone)", "correct_answers": ["phone"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Téléphone\" se dit \"phone\"."}'),
  (4, 'true_false', '{"statement": "\"Bag\" means \"sac\" in French.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"bag\" veut bien dire \"sac\"."}'),
  (5, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "wallet", "right": "portefeuille"}, {"left": "umbrella", "right": "parapluie"}, {"left": "glasses", "right": "lunettes"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["My", "keys", "are", "in", "my", "bag."], "correct_sentence": "My keys are in my bag.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Umbrella\" se traduit par :", "options": ["Chapeau", "Parapluie", "Sac", "Montre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Umbrella\" veut dire \"parapluie\"."}'),
  (8, 'fill_blank', '{"sentence_before": "Where are my ", "sentence_after": "? (lunettes)", "correct_answers": ["glasses"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Lunettes\" se dit \"glasses\"."}')
) as v(position, type, content);


with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1
)
insert into lessons (unit_id, position, title, content)
select u.id, 8, 'Les jours de la semaine et les mois', '{"rule": "Les jours de la semaine et les mois de l''année s''écrivent toujours avec une majuscule en anglais, contrairement au français.", "table": [{"subject": "Lundi-Dimanche", "affirmative": "Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday", "negative": "—"}, {"subject": "Ex. mois", "affirmative": "January, February, March...", "negative": "—"}, {"subject": "Règle", "affirmative": "Toujours une majuscule", "negative": "jamais en minuscule"}], "example": {"en": "My birthday is in April, on a Friday this year.", "fr": "Mon anniversaire est en avril, un vendredi cette année."}}'::jsonb
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 8
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel jour vient après \"Monday\" ?", "options": ["Sunday", "Wednesday", "Tuesday", "Friday"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Tuesday\" (mardi) vient après \"Monday\" (lundi)."}'),
  (2, 'qcm', '{"question": "Comment écrit-on les jours en anglais ?", "options": ["toujours en minuscule", "toujours avec une majuscule", "en majuscules entières", "ça dépend"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Les jours prennent toujours une majuscule en anglais."}'),
  (3, 'fill_blank', '{"sentence_before": "Christmas is in ", "sentence_after": ". (décembre)", "correct_answers": ["December"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Décembre\" se dit \"December\" (avec majuscule)."}'),
  (4, 'true_false', '{"statement": "\"Sunday\" is a weekend day.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"Sunday\" (dimanche) fait bien partie du week-end."}'),
  (5, 'matching', '{"instruction": "Relie le jour français à sa traduction.", "pairs": [{"left": "Mercredi", "right": "Wednesday"}, {"left": "Samedi", "right": "Saturday"}, {"left": "Jeudi", "right": "Thursday"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["My", "birthday", "is", "in", "June."], "correct_sentence": "My birthday is in June.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Quel est le premier mois de l''année ?", "options": ["December", "March", "January", "April"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"January\" (janvier) est le premier mois."}'),
  (8, 'fill_blank', '{"sentence_before": "Today is ", "sentence_after": ". (vendredi)", "correct_answers": ["Friday"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Vendredi\" se dit \"Friday\"."}')
) as v(position, type, content);
