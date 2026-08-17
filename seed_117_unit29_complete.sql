-- ============================================
-- LUMA — Unité 29 (B2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Come across\" veut dire :", "options": ["Éviter", "Tomber sur (par hasard)", "Détester", "Ignorer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Come across\" = tomber sur par hasard."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " across an old photo yesterday. (came)", "correct_answers": ["came"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Come across\" au passé : \"came across\"."}'),
  (7, 'true_false', '{"statement": "\"Bring up\" can mean to mention a topic.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"bring up\" veut bien dire évoquer un sujet."}'),
  (8, 'matching', '{"instruction": "Relie le phrasal verb à sa traduction.", "pairs": [{"left": "bring up", "right": "évoquer"}, {"left": "put off", "right": "reporter"}, {"left": "carry on", "right": "continuer"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Turn down\" (une offre) veut dire :", "options": ["Accepter", "Refuser", "Ignorer", "Discuter"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Turn down\" = refuser."}'),
  (6, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " down the job offer. (turned)", "correct_answers": ["turned"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Turn down\" au passé : \"turned down\"."}'),
  (7, 'true_false', '{"statement": "\"Give in\" means to finally agree after resisting.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"give in\" veut bien dire céder."}'),
  (8, 'matching', '{"instruction": "Relie le phrasal verb à sa traduction.", "pairs": [{"left": "give in", "right": "céder"}, {"left": "hold on", "right": "patienter"}, {"left": "back down", "right": "reculer/abandonner"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Work out\" (un problème) veut dire :", "options": ["Ignorer", "Résoudre", "Créer", "Aggraver"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Work out\" = résoudre."}'),
  (6, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " out a solution together. (worked)", "correct_answers": ["worked"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Work out\" au passé : \"worked out\"."}'),
  (7, 'true_false', '{"statement": "\"Come up with\" means to think of an idea.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"come up with\" veut bien dire trouver une idée."}'),
  (8, 'matching', '{"instruction": "Relie le phrasal verb à sa traduction.", "pairs": [{"left": "come up with", "right": "trouver (une idée)"}, {"left": "go through", "right": "traverser/examiner"}, {"left": "sort out", "right": "régler/trier"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Pick up\" peut vouloir dire :", "options": ["Uniquement ramasser", "Ramasser, apprendre, ou aller chercher quelqu''un", "Uniquement apprendre", "Uniquement aller chercher"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Pick up\" a plusieurs sens selon le contexte."}'),
  (6, 'fill_blank', '{"sentence_before": "I picked ", "sentence_after": " some Spanish while traveling. (up)", "correct_answers": ["up"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Pick up\" (apprendre) ici."}'),
  (7, 'true_false', '{"statement": "Phrasal verbs are generally more informal than their single-word equivalents.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien souvent le cas."}'),
  (8, 'matching', '{"instruction": "Relie le phrasal verb informel à son équivalent formel.", "pairs": [{"left": "find out", "right": "discover"}, {"left": "put off", "right": "postpone"}, {"left": "give up", "right": "abandon"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Phrasal verbs avancés (4) — émotions et relations', '{"rule": "Cette leçon couvre des phrasal verbs liés aux émotions et relations : \"put up with\" (supporter), \"look up to\" (admirer), \"let down\" (décevoir).", "table": [{"subject": "put up with", "affirmative": "supporter", "negative": "—"}, {"subject": "look up to", "affirmative": "admirer", "negative": "—"}, {"subject": "let down", "affirmative": "décevoir", "negative": "—"}], "example": {"en": "I really look up to my grandmother. I hate letting people down.", "fr": "J''admire vraiment ma grand-mère. Je déteste décevoir les gens."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Put up with\" veut dire :", "options": ["Apprécier", "Supporter (tolérer)", "Détester", "Ignorer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Put up with\" = supporter/tolérer."}'),
  (2, 'qcm', '{"question": "\"Look up to someone\" veut dire :", "options": ["Regarder en haut", "Admirer quelqu''un", "Éviter quelqu''un", "Chercher quelqu''un"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Look up to\" = admirer."}'),
  (3, 'fill_blank', '{"sentence_before": "I hate letting my parents ", "sentence_after": ". (down)", "correct_answers": ["down"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Let down\" = décevoir."}'),
  (4, 'true_false', '{"statement": "\"Look up to\" expresses admiration and respect for someone.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son sens."}'),
  (5, 'matching', '{"instruction": "Relie le phrasal verb émotionnel à sa traduction.", "pairs": [{"left": "cheer up", "right": "remonter le moral"}, {"left": "calm down", "right": "se calmer"}, {"left": "freak out", "right": "paniquer"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "really", "look", "up", "to", "my", "mentor."], "correct_sentence": "I really look up to my mentor.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"I can''t put up with this noise\" veut dire :", "options": ["J''aime ce bruit", "Je ne supporte pas ce bruit", "Je crée ce bruit", "Je n''entends pas ce bruit"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Can''t put up with\" = ne peut pas supporter."}'),
  (8, 'fill_blank', '{"sentence_before": "She always tries to ", "sentence_after": " me up when I''m sad. (remonter le moral)", "correct_answers": ["cheer"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Cheer up\" = remonter le moral."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Phrasal verbs avancés (5) — travail et projets', '{"rule": "Cette leçon couvre des phrasal verbs professionnels avancés : \"take on\" (accepter une responsabilité), \"roll out\" (déployer), \"scale back\" (réduire).", "table": [{"subject": "take on", "affirmative": "accepter (une charge)", "negative": "—"}, {"subject": "roll out", "affirmative": "déployer", "negative": "—"}, {"subject": "scale back", "affirmative": "réduire", "negative": "—"}], "example": {"en": "We''re rolling out the new system next month. We had to scale back our plans due to budget cuts.", "fr": "On déploie le nouveau système le mois prochain. On a dû réduire nos plans à cause des coupes budgétaires."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Roll out\" (un projet) veut dire :", "options": ["Annuler", "Déployer/lancer", "Réduire", "Ignorer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Roll out\" = déployer/lancer."}'),
  (2, 'qcm', '{"question": "\"Scale back\" veut dire :", "options": ["Augmenter", "Réduire", "Maintenir", "Créer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Scale back\" = réduire."}'),
  (3, 'fill_blank', '{"sentence_before": "She decided to take ", "sentence_after": " the new project. (on)", "correct_answers": ["on"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Take on\" = accepter une charge."}'),
  (4, 'true_false', '{"statement": "\"Take on\" can mean to accept a new responsibility.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son sens."}'),
  (5, 'matching', '{"instruction": "Relie le phrasal verb professionnel à sa traduction.", "pairs": [{"left": "ramp up", "right": "augmenter"}, {"left": "phase out", "right": "supprimer progressivement"}, {"left": "kick off", "right": "démarrer"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "will", "roll", "out", "the", "update", "soon."], "correct_sentence": "We will roll out the update soon.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Kick off a meeting\" veut dire :", "options": ["Terminer", "Démarrer", "Annuler", "Reporter"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Kick off\" = démarrer."}'),
  (8, 'fill_blank', '{"sentence_before": "We had to scale ", "sentence_after": " our ambitions. (back)", "correct_answers": ["back"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Scale back\" = réduire."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Choisir entre synonymes selon le registre', '{"rule": "Souvent, un phrasal verb informel a un équivalent formel en un seul mot. Choisir le bon registre est essentiel selon le contexte (email pro vs conversation entre amis).", "table": [{"subject": "Informel", "affirmative": "find out, put off, give up", "negative": "—"}, {"subject": "Formel", "affirmative": "discover, postpone, abandon", "negative": "—"}], "example": {"en": "Informal: We found out the truth. Formal: We discovered the truth.", "fr": "Informel : On a découvert la vérité (find out). Formel : On a découvert la vérité (discover)."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Dans un email professionnel formel, on préfère :", "options": ["put off", "postpone", "les deux sont identiques", "aucun des deux"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Postpone\" convient mieux au registre formel."}'),
  (2, 'qcm', '{"question": "\"Give up\" a pour équivalent formel :", "options": ["abandon", "continue", "start", "finish"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Give up\" = \"abandon\" en formel."}'),
  (3, 'fill_blank', '{"sentence_before": "We need to ", "sentence_after": " the meeting. (postpone, formel)", "correct_answers": ["postpone"], "feedback_correct": "Correct !", "feedback_incorrect": "Registre formel : \"postpone\"."}'),
  (4, 'true_false', '{"statement": "Phrasal verbs are generally avoided in very formal academic writing.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien vrai dans l''écrit très formel."}'),
  (5, 'matching', '{"instruction": "Relie le phrasal verb informel à son synonyme formel.", "pairs": [{"left": "find out", "right": "discover"}, {"left": "put off", "right": "postpone"}, {"left": "look into", "right": "investigate"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "will", "investigate", "the", "matter", "further."], "correct_sentence": "We will investigate the matter further.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Look into\" (formel : investigate) veut dire :", "options": ["Ignorer", "Examiner/enquêter", "Accepter", "Refuser"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Look into\" = examiner/enquêter sur."}'),
  (8, 'fill_blank', '{"sentence_before": "The committee will ", "sentence_after": " the issue. (formel, examiner)", "correct_answers": ["investigate"], "feedback_correct": "Correct !", "feedback_incorrect": "Registre formel : \"investigate\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : phrasal verbs avancés complets', '{"rule": "Cette leçon consolide tous les phrasal verbs avancés vus dans l''unité (relations, travail, sens multiples, registre) pour une utilisation fluide et naturelle.", "table": [{"subject": "Émotions", "affirmative": "put up with, look up to, let down", "negative": "—"}, {"subject": "Travail", "affirmative": "take on, roll out, scale back", "negative": "—"}, {"subject": "Registre", "affirmative": "informel vs formel", "negative": "—"}], "example": {"en": "I really look up to my manager, even though I sometimes have to put up with her strict deadlines. We''re rolling out a new project, and I''ve taken on a lot of responsibility.", "fr": "J''admire vraiment ma manager, même si je dois parfois supporter ses délais stricts. On déploie un nouveau projet, et j''ai pris beaucoup de responsabilités."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I really ___ up to my older sister.", "options": ["look", "put", "take", "come"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Look up to\" = admirer."}'),
  (2, 'qcm', '{"question": "Complète : We''re ___ out the new product next week.", "options": ["rolling", "scaling", "putting", "taking"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Roll out\" = déployer."}'),
  (3, 'fill_blank', '{"sentence_before": "I can''t ", "sentence_after": " up with his attitude anymore. (supporter)", "correct_answers": ["put"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Put up with\" = supporter."}'),
  (4, 'true_false', '{"statement": "Choosing between phrasal verbs and formal synonyms depends on context and register.", "correct_answer": true, "feedback_correct": "Exact, bilan des phrasal verbs avancés réussi !", "feedback_incorrect": "Faux — c''est bien une question de contexte."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque phrasal verb à sa catégorie.", "pairs": [{"left": "let down", "right": "émotions"}, {"left": "scale back", "right": "travail"}, {"left": "find out / discover", "right": "registre"}], "feedback_correct": "Parfait, bilan des phrasal verbs avancés réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''ve", "taken", "on", "a", "lot", "of", "responsibility."], "correct_sentence": "I''ve taken on a lot of responsibility.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She never lets her team ___.", "options": ["down", "up", "off", "on"], "correct_index": 0, "feedback_correct": "Correct ! Bilan des phrasal verbs avancés réussi.", "feedback_incorrect": "\"Let down\" = décevoir."}'),
  (8, 'fill_blank', '{"sentence_before": "We had to ", "sentence_after": " back our expenses this year. (réduire)", "correct_answers": ["scale"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Scale back\" = réduire."}')
) as v(position, type, content);
