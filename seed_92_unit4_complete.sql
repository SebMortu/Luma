-- ============================================
-- LUMA — Unité 4 : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : Is this book ___? (à toi)", "options": ["your", "yours", "you", "you''re"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Pronom possessif seul : \"yours\"."}'),
  (6, 'fill_blank', '{"sentence_before": "This is ", "sentence_after": " car, not yours. (le mien)", "correct_answers": ["mine"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Le mien\" = \"mine\"."}'),
  (7, 'true_false', '{"statement": "\"Her\" can be both an adjective and a pronoun.", "correct_answer": true, "feedback_correct": "Exact — \"her\" fonctionne dans les deux cas.", "feedback_incorrect": "Faux — \"her\" fonctionne bien comme adjectif ET comme objet."}'),
  (8, 'matching', '{"instruction": "Relie l''adjectif possessif au pronom possessif.", "pairs": [{"left": "my", "right": "mine"}, {"left": "your", "right": "yours"}, {"left": "our", "right": "ours"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She ___ got a new phone.", "options": ["have", "has", "haves", "having"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on utilise \"has got\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " got two brothers.", "correct_answers": ["have"], "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", on utilise \"have got\"."}'),
  (7, 'true_false', '{"statement": "\"Have got\" and \"have\" can both express possession.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les deux expriment bien la possession."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "has", "got", "a", "sister."], "correct_sentence": "He has got a sister.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : Do you have ___ milk?", "options": ["some", "any", "a", "the"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Dans les questions, on utilise \"any\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I have ", "sentence_after": " friends here. (affirmatif)", "correct_answers": ["some"], "feedback_correct": "Correct !", "feedback_incorrect": "Dans l''affirmatif, on utilise \"some\"."}'),
  (7, 'true_false', '{"statement": "\"I don''t have any money\" is correctly formed.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien correct, \"any\" dans le négatif."}'),
  (8, 'matching', '{"instruction": "Relie le contexte à la bonne forme.", "pairs": [{"left": "Affirmative", "right": "some"}, {"left": "Question", "right": "any"}, {"left": "Negative", "right": "any"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Comment demande-t-on l''heure ?", "options": ["What time is it?", "What day is it?", "How much is it?", "When is it?"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"What time is it?\" demande l''heure."}'),
  (6, 'fill_blank', '{"sentence_before": "It''s ", "sentence_after": " o''clock. (3)", "correct_answers": ["three"], "feedback_correct": "Correct !", "feedback_incorrect": "\"3\" se dit \"three\"."}'),
  (7, 'true_false', '{"statement": "\"Half past six\" means 6:30.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"half past six\" veut bien dire 6h30."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It''s", "a", "quarter", "past", "nine."], "correct_sentence": "It''s a quarter past nine.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Le corps humain', '{"rule": "Le vocabulaire du corps humain est utile pour décrire une douleur, une apparence physique ou pour le sport.", "table": [{"subject": "head", "affirmative": "tête", "negative": "—"}, {"subject": "hand", "affirmative": "main", "negative": "—"}, {"subject": "leg", "affirmative": "jambe", "negative": "—"}], "example": {"en": "My head hurts and my legs are tired.", "fr": "J''ai mal à la tête et mes jambes sont fatiguées."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Hand\" veut dire :", "options": ["Pied", "Main", "Bras", "Doigt"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Hand\" = main."}'),
  (2, 'qcm', '{"question": "Comment dit-on \"j''ai mal à\" en anglais ?", "options": ["I have pain", "It hurts", "I am sick", "I feel bad"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"It hurts\" exprime la douleur."}'),
  (3, 'fill_blank', '{"sentence_before": "My ", "sentence_after": " hurts. (dos)", "correct_answers": ["back"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Dos\" = \"back\"."}'),
  (4, 'true_false', '{"statement": "\"Eye\" refers to the ear.", "correct_answer": false, "feedback_correct": "Exact — \"eye\" c''est l''œil, pas l''oreille.", "feedback_incorrect": "Faux — \"eye\" veut dire œil, pas oreille."}'),
  (5, 'matching', '{"instruction": "Relie la partie du corps à sa traduction.", "pairs": [{"left": "shoulder", "right": "épaule"}, {"left": "knee", "right": "genou"}, {"left": "finger", "right": "doigt"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["My", "stomach", "hurts", "a", "lot."], "correct_sentence": "My stomach hurts a lot.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Foot\" veut dire :", "options": ["Main", "Pied", "Genou", "Bras"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Foot\" = pied."}'),
  (8, 'fill_blank', '{"sentence_before": "I hurt my ", "sentence_after": " playing football. (genou)", "correct_answers": ["knee"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Genou\" = \"knee\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'La famille élargie', '{"rule": "Au-delà de la famille proche, il est utile de connaître les termes pour la famille élargie (grands-parents, cousins, etc.).", "table": [{"subject": "grandmother", "affirmative": "grand-mère", "negative": "—"}, {"subject": "cousin", "affirmative": "cousin(e)", "negative": "—"}, {"subject": "uncle", "affirmative": "oncle", "negative": "—"}], "example": {"en": "My grandmother and my cousins live in Spain.", "fr": "Ma grand-mère et mes cousins vivent en Espagne."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Grandfather\" veut dire :", "options": ["Grand-mère", "Grand-père", "Oncle", "Cousin"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Grandfather\" = grand-père."}'),
  (2, 'qcm', '{"question": "\"Niece\" veut dire :", "options": ["Neveu", "Nièce", "Cousine", "Tante"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Niece\" = nièce."}'),
  (3, 'fill_blank', '{"sentence_before": "My father''s brother is my ", "sentence_after": ". (oncle)", "correct_answers": ["uncle"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Oncle\" = \"uncle\"."}'),
  (4, 'true_false', '{"statement": "\"Aunt\" is your mother''s or father''s sister.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"aunt\" désigne bien la sœur du père ou de la mère."}'),
  (5, 'matching', '{"instruction": "Relie le lien familial à sa traduction.", "pairs": [{"left": "nephew", "right": "neveu"}, {"left": "grandson", "right": "petit-fils"}, {"left": "in-laws", "right": "beaux-parents"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["My", "cousins", "live", "in", "Italy."], "correct_sentence": "My cousins live in Italy.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Grandparents\" désigne :", "options": ["Les parents", "Les grands-parents", "Les cousins", "Les beaux-parents"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Grandparents\" = grands-parents."}'),
  (8, 'fill_blank', '{"sentence_before": "She is my mother''s sister, my ", "sentence_after": ". (tante)", "correct_answers": ["aunt"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Tante\" = \"aunt\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'La nourriture et les repas', '{"rule": "Le vocabulaire de la nourriture permet de commander au restaurant, faire les courses ou décrire ses habitudes alimentaires.", "table": [{"subject": "breakfast", "affirmative": "petit-déjeuner", "negative": "—"}, {"subject": "lunch", "affirmative": "déjeuner", "negative": "—"}, {"subject": "dinner", "affirmative": "dîner", "negative": "—"}], "example": {"en": "I have breakfast at 8am and dinner at 7pm.", "fr": "Je prends mon petit-déjeuner à 8h et mon dîner à 19h."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Lunch\" veut dire :", "options": ["Petit-déjeuner", "Déjeuner", "Dîner", "Goûter"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Lunch\" = déjeuner."}'),
  (2, 'qcm', '{"question": "\"Bread\" veut dire :", "options": ["Beurre", "Pain", "Fromage", "Lait"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Bread\" = pain."}'),
  (3, 'fill_blank', '{"sentence_before": "I drink a glass of ", "sentence_after": " every morning. (lait)", "correct_answers": ["milk"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Lait\" = \"milk\"."}'),
  (4, 'true_false', '{"statement": "\"Vegetable\" and \"fruit\" mean the same thing.", "correct_answer": false, "feedback_correct": "Exact — ce sont deux catégories différentes.", "feedback_incorrect": "Faux — légume et fruit sont bien différents."}'),
  (5, 'matching', '{"instruction": "Relie l''aliment à sa traduction.", "pairs": [{"left": "cheese", "right": "fromage"}, {"left": "chicken", "right": "poulet"}, {"left": "fish", "right": "poisson"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "eat", "breakfast", "at", "home."], "correct_sentence": "I eat breakfast at home.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Butter\" se traduit par :", "options": ["Beurre", "Sucre", "Sel", "Huile"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Butter\" = beurre."}'),
  (8, 'fill_blank', '{"sentence_before": "We have ", "sentence_after": " together every Sunday. (dîner)", "correct_answers": ["dinner"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Dîner\" = \"dinner\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Exprimer la possession différemment', '{"rule": "En plus de \"have got\", on peut exprimer la possession avec le génitif -''s pour les personnes (John''s car) et \"of\" pour les objets.", "table": [{"subject": "-''s (personnes)", "affirmative": "John''s car", "negative": "—"}, {"subject": "of (objets)", "affirmative": "the color of the car", "negative": "—"}], "example": {"en": "This is Sarah''s book, and the cover of the book is blue.", "fr": "C''est le livre de Sarah, et la couverture du livre est bleue."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Comment dit-on \"le chien de Paul\" ?", "options": ["the dog of Paul", "Paul''s dog", "the Paul dog", "dog Paul''s"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Pour une personne, on utilise -''s : \"Paul''s dog\"."}'),
  (2, 'qcm', '{"question": "Complète : This is ", "options": ["Sarah''s", "Sarah", "of Sarah", "Sarahs"], "correct_index": 0, "feedback_correct": "Correct ! (avec un contexte de possession)", "feedback_incorrect": "Le génitif -''s marque la possession."}'),
  (3, 'fill_blank', '{"sentence_before": "That is my ", "sentence_after": " car. (frère)", "correct_answers": ["brother''s"], "feedback_correct": "Correct !", "feedback_incorrect": "\"La voiture de mon frère\" = \"my brother''s car\"."}'),
  (4, 'true_false', '{"statement": "\"The book of Tom\" is more natural than \"Tom''s book\".", "correct_answer": false, "feedback_correct": "Exact — pour une personne, -''s est plus naturel.", "feedback_incorrect": "Faux — \"Tom''s book\" est la forme naturelle."}'),
  (5, 'matching', '{"instruction": "Relie la phrase française à sa traduction.", "pairs": [{"left": "La maison de Lisa", "right": "Lisa''s house"}, {"left": "Le stylo de mon ami", "right": "my friend''s pen"}, {"left": "La couleur du mur", "right": "the color of the wall"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "is", "my", "sister''s", "phone."], "correct_sentence": "This is my sister''s phone.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Pour un objet (pas une personne), on utilise plutôt :", "options": ["-''s", "of", "les deux indifféremment", "aucun des deux"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Pour les objets, \"of\" est plus naturel."}'),
  (8, 'fill_blank', '{"sentence_before": "The color ", "sentence_after": " the car is red.", "correct_answers": ["of"], "feedback_correct": "Correct !", "feedback_incorrect": "\"La couleur de la voiture\" = \"the color of the car\"."}')
) as v(position, type, content);
