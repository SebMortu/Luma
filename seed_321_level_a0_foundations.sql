-- ============================================
-- LUMA — Nouveau niveau A0 'Fondations' — 15 leçons purement lexicales
-- Aucune terminologie grammaticale, association mot-emoji-traduction uniquement.
-- Options QCM correctement mélangées (pas de biais 'toujours en 1re position').
-- Position 0 : se place avant l'Unité 1 (A1) sans renuméroter l'existant.
-- ============================================


insert into units (language_id, cecr_level, position, title)
select id, 'A0', 0, 'Unité 0 : Fondations' from languages where code = 'en';


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Les couleurs', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'red', 'affirmative', 'rouge', 'negative', '🔴'),jsonb_build_object('subject', 'blue', 'affirmative', 'bleu', 'negative', '🔵'),jsonb_build_object('subject', 'green', 'affirmative', 'vert', 'negative', '🟢'),jsonb_build_object('subject', 'yellow', 'affirmative', 'jaune', 'negative', '🟡'),jsonb_build_object('subject', 'black', 'affirmative', 'noir', 'negative', '⚫'),jsonb_build_object('subject', 'white', 'affirmative', 'blanc', 'negative', '⚪')),
  'example', jsonb_build_object('en', 'red', 'fr', 'rouge')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔴", "right": "red"},{"left": "🔵", "right": "blue"},{"left": "🟢", "right": "green"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🔴 = ?", "options": ["vert", "bleu", "jaune", "rouge"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔴 veut dire \"rouge\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🔵 = ?", "options": ["jaune", "vert", "bleu", "rouge"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🔵 veut dire \"bleu\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "yellow", "right": "jaune"},{"left": "black", "right": "noir"},{"left": "white", "right": "blanc"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Les nombres de 1 à 10', jsonb_build_object(
  'rule', 'Découvre 10 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'one', 'affirmative', 'un', 'negative', '1️⃣'),jsonb_build_object('subject', 'two', 'affirmative', 'deux', 'negative', '2️⃣'),jsonb_build_object('subject', 'three', 'affirmative', 'trois', 'negative', '3️⃣'),jsonb_build_object('subject', 'four', 'affirmative', 'quatre', 'negative', '4️⃣'),jsonb_build_object('subject', 'five', 'affirmative', 'cinq', 'negative', '5️⃣'),jsonb_build_object('subject', 'six', 'affirmative', 'six', 'negative', '6️⃣'),jsonb_build_object('subject', 'seven', 'affirmative', 'sept', 'negative', '7️⃣'),jsonb_build_object('subject', 'eight', 'affirmative', 'huit', 'negative', '8️⃣'),jsonb_build_object('subject', 'nine', 'affirmative', 'neuf', 'negative', '9️⃣'),jsonb_build_object('subject', 'ten', 'affirmative', 'dix', 'negative', '🔟')),
  'example', jsonb_build_object('en', 'one', 'fr', 'un')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "1️⃣", "right": "one"},{"left": "2️⃣", "right": "two"},{"left": "3️⃣", "right": "three"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "1️⃣ = ?", "options": ["deux", "quatre", "trois", "un"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"un\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "2️⃣ = ?", "options": ["un", "trois", "deux", "quatre"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"deux\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "four", "right": "quatre"},{"left": "five", "right": "cinq"},{"left": "six", "right": "six"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Les animaux domestiques', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'dog', 'affirmative', 'chien', 'negative', '🐶'),jsonb_build_object('subject', 'cat', 'affirmative', 'chat', 'negative', '🐱'),jsonb_build_object('subject', 'bird', 'affirmative', 'oiseau', 'negative', '🐦'),jsonb_build_object('subject', 'fish', 'affirmative', 'poisson', 'negative', '🐟'),jsonb_build_object('subject', 'rabbit', 'affirmative', 'lapin', 'negative', '🐰'),jsonb_build_object('subject', 'horse', 'affirmative', 'cheval', 'negative', '🐴')),
  'example', jsonb_build_object('en', 'dog', 'fr', 'chien')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐶", "right": "dog"},{"left": "🐱", "right": "cat"},{"left": "🐦", "right": "bird"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🐶 = ?", "options": ["chat", "oiseau", "poisson", "chien"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐶 veut dire \"chien\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🐱 = ?", "options": ["chien", "poisson", "oiseau", "chat"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐱 veut dire \"chat\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "fish", "right": "poisson"},{"left": "rabbit", "right": "lapin"},{"left": "horse", "right": "cheval"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'La famille proche', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'mom', 'affirmative', 'maman', 'negative', '👩'),jsonb_build_object('subject', 'dad', 'affirmative', 'papa', 'negative', '👨'),jsonb_build_object('subject', 'sister', 'affirmative', 'sœur', 'negative', '👧'),jsonb_build_object('subject', 'brother', 'affirmative', 'frère', 'negative', '👦'),jsonb_build_object('subject', 'baby', 'affirmative', 'bébé', 'negative', '👶'),jsonb_build_object('subject', 'grandma', 'affirmative', 'grand-mère', 'negative', '👵')),
  'example', jsonb_build_object('en', 'mom', 'fr', 'maman')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👩", "right": "mom"},{"left": "👨", "right": "dad"},{"left": "👧", "right": "sister"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "👩 = ?", "options": ["sœur", "papa", "maman", "frère"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👩 veut dire \"maman\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "👨 = ?", "options": ["maman", "frère", "papa", "sœur"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👨 veut dire \"papa\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "brother", "right": "frère"},{"left": "baby", "right": "bébé"},{"left": "grandma", "right": "grand-mère"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 5, 'Le corps', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'head', 'affirmative', 'tête', 'negative', '🗣️'),jsonb_build_object('subject', 'hand', 'affirmative', 'main', 'negative', '✋'),jsonb_build_object('subject', 'foot', 'affirmative', 'pied', 'negative', '🦶'),jsonb_build_object('subject', 'eye', 'affirmative', 'œil', 'negative', '👁️'),jsonb_build_object('subject', 'ear', 'affirmative', 'oreille', 'negative', '👂'),jsonb_build_object('subject', 'mouth', 'affirmative', 'bouche', 'negative', '👄')),
  'example', jsonb_build_object('en', 'head', 'fr', 'tête')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🗣️", "right": "head"},{"left": "✋", "right": "hand"},{"left": "🦶", "right": "foot"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🗣️ = ?", "options": ["tête", "pied", "main", "œil"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🗣️ veut dire \"tête\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "✋ = ?", "options": ["pied", "œil", "main", "tête"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "✋ veut dire \"main\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "eye", "right": "œil"},{"left": "ear", "right": "oreille"},{"left": "mouth", "right": "bouche"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 6, 'La nourriture de base', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'apple', 'affirmative', 'pomme', 'negative', '🍎'),jsonb_build_object('subject', 'bread', 'affirmative', 'pain', 'negative', '🍞'),jsonb_build_object('subject', 'water', 'affirmative', 'eau', 'negative', '💧'),jsonb_build_object('subject', 'milk', 'affirmative', 'lait', 'negative', '🥛'),jsonb_build_object('subject', 'egg', 'affirmative', 'œuf', 'negative', '🥚'),jsonb_build_object('subject', 'banana', 'affirmative', 'banane', 'negative', '🍌')),
  'example', jsonb_build_object('en', 'apple', 'fr', 'pomme')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍎", "right": "apple"},{"left": "🍞", "right": "bread"},{"left": "💧", "right": "water"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🍎 = ?", "options": ["eau", "pain", "lait", "pomme"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍎 veut dire \"pomme\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🍞 = ?", "options": ["lait", "eau", "pomme", "pain"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍞 veut dire \"pain\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "milk", "right": "lait"},{"left": "egg", "right": "œuf"},{"left": "banana", "right": "banane"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 7, 'Les vêtements simples', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'shirt', 'affirmative', 't-shirt', 'negative', '👕'),jsonb_build_object('subject', 'shoes', 'affirmative', 'chaussures', 'negative', '👟'),jsonb_build_object('subject', 'hat', 'affirmative', 'casquette', 'negative', '🧢'),jsonb_build_object('subject', 'socks', 'affirmative', 'chaussettes', 'negative', '🧦'),jsonb_build_object('subject', 'dress', 'affirmative', 'robe', 'negative', '👗'),jsonb_build_object('subject', 'coat', 'affirmative', 'manteau', 'negative', '🧥')),
  'example', jsonb_build_object('en', 'shirt', 'fr', 't-shirt')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👕", "right": "shirt"},{"left": "👟", "right": "shoes"},{"left": "🧢", "right": "hat"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "👕 = ?", "options": ["chaussettes", "chaussures", "t-shirt", "casquette"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👕 veut dire \"t-shirt\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "👟 = ?", "options": ["casquette", "chaussettes", "t-shirt", "chaussures"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "👟 veut dire \"chaussures\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "socks", "right": "chaussettes"},{"left": "dress", "right": "robe"},{"left": "coat", "right": "manteau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 8, 'Les objets de la maison', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'table', 'affirmative', 'table', 'negative', '🪑'),jsonb_build_object('subject', 'chair', 'affirmative', 'chaise', 'negative', '💺'),jsonb_build_object('subject', 'bed', 'affirmative', 'lit', 'negative', '🛏️'),jsonb_build_object('subject', 'door', 'affirmative', 'porte', 'negative', '🚪'),jsonb_build_object('subject', 'window', 'affirmative', 'fenêtre', 'negative', '🪟'),jsonb_build_object('subject', 'key', 'affirmative', 'clé', 'negative', '🔑')),
  'example', jsonb_build_object('en', 'table', 'fr', 'table')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🪑", "right": "table"},{"left": "💺", "right": "chair"},{"left": "🛏️", "right": "bed"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🪑 = ?", "options": ["table", "chaise", "porte", "lit"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🪑 veut dire \"table\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "💺 = ?", "options": ["porte", "chaise", "lit", "table"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "💺 veut dire \"chaise\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "door", "right": "porte"},{"left": "window", "right": "fenêtre"},{"left": "key", "right": "clé"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 9, 'Les jours de la semaine', jsonb_build_object(
  'rule', 'Découvre 7 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'Monday', 'affirmative', 'lundi', 'negative', '1️⃣'),jsonb_build_object('subject', 'Tuesday', 'affirmative', 'mardi', 'negative', '2️⃣'),jsonb_build_object('subject', 'Wednesday', 'affirmative', 'mercredi', 'negative', '3️⃣'),jsonb_build_object('subject', 'Thursday', 'affirmative', 'jeudi', 'negative', '4️⃣'),jsonb_build_object('subject', 'Friday', 'affirmative', 'vendredi', 'negative', '5️⃣'),jsonb_build_object('subject', 'Saturday', 'affirmative', 'samedi', 'negative', '6️⃣'),jsonb_build_object('subject', 'Sunday', 'affirmative', 'dimanche', 'negative', '7️⃣')),
  'example', jsonb_build_object('en', 'Monday', 'fr', 'lundi')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "1️⃣", "right": "Monday"},{"left": "2️⃣", "right": "Tuesday"},{"left": "3️⃣", "right": "Wednesday"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "1️⃣ = ?", "options": ["mardi", "jeudi", "mercredi", "lundi"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"lundi\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "2️⃣ = ?", "options": ["lundi", "jeudi", "mardi", "mercredi"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"mardi\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "Thursday", "right": "jeudi"},{"left": "Friday", "right": "vendredi"},{"left": "Saturday", "right": "samedi"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 10, 'Dire bonjour et merci', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'hello', 'affirmative', 'bonjour', 'negative', '👋'),jsonb_build_object('subject', 'goodbye', 'affirmative', 'au revoir', 'negative', '🙋'),jsonb_build_object('subject', 'please', 'affirmative', 's''il te plaît', 'negative', '🙏'),jsonb_build_object('subject', 'thank you', 'affirmative', 'merci', 'negative', '🙌'),jsonb_build_object('subject', 'yes', 'affirmative', 'oui', 'negative', '✅'),jsonb_build_object('subject', 'no', 'affirmative', 'non', 'negative', '❌')),
  'example', jsonb_build_object('en', 'hello', 'fr', 'bonjour')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👋", "right": "hello"},{"left": "🙋", "right": "goodbye"},{"left": "🙏", "right": "please"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "👋 = ?", "options": ["merci", "s'il te plaît", "au revoir", "bonjour"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "👋 veut dire \"bonjour\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🙋 = ?", "options": ["au revoir", "bonjour", "s'il te plaît", "merci"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🙋 veut dire \"au revoir\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "thank you", "right": "merci"},{"left": "yes", "right": "oui"},{"left": "no", "right": "non"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 11, 'Les émotions simples', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'happy', 'affirmative', 'content', 'negative', '😊'),jsonb_build_object('subject', 'sad', 'affirmative', 'triste', 'negative', '😢'),jsonb_build_object('subject', 'angry', 'affirmative', 'fâché', 'negative', '😠'),jsonb_build_object('subject', 'tired', 'affirmative', 'fatigué', 'negative', '😴'),jsonb_build_object('subject', 'scared', 'affirmative', 'effrayé', 'negative', '😨'),jsonb_build_object('subject', 'surprised', 'affirmative', 'surpris', 'negative', '😮')),
  'example', jsonb_build_object('en', 'happy', 'fr', 'content')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "😊", "right": "happy"},{"left": "😢", "right": "sad"},{"left": "😠", "right": "angry"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "😊 = ?", "options": ["content", "fâché", "fatigué", "triste"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "😊 veut dire \"content\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "😢 = ?", "options": ["triste", "fatigué", "fâché", "content"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "😢 veut dire \"triste\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "tired", "right": "fatigué"},{"left": "scared", "right": "effrayé"},{"left": "surprised", "right": "surpris"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 12, 'La météo simple', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'sun', 'affirmative', 'soleil', 'negative', '☀️'),jsonb_build_object('subject', 'rain', 'affirmative', 'pluie', 'negative', '🌧️'),jsonb_build_object('subject', 'snow', 'affirmative', 'neige', 'negative', '❄️'),jsonb_build_object('subject', 'wind', 'affirmative', 'vent', 'negative', '💨'),jsonb_build_object('subject', 'cloud', 'affirmative', 'nuage', 'negative', '☁️'),jsonb_build_object('subject', 'hot', 'affirmative', 'chaud', 'negative', '🥵')),
  'example', jsonb_build_object('en', 'sun', 'fr', 'soleil')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "☀️", "right": "sun"},{"left": "🌧️", "right": "rain"},{"left": "❄️", "right": "snow"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "☀️ = ?", "options": ["pluie", "vent", "neige", "soleil"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "☀️ veut dire \"soleil\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🌧️ = ?", "options": ["neige", "vent", "pluie", "soleil"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🌧️ veut dire \"pluie\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "wind", "right": "vent"},{"left": "cloud", "right": "nuage"},{"left": "hot", "right": "chaud"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 13, 'Les moyens de transport', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'car', 'affirmative', 'voiture', 'negative', '🚗'),jsonb_build_object('subject', 'bus', 'affirmative', 'bus', 'negative', '🚌'),jsonb_build_object('subject', 'train', 'affirmative', 'train', 'negative', '🚂'),jsonb_build_object('subject', 'bike', 'affirmative', 'vélo', 'negative', '🚲'),jsonb_build_object('subject', 'plane', 'affirmative', 'avion', 'negative', '✈️'),jsonb_build_object('subject', 'boat', 'affirmative', 'bateau', 'negative', '⛵')),
  'example', jsonb_build_object('en', 'car', 'fr', 'voiture')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🚗", "right": "car"},{"left": "🚌", "right": "bus"},{"left": "🚂", "right": "train"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🚗 = ?", "options": ["train", "voiture", "bus", "vélo"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🚗 veut dire \"voiture\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🚌 = ?", "options": ["voiture", "vélo", "bus", "train"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🚌 veut dire \"bus\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "bike", "right": "vélo"},{"left": "plane", "right": "avion"},{"left": "boat", "right": "bateau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 14, 'Les tailles et les formes', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'big', 'affirmative', 'grand', 'negative', '🔵'),jsonb_build_object('subject', 'small', 'affirmative', 'petit', 'negative', '🔹'),jsonb_build_object('subject', 'round', 'affirmative', 'rond', 'negative', '⭕'),jsonb_build_object('subject', 'square', 'affirmative', 'carré', 'negative', '🟥'),jsonb_build_object('subject', 'long', 'affirmative', 'long', 'negative', '➖'),jsonb_build_object('subject', 'short', 'affirmative', 'court', 'negative', '🔸')),
  'example', jsonb_build_object('en', 'big', 'fr', 'grand')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔵", "right": "big"},{"left": "🔹", "right": "small"},{"left": "⭕", "right": "round"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🔵 = ?", "options": ["carré", "rond", "petit", "grand"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔵 veut dire \"grand\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🔹 = ?", "options": ["grand", "carré", "petit", "rond"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🔹 veut dire \"petit\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "square", "right": "carré"},{"left": "long", "right": "long"},{"left": "short", "right": "court"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 15, 'Les actions du quotidien', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', jsonb_build_array(jsonb_build_object('subject', 'eat', 'affirmative', 'manger', 'negative', '🍽️'),jsonb_build_object('subject', 'drink', 'affirmative', 'boire', 'negative', '🥤'),jsonb_build_object('subject', 'sleep', 'affirmative', 'dormir', 'negative', '😴'),jsonb_build_object('subject', 'play', 'affirmative', 'jouer', 'negative', '🎮'),jsonb_build_object('subject', 'run', 'affirmative', 'courir', 'negative', '🏃'),jsonb_build_object('subject', 'read', 'affirmative', 'lire', 'negative', '📖')),
  'example', jsonb_build_object('en', 'eat', 'fr', 'manger')
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15)
insert into exercises (lesson_id, type, position, content)
select l.id, 'matching', 1, '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍽️", "right": "eat"},{"left": "🥤", "right": "drink"},{"left": "😴", "right": "sleep"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'::jsonb from l
union all
select l.id, 'qcm', 2, '{"question": "🍽️ = ?", "options": ["jouer", "boire", "manger", "dormir"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🍽️ veut dire \"manger\"."}'::jsonb from l
union all
select l.id, 'qcm', 3, '{"question": "🥤 = ?", "options": ["boire", "manger", "dormir", "jouer"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🥤 veut dire \"boire\"."}'::jsonb from l
union all
select l.id, 'matching', 4, '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "play", "right": "jouer"},{"left": "run", "right": "courir"},{"left": "read", "right": "lire"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'::jsonb from l;
