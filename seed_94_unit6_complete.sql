-- ============================================
-- LUMA — Unité 6 : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel est le passé de \"walk\" ?", "options": ["walk", "walked", "walking", "walks"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Verbe régulier + ed : \"walked\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (watch) TV last night.", "correct_answers": ["watched"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Watch\" + ed = \"watched\"."}'),
  (7, 'true_false', '{"statement": "\"Study\" becomes \"studyed\" in the past.", "correct_answer": false, "feedback_correct": "Exact — c''est \"studied\" (y → ied).", "feedback_incorrect": "Faux — c''est \"studied\", le y devient \"ied\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "cooked", "dinner", "yesterday."], "correct_sentence": "She cooked dinner yesterday.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ watch TV yesterday.", "options": ["don''t", "didn''t", "not", "no"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Négation au passé : \"didn''t\"."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " you call me yesterday?", "correct_answers": ["Did"], "feedback_correct": "Correct !", "feedback_incorrect": "Question au passé : \"Did\"."}'),
  (7, 'true_false', '{"statement": "After \"didn''t\", the verb stays in the past form.", "correct_answer": false, "feedback_correct": "Exact — après \"didn''t\", le verbe reste à la base.", "feedback_incorrect": "Faux — après \"didn''t\", on utilise la base verbale."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Did", "she", "finish", "her", "homework?"], "correct_sentence": "Did she finish her homework?", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Last week\" veut dire :", "options": ["La semaine prochaine", "La semaine dernière", "Cette semaine", "Chaque semaine"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Last week\" = la semaine dernière."}'),
  (6, 'fill_blank', '{"sentence_before": "I saw her two days ", "sentence_after": ". (il y a)", "correct_answers": ["ago"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Il y a\" = \"ago\"."}'),
  (7, 'true_false', '{"statement": "\"Yesterday\" refers to the day before today.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"yesterday\" veut bien dire hier."}'),
  (8, 'matching', '{"instruction": "Relie l''expression de temps à sa traduction.", "pairs": [{"left": "last year", "right": "l''année dernière"}, {"left": "in 2020", "right": "en 2020"}, {"left": "two hours ago", "right": "il y a deux heures"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète le récit : First, I woke up. Then, I ___ breakfast.", "options": ["have", "had", "having", "has"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Récit au passé : \"had\" (irrégulier de have)."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": ", we went to the beach. (finalement)", "correct_answers": ["Finally"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Finalement\" = \"Finally\"."}'),
  (7, 'true_false', '{"statement": "\"After that\" is used to sequence events in a story.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"after that\" sert bien à ordonner un récit."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["First,", "we", "arrived", "at", "the", "hotel."], "correct_sentence": "First, we arrived at the hotel.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Le passé du verbe to be (was / were)', '{"rule": "Le verbe \"to be\" au passé devient \"was\" (I/he/she/it) et \"were\" (you/we/they).", "table": [{"subject": "I / He / She / It", "affirmative": "was", "negative": "wasn''t"}, {"subject": "You / We / They", "affirmative": "were", "negative": "weren''t"}], "example": {"en": "I was tired yesterday. They were happy.", "fr": "J''étais fatigué hier. Ils étaient heureux."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ at home yesterday.", "options": ["was", "were", "is", "be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on utilise \"was\"."}'),
  (2, 'qcm', '{"question": "Complète : They ___ at the party.", "options": ["was", "were", "is", "be"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"they\", on utilise \"were\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " not ready. (past, négatif)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "\"I was not\" (wasn''t)."}'),
  (4, 'true_false', '{"statement": "\"We was happy\" is correct.", "correct_answer": false, "feedback_correct": "Exact — il faut \"We were happy\".", "feedback_incorrect": "Faux — avec \"we\" c''est \"were\", pas \"was\"."}'),
  (5, 'matching', '{"instruction": "Relie le sujet à sa forme passée de to be.", "pairs": [{"left": "He", "right": "was"}, {"left": "You", "right": "were"}, {"left": "It", "right": "was"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "weather", "was", "nice", "yesterday."], "correct_sentence": "The weather was nice yesterday.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Where ___ you last night?", "options": ["was", "were", "is", "are"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"you\", on utilise \"were\"."}'),
  (8, 'fill_blank', '{"sentence_before": "They ", "sentence_after": " not at school. (négatif, passé)", "correct_answers": ["were"], "feedback_correct": "Correct !", "feedback_incorrect": "\"They were not\" (weren''t)."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Could : pouvoir au passé', '{"rule": "\"Could\" est la forme passée de \"can\" pour exprimer une capacité passée. Il ne change jamais de forme, quel que soit le sujet.", "table": [{"subject": "I/You/He...", "affirmative": "could", "negative": "couldn''t"}], "example": {"en": "When I was young, I could run very fast.", "fr": "Quand j''étais jeune, je pouvais courir très vite."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ swim when she was five.", "options": ["can", "could", "cans", "could to"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Capacité passée : \"could\"."}'),
  (2, 'qcm', '{"question": "\"Couldn''t\" est la contraction de :", "options": ["could not", "could no", "can not", "cannot"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Couldn''t\" = \"could not\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " not speak English last year.", "correct_answers": ["could"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Could not\" exprime l''incapacité passée."}'),
  (4, 'true_false', '{"statement": "\"Could\" changes form with \"he\" (he coulds).", "correct_answer": false, "feedback_correct": "Exact — \"could\" ne change jamais.", "feedback_incorrect": "Faux — \"could\" reste identique avec tous les sujets."}'),
  (5, 'matching', '{"instruction": "Relie can et could à leur temps.", "pairs": [{"left": "can", "right": "présent"}, {"left": "could", "right": "passé"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "could", "not", "come", "yesterday."], "correct_sentence": "He could not come yesterday.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : ___ you read at age four?", "options": ["Could", "Can", "Do", "Did"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Question sur une capacité passée : \"Could\"."}'),
  (8, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " see the mountains from our window. (pouvions)", "correct_answers": ["could"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Pouvions\" = \"could\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Le corps et la santé (vocabulaire au passé)', '{"rule": "Pour raconter une maladie ou un accident passé, on combine le vocabulaire de la santé avec le past simple.", "table": [{"subject": "was sick", "affirmative": "était malade", "negative": "—"}, {"subject": "had a headache", "affirmative": "avait mal à la tête", "negative": "—"}, {"subject": "felt better", "affirmative": "se sentait mieux", "negative": "—"}], "example": {"en": "I was sick last week, but I feel better now.", "fr": "J''étais malade la semaine dernière, mais je me sens mieux maintenant."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I had a headache\" veut dire :", "options": ["J''avais faim", "J''avais mal à la tête", "J''étais fatigué", "J''avais soif"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Headache\" = mal de tête."}'),
  (2, 'qcm', '{"question": "Quel est le passé de \"feel\" ?", "options": ["feeled", "felt", "feels", "feeling"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Feel\" est irrégulier : \"felt\"."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " sick yesterday. (était)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Était\" (malade) = \"was\"."}'),
  (4, 'true_false', '{"statement": "\"I felt better\" is in the past tense.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"felt\" est bien le passé de \"feel\"."}'),
  (5, 'matching', '{"instruction": "Relie le symptôme à sa traduction.", "pairs": [{"left": "fever", "right": "fièvre"}, {"left": "cough", "right": "toux"}, {"left": "sore throat", "right": "mal de gorge"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "had", "a", "fever", "last", "night."], "correct_sentence": "I had a fever last night.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Sore throat\" veut dire :", "options": ["Mal de tête", "Mal de gorge", "Mal au ventre", "Mal au dos"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Sore throat\" = mal de gorge."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " a fever last week. (avais)", "correct_answers": ["had"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Avais\" = \"had\" (passé de have)."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Raconter ses dernières vacances', '{"rule": "Combiner le past simple avec du vocabulaire de voyage permet de raconter ses vacances de façon naturelle.", "table": [{"subject": "visited", "affirmative": "a visité", "negative": "—"}, {"subject": "stayed", "affirmative": "est resté(e)", "negative": "—"}, {"subject": "enjoyed", "affirmative": "a apprécié", "negative": "—"}], "example": {"en": "Last summer, I visited Italy and stayed in a small hotel.", "fr": "L''été dernier, j''ai visité l''Italie et je suis resté dans un petit hôtel."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le passé de \"visit\" ?", "options": ["visitted", "visited", "visits", "visiting"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Verbe régulier : \"visited\"."}'),
  (2, 'qcm', '{"question": "\"Enjoy\" au passé donne :", "options": ["enjoied", "enjoyed", "enjoys", "enjoy"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Enjoy\" + ed = \"enjoyed\" (y précédé de voyelle)."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " in a hotel near the beach. (sommes restés)", "correct_answers": ["stayed"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Stay\" + ed = \"stayed\"."}'),
  (4, 'true_false', '{"statement": "\"Last summer\" is a past time marker.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"last summer\" indique bien le passé."}'),
  (5, 'matching', '{"instruction": "Relie le mot de voyage à sa traduction.", "pairs": [{"left": "trip", "right": "voyage"}, {"left": "souvenir", "right": "souvenir (objet)"}, {"left": "postcard", "right": "carte postale"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "visited", "Rome", "last", "summer."], "correct_sentence": "I visited Rome last summer.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Trip\" veut dire :", "options": ["Voyage", "Valise", "Billet", "Hôtel"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Trip\" = voyage."}'),
  (8, 'fill_blank', '{"sentence_before": "We really ", "sentence_after": " our holiday. (avons apprécié)", "correct_answers": ["enjoyed"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Avons apprécié\" = \"enjoyed\"."}')
) as v(position, type, content);
