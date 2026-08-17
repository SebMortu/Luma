-- ============================================
-- LUMA — Unité 17 (B1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ been working here for six months.", "options": ["have", "has", "had", "having"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", on utilise \"have been\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She has been ", "sentence_after": " (study) all day.", "correct_answers": ["studying"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Study\" + ing = \"studying\"."}'),
  (7, 'true_false', '{"statement": "The present perfect continuous emphasizes the duration of an ongoing action.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage principal."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["They", "have", "been", "waiting", "for", "hours."], "correct_sentence": "They have been waiting for hours.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ (read) three books this month. (résultat/quantité)", "options": ["have read", "have been reading", "read", "am reading"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Résultat quantifiable = present perfect simple."}'),
  (6, 'fill_blank', '{"sentence_before": "My eyes hurt because I ", "sentence_after": " (read) all day. (durée/cause)", "correct_answers": ["have been reading"], "feedback_correct": "Correct !", "feedback_incorrect": "Durée expliquant un état = present perfect continuous."}'),
  (7, 'true_false', '{"statement": "\"I have written five emails\" focuses on quantity/result.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — le simple met bien l''accent sur le résultat."}'),
  (8, 'matching', '{"instruction": "Relie la phrase à sa nuance.", "pairs": [{"left": "I have painted the wall.", "right": "résultat visible"}, {"left": "I have been painting all day.", "right": "durée de l''action"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I have been living here ___ 2018.", "options": ["for", "since", "during", "at"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Point de départ = \"since\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She has been working ", "sentence_after": " three hours. (durée)", "correct_answers": ["for"], "feedback_correct": "Correct !", "feedback_incorrect": "Durée = \"for\"."}'),
  (7, 'true_false', '{"statement": "\"Since\" and \"for\" work the same way with the continuous as with the simple.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — la règle est bien identique."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "have", "been", "talking", "for", "an", "hour."], "correct_sentence": "We have been talking for an hour.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Laquelle est correcte ?", "options": ["I have been knowing him for years.", "I have known him for years.", "I am knowing him.", "I know him for years."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Know\" ne prend jamais la forme continuous."}'),
  (6, 'fill_blank', '{"sentence_before": "I have ", "sentence_after": " this company for ten years. (owned, verbe d''état)", "correct_answers": ["owned"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Own\" reste au present perfect simple."}'),
  (7, 'true_false', '{"statement": "\"Believe\" can be used in the present perfect continuous.", "correct_answer": false, "feedback_correct": "Exact — \"believe\" est un verbe d''état.", "feedback_incorrect": "Faux — \"believe\" ne prend jamais le continuous."}'),
  (8, 'matching', '{"instruction": "Classe le verbe : autorisé au continuous ou non ?", "pairs": [{"left": "work", "right": "autorisé"}, {"left": "believe", "right": "interdit"}, {"left": "wait", "right": "autorisé"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Résultat vs processus avec le present perfect', '{"rule": "Le present perfect simple met l''accent sur le résultat final d''une action, tandis que le continuous met l''accent sur le processus ou la durée.", "table": [{"subject": "Simple (résultat)", "affirmative": "I have cleaned the kitchen. (c''est propre maintenant)", "negative": "—"}, {"subject": "Continuous (processus)", "affirmative": "I have been cleaning the kitchen. (je suis en train de le faire depuis un moment)", "negative": "—"}], "example": {"en": "I have written the report. I have been writing it since 8am.", "fr": "J''ai écrit le rapport. Je l''écris depuis 8h."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I have cleaned my room\" met l''accent sur :", "options": ["La durée", "Le résultat", "Le futur", "L''habitude"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le simple met l''accent sur le résultat."}'),
  (2, 'qcm', '{"question": "\"I have been cleaning my room\" met l''accent sur :", "options": ["Le résultat final", "Le processus/la durée", "Une capacité", "Un ordre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le continuous met l''accent sur le processus."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (finish) the report. (résultat)", "correct_answers": ["have finished"], "feedback_correct": "Correct !", "feedback_incorrect": "Résultat final = present perfect simple."}'),
  (4, 'true_false', '{"statement": "Both forms can sometimes describe the same situation with different emphasis.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien possible avec une nuance différente."}'),
  (5, 'matching', '{"instruction": "Relie la phrase à son accent (résultat/processus).", "pairs": [{"left": "I have read the book.", "right": "résultat"}, {"left": "I have been reading all night.", "right": "processus"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "painted", "the", "whole", "house."], "correct_sentence": "I have painted the whole house.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She ___ (write) five chapters so far. (résultat quantifié)", "options": ["has written", "has been writing", "writes", "wrote"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Quantité/résultat = simple."}'),
  (8, 'fill_blank', '{"sentence_before": "I''m exhausted, I ", "sentence_after": " (run) for two hours. (processus, cause de fatigue)", "correct_answers": ["have been running"], "feedback_correct": "Correct !", "feedback_incorrect": "Durée expliquant un état = continuous."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Décrire des changements récents', '{"rule": "Le present perfect (simple ou continuous) est idéal pour décrire des changements récents qui ont un impact sur le présent.", "table": [{"subject": "improve", "affirmative": "s''améliorer", "negative": "—"}, {"subject": "change", "affirmative": "changer", "negative": "—"}, {"subject": "get worse", "affirmative": "empirer", "negative": "—"}], "example": {"en": "My English has improved a lot since I started this app.", "fr": "Mon anglais s''est beaucoup amélioré depuis que j''ai commencé cette appli."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Prices ___ a lot recently.", "options": ["have increased", "increase", "increased", "are increasing"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Changement récent avec impact présent = present perfect."}'),
  (2, 'qcm', '{"question": "\"Get worse\" veut dire :", "options": ["S''améliorer", "Empirer", "Rester pareil", "Disparaître"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Get worse\" = empirer."}'),
  (3, 'fill_blank', '{"sentence_before": "My skills have ", "sentence_after": " a lot this year. (se sont améliorées)", "correct_answers": ["improved"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Improve\" au participe : \"improved\"."}'),
  (4, 'true_false', '{"statement": "\"Things have changed since last year\" is a correct present perfect sentence.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien correct grammaticalement."}'),
  (5, 'matching', '{"instruction": "Relie le verbe de changement à sa traduction.", "pairs": [{"left": "grow", "right": "grandir/croître"}, {"left": "decrease", "right": "diminuer"}, {"left": "develop", "right": "se développer"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "situation", "has", "improved", "recently."], "correct_sentence": "The situation has improved recently.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Things ___ better since we talked.", "options": ["have gotten", "get", "got", "are getting"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Changement avec lien au présent = present perfect."}'),
  (8, 'fill_blank', '{"sentence_before": "The company has ", "sentence_after": " significantly this year. (a grandi)", "correct_answers": ["grown"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Grow\" au participe irrégulier : \"grown\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Lately et recently', '{"rule": "\"Lately\" et \"recently\" (récemment) accompagnent souvent le present perfect pour parler d''une période proche du présent.", "table": [{"subject": "lately", "affirmative": "récemment/ces derniers temps", "negative": "—"}, {"subject": "recently", "affirmative": "récemment", "negative": "—"}], "example": {"en": "I haven''t seen him lately. Have you talked to her recently?", "fr": "Je ne l''ai pas vu récemment. Tu lui as parlé récemment ?"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Lately\" est généralement utilisé avec :", "options": ["Le present simple", "Le present perfect", "Le futur", "L''impératif"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Lately\" s''utilise avec le present perfect."}'),
  (2, 'qcm', '{"question": "Complète : Have you seen any good movies ___?", "options": ["ago", "recently", "yesterday", "last week"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Recently\" convient avec present perfect."}'),
  (3, 'fill_blank', '{"sentence_before": "I haven''t been feeling well ", "sentence_after": ". (ces derniers temps)", "correct_answers": ["lately"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Ces derniers temps\" = \"lately\"."}'),
  (4, 'true_false', '{"statement": "\"Lately\" and \"recently\" have a similar meaning.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — ils ont bien un sens proche."}'),
  (5, 'matching', '{"instruction": "Relie l''expression de temps à son usage typique.", "pairs": [{"left": "yesterday", "right": "past simple"}, {"left": "recently", "right": "present perfect"}, {"left": "next week", "right": "futur"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''ve", "been", "very", "busy", "lately."], "correct_sentence": "I''ve been very busy lately.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She has changed a lot ___.", "options": ["yesterday", "recently", "ago", "last year"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Recently\" convient au present perfect."}'),
  (8, 'fill_blank', '{"sentence_before": "Have you traveled anywhere ", "sentence_after": "? (récemment)", "correct_answers": ["recently", "lately"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Récemment\" = \"recently\" ou \"lately\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : present perfect simple et continuous', '{"rule": "Cette leçon consolide l''ensemble du present perfect (simple et continuous) vu dans cette unité : formation, nuances, for/since, verbes d''état, et adverbes récents.", "table": [{"subject": "Simple", "affirmative": "résultat/quantité : I have finished", "negative": "—"}, {"subject": "Continuous", "affirmative": "durée/processus : I have been working", "negative": "—"}], "example": {"en": "I have been learning English for two years, and I have made a lot of progress recently.", "fr": "J''apprends l''anglais depuis deux ans, et j''ai fait beaucoup de progrès récemment."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 17 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ (learn) English for two years. (durée)", "options": ["have learned", "have been learning", "learn", "learned"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Durée continue = present perfect continuous."}'),
  (2, 'qcm', '{"question": "Complète : I ___ (finish) my homework. (résultat)", "options": ["have finished", "have been finishing", "finish", "am finishing"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Résultat = present perfect simple."}'),
  (3, 'fill_blank', '{"sentence_before": "She has ", "sentence_after": " here since 2019. (a travaillé, present perfect simple ok aussi)", "correct_answers": ["worked", "been working"], "feedback_correct": "Correct !", "feedback_incorrect": "Les deux formes sont possibles selon la nuance voulue."}'),
  (4, 'true_false', '{"statement": "\"Know\" and \"believe\" never take the continuous form.", "correct_answer": true, "feedback_correct": "Exact, bilan complet !", "feedback_incorrect": "Faux — ces verbes d''état ne prennent jamais le continuous."}'),
  (5, 'matching', '{"instruction": "Bilan : relie la phrase à sa forme correcte.", "pairs": [{"left": "Résultat visible", "right": "present perfect simple"}, {"left": "Durée/processus en cours", "right": "present perfect continuous"}, {"left": "Verbe d''état (know, believe)", "right": "toujours simple"}], "feedback_correct": "Parfait, bilan de l''unité réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "been", "studying", "hard", "lately."], "correct_sentence": "I have been studying hard lately.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : How long ___ you ___ (wait)?", "options": ["have / been waiting", "do / wait", "did / wait", "are / waiting"], "correct_index": 0, "feedback_correct": "Correct ! Bilan de l''unité réussi.", "feedback_incorrect": "Question sur une durée en cours = present perfect continuous."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " always known that. (ai toujours su, verbe d''état)", "correct_answers": ["have"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Know\" reste au present perfect simple."}')
) as v(position, type, content);
