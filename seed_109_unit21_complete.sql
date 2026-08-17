-- ============================================
-- LUMA — Unité 21 (B1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Au discours rapporté, \"I am tired\" devient :", "options": ["He said he is tired.", "He said he was tired.", "He says he was tired.", "He said he is being tired."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Present → past : \"was tired\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She said she ", "sentence_after": " (be) happy. (present → past)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "Backshift : present → past."}'),
  (7, 'true_false', '{"statement": "In reported speech, the present tense usually shifts to the past.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien la règle du backshift."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "said", "he", "was", "busy."], "correct_sentence": "He said he was busy.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"I like coffee,\" she said. → She said ___.", "options": ["she likes coffee", "she liked coffee", "she like coffee", "she is liking coffee"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Backshift : \"she liked coffee\"."}'),
  (6, 'fill_blank', '{"sentence_before": "He told me he ", "sentence_after": " (go) to the party. (was going)", "correct_answers": ["was going"], "feedback_correct": "Correct !", "feedback_incorrect": "Present continuous → past continuous."}'),
  (7, 'true_false', '{"statement": "\"Tell\" needs an object (tell someone), \"say\" doesn''t.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"tell\" a bien besoin d''un objet."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "told", "me", "she", "was", "tired."], "correct_sentence": "She told me she was tired.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Are you ready?\" → He asked ___.", "options": ["if I was ready", "am I ready", "if I am ready", "was I ready"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Question fermée rapportée : \"if\" + sujet + verbe."}'),
  (6, 'fill_blank', '{"sentence_before": "She asked me ", "sentence_after": " I was hungry. (si)", "correct_answers": ["if", "whether"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Si\" = \"if\" ou \"whether\"."}'),
  (7, 'true_false', '{"statement": "Reported yes/no questions don''t use question word order.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — l''ordre redevient affirmatif (sujet + verbe)."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "asked", "if", "I", "was", "okay."], "correct_sentence": "He asked if I was okay.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Where do you live?\" → She asked ___.", "options": ["where I lived", "where do I live", "where did I live", "where I live"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Mot interrogatif + sujet + verbe au passé."}'),
  (6, 'fill_blank', '{"sentence_before": "He asked me what time it ", "sentence_after": ". (was)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "Backshift : \"was\"."}'),
  (7, 'true_false', '{"statement": "Reported wh-questions keep the question word but lose the auxiliary \"do/did\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien la règle."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "asked", "where", "I", "worked."], "correct_sentence": "She asked where I worked.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Rapporter des ordres et des demandes', '{"rule": "Pour rapporter un ordre ou une demande, on utilise \"tell/ask someone to + infinitif\" plutôt que le backshift classique.", "table": [{"subject": "tell someone to", "affirmative": "He told me to wait.", "negative": "He told me not to wait."}, {"subject": "ask someone to", "affirmative": "She asked me to help.", "negative": "She asked me not to help."}], "example": {"en": "\"Close the door,\" he said. → He told me to close the door.", "fr": "\"Ferme la porte\", a-t-il dit. → Il m''a dit de fermer la porte."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Sit down!\" → He told me ___.", "options": ["to sit down", "sit down", "sitting down", "sat down"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Ordre rapporté : \"to\" + infinitif."}'),
  (2, 'qcm', '{"question": "\"Please help me,\" she said. → She asked me ___.", "options": ["to help her", "help her", "helping her", "helped her"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Demande rapportée : \"to help her\"."}'),
  (3, 'fill_blank', '{"sentence_before": "He told me ", "sentence_after": " be late. (not to)", "correct_answers": ["not to"], "feedback_correct": "Correct !", "feedback_incorrect": "Ordre négatif rapporté : \"not to\"."}'),
  (4, 'true_false', '{"statement": "Reported commands use \"tell someone to + infinitive\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien la structure correcte."}'),
  (5, 'matching', '{"instruction": "Relie l''ordre direct à sa version rapportée.", "pairs": [{"left": "\"Wait here.\"", "right": "He told me to wait there."}, {"left": "\"Don''t be late.\"", "right": "She told me not to be late."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "asked", "me", "to", "close", "the", "window."], "correct_sentence": "She asked me to close the window.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Don''t touch that!\" → He told me ___.", "options": ["not to touch that", "to not touch that", "don''t touch that", "touching that"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Not to\" + infinitif pour un ordre négatif."}'),
  (8, 'fill_blank', '{"sentence_before": "She asked me ", "sentence_after": " open the window. (to)", "correct_answers": ["to"], "feedback_correct": "Correct !", "feedback_incorrect": "Demande rapportée : \"to open\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Les verbes introducteurs variés (suggest, explain, warn)', '{"rule": "Au-delà de say/tell/ask, d''autres verbes introducteurs nuancent le discours rapporté : \"suggest\" (suggérer), \"explain\" (expliquer), \"warn\" (avertir).", "table": [{"subject": "suggest", "affirmative": "suggérer", "negative": "—"}, {"subject": "explain", "affirmative": "expliquer", "negative": "—"}, {"subject": "warn", "affirmative": "avertir", "negative": "—"}], "example": {"en": "She suggested going to the beach. He warned me not to be late.", "fr": "Elle a suggéré d''aller à la plage. Il m''a averti de ne pas être en retard."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Suggest\" veut dire :", "options": ["Ordonner", "Suggérer", "Interdire", "Menacer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Suggest\" = suggérer."}'),
  (2, 'qcm', '{"question": "\"Warn\" veut dire :", "options": ["Féliciter", "Avertir", "Remercier", "Ignorer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Warn\" = avertir."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " that the road was dangerous. (a averti)", "correct_answers": ["warned"], "feedback_correct": "Correct !", "feedback_incorrect": "\"A averti\" = \"warned\"."}'),
  (4, 'true_false', '{"statement": "\"Suggest\" is often followed by verb + ing.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"suggest\" est bien suivi de -ing."}'),
  (5, 'matching', '{"instruction": "Relie le verbe introducteur à sa traduction.", "pairs": [{"left": "explain", "right": "expliquer"}, {"left": "admit", "right": "admettre"}, {"left": "recommend", "right": "recommander"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "explained", "that", "he", "was", "busy."], "correct_sentence": "He explained that he was busy.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She suggested ___ (go) earlier.", "options": ["going", "to go", "go", "went"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Suggest\" + -ing : \"going\"."}'),
  (8, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " me not to touch it. (a averti)", "correct_answers": ["warned"], "feedback_correct": "Correct !", "feedback_incorrect": "\"A averti\" = \"warned\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Les changements de temps et de lieu au discours rapporté', '{"rule": "En plus du backshift des temps, les expressions de temps et de lieu changent : \"today\"→\"that day\", \"here\"→\"there\", \"tomorrow\"→\"the next day\".", "table": [{"subject": "today → that day", "affirmative": "—", "negative": "—"}, {"subject": "tomorrow → the next day", "affirmative": "—", "negative": "—"}, {"subject": "here → there", "affirmative": "—", "negative": "—"}], "example": {"en": "\"I''ll see you tomorrow,\" she said. → She said she would see me the next day.", "fr": "\"Je te vois demain\", a-t-elle dit. → Elle a dit qu''elle me verrait le lendemain."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Tomorrow\" devient au discours rapporté :", "options": ["the next day", "yesterday", "today", "tomorrow"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Tomorrow\" → \"the next day\"."}'),
  (2, 'qcm', '{"question": "\"Here\" devient au discours rapporté :", "options": ["there", "here", "somewhere", "nowhere"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Here\" → \"there\"."}'),
  (3, 'fill_blank', '{"sentence_before": "\"I was here yesterday\" becomes: She said she had been ", "sentence_after": " the day before.", "correct_answers": ["there"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Here\" devient \"there\"."}'),
  (4, 'true_false', '{"statement": "\"This\" often becomes \"that\" in reported speech.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"this\" devient bien souvent \"that\"."}'),
  (5, 'matching', '{"instruction": "Relie l''expression directe à sa version rapportée.", "pairs": [{"left": "today", "right": "that day"}, {"left": "tomorrow", "right": "the next day"}, {"left": "yesterday", "right": "the day before"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "said", "she", "would", "call", "the", "next", "day."], "correct_sentence": "She said she would call the next day.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Yesterday\" devient au discours rapporté :", "options": ["the day before", "tomorrow", "today", "yesterday"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Yesterday\" → \"the day before\"."}'),
  (8, 'fill_blank', '{"sentence_before": "\"I''ll finish this today,\" he said. → He said he would finish ", "sentence_after": " that day.", "correct_answers": ["it"], "feedback_correct": "Correct !", "feedback_incorrect": "\"This\" devient \"it\" ou \"that\" selon le contexte."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : le discours rapporté complet', '{"rule": "Cette leçon combine tout le discours rapporté vu dans l''unité : backshift, affirmations, questions fermées/ouvertes, ordres, verbes introducteurs variés, et changements temps/lieu.", "table": [{"subject": "Affirmation", "affirmative": "He said he was tired.", "negative": "—"}, {"subject": "Question", "affirmative": "She asked if/where...", "negative": "—"}, {"subject": "Ordre", "affirmative": "He told me to...", "negative": "—"}], "example": {"en": "She said she was busy that day. She asked if I could help the next day. She told me to call her.", "fr": "Elle a dit qu''elle était occupée ce jour-là. Elle a demandé si je pouvais aider le lendemain. Elle m''a dit de l''appeler."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 21 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I am busy,\" she said. → She said ___.", "options": ["she was busy", "she is busy", "she busy was", "was she busy"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Backshift : \"she was busy\"."}'),
  (2, 'qcm', '{"question": "\"Can you help?\" she asked. → She asked ___.", "options": ["if I could help", "can I help", "if I can help", "could I help"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Question fermée rapportée avec backshift : \"if I could help\"."}'),
  (3, 'fill_blank', '{"sentence_before": "He told me ", "sentence_after": " wait for him. (to)", "correct_answers": ["to"], "feedback_correct": "Correct !", "feedback_incorrect": "Ordre rapporté : \"to wait\"."}'),
  (4, 'true_false', '{"statement": "Reported speech requires backshift, word order changes, and time/place adjustments.", "correct_answer": true, "feedback_correct": "Exact, bilan du discours rapporté réussi !", "feedback_incorrect": "Faux — ce sont bien les trois éléments clés."}'),
  (5, 'matching', '{"instruction": "Bilan : relie le type de discours rapporté à son exemple.", "pairs": [{"left": "Affirmation", "right": "He said he was tired."}, {"left": "Question fermée", "right": "She asked if I was ready."}, {"left": "Ordre", "right": "He told me to leave."}], "feedback_correct": "Parfait, bilan du discours rapporté réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "asked", "where", "I", "was", "going."], "correct_sentence": "She asked where I was going.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"I''ll call tomorrow,\" he said. → He said he would call ___.", "options": ["the next day", "tomorrow", "today", "yesterday"], "correct_index": 0, "feedback_correct": "Correct ! Bilan du discours rapporté réussi.", "feedback_incorrect": "\"Tomorrow\" devient \"the next day\"."}'),
  (8, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " me not to worry. (a dit)", "correct_answers": ["told"], "feedback_correct": "Correct !", "feedback_incorrect": "\"A dit\" (avec objet) = \"told\"."}')
) as v(position, type, content);
