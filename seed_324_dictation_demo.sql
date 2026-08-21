-- ============================================
-- LUMA — Démonstration : exercices de dictée (nouveau type 'dictation')
-- ============================================


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons
  join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.position = 1 and lessons.position = 2
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "They are my best friends.", "sentence_fr": "Ils sont mes meilleurs amis.", "feedback_correct": "Bravo, tu as bien entendu chaque mot !", "feedback_incorrect": "Pas tout à fait — regarde la phrase correcte et écoute-la à nouveau."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons
  join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.position = 9 and lessons.position = 1
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "I am going to visit my parents.", "sentence_fr": "Je vais rendre visite à mes parents.", "feedback_correct": "Bravo, tu as bien entendu chaque mot !", "feedback_incorrect": "Pas tout à fait — regarde la phrase correcte et écoute-la à nouveau."}'::jsonb from l;


with l as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons
  join units on units.id = lessons.unit_id
  left join exercises on exercises.lesson_id = lessons.id
  where units.position = 17 and lessons.position = 1
  group by lessons.id
)
insert into exercises (lesson_id, position, type, content)
select id, max_pos + 1, 'dictation', '{"sentence": "I have been working here for years.", "sentence_fr": "Je travaille ici depuis des années.", "feedback_correct": "Bravo, tu as bien entendu chaque mot !", "feedback_incorrect": "Pas tout à fait — regarde la phrase correcte et écoute-la à nouveau."}'::jsonb from l;
