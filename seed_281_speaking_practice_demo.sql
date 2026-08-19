-- ============================================
-- LUMA — Démonstration : exercices "Lecture à voix haute" (speaking_practice)
-- Ajoutés à la fin de la Leçon 1 (Unité 1) pour tester le nouveau système.
-- Non notés, aucune reconnaissance vocale : l'utilisateur écoute le modèle,
-- lit à voix haute, puis confirme lui-même.
-- ============================================

with target_lesson as (
  select lessons.id, coalesce(max(exercises.position), 0) as max_pos
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  left join exercises on exercises.lesson_id = lessons.id
  where languages.code = 'en' and units.position = 1 and lessons.position = 1
  group by lessons.id
)
insert into exercises (lesson_id, type, position, content)
select id, 'speaking_practice', max_pos + 1,
  '{"sentence": "Hello, my name is Sarah.", "sentence_fr": "Bonjour, je m''appelle Sarah.", "tip": "Prononce bien le \"h\" de Hello, il est aspiré en anglais."}'::jsonb
from target_lesson
union all
select id, 'speaking_practice', max_pos + 2,
  '{"sentence": "I am a student.", "sentence_fr": "Je suis étudiant(e).", "tip": "Le \"a\" de am se prononce comme dans \"cat\", pas comme dans \"father\"."}'::jsonb
from target_lesson
union all
select id, 'speaking_practice', max_pos + 3,
  '{"sentence": "Nice to meet you!", "sentence_fr": "Ravi de te rencontrer !", "tip": "Enchaîne les mots naturellement : \"nice-to-meet-you\", sans pause."}'::jsonb
from target_lesson;
