-- ============================================
-- LUMA — Fix : les QCM "emoji = ?" du niveau A0 testaient la traduction
-- FRANÇAISE au lieu du mot ANGLAIS enseigné. Corrigé sur les 30 leçons.
-- ============================================

update exercises
set content = '{"question": "🔴 = ?", "options": ["white", "black", "blue", "red"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔴 veut dire \"red\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1
)
and content->>'question' = '🔴 = ?';

update exercises
set content = '{"question": "🔵 = ?", "options": ["black", "green", "white", "blue"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🔵 veut dire \"blue\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1
)
and content->>'question' = '🔵 = ?';

update exercises
set content = '{"question": "🟢 = ?", "options": ["blue", "yellow", "green", "white"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🟢 veut dire \"green\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1
)
and content->>'question' = '🟢 = ?';

update exercises
set content = '{"question": "🟡 = ?", "options": ["black", "white", "green", "yellow"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🟡 veut dire \"yellow\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1
)
and content->>'question' = '🟡 = ?';

update exercises
set content = '{"question": "1️⃣ = ?", "options": ["eight", "six", "one", "seven"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"one\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2
)
and content->>'question' = '1️⃣ = ?';

update exercises
set content = '{"question": "2️⃣ = ?", "options": ["two", "nine", "five", "four"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"two\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2
)
and content->>'question' = '2️⃣ = ?';

update exercises
set content = '{"question": "3️⃣ = ?", "options": ["ten", "one", "three", "two"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "3️⃣ veut dire \"three\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2
)
and content->>'question' = '3️⃣ = ?';

update exercises
set content = '{"question": "4️⃣ = ?", "options": ["six", "two", "one", "four"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "4️⃣ veut dire \"four\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2
)
and content->>'question' = '4️⃣ = ?';

update exercises
set content = '{"question": "🐶 = ?", "options": ["rabbit", "horse", "dog", "cat"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐶 veut dire \"dog\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3
)
and content->>'question' = '🐶 = ?';

update exercises
set content = '{"question": "🐱 = ?", "options": ["cat", "dog", "rabbit", "bird"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🐱 veut dire \"cat\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3
)
and content->>'question' = '🐱 = ?';

update exercises
set content = '{"question": "🐦 = ?", "options": ["fish", "rabbit", "cat", "bird"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🐦 veut dire \"bird\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3
)
and content->>'question' = '🐦 = ?';

update exercises
set content = '{"question": "🐟 = ?", "options": ["cat", "dog", "fish", "bird"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐟 veut dire \"fish\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3
)
and content->>'question' = '🐟 = ?';

update exercises
set content = '{"question": "👩 = ?", "options": ["baby", "dad", "mom", "grandma"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👩 veut dire \"mom\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
)
and content->>'question' = '👩 = ?';

update exercises
set content = '{"question": "👨 = ?", "options": ["dad", "mom", "baby", "grandma"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "👨 veut dire \"dad\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
)
and content->>'question' = '👨 = ?';

update exercises
set content = '{"question": "👧 = ?", "options": ["baby", "grandma", "sister", "brother"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👧 veut dire \"sister\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
)
and content->>'question' = '👧 = ?';

update exercises
set content = '{"question": "👦 = ?", "options": ["brother", "mom", "baby", "dad"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "👦 veut dire \"brother\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
)
and content->>'question' = '👦 = ?';

update exercises
set content = '{"question": "🗣️ = ?", "options": ["hand", "eye", "head", "ear"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🗣️ veut dire \"head\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5
)
and content->>'question' = '🗣️ = ?';

update exercises
set content = '{"question": "✋ = ?", "options": ["eye", "hand", "foot", "mouth"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "✋ veut dire \"hand\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5
)
and content->>'question' = '✋ = ?';

update exercises
set content = '{"question": "🦶 = ?", "options": ["head", "eye", "foot", "mouth"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🦶 veut dire \"foot\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5
)
and content->>'question' = '🦶 = ?';

update exercises
set content = '{"question": "👁️ = ?", "options": ["foot", "head", "eye", "hand"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👁️ veut dire \"eye\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5
)
and content->>'question' = '👁️ = ?';

