-- ============================================
-- LUMA — Exercices de dictée pour le niveau A0 'Fondations'
-- Dictée de mots isolés (cohérent avec le niveau : pas de phrases complètes)
-- ============================================


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 1
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "blue", "sentence_fr": "bleu", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 2
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "seven", "sentence_fr": "sept", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 3
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "cat", "sentence_fr": "chat", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 4
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "mom", "sentence_fr": "maman", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 5
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "hand", "sentence_fr": "main", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 6
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "water", "sentence_fr": "eau", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 7
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "shoes", "sentence_fr": "chaussures", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 8
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "table", "sentence_fr": "table", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 9
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "Friday", "sentence_fr": "vendredi", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 10
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "thank you", "sentence_fr": "merci", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 11
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "happy", "sentence_fr": "content", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 12
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "sun", "sentence_fr": "soleil", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 13
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "car", "sentence_fr": "voiture", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 14
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "small", "sentence_fr": "petit", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 15
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "sleep", "sentence_fr": "dormir", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 16
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "orange", "sentence_fr": "orange", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 17
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "juice", "sentence_fr": "jus", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 18
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "book", "sentence_fr": "livre", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 19
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "spoon", "sentence_fr": "cuillère", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 20
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "soap", "sentence_fr": "savon", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 21
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "ball", "sentence_fr": "ballon", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 22
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "soccer", "sentence_fr": "football", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 23
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "tree", "sentence_fr": "arbre", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 24
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "park", "sentence_fr": "parc", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 25
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "twenty", "sentence_fr": "vingt", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 26
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "third", "sentence_fr": "troisième", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 27
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "fast", "sentence_fr": "rapide", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 28
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "hot", "sentence_fr": "chaud", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 29
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "grandfather", "sentence_fr": "grand-père", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.cecr_level = 'A0' and units.position = 0 and lessons.position = 30
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "winter", "sentence_fr": "hiver", "feedback_correct": "Bravo, tu as bien entendu le mot !", "feedback_incorrect": "Pas tout à fait — regarde le mot correct et réécoute-le."}'::jsonb from l;
