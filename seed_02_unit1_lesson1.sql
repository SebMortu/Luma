-- ============================================
-- LUMA — Import du contenu (partie 2/3)
-- Première leçon complète (Unité 1) + ses exercices
-- À exécuter APRÈS luma_seed_01_structure.sql
-- ============================================

-- ----- Leçon 1.1 : le verbe to be -----
with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Le verbe to be', jsonb_build_object(
  'rule', 'Le verbe "to be" (être) se conjugue différemment selon la personne. C''est l''un des verbes les plus utilisés en anglais, à apprendre en priorité.',
  'table', jsonb_build_array(
    jsonb_build_object('subject', 'I', 'affirmative', 'I am (I''m)', 'negative', 'I am not (I''m not)'),
    jsonb_build_object('subject', 'You', 'affirmative', 'You are (you''re)', 'negative', 'You are not (you aren''t)'),
    jsonb_build_object('subject', 'He/She/It', 'affirmative', 'He is (he''s)', 'negative', 'He is not (he isn''t)'),
    jsonb_build_object('subject', 'We', 'affirmative', 'We are (we''re)', 'negative', 'We are not (we aren''t)'),
    jsonb_build_object('subject', 'They', 'affirmative', 'They are (they''re)', 'negative', 'They are not (they aren''t)')
  ),
  'example', jsonb_build_object('en', 'I am a student.', 'fr', 'Je suis étudiant.')
)
from u;

-- ----- Exercices de la leçon 1.1 -----
with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{
    "question": "Complète : She ___ tired.",
    "options": ["am", "is", "are", "be"],
    "correct_index": 1,
    "feedback_correct": "Correct ! \"is\" s''utilise avec he/she/it.",
    "feedback_incorrect": "Pas tout à fait — avec \"she\", on utilise \"is\"."
  }'),
  (2, 'qcm', '{
    "question": "Complète : ___ you ready?",
    "options": ["Am", "Is", "Are", "Be"],
    "correct_index": 2,
    "feedback_correct": "Correct ! \"Are\" s''utilise avec you.",
    "feedback_incorrect": "Pas tout à fait — avec \"you\", on utilise \"Are\"."
  }'),
  (3, 'fill_blank', '{
    "sentence_before": "I ",
    "sentence_after": " not ready yet.",
    "correct_answers": ["am", "m"],
    "feedback_correct": "Correct !",
    "feedback_incorrect": "La forme attendue est \"am\" (ou sa contraction \"''m\")."
  }'),
  (4, 'true_false', '{
    "statement": "\"He are my brother\" is grammatically correct.",
    "correct_answer": false,
    "feedback_correct": "Exact, c''est faux — il faut dire \"He IS my brother\".",
    "feedback_incorrect": "En fait c''est faux : avec \"he\", on utilise \"is\", pas \"are\"."
  }')
) as v(position, type, content);