update exercises
set content = '{"question": "🍎 = ?", "options": ["milk", "apple", "banana", "water"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🍎 veut dire \"apple\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6
)
and content->>'question' = '🍎 = ?';

update exercises
set content = '{"question": "🍞 = ?", "options": ["water", "banana", "egg", "bread"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍞 veut dire \"bread\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6
)
and content->>'question' = '🍞 = ?';

update exercises
set content = '{"question": "💧 = ?", "options": ["egg", "milk", "bread", "water"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "💧 veut dire \"water\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6
)
and content->>'question' = '💧 = ?';

update exercises
set content = '{"question": "🥛 = ?", "options": ["apple", "egg", "milk", "banana"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🥛 veut dire \"milk\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6
)
and content->>'question' = '🥛 = ?';

update exercises
set content = '{"question": "👕 = ?", "options": ["shoes", "hat", "shirt", "socks"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👕 veut dire \"shirt\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7
)
and content->>'question' = '👕 = ?';

update exercises
set content = '{"question": "👟 = ?", "options": ["coat", "shoes", "hat", "dress"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "👟 veut dire \"shoes\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7
)
and content->>'question' = '👟 = ?';

update exercises
set content = '{"question": "🧢 = ?", "options": ["dress", "hat", "shoes", "socks"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🧢 veut dire \"hat\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7
)
and content->>'question' = '🧢 = ?';

update exercises
set content = '{"question": "🧦 = ?", "options": ["socks", "shoes", "dress", "shirt"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🧦 veut dire \"socks\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7
)
and content->>'question' = '🧦 = ?';

update exercises
set content = '{"question": "🪑 = ?", "options": ["chair", "table", "key", "window"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🪑 veut dire \"table\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8
)
and content->>'question' = '🪑 = ?';

update exercises
set content = '{"question": "💺 = ?", "options": ["chair", "door", "table", "key"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "💺 veut dire \"chair\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8
)
and content->>'question' = '💺 = ?';

update exercises
set content = '{"question": "🛏️ = ?", "options": ["chair", "bed", "key", "window"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🛏️ veut dire \"bed\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8
)
and content->>'question' = '🛏️ = ?';

update exercises
set content = '{"question": "🚪 = ?", "options": ["table", "chair", "door", "window"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🚪 veut dire \"door\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8
)
and content->>'question' = '🚪 = ?';

update exercises
set content = '{"question": "1️⃣ = ?", "options": ["Saturday", "Monday", "Sunday", "Thursday"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "1️⃣ veut dire \"Monday\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9
)
and content->>'question' = '1️⃣ = ?';

update exercises
set content = '{"question": "2️⃣ = ?", "options": ["Wednesday", "Tuesday", "Sunday", "Saturday"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "2️⃣ veut dire \"Tuesday\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9
)
and content->>'question' = '2️⃣ = ?';

update exercises
set content = '{"question": "3️⃣ = ?", "options": ["Thursday", "Monday", "Saturday", "Wednesday"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "3️⃣ veut dire \"Wednesday\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9
)
and content->>'question' = '3️⃣ = ?';

update exercises
set content = '{"question": "4️⃣ = ?", "options": ["Wednesday", "Saturday", "Thursday", "Tuesday"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "4️⃣ veut dire \"Thursday\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9
)
and content->>'question' = '4️⃣ = ?';

update exercises
set content = '{"question": "👋 = ?", "options": ["hello", "no", "goodbye", "thank you"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "👋 veut dire \"hello\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10
)
and content->>'question' = '👋 = ?';

update exercises
set content = '{"question": "🙋 = ?", "options": ["yes", "hello", "thank you", "goodbye"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🙋 veut dire \"goodbye\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10
)
and content->>'question' = '🙋 = ?';

update exercises
set content = '{"question": "🙏 = ?", "options": ["hello", "no", "please", "thank you"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🙏 veut dire \"please\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10
)
and content->>'question' = '🙏 = ?';

update exercises
set content = '{"question": "🙌 = ?", "options": ["thank you", "hello", "please", "yes"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🙌 veut dire \"thank you\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10
)
and content->>'question' = '🙌 = ?';

