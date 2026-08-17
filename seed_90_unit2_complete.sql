-- ============================================
-- LUMA — Unité 2 : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : They ___ football every Sunday.", "options": ["play", "plays", "playing", "played"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"they\", pas de -s : \"play\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " (work) in a hospital.", "correct_answers": ["works"], "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on ajoute -s : \"works\"."}'),
  (7, 'true_false', '{"statement": "\"He like pizza\" is correctly formed.", "correct_answer": false, "feedback_correct": "Exact — il faut \"likes\" avec he.", "feedback_incorrect": "Faux — il faut \"He likes pizza\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "watch", "TV", "every", "evening."], "correct_sentence": "We watch TV every evening.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She ___ like coffee.", "options": ["don''t", "doesn''t", "isn''t", "not"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on utilise \"doesn''t\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " understand this. (négation)", "correct_answers": ["don''t"], "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", on utilise \"don''t\"."}'),
  (7, 'true_false', '{"statement": "\"They doesn''t like it\" is correct.", "correct_answer": false, "feedback_correct": "Exact — il faut \"don''t\" avec they.", "feedback_incorrect": "Faux — c''est \"They don''t like it\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "doesn''t", "eat", "meat."], "correct_sentence": "He doesn''t eat meat.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ you speak English?", "options": ["Do", "Does", "Are", "Is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"you\", on utilise \"Do\"."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " he play tennis?", "correct_answers": ["Does"], "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"he\", on utilise \"Does\"."}'),
  (7, 'true_false', '{"statement": "\"Does they work here?\" is correct.", "correct_answer": false, "feedback_correct": "Exact — il faut \"Do they work here?\"", "feedback_incorrect": "Faux — avec \"they\" on utilise \"Do\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Do", "you", "like", "coffee?"], "correct_sentence": "Do you like coffee?", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Wake up\" veut dire :", "options": ["S''endormir", "Se réveiller", "Se laver", "Manger"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Wake up\" = se réveiller."}'),
  (6, 'fill_blank', '{"sentence_before": "I usually ", "sentence_after": " breakfast at 7am. (avoir/manger)", "correct_answers": ["have"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Have breakfast\" = prendre le petit-déjeuner."}'),
  (7, 'true_false', '{"statement": "\"Go to bed\" means going to sleep.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"go to bed\" veut bien dire aller se coucher."}'),
  (8, 'matching', '{"instruction": "Relie l''activité à sa traduction.", "pairs": [{"left": "brush teeth", "right": "se brosser les dents"}, {"left": "take a shower", "right": "prendre une douche"}, {"left": "get dressed", "right": "s''habiller"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Les adverbes de fréquence', '{"rule": "Les adverbes de fréquence (always, usually, often, sometimes, never) se placent avant le verbe principal, mais après \"to be\".", "table": [{"subject": "always", "affirmative": "toujours", "negative": "—"}, {"subject": "often", "affirmative": "souvent", "negative": "—"}, {"subject": "never", "affirmative": "jamais", "negative": "—"}], "example": {"en": "I always drink coffee in the morning.", "fr": "Je bois toujours du café le matin."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Où place-t-on \"always\" dans \"I always work\" ?", "options": ["Avant le sujet", "Après le verbe", "Avant le verbe principal", "En fin de phrase"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "L''adverbe se place avant le verbe principal."}'),
  (2, 'qcm', '{"question": "\"Never\" veut dire :", "options": ["Toujours", "Souvent", "Jamais", "Parfois"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Never\" = jamais."}'),
  (3, 'fill_blank', '{"sentence_before": "She is ", "sentence_after": " late. (souvent)", "correct_answers": ["often"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Souvent\" = \"often\"."}'),
  (4, 'true_false', '{"statement": "\"I am always tired\" places the adverb after \"to be\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — l''adverbe est bien après \"to be\" ici."}'),
  (5, 'matching', '{"instruction": "Relie l''adverbe à sa fréquence.", "pairs": [{"left": "always", "right": "100%"}, {"left": "sometimes", "right": "50%"}, {"left": "never", "right": "0%"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "usually", "walk", "to", "work."], "correct_sentence": "I usually walk to work.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She ___ eats meat. (jamais)", "options": ["always", "often", "never", "sometimes"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Jamais\" = \"never\"."}'),
  (8, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " go to the cinema. (parfois)", "correct_answers": ["sometimes"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Parfois\" = \"sometimes\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Les métiers et professions', '{"rule": "Pour parler de son métier, on utilise \"I am a/an + métier\". On utilise \"an\" devant une voyelle.", "table": [{"subject": "teacher", "affirmative": "professeur", "negative": "—"}, {"subject": "doctor", "affirmative": "médecin", "negative": "—"}, {"subject": "engineer", "affirmative": "ingénieur", "negative": "—"}], "example": {"en": "I am a teacher. She is an engineer.", "fr": "Je suis professeur. Elle est ingénieure."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : He is ___ doctor.", "options": ["a", "an", "the", "—"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Doctor\" commence par une voyelle : \"an doctor\"."}'),
  (2, 'qcm', '{"question": "\"Nurse\" veut dire :", "options": ["Docteur", "Infirmier/ère", "Professeur", "Avocat"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Nurse\" = infirmier/ère."}'),
  (3, 'fill_blank', '{"sentence_before": "She works as ", "sentence_after": " lawyer.", "correct_answers": ["a"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Lawyer\" commence par consonne : \"a lawyer\"."}'),
  (4, 'true_false', '{"statement": "\"Engineer\" starts with a vowel sound.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"engineer\" commence bien par un son voyelle."}'),
  (5, 'matching', '{"instruction": "Relie le métier à sa traduction.", "pairs": [{"left": "chef", "right": "cuisinier"}, {"left": "farmer", "right": "agriculteur"}, {"left": "driver", "right": "chauffeur"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["My", "father", "is", "an", "engineer."], "correct_sentence": "My father is an engineer.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Quelle question demande le métier de quelqu''un ?", "options": ["What''s your name?", "What''s your job?", "Where are you?", "How old are you?"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"What''s your job?\" demande la profession."}'),
  (8, 'fill_blank', '{"sentence_before": "I want to be ", "sentence_after": " artist.", "correct_answers": ["an"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Artist\" commence par voyelle : \"an artist\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Aimer et détester (like / love / hate)', '{"rule": "Pour exprimer ses goûts, on utilise like (aimer), love (adorer), hate (détester) suivis d''un nom ou d''un verbe en -ing.", "table": [{"subject": "love", "affirmative": "adorer", "negative": "—"}, {"subject": "like", "affirmative": "aimer", "negative": "—"}, {"subject": "hate", "affirmative": "détester", "negative": "—"}], "example": {"en": "I love swimming, but I hate running.", "fr": "J''adore nager, mais je déteste courir."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ cooking. (elle adore)", "options": ["love", "loves", "loving", "loved"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on ajoute -s : \"loves\"."}'),
  (2, 'qcm', '{"question": "\"Hate\" veut dire :", "options": ["Aimer", "Adorer", "Détester", "Préférer"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Hate\" = détester."}'),
  (3, 'fill_blank', '{"sentence_before": "I like ", "sentence_after": " (swim) in the sea.", "correct_answers": ["swimming"], "feedback_correct": "Correct !", "feedback_incorrect": "Après \"like\", le verbe prend -ing : \"swimming\"."}'),
  (4, 'true_false', '{"statement": "\"I like reading books\" is grammatically correct.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien correct."}'),
  (5, 'matching', '{"instruction": "Relie l''expression à son intensité.", "pairs": [{"left": "love", "right": "++"}, {"left": "like", "right": "+"}, {"left": "hate", "right": "--"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "love", "watching", "movies."], "correct_sentence": "We love watching movies.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : They ___ playing football.", "options": ["loves", "love", "loving", "to love"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"they\", pas de -s : \"love\"."}'),
  (8, 'fill_blank', '{"sentence_before": "He hates ", "sentence_after": " (wait) in line.", "correct_answers": ["waiting"], "feedback_correct": "Correct !", "feedback_incorrect": "Après \"hate\", le verbe prend -ing : \"waiting\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'La routine du week-end', '{"rule": "Le week-end (Saturday, Sunday) offre l''occasion de pratiquer le present simple sur des activités de loisirs plutôt que de travail.", "table": [{"subject": "relax", "affirmative": "se détendre", "negative": "—"}, {"subject": "sleep in", "affirmative": "faire la grasse matinée", "negative": "—"}, {"subject": "go out", "affirmative": "sortir", "negative": "—"}], "example": {"en": "On Saturdays, I sleep in and relax at home.", "fr": "Le samedi, je fais la grasse matinée et je me détends à la maison."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Sleep in\" veut dire :", "options": ["Se coucher tôt", "Faire la grasse matinée", "Ne pas dormir", "Faire une sieste"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Sleep in\" = faire la grasse matinée."}'),
  (2, 'qcm', '{"question": "Complète : On Sundays, we ___ (relax) at home.", "options": ["relax", "relaxs", "relaxes", "relaxing"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"we\", pas de -s : \"relax\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I like to ", "sentence_after": " with friends on weekends. (sortir)", "correct_answers": ["go out"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Sortir\" = \"go out\"."}'),
  (4, 'true_false', '{"statement": "\"Weekend\" refers to Saturday and Sunday.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — le week-end désigne bien samedi et dimanche."}'),
  (5, 'matching', '{"instruction": "Relie l''activité de loisir à sa traduction.", "pairs": [{"left": "go shopping", "right": "faire du shopping"}, {"left": "meet friends", "right": "voir des amis"}, {"left": "stay home", "right": "rester à la maison"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "sleep", "in", "on", "Sundays."], "correct_sentence": "I sleep in on Sundays.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Go out\" veut dire :", "options": ["Rester", "Sortir", "Dormir", "Manger"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Go out\" = sortir."}'),
  (8, 'fill_blank', '{"sentence_before": "On weekends, she ", "sentence_after": " (meet) her friends.", "correct_answers": ["meets"], "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on ajoute -s : \"meets\"."}')
) as v(position, type, content);
