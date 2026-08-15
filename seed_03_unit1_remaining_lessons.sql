-- ============================================
-- LUMA — Import du contenu (partie 3)
-- Complète l'Unité 1 : leçons 2, 3 et 4
-- À exécuter APRÈS luma_seed_02_unit1_lesson1.sql
-- ============================================

-- ----- Leçon 1.2 : Pronoms personnels et salutations -----
with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Pronoms personnels et salutations', jsonb_build_object(
  'rule', 'Les pronoms personnels sujets remplacent le nom d''une personne ou d''une chose : I (je), you (tu/vous), he (il), she (elle), it (il/elle pour un objet ou animal), we (nous), they (ils/elles). On les utilise pour se présenter et saluer poliment.',
  'table', jsonb_build_array(
    jsonb_build_object('subject', 'I', 'affirmative', 'je', 'negative', ''),
    jsonb_build_object('subject', 'You', 'affirmative', 'tu / vous', 'negative', ''),
    jsonb_build_object('subject', 'He / She / It', 'affirmative', 'il / elle / il-elle (objet)', 'negative', ''),
    jsonb_build_object('subject', 'We', 'affirmative', 'nous', 'negative', ''),
    jsonb_build_object('subject', 'They', 'affirmative', 'ils / elles', 'negative', '')
  ),
  'example', jsonb_build_object('en', 'Hello, I am Marie. Nice to meet you!', 'fr', 'Bonjour, je suis Marie. Enchanté !')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{
    "question": "Quel pronom utilise-t-on pour parler d''un objet ?",
    "options": ["He", "She", "It", "They"],
    "correct_index": 2,
    "feedback_correct": "Correct ! \"It\" s''utilise pour un objet ou un animal.",
    "feedback_incorrect": "Pas tout à fait — pour un objet, on utilise \"It\"."
  }'),
  (2, 'qcm', '{
    "question": "Comment dit-on \"Enchanté(e)\" en anglais ?",
    "options": ["Good morning", "Nice to meet you", "See you later", "Thank you"],
    "correct_index": 1,
    "feedback_correct": "Correct !",
    "feedback_incorrect": "\"Nice to meet you\" est la bonne réponse."
  }'),
  (3, 'fill_blank', '{
    "sentence_before": "",
    "sentence_after": " are my best friends. (Ils sont mes meilleurs amis)",
    "correct_answers": ["They"],
    "feedback_correct": "Correct !",
    "feedback_incorrect": "La réponse attendue est \"They\"."
  }'),
  (4, 'true_false', '{
    "statement": "\"Hi\" is more formal than \"Good morning\".",
    "correct_answer": false,
    "feedback_correct": "Exact — \"Hi\" est plus informel, pas plus formel.",
    "feedback_incorrect": "En fait c''est faux : \"Hi\" est informel, \"Good morning\" est plus formel."
  }')
) as v(position, type, content);

-- ----- Leçon 1.3 : L'alphabet et la prononciation -----
with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'L''alphabet et la prononciation', jsonb_build_object(
  'rule', 'L''anglais utilise le même alphabet que le français, mais la prononciation des lettres est différente. Quelques sons clés à connaître : le \"th\" (comme dans \"think\") n''existe pas en français — la langue se place entre les dents. Le \"h\" est presque toujours prononcé (contrairement au français). Les voyelles ont souvent plusieurs prononciations possibles selon le mot.',
  'example', jsonb_build_object('en', 'Thank you very much!', 'fr', 'Merci beaucoup ! (le "th" se prononce en plaçant la langue entre les dents)')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'true_false', '{
    "statement": "The \"h\" in English words is usually silent, like in French.",
    "correct_answer": false,
    "feedback_correct": "Exact — en anglais, le \"h\" est presque toujours prononcé.",
    "feedback_incorrect": "En fait c''est faux : contrairement au français, le \"h\" anglais est presque toujours prononcé."
  }'),
  (2, 'qcm', '{
    "question": "Le son \"th\" dans \"think\" se prononce comment ?",
    "options": ["Comme un \"s\"", "Comme un \"z\"", "La langue entre les dents", "Comme un \"f\""],
    "correct_index": 2,
    "feedback_correct": "Correct !",
    "feedback_incorrect": "Le \"th\" se prononce en plaçant la langue entre les dents, un son qui n''existe pas en français."
  }'),
  (3, 'qcm', '{
    "question": "Laquelle de ces lettres a une prononciation proche du français ?",
    "options": ["W", "J", "H", "M"],
    "correct_index": 3,
    "feedback_correct": "Correct ! \"M\" se prononce de façon assez proche.",
    "feedback_incorrect": "\"M\" est la lettre la plus proche du français parmi ces choix."
  }')
) as v(position, type, content);

-- ----- Leçon 1.4 : Se présenter -----
with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Se présenter', jsonb_build_object(
  'rule', 'Pour se présenter en anglais, on combine ce qu''on a appris : le verbe \"to be\", les pronoms personnels, et des formules de politesse. Une présentation simple suit souvent ce schéma : salutation + nom + origine ou métier.',
  'example', jsonb_build_object('en', 'Hi, I''m Tom. I am from France. I am a teacher.', 'fr', 'Salut, je suis Tom. Je suis de France. Je suis professeur.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{
    "question": "Complète : \"Hi, ___ Sarah.\"",
    "options": ["I am", "I''m", "am I", "I be"],
    "correct_index": 1,
    "feedback_correct": "Correct ! \"I''m\" est la contraction naturelle de \"I am\".",
    "feedback_incorrect": "La forme naturelle ici est \"I''m\" (contraction de \"I am\")."
  }'),
  (2, 'fill_blank', '{
    "sentence_before": "I am ",
    "sentence_after": " France. (Je suis DE France)",
    "correct_answers": ["from"],
    "feedback_correct": "Correct !",
    "feedback_incorrect": "La préposition attendue est \"from\"."
  }'),
  (3, 'qcm', '{
    "question": "Quelle phrase est correcte pour dire son métier ?",
    "options": ["I teacher", "I am teacher", "I am a teacher", "I a teacher"],
    "correct_index": 2,
    "feedback_correct": "Correct ! N''oublie pas l''article \"a\" devant le métier.",
    "feedback_incorrect": "La forme correcte est \"I am a teacher\" — l''article \"a\" est nécessaire."
  }'),
  (4, 'true_false', '{
    "statement": "In English, you always need an article (a/an) before a profession, unlike in French.",
    "correct_answer": true,
    "feedback_correct": "Correct ! C''est un piège fréquent pour les francophones.",
    "feedback_incorrect": "En fait c''est vrai : l''anglais exige toujours l''article devant une profession."
  }')
) as v(position, type, content);