update exercises
set content = '{"question": "😊 = ?", "options": ["happy", "scared", "surprised", "tired"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "😊 veut dire \"happy\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11
)
and content->>'question' = '😊 = ?';

update exercises
set content = '{"question": "😢 = ?", "options": ["happy", "tired", "scared", "sad"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "😢 veut dire \"sad\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11
)
and content->>'question' = '😢 = ?';

update exercises
set content = '{"question": "😠 = ?", "options": ["tired", "angry", "scared", "sad"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "😠 veut dire \"angry\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11
)
and content->>'question' = '😠 = ?';

update exercises
set content = '{"question": "😴 = ?", "options": ["scared", "sad", "angry", "tired"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "😴 veut dire \"tired\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11
)
and content->>'question' = '😴 = ?';

update exercises
set content = '{"question": "☀️ = ?", "options": ["cloud", "wind", "rain", "sun"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "☀️ veut dire \"sun\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12
)
and content->>'question' = '☀️ = ?';

update exercises
set content = '{"question": "🌧️ = ?", "options": ["wind", "rain", "cloud", "snow"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🌧️ veut dire \"rain\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12
)
and content->>'question' = '🌧️ = ?';

update exercises
set content = '{"question": "❄️ = ?", "options": ["snow", "hot", "rain", "sun"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "❄️ veut dire \"snow\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12
)
and content->>'question' = '❄️ = ?';

update exercises
set content = '{"question": "💨 = ?", "options": ["sun", "snow", "wind", "cloud"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "💨 veut dire \"wind\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12
)
and content->>'question' = '💨 = ?';

update exercises
set content = '{"question": "🚗 = ?", "options": ["train", "boat", "car", "bus"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🚗 veut dire \"car\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13
)
and content->>'question' = '🚗 = ?';

update exercises
set content = '{"question": "🚌 = ?", "options": ["train", "bus", "plane", "boat"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🚌 veut dire \"bus\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13
)
and content->>'question' = '🚌 = ?';

update exercises
set content = '{"question": "🚂 = ?", "options": ["car", "train", "boat", "bike"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🚂 veut dire \"train\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13
)
and content->>'question' = '🚂 = ?';

update exercises
set content = '{"question": "🚲 = ?", "options": ["bike", "plane", "car", "train"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🚲 veut dire \"bike\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13
)
and content->>'question' = '🚲 = ?';

update exercises
set content = '{"question": "🔵 = ?", "options": ["short", "long", "big", "small"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🔵 veut dire \"big\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14
)
and content->>'question' = '🔵 = ?';

update exercises
set content = '{"question": "🔹 = ?", "options": ["small", "big", "square", "round"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🔹 veut dire \"small\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14
)
and content->>'question' = '🔹 = ?';

update exercises
set content = '{"question": "⭕ = ?", "options": ["square", "small", "long", "round"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "⭕ veut dire \"round\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14
)
and content->>'question' = '⭕ = ?';

update exercises
set content = '{"question": "🟥 = ?", "options": ["square", "small", "long", "short"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🟥 veut dire \"square\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14
)
and content->>'question' = '🟥 = ?';

update exercises
set content = '{"question": "🍽️ = ?", "options": ["play", "drink", "eat", "read"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🍽️ veut dire \"eat\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15
)
and content->>'question' = '🍽️ = ?';

update exercises
set content = '{"question": "🥤 = ?", "options": ["play", "run", "drink", "read"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🥤 veut dire \"drink\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15
)
and content->>'question' = '🥤 = ?';

update exercises
set content = '{"question": "😴 = ?", "options": ["run", "read", "drink", "sleep"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "😴 veut dire \"sleep\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15
)
and content->>'question' = '😴 = ?';

update exercises
set content = '{"question": "🎮 = ?", "options": ["read", "play", "drink", "sleep"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🎮 veut dire \"play\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15
)
and content->>'question' = '🎮 = ?';

update exercises
set content = '{"question": "🍊 = ?", "options": ["tomato", "strawberry", "orange", "potato"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🍊 veut dire \"orange\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 16
)
and content->>'question' = '🍊 = ?';

