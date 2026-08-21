-- ============================================
-- LUMA — Extension MAJEURE du niveau A0 'Fondations'
-- Partie 2/2 : 15 nouvelles leçons (positions 16 à 30)
-- ============================================


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 16, 'Les fruits et légumes', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "orange", "affirmative": "orange", "negative": "🍊"}, {"subject": "grape", "affirmative": "raisin", "negative": "🍇"}, {"subject": "carrot", "affirmative": "carotte", "negative": "🥕"}, {"subject": "potato", "affirmative": "pomme de terre", "negative": "🥔"}, {"subject": "tomato", "affirmative": "tomate", "negative": "🍅"}, {"subject": "strawberry", "affirmative": "fraise", "negative": "🍓"}]'::jsonb,
  'example', '{"en": "orange", "fr": "orange"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 16)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍊", "right": "orange"}, {"left": "🍇", "right": "grape"}, {"left": "🥕", "right": "carrot"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🥔", "right": "potato"}, {"left": "🍅", "right": "tomato"}, {"left": "🍓", "right": "strawberry"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🍊 = ?", "options": ["carotte", "tomate", "orange", "fraise"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🍊 veut dire \"orange\"."}'),(4, 'qcm', '{"question": "🍇 = ?", "options": ["raisin", "carotte", "pomme de terre", "orange"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🍇 veut dire \"raisin\"."}'),(5, 'qcm', '{"question": "🥕 = ?", "options": ["pomme de terre", "orange", "fraise", "carotte"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🥕 veut dire \"carotte\"."}'),(6, 'qcm', '{"question": "🥔 = ?", "options": ["pomme de terre", "fraise", "raisin", "orange"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🥔 veut dire \"pomme de terre\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "orange", "right": "orange"}, {"left": "grape", "right": "raisin"}, {"left": "carrot", "right": "carotte"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "potato", "right": "pomme de terre"}, {"left": "tomato", "right": "tomate"}, {"left": "strawberry", "right": "fraise"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 17, 'Les boissons', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "juice", "affirmative": "jus", "negative": "🧃"}, {"subject": "tea", "affirmative": "thé", "negative": "🍵"}, {"subject": "coffee", "affirmative": "café", "negative": "☕"}, {"subject": "soda", "affirmative": "soda", "negative": "🥤"}, {"subject": "chocolate milk", "affirmative": "chocolat chaud", "negative": "🍫"}, {"subject": "lemonade", "affirmative": "limonade", "negative": "🍋"}]'::jsonb,
  'example', '{"en": "juice", "fr": "jus"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 17)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🧃", "right": "juice"}, {"left": "🍵", "right": "tea"}, {"left": "☕", "right": "coffee"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🥤", "right": "soda"}, {"left": "🍫", "right": "chocolate milk"}, {"left": "🍋", "right": "lemonade"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🧃 = ?", "options": ["jus", "café", "limonade", "soda"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🧃 veut dire \"jus\"."}'),(4, 'qcm', '{"question": "🍵 = ?", "options": ["limonade", "jus", "chocolat chaud", "thé"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍵 veut dire \"thé\"."}'),(5, 'qcm', '{"question": "☕ = ?", "options": ["limonade", "jus", "soda", "café"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "☕ veut dire \"café\"."}'),(6, 'qcm', '{"question": "🥤 = ?", "options": ["soda", "limonade", "thé", "chocolat chaud"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🥤 veut dire \"soda\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "juice", "right": "jus"}, {"left": "tea", "right": "thé"}, {"left": "coffee", "right": "café"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "soda", "right": "soda"}, {"left": "chocolate milk", "right": "chocolat chaud"}, {"left": "lemonade", "right": "limonade"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 18, 'La salle de classe', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "book", "affirmative": "livre", "negative": "📖"}, {"subject": "pen", "affirmative": "stylo", "negative": "🖊️"}, {"subject": "pencil", "affirmative": "crayon", "negative": "✏️"}, {"subject": "backpack", "affirmative": "sac à dos", "negative": "🎒"}, {"subject": "eraser", "affirmative": "gomme", "negative": "🧹"}, {"subject": "ruler", "affirmative": "règle", "negative": "📏"}]'::jsonb,
  'example', '{"en": "book", "fr": "livre"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 18)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "📖", "right": "book"}, {"left": "🖊️", "right": "pen"}, {"left": "✏️", "right": "pencil"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🎒", "right": "backpack"}, {"left": "🧹", "right": "eraser"}, {"left": "📏", "right": "ruler"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "📖 = ?", "options": ["crayon", "livre", "gomme", "règle"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "📖 veut dire \"livre\"."}'),(4, 'qcm', '{"question": "🖊️ = ?", "options": ["gomme", "sac à dos", "crayon", "stylo"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🖊️ veut dire \"stylo\"."}'),(5, 'qcm', '{"question": "✏️ = ?", "options": ["règle", "crayon", "stylo", "livre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "✏️ veut dire \"crayon\"."}'),(6, 'qcm', '{"question": "🎒 = ?", "options": ["sac à dos", "règle", "gomme", "stylo"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🎒 veut dire \"sac à dos\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "book", "right": "livre"}, {"left": "pen", "right": "stylo"}, {"left": "pencil", "right": "crayon"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "backpack", "right": "sac à dos"}, {"left": "eraser", "right": "gomme"}, {"left": "ruler", "right": "règle"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 19, 'La cuisine', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "pot", "affirmative": "casserole", "negative": "🍲"}, {"subject": "pan", "affirmative": "poêle", "negative": "🍳"}, {"subject": "spoon", "affirmative": "cuillère", "negative": "🥄"}, {"subject": "fork", "affirmative": "fourchette", "negative": "🍴"}, {"subject": "knife", "affirmative": "couteau", "negative": "🔪"}, {"subject": "plate", "affirmative": "assiette", "negative": "🍽️"}]'::jsonb,
  'example', '{"en": "pot", "fr": "casserole"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 19)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍲", "right": "pot"}, {"left": "🍳", "right": "pan"}, {"left": "🥄", "right": "spoon"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🍴", "right": "fork"}, {"left": "🔪", "right": "knife"}, {"left": "🍽️", "right": "plate"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🍲 = ?", "options": ["poêle", "casserole", "assiette", "cuillère"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🍲 veut dire \"casserole\"."}'),(4, 'qcm', '{"question": "🍳 = ?", "options": ["poêle", "assiette", "fourchette", "casserole"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🍳 veut dire \"poêle\"."}'),(5, 'qcm', '{"question": "🥄 = ?", "options": ["assiette", "cuillère", "casserole", "fourchette"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🥄 veut dire \"cuillère\"."}'),(6, 'qcm', '{"question": "🍴 = ?", "options": ["couteau", "cuillère", "fourchette", "assiette"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🍴 veut dire \"fourchette\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "pot", "right": "casserole"}, {"left": "pan", "right": "poêle"}, {"left": "spoon", "right": "cuillère"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "fork", "right": "fourchette"}, {"left": "knife", "right": "couteau"}, {"left": "plate", "right": "assiette"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 20, 'La salle de bain', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "soap", "affirmative": "savon", "negative": "🧼"}, {"subject": "towel", "affirmative": "serviette", "negative": "🏖️"}, {"subject": "toothbrush", "affirmative": "brosse à dents", "negative": "🪥"}, {"subject": "shampoo", "affirmative": "shampoing", "negative": "🧴"}, {"subject": "mirror", "affirmative": "miroir", "negative": "🪞"}, {"subject": "bathtub", "affirmative": "baignoire", "negative": "🛁"}]'::jsonb,
  'example', '{"en": "soap", "fr": "savon"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 20)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🧼", "right": "soap"}, {"left": "🏖️", "right": "towel"}, {"left": "🪥", "right": "toothbrush"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🧴", "right": "shampoo"}, {"left": "🪞", "right": "mirror"}, {"left": "🛁", "right": "bathtub"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🧼 = ?", "options": ["baignoire", "serviette", "shampoing", "savon"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🧼 veut dire \"savon\"."}'),(4, 'qcm', '{"question": "🏖️ = ?", "options": ["brosse à dents", "savon", "serviette", "miroir"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🏖️ veut dire \"serviette\"."}'),(5, 'qcm', '{"question": "🪥 = ?", "options": ["shampoing", "brosse à dents", "savon", "miroir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🪥 veut dire \"brosse à dents\"."}'),(6, 'qcm', '{"question": "🧴 = ?", "options": ["serviette", "shampoing", "baignoire", "miroir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🧴 veut dire \"shampoing\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "soap", "right": "savon"}, {"left": "towel", "right": "serviette"}, {"left": "toothbrush", "right": "brosse à dents"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "shampoo", "right": "shampoing"}, {"left": "mirror", "right": "miroir"}, {"left": "bathtub", "right": "baignoire"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 21, 'Les jouets', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "ball", "affirmative": "ballon", "negative": "⚽"}, {"subject": "doll", "affirmative": "poupée", "negative": "🪆"}, {"subject": "teddy bear", "affirmative": "ours en peluche", "negative": "🧸"}, {"subject": "blocks", "affirmative": "cubes", "negative": "🧱"}, {"subject": "kite", "affirmative": "cerf-volant", "negative": "🪁"}, {"subject": "puzzle", "affirmative": "puzzle", "negative": "🧩"}]'::jsonb,
  'example', '{"en": "ball", "fr": "ballon"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 21)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "⚽", "right": "ball"}, {"left": "🪆", "right": "doll"}, {"left": "🧸", "right": "teddy bear"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🧱", "right": "blocks"}, {"left": "🪁", "right": "kite"}, {"left": "🧩", "right": "puzzle"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "⚽ = ?", "options": ["cubes", "puzzle", "ours en peluche", "ballon"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "⚽ veut dire \"ballon\"."}'),(4, 'qcm', '{"question": "🪆 = ?", "options": ["ballon", "ours en peluche", "poupée", "puzzle"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🪆 veut dire \"poupée\"."}'),(5, 'qcm', '{"question": "🧸 = ?", "options": ["ours en peluche", "cerf-volant", "ballon", "cubes"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🧸 veut dire \"ours en peluche\"."}'),(6, 'qcm', '{"question": "🧱 = ?", "options": ["poupée", "ours en peluche", "cubes", "cerf-volant"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🧱 veut dire \"cubes\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "ball", "right": "ballon"}, {"left": "doll", "right": "poupée"}, {"left": "teddy bear", "right": "ours en peluche"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "blocks", "right": "cubes"}, {"left": "kite", "right": "cerf-volant"}, {"left": "puzzle", "right": "puzzle"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 22, 'Les sports', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "soccer", "affirmative": "football", "negative": "⚽"}, {"subject": "basketball", "affirmative": "basket", "negative": "🏀"}, {"subject": "swimming", "affirmative": "natation", "negative": "🏊"}, {"subject": "running", "affirmative": "course", "negative": "🏃"}, {"subject": "tennis", "affirmative": "tennis", "negative": "🎾"}, {"subject": "dancing", "affirmative": "danse", "negative": "💃"}]'::jsonb,
  'example', '{"en": "soccer", "fr": "football"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 22)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "⚽", "right": "soccer"}, {"left": "🏀", "right": "basketball"}, {"left": "🏊", "right": "swimming"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🏃", "right": "running"}, {"left": "🎾", "right": "tennis"}, {"left": "💃", "right": "dancing"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "⚽ = ?", "options": ["tennis", "basket", "football", "danse"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "⚽ veut dire \"football\"."}'),(4, 'qcm', '{"question": "🏀 = ?", "options": ["basket", "natation", "tennis", "danse"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🏀 veut dire \"basket\"."}'),(5, 'qcm', '{"question": "🏊 = ?", "options": ["tennis", "course", "natation", "danse"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🏊 veut dire \"natation\"."}'),(6, 'qcm', '{"question": "🏃 = ?", "options": ["basket", "natation", "danse", "course"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🏃 veut dire \"course\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "soccer", "right": "football"}, {"left": "basketball", "right": "basket"}, {"left": "swimming", "right": "natation"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "running", "right": "course"}, {"left": "tennis", "right": "tennis"}, {"left": "dancing", "right": "danse"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 23, 'La nature', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "tree", "affirmative": "arbre", "negative": "🌳"}, {"subject": "flower", "affirmative": "fleur", "negative": "🌸"}, {"subject": "mountain", "affirmative": "montagne", "negative": "⛰️"}, {"subject": "river", "affirmative": "rivière", "negative": "🏞️"}, {"subject": "sea", "affirmative": "mer", "negative": "🌊"}, {"subject": "forest", "affirmative": "forêt", "negative": "🌲"}]'::jsonb,
  'example', '{"en": "tree", "fr": "arbre"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 23)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🌳", "right": "tree"}, {"left": "🌸", "right": "flower"}, {"left": "⛰️", "right": "mountain"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🏞️", "right": "river"}, {"left": "🌊", "right": "sea"}, {"left": "🌲", "right": "forest"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🌳 = ?", "options": ["montagne", "arbre", "fleur", "forêt"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🌳 veut dire \"arbre\"."}'),(4, 'qcm', '{"question": "🌸 = ?", "options": ["mer", "montagne", "arbre", "fleur"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🌸 veut dire \"fleur\"."}'),(5, 'qcm', '{"question": "⛰️ = ?", "options": ["rivière", "fleur", "montagne", "arbre"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "⛰️ veut dire \"montagne\"."}'),(6, 'qcm', '{"question": "🏞️ = ?", "options": ["mer", "montagne", "rivière", "fleur"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🏞️ veut dire \"rivière\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "tree", "right": "arbre"}, {"left": "flower", "right": "fleur"}, {"left": "mountain", "right": "montagne"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "river", "right": "rivière"}, {"left": "sea", "right": "mer"}, {"left": "forest", "right": "forêt"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 24, 'Les lieux de la ville', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "school", "affirmative": "école", "negative": "🏫"}, {"subject": "hospital", "affirmative": "hôpital", "negative": "🏥"}, {"subject": "park", "affirmative": "parc", "negative": "🏞️"}, {"subject": "shop", "affirmative": "magasin", "negative": "🏪"}, {"subject": "restaurant", "affirmative": "restaurant", "negative": "🍽️"}, {"subject": "church", "affirmative": "église", "negative": "⛪"}]'::jsonb,
  'example', '{"en": "school", "fr": "école"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 24)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🏫", "right": "school"}, {"left": "🏥", "right": "hospital"}, {"left": "🏞️", "right": "park"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🏪", "right": "shop"}, {"left": "🍽️", "right": "restaurant"}, {"left": "⛪", "right": "church"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🏫 = ?", "options": ["restaurant", "parc", "école", "magasin"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🏫 veut dire \"école\"."}'),(4, 'qcm', '{"question": "🏥 = ?", "options": ["magasin", "école", "hôpital", "restaurant"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🏥 veut dire \"hôpital\"."}'),(5, 'qcm', '{"question": "🏞️ = ?", "options": ["magasin", "parc", "hôpital", "restaurant"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🏞️ veut dire \"parc\"."}'),(6, 'qcm', '{"question": "🏪 = ?", "options": ["parc", "église", "magasin", "hôpital"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🏪 veut dire \"magasin\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "school", "right": "école"}, {"left": "hospital", "right": "hôpital"}, {"left": "park", "right": "parc"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "shop", "right": "magasin"}, {"left": "restaurant", "right": "restaurant"}, {"left": "church", "right": "église"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 25, 'Les nombres de 11 à 20', jsonb_build_object(
  'rule', 'Découvre 10 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "eleven", "affirmative": "onze", "negative": "11"}, {"subject": "twelve", "affirmative": "douze", "negative": "12"}, {"subject": "thirteen", "affirmative": "treize", "negative": "13"}, {"subject": "fourteen", "affirmative": "quatorze", "negative": "14"}, {"subject": "fifteen", "affirmative": "quinze", "negative": "15"}, {"subject": "sixteen", "affirmative": "seize", "negative": "16"}, {"subject": "seventeen", "affirmative": "dix-sept", "negative": "17"}, {"subject": "eighteen", "affirmative": "dix-huit", "negative": "18"}, {"subject": "nineteen", "affirmative": "dix-neuf", "negative": "19"}, {"subject": "twenty", "affirmative": "vingt", "negative": "20"}]'::jsonb,
  'example', '{"en": "eleven", "fr": "onze"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 25)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "11", "right": "eleven"}, {"left": "12", "right": "twelve"}, {"left": "13", "right": "thirteen"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "14", "right": "fourteen"}, {"left": "15", "right": "fifteen"}, {"left": "16", "right": "sixteen"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "17", "right": "seventeen"}, {"left": "18", "right": "eighteen"}, {"left": "19", "right": "nineteen"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(4, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "20", "right": "twenty"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(5, 'qcm', '{"question": "11 = ?", "options": ["douze", "quatorze", "dix-neuf", "onze"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "11 veut dire \"onze\"."}'),(6, 'qcm', '{"question": "12 = ?", "options": ["vingt", "quinze", "douze", "quatorze"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "12 veut dire \"douze\"."}'),(7, 'qcm', '{"question": "13 = ?", "options": ["treize", "dix-huit", "onze", "vingt"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "13 veut dire \"treize\"."}'),(8, 'qcm', '{"question": "14 = ?", "options": ["douze", "vingt", "quatorze", "dix-huit"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "14 veut dire \"quatorze\"."}'),(9, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "eleven", "right": "onze"}, {"left": "twelve", "right": "douze"}, {"left": "thirteen", "right": "treize"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(10, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "fourteen", "right": "quatorze"}, {"left": "fifteen", "right": "quinze"}, {"left": "sixteen", "right": "seize"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(11, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "seventeen", "right": "dix-sept"}, {"left": "eighteen", "right": "dix-huit"}, {"left": "nineteen", "right": "dix-neuf"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(12, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "twenty", "right": "vingt"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 26, 'Premier, deuxième, troisième...', jsonb_build_object(
  'rule', 'Découvre 5 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "first", "affirmative": "premier", "negative": "🥇"}, {"subject": "second", "affirmative": "deuxième", "negative": "🥈"}, {"subject": "third", "affirmative": "troisième", "negative": "🥉"}, {"subject": "fourth", "affirmative": "quatrième", "negative": "4️⃣"}, {"subject": "fifth", "affirmative": "cinquième", "negative": "5️⃣"}]'::jsonb,
  'example', '{"en": "first", "fr": "premier"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 26)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🥇", "right": "first"}, {"left": "🥈", "right": "second"}, {"left": "🥉", "right": "third"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "4️⃣", "right": "fourth"}, {"left": "5️⃣", "right": "fifth"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🥇 = ?", "options": ["premier", "quatrième", "deuxième", "troisième"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🥇 veut dire \"premier\"."}'),(4, 'qcm', '{"question": "🥈 = ?", "options": ["cinquième", "troisième", "premier", "deuxième"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🥈 veut dire \"deuxième\"."}'),(5, 'qcm', '{"question": "🥉 = ?", "options": ["deuxième", "cinquième", "quatrième", "troisième"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🥉 veut dire \"troisième\"."}'),(6, 'qcm', '{"question": "4️⃣ = ?", "options": ["cinquième", "troisième", "premier", "quatrième"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "4️⃣ veut dire \"quatrième\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "first", "right": "premier"}, {"left": "second", "right": "deuxième"}, {"left": "third", "right": "troisième"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "fourth", "right": "quatrième"}, {"left": "fifth", "right": "cinquième"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 27, 'Rapide, lent, neuf, vieux', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "fast", "affirmative": "rapide", "negative": "⚡"}, {"subject": "slow", "affirmative": "lent", "negative": "🐢"}, {"subject": "new", "affirmative": "neuf", "negative": "✨"}, {"subject": "old", "affirmative": "vieux", "negative": "🕰️"}, {"subject": "clean", "affirmative": "propre", "negative": "🧼"}, {"subject": "dirty", "affirmative": "sale", "negative": "💩"}]'::jsonb,
  'example', '{"en": "fast", "fr": "rapide"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 27)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "⚡", "right": "fast"}, {"left": "🐢", "right": "slow"}, {"left": "✨", "right": "new"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🕰️", "right": "old"}, {"left": "🧼", "right": "clean"}, {"left": "💩", "right": "dirty"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "⚡ = ?", "options": ["lent", "sale", "neuf", "rapide"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "⚡ veut dire \"rapide\"."}'),(4, 'qcm', '{"question": "🐢 = ?", "options": ["sale", "rapide", "lent", "propre"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐢 veut dire \"lent\"."}'),(5, 'qcm', '{"question": "✨ = ?", "options": ["neuf", "lent", "rapide", "vieux"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "✨ veut dire \"neuf\"."}'),(6, 'qcm', '{"question": "🕰️ = ?", "options": ["vieux", "sale", "propre", "neuf"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🕰️ veut dire \"vieux\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "fast", "right": "rapide"}, {"left": "slow", "right": "lent"}, {"left": "new", "right": "neuf"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "old", "right": "vieux"}, {"left": "clean", "right": "propre"}, {"left": "dirty", "right": "sale"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 28, 'Chaud, froid, plein, vide', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "hot", "affirmative": "chaud", "negative": "🔥"}, {"subject": "cold", "affirmative": "froid", "negative": "🧊"}, {"subject": "full", "affirmative": "plein", "negative": "🈵"}, {"subject": "empty", "affirmative": "vide", "negative": "📭"}, {"subject": "easy", "affirmative": "facile", "negative": "😌"}, {"subject": "difficult", "affirmative": "difficile", "negative": "😰"}]'::jsonb,
  'example', '{"en": "hot", "fr": "chaud"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 28)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🔥", "right": "hot"}, {"left": "🧊", "right": "cold"}, {"left": "🈵", "right": "full"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "📭", "right": "empty"}, {"left": "😌", "right": "easy"}, {"left": "😰", "right": "difficult"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🔥 = ?", "options": ["difficile", "froid", "plein", "chaud"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔥 veut dire \"chaud\"."}'),(4, 'qcm', '{"question": "🧊 = ?", "options": ["froid", "plein", "difficile", "chaud"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🧊 veut dire \"froid\"."}'),(5, 'qcm', '{"question": "🈵 = ?", "options": ["plein", "facile", "froid", "chaud"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🈵 veut dire \"plein\"."}'),(6, 'qcm', '{"question": "📭 = ?", "options": ["difficile", "plein", "froid", "vide"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "📭 veut dire \"vide\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "hot", "right": "chaud"}, {"left": "cold", "right": "froid"}, {"left": "full", "right": "plein"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "empty", "right": "vide"}, {"left": "easy", "right": "facile"}, {"left": "difficult", "right": "difficile"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 29, 'La famille élargie', jsonb_build_object(
  'rule', 'Découvre 6 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "uncle", "affirmative": "oncle", "negative": "👨‍🦱"}, {"subject": "aunt", "affirmative": "tante", "negative": "👩‍🦱"}, {"subject": "cousin", "affirmative": "cousin(e)", "negative": "🧑"}, {"subject": "grandfather", "affirmative": "grand-père", "negative": "👴"}, {"subject": "nephew", "affirmative": "neveu", "negative": "🧒"}, {"subject": "niece", "affirmative": "nièce", "negative": "👧"}]'::jsonb,
  'example', '{"en": "uncle", "fr": "oncle"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👨‍🦱", "right": "uncle"}, {"left": "👩‍🦱", "right": "aunt"}, {"left": "🧑", "right": "cousin"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "👴", "right": "grandfather"}, {"left": "🧒", "right": "nephew"}, {"left": "👧", "right": "niece"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "👨‍🦱 = ?", "options": ["cousin(e)", "tante", "neveu", "oncle"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "👨‍🦱 veut dire \"oncle\"."}'),(4, 'qcm', '{"question": "👩‍🦱 = ?", "options": ["nièce", "oncle", "cousin(e)", "tante"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "👩‍🦱 veut dire \"tante\"."}'),(5, 'qcm', '{"question": "🧑 = ?", "options": ["neveu", "nièce", "grand-père", "cousin(e)"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🧑 veut dire \"cousin(e)\"."}'),(6, 'qcm', '{"question": "👴 = ?", "options": ["grand-père", "tante", "nièce", "neveu"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "👴 veut dire \"grand-père\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "uncle", "right": "oncle"}, {"left": "aunt", "right": "tante"}, {"left": "cousin", "right": "cousin(e)"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "grandfather", "right": "grand-père"}, {"left": "nephew", "right": "neveu"}, {"left": "niece", "right": "nièce"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);


with u as (select id from units where cecr_level = 'A0' and position = 0)
insert into lessons (unit_id, position, title, content)
select u.id, 30, 'Les saisons', jsonb_build_object(
  'rule', 'Découvre 4 nouveaux mots avec leur image. Regarde, écoute, associe.',
  'table', '[{"subject": "spring", "affirmative": "printemps", "negative": "🌷"}, {"subject": "summer", "affirmative": "été", "negative": "☀️"}, {"subject": "autumn", "affirmative": "automne", "negative": "🍂"}, {"subject": "winter", "affirmative": "hiver", "negative": "⛄"}]'::jsonb,
  'example', '{"en": "spring", "fr": "printemps"}'::jsonb
)
from u;


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 30)
insert into exercises (lesson_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "🌷", "right": "spring"}, {"left": "☀️", "right": "summer"}, {"left": "🍂", "right": "autumn"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(2, 'matching', '{"instruction": "Relie l''image au bon mot.", "pairs": [{"left": "⛄", "right": "winter"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les images."}'),(3, 'qcm', '{"question": "🌷 = ?", "options": ["printemps", "été", "hiver", "automne"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🌷 veut dire \"printemps\"."}'),(4, 'qcm', '{"question": "☀️ = ?", "options": ["automne", "hiver", "printemps", "été"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "☀️ veut dire \"été\"."}'),(5, 'qcm', '{"question": "🍂 = ?", "options": ["hiver", "été", "printemps", "automne"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍂 veut dire \"automne\"."}'),(6, 'qcm', '{"question": "⛄ = ?", "options": ["été", "hiver", "printemps", "automne"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "⛄ veut dire \"hiver\"."}'),(7, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "spring", "right": "printemps"}, {"left": "summer", "right": "été"}, {"left": "autumn", "right": "automne"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(8, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "winter", "right": "hiver"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}')
) as v(position, type, content);
