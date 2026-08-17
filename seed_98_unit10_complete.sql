-- ============================================
-- LUMA — Unité 10 (A2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel est le comparatif de \"tall\" ?", "options": ["more tall", "taller", "tallest", "tallier"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Adjectif court + er : \"taller\"."}'),
  (6, 'fill_blank', '{"sentence_before": "This bag is ", "sentence_after": " than that one. (plus grand)", "correct_answers": ["bigger"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Big\" double la consonne : \"bigger\"."}'),
  (7, 'true_false', '{"statement": "\"Small\" becomes \"smaller\" in the comparative.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien \"smaller\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "book", "is", "cheaper", "than", "that", "one."], "correct_sentence": "This book is cheaper than that one.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel est le comparatif de \"good\" ?", "options": ["gooder", "more good", "better", "best"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Good\" est irrégulier : \"better\"."}'),
  (6, 'fill_blank', '{"sentence_before": "This movie is ", "sentence_after": " than the last one. (plus intéressant)", "correct_answers": ["more interesting"], "feedback_correct": "Correct !", "feedback_incorrect": "Adjectif long : \"more interesting\"."}'),
  (7, 'true_false', '{"statement": "The comparative of \"bad\" is \"badder\".", "correct_answer": false, "feedback_correct": "Exact — c''est \"worse\".", "feedback_incorrect": "Faux — le comparatif de \"bad\" est \"worse\"."}'),
  (8, 'matching', '{"instruction": "Relie l''adjectif à son comparatif irrégulier.", "pairs": [{"left": "good", "right": "better"}, {"left": "bad", "right": "worse"}, {"left": "far", "right": "further"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel est le superlatif de \"fast\" ?", "options": ["faster", "fastest", "more fast", "most fast"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Adjectif court + est : \"fastest\"."}'),
  (6, 'fill_blank', '{"sentence_before": "This is the ", "sentence_after": " restaurant in town. (le meilleur)", "correct_answers": ["best"], "feedback_correct": "Correct !", "feedback_incorrect": "Superlatif irrégulier de \"good\" : \"best\"."}'),
  (7, 'true_false', '{"statement": "The superlative always uses \"the\" before it.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — le superlatif utilise bien \"the\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "is", "the", "smartest", "student."], "correct_sentence": "She is the smartest student.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Comment dit-on \"aussi grand que\" ?", "options": ["as tall as", "so tall than", "tall as", "more tall as"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Égalité : \"as tall as\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She is ", "sentence_after": " fast as her brother. (aussi)", "correct_answers": ["as"], "feedback_correct": "Correct !", "feedback_incorrect": "\"As fast as\" = aussi rapide que."}'),
  (7, 'true_false', '{"statement": "\"Not as tall as\" means \"less tall than\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"not as tall as\" veut bien dire moins grand que."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "is", "as", "old", "as", "me."], "correct_sentence": "He is as old as me.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Comparer avec les noms (more/less/fewer)', '{"rule": "Pour comparer des quantités, on utilise \"more\" (plus, dénombrable/indénombrable), \"less\" (moins, indénombrable) et \"fewer\" (moins, dénombrable).", "table": [{"subject": "more", "affirmative": "plus (les deux)", "negative": "—"}, {"subject": "less", "affirmative": "moins (indénombrable)", "negative": "—"}, {"subject": "fewer", "affirmative": "moins (dénombrable)", "negative": "—"}], "example": {"en": "I have more time but fewer friends than before.", "fr": "J''ai plus de temps mais moins d''amis qu''avant."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I have ___ money than you. (indénombrable)", "options": ["fewer", "less", "few", "many"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Money\" est indénombrable : \"less\"."}'),
  (2, 'qcm', '{"question": "Complète : She has ___ books than me. (dénombrable)", "options": ["less", "fewer", "much", "little"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Books\" est dénombrable : \"fewer\"."}'),
  (3, 'fill_blank', '{"sentence_before": "We need ", "sentence_after": " information before deciding. (plus)", "correct_answers": ["more"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Plus\" = \"more\"."}'),
  (4, 'true_false', '{"statement": "\"More\" is used for both countable and uncountable nouns.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"more\" fonctionne bien avec les deux."}'),
  (5, 'matching', '{"instruction": "Relie le mot au type de nom.", "pairs": [{"left": "fewer", "right": "dénombrable"}, {"left": "less", "right": "indénombrable"}, {"left": "more", "right": "les deux"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "fewer", "problems", "now."], "correct_sentence": "I have fewer problems now.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : There is ___ traffic today.", "options": ["fewer", "less", "few", "many"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Traffic\" est indénombrable : \"less\"."}'),
  (8, 'fill_blank', '{"sentence_before": "There are ", "sentence_after": " people here than yesterday. (moins, dénombrable)", "correct_answers": ["fewer"], "feedback_correct": "Correct !", "feedback_incorrect": "\"People\" est dénombrable : \"fewer\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Décrire une ville ou un lieu', '{"rule": "Combiner comparatifs et superlatifs avec du vocabulaire urbain permet de décrire et comparer des lieux.", "table": [{"subject": "crowded", "affirmative": "bondé", "negative": "—"}, {"subject": "quiet", "affirmative": "calme", "negative": "—"}, {"subject": "expensive", "affirmative": "cher", "negative": "—"}], "example": {"en": "Paris is more crowded than my hometown, but London is the most expensive.", "fr": "Paris est plus bondé que ma ville natale, mais Londres est la plus chère."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Crowded\" veut dire :", "options": ["Calme", "Bondé", "Petit", "Ancien"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Crowded\" = bondé."}'),
  (2, 'qcm', '{"question": "Quel est le comparatif de \"expensive\" ?", "options": ["expensiver", "more expensive", "expensivest", "most expensive"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Adjectif long : \"more expensive\"."}'),
  (3, 'fill_blank', '{"sentence_before": "This neighborhood is very ", "sentence_after": " at night. (calme)", "correct_answers": ["quiet"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Calme\" = \"quiet\"."}'),
  (4, 'true_false', '{"statement": "\"Modern\" and \"ancient\" are opposites.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"modern\" et \"ancient\" sont bien opposés."}'),
  (5, 'matching', '{"instruction": "Relie l''adjectif de ville à sa traduction.", "pairs": [{"left": "safe", "right": "sûr"}, {"left": "polluted", "right": "pollué"}, {"left": "lively", "right": "animé"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "city", "is", "the", "most", "beautiful."], "correct_sentence": "This city is the most beautiful.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Safe\" veut dire :", "options": ["Dangereux", "Sûr", "Cher", "Petit"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Safe\" = sûr."}'),
  (8, 'fill_blank', '{"sentence_before": "New York is ", "sentence_after": " than my town. (plus animé)", "correct_answers": ["livelier", "more lively"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Plus animé\" = \"livelier\" ou \"more lively\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Comparer des habitudes alimentaires', '{"rule": "Le vocabulaire de la nourriture combiné aux comparatifs permet de discuter de préférences alimentaires.", "table": [{"subject": "healthy", "affirmative": "sain", "negative": "—"}, {"subject": "tasty", "affirmative": "savoureux", "negative": "—"}, {"subject": "spicy", "affirmative": "épicé", "negative": "—"}], "example": {"en": "This dish is spicier than that one, but less healthy.", "fr": "Ce plat est plus épicé que l''autre, mais moins sain."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Healthy\" veut dire :", "options": ["Malsain", "Sain", "Épicé", "Sucré"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Healthy\" = sain."}'),
  (2, 'qcm', '{"question": "Quel est le comparatif de \"spicy\" ?", "options": ["spicyer", "spicier", "more spicy", "spiciest"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Y\" devient \"ier\" : \"spicier\"."}'),
  (3, 'fill_blank', '{"sentence_before": "This soup is ", "sentence_after": " than the salad. (plus savoureux)", "correct_answers": ["tastier"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Tasty\" + comparatif : \"tastier\"."}'),
  (4, 'true_false', '{"statement": "\"Sweet\" is the opposite of \"sour\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"sweet\" et \"sour\" sont bien opposés."}'),
  (5, 'matching', '{"instruction": "Relie le goût à sa traduction.", "pairs": [{"left": "salty", "right": "salé"}, {"left": "bitter", "right": "amer"}, {"left": "fresh", "right": "frais"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "meal", "is", "healthier", "than", "fast", "food."], "correct_sentence": "This meal is healthier than fast food.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Bitter\" veut dire :", "options": ["Sucré", "Amer", "Salé", "Épicé"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Bitter\" = amer."}'),
  (8, 'fill_blank', '{"sentence_before": "Coffee is more ", "sentence_after": " than tea. (amer)", "correct_answers": ["bitter"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Amer\" = \"bitter\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan comparatifs et superlatifs', '{"rule": "Cette leçon révise l''ensemble du système comparatif : adjectifs courts (-er/-est), longs (more/most), irréguliers (good/bad), et l''égalité (as...as).", "table": [{"subject": "Court", "affirmative": "big → bigger → the biggest", "negative": "—"}, {"subject": "Long", "affirmative": "beautiful → more beautiful → the most beautiful", "negative": "—"}, {"subject": "Irrégulier", "affirmative": "good → better → the best", "negative": "—"}], "example": {"en": "This is the best trip I''ve ever had — better than last year''s, and just as exciting as I hoped.", "fr": "C''est le meilleur voyage que j''ai jamais fait — meilleur que celui de l''an dernier, et aussi excitant que je l''espérais."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 10 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est le superlatif de \"bad\" ?", "options": ["baddest", "worse", "the worst", "more bad"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Superlatif irrégulier : \"the worst\"."}'),
  (2, 'qcm', '{"question": "Quel est le comparatif de \"happy\" ?", "options": ["happyer", "happier", "more happy", "happiest"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Y\" devient \"ier\" : \"happier\"."}'),
  (3, 'fill_blank', '{"sentence_before": "This is ", "sentence_after": " exciting as I expected. (aussi)", "correct_answers": ["as"], "feedback_correct": "Correct !", "feedback_incorrect": "Égalité : \"as exciting as\"."}'),
  (4, 'true_false', '{"statement": "\"The most good\" is correct English.", "correct_answer": false, "feedback_correct": "Exact — c''est \"the best\".", "feedback_incorrect": "Faux — \"good\" est irrégulier : \"the best\"."}'),
  (5, 'matching', '{"instruction": "Relie l''adjectif à sa catégorie comparative.", "pairs": [{"left": "tall", "right": "court (-er)"}, {"left": "interesting", "right": "long (more)"}, {"left": "far", "right": "irrégulier"}], "feedback_correct": "Parfait, tu maîtrises les comparaisons !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "is", "the", "best", "day", "ever."], "correct_sentence": "This is the best day ever.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She is not ___ tall as her sister.", "options": ["as", "so", "than", "more"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Not as tall as\" exprime l''infériorité."}'),
  (8, 'fill_blank', '{"sentence_before": "This is ", "sentence_after": " difficult exam I''ve ever taken. (le plus)", "correct_answers": ["the most"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Le plus\" (adjectif long) = \"the most\"."}')
) as v(position, type, content);
