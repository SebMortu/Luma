-- ============================================
-- LUMA — Unité 1 (pilote) : doublement des exercices sur les 4 leçons existantes
-- ============================================


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : They ___ from Canada.", "options": ["is", "am", "are", "be"], "correct_index": 2, "feedback_correct": "Correct ! \"are\" s''utilise avec they.", "feedback_incorrect": "Pas tout à fait — avec \"they\", on utilise \"are\"."}'),
  (6, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " happy today.", "correct_answers": ["are", "''re"], "feedback_correct": "Correct !", "feedback_incorrect": "La forme attendue est \"are\" (ou sa contraction \"''re\")."}'),
  (7, 'true_false', '{"statement": "\"I am not\" can be contracted as \"I amn''t\".", "correct_answer": false, "feedback_correct": "Exact — cette contraction n''existe pas, on dit \"I''m not\".", "feedback_incorrect": "Faux — \"I amn''t\" n''existe pas en anglais, on dit \"I''m not\"."}'),
  (8, 'matching', '{"instruction": "Relie le sujet à sa forme correcte de to be.", "pairs": [{"left": "He", "right": "is"}, {"left": "You", "right": "are"}, {"left": "I", "right": "am"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Comment dit-on \"Bonsoir\" en anglais ?", "options": ["Good morning", "Good afternoon", "Good evening", "Good night"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Good evening\" veut dire bonsoir."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " are you? (Comment vas-tu ?)", "correct_answers": ["How"], "feedback_correct": "Correct !", "feedback_incorrect": "On utilise \"How\" pour demander comment ça va."}'),
  (7, 'true_false', '{"statement": "\"It\" can be used to talk about an animal or an object.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"it\" s''utilise bien pour les animaux et objets."}'),
  (8, 'matching', '{"instruction": "Relie la salutation anglaise à sa traduction.", "pairs": [{"left": "Goodbye", "right": "Au revoir"}, {"left": "See you soon", "right": "À bientôt"}, {"left": "Nice to meet you", "right": "Enchanté"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Comment épelle-t-on la lettre \"J\" en anglais ?", "options": ["/dʒeɪ/", "/aɪ/", "/dʒɒt/", "/jeɪ/"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"J\" se prononce /dʒeɪ/ en anglais."}'),
  (6, 'fill_blank', '{"sentence_before": "Can you spell your name, ", "sentence_after": "?", "correct_answers": ["please"], "feedback_correct": "Correct !", "feedback_incorrect": "On termine la demande polie par \"please\"."}'),
  (7, 'true_false', '{"statement": "The letters \"A\", \"E\", \"I\", \"O\", \"U\" are vowels.", "correct_answer": true, "feedback_correct": "Exact, ce sont les voyelles !", "feedback_incorrect": "Faux — ce sont bien les 5 voyelles de l''alphabet anglais."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["How", "do", "you", "spell", "that?"], "correct_sentence": "How do you spell that?", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ do you live?", "options": ["What", "Where", "Who", "When"], "correct_index": 1, "feedback_correct": "Correct ! \"Where\" interroge sur le lieu.", "feedback_incorrect": "\"Where\" est utilisé pour demander où."}'),
  (6, 'fill_blank', '{"sentence_before": "I''m 25 years ", "sentence_after": ".", "correct_answers": ["old"], "feedback_correct": "Correct !", "feedback_incorrect": "On dit \"years old\" pour donner son âge."}'),
  (7, 'true_false', '{"statement": "\"What''s your job?\" is a polite way to ask about someone''s profession.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une façon correcte de demander la profession."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["My", "name", "is", "Sarah."], "correct_sentence": "My name is Sarah.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);
