-- ============================================
-- LUMA — Unité 13 (A2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I wake up ___ 7am.", "options": ["at", "on", "in", "for"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Heure précise = \"at\"."}'),
  (6, 'fill_blank', '{"sentence_before": "My birthday is ", "sentence_after": " June.", "correct_answers": ["in"], "feedback_correct": "Correct !", "feedback_incorrect": "Mois = \"in\"."}'),
  (7, 'true_false', '{"statement": "\"On Monday\" is correct for a day of the week.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les jours utilisent bien \"on\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "meeting", "is", "at", "3pm."], "correct_sentence": "The meeting is at 3pm.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I live ___ Paris.", "options": ["at", "on", "in", "to"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Ville = \"in\"."}'),
  (6, 'fill_blank', '{"sentence_before": "The keys are ", "sentence_after": " the table.", "correct_answers": ["on"], "feedback_correct": "Correct !", "feedback_incorrect": "Surface = \"on\"."}'),
  (7, 'true_false', '{"statement": "\"At the bus stop\" is correct.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien correct, point précis = \"at\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "works", "at", "the", "hospital."], "correct_sentence": "She works at the hospital.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Turn left\" veut dire :", "options": ["Tourner à droite", "Tourner à gauche", "Aller tout droit", "S''arrêter"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Turn left\" = tourner à gauche."}'),
  (6, 'fill_blank', '{"sentence_before": "Go ", "sentence_after": " until the traffic light. (tout droit)", "correct_answers": ["straight"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Tout droit\" = \"straight\"."}'),
  (7, 'true_false', '{"statement": "\"Go straight on\" means to continue in the same direction.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien continuer tout droit."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Turn", "right", "at", "the", "corner."], "correct_sentence": "Turn right at the corner.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I''ll see you ___ the café ___ 5pm.", "options": ["at / at", "in / on", "on / in", "at / in"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Lieu précis + heure précise : \"at / at\"."}'),
  (6, 'fill_blank', '{"sentence_before": "We met ", "sentence_after": " the station in the morning.", "correct_answers": ["at"], "feedback_correct": "Correct !", "feedback_incorrect": "Lieu précis = \"at\"."}'),
  (7, 'true_false', '{"statement": "You can combine time and place prepositions in one sentence.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien possible et courant."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "will", "meet", "you", "at", "noon."], "correct_sentence": "I will meet you at noon.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Prépositions de mouvement (to, into, through)', '{"rule": "Les prépositions de mouvement décrivent une direction : \"to\" (vers), \"into\" (à l''intérieur de), \"through\" (à travers), \"across\" (en travers de).", "table": [{"subject": "to", "affirmative": "vers", "negative": "—"}, {"subject": "into", "affirmative": "à l''intérieur de", "negative": "—"}, {"subject": "through", "affirmative": "à travers", "negative": "—"}], "example": {"en": "She walked into the room and looked through the window.", "fr": "Elle est entrée dans la pièce et a regardé à travers la fenêtre."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Into\" veut dire :", "options": ["Hors de", "À l''intérieur de", "Au-dessus de", "En dessous de"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Into\" = à l''intérieur de."}'),
  (2, 'qcm', '{"question": "Complète : We drove ___ the tunnel.", "options": ["through", "on", "at", "in"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"À travers\" = \"through\"."}'),
  (3, 'fill_blank', '{"sentence_before": "She walked ", "sentence_after": " the shop. (à l''intérieur de)", "correct_answers": ["into"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Into\" indique l''entrée dans un lieu."}'),
  (4, 'true_false', '{"statement": "\"Across\" describes crossing from one side to another.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"across\" décrit bien une traversée."}'),
  (5, 'matching', '{"instruction": "Relie la préposition de mouvement à sa traduction.", "pairs": [{"left": "towards", "right": "vers"}, {"left": "away from", "right": "loin de"}, {"left": "around", "right": "autour de"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "ran", "across", "the", "street."], "correct_sentence": "He ran across the street.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Towards\" veut dire :", "options": ["Loin de", "Vers", "Autour de", "À travers"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Towards\" = vers."}'),
  (8, 'fill_blank', '{"sentence_before": "The cat jumped ", "sentence_after": " the fence. (par-dessus)", "correct_answers": ["over"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Par-dessus\" = \"over\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Demander et comprendre un itinéraire', '{"rule": "Cette leçon combine directions et prépositions de lieu pour comprendre et donner un itinéraire complet.", "table": [{"subject": "How do I get to...?", "affirmative": "Comment je vais à... ?", "negative": "—"}, {"subject": "It''s next to...", "affirmative": "C''est à côté de...", "negative": "—"}, {"subject": "It''s opposite...", "affirmative": "C''est en face de...", "negative": "—"}], "example": {"en": "How do I get to the station? Go straight, then turn left. It''s next to the bank.", "fr": "Comment je vais à la gare ? Allez tout droit, puis tournez à gauche. C''est à côté de la banque."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Opposite\" veut dire :", "options": ["À côté de", "En face de", "Derrière", "Sur"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Opposite\" = en face de."}'),
  (2, 'qcm', '{"question": "Comment demande-t-on son chemin ?", "options": ["How do I get to...?", "What time is it?", "How are you?", "Who is that?"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"How do I get to...?\" demande un itinéraire."}'),
  (3, 'fill_blank', '{"sentence_before": "The bank is ", "sentence_after": " the post office. (à côté de)", "correct_answers": ["next to"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À côté de\" = \"next to\"."}'),
  (4, 'true_false', '{"statement": "\"Opposite the church\" means \"across from the church\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"opposite\" veut bien dire en face de."}'),
  (5, 'matching', '{"instruction": "Relie l''expression d''itinéraire à sa traduction.", "pairs": [{"left": "at the corner", "right": "au coin"}, {"left": "on the right", "right": "sur la droite"}, {"left": "past the bridge", "right": "après le pont"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "museum", "is", "opposite", "the", "park."], "correct_sentence": "The museum is opposite the park.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Past the bridge\" veut dire :", "options": ["Avant le pont", "Après le pont", "Sous le pont", "Sur le pont"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Past\" (ici) = après/dépasser."}'),
  (8, 'fill_blank', '{"sentence_before": "How do I get ", "sentence_after": " the airport?", "correct_answers": ["to"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Aller à\" = \"get to\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Les prépositions avec les moyens de transport', '{"rule": "Certaines prépositions varient selon qu''on est \"dans\" un véhicule (in pour voiture/taxi) ou \"sur\" un véhicule (on pour bus/train/avion).", "table": [{"subject": "in a car/taxi", "affirmative": "dans une voiture/taxi", "negative": "—"}, {"subject": "on a bus/train/plane", "affirmative": "dans un bus/train/avion", "negative": "—"}], "example": {"en": "I was in a taxi, then I got on the train.", "fr": "J''étais dans un taxi, puis je suis monté dans le train."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She is ___ the bus.", "options": ["in", "on", "at", "to"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Bus = \"on\"."}'),
  (2, 'qcm', '{"question": "Complète : I was ___ a taxi.", "options": ["in", "on", "at", "by"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Taxi = \"in\"."}'),
  (3, 'fill_blank', '{"sentence_before": "We were ", "sentence_after": " the plane for six hours.", "correct_answers": ["on"], "feedback_correct": "Correct !", "feedback_incorrect": "Avion = \"on\"."}'),
  (4, 'true_false', '{"statement": "\"In the car\" and \"in the taxi\" both use \"in\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les deux utilisent bien \"in\"."}'),
  (5, 'matching', '{"instruction": "Relie le véhicule à sa préposition.", "pairs": [{"left": "car", "right": "in"}, {"left": "train", "right": "on"}, {"left": "bicycle", "right": "on"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "got", "on", "the", "train", "at", "8am."], "correct_sentence": "I got on the train at 8am.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : They arrived ___ a small car.", "options": ["in", "on", "at", "by"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Voiture = \"in\"."}'),
  (8, 'fill_blank', '{"sentence_before": "He fell asleep ", "sentence_after": " the train.", "correct_answers": ["on"], "feedback_correct": "Correct !", "feedback_incorrect": "Train = \"on\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : temps, lieu et mouvement', '{"rule": "Cette leçon de révision combine toutes les prépositions vues dans l''unité : temps (at/on/in), lieu (at/in/on), et mouvement (to/into/through).", "table": [{"subject": "Temps", "affirmative": "at 5pm, on Monday, in June", "negative": "—"}, {"subject": "Lieu", "affirmative": "at home, in Paris, on the table", "negative": "—"}, {"subject": "Mouvement", "affirmative": "to school, into the room, through the tunnel", "negative": "—"}], "example": {"en": "I arrived at the station at 8am, walked into the hall, and waited on the platform.", "fr": "Je suis arrivé à la gare à 8h, je suis entré dans le hall, et j''ai attendu sur le quai."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 13 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I''ll meet you ___ 6 o''clock ___ the café.", "options": ["at / at", "on / in", "in / on", "at / in"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Heure précise + lieu précis : \"at / at\"."}'),
  (2, 'qcm', '{"question": "Complète : She walked ___ the building.", "options": ["into", "on", "at", "for"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Mouvement vers l''intérieur : \"into\"."}'),
  (3, 'fill_blank', '{"sentence_before": "The party is ", "sentence_after": " Saturday evening.", "correct_answers": ["on"], "feedback_correct": "Correct !", "feedback_incorrect": "Jour = \"on\"."}'),
  (4, 'true_false', '{"statement": "\"In 2020\", \"on Monday\", and \"at noon\" all use different time prepositions correctly.", "correct_answer": true, "feedback_correct": "Exact, tu maîtrises les trois catégories !", "feedback_incorrect": "Faux — chacune utilise bien la bonne préposition."}'),
  (5, 'matching', '{"instruction": "Bilan : relie l''expression à sa préposition.", "pairs": [{"left": "in the morning", "right": "temps"}, {"left": "at the station", "right": "lieu"}, {"left": "through the door", "right": "mouvement"}], "feedback_correct": "Parfait, bilan des prépositions réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "arrived", "at", "the", "airport", "in", "the", "morning."], "correct_sentence": "We arrived at the airport in the morning.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : The keys are ___ the drawer.", "options": ["in", "at", "on", "to"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Espace fermé = \"in\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I walked ", "sentence_after": " the park to get home faster. (à travers)", "correct_answers": ["through"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À travers\" = \"through\"."}')
) as v(position, type, content);
