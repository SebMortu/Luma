-- ============================================
-- LUMA — Unité 23 (B1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I enjoy ___ (read).", "options": ["reading", "to read", "read", "reads"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Enjoy\" est suivi du gérondif : \"reading\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She finished ", "sentence_after": " (write) the letter.", "correct_answers": ["writing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Finish\" + gérondif : \"writing\"."}'),
  (7, 'true_false', '{"statement": "\"Avoid\" is followed by the gerund.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"avoid\" est bien suivi du gérondif."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "hate", "waiting", "in", "line."], "correct_sentence": "I hate waiting in line.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I want ___ (leave).", "options": ["to leave", "leaving", "leave", "left"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Want\" est suivi de l''infinitif : \"to leave\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She decided ", "sentence_after": " (stay) home.", "correct_answers": ["to stay"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Decide\" + infinitif : \"to stay\"."}'),
  (7, 'true_false', '{"statement": "\"Promise\" is followed by the infinitive.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"promise\" est bien suivi de l''infinitif."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "hope", "to", "see", "you", "soon."], "correct_sentence": "I hope to see you soon.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"I stopped smoking\" veut dire :", "options": ["J''ai arrêté de fumer", "Je me suis arrêté pour fumer", "Je fume encore", "J''ai commencé à fumer"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Stop + gérondif\" = arrêter de faire quelque chose."}'),
  (6, 'fill_blank', '{"sentence_before": "I stopped ", "sentence_after": " (buy) a coffee. (pour acheter)", "correct_answers": ["to buy"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Stop + infinitif\" = s''arrêter pour faire quelque chose."}'),
  (7, 'true_false', '{"statement": "\"Remember to do\" and \"remember doing\" mean exactly the same thing.", "correct_answer": false, "feedback_correct": "Exact — le sens change selon la construction.", "feedback_incorrect": "Faux — le sens diffère selon gérondif ou infinitif."}'),
  (8, 'matching', '{"instruction": "Relie la construction à son sens.", "pairs": [{"left": "remember to call", "right": "ne pas oublier d''appeler (futur)"}, {"left": "remember calling", "right": "se souvenir d''avoir appelé (passé)"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I love ___ (travel).", "options": ["traveling", "to travel", "les deux sont possibles", "travel"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Love\" accepte les deux constructions."}'),
  (6, 'fill_blank', '{"sentence_before": "I need ", "sentence_after": " (finish) this today.", "correct_answers": ["to finish"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Need\" + infinitif : \"to finish\"."}'),
  (7, 'true_false', '{"statement": "\"Start\" can be followed by both gerund and infinitive.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"start\" accepte bien les deux."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "started", "crying", "suddenly."], "correct_sentence": "She started crying suddenly.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Verbes suivis de préposition + gérondif', '{"rule": "Après une préposition (about, of, for, at...), le verbe qui suit prend toujours la forme -ing (gérondif), jamais l''infinitif.", "table": [{"subject": "interested in", "affirmative": "interested in learning", "negative": "—"}, {"subject": "good at", "affirmative": "good at cooking", "negative": "—"}, {"subject": "afraid of", "affirmative": "afraid of flying", "negative": "—"}], "example": {"en": "I''m interested in learning Spanish. She''s good at singing.", "fr": "Je suis intéressé par l''apprentissage de l''espagnol. Elle est douée pour chanter."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I''m afraid ___ (fly).", "options": ["of flying", "to fly", "fly", "flew"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Après une préposition : gérondif \"flying\"."}'),
  (2, 'qcm', '{"question": "Complète : She''s good ___ (paint).", "options": ["at painting", "to paint", "paint", "painted"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Good at\" + gérondif : \"painting\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I''m interested in ", "sentence_after": " (learn) more.", "correct_answers": ["learning"], "feedback_correct": "Correct !", "feedback_incorrect": "Après \"in\", gérondif : \"learning\"."}'),
  (4, 'true_false', '{"statement": "A verb after a preposition always takes the -ing form.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien toujours le gérondif."}'),
  (5, 'matching', '{"instruction": "Relie l''expression à sa préposition.", "pairs": [{"left": "interested", "right": "in"}, {"left": "good", "right": "at"}, {"left": "afraid", "right": "of"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "is", "afraid", "of", "spiders."], "correct_sentence": "She is afraid of spiders.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Thank you for ___ (help).", "options": ["helping", "to help", "help", "helped"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Après \"for\", gérondif : \"helping\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I''m tired of ", "sentence_after": " (wait).", "correct_answers": ["waiting"], "feedback_correct": "Correct !", "feedback_incorrect": "Après \"of\", gérondif : \"waiting\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Look forward to + gérondif', '{"rule": "\"Look forward to\" (avoir hâte de) se termine par \"to\" qui fonctionne comme une préposition ici — donc suivi du gérondif, pas de l''infinitif (piège fréquent).", "table": [{"subject": "look forward to + -ing", "affirmative": "I look forward to seeing you.", "negative": "—"}], "example": {"en": "I''m looking forward to meeting you next week.", "fr": "J''ai hâte de te rencontrer la semaine prochaine."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I look forward to ___ (see) you.", "options": ["seeing", "see", "to see", "seen"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Piège : \"to\" ici est une préposition, suivi du gérondif."}'),
  (2, 'qcm', '{"question": "Pourquoi \"look forward to\" est-il suivi du gérondif ?", "options": ["Par hasard", "Car \"to\" fonctionne comme préposition ici", "Erreur fréquente à éviter absolument", "Ce n''est jamais suivi de -ing"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"To\" est ici une préposition, pas la marque de l''infinitif."}'),
  (3, 'fill_blank', '{"sentence_before": "We look forward to ", "sentence_after": " (hear) from you.", "correct_answers": ["hearing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Look forward to\" + gérondif : \"hearing\"."}'),
  (4, 'true_false', '{"statement": "\"I look forward to see you\" is correct.", "correct_answer": false, "feedback_correct": "Exact — il faut \"seeing\", pas \"see\".", "feedback_incorrect": "Faux — c''est une erreur fréquente, il faut le gérondif."}'),
  (5, 'matching', '{"instruction": "Relie l''expression à sa construction correcte.", "pairs": [{"left": "look forward to", "right": "+ -ing"}, {"left": "want", "right": "+ to + base"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''m", "looking", "forward", "to", "the", "holidays."], "correct_sentence": "I''m looking forward to the holidays.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She''s looking forward to ___ (start) her new job.", "options": ["starting", "start", "to start", "started"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Gérondif après \"look forward to\" : \"starting\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I look forward to ", "sentence_after": " you soon. (voir)", "correct_answers": ["seeing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Voir\" (gérondif) = \"seeing\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Used to vs be used to vs get used to', '{"rule": "Ces trois structures se ressemblent mais diffèrent totalement : \"used to + base\" (habitude passée révolue), \"be used to + -ing\" (être habitué à), \"get used to + -ing\" (s''habituer à, processus).", "table": [{"subject": "used to + base", "affirmative": "I used to smoke. (habitude passée, terminée)", "negative": "—"}, {"subject": "be used to + -ing", "affirmative": "I am used to working late. (habitué)", "negative": "—"}, {"subject": "get used to + -ing", "affirmative": "I''m getting used to living here. (en train de s''habituer)", "negative": "—"}], "example": {"en": "I used to live in Spain. Now I''m used to living in France, but I''m still getting used to the weather.", "fr": "J''habitais en Espagne avant. Maintenant je suis habitué à vivre en France, mais je m''habitue encore au climat."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I used to play piano\" exprime :", "options": ["Une habitude actuelle", "Une habitude passée révolue", "Un processus", "Une capacité"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Used to\" = habitude passée révolue."}'),
  (2, 'qcm', '{"question": "\"I''m used to waking up early\" exprime :", "options": ["Une habitude passée", "Être habitué maintenant", "Un processus de changement", "Un ordre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Be used to\" = être habitué maintenant."}'),
  (3, 'fill_blank', '{"sentence_before": "I''m slowly ", "sentence_after": " used to the new schedule. (getting)", "correct_answers": ["getting"], "feedback_correct": "Correct !", "feedback_incorrect": "Processus d''adaptation = \"getting used to\"."}'),
  (4, 'true_false', '{"statement": "\"Used to\" is always followed by the base verb form, never -ing.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"used to\" est bien suivi de la base verbale."}'),
  (5, 'matching', '{"instruction": "Relie la structure à son sens.", "pairs": [{"left": "used to", "right": "habitude passée révolue"}, {"left": "be used to", "right": "habitué maintenant"}, {"left": "get used to", "right": "s''habituer (processus)"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "used", "to", "live", "in", "Rome."], "correct_sentence": "I used to live in Rome.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She is used to ___ (drive) on the left.", "options": ["driving", "drive", "to drive", "drove"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Be used to\" + gérondif : \"driving\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " to hate vegetables, but now I love them. (habitude passée)", "correct_answers": ["used"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Used to\" exprime une habitude passée révolue."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : gérondif, infinitif et structures spéciales', '{"rule": "Cette leçon consolide tous les usages du gérondif/infinitif de l''unité : verbes simples, verbes à sens variable, prépositions, look forward to, et used to/be used to/get used to.", "table": [{"subject": "Gérondif", "affirmative": "enjoy, avoid, finish, + prépositions", "negative": "—"}, {"subject": "Infinitif", "affirmative": "want, decide, promise, hope", "negative": "—"}, {"subject": "Spéciales", "affirmative": "used to, look forward to + -ing", "negative": "—"}], "example": {"en": "I used to hate reading, but now I enjoy reading every night. I''m looking forward to finishing this book.", "fr": "Je détestais lire avant, mais maintenant j''aime lire tous les soirs. J''ai hâte de finir ce livre."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 23 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I enjoy ___ (cook).", "options": ["cooking", "to cook", "cook", "cooked"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Enjoy\" + gérondif : \"cooking\"."}'),
  (2, 'qcm', '{"question": "Complète : I decided ___ (change) jobs.", "options": ["to change", "changing", "change", "changed"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Decide\" + infinitif : \"to change\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I''m looking forward to ", "sentence_after": " the results. (voir)", "correct_answers": ["seeing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Look forward to\" + gérondif : \"seeing\"."}'),
  (4, 'true_false', '{"statement": "\"Used to\" and \"be used to\" have completely different meanings.", "correct_answer": true, "feedback_correct": "Exact, bilan de l''unité réussi !", "feedback_incorrect": "Faux — ils ont bien des sens très différents."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque structure à sa règle.", "pairs": [{"left": "avoid + -ing", "right": "gérondif"}, {"left": "want + to", "right": "infinitif"}, {"left": "look forward to + -ing", "right": "structure spéciale"}], "feedback_correct": "Parfait, bilan gérondif/infinitif réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''m", "getting", "used", "to", "the", "new", "routine."], "correct_sentence": "I''m getting used to the new routine.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She stopped ___ (smoke) last year.", "options": ["smoking", "to smoke", "les deux sont possibles avec des sens différents", "smoke"], "correct_index": 2, "feedback_correct": "Correct ! Bilan de l''unité réussi.", "feedback_incorrect": "\"Stop\" a un sens différent selon gérondif ou infinitif."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " to walk to school as a child. (habitude passée)", "correct_answers": ["used"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Used to\" = habitude passée."}')
) as v(position, type, content);
