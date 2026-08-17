-- ============================================
-- LUMA — Unité 5 : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She ___ eating breakfast.", "options": ["is", "are", "am", "be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on utilise \"is\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I am ", "sentence_after": " (read) a book right now.", "correct_answers": ["reading"], "feedback_correct": "Correct !", "feedback_incorrect": "Le verbe prend -ing : \"reading\"."}'),
  (7, 'true_false', '{"statement": "\"Run\" becomes \"runing\" in the -ing form.", "correct_answer": false, "feedback_correct": "Exact — c''est \"running\" (double n).", "feedback_incorrect": "Faux — c''est \"running\" avec un n doublé."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["They", "are", "watching", "a", "movie."], "correct_sentence": "They are watching a movie.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ coffee every morning. (habitude)", "options": ["drink", "am drinking", "drinks", "drank"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Habitude = present simple."}'),
  (6, 'fill_blank', '{"sentence_before": "Look! She ", "sentence_after": " (dance) right now.", "correct_answers": ["is dancing"], "feedback_correct": "Correct !", "feedback_incorrect": "Action en cours = present continuous."}'),
  (7, 'true_false', '{"statement": "\"I am living in Paris\" and \"I live in Paris\" always mean exactly the same.", "correct_answer": false, "feedback_correct": "Exact — l''un peut suggérer temporaire, l''autre permanent.", "feedback_incorrect": "Faux — la nuance temporaire/permanent diffère."}'),
  (8, 'matching', '{"instruction": "Relie la phrase au bon temps.", "pairs": [{"left": "Every day, I work.", "right": "present simple"}, {"left": "Right now, I am working.", "right": "present continuous"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Hobby\" veut dire :", "options": ["Travail", "Passe-temps", "Sport", "École"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Hobby\" = passe-temps."}'),
  (6, 'fill_blank', '{"sentence_before": "My favorite hobby is ", "sentence_after": ". (peindre)", "correct_answers": ["painting"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Peindre\" = \"painting\"."}'),
  (7, 'true_false', '{"statement": "\"Play the guitar\" needs \"the\" before the instrument.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — on dit bien \"play THE guitar\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "enjoy", "playing", "video", "games."], "correct_sentence": "I enjoy playing video games.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ meeting friends tomorrow. (projet organisé)", "options": ["am", "will", "do", "have"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Projet déjà organisé = present continuous."}'),
  (6, 'fill_blank', '{"sentence_before": "We are ", "sentence_after": " (travel) to Rome next week.", "correct_answers": ["traveling", "travelling"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Travel\" + ing = \"traveling\"."}'),
  (7, 'true_false', '{"statement": "The present continuous can express a planned future action.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien un usage courant du present continuous."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "is", "starting", "a", "new", "job", "Monday."], "correct_sentence": "She is starting a new job Monday.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Les verbes d''état (stative verbs)', '{"rule": "Certains verbes (know, like, want, believe, understand) expriment un état mental et ne s''utilisent normalement PAS au present continuous, même pour une action actuelle.", "table": [{"subject": "know", "affirmative": "savoir/connaître", "negative": "pas de -ing"}, {"subject": "want", "affirmative": "vouloir", "negative": "pas de -ing"}, {"subject": "believe", "affirmative": "croire", "negative": "pas de -ing"}], "example": {"en": "I know the answer. (not: I am knowing)", "fr": "Je connais la réponse."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Laquelle est correcte ?", "options": ["I am knowing him.", "I know him.", "I knowing him.", "I am know him."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Know\" ne prend jamais -ing."}'),
  (2, 'qcm', '{"question": "\"Want\" est un verbe :", "options": ["D''action", "D''état", "Irrégulier seulement", "Modal"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Want\" est un verbe d''état."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " this song. (aimer, present simple)", "correct_answers": ["like"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Like\" reste au present simple même pour maintenant."}'),
  (4, 'true_false', '{"statement": "\"I am understanding\" is correct English.", "correct_answer": false, "feedback_correct": "Exact — on dit \"I understand\".", "feedback_incorrect": "Faux — \"understand\" ne prend pas -ing."}'),
  (5, 'matching', '{"instruction": "Classe : verbe d''état ou verbe d''action ?", "pairs": [{"left": "run", "right": "action"}, {"left": "believe", "right": "état"}, {"left": "eat", "right": "action"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "understand", "the", "lesson", "now."], "correct_sentence": "I understand the lesson now.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Laquelle est INCORRECTE ?", "options": ["I believe you.", "I am believing you.", "I know the truth.", "I want a coffee."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Believe\" ne prend pas -ing."}'),
  (8, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " what you mean. (comprend, present simple)", "correct_answers": ["understands"], "feedback_correct": "Correct !", "feedback_incorrect": "Verbe d''état au present simple : \"understands\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Le temps qu''il fait (la météo)', '{"rule": "On utilise \"it is\" pour parler de la météo, car il n''y a pas de sujet réel — \"it\" est impersonnel.", "table": [{"subject": "sunny", "affirmative": "ensoleillé", "negative": "—"}, {"subject": "rainy", "affirmative": "pluvieux", "negative": "—"}, {"subject": "cold", "affirmative": "froid", "negative": "—"}], "example": {"en": "It is sunny today, but it was rainy yesterday.", "fr": "Il fait beau aujourd''hui, mais il pleuvait hier."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Comment demande-t-on la météo ?", "options": ["What''s the weather like?", "What''s the time?", "What''s the date?", "How are you?"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"What''s the weather like?\" demande la météo."}'),
  (2, 'qcm', '{"question": "\"Windy\" veut dire :", "options": ["Ensoleillé", "Venteux", "Neigeux", "Nuageux"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Windy\" = venteux."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " is snowing outside.", "correct_answers": ["It"], "feedback_correct": "Correct !", "feedback_incorrect": "Sujet impersonnel : \"It is snowing\"."}'),
  (4, 'true_false', '{"statement": "\"Cloudy\" means the sky is clear.", "correct_answer": false, "feedback_correct": "Exact — \"cloudy\" veut dire nuageux, pas dégagé.", "feedback_incorrect": "Faux — \"cloudy\" veut dire nuageux."}'),
  (5, 'matching', '{"instruction": "Relie le mot météo à sa traduction.", "pairs": [{"left": "foggy", "right": "brumeux"}, {"left": "stormy", "right": "orageux"}, {"left": "hot", "right": "chaud"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "is", "very", "cold", "today."], "correct_sentence": "It is very cold today.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Rainy\" veut dire :", "options": ["Ensoleillé", "Pluvieux", "Froid", "Chaud"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Rainy\" = pluvieux."}'),
  (8, 'fill_blank', '{"sentence_before": "It''s ", "sentence_after": " outside, take an umbrella. (pluvieux)", "correct_answers": ["rainy"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Pluvieux\" = \"rainy\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Les moyens de transport', '{"rule": "On utilise \"by\" + moyen de transport pour dire comment on se déplace, sauf pour \"on foot\" (à pied).", "table": [{"subject": "by car", "affirmative": "en voiture", "negative": "—"}, {"subject": "by bus", "affirmative": "en bus", "negative": "—"}, {"subject": "on foot", "affirmative": "à pied", "negative": "—"}], "example": {"en": "I go to work by bus, but I go home on foot.", "fr": "Je vais au travail en bus, mais je rentre à pied."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Comment dit-on \"à pied\" en anglais ?", "options": ["by foot", "on foot", "with foot", "in foot"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"À pied\" = \"on foot\" (exception à \"by\")."}'),
  (2, 'qcm', '{"question": "\"By train\" veut dire :", "options": ["En bus", "En train", "En voiture", "À vélo"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"By train\" = en train."}'),
  (3, 'fill_blank', '{"sentence_before": "She goes to school ", "sentence_after": " bike. (à vélo)", "correct_answers": ["by"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À vélo\" = \"by bike\"."}'),
  (4, 'true_false', '{"statement": "\"By plane\" means traveling by airplane.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"by plane\" veut bien dire en avion."}'),
  (5, 'matching', '{"instruction": "Relie le moyen de transport à sa traduction.", "pairs": [{"left": "subway", "right": "métro"}, {"left": "boat", "right": "bateau"}, {"left": "taxi", "right": "taxi"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "traveled", "by", "train", "to", "London."], "correct_sentence": "We traveled by train to London.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"On foot\" veut dire :", "options": ["En voiture", "À pied", "En bus", "En avion"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"On foot\" = à pied."}'),
  (8, 'fill_blank', '{"sentence_before": "I prefer traveling ", "sentence_after": " car. (en voiture)", "correct_answers": ["by"], "feedback_correct": "Correct !", "feedback_incorrect": "\"En voiture\" = \"by car\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Inviter et proposer (let''s / shall we)', '{"rule": "\"Let''s\" (let us) + verbe de base sert à proposer une activité. \"Shall we?\" en fin de phrase propose aussi une suggestion, de façon plus polie.", "table": [{"subject": "Let''s + verbe", "affirmative": "Let''s go!", "negative": "—"}, {"subject": "Shall we...?", "affirmative": "Shall we go?", "negative": "—"}], "example": {"en": "Let''s watch a movie tonight, shall we?", "fr": "Regardons un film ce soir, tu veux bien ?"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ go to the beach!", "options": ["Let''s", "Lets", "Let", "Letting"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Let''s\" (avec apostrophe) = let us."}'),
  (2, 'qcm', '{"question": "\"Shall we dance?\" est une :", "options": ["Question fermée", "Proposition polie", "Négation", "Affirmation"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Shall we\" propose poliment une activité."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " have lunch together!", "correct_answers": ["Let''s"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Proposons\" = \"Let''s\"."}'),
  (4, 'true_false', '{"statement": "\"Let''s\" is followed by the base form of the verb.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"let''s\" est bien suivi de la base verbale."}'),
  (5, 'matching', '{"instruction": "Relie la proposition à sa traduction.", "pairs": [{"left": "Let''s go!", "right": "Allons-y !"}, {"left": "Shall we start?", "right": "On commence ?"}, {"left": "Let''s eat.", "right": "Mangeons."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Let''s", "meet", "at", "the", "park."], "correct_sentence": "Let''s meet at the park.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Let''s ___ (not, go) alone.", "options": ["not go", "no go", "don''t go", "not to go"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Négatif de \"let''s\" : \"let''s not go\"."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " we go now? (proposition polie)", "correct_answers": ["Shall"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Shall we go now?\" propose poliment."}')
) as v(position, type, content);