update exercises
set content = '{"question": "🍇 = ?", "options": ["grape", "strawberry", "tomato", "orange"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🍇 veut dire \"grape\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 16
)
and content->>'question' = '🍇 = ?';

update exercises
set content = '{"question": "🥕 = ?", "options": ["potato", "tomato", "orange", "carrot"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🥕 veut dire \"carrot\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 16
)
and content->>'question' = '🥕 = ?';

update exercises
set content = '{"question": "🥔 = ?", "options": ["tomato", "grape", "potato", "carrot"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🥔 veut dire \"potato\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 16
)
and content->>'question' = '🥔 = ?';

update exercises
set content = '{"question": "🧃 = ?", "options": ["juice", "lemonade", "coffee", "soda"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🧃 veut dire \"juice\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 17
)
and content->>'question' = '🧃 = ?';

update exercises
set content = '{"question": "🍵 = ?", "options": ["tea", "juice", "chocolate milk", "soda"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🍵 veut dire \"tea\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 17
)
and content->>'question' = '🍵 = ?';

update exercises
set content = '{"question": "☕ = ?", "options": ["lemonade", "coffee", "chocolate milk", "soda"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "☕ veut dire \"coffee\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 17
)
and content->>'question' = '☕ = ?';

update exercises
set content = '{"question": "🥤 = ?", "options": ["chocolate milk", "soda", "coffee", "tea"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🥤 veut dire \"soda\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 17
)
and content->>'question' = '🥤 = ?';

update exercises
set content = '{"question": "📖 = ?", "options": ["book", "eraser", "pencil", "ruler"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "📖 veut dire \"book\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 18
)
and content->>'question' = '📖 = ?';

update exercises
set content = '{"question": "🖊️ = ?", "options": ["ruler", "pencil", "pen", "eraser"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🖊️ veut dire \"pen\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 18
)
and content->>'question' = '🖊️ = ?';

update exercises
set content = '{"question": "✏️ = ?", "options": ["eraser", "book", "ruler", "pencil"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "✏️ veut dire \"pencil\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 18
)
and content->>'question' = '✏️ = ?';

update exercises
set content = '{"question": "🎒 = ?", "options": ["pen", "backpack", "ruler", "pencil"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🎒 veut dire \"backpack\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 18
)
and content->>'question' = '🎒 = ?';

update exercises
set content = '{"question": "🍲 = ?", "options": ["spoon", "pot", "knife", "plate"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🍲 veut dire \"pot\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 19
)
and content->>'question' = '🍲 = ?';

update exercises
set content = '{"question": "🍳 = ?", "options": ["spoon", "fork", "pan", "plate"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🍳 veut dire \"pan\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 19
)
and content->>'question' = '🍳 = ?';

update exercises
set content = '{"question": "🥄 = ?", "options": ["fork", "spoon", "pan", "pot"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🥄 veut dire \"spoon\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 19
)
and content->>'question' = '🥄 = ?';

update exercises
set content = '{"question": "🍴 = ?", "options": ["pan", "spoon", "plate", "fork"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍴 veut dire \"fork\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 19
)
and content->>'question' = '🍴 = ?';

update exercises
set content = '{"question": "🧼 = ?", "options": ["mirror", "toothbrush", "soap", "shampoo"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🧼 veut dire \"soap\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 20
)
and content->>'question' = '🧼 = ?';

update exercises
set content = '{"question": "🏖️ = ?", "options": ["towel", "bathtub", "shampoo", "toothbrush"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🏖️ veut dire \"towel\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 20
)
and content->>'question' = '🏖️ = ?';

update exercises
set content = '{"question": "🪥 = ?", "options": ["bathtub", "towel", "shampoo", "toothbrush"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🪥 veut dire \"toothbrush\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 20
)
and content->>'question' = '🪥 = ?';

update exercises
set content = '{"question": "🧴 = ?", "options": ["mirror", "towel", "shampoo", "bathtub"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🧴 veut dire \"shampoo\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 20
)
and content->>'question' = '🧴 = ?';

update exercises
set content = '{"question": "⚽ = ?", "options": ["blocks", "doll", "ball", "teddy bear"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "⚽ veut dire \"ball\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 21
)
and content->>'question' = '⚽ = ?';

