-- ============================================
-- LUMA — Unité 7 : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel est le passé de \"go\" ?", "options": ["goed", "went", "gone", "going"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Go\" est irrégulier : \"went\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (see) a great movie yesterday.", "correct_answers": ["saw"], "feedback_correct": "Correct !", "feedback_incorrect": "\"See\" au passé : \"saw\"."}'),
  (7, 'true_false', '{"statement": "The past of \"eat\" is \"eated\".", "correct_answer": false, "feedback_correct": "Exact — c''est \"ate\".", "feedback_incorrect": "Faux — le passé de \"eat\" est \"ate\", pas \"eated\"."}'),
  (8, 'matching', '{"instruction": "Relie le verbe à son passé.", "pairs": [{"left": "come", "right": "came"}, {"left": "give", "right": "gave"}, {"left": "take", "right": "took"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel est le passé de \"buy\" ?", "options": ["buyed", "bought", "buys", "buying"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Buy\" est irrégulier : \"bought\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " (think) about it all day.", "correct_answers": ["thought"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Think\" au passé : \"thought\"."}'),
  (7, 'true_false', '{"statement": "The past of \"write\" is \"wrote\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"write\" au passé donne bien \"wrote\"."}'),
  (8, 'matching', '{"instruction": "Relie le verbe à son passé.", "pairs": [{"left": "find", "right": "found"}, {"left": "make", "right": "made"}, {"left": "know", "right": "knew"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ you go to the party?", "options": ["Did", "Do", "Went", "Does"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Question au passé : \"Did\", suivi de la base \"go\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " not see him yesterday.", "correct_answers": ["did"], "feedback_correct": "Correct !", "feedback_incorrect": "Négation au passé : \"did not\" + base verbale."}'),
  (7, 'true_false', '{"statement": "\"Did you went there?\" is correct.", "correct_answer": false, "feedback_correct": "Exact — après \"did\", on utilise la base : \"Did you go?\"", "feedback_incorrect": "Faux — c''est \"Did you go?\", pas \"went\" après did."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Did", "she", "take", "the", "bus?"], "correct_sentence": "Did she take the bus?", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète le souvenir : When I was a child, I ___ (have) a dog.", "options": ["have", "had", "haved", "has"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Have\" au passé : \"had\"."}'),
  (6, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " (meet) at university years ago.", "correct_answers": ["met"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Meet\" au passé : \"met\"."}'),
  (7, 'true_false', '{"statement": "\"I felt happy that day\" uses an irregular past verb.", "correct_answer": true, "feedback_correct": "Exact — \"felt\" est le passé irrégulier de \"feel\".", "feedback_incorrect": "Faux — \"felt\" est bien un verbe irrégulier."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "found", "an", "old", "photo", "yesterday."], "correct_sentence": "I found an old photo yesterday.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Verbes irréguliers courants (3)', '{"rule": "Une troisième série de verbes irréguliers fréquents à mémoriser : say/said, tell/told, get/got, leave/left, feel/felt.", "table": [{"subject": "say", "affirmative": "said", "negative": "—"}, {"subject": "get", "affirmative": "got", "negative": "—"}, {"subject": "leave", "affirmative": "left", "negative": "—"}], "example": {"en": "She said hello and left the room.", "fr": "Elle a dit bonjour et a quitté la pièce."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le passé de \"say\" ?", "options": ["sayed", "said", "says", "saying"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Say\" au passé : \"said\"."}'),
  (2, 'qcm', '{"question": "Quel est le passé de \"get\" ?", "options": ["getted", "got", "gets", "getting"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Get\" au passé : \"got\"."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " (leave) early yesterday.", "correct_answers": ["left"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Leave\" au passé : \"left\"."}'),
  (4, 'true_false', '{"statement": "The past of \"tell\" is \"telled\".", "correct_answer": false, "feedback_correct": "Exact — c''est \"told\".", "feedback_incorrect": "Faux — c''est \"told\", pas \"telled\"."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à son passé.", "pairs": [{"left": "tell", "right": "told"}, {"left": "feel", "right": "felt"}, {"left": "say", "right": "said"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "told", "me", "the", "truth."], "correct_sentence": "She told me the truth.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Quel est le passé de \"feel\" ?", "options": ["feeled", "felt", "feels", "feeling"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Feel\" au passé : \"felt\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " goodbye to my friends. (ai dit)", "correct_answers": ["said"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Ai dit\" = \"said\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Verbes irréguliers courants (4)', '{"rule": "Une quatrième série utile : put/put (invariable), read/read (même orthographe, prononciation différente), run/ran, sit/sat.", "table": [{"subject": "put", "affirmative": "put (identique)", "negative": "—"}, {"subject": "run", "affirmative": "ran", "negative": "—"}, {"subject": "sit", "affirmative": "sat", "negative": "—"}], "example": {"en": "I put my keys on the table and sat down.", "fr": "J''ai posé mes clés sur la table et je me suis assis."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le passé de \"put\" ?", "options": ["putted", "put", "puts", "putting"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Put\" ne change pas au passé."}'),
  (2, 'qcm', '{"question": "Quel est le passé de \"run\" ?", "options": ["runned", "ran", "runs", "running"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Run\" au passé : \"ran\"."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " (sit) next to me.", "correct_answers": ["sat"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Sit\" au passé : \"sat\"."}'),
  (4, 'true_false', '{"statement": "\"Read\" is spelled the same way in present and past.", "correct_answer": true, "feedback_correct": "Exact, seule la prononciation change !", "feedback_incorrect": "Faux — l''orthographe est bien identique."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à son passé.", "pairs": [{"left": "put", "right": "put"}, {"left": "run", "right": "ran"}, {"left": "sit", "right": "sat"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "ran", "to", "catch", "the", "bus."], "correct_sentence": "I ran to catch the bus.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She ___ the book on the shelf.", "options": ["putted", "put", "puts", "putting"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Put\" reste \"put\" au passé."}'),
  (8, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " (read) that book last year.", "correct_answers": ["read"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Read\" au passé garde la même orthographe."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Décrire une expérience passée', '{"rule": "Pour décrire une expérience, on combine souvent past simple + adjectifs de ressenti (amazing, boring, difficult).", "table": [{"subject": "amazing", "affirmative": "incroyable", "negative": "—"}, {"subject": "boring", "affirmative": "ennuyeux", "negative": "—"}, {"subject": "difficult", "affirmative": "difficile", "negative": "—"}], "example": {"en": "The concert was amazing, but the trip there was boring.", "fr": "Le concert était incroyable, mais le trajet était ennuyeux."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Boring\" veut dire :", "options": ["Intéressant", "Ennuyeux", "Difficile", "Facile"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Boring\" = ennuyeux."}'),
  (2, 'qcm', '{"question": "\"Amazing\" veut dire :", "options": ["Terrible", "Incroyable", "Normal", "Triste"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Amazing\" = incroyable."}'),
  (3, 'fill_blank', '{"sentence_before": "The exam was very ", "sentence_after": ". (difficile)", "correct_answers": ["difficult"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Difficile\" = \"difficult\"."}'),
  (4, 'true_false', '{"statement": "\"Exciting\" is a positive adjective.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"exciting\" est bien positif (passionnant)."}'),
  (5, 'matching', '{"instruction": "Relie l''adjectif à sa traduction.", "pairs": [{"left": "exciting", "right": "passionnant"}, {"left": "tiring", "right": "fatigant"}, {"left": "relaxing", "right": "relaxant"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "movie", "was", "really", "boring."], "correct_sentence": "The movie was really boring.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Tiring\" veut dire :", "options": ["Reposant", "Fatigant", "Amusant", "Court"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Tiring\" = fatigant."}'),
  (8, 'fill_blank', '{"sentence_before": "The trip was ", "sentence_after": ". (incroyable)", "correct_answers": ["amazing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Incroyable\" = \"amazing\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Le récit complet : premier jour au travail/à l''école', '{"rule": "Cette leçon combine tout le passé vu jusqu''ici (to be, réguliers, irréguliers) pour raconter une journée mémorable du début à la fin.", "table": [{"subject": "woke up", "affirmative": "s''est réveillé", "negative": "—"}, {"subject": "arrived", "affirmative": "est arrivé", "negative": "—"}, {"subject": "met", "affirmative": "a rencontré", "negative": "—"}], "example": {"en": "I woke up early, got dressed, and arrived at 9am. I met my new colleagues.", "fr": "Je me suis réveillé tôt, je me suis habillé, et je suis arrivé à 9h. J''ai rencontré mes nouveaux collègues."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le passé de \"wake up\" ?", "options": ["waked up", "woke up", "wakes up", "waking up"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Wake up\" est irrégulier : \"woke up\"."}'),
  (2, 'qcm', '{"question": "Complète : I ___ nervous on my first day.", "options": ["was", "were", "is", "am"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", on utilise \"was\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (arrive) at 9am sharp.", "correct_answers": ["arrived"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Arrive\" + d = \"arrived\"."}'),
  (4, 'true_false', '{"statement": "\"I met my new colleagues\" uses the past of \"meet\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"met\" est bien le passé de \"meet\"."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à son passé.", "pairs": [{"left": "wake up", "right": "woke up"}, {"left": "arrive", "right": "arrived"}, {"left": "meet", "right": "met"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "was", "very", "nervous", "that", "day."], "correct_sentence": "I was very nervous that day.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : It ___ a great first day.", "options": ["was", "were", "is", "be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"it\", on utilise \"was\"."}'),
  (8, 'fill_blank', '{"sentence_before": "Everyone ", "sentence_after": " (be) very friendly.", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Everyone\" est singulier : \"was\"."}')
) as v(position, type, content);
