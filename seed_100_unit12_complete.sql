-- ============================================
-- LUMA — Unité 12 (A2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ visited Japan.", "options": ["have", "has", "had", "having"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", on utilise \"have\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She has ", "sentence_after": " (see) that movie three times.", "correct_answers": ["seen"], "feedback_correct": "Correct !", "feedback_incorrect": "Participe passé de \"see\" : \"seen\"."}'),
  (7, 'true_false', '{"statement": "The present perfect uses \"have/has\" + past participle.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien la structure du present perfect."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "never", "eaten", "sushi."], "correct_sentence": "I have never eaten sushi.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ to Rome last year. (date précise)", "options": ["have gone", "went", "have been", "go"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Date précise = past simple : \"went\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (visit) Rome, but I don''t remember when. (pas de date précise)", "correct_answers": ["have visited"], "feedback_correct": "Correct !", "feedback_incorrect": "Pas de date précise = present perfect."}'),
  (7, 'true_false', '{"statement": "The past simple is used with specific past time markers like \"yesterday\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — le past simple s''utilise bien avec des dates précises."}'),
  (8, 'matching', '{"instruction": "Relie l''usage au bon temps.", "pairs": [{"left": "Yesterday, I went...", "right": "past simple"}, {"left": "I have never been to...", "right": "present perfect"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I have lived here ___ 2015.", "options": ["for", "since", "during", "at"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Point de départ précis = \"since\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She has worked here ", "sentence_after": " five years. (durée)", "correct_answers": ["for"], "feedback_correct": "Correct !", "feedback_incorrect": "Durée = \"for\"."}'),
  (7, 'true_false', '{"statement": "\"Since\" is followed by a duration (like \"five years\").", "correct_answer": false, "feedback_correct": "Exact — \"since\" est suivi d''un point de départ, pas d''une durée.", "feedback_incorrect": "Faux — \"since\" est suivi d''un point de départ (2015, Monday...)."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "known", "her", "for", "years."], "correct_sentence": "I have known her for years.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : Have you ___ been to Canada?", "options": ["ever", "never", "already", "yet"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Dans une question : \"ever\" (déjà)."}'),
  (6, 'fill_blank', '{"sentence_before": "I have ", "sentence_after": " tried sushi before. (jamais)", "correct_answers": ["never"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Jamais\" = \"never\"."}'),
  (7, 'true_false', '{"statement": "\"Never\" is used in affirmative sentences with a negative meaning.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"never\" a bien un sens négatif dans une phrase affirmative."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Have", "you", "ever", "seen", "snow?"], "correct_sentence": "Have you ever seen snow?", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Already, yet, just', '{"rule": "Avec le present perfect, \"already\" (déjà, affirmatif) se place avant le participe, \"yet\" (encore/déjà) s''utilise en fin de phrase négative/interrogative, et \"just\" (juste/à l''instant) avant le participe.", "table": [{"subject": "already", "affirmative": "I have already eaten.", "negative": "—"}, {"subject": "yet", "affirmative": "—", "negative": "I haven''t eaten yet."}, {"subject": "just", "affirmative": "I have just arrived.", "negative": "—"}], "example": {"en": "I have already finished, but she hasn''t started yet.", "fr": "J''ai déjà fini, mais elle n''a pas encore commencé."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I have ___ finished my homework.", "options": ["already", "yet", "ago", "since"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Affirmatif = \"already\"."}'),
  (2, 'qcm', '{"question": "Complète : She hasn''t arrived ___.", "options": ["already", "yet", "just", "since"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Négatif, fin de phrase = \"yet\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I have ", "sentence_after": " finished, one minute ago. (à l''instant)", "correct_answers": ["just"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À l''instant\" = \"just\"."}'),
  (4, 'true_false', '{"statement": "\"Yet\" is usually placed at the end of the sentence.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"yet\" se place bien en fin de phrase."}'),
  (5, 'matching', '{"instruction": "Relie l''adverbe à son usage.", "pairs": [{"left": "already", "right": "affirmatif"}, {"left": "yet", "right": "négatif/question"}, {"left": "just", "right": "action très récente"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Have", "you", "finished", "yet?"], "correct_sentence": "Have you finished yet?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : We have ___ eaten, we''re full.", "options": ["already", "yet", "ago", "for"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Affirmatif = \"already\"."}'),
  (8, 'fill_blank', '{"sentence_before": "He has ", "sentence_after": " left the office, five minutes ago. (à l''instant)", "correct_answers": ["just"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À l''instant\" = \"just\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Parler de son parcours professionnel', '{"rule": "Le present perfect est idéal pour décrire un parcours professionnel (expériences accumulées jusqu''à maintenant).", "table": [{"subject": "have worked", "affirmative": "a travaillé", "negative": "—"}, {"subject": "have managed", "affirmative": "a géré", "negative": "—"}, {"subject": "have led", "affirmative": "a dirigé", "negative": "—"}], "example": {"en": "I have worked in marketing for five years and have managed several projects.", "fr": "J''ai travaillé dans le marketing pendant cinq ans et j''ai géré plusieurs projets."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ worked in three different companies.", "options": ["have", "has", "had", "having"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", on utilise \"have\"."}'),
  (2, 'qcm', '{"question": "Quel est le participe passé de \"lead\" ?", "options": ["leaded", "led", "leaded", "leading"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Lead\" est irrégulier : \"led\"."}'),
  (3, 'fill_blank', '{"sentence_before": "She has ", "sentence_after": " (manage) a team of ten people.", "correct_answers": ["managed"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Manage\" + ed = \"managed\"."}'),
  (4, 'true_false', '{"statement": "The present perfect is common in job interviews to describe experience.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien un usage très fréquent en entretien."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à son participe passé.", "pairs": [{"left": "build", "right": "built"}, {"left": "develop", "right": "developed"}, {"left": "achieve", "right": "achieved"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "developed", "many", "skills."], "correct_sentence": "I have developed many skills.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She ___ never worked abroad.", "options": ["have", "has", "had", "having"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on utilise \"has\"."}'),
  (8, 'fill_blank', '{"sentence_before": "We have ", "sentence_after": " (achieve) great results this year.", "correct_answers": ["achieved"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Achieve\" + ed = \"achieved\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'How long...? — parler de durée', '{"rule": "\"How long...?\" interroge sur une durée, et se répond typiquement avec \"for\" (durée) ou \"since\" (point de départ).", "table": [{"subject": "How long...?", "affirmative": "Depuis combien de temps... ?", "negative": "—"}], "example": {"en": "How long have you lived here? — For ten years. / Since 2014.", "fr": "Depuis combien de temps habites-tu ici ? — Depuis dix ans. / Depuis 2014."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"How long\" interroge sur :", "options": ["Un lieu", "Une durée", "Une raison", "Une personne"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"How long\" interroge sur la durée."}'),
  (2, 'qcm', '{"question": "Complète : ___ have you studied English?", "options": ["How long", "How much", "How many", "How often"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Durée = \"How long\"."}'),
  (3, 'fill_blank', '{"sentence_before": "How long have you known him? — ", "sentence_after": " three years.", "correct_answers": ["For"], "feedback_correct": "Correct !", "feedback_incorrect": "Réponse en durée : \"For three years\"."}'),
  (4, 'true_false', '{"statement": "\"How long have you...?\" is typically used with the present perfect.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — cette structure va bien avec le present perfect."}'),
  (5, 'matching', '{"instruction": "Relie la question à sa réponse logique.", "pairs": [{"left": "How long have you lived here?", "right": "For five years."}, {"left": "Since when?", "right": "Since 2018."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["How", "long", "have", "you", "worked", "here?"], "correct_sentence": "How long have you worked here?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Réponse logique à \"How long...?\" avec point de départ :", "options": ["For", "Since", "Ago", "At"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Point de départ = \"since\"."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " have you had this car? (depuis combien de temps)", "correct_answers": ["How long"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Depuis combien de temps\" = \"How long\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : present perfect complet', '{"rule": "Cette leçon combine tout le present perfect vu dans l''unité : formation, ever/never, already/yet/just, for/since, et son opposition au past simple.", "table": [{"subject": "Formation", "affirmative": "have/has + participe passé", "negative": "—"}, {"subject": "Expérience", "affirmative": "ever, never", "negative": "—"}, {"subject": "Récent", "affirmative": "already, just, yet", "negative": "—"}], "example": {"en": "I have already visited Rome twice, but I have never been to Venice. I went to Rome for the first time in 2019.", "fr": "J''ai déjà visité Rome deux fois, mais je ne suis jamais allé à Venise. Je suis allé à Rome pour la première fois en 2019."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 12 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ finished my project.", "options": ["have already", "already have", "have yet", "yet have"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Ordre correct : \"have already\"."}'),
  (2, 'qcm', '{"question": "Complète : She ___ to Japan in 2018. (date précise)", "options": ["has gone", "went", "has been", "goes"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Date précise = past simple : \"went\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I have lived here ", "sentence_after": " I was born. (point de départ)", "correct_answers": ["since"], "feedback_correct": "Correct !", "feedback_incorrect": "Point de départ = \"since\"."}'),
  (4, 'true_false', '{"statement": "\"I have seen that movie yesterday\" is correct.", "correct_answer": false, "feedback_correct": "Exact — avec \"yesterday\", il faut le past simple : \"I saw\".", "feedback_incorrect": "Faux — \"yesterday\" impose le past simple, pas le present perfect."}'),
  (5, 'matching', '{"instruction": "Bilan : relie la phrase à son temps correct.", "pairs": [{"left": "I have never been to India.", "right": "present perfect"}, {"left": "I went to India in 2020.", "right": "past simple"}], "feedback_correct": "Parfait, bilan present perfect réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "never", "tried", "sushi", "before."], "correct_sentence": "I have never tried sushi before.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Have you finished your homework ___?", "options": ["yet", "already", "since", "ago"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Question, fin de phrase = \"yet\"."}'),
  (8, 'fill_blank', '{"sentence_before": "We have lived here ", "sentence_after": " ten years. (durée)", "correct_answers": ["for"], "feedback_correct": "Correct !", "feedback_incorrect": "Durée = \"for\"."}')
) as v(position, type, content);