update exercises
set content = '{"question": "🪆 = ?", "options": ["puzzle", "doll", "kite", "blocks"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🪆 veut dire \"doll\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 21
)
and content->>'question' = '🪆 = ?';

update exercises
set content = '{"question": "🧸 = ?", "options": ["blocks", "teddy bear", "puzzle", "doll"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🧸 veut dire \"teddy bear\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 21
)
and content->>'question' = '🧸 = ?';

update exercises
set content = '{"question": "🧱 = ?", "options": ["blocks", "teddy bear", "ball", "puzzle"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🧱 veut dire \"blocks\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 21
)
and content->>'question' = '🧱 = ?';

update exercises
set content = '{"question": "⚽ = ?", "options": ["dancing", "running", "soccer", "tennis"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "⚽ veut dire \"soccer\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 22
)
and content->>'question' = '⚽ = ?';

update exercises
set content = '{"question": "🏀 = ?", "options": ["running", "basketball", "dancing", "swimming"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🏀 veut dire \"basketball\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 22
)
and content->>'question' = '🏀 = ?';

update exercises
set content = '{"question": "🏊 = ?", "options": ["swimming", "running", "tennis", "dancing"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🏊 veut dire \"swimming\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 22
)
and content->>'question' = '🏊 = ?';

update exercises
set content = '{"question": "🏃 = ?", "options": ["dancing", "soccer", "tennis", "running"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🏃 veut dire \"running\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 22
)
and content->>'question' = '🏃 = ?';

update exercises
set content = '{"question": "🌳 = ?", "options": ["flower", "river", "forest", "tree"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🌳 veut dire \"tree\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 23
)
and content->>'question' = '🌳 = ?';

update exercises
set content = '{"question": "🌸 = ?", "options": ["flower", "river", "mountain", "tree"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🌸 veut dire \"flower\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 23
)
and content->>'question' = '🌸 = ?';

update exercises
set content = '{"question": "⛰️ = ?", "options": ["tree", "flower", "forest", "mountain"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "⛰️ veut dire \"mountain\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 23
)
and content->>'question' = '⛰️ = ?';

update exercises
set content = '{"question": "🏞️ = ?", "options": ["river", "forest", "flower", "mountain"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🏞️ veut dire \"river\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 23
)
and content->>'question' = '🏞️ = ?';

update exercises
set content = '{"question": "🏫 = ?", "options": ["school", "park", "shop", "church"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🏫 veut dire \"school\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 24
)
and content->>'question' = '🏫 = ?';

update exercises
set content = '{"question": "🏥 = ?", "options": ["park", "hospital", "church", "restaurant"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🏥 veut dire \"hospital\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 24
)
and content->>'question' = '🏥 = ?';

update exercises
set content = '{"question": "🏞️ = ?", "options": ["park", "restaurant", "church", "school"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "🏞️ veut dire \"park\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 24
)
and content->>'question' = '🏞️ = ?';

update exercises
set content = '{"question": "🏪 = ?", "options": ["church", "hospital", "park", "shop"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🏪 veut dire \"shop\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 24
)
and content->>'question' = '🏪 = ?';

update exercises
set content = '{"question": "11 = ?", "options": ["eleven", "sixteen", "eighteen", "thirteen"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "11 veut dire \"eleven\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 25
)
and content->>'question' = '11 = ?';

update exercises
set content = '{"question": "12 = ?", "options": ["twelve", "nineteen", "thirteen", "eleven"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "12 veut dire \"twelve\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 25
)
and content->>'question' = '12 = ?';

update exercises
set content = '{"question": "13 = ?", "options": ["thirteen", "fifteen", "nineteen", "sixteen"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "13 veut dire \"thirteen\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 25
)
and content->>'question' = '13 = ?';

update exercises
set content = '{"question": "14 = ?", "options": ["fifteen", "fourteen", "eleven", "thirteen"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "14 veut dire \"fourteen\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 25
)
and content->>'question' = '14 = ?';

