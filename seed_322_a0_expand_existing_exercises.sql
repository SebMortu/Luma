-- ============================================
-- LUMA — Extension MAJEURE du niveau A0 'Fondations'
-- Partie 1/2 : réécriture complète des exercices des 15 leçons existantes
-- (couverture de TOUT le vocabulaire de chaque leçon, plus d'exercices par leçon)
-- ============================================


-- Leçon 1 : Les couleurs — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔴", "right": "red"}, {"left": "🔵", "right": "blue"}, {"left": "🟢", "right": "green"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🟡", "right": "yellow"}, {"left": "⚫", "right": "black"}, {"left": "⚪", "right": "white"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🔴 = ?", "options": ["blanc", "noir", "bleu", "rouge"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔴 veut dire \"rouge\"."}'),(4, 'qcm', '{"question": "🔵 = ?", "options": ["noir", "vert", "blanc", "bleu"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔵 veut dire \"bleu\"."}'),(5, 'qcm', '{"question": "🟢 = ?", "options": ["bleu", "jaune", "vert", "blanc"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🟢 veut dire \"vert\"."}'),(6, 'qcm', '{"question": "🟡 = ?", "options": ["noir", "blanc", "vert", "jaune"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🟡 veut dire \"jaune\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "red", "right": "rouge"}, {"left": "blue", "right": "bleu"}, {"left": "green", "right": "vert"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "yellow", "right": "jaune"}, {"left": "black", "right": "noir"}, {"left": "white", "right": "blanc"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 2 : Les nombres de 1 à 10 — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "1️⃣", "right": "one"}, {"left": "2️⃣", "right": "two"}, {"left": "3️⃣", "right": "three"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "4️⃣", "right": "four"}, {"left": "5️⃣", "right": "five"}, {"left": "6️⃣", "right": "six"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "7️⃣", "right": "seven"}, {"left": "8️⃣", "right": "eight"}, {"left": "9️⃣", "right": "nine"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(4, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔟", "right": "ten"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(5, 'qcm', '{"question": "1️⃣ = ?", "options": ["huit", "six", "un", "sept"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"un\"."}'),(6, 'qcm', '{"question": "2️⃣ = ?", "options": ["deux", "neuf", "cinq", "quatre"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"deux\"."}'),(7, 'qcm', '{"question": "3️⃣ = ?", "options": ["dix", "un", "trois", "deux"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "3️⃣ veut dire \"trois\"."}'),(8, 'qcm', '{"question": "4️⃣ = ?", "options": ["six", "deux", "un", "quatre"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "4️⃣ veut dire \"quatre\"."}'),(9, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "one", "right": "un"}, {"left": "two", "right": "deux"}, {"left": "three", "right": "trois"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(10, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "four", "right": "quatre"}, {"left": "five", "right": "cinq"}, {"left": "six", "right": "six"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(11, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "seven", "right": "sept"}, {"left": "eight", "right": "huit"}, {"left": "nine", "right": "neuf"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(12, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "ten", "right": "dix"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 3 : Les animaux domestiques — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐶", "right": "dog"}, {"left": "🐱", "right": "cat"}, {"left": "🐦", "right": "bird"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐟", "right": "fish"}, {"left": "🐰", "right": "rabbit"}, {"left": "🐴", "right": "horse"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🐶 = ?", "options": ["lapin", "cheval", "chien", "chat"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐶 veut dire \"chien\"."}'),(4, 'qcm', '{"question": "🐱 = ?", "options": ["chat", "chien", "lapin", "oiseau"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🐱 veut dire \"chat\"."}'),(5, 'qcm', '{"question": "🐦 = ?", "options": ["poisson", "lapin", "chat", "oiseau"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐦 veut dire \"oiseau\"."}'),(6, 'qcm', '{"question": "🐟 = ?", "options": ["chat", "chien", "poisson", "oiseau"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐟 veut dire \"poisson\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "dog", "right": "chien"}, {"left": "cat", "right": "chat"}, {"left": "bird", "right": "oiseau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "fish", "right": "poisson"}, {"left": "rabbit", "right": "lapin"}, {"left": "horse", "right": "cheval"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 4 : La famille proche — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👩", "right": "mom"}, {"left": "👨", "right": "dad"}, {"left": "👧", "right": "sister"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👦", "right": "brother"}, {"left": "👶", "right": "baby"}, {"left": "👵", "right": "grandma"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "👩 = ?", "options": ["bébé", "papa", "maman", "grand-mère"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👩 veut dire \"maman\"."}'),(4, 'qcm', '{"question": "👨 = ?", "options": ["papa", "maman", "bébé", "grand-mère"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "👨 veut dire \"papa\"."}'),(5, 'qcm', '{"question": "👧 = ?", "options": ["bébé", "grand-mère", "sœur", "frère"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👧 veut dire \"sœur\"."}'),(6, 'qcm', '{"question": "👦 = ?", "options": ["frère", "maman", "bébé", "papa"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "👦 veut dire \"frère\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "mom", "right": "maman"}, {"left": "dad", "right": "papa"}, {"left": "sister", "right": "sœur"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "brother", "right": "frère"}, {"left": "baby", "right": "bébé"}, {"left": "grandma", "right": "grand-mère"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 5 : Le corps — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🗣️", "right": "head"}, {"left": "✋", "right": "hand"}, {"left": "🦶", "right": "foot"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👁️", "right": "eye"}, {"left": "👂", "right": "ear"}, {"left": "👄", "right": "mouth"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🗣️ = ?", "options": ["main", "œil", "tête", "oreille"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🗣️ veut dire \"tête\"."}'),(4, 'qcm', '{"question": "✋ = ?", "options": ["œil", "main", "pied", "bouche"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "✋ veut dire \"main\"."}'),(5, 'qcm', '{"question": "🦶 = ?", "options": ["tête", "œil", "pied", "bouche"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🦶 veut dire \"pied\"."}'),(6, 'qcm', '{"question": "👁️ = ?", "options": ["pied", "tête", "œil", "main"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👁️ veut dire \"œil\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "head", "right": "tête"}, {"left": "hand", "right": "main"}, {"left": "foot", "right": "pied"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "eye", "right": "œil"}, {"left": "ear", "right": "oreille"}, {"left": "mouth", "right": "bouche"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 6 : La nourriture de base — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍎", "right": "apple"}, {"left": "🍞", "right": "bread"}, {"left": "💧", "right": "water"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🥛", "right": "milk"}, {"left": "🥚", "right": "egg"}, {"left": "🍌", "right": "banana"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🍎 = ?", "options": ["lait", "pomme", "banane", "eau"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🍎 veut dire \"pomme\"."}'),(4, 'qcm', '{"question": "🍞 = ?", "options": ["eau", "banane", "œuf", "pain"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍞 veut dire \"pain\"."}'),(5, 'qcm', '{"question": "💧 = ?", "options": ["œuf", "lait", "pain", "eau"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "💧 veut dire \"eau\"."}'),(6, 'qcm', '{"question": "🥛 = ?", "options": ["pomme", "œuf", "lait", "banane"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🥛 veut dire \"lait\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "apple", "right": "pomme"}, {"left": "bread", "right": "pain"}, {"left": "water", "right": "eau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "milk", "right": "lait"}, {"left": "egg", "right": "œuf"}, {"left": "banana", "right": "banane"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 7 : Les vêtements simples — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👕", "right": "shirt"}, {"left": "👟", "right": "shoes"}, {"left": "🧢", "right": "hat"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🧦", "right": "socks"}, {"left": "👗", "right": "dress"}, {"left": "🧥", "right": "coat"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "👕 = ?", "options": ["chaussures", "casquette", "t-shirt", "chaussettes"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👕 veut dire \"t-shirt\"."}'),(4, 'qcm', '{"question": "👟 = ?", "options": ["manteau", "chaussures", "casquette", "robe"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "👟 veut dire \"chaussures\"."}'),(5, 'qcm', '{"question": "🧢 = ?", "options": ["robe", "casquette", "chaussures", "chaussettes"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🧢 veut dire \"casquette\"."}'),(6, 'qcm', '{"question": "🧦 = ?", "options": ["chaussettes", "chaussures", "robe", "t-shirt"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🧦 veut dire \"chaussettes\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "shirt", "right": "t-shirt"}, {"left": "shoes", "right": "chaussures"}, {"left": "hat", "right": "casquette"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "socks", "right": "chaussettes"}, {"left": "dress", "right": "robe"}, {"left": "coat", "right": "manteau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 8 : Les objets de la maison — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🪑", "right": "table"}, {"left": "💺", "right": "chair"}, {"left": "🛏️", "right": "bed"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🚪", "right": "door"}, {"left": "🪟", "right": "window"}, {"left": "🔑", "right": "key"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🪑 = ?", "options": ["chaise", "table", "clé", "fenêtre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🪑 veut dire \"table\"."}'),(4, 'qcm', '{"question": "💺 = ?", "options": ["chaise", "porte", "table", "clé"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "💺 veut dire \"chaise\"."}'),(5, 'qcm', '{"question": "🛏️ = ?", "options": ["chaise", "lit", "clé", "fenêtre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🛏️ veut dire \"lit\"."}'),(6, 'qcm', '{"question": "🚪 = ?", "options": ["table", "chaise", "porte", "fenêtre"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🚪 veut dire \"porte\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "table", "right": "table"}, {"left": "chair", "right": "chaise"}, {"left": "bed", "right": "lit"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "door", "right": "porte"}, {"left": "window", "right": "fenêtre"}, {"left": "key", "right": "clé"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 9 : Les jours de la semaine — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "1️⃣", "right": "Monday"}, {"left": "2️⃣", "right": "Tuesday"}, {"left": "3️⃣", "right": "Wednesday"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "4️⃣", "right": "Thursday"}, {"left": "5️⃣", "right": "Friday"}, {"left": "6️⃣", "right": "Saturday"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "7️⃣", "right": "Sunday"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(4, 'qcm', '{"question": "1️⃣ = ?", "options": ["samedi", "lundi", "dimanche", "jeudi"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"lundi\"."}'),(5, 'qcm', '{"question": "2️⃣ = ?", "options": ["mercredi", "mardi", "dimanche", "samedi"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"mardi\"."}'),(6, 'qcm', '{"question": "3️⃣ = ?", "options": ["jeudi", "lundi", "samedi", "mercredi"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "3️⃣ veut dire \"mercredi\"."}'),(7, 'qcm', '{"question": "4️⃣ = ?", "options": ["mercredi", "samedi", "jeudi", "mardi"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "4️⃣ veut dire \"jeudi\"."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "Monday", "right": "lundi"}, {"left": "Tuesday", "right": "mardi"}, {"left": "Wednesday", "right": "mercredi"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(9, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "Thursday", "right": "jeudi"}, {"left": "Friday", "right": "vendredi"}, {"left": "Saturday", "right": "samedi"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(10, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "Sunday", "right": "dimanche"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 10 : Dire bonjour et merci — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👋", "right": "hello"}, {"left": "🙋", "right": "goodbye"}, {"left": "🙏", "right": "please"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🙌", "right": "thank you"}, {"left": "✅", "right": "yes"}, {"left": "❌", "right": "no"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "👋 = ?", "options": ["bonjour", "non", "au revoir", "merci"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "👋 veut dire \"bonjour\"."}'),(4, 'qcm', '{"question": "🙋 = ?", "options": ["oui", "bonjour", "merci", "au revoir"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🙋 veut dire \"au revoir\"."}'),(5, 'qcm', '{"question": "🙏 = ?", "options": ["bonjour", "non", "s’il te plait", "merci"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🙏 veut dire \"s’il te plait\"."}'),(6, 'qcm', '{"question": "🙌 = ?", "options": ["merci", "bonjour", "s’il te plait", "oui"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🙌 veut dire \"merci\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "hello", "right": "bonjour"}, {"left": "goodbye", "right": "au revoir"}, {"left": "please", "right": "s’il te plait"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "thank you", "right": "merci"}, {"left": "yes", "right": "oui"}, {"left": "no", "right": "non"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 11 : Les émotions simples — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "😊", "right": "happy"}, {"left": "😢", "right": "sad"}, {"left": "😠", "right": "angry"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "😴", "right": "tired"}, {"left": "😨", "right": "scared"}, {"left": "😮", "right": "surprised"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "😊 = ?", "options": ["content", "effrayé", "surpris", "fatigué"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "😊 veut dire \"content\"."}'),(4, 'qcm', '{"question": "😢 = ?", "options": ["content", "fatigué", "effrayé", "triste"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "😢 veut dire \"triste\"."}'),(5, 'qcm', '{"question": "😠 = ?", "options": ["fatigué", "fâché", "effrayé", "triste"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "😠 veut dire \"fâché\"."}'),(6, 'qcm', '{"question": "😴 = ?", "options": ["effrayé", "triste", "fâché", "fatigué"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "😴 veut dire \"fatigué\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "happy", "right": "content"}, {"left": "sad", "right": "triste"}, {"left": "angry", "right": "fâché"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "tired", "right": "fatigué"}, {"left": "scared", "right": "effrayé"}, {"left": "surprised", "right": "surpris"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 12 : La météo simple — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "☀️", "right": "sun"}, {"left": "🌧️", "right": "rain"}, {"left": "❄️", "right": "snow"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "💨", "right": "wind"}, {"left": "☁️", "right": "cloud"}, {"left": "🥵", "right": "hot"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "☀️ = ?", "options": ["nuage", "vent", "pluie", "soleil"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "☀️ veut dire \"soleil\"."}'),(4, 'qcm', '{"question": "🌧️ = ?", "options": ["vent", "pluie", "nuage", "neige"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🌧️ veut dire \"pluie\"."}'),(5, 'qcm', '{"question": "❄️ = ?", "options": ["neige", "chaud", "pluie", "soleil"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "❄️ veut dire \"neige\"."}'),(6, 'qcm', '{"question": "💨 = ?", "options": ["soleil", "neige", "vent", "nuage"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "💨 veut dire \"vent\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "sun", "right": "soleil"}, {"left": "rain", "right": "pluie"}, {"left": "snow", "right": "neige"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "wind", "right": "vent"}, {"left": "cloud", "right": "nuage"}, {"left": "hot", "right": "chaud"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 13 : Les moyens de transport — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🚗", "right": "car"}, {"left": "🚌", "right": "bus"}, {"left": "🚂", "right": "train"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🚲", "right": "bike"}, {"left": "✈️", "right": "plane"}, {"left": "⛵", "right": "boat"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🚗 = ?", "options": ["train", "bateau", "voiture", "bus"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🚗 veut dire \"voiture\"."}'),(4, 'qcm', '{"question": "🚌 = ?", "options": ["train", "bus", "avion", "bateau"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🚌 veut dire \"bus\"."}'),(5, 'qcm', '{"question": "🚂 = ?", "options": ["voiture", "train", "bateau", "vélo"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🚂 veut dire \"train\"."}'),(6, 'qcm', '{"question": "🚲 = ?", "options": ["vélo", "avion", "voiture", "train"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🚲 veut dire \"vélo\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "car", "right": "voiture"}, {"left": "bus", "right": "bus"}, {"left": "train", "right": "train"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "bike", "right": "vélo"}, {"left": "plane", "right": "avion"}, {"left": "boat", "right": "bateau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 14 : Les tailles et les formes — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔵", "right": "big"}, {"left": "🔹", "right": "small"}, {"left": "⭕", "right": "round"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🟥", "right": "square"}, {"left": "➖", "right": "long"}, {"left": "🔸", "right": "short"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🔵 = ?", "options": ["court", "long", "grand", "petit"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🔵 veut dire \"grand\"."}'),(4, 'qcm', '{"question": "🔹 = ?", "options": ["petit", "grand", "carré", "rond"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🔹 veut dire \"petit\"."}'),(5, 'qcm', '{"question": "⭕ = ?", "options": ["carré", "petit", "long", "rond"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "⭕ veut dire \"rond\"."}'),(6, 'qcm', '{"question": "🟥 = ?", "options": ["carré", "petit", "long", "court"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🟥 veut dire \"carré\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "big", "right": "grand"}, {"left": "small", "right": "petit"}, {"left": "round", "right": "rond"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "square", "right": "carré"}, {"left": "long", "right": "long"}, {"left": "short", "right": "court"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


-- Leçon 15 : Les actions du quotidien — suppression des anciens exercices, réinsertion complète


delete from exercises where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15
);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍽️", "right": "eat"}, {"left": "🥤", "right": "drink"}, {"left": "😴", "right": "sleep"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🎮", "right": "play"}, {"left": "🏃", "right": "run"}, {"left": "📖", "right": "read"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🍽️ = ?", "options": ["jouer", "boire", "manger", "lire"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🍽️ veut dire \"manger\"."}'),(4, 'qcm', '{"question": "🥤 = ?", "options": ["jouer", "courir", "boire", "lire"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🥤 veut dire \"boire\"."}'),(5, 'qcm', '{"question": "😴 = ?", "options": ["courir", "lire", "boire", "dormir"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "😴 veut dire \"dormir\"."}'),(6, 'qcm', '{"question": "🎮 = ?", "options": ["lire", "jouer", "boire", "dormir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🎮 veut dire \"jouer\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "eat", "right": "manger"}, {"left": "drink", "right": "boire"}, {"left": "sleep", "right": "dormir"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "play", "right": "jouer"}, {"left": "run", "right": "courir"}, {"left": "read", "right": "lire"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);
