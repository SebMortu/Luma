-- ============================================
-- LUMA — Unité 34 (C1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Give it your all\" veut dire :", "options": ["Abandonner", "Faire de son mieux", "Ignorer", "Attendre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Give it your all\" = donner le meilleur de soi."}'),
  (6, 'fill_blank', '{"sentence_before": "She finally ", "sentence_after": " off her hard work paid off. (found)", "correct_answers": ["found"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Found off\" n''est pas correct — reformulation à l''oral."}'),
  (7, 'true_false', '{"statement": "\"Hit the jackpot\" means to achieve great unexpected success.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son sens."}'),
  (8, 'matching', '{"instruction": "Relie l''idiome à sa traduction.", "pairs": [{"left": "make it big", "right": "réussir grandement"}, {"left": "against all odds", "right": "contre toute attente"}, {"left": "pay off", "right": "porter ses fruits"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"An uphill battle\" veut dire :", "options": ["Une tâche facile", "Une lutte difficile", "Une victoire assurée", "Un jeu"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"An uphill battle\" = une lutte difficile."}'),
  (6, 'fill_blank', '{"sentence_before": "This project is a real ", "sentence_after": ". (challenge)", "correct_answers": ["challenge"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Challenge\" = défi."}'),
  (7, 'true_false', '{"statement": "\"Between a rock and a hard place\" means being stuck with two difficult options.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son sens."}'),
  (8, 'matching', '{"instruction": "Relie l''idiome de difficulté à sa traduction.", "pairs": [{"left": "a tough nut to crack", "right": "un problème difficile à résoudre"}, {"left": "hit a wall", "right": "se heurter à un obstacle"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Time flies\" veut dire :", "options": ["Le temps passe lentement", "Le temps passe vite", "Le temps s''arrête", "Il n''y a pas de temps"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Time flies\" = le temps passe vite."}'),
  (6, 'fill_blank', '{"sentence_before": "That car costs an ", "sentence_after": " and a leg! (arm)", "correct_answers": ["arm"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Cost an arm and a leg\" = coûter très cher."}'),
  (7, 'true_false', '{"statement": "\"Save for a rainy day\" means to save money for future difficulties.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son sens."}'),
  (8, 'matching', '{"instruction": "Relie l''idiome à sa traduction.", "pairs": [{"left": "on a tight budget", "right": "avec un budget serré"}, {"left": "break the bank", "right": "coûter une fortune"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Dans quel contexte utiliserait-on \"an uphill battle\" ?", "options": ["Décrire une victoire facile", "Décrire une tâche difficile", "Parler de la météo", "Parler de nourriture"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Uphill battle\" décrit une tâche difficile."}'),
  (6, 'fill_blank', '{"sentence_before": "Learning a language takes ", "sentence_after": " and effort. (time)", "correct_answers": ["time"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Time and effort\" = du temps et des efforts."}'),
  (7, 'true_false', '{"statement": "Idioms should be used naturally in context, not overused.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une bonne pratique."}'),
  (8, 'matching', '{"instruction": "Relie l''idiome au contexte approprié.", "pairs": [{"left": "hit the jackpot", "right": "réussite inattendue"}, {"left": "cost an arm and a leg", "right": "prix très élevé"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Idiomes sur la persévérance', '{"rule": "Ces idiomes expriment la persévérance et la détermination face aux obstacles : \"never give up\", \"keep your chin up\", \"push through\".", "table": [{"subject": "keep your chin up", "affirmative": "garde le moral", "negative": "—"}, {"subject": "push through", "affirmative": "persévérer malgré tout", "negative": "—"}, {"subject": "against all odds", "affirmative": "contre toute attente", "negative": "—"}], "example": {"en": "Keep your chin up, we''ll push through this together, against all odds.", "fr": "Garde le moral, on va s''en sortir ensemble, contre toute attente."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Keep your chin up\" veut dire :", "options": ["Baisser les bras", "Garder le moral", "Se moquer", "S''excuser"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Keep your chin up\" = garder le moral."}'),
  (2, 'qcm', '{"question": "\"Push through\" veut dire :", "options": ["Abandonner", "Persévérer malgré les difficultés", "Reculer", "Ignorer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Push through\" = persévérer."}'),
  (3, 'fill_blank', '{"sentence_before": "Against all ", "sentence_after": ", she succeeded. (odds)", "correct_answers": ["odds"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Against all odds\" = contre toute attente."}'),
  (4, 'true_false', '{"statement": "\"Never give up\" is a common encouragement idiom.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien un idiome d''encouragement courant."}'),
  (5, 'matching', '{"instruction": "Relie l''idiome de persévérance à sa traduction.", "pairs": [{"left": "hang in there", "right": "tiens bon"}, {"left": "keep going", "right": "continue"}, {"left": "don''t give in", "right": "ne cède pas"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "made", "it", "against", "all", "odds."], "correct_sentence": "We made it against all odds.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Hang in there\" veut dire :", "options": ["Abandonne", "Tiens bon", "Cours vite", "Reste calme uniquement"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Hang in there\" = tiens bon."}'),
  (8, 'fill_blank', '{"sentence_before": "Just ", "sentence_after": " through, you''re almost there! (push)", "correct_answers": ["push"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Push through\" = persévérer."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Idiomes sur l''échec et les erreurs', '{"rule": "Ces idiomes expriment l''échec avec nuance : \"back to square one\" (retour à la case départ), \"learn from your mistakes\", \"blessing in disguise\" (un mal pour un bien).", "table": [{"subject": "back to square one", "affirmative": "retour à la case départ", "negative": "—"}, {"subject": "blessing in disguise", "affirmative": "un mal pour un bien", "negative": "—"}], "example": {"en": "We''re back to square one, but losing that job was actually a blessing in disguise.", "fr": "On est de retour à la case départ, mais perdre cet emploi était en fait un mal pour un bien."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Back to square one\" veut dire :", "options": ["Réussite totale", "Retour au point de départ", "Progrès rapide", "Fin heureuse"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Back to square one\" = retour à la case départ."}'),
  (2, 'qcm', '{"question": "\"A blessing in disguise\" veut dire :", "options": ["Un désastre total", "Un mal pour un bien", "Une chance évidente", "Un secret"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Blessing in disguise\" = un mal pour un bien."}'),
  (3, 'fill_blank', '{"sentence_before": "Losing that game was a ", "sentence_after": " in disguise. (blessing)", "correct_answers": ["blessing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Blessing in disguise\" = un mal pour un bien."}'),
  (4, 'true_false', '{"statement": "\"Learn from your mistakes\" encourages growth after failure.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son message."}'),
  (5, 'matching', '{"instruction": "Relie l''idiome d''échec à sa traduction.", "pairs": [{"left": "a lesson learned", "right": "une leçon apprise"}, {"left": "fail forward", "right": "échouer pour progresser"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We''re", "back", "to", "square", "one."], "correct_sentence": "We''re back to square one.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Losing my job was actually a ___ in disguise.", "options": ["blessing", "curse", "problem", "mistake"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Blessing in disguise\" = un mal pour un bien."}'),
  (8, 'fill_blank', '{"sentence_before": "It''s ", "sentence_after": " to square one after that failure. (back)", "correct_answers": ["back"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Back to square one\" = retour à la case départ."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Idiomes professionnels sur la réussite', '{"rule": "Ces idiomes s''utilisent spécifiquement en contexte professionnel : \"climb the ladder\" (gravir les échelons), \"land a job\" (décrocher un emploi), \"in the driver''s seat\" (aux commandes).", "table": [{"subject": "climb the ladder", "affirmative": "gravir les échelons", "negative": "—"}, {"subject": "land a job", "affirmative": "décrocher un emploi", "negative": "—"}, {"subject": "in the driver''s seat", "affirmative": "aux commandes", "negative": "—"}], "example": {"en": "She landed a great job and is now climbing the corporate ladder quickly.", "fr": "Elle a décroché un excellent emploi et gravit maintenant rapidement les échelons de l''entreprise."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Land a job\" veut dire :", "options": ["Perdre un emploi", "Décrocher un emploi", "Quitter un emploi", "Chercher un emploi"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Land a job\" = décrocher un emploi."}'),
  (2, 'qcm', '{"question": "\"Climb the ladder\" veut dire :", "options": ["Descendre en grade", "Gravir les échelons", "Rester stagnant", "Démissionner"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Climb the ladder\" = gravir les échelons."}'),
  (3, 'fill_blank', '{"sentence_before": "She finally ", "sentence_after": " her dream job! (landed)", "correct_answers": ["landed"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Land a job\" au passé : \"landed\"."}'),
  (4, 'true_false', '{"statement": "\"In the driver''s seat\" means being in control of a situation.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son sens."}'),
  (5, 'matching', '{"instruction": "Relie l''idiome professionnel à sa traduction.", "pairs": [{"left": "call the shots", "right": "prendre les décisions"}, {"left": "get ahead", "right": "progresser/prendre de l''avance"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He''s", "finally", "in", "the", "driver''s", "seat."], "correct_sentence": "He''s finally in the driver''s seat.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Call the shots\" veut dire :", "options": ["Obéir", "Prendre les décisions", "Se cacher", "Attendre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Call the shots\" = prendre les décisions."}'),
  (8, 'fill_blank', '{"sentence_before": "She''s really ", "sentence_after": " the corporate ladder this year. (climbing)", "correct_answers": ["climbing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Climbing the ladder\" = gravir les échelons."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : tous les idiomes sur l''effort, la réussite et l''échec', '{"rule": "Cette leçon consolide tous les idiomes de l''unité liés à l''effort, la persévérance, l''échec et la réussite professionnelle, pour un anglais naturel et idiomatique.", "table": [{"subject": "Réussite", "affirmative": "hit the jackpot, land a job, pay off", "negative": "—"}, {"subject": "Difficulté", "affirmative": "uphill battle, tough nut to crack", "negative": "—"}, {"subject": "Persévérance", "affirmative": "hang in there, push through, against all odds", "negative": "—"}], "example": {"en": "It was an uphill battle, but she never gave up. Against all odds, she landed her dream job — proof that hard work really does pay off.", "fr": "C''était une lutte difficile, mais elle n''a jamais abandonné. Contre toute attente, elle a décroché son emploi de rêve — la preuve que le travail acharné finit par payer."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : It was an ___ battle, but we made it.", "options": ["uphill", "downhill", "easy", "quick"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Uphill battle\" = lutte difficile."}'),
  (2, 'qcm', '{"question": "\"Pay off\" (au sens figuré) veut dire :", "options": ["Payer une facture", "Porter ses fruits", "Perdre de l''argent", "S''endetter"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Pay off\" (figuré) = porter ses fruits."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " all odds, she succeeded. (against)", "correct_answers": ["Against"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Against all odds\" = contre toute attente."}'),
  (4, 'true_false', '{"statement": "Using idioms naturally makes speech sound more fluent and native-like.", "correct_answer": true, "feedback_correct": "Exact, bravo, bilan des idiomes réussi !", "feedback_incorrect": "Faux — c''est bien vrai."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque idiome à sa catégorie.", "pairs": [{"left": "hit the jackpot", "right": "réussite"}, {"left": "back to square one", "right": "échec"}, {"left": "hang in there", "right": "persévérance"}], "feedback_correct": "Parfait, bilan des idiomes réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Hard", "work", "always", "pays", "off", "eventually."], "correct_sentence": "Hard work always pays off eventually.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"A tough nut to crack\" décrit :", "options": ["Une personne facile", "Un problème difficile à résoudre", "Une victoire rapide", "Une décision simple"], "correct_index": 1, "feedback_correct": "Correct ! Bilan des idiomes réussi.", "feedback_incorrect": "\"Tough nut to crack\" = problème difficile."}'),
  (8, 'fill_blank', '{"sentence_before": "She finally ", "sentence_after": " her dream job after years of effort. (landed)", "correct_answers": ["landed"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Land a job\" au passé : \"landed\"."}')
) as v(position, type, content);
