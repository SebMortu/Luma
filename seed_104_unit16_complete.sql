-- ============================================
-- LUMA — Unité 16 (dernière de A2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Wake up\" veut dire :", "options": ["S''endormir", "Se réveiller", "Se lever", "Se laver"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Wake up\" = se réveiller."}'),
  (6, 'fill_blank', '{"sentence_before": "Please ", "sentence_after": " off the light. (éteins)", "correct_answers": ["turn"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Turn off\" = éteindre."}'),
  (7, 'true_false', '{"statement": "\"Get up\" means to leave bed after waking.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"get up\" veut bien dire se lever."}'),
  (8, 'matching', '{"instruction": "Relie le phrasal verb à sa traduction.", "pairs": [{"left": "turn on", "right": "allumer"}, {"left": "get up", "right": "se lever"}, {"left": "sit down", "right": "s''asseoir"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Look for\" veut dire :", "options": ["Regarder", "Chercher", "Trouver", "Voir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Look for\" = chercher."}'),
  (6, 'fill_blank', '{"sentence_before": "I need to ", "sentence_after": " up early tomorrow. (se lever)", "correct_answers": ["get"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Get up\" = se lever."}'),
  (7, 'true_false', '{"statement": "\"Give up\" means to stop trying.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"give up\" veut bien dire abandonner."}'),
  (8, 'matching', '{"instruction": "Relie le phrasal verb à sa traduction.", "pairs": [{"left": "give up", "right": "abandonner"}, {"left": "find out", "right": "découvrir"}, {"left": "come back", "right": "revenir"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : Please turn ___ the TV. (avec pronom : it)", "options": ["it off", "off it", "off", "it"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec un pronom, il se place au milieu : \"turn it off\"."}'),
  (6, 'fill_blank', '{"sentence_before": "Can you pick ", "sentence_after": " up? (les enfants)", "correct_answers": ["them"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Pick them up\" — pronom au milieu."}'),
  (7, 'true_false', '{"statement": "With a pronoun, separable phrasal verbs must be split.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — avec un pronom, le verbe doit bien être séparé."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Turn", "the", "light", "off."], "correct_sentence": "Turn the light off.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ visited London twice.", "options": ["have", "has", "had", "having"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Révision present perfect : \"have visited\"."}'),
  (6, 'fill_blank', '{"sentence_before": "This is ", "sentence_after": " than that one. (plus grand)", "correct_answers": ["bigger"], "feedback_correct": "Correct !", "feedback_incorrect": "Révision comparatif : \"bigger\"."}'),
  (7, 'true_false', '{"statement": "\"You must wear a helmet\" expresses an obligation.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"must\" exprime bien une obligation."}'),
  (8, 'matching', '{"instruction": "Révision : relie la règle grammaticale à son exemple.", "pairs": [{"left": "Comparatif", "right": "bigger than"}, {"left": "Present perfect", "right": "have been"}, {"left": "Modal d''obligation", "right": "must"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Phrasal verbs au travail', '{"rule": "Certains phrasal verbs sont très courants dans un contexte professionnel : \"set up\" (organiser), \"carry out\" (réaliser), \"deal with\" (gérer).", "table": [{"subject": "set up", "affirmative": "organiser/mettre en place", "negative": "—"}, {"subject": "carry out", "affirmative": "réaliser/mener à bien", "negative": "—"}, {"subject": "deal with", "affirmative": "gérer/traiter", "negative": "—"}], "example": {"en": "We need to set up a meeting to deal with this issue.", "fr": "Il faut organiser une réunion pour gérer ce problème."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Deal with\" veut dire :", "options": ["Ignorer", "Gérer/traiter", "Créer", "Vendre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Deal with\" = gérer."}'),
  (2, 'qcm', '{"question": "\"Set up a meeting\" veut dire :", "options": ["Annuler une réunion", "Organiser une réunion", "Rater une réunion", "Éviter une réunion"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Set up\" = organiser/mettre en place."}'),
  (3, 'fill_blank', '{"sentence_before": "We successfully ", "sentence_after": " out the project. (avons réalisé)", "correct_answers": ["carried"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Carry out\" au passé : \"carried out\"."}'),
  (4, 'true_false', '{"statement": "\"Deal with\" can mean to handle a problem.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"deal with\" veut bien dire gérer un problème."}'),
  (5, 'matching', '{"instruction": "Relie le phrasal verb professionnel à sa traduction.", "pairs": [{"left": "figure out", "right": "comprendre/résoudre"}, {"left": "follow up", "right": "faire un suivi"}, {"left": "point out", "right": "souligner"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Let''s", "set", "up", "a", "call."], "correct_sentence": "Let''s set up a call.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Follow up\" veut dire :", "options": ["Ignorer", "Faire un suivi", "Commencer", "Terminer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Follow up\" = faire un suivi."}'),
  (8, 'fill_blank', '{"sentence_before": "I will ", "sentence_after": " with you next week. (faire un suivi)", "correct_answers": ["follow up"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Faire un suivi\" = \"follow up\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Phrasal verbs pour voyager', '{"rule": "Le vocabulaire du voyage inclut de nombreux phrasal verbs : \"check in\" (enregistrer), \"take off\" (décoller), \"set off\" (partir).", "table": [{"subject": "check in", "affirmative": "s''enregistrer", "negative": "—"}, {"subject": "take off", "affirmative": "décoller", "negative": "—"}, {"subject": "set off", "affirmative": "partir/se mettre en route", "negative": "—"}], "example": {"en": "We checked in at the airport, and the plane took off on time.", "fr": "Nous nous sommes enregistrés à l''aéroport, et l''avion a décollé à l''heure."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Take off\" (avion) veut dire :", "options": ["Atterrir", "Décoller", "Retarder", "Annuler"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Take off\" = décoller."}'),
  (2, 'qcm', '{"question": "\"Check in\" veut dire :", "options": ["Partir", "S''enregistrer", "Se perdre", "Payer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Check in\" = s''enregistrer."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " off early to avoid traffic. (sommes partis)", "correct_answers": ["set"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Set off\" = partir."}'),
  (4, 'true_false', '{"statement": "\"Check out\" of a hotel means to leave and pay the bill.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"check out\" veut bien dire quitter l''hôtel."}'),
  (5, 'matching', '{"instruction": "Relie le phrasal verb de voyage à sa traduction.", "pairs": [{"left": "land", "right": "atterrir"}, {"left": "get on", "right": "monter à bord"}, {"left": "get off", "right": "descendre"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "plane", "took", "off", "on", "time."], "correct_sentence": "The plane took off on time.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Get on the bus\" veut dire :", "options": ["Descendre du bus", "Monter dans le bus", "Rater le bus", "Attendre le bus"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Get on\" = monter à bord."}'),
  (8, 'fill_blank', '{"sentence_before": "Please ", "sentence_after": " in at the front desk. (enregistrez-vous)", "correct_answers": ["check"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Check in\" = s''enregistrer."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Phrasal verbs pour les relations', '{"rule": "Certains phrasal verbs décrivent les relations humaines : \"get along with\" (bien s''entendre), \"break up\" (rompre), \"make up\" (se réconcilier).", "table": [{"subject": "get along with", "affirmative": "bien s''entendre avec", "negative": "—"}, {"subject": "break up", "affirmative": "rompre", "negative": "—"}, {"subject": "make up", "affirmative": "se réconcilier", "negative": "—"}], "example": {"en": "They broke up last year, but they get along well now.", "fr": "Ils ont rompu l''an dernier, mais ils s''entendent bien maintenant."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Get along with\" veut dire :", "options": ["Se disputer", "Bien s''entendre", "Ignorer", "Rencontrer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Get along with\" = bien s''entendre."}'),
  (2, 'qcm', '{"question": "\"Break up\" veut dire :", "options": ["Se marier", "Rompre", "Se rencontrer", "S''aimer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Break up\" = rompre."}'),
  (3, 'fill_blank', '{"sentence_before": "I really ", "sentence_after": " along with my colleagues. (m''entends)", "correct_answers": ["get"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Get along with\" = bien s''entendre."}'),
  (4, 'true_false', '{"statement": "\"Make up\" (after a fight) means to reconcile.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"make up\" veut bien dire se réconcilier."}'),
  (5, 'matching', '{"instruction": "Relie le phrasal verb relationnel à sa traduction.", "pairs": [{"left": "fall for", "right": "tomber amoureux de"}, {"left": "look after", "right": "s''occuper de"}, {"left": "grow apart", "right": "s''éloigner"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "get", "along", "very", "well."], "correct_sentence": "We get along very well.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Look after\" veut dire :", "options": ["Chercher", "S''occuper de", "Regarder", "Suivre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Look after\" = s''occuper de."}'),
  (8, 'fill_blank', '{"sentence_before": "They finally ", "sentence_after": " up after the argument. (se sont réconciliés)", "correct_answers": ["made"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Make up\" = se réconcilier."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan final A2 : phrasal verbs et grammaire complète', '{"rule": "Cette dernière leçon du niveau A2 combine phrasal verbs, present perfect, comparatifs, modaux et prépositions — un vrai bilan avant de passer au niveau B1.", "table": [{"subject": "Phrasal verbs", "affirmative": "get up, look for, deal with", "negative": "—"}, {"subject": "Present perfect", "affirmative": "I have worked here for years", "negative": "—"}, {"subject": "Modaux", "affirmative": "must, should, might", "negative": "—"}], "example": {"en": "I have worked here for two years. I usually get along with my colleagues, and I should probably ask for a promotion.", "fr": "Je travaille ici depuis deux ans. Je m''entends généralement bien avec mes collègues, et je devrais probablement demander une promotion."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ worked here for two years.", "options": ["have", "has", "had", "having"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Present perfect avec \"I\" : \"have\"."}'),
  (2, 'qcm', '{"question": "\"Deal with a problem\" veut dire :", "options": ["Ignorer un problème", "Gérer un problème", "Créer un problème", "Éviter un problème"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Deal with\" = gérer."}'),
  (3, 'fill_blank', '{"sentence_before": "This job is ", "sentence_after": " than my last one. (plus intéressant)", "correct_answers": ["more interesting"], "feedback_correct": "Correct !", "feedback_incorrect": "Comparatif long : \"more interesting\"."}'),
  (4, 'true_false', '{"statement": "\"Should\" expresses a stronger obligation than \"must\".", "correct_answer": false, "feedback_correct": "Exact — \"must\" est plus fort que \"should\".", "feedback_incorrect": "Faux — \"must\" est plus fort qu''un simple conseil."}'),
  (5, 'matching', '{"instruction": "Bilan A2 : relie chaque notion à son exemple.", "pairs": [{"left": "Phrasal verb", "right": "get along with"}, {"left": "Present perfect", "right": "have visited"}, {"left": "Modal", "right": "should"}], "feedback_correct": "Parfait, bilan A2 complet réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "never", "dealt", "with", "this."], "correct_sentence": "I have never dealt with this.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : We ___ probably arrive late. (prédiction nuancée)", "options": ["will", "must", "should", "can"], "correct_index": 0, "feedback_correct": "Correct ! Bravo, tu as terminé le niveau A2 !", "feedback_incorrect": "Prédiction = \"will probably\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I get ", "sentence_after": " with almost everyone. (bien m''entends)", "correct_answers": ["along"], "feedback_correct": "Correct ! Félicitations pour avoir terminé le niveau A2 !", "feedback_incorrect": "\"Get along with\" = bien s''entendre."}')
) as v(position, type, content);