update exercises
set content = '{"question": "🥇 = ?", "options": ["fifth", "first", "second", "third"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🥇 veut dire \"first\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 26
)
and content->>'question' = '🥇 = ?';

update exercises
set content = '{"question": "🥈 = ?", "options": ["third", "second", "fifth", "fourth"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🥈 veut dire \"second\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 26
)
and content->>'question' = '🥈 = ?';

update exercises
set content = '{"question": "🥉 = ?", "options": ["second", "fourth", "first", "third"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🥉 veut dire \"third\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 26
)
and content->>'question' = '🥉 = ?';

update exercises
set content = '{"question": "4️⃣ = ?", "options": ["fifth", "first", "second", "fourth"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "4️⃣ veut dire \"fourth\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 26
)
and content->>'question' = '4️⃣ = ?';

update exercises
set content = '{"question": "⚡ = ?", "options": ["new", "fast", "slow", "old"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "⚡ veut dire \"fast\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 27
)
and content->>'question' = '⚡ = ?';

update exercises
set content = '{"question": "🐢 = ?", "options": ["clean", "old", "slow", "dirty"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🐢 veut dire \"slow\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 27
)
and content->>'question' = '🐢 = ?';

update exercises
set content = '{"question": "✨ = ?", "options": ["old", "fast", "slow", "new"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "✨ veut dire \"new\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 27
)
and content->>'question' = '✨ = ?';

update exercises
set content = '{"question": "🕰️ = ?", "options": ["clean", "new", "dirty", "old"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🕰️ veut dire \"old\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 27
)
and content->>'question' = '🕰️ = ?';

update exercises
set content = '{"question": "🔥 = ?", "options": ["difficult", "easy", "hot", "empty"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🔥 veut dire \"hot\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 28
)
and content->>'question' = '🔥 = ?';

update exercises
set content = '{"question": "🧊 = ?", "options": ["hot", "full", "empty", "cold"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🧊 veut dire \"cold\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 28
)
and content->>'question' = '🧊 = ?';

update exercises
set content = '{"question": "🈵 = ?", "options": ["easy", "full", "empty", "hot"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🈵 veut dire \"full\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 28
)
and content->>'question' = '🈵 = ?';

update exercises
set content = '{"question": "📭 = ?", "options": ["difficult", "empty", "cold", "easy"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "📭 veut dire \"empty\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 28
)
and content->>'question' = '📭 = ?';

update exercises
set content = '{"question": "👨‍🦱 = ?", "options": ["grandfather", "aunt", "niece", "uncle"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "👨‍🦱 veut dire \"uncle\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and content->>'question' = '👨‍🦱 = ?';

update exercises
set content = '{"question": "👩‍🦱 = ?", "options": ["cousin", "grandfather", "aunt", "nephew"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👩‍🦱 veut dire \"aunt\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and content->>'question' = '👩‍🦱 = ?';

update exercises
set content = '{"question": "🧑 = ?", "options": ["uncle", "grandfather", "cousin", "niece"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "🧑 veut dire \"cousin\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and content->>'question' = '🧑 = ?';

update exercises
set content = '{"question": "👴 = ?", "options": ["aunt", "niece", "grandfather", "uncle"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "👴 veut dire \"grandfather\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
)
and content->>'question' = '👴 = ?';

update exercises
set content = '{"question": "🌷 = ?", "options": ["summer", "spring", "winter", "autumn"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "🌷 veut dire \"spring\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 30
)
and content->>'question' = '🌷 = ?';

update exercises
set content = '{"question": "☀️ = ?", "options": ["spring", "summer", "autumn", "winter"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "☀️ veut dire \"summer\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 30
)
and content->>'question' = '☀️ = ?';

update exercises
set content = '{"question": "🍂 = ?", "options": ["summer", "spring", "winter", "autumn"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "🍂 veut dire \"autumn\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 30
)
and content->>'question' = '🍂 = ?';

update exercises
set content = '{"question": "⛄ = ?", "options": ["winter", "spring", "autumn", "summer"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "⛄ veut dire \"winter\"."}'::jsonb
where lesson_id = (
  select lessons.id from lessons join units on units.id = lessons.unit_id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 30
)
and content->>'question' = '⛄ = ?';
