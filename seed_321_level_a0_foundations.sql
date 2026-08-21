-- ============================================
-- LUMA — Niveau A0 'Fondations' — 15 leçons purement lexicales (v3, échappement SQL corrigé)
-- Tout bloc JSON passe systématiquement par sql_json() : plus aucune apostrophe
-- brute (ex. "s'il te plaît") ne peut casser le littéral SQL.
-- ============================================


insert into units (language_id, cecr_level, position, title)
select id, 'A0', 0, 'Unité 0 : Fondations' from languages where code = 'en';


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Les couleurs', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "red", "affirmative": "rouge", "negative": "🔴"}, {"subject": "blue", "affirmative": "bleu", "negative": "🔵"}, {"subject": "green", "affirmative": "vert", "negative": "🟢"}, {"subject": "yellow", "affirmative": "jaune", "negative": "🟡"}, {"subject": "black", "affirmative": "noir", "negative": "⚫"}, {"subject": "white", "affirmative": "blanc", "negative": "⚪"}]'::jsonb,
  'example', '{"en": "red", "fr": "rouge"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔴", "right": "red"}, {"left": "🔵", "right": "blue"}, {"left": "🟢", "right": "green"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🔴 = ?", "options": ["vert", "bleu", "jaune", "rouge"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔴 veut dire \"rouge\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🔵 = ?", "options": ["jaune", "vert", "bleu", "rouge"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🔵 veut dire \"bleu\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "yellow", "right": "jaune"}, {"left": "black", "right": "noir"}, {"left": "white", "right": "blanc"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Les nombres de 1 à 10', jsonb_build_object(
  'rule', 'Découvre 10 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "one", "affirmative": "un", "negative": "1️⃣"}, {"subject": "two", "affirmative": "deux", "negative": "2️⃣"}, {"subject": "three", "affirmative": "trois", "negative": "3️⃣"}, {"subject": "four", "affirmative": "quatre", "negative": "4️⃣"}, {"subject": "five", "affirmative": "cinq", "negative": "5️⃣"}, {"subject": "six", "affirmative": "six", "negative": "6️⃣"}, {"subject": "seven", "affirmative": "sept", "negative": "7️⃣"}, {"subject": "eight", "affirmative": "huit", "negative": "8️⃣"}, {"subject": "nine", "affirmative": "neuf", "negative": "9️⃣"}, {"subject": "ten", "affirmative": "dix", "negative": "🔟"}]'::jsonb,
  'example', '{"en": "one", "fr": "un"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "1️⃣", "right": "one"}, {"left": "2️⃣", "right": "two"}, {"left": "3️⃣", "right": "three"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "1️⃣ = ?", "options": ["deux", "quatre", "trois", "un"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"un\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "2️⃣ = ?", "options": ["un", "trois", "deux", "quatre"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"deux\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "four", "right": "quatre"}, {"left": "five", "right": "cinq"}, {"left": "six", "right": "six"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Les animaux domestiques', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "dog", "affirmative": "chien", "negative": "🐶"}, {"subject": "cat", "affirmative": "chat", "negative": "🐱"}, {"subject": "bird", "affirmative": "oiseau", "negative": "🐦"}, {"subject": "fish", "affirmative": "poisson", "negative": "🐟"}, {"subject": "rabbit", "affirmative": "lapin", "negative": "🐰"}, {"subject": "horse", "affirmative": "cheval", "negative": "🐴"}]'::jsonb,
  'example', '{"en": "dog", "fr": "chien"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐶", "right": "dog"}, {"left": "🐱", "right": "cat"}, {"left": "🐦", "right": "bird"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🐶 = ?", "options": ["chat", "oiseau", "poisson", "chien"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐶 veut dire \"chien\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🐱 = ?", "options": ["chien", "poisson", "oiseau", "chat"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐱 veut dire \"chat\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "fish", "right": "poisson"}, {"left": "rabbit", "right": "lapin"}, {"left": "horse", "right": "cheval"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'La famille proche', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "mom", "affirmative": "maman", "negative": "👩"}, {"subject": "dad", "affirmative": "papa", "negative": "👨"}, {"subject": "sister", "affirmative": "sœur", "negative": "👧"}, {"subject": "brother", "affirmative": "frère", "negative": "👦"}, {"subject": "baby", "affirmative": "bébé", "negative": "👶"}, {"subject": "grandma", "affirmative": "grand-mère", "negative": "👵"}]'::jsonb,
  'example', '{"en": "mom", "fr": "maman"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👩", "right": "mom"}, {"left": "👨", "right": "dad"}, {"left": "👧", "right": "sister"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "👩 = ?", "options": ["sœur", "papa", "maman", "frère"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👩 veut dire \"maman\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "👨 = ?", "options": ["maman", "frère", "papa", "sœur"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👨 veut dire \"papa\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "brother", "right": "frère"}, {"left": "baby", "right": "bébé"}, {"left": "grandma", "right": "grand-mère"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 5, 'Le corps', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "head", "affirmative": "tête", "negative": "🗣️"}, {"subject": "hand", "affirmative": "main", "negative": "✋"}, {"subject": "foot", "affirmative": "pied", "negative": "🦶"}, {"subject": "eye", "affirmative": "œil", "negative": "👁️"}, {"subject": "ear", "affirmative": "oreille", "negative": "👂"}, {"subject": "mouth", "affirmative": "bouche", "negative": "👄"}]'::jsonb,
  'example', '{"en": "head", "fr": "tête"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🗣️", "right": "head"}, {"left": "✋", "right": "hand"}, {"left": "🦶", "right": "foot"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🗣️ = ?", "options": ["tête", "pied", "main", "œil"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🗣️ veut dire \"tête\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "✋ = ?", "options": ["pied", "œil", "main", "tête"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "✋ veut dire \"main\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "eye", "right": "œil"}, {"left": "ear", "right": "oreille"}, {"left": "mouth", "right": "bouche"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 6, 'La nourriture de base', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "apple", "affirmative": "pomme", "negative": "🍎"}, {"subject": "bread", "affirmative": "pain", "negative": "🍞"}, {"subject": "water", "affirmative": "eau", "negative": "💧"}, {"subject": "milk", "affirmative": "lait", "negative": "🥛"}, {"subject": "egg", "affirmative": "œuf", "negative": "🥚"}, {"subject": "banana", "affirmative": "banane", "negative": "🍌"}]'::jsonb,
  'example', '{"en": "apple", "fr": "pomme"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍎", "right": "apple"}, {"left": "🍞", "right": "bread"}, {"left": "💧", "right": "water"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🍎 = ?", "options": ["eau", "pain", "lait", "pomme"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍎 veut dire \"pomme\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🍞 = ?", "options": ["lait", "eau", "pomme", "pain"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍞 veut dire \"pain\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "milk", "right": "lait"}, {"left": "egg", "right": "œuf"}, {"left": "banana", "right": "banane"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 7, 'Les vêtements simples', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "shirt", "affirmative": "t-shirt", "negative": "👕"}, {"subject": "shoes", "affirmative": "chaussures", "negative": "👟"}, {"subject": "hat", "affirmative": "casquette", "negative": "🧢"}, {"subject": "socks", "affirmative": "chaussettes", "negative": "🧦"}, {"subject": "dress", "affirmative": "robe", "negative": "👗"}, {"subject": "coat", "affirmative": "manteau", "negative": "🧥"}]'::jsonb,
  'example', '{"en": "shirt", "fr": "t-shirt"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👕", "right": "shirt"}, {"left": "👟", "right": "shoes"}, {"left": "🧢", "right": "hat"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "👕 = ?", "options": ["chaussettes", "chaussures", "t-shirt", "casquette"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👕 veut dire \"t-shirt\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "👟 = ?", "options": ["casquette", "chaussettes", "t-shirt", "chaussures"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "👟 veut dire \"chaussures\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "socks", "right": "chaussettes"}, {"left": "dress", "right": "robe"}, {"left": "coat", "right": "manteau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 8, 'Les objets de la maison', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "table", "affirmative": "table", "negative": "🪑"}, {"subject": "chair", "affirmative": "chaise", "negative": "💺"}, {"subject": "bed", "affirmative": "lit", "negative": "🛏️"}, {"subject": "door", "affirmative": "porte", "negative": "🚪"}, {"subject": "window", "affirmative": "fenêtre", "negative": "🪟"}, {"subject": "key", "affirmative": "clé", "negative": "🔑"}]'::jsonb,
  'example', '{"en": "table", "fr": "table"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🪑", "right": "table"}, {"left": "💺", "right": "chair"}, {"left": "🛏️", "right": "bed"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🪑 = ?", "options": ["table", "chaise", "porte", "lit"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🪑 veut dire \"table\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "💺 = ?", "options": ["porte", "chaise", "lit", "table"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "💺 veut dire \"chaise\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "door", "right": "porte"}, {"left": "window", "right": "fenêtre"}, {"left": "key", "right": "clé"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 9, 'Les jours de la semaine', jsonb_build_object(
  'rule', 'Découvre 7 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "Monday", "affirmative": "lundi", "negative": "1️⃣"}, {"subject": "Tuesday", "affirmative": "mardi", "negative": "2️⃣"}, {"subject": "Wednesday", "affirmative": "mercredi", "negative": "3️⃣"}, {"subject": "Thursday", "affirmative": "jeudi", "negative": "4️⃣"}, {"subject": "Friday", "affirmative": "vendredi", "negative": "5️⃣"}, {"subject": "Saturday", "affirmative": "samedi", "negative": "6️⃣"}, {"subject": "Sunday", "affirmative": "dimanche", "negative": "7️⃣"}]'::jsonb,
  'example', '{"en": "Monday", "fr": "lundi"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "1️⃣", "right": "Monday"}, {"left": "2️⃣", "right": "Tuesday"}, {"left": "3️⃣", "right": "Wednesday"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "1️⃣ = ?", "options": ["mardi", "jeudi", "mercredi", "lundi"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"lundi\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "2️⃣ = ?", "options": ["lundi", "jeudi", "mardi", "mercredi"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"mardi\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "Thursday", "right": "jeudi"}, {"left": "Friday", "right": "vendredi"}, {"left": "Saturday", "right": "samedi"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 10, 'Dire bonjour et merci', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "hello", "affirmative": "bonjour", "negative": "👋"}, {"subject": "goodbye", "affirmative": "au revoir", "negative": "🙋"}, {"subject": "please", "affirmative": "s’il te plait", "negative": "🙏"}, {"subject": "thank you", "affirmative": "merci", "negative": "🙌"}, {"subject": "yes", "affirmative": "oui", "negative": "✅"}, {"subject": "no", "affirmative": "non", "negative": "❌"}]'::jsonb,
  'example', '{"en": "hello", "fr": "bonjour"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👋", "right": "hello"}, {"left": "🙋", "right": "goodbye"}, {"left": "🙏", "right": "please"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "👋 = ?", "options": ["merci", "s’il te plait", "au revoir", "bonjour"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "👋 veut dire \"bonjour\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🙋 = ?", "options": ["au revoir", "bonjour", "s’il te plait", "merci"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🙋 veut dire \"au revoir\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "thank you", "right": "merci"}, {"left": "yes", "right": "oui"}, {"left": "no", "right": "non"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 11, 'Les émotions simples', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "happy", "affirmative": "content", "negative": "😊"}, {"subject": "sad", "affirmative": "triste", "negative": "😢"}, {"subject": "angry", "affirmative": "fâché", "negative": "😠"}, {"subject": "tired", "affirmative": "fatigué", "negative": "😴"}, {"subject": "scared", "affirmative": "effrayé", "negative": "😨"}, {"subject": "surprised", "affirmative": "surpris", "negative": "😮"}]'::jsonb,
  'example', '{"en": "happy", "fr": "content"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "😊", "right": "happy"}, {"left": "😢", "right": "sad"}, {"left": "😠", "right": "angry"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "😊 = ?", "options": ["content", "fâché", "fatigué", "triste"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "😊 veut dire \"content\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "😢 = ?", "options": ["triste", "fatigué", "fâché", "content"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "😢 veut dire \"triste\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "tired", "right": "fatigué"}, {"left": "scared", "right": "effrayé"}, {"left": "surprised", "right": "surpris"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 12, 'La météo simple', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "sun", "affirmative": "soleil", "negative": "☀️"}, {"subject": "rain", "affirmative": "pluie", "negative": "🌧️"}, {"subject": "snow", "affirmative": "neige", "negative": "❄️"}, {"subject": "wind", "affirmative": "vent", "negative": "💨"}, {"subject": "cloud", "affirmative": "nuage", "negative": "☁️"}, {"subject": "hot", "affirmative": "chaud", "negative": "🥵"}]'::jsonb,
  'example', '{"en": "sun", "fr": "soleil"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "☀️", "right": "sun"}, {"left": "🌧️", "right": "rain"}, {"left": "❄️", "right": "snow"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "☀️ = ?", "options": ["pluie", "vent", "neige", "soleil"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "☀️ veut dire \"soleil\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🌧️ = ?", "options": ["neige", "vent", "pluie", "soleil"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🌧️ veut dire \"pluie\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "wind", "right": "vent"}, {"left": "cloud", "right": "nuage"}, {"left": "hot", "right": "chaud"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 13, 'Les moyens de transport', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "car", "affirmative": "voiture", "negative": "🚗"}, {"subject": "bus", "affirmative": "bus", "negative": "🚌"}, {"subject": "train", "affirmative": "train", "negative": "🚂"}, {"subject": "bike", "affirmative": "vélo", "negative": "🚲"}, {"subject": "plane", "affirmative": "avion", "negative": "✈️"}, {"subject": "boat", "affirmative": "bateau", "negative": "⛵"}]'::jsonb,
  'example', '{"en": "car", "fr": "voiture"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🚗", "right": "car"}, {"left": "🚌", "right": "bus"}, {"left": "🚂", "right": "train"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🚗 = ?", "options": ["train", "voiture", "bus", "vélo"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🚗 veut dire \"voiture\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🚌 = ?", "options": ["voiture", "vélo", "bus", "train"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🚌 veut dire \"bus\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "bike", "right": "vélo"}, {"left": "plane", "right": "avion"}, {"left": "boat", "right": "bateau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 14, 'Les tailles et les formes', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "big", "affirmative": "grand", "negative": "🔵"}, {"subject": "small", "affirmative": "petit", "negative": "🔹"}, {"subject": "round", "affirmative": "rond", "negative": "⭕"}, {"subject": "square", "affirmative": "carré", "negative": "🟥"}, {"subject": "long", "affirmative": "long", "negative": "➖"}, {"subject": "short", "affirmative": "court", "negative": "🔸"}]'::jsonb,
  'example', '{"en": "big", "fr": "grand"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔵", "right": "big"}, {"left": "🔹", "right": "small"}, {"left": "⭕", "right": "round"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🔵 = ?", "options": ["carré", "rond", "petit", "grand"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔵 veut dire \"grand\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🔹 = ?", "options": ["grand", "carré", "petit", "rond"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🔹 veut dire \"petit\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "square", "right": "carré"}, {"left": "long", "right": "long"}, {"left": "short", "right": "court"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 15, 'Les actions du quotidien', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "eat", "affirmative": "manger", "negative": "🍽️"}, {"subject": "drink", "affirmative": "boire", "negative": "🥤"}, {"subject": "sleep", "affirmative": "dormir", "negative": "😴"}, {"subject": "play", "affirmative": "jouer", "negative": "🎮"}, {"subject": "run", "affirmative": "courir", "negative": "🏃"}, {"subject": "read", "affirmative": "lire", "negative": "📖"}]'::jsonb,
  'example', '{"en": "eat", "fr": "manger"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍽️", "right": "eat"}, {"left": "🥤", "right": "drink"}, {"left": "😴", "right": "sleep"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🍽️ = ?", "options": ["jouer", "boire", "manger", "dormir"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🍽️ veut dire \"manger\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🥤 = ?", "options": ["boire", "manger", "dormir", "jouer"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🥤 veut dire \"boire\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "play", "right": "jouer"}, {"left": "run", "right": "courir"}, {"left": "read", "right": "lire"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;
