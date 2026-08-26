-- ============================================
-- LUMA — Extension du niveau A0 'Fondations' — 15 nouvelles leçons (31 à 45)
-- ============================================


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 31, 'Les animaux de la ferme', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "cow", "affirmative": "vache", "negative": "🐄"}, {"subject": "pig", "affirmative": "cochon", "negative": "🐷"}, {"subject": "sheep", "affirmative": "mouton", "negative": "🐑"}, {"subject": "chicken", "affirmative": "poule", "negative": "🐔"}, {"subject": "duck", "affirmative": "canard", "negative": "🦆"}, {"subject": "goat", "affirmative": "chèvre", "negative": "🐐"}]'::jsonb,
  'example', '{"en": "cow", "fr": "vache"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 31)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐄", "right": "cow"}, {"left": "🐷", "right": "pig"}, {"left": "🐑", "right": "sheep"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐔", "right": "chicken"}, {"left": "🦆", "right": "duck"}, {"left": "🐐", "right": "goat"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🐄 = ?", "options": ["chicken", "cow", "pig", "goat"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🐄 veut dire \"cow\"."}'),(4, 'qcm', '{"question": "🐷 = ?", "options": ["cow", "goat", "chicken", "pig"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐷 veut dire \"pig\"."}'),(5, 'qcm', '{"question": "🐑 = ?", "options": ["cow", "chicken", "sheep", "pig"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐑 veut dire \"sheep\"."}'),(6, 'qcm', '{"question": "🐔 = ?", "options": ["sheep", "pig", "cow", "chicken"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐔 veut dire \"chicken\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "cow", "right": "vache"}, {"left": "pig", "right": "cochon"}, {"left": "sheep", "right": "mouton"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "chicken", "right": "poule"}, {"left": "duck", "right": "canard"}, {"left": "goat", "right": "chèvre"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 32, 'Les animaux sauvages', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "lion", "affirmative": "lion", "negative": "🦁"}, {"subject": "elephant", "affirmative": "éléphant", "negative": "🐘"}, {"subject": "monkey", "affirmative": "singe", "negative": "🐒"}, {"subject": "bear", "affirmative": "ours", "negative": "🐻"}, {"subject": "tiger", "affirmative": "tigre", "negative": "🐯"}, {"subject": "zebra", "affirmative": "zèbre", "negative": "🦓"}]'::jsonb,
  'example', '{"en": "lion", "fr": "lion"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 32)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🦁", "right": "lion"}, {"left": "🐘", "right": "elephant"}, {"left": "🐒", "right": "monkey"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐻", "right": "bear"}, {"left": "🐯", "right": "tiger"}, {"left": "🦓", "right": "zebra"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🦁 = ?", "options": ["monkey", "tiger", "zebra", "lion"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🦁 veut dire \"lion\"."}'),(4, 'qcm', '{"question": "🐘 = ?", "options": ["zebra", "elephant", "lion", "bear"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🐘 veut dire \"elephant\"."}'),(5, 'qcm', '{"question": "🐒 = ?", "options": ["bear", "tiger", "zebra", "monkey"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐒 veut dire \"monkey\"."}'),(6, 'qcm', '{"question": "🐻 = ?", "options": ["elephant", "monkey", "bear", "tiger"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐻 veut dire \"bear\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "lion", "right": "lion"}, {"left": "elephant", "right": "éléphant"}, {"left": "monkey", "right": "singe"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "bear", "right": "ours"}, {"left": "tiger", "right": "tigre"}, {"left": "zebra", "right": "zèbre"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 33, 'Les oiseaux', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "owl", "affirmative": "hibou", "negative": "🦉"}, {"subject": "eagle", "affirmative": "aigle", "negative": "🦅"}, {"subject": "parrot", "affirmative": "perroquet", "negative": "🦜"}, {"subject": "penguin", "affirmative": "pingouin", "negative": "🐧"}, {"subject": "swan", "affirmative": "cygne", "negative": "🦢"}, {"subject": "flamingo", "affirmative": "flamant rose", "negative": "🦩"}]'::jsonb,
  'example', '{"en": "owl", "fr": "hibou"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 33)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🦉", "right": "owl"}, {"left": "🦅", "right": "eagle"}, {"left": "🦜", "right": "parrot"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐧", "right": "penguin"}, {"left": "🦢", "right": "swan"}, {"left": "🦩", "right": "flamingo"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🦉 = ?", "options": ["owl", "eagle", "penguin", "flamingo"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🦉 veut dire \"owl\"."}'),(4, 'qcm', '{"question": "🦅 = ?", "options": ["owl", "flamingo", "parrot", "eagle"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🦅 veut dire \"eagle\"."}'),(5, 'qcm', '{"question": "🦜 = ?", "options": ["parrot", "eagle", "flamingo", "penguin"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🦜 veut dire \"parrot\"."}'),(6, 'qcm', '{"question": "🐧 = ?", "options": ["penguin", "swan", "eagle", "parrot"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🐧 veut dire \"penguin\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "owl", "right": "hibou"}, {"left": "eagle", "right": "aigle"}, {"left": "parrot", "right": "perroquet"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "penguin", "right": "pingouin"}, {"left": "swan", "right": "cygne"}, {"left": "flamingo", "right": "flamant rose"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 34, 'Les animaux marins', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "shark", "affirmative": "requin", "negative": "🦈"}, {"subject": "dolphin", "affirmative": "dauphin", "negative": "🐬"}, {"subject": "crab", "affirmative": "crabe", "negative": "🦀"}, {"subject": "octopus", "affirmative": "poulpe", "negative": "🐙"}, {"subject": "whale", "affirmative": "baleine", "negative": "🐳"}, {"subject": "turtle", "affirmative": "tortue", "negative": "🐢"}]'::jsonb,
  'example', '{"en": "shark", "fr": "requin"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 34)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🦈", "right": "shark"}, {"left": "🐬", "right": "dolphin"}, {"left": "🦀", "right": "crab"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐙", "right": "octopus"}, {"left": "🐳", "right": "whale"}, {"left": "🐢", "right": "turtle"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🦈 = ?", "options": ["dolphin", "whale", "shark", "crab"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🦈 veut dire \"shark\"."}'),(4, 'qcm', '{"question": "🐬 = ?", "options": ["turtle", "dolphin", "shark", "crab"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🐬 veut dire \"dolphin\"."}'),(5, 'qcm', '{"question": "🦀 = ?", "options": ["whale", "crab", "octopus", "dolphin"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🦀 veut dire \"crab\"."}'),(6, 'qcm', '{"question": "🐙 = ?", "options": ["octopus", "shark", "whale", "crab"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🐙 veut dire \"octopus\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "shark", "right": "requin"}, {"left": "dolphin", "right": "dauphin"}, {"left": "crab", "right": "crabe"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "octopus", "right": "poulpe"}, {"left": "whale", "right": "baleine"}, {"left": "turtle", "right": "tortue"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 35, 'Les insectes', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "bee", "affirmative": "abeille", "negative": "🐝"}, {"subject": "butterfly", "affirmative": "papillon", "negative": "🦋"}, {"subject": "ant", "affirmative": "fourmi", "negative": "🐜"}, {"subject": "spider", "affirmative": "araignée", "negative": "🕷️"}, {"subject": "ladybug", "affirmative": "coccinelle", "negative": "🐞"}, {"subject": "fly", "affirmative": "mouche", "negative": "🪰"}]'::jsonb,
  'example', '{"en": "bee", "fr": "abeille"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 35)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🐝", "right": "bee"}, {"left": "🦋", "right": "butterfly"}, {"left": "🐜", "right": "ant"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🕷️", "right": "spider"}, {"left": "🐞", "right": "ladybug"}, {"left": "🪰", "right": "fly"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🐝 = ?", "options": ["fly", "ladybug", "bee", "ant"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐝 veut dire \"bee\"."}'),(4, 'qcm', '{"question": "🦋 = ?", "options": ["spider", "butterfly", "ladybug", "bee"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🦋 veut dire \"butterfly\"."}'),(5, 'qcm', '{"question": "🐜 = ?", "options": ["ant", "bee", "fly", "spider"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🐜 veut dire \"ant\"."}'),(6, 'qcm', '{"question": "🕷️ = ?", "options": ["spider", "ant", "ladybug", "fly"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🕷️ veut dire \"spider\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "bee", "right": "abeille"}, {"left": "butterfly", "right": "papillon"}, {"left": "ant", "right": "fourmi"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "spider", "right": "araignée"}, {"left": "ladybug", "right": "coccinelle"}, {"left": "fly", "right": "mouche"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 36, 'La technologie', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "phone", "affirmative": "téléphone", "negative": "📱"}, {"subject": "computer", "affirmative": "ordinateur", "negative": "💻"}, {"subject": "television", "affirmative": "télévision", "negative": "📺"}, {"subject": "camera", "affirmative": "appareil photo", "negative": "📷"}, {"subject": "headphones", "affirmative": "écouteurs", "negative": "🎧"}, {"subject": "clock", "affirmative": "horloge", "negative": "⏰"}]'::jsonb,
  'example', '{"en": "phone", "fr": "téléphone"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 36)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "📱", "right": "phone"}, {"left": "💻", "right": "computer"}, {"left": "📺", "right": "television"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "📷", "right": "camera"}, {"left": "🎧", "right": "headphones"}, {"left": "⏰", "right": "clock"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "📱 = ?", "options": ["camera", "television", "phone", "computer"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "📱 veut dire \"phone\"."}'),(4, 'qcm', '{"question": "💻 = ?", "options": ["computer", "clock", "camera", "phone"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "💻 veut dire \"computer\"."}'),(5, 'qcm', '{"question": "📺 = ?", "options": ["clock", "camera", "television", "phone"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "📺 veut dire \"television\"."}'),(6, 'qcm', '{"question": "📷 = ?", "options": ["clock", "computer", "television", "camera"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "📷 veut dire \"camera\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "phone", "right": "téléphone"}, {"left": "computer", "right": "ordinateur"}, {"left": "television", "right": "télévision"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "camera", "right": "appareil photo"}, {"left": "headphones", "right": "écouteurs"}, {"left": "clock", "right": "horloge"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 37, 'Les mois de l''année', jsonb_build_object(
  'rule', 'Découvre 12 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "January", "affirmative": "janvier", "negative": "1️⃣"}, {"subject": "February", "affirmative": "février", "negative": "2️⃣"}, {"subject": "March", "affirmative": "mars", "negative": "3️⃣"}, {"subject": "April", "affirmative": "avril", "negative": "4️⃣"}, {"subject": "May", "affirmative": "mai", "negative": "5️⃣"}, {"subject": "June", "affirmative": "juin", "negative": "6️⃣"}, {"subject": "July", "affirmative": "juillet", "negative": "7️⃣"}, {"subject": "August", "affirmative": "août", "negative": "8️⃣"}, {"subject": "September", "affirmative": "septembre", "negative": "9️⃣"}, {"subject": "October", "affirmative": "octobre", "negative": "🔟"}, {"subject": "November", "affirmative": "novembre", "negative": "11"}, {"subject": "December", "affirmative": "décembre", "negative": "12"}]'::jsonb,
  'example', '{"en": "January", "fr": "janvier"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 37)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "1️⃣", "right": "January"}, {"left": "2️⃣", "right": "February"}, {"left": "3️⃣", "right": "March"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "4️⃣", "right": "April"}, {"left": "5️⃣", "right": "May"}, {"left": "6️⃣", "right": "June"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "7️⃣", "right": "July"}, {"left": "8️⃣", "right": "August"}, {"left": "9️⃣", "right": "September"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(4, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔟", "right": "October"}, {"left": "11", "right": "November"}, {"left": "12", "right": "December"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(5, 'qcm', '{"question": "1️⃣ = ?", "options": ["August", "January", "May", "February"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"January\"."}'),(6, 'qcm', '{"question": "2️⃣ = ?", "options": ["November", "September", "March", "February"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"February\"."}'),(7, 'qcm', '{"question": "3️⃣ = ?", "options": ["January", "March", "September", "December"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "3️⃣ veut dire \"March\"."}'),(8, 'qcm', '{"question": "4️⃣ = ?", "options": ["March", "April", "May", "February"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "4️⃣ veut dire \"April\"."}'),(9, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "January", "right": "janvier"}, {"left": "February", "right": "février"}, {"left": "March", "right": "mars"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(10, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "April", "right": "avril"}, {"left": "May", "right": "mai"}, {"left": "June", "right": "juin"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(11, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "July", "right": "juillet"}, {"left": "August", "right": "août"}, {"left": "September", "right": "septembre"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(12, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "October", "right": "octobre"}, {"left": "November", "right": "novembre"}, {"left": "December", "right": "décembre"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 38, 'Les moments de la journée', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "morning", "affirmative": "matin", "negative": "🌅"}, {"subject": "afternoon", "affirmative": "après-midi", "negative": "☀️"}, {"subject": "evening", "affirmative": "soir", "negative": "🌆"}, {"subject": "night", "affirmative": "nuit", "negative": "🌙"}, {"subject": "noon", "affirmative": "midi", "negative": "🕛"}, {"subject": "midnight", "affirmative": "minuit", "negative": "🌃"}]'::jsonb,
  'example', '{"en": "morning", "fr": "matin"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 38)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🌅", "right": "morning"}, {"left": "☀️", "right": "afternoon"}, {"left": "🌆", "right": "evening"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🌙", "right": "night"}, {"left": "🕛", "right": "noon"}, {"left": "🌃", "right": "midnight"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🌅 = ?", "options": ["midnight", "evening", "noon", "morning"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🌅 veut dire \"morning\"."}'),(4, 'qcm', '{"question": "☀️ = ?", "options": ["evening", "afternoon", "noon", "night"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "☀️ veut dire \"afternoon\"."}'),(5, 'qcm', '{"question": "🌆 = ?", "options": ["morning", "afternoon", "evening", "night"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🌆 veut dire \"evening\"."}'),(6, 'qcm', '{"question": "🌙 = ?", "options": ["afternoon", "noon", "evening", "night"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🌙 veut dire \"night\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "morning", "right": "matin"}, {"left": "afternoon", "right": "après-midi"}, {"left": "evening", "right": "soir"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "night", "right": "nuit"}, {"left": "noon", "right": "midi"}, {"left": "midnight", "right": "minuit"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 39, 'Les fêtes et célébrations', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "birthday", "affirmative": "anniversaire", "negative": "🎂"}, {"subject": "Christmas", "affirmative": "Noël", "negative": "🎄"}, {"subject": "party", "affirmative": "fête", "negative": "🎉"}, {"subject": "present", "affirmative": "cadeau", "negative": "🎁"}, {"subject": "balloon", "affirmative": "ballon", "negative": "🎈"}, {"subject": "fireworks", "affirmative": "feu d''artifice", "negative": "🎆"}]'::jsonb,
  'example', '{"en": "birthday", "fr": "anniversaire"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 39)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🎂", "right": "birthday"}, {"left": "🎄", "right": "Christmas"}, {"left": "🎉", "right": "party"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🎁", "right": "present"}, {"left": "🎈", "right": "balloon"}, {"left": "🎆", "right": "fireworks"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🎂 = ?", "options": ["party", "Christmas", "birthday", "present"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🎂 veut dire \"birthday\"."}'),(4, 'qcm', '{"question": "🎄 = ?", "options": ["birthday", "fireworks", "party", "Christmas"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🎄 veut dire \"Christmas\"."}'),(5, 'qcm', '{"question": "🎉 = ?", "options": ["party", "present", "birthday", "fireworks"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🎉 veut dire \"party\"."}'),(6, 'qcm', '{"question": "🎁 = ?", "options": ["present", "birthday", "fireworks", "party"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🎁 veut dire \"present\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "birthday", "right": "anniversaire"}, {"left": "Christmas", "right": "Noël"}, {"left": "party", "right": "fête"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "present", "right": "cadeau"}, {"left": "balloon", "right": "ballon"}, {"left": "fireworks", "right": "feu d''artifice"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 40, 'Les outils', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "hammer", "affirmative": "marteau", "negative": "🔨"}, {"subject": "screwdriver", "affirmative": "tournevis", "negative": "🪛"}, {"subject": "scissors", "affirmative": "ciseaux", "negative": "✂️"}, {"subject": "ladder", "affirmative": "échelle", "negative": "🪜"}, {"subject": "paintbrush", "affirmative": "pinceau", "negative": "🖌️"}, {"subject": "nail", "affirmative": "clou", "negative": "🔩"}]'::jsonb,
  'example', '{"en": "hammer", "fr": "marteau"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 40)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔨", "right": "hammer"}, {"left": "🪛", "right": "screwdriver"}, {"left": "✂️", "right": "scissors"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🪜", "right": "ladder"}, {"left": "🖌️", "right": "paintbrush"}, {"left": "🔩", "right": "nail"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🔨 = ?", "options": ["hammer", "scissors", "paintbrush", "ladder"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🔨 veut dire \"hammer\"."}'),(4, 'qcm', '{"question": "🪛 = ?", "options": ["ladder", "nail", "paintbrush", "screwdriver"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🪛 veut dire \"screwdriver\"."}'),(5, 'qcm', '{"question": "✂️ = ?", "options": ["screwdriver", "hammer", "ladder", "scissors"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "✂️ veut dire \"scissors\"."}'),(6, 'qcm', '{"question": "🪜 = ?", "options": ["paintbrush", "nail", "ladder", "hammer"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🪜 veut dire \"ladder\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "hammer", "right": "marteau"}, {"left": "screwdriver", "right": "tournevis"}, {"left": "scissors", "right": "ciseaux"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "ladder", "right": "échelle"}, {"left": "paintbrush", "right": "pinceau"}, {"left": "nail", "right": "clou"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 41, 'Les instruments de musique', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "guitar", "affirmative": "guitare", "negative": "🎸"}, {"subject": "piano", "affirmative": "piano", "negative": "🎹"}, {"subject": "drums", "affirmative": "batterie", "negative": "🥁"}, {"subject": "violin", "affirmative": "violon", "negative": "🎻"}, {"subject": "trumpet", "affirmative": "trompette", "negative": "🎺"}, {"subject": "microphone", "affirmative": "microphone", "negative": "🎤"}]'::jsonb,
  'example', '{"en": "guitar", "fr": "guitare"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 41)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🎸", "right": "guitar"}, {"left": "🎹", "right": "piano"}, {"left": "🥁", "right": "drums"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🎻", "right": "violin"}, {"left": "🎺", "right": "trumpet"}, {"left": "🎤", "right": "microphone"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🎸 = ?", "options": ["guitar", "piano", "trumpet", "drums"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🎸 veut dire \"guitar\"."}'),(4, 'qcm', '{"question": "🎹 = ?", "options": ["piano", "violin", "guitar", "microphone"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🎹 veut dire \"piano\"."}'),(5, 'qcm', '{"question": "🥁 = ?", "options": ["drums", "piano", "guitar", "trumpet"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🥁 veut dire \"drums\"."}'),(6, 'qcm', '{"question": "🎻 = ?", "options": ["violin", "trumpet", "microphone", "drums"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🎻 veut dire \"violin\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "guitar", "right": "guitare"}, {"left": "piano", "right": "piano"}, {"left": "drums", "right": "batterie"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "violin", "right": "violon"}, {"left": "trumpet", "right": "trompette"}, {"left": "microphone", "right": "microphone"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 42, 'Les matières scolaires', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "math", "affirmative": "mathématiques", "negative": "🔢"}, {"subject": "science", "affirmative": "sciences", "negative": "🔬"}, {"subject": "art", "affirmative": "arts plastiques", "negative": "🎨"}, {"subject": "music", "affirmative": "musique", "negative": "🎵"}, {"subject": "history", "affirmative": "histoire", "negative": "📜"}, {"subject": "geography", "affirmative": "géographie", "negative": "🗺️"}]'::jsonb,
  'example', '{"en": "math", "fr": "mathématiques"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 42)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔢", "right": "math"}, {"left": "🔬", "right": "science"}, {"left": "🎨", "right": "art"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🎵", "right": "music"}, {"left": "📜", "right": "history"}, {"left": "🗺️", "right": "geography"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🔢 = ?", "options": ["math", "art", "history", "music"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🔢 veut dire \"math\"."}'),(4, 'qcm', '{"question": "🔬 = ?", "options": ["music", "math", "geography", "science"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔬 veut dire \"science\"."}'),(5, 'qcm', '{"question": "🎨 = ?", "options": ["science", "math", "art", "geography"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🎨 veut dire \"art\"."}'),(6, 'qcm', '{"question": "🎵 = ?", "options": ["history", "music", "art", "science"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🎵 veut dire \"music\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "math", "right": "mathématiques"}, {"left": "science", "right": "sciences"}, {"left": "art", "right": "arts plastiques"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "music", "right": "musique"}, {"left": "history", "right": "histoire"}, {"left": "geography", "right": "géographie"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 43, 'Les loisirs', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "reading", "affirmative": "lecture", "negative": "📚"}, {"subject": "painting", "affirmative": "peinture", "negative": "🎨"}, {"subject": "cooking", "affirmative": "cuisine", "negative": "🍳"}, {"subject": "gardening", "affirmative": "jardinage", "negative": "🌱"}, {"subject": "fishing", "affirmative": "pêche", "negative": "🎣"}, {"subject": "camping", "affirmative": "camping", "negative": "🏕️"}]'::jsonb,
  'example', '{"en": "reading", "fr": "lecture"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 43)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "📚", "right": "reading"}, {"left": "🎨", "right": "painting"}, {"left": "🍳", "right": "cooking"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🌱", "right": "gardening"}, {"left": "🎣", "right": "fishing"}, {"left": "🏕️", "right": "camping"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "📚 = ?", "options": ["gardening", "painting", "camping", "reading"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "📚 veut dire \"reading\"."}'),(4, 'qcm', '{"question": "🎨 = ?", "options": ["painting", "fishing", "gardening", "camping"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🎨 veut dire \"painting\"."}'),(5, 'qcm', '{"question": "🍳 = ?", "options": ["reading", "cooking", "fishing", "camping"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🍳 veut dire \"cooking\"."}'),(6, 'qcm', '{"question": "🌱 = ?", "options": ["gardening", "cooking", "fishing", "painting"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🌱 veut dire \"gardening\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "reading", "right": "lecture"}, {"left": "painting", "right": "peinture"}, {"left": "cooking", "right": "cuisine"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "gardening", "right": "jardinage"}, {"left": "fishing", "right": "pêche"}, {"left": "camping", "right": "camping"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 44, 'La météo (suite)', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "rainbow", "affirmative": "arc-en-ciel", "negative": "🌈"}, {"subject": "storm", "affirmative": "orage", "negative": "⛈️"}, {"subject": "fog", "affirmative": "brouillard", "negative": "🌫️"}, {"subject": "lightning", "affirmative": "éclair", "negative": "⚡"}, {"subject": "thunder", "affirmative": "tonnerre", "negative": "🌩️"}, {"subject": "humid", "affirmative": "humide", "negative": "💦"}]'::jsonb,
  'example', '{"en": "rainbow", "fr": "arc-en-ciel"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 44)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🌈", "right": "rainbow"}, {"left": "⛈️", "right": "storm"}, {"left": "🌫️", "right": "fog"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "⚡", "right": "lightning"}, {"left": "🌩️", "right": "thunder"}, {"left": "💦", "right": "humid"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🌈 = ?", "options": ["rainbow", "humid", "fog", "thunder"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🌈 veut dire \"rainbow\"."}'),(4, 'qcm', '{"question": "⛈️ = ?", "options": ["storm", "humid", "thunder", "lightning"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "⛈️ veut dire \"storm\"."}'),(5, 'qcm', '{"question": "🌫️ = ?", "options": ["rainbow", "humid", "fog", "lightning"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🌫️ veut dire \"fog\"."}'),(6, 'qcm', '{"question": "⚡ = ?", "options": ["thunder", "lightning", "fog", "rainbow"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "⚡ veut dire \"lightning\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "rainbow", "right": "arc-en-ciel"}, {"left": "storm", "right": "orage"}, {"left": "fog", "right": "brouillard"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "lightning", "right": "éclair"}, {"left": "thunder", "right": "tonnerre"}, {"left": "humid", "right": "humide"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 45, 'Les contraires (1)', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "up", "affirmative": "haut", "negative": "⬆️"}, {"subject": "down", "affirmative": "bas", "negative": "⬇️"}, {"subject": "in", "affirmative": "dedans", "negative": "➡️"}, {"subject": "out", "affirmative": "dehors", "negative": "⬅️"}, {"subject": "open", "affirmative": "ouvert", "negative": "🔓"}, {"subject": "closed", "affirmative": "fermé", "negative": "🔒"}]'::jsonb,
  'example', '{"en": "up", "fr": "haut"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 45)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "⬆️", "right": "up"}, {"left": "⬇️", "right": "down"}, {"left": "➡️", "right": "in"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "⬅️", "right": "out"}, {"left": "🔓", "right": "open"}, {"left": "🔒", "right": "closed"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "⬆️ = ?", "options": ["open", "up", "in", "closed"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "⬆️ veut dire \"up\"."}'),(4, 'qcm', '{"question": "⬇️ = ?", "options": ["open", "down", "in", "closed"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "⬇️ veut dire \"down\"."}'),(5, 'qcm', '{"question": "➡️ = ?", "options": ["in", "up", "down", "closed"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "➡️ veut dire \"in\"."}'),(6, 'qcm', '{"question": "⬅️ = ?", "options": ["out", "down", "open", "in"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "⬅️ veut dire \"out\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "up", "right": "haut"}, {"left": "down", "right": "bas"}, {"left": "in", "right": "dedans"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "out", "right": "dehors"}, {"left": "open", "right": "ouvert"}, {"left": "closed", "right": "fermé"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 46, 'Les contraires (2)', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "day", "affirmative": "jour", "negative": "🌞"}, {"subject": "night", "affirmative": "nuit", "negative": "🌚"}, {"subject": "light", "affirmative": "léger/lumière", "negative": "💡"}, {"subject": "heavy", "affirmative": "lourd", "negative": "🏋️"}, {"subject": "near", "affirmative": "proche", "negative": "📍"}, {"subject": "far", "affirmative": "loin", "negative": "🛣️"}]'::jsonb,
  'example', '{"en": "day", "fr": "jour"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 46)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🌞", "right": "day"}, {"left": "🌚", "right": "night"}, {"left": "💡", "right": "light"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🏋️", "right": "heavy"}, {"left": "📍", "right": "near"}, {"left": "🛣️", "right": "far"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🌞 = ?", "options": ["day", "night", "near", "heavy"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🌞 veut dire \"day\"."}'),(4, 'qcm', '{"question": "🌚 = ?", "options": ["night", "heavy", "near", "far"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🌚 veut dire \"night\"."}'),(5, 'qcm', '{"question": "💡 = ?", "options": ["heavy", "day", "near", "light"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "💡 veut dire \"light\"."}'),(6, 'qcm', '{"question": "🏋️ = ?", "options": ["far", "light", "heavy", "near"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🏋️ veut dire \"heavy\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "day", "right": "jour"}, {"left": "night", "right": "nuit"}, {"left": "light", "right": "léger/lumière"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "heavy", "right": "lourd"}, {"left": "near", "right": "proche"}, {"left": "far", "right": "loin"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);
