-- ============================================
-- LUMA — Unité 3 : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I have ___ apple.", "options": ["a", "an", "the", "—"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Apple\" commence par voyelle : \"an apple\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She has ", "sentence_after": " dog.", "correct_answers": ["a"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Dog\" commence par consonne : \"a dog\"."}'),
  (7, 'true_false', '{"statement": "\"The\" is used for something specific and known.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"the\" désigne bien quelque chose de précis."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "saw", "the", "movie", "yesterday."], "correct_sentence": "I saw the movie yesterday.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel est le pluriel de \"child\" ?", "options": ["childs", "children", "childes", "child"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Child\" a un pluriel irrégulier : \"children\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I have three ", "sentence_after": ". (box → pluriel)", "correct_answers": ["boxes"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Box\" se termine en -x, pluriel en -es : \"boxes\"."}'),
  (7, 'true_false', '{"statement": "The plural of \"man\" is \"mans\".", "correct_answer": false, "feedback_correct": "Exact — c''est \"men\".", "feedback_incorrect": "Faux — le pluriel de \"man\" est \"men\"."}'),
  (8, 'matching', '{"instruction": "Relie le singulier au pluriel.", "pairs": [{"left": "foot", "right": "feet"}, {"left": "tooth", "right": "teeth"}, {"left": "mouse", "right": "mice"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ a cat on the sofa.", "options": ["There is", "There are", "It is", "This is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Singulier : \"There is\"."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " many books on the shelf.", "correct_answers": ["There are"], "feedback_correct": "Correct !", "feedback_incorrect": "Pluriel : \"There are\"."}'),
  (7, 'true_false', '{"statement": "\"There is some milk in the fridge\" is correct.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien correct, \"milk\" est indénombrable."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["There", "are", "three", "chairs", "here."], "correct_sentence": "There are three chairs here.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Tall\" veut dire :", "options": ["Petit", "Grand (taille)", "Gros", "Rapide"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Tall\" = grand."}'),
  (6, 'fill_blank', '{"sentence_before": "This car is very ", "sentence_after": ". (rapide)", "correct_answers": ["fast"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Rapide\" = \"fast\"."}'),
  (7, 'true_false', '{"statement": "\"Old\" is the opposite of \"young\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"old\" est bien l''opposé de \"young\"."}'),
  (8, 'matching', '{"instruction": "Relie l''adjectif à son opposé.", "pairs": [{"left": "big", "right": "small"}, {"left": "hot", "right": "cold"}, {"left": "happy", "right": "sad"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'This / that / these / those', '{"rule": "\"This\" (ceci, singulier proche) et \"these\" (ceux-ci, pluriel proche) désignent des choses proches. \"That\" (cela, singulier loin) et \"those\" (ceux-là, pluriel loin) désignent des choses éloignées.", "table": [{"subject": "Proche, singulier", "affirmative": "this book", "negative": "—"}, {"subject": "Proche, pluriel", "affirmative": "these books", "negative": "—"}, {"subject": "Loin, singulier", "affirmative": "that book", "negative": "—"}, {"subject": "Loin, pluriel", "affirmative": "those books", "negative": "—"}], "example": {"en": "This is my bag, that is your bag over there.", "fr": "Ceci est mon sac, celui-là là-bas est ton sac."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ apples over there are red. (loin, pluriel)", "options": ["This", "That", "These", "Those"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "Loin + pluriel = \"those\"."}'),
  (2, 'qcm', '{"question": "Complète : ___ book on my desk is mine. (proche, singulier)", "options": ["This", "That", "These", "Those"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Proche + singulier = \"this\"."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " shoes here are new. (ceux-ci)", "correct_answers": ["These"], "feedback_correct": "Correct !", "feedback_incorrect": "Proche + pluriel = \"These\"."}'),
  (4, 'true_false', '{"statement": "\"That\" is used for something far from the speaker.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"that\" désigne bien quelque chose de loin."}'),
  (5, 'matching', '{"instruction": "Relie le mot à son usage.", "pairs": [{"left": "this", "right": "singulier, proche"}, {"left": "those", "right": "pluriel, loin"}, {"left": "that", "right": "singulier, loin"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Those", "flowers", "are", "beautiful."], "correct_sentence": "Those flowers are beautiful.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"These\" est le pluriel de :", "options": ["that", "this", "those", "it"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"These\" est bien le pluriel de \"this\"."}'),
  (8, 'fill_blank', '{"sentence_before": "Look at ", "sentence_after": " mountains far away! (ceux-là)", "correct_answers": ["those"], "feedback_correct": "Correct !", "feedback_incorrect": "Loin + pluriel = \"those\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Les vêtements', '{"rule": "Le vocabulaire des vêtements est essentiel pour décrire ce que l''on porte au quotidien.", "table": [{"subject": "shirt", "affirmative": "chemise", "negative": "—"}, {"subject": "trousers", "affirmative": "pantalon", "negative": "—"}, {"subject": "shoes", "affirmative": "chaussures", "negative": "—"}], "example": {"en": "She is wearing a blue shirt and black trousers.", "fr": "Elle porte une chemise bleue et un pantalon noir."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Trousers\" veut dire :", "options": ["Chaussures", "Pantalon", "Chemise", "Veste"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Trousers\" = pantalon."}'),
  (2, 'qcm', '{"question": "Comment dit-on \"porter\" (des vêtements) en anglais ?", "options": ["carry", "wear", "bring", "hold"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Wear\" = porter (un vêtement)."}'),
  (3, 'fill_blank', '{"sentence_before": "I am wearing new ", "sentence_after": ". (chaussures)", "correct_answers": ["shoes"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Chaussures\" = \"shoes\"."}'),
  (4, 'true_false', '{"statement": "\"Coat\" means \"manteau\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"coat\" veut bien dire manteau."}'),
  (5, 'matching', '{"instruction": "Relie le vêtement à sa traduction.", "pairs": [{"left": "dress", "right": "robe"}, {"left": "skirt", "right": "jupe"}, {"left": "hat", "right": "chapeau"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "is", "wearing", "a", "red", "dress."], "correct_sentence": "She is wearing a red dress.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Jacket\" se traduit par :", "options": ["Jupe", "Veste", "Chapeau", "Écharpe"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Jacket\" = veste."}'),
  (8, 'fill_blank', '{"sentence_before": "It''s cold, wear your ", "sentence_after": ". (manteau)", "correct_answers": ["coat"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Manteau\" = \"coat\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'La maison et les pièces', '{"rule": "Connaître le nom des pièces de la maison permet de décrire son logement facilement.", "table": [{"subject": "kitchen", "affirmative": "cuisine", "negative": "—"}, {"subject": "bedroom", "affirmative": "chambre", "negative": "—"}, {"subject": "bathroom", "affirmative": "salle de bain", "negative": "—"}], "example": {"en": "There are three bedrooms and one bathroom in my house.", "fr": "Il y a trois chambres et une salle de bain dans ma maison."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Bathroom\" veut dire :", "options": ["Chambre", "Cuisine", "Salle de bain", "Salon"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Bathroom\" = salle de bain."}'),
  (2, 'qcm', '{"question": "Où cuisine-t-on ?", "options": ["living room", "kitchen", "bedroom", "garden"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "On cuisine dans la \"kitchen\"."}'),
  (3, 'fill_blank', '{"sentence_before": "We watch TV in the ", "sentence_after": ". (salon)", "correct_answers": ["living room"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Salon\" = \"living room\"."}'),
  (4, 'true_false', '{"statement": "\"Garden\" is a room inside the house.", "correct_answer": false, "feedback_correct": "Exact — le jardin est à l''extérieur.", "feedback_incorrect": "Faux — \"garden\" (jardin) est à l''extérieur, pas une pièce."}'),
  (5, 'matching', '{"instruction": "Relie la pièce à sa traduction.", "pairs": [{"left": "hallway", "right": "couloir"}, {"left": "garage", "right": "garage"}, {"left": "basement", "right": "sous-sol"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["My", "bedroom", "is", "upstairs."], "correct_sentence": "My bedroom is upstairs.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Où dort-on ?", "options": ["kitchen", "bathroom", "bedroom", "hallway"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "On dort dans la \"bedroom\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The house has a big ", "sentence_after": ". (jardin)", "correct_answers": ["garden"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Jardin\" = \"garden\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Décrire une pièce ou un objet', '{"rule": "Pour décrire un objet, on combine \"there is/are\" avec des adjectifs et des prépositions de lieu (on, under, next to, in front of).", "table": [{"subject": "on", "affirmative": "sur", "negative": "—"}, {"subject": "under", "affirmative": "sous", "negative": "—"}, {"subject": "next to", "affirmative": "à côté de", "negative": "—"}], "example": {"en": "There is a lamp on the table, next to the books.", "fr": "Il y a une lampe sur la table, à côté des livres."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Under\" veut dire :", "options": ["Sur", "Sous", "Devant", "Derrière"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Under\" = sous."}'),
  (2, 'qcm', '{"question": "Complète : The cat is ___ the chair. (sous)", "options": ["on", "under", "next to", "in"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Sous\" = \"under\"."}'),
  (3, 'fill_blank', '{"sentence_before": "The lamp is ", "sentence_after": " the table. (sur)", "correct_answers": ["on"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Sur\" = \"on\"."}'),
  (4, 'true_false', '{"statement": "\"Next to\" means \"à côté de\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"next to\" veut bien dire à côté de."}'),
  (5, 'matching', '{"instruction": "Relie la préposition à sa traduction.", "pairs": [{"left": "in front of", "right": "devant"}, {"left": "behind", "right": "derrière"}, {"left": "between", "right": "entre"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "bag", "is", "under", "the", "table."], "correct_sentence": "The bag is under the table.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"In front of\" veut dire :", "options": ["Derrière", "Devant", "Sous", "Entre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"In front of\" = devant."}'),
  (8, 'fill_blank', '{"sentence_before": "She sits ", "sentence_after": " me. (à côté de)", "correct_answers": ["next to"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À côté de\" = \"next to\"."}')
) as v(position, type, content);
