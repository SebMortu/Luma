-- ============================================
-- LUMA — Unité 15 (A2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ the door, please!", "options": ["Close", "You close", "Closing", "To close"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Impératif = base verbale seule : \"Close\"."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " careful! (fais attention)", "correct_answers": ["Be"], "feedback_correct": "Correct !", "feedback_incorrect": "Impératif de \"to be\" : \"Be\"."}'),
  (7, 'true_false', '{"statement": "The negative imperative uses \"don''t\" + verb.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"don''t\" + verbe est bien correct."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Don''t", "touch", "that!"], "correct_sentence": "Don''t touch that!", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ go to the cinema!", "options": ["Let''s", "Lets", "Let", "Letting"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Let''s\" (let us) pour suggérer."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " have lunch together. (proposons)", "correct_answers": ["Let''s"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Proposons\" = \"Let''s\"."}'),
  (7, 'true_false', '{"statement": "\"Let''s\" is used to suggest doing something together.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"let''s\" sert bien à proposer ensemble."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Let''s", "not", "argue", "about", "it."], "correct_sentence": "Let''s not argue about it.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ we go for a walk?", "options": ["Why don''t", "How about", "Let''s", "Why"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Why don''t we\" propose une activité."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " going to the beach? (que dirais-tu de)", "correct_answers": ["How about"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Que dirais-tu de\" = \"How about\"."}'),
  (7, 'true_false', '{"statement": "\"How about\" is followed by a verb + ing.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"how about\" est bien suivi de -ing."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Why", "don''t", "we", "meet", "tomorrow?"], "correct_sentence": "Why don''t we meet tomorrow?", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Comment dit-on \"s''il vous plaît\" ?", "options": ["Thanks", "Please", "Sorry", "Excuse me"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"S''il vous plaît\" = \"please\"."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " me, where is the exit? (excusez-moi)", "correct_answers": ["Excuse"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Excusez-moi\" = \"Excuse me\"."}'),
  (7, 'true_false', '{"statement": "\"I''m sorry\" is used to apologize.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien utilisé pour s''excuser."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Thank", "you", "very", "much!"], "correct_sentence": "Thank you very much!", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Proposer une alternative (Shall we / What about)', '{"rule": "\"Shall we...?\" propose poliment une action ensemble. \"What about...?\" propose une alternative ou une idée, suivi d''un nom ou d''un verbe en -ing.", "table": [{"subject": "Shall we...?", "affirmative": "Et si on... ? (poli)", "negative": "—"}, {"subject": "What about...?", "affirmative": "Et si... ?", "negative": "—"}], "example": {"en": "Shall we order pizza? What about Thai food instead?", "fr": "Et si on commandait une pizza ? Et de la cuisine thaï à la place ?"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ we start now?", "options": ["Shall", "Should", "Must", "Will"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Proposition polie = \"Shall we\"."}'),
  (2, 'qcm', '{"question": "Complète : What about ___ (go) to the park?", "options": ["go", "going", "to go", "goes"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"What about\" + -ing : \"going\"."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " we try a new restaurant? (et si)", "correct_answers": ["Shall"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Shall we\" propose poliment."}'),
  (4, 'true_false', '{"statement": "\"Shall we?\" is typically used with \"I\" or \"we\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"shall\" s''utilise bien avec I/we."}'),
  (5, 'matching', '{"instruction": "Relie la proposition à sa traduction.", "pairs": [{"left": "Shall we dance?", "right": "On danse ?"}, {"left": "What about tomorrow?", "right": "Et demain ?"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["What", "about", "meeting", "at", "noon?"], "correct_sentence": "What about meeting at noon?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : ___ we leave a bit earlier?", "options": ["Shall", "Do", "Are", "Can"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Suggestion polie = \"Shall we\"."}'),
  (8, 'fill_blank', '{"sentence_before": "What ", "sentence_after": " trying something new? (à propos de)", "correct_answers": ["about"], "feedback_correct": "Correct !", "feedback_incorrect": "\"What about\" propose une alternative."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Accepter et refuser une invitation', '{"rule": "Pour répondre à une invitation, on peut accepter (\"I''d love to\") ou refuser poliment (\"I''m afraid I can''t\").", "table": [{"subject": "Accepter", "affirmative": "I''d love to! / Sounds great!", "negative": "—"}, {"subject": "Refuser poliment", "affirmative": "I''m afraid I can''t. / Maybe another time.", "negative": "—"}], "example": {"en": "Would you like to join us? — I''d love to! / I''m afraid I can''t, I''m busy.", "fr": "Tu veux te joindre à nous ? — Avec plaisir ! / Je crains de ne pas pouvoir, je suis occupé."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I''d love to!\" exprime :", "options": ["Un refus", "Une acceptation enthousiaste", "De l''indifférence", "De la colère"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"I''d love to!\" = acceptation enthousiaste."}'),
  (2, 'qcm', '{"question": "Comment refuser poliment ?", "options": ["No way!", "I''m afraid I can''t.", "Never!", "Whatever."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"I''m afraid I can''t\" est un refus poli."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " another time, maybe? (peut-être une autre fois)", "correct_answers": ["Maybe"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Peut-être\" = \"Maybe\"."}'),
  (4, 'true_false', '{"statement": "\"I''m afraid I can''t\" is a polite way to decline.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une façon polie de refuser."}'),
  (5, 'matching', '{"instruction": "Relie la réponse à son sens.", "pairs": [{"left": "Sounds great!", "right": "acceptation"}, {"left": "I''m busy that day.", "right": "refus"}, {"left": "Let me check.", "right": "hésitation"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''d", "love", "to", "come!"], "correct_sentence": "I''d love to come!", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Sounds great!\" exprime :", "options": ["Un refus", "Une acceptation", "Une question", "Une excuse"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Sounds great!\" = acceptation enthousiaste."}'),
  (8, 'fill_blank', '{"sentence_before": "I''m ", "sentence_after": " I can''t make it. (je crains)", "correct_answers": ["afraid"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Je crains\" = \"I''m afraid\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Donner un ordre poliment (au travail)', '{"rule": "Pour donner une instruction sans paraître brusque, on adoucit l''impératif avec \"please\", ou on utilise une question polie (\"Could you...?\").", "table": [{"subject": "Please + impératif", "affirmative": "Please send the report.", "negative": "—"}, {"subject": "Could you...?", "affirmative": "Could you send the report?", "negative": "—"}], "example": {"en": "Could you please close the door? Thanks!", "fr": "Pourriez-vous fermer la porte s''il vous plaît ? Merci !"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle formule est la plus polie au travail ?", "options": ["Close the door!", "Could you close the door, please?", "Door!", "Now!"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Could you...please?\" est la plus polie."}'),
  (2, 'qcm', '{"question": "Complète : ___ send me the file, please?", "options": ["Could you", "You could", "Can", "Must"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Could you\" adoucit la demande."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " sit down. (asseyez-vous s''il vous plaît)", "correct_answers": ["Please"], "feedback_correct": "Correct !", "feedback_incorrect": "\"S''il vous plaît\" adoucit l''impératif."}'),
  (4, 'true_false', '{"statement": "\"Could you\" is more polite than a direct imperative.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"Could you\" est bien plus poli."}'),
  (5, 'matching', '{"instruction": "Relie la formule à son niveau de politesse.", "pairs": [{"left": "Do it now!", "right": "brusque"}, {"left": "Could you do it, please?", "right": "poli"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Could", "you", "help", "me,", "please?"], "correct_sentence": "Could you help me, please?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Ajouter \"please\" à un impératif le rend :", "options": ["Plus brusque", "Plus poli", "Incompréhensible", "Négatif"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Please\" adoucit l''impératif."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " you email me the details? (pourriez-vous)", "correct_answers": ["Could", "Would"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Pourriez-vous\" = \"Could you\" ou \"Would you\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : suggestions et politesse', '{"rule": "Cette leçon combine impératif, let''s, suggestions (why don''t we, shall we), et formules de politesse pour interagir naturellement.", "table": [{"subject": "Suggestion directe", "affirmative": "Let''s go! Shall we go?", "negative": "—"}, {"subject": "Suggestion douce", "affirmative": "Why don''t we go? How about going?", "negative": "—"}, {"subject": "Politesse", "affirmative": "Could you...? Please...", "negative": "—"}], "example": {"en": "Shall we go out tonight? Why don''t we try that new restaurant? Could you book a table, please?", "fr": "On sort ce soir ? Et si on essayait ce nouveau restaurant ? Pourrais-tu réserver une table s''il te plaît ?"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 15 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ we order some food?", "options": ["Shall", "Must", "Do", "Have"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Proposition polie = \"Shall\"."}'),
  (2, 'qcm', '{"question": "Quelle formule est une suggestion directe ?", "options": ["Let''s go!", "Could you go?", "I''m afraid not.", "Please go."], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Let''s go!\" est une suggestion directe."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " don''t we ask him? (pourquoi ne pas)", "correct_answers": ["Why"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Pourquoi ne pas\" = \"Why don''t we\"."}'),
  (4, 'true_false', '{"statement": "\"Could you please...?\" combines a suggestion with politeness.", "correct_answer": true, "feedback_correct": "Exact, bilan de l''unité réussi !", "feedback_incorrect": "Faux — cette formule combine bien les deux."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque formule à sa fonction.", "pairs": [{"left": "Let''s eat!", "right": "suggestion directe"}, {"left": "How about eating?", "right": "suggestion douce"}, {"left": "Could you pass the salt?", "right": "demande polie"}], "feedback_correct": "Parfait, bilan des suggestions réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Why", "don''t", "we", "try", "something", "new?"], "correct_sentence": "Why don''t we try something new?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : ___ about going to the cinema tonight?", "options": ["What", "Shall", "Let''s", "Why"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"What about\" propose une idée."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " you please close the window? (pourriez-vous)", "correct_answers": ["Could", "Would"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Pourriez-vous\" = \"Could you\"."}')
) as v(position, type, content);
