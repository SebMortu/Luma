-- ============================================
-- LUMA — Exemples des nouveaux types d'exercice
-- (Association et Réordonner) sur l'Unité 1
-- ============================================

-- Leçon 1.1 (to be) — exercice d'association
with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{
  "instruction": "Relie chaque pronom à la bonne forme de \"to be\".",
  "pairs": [
    {"left": "I", "right": "am"},
    {"left": "You", "right": "are"},
    {"left": "He", "right": "is"},
    {"left": "We", "right": "are"},
    {"left": "They", "right": "are"}
  ],
  "feedback_correct": "Parfait, toutes les paires sont correctes !",
  "feedback_incorrect": "Quelques erreurs — regarde les corrections affichées."
}'::jsonb, false
from l;

-- Leçon 1.4 (se présenter) — exercice de réordonnancement
with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{
  "instruction": "Remets les mots dans le bon ordre pour former la phrase.",
  "words": ["I''m", "Tom.", "I''m", "from", "France."],
  "correct_sentence": "I''m Tom. I''m from France.",
  "feedback_correct": "Parfait, la phrase est bien reconstruite !"
}'::jsonb, false
from l;
