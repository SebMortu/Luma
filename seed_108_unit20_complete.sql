-- ============================================
-- LUMA — Unité 20 (B1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : The house ___ cleaned every week.", "options": ["is", "are", "was", "were"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Passif présent singulier : \"is cleaned\"."}'),
  (6, 'fill_blank', '{"sentence_before": "English ", "sentence_after": " spoken here. (est parlé)", "correct_answers": ["is"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Is spoken\" = passif présent."}'),
  (7, 'true_false', '{"statement": "The passive is formed with \"to be\" + past participle.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien la structure du passif."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "cake", "is", "made", "every", "day."], "correct_sentence": "The cake is made every day.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : The letter ___ written yesterday.", "options": ["is", "was", "are", "were"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Passif passé singulier : \"was written\"."}'),
  (6, 'fill_blank', '{"sentence_before": "The windows ", "sentence_after": " broken last night. (ont été)", "correct_answers": ["were"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif passé pluriel : \"were broken\"."}'),
  (7, 'true_false', '{"statement": "\"The book was written in 1990\" is passive voice.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien du passif."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "building", "was", "built", "in", "1920."], "correct_sentence": "This building was built in 1920.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Le passif est utile quand :", "options": ["L''auteur de l''action est important", "L''auteur est inconnu/sans importance", "On veut toujours mentionner qui fait l''action", "Jamais utile"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le passif convient quand l''auteur importe peu."}'),
  (6, 'fill_blank', '{"sentence_before": "My wallet ", "sentence_after": " stolen. (a été volé, auteur inconnu)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif car on ne sait pas qui a volé."}'),
  (7, 'true_false', '{"statement": "The passive is common in scientific and formal writing.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien fréquent dans ce registre."}'),
  (8, 'matching', '{"instruction": "Relie la phrase active à sa version passive.", "pairs": [{"left": "Someone stole my bike.", "right": "My bike was stolen."}, {"left": "They built this in 1990.", "right": "This was built in 1990."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : The book was written ___ Shakespeare.", "options": ["by", "from", "with", "at"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "L''agent au passif s''introduit avec \"by\"."}'),
  (6, 'fill_blank', '{"sentence_before": "The painting was created ", "sentence_after": " a famous artist.", "correct_answers": ["by"], "feedback_correct": "Correct !", "feedback_incorrect": "\"By\" introduit l''agent."}'),
  (7, 'true_false', '{"statement": "You must always mention the agent with \"by\" in passive sentences.", "correct_answer": false, "feedback_correct": "Exact — on l''omet souvent si sans importance.", "feedback_incorrect": "Faux — l''agent est souvent omis quand il n''a pas d''importance."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "song", "was", "sung", "by", "her."], "correct_sentence": "The song was sung by her.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Le passif au futur', '{"rule": "Le passif au futur se forme avec \"will be\" + participe passé.", "table": [{"subject": "will be + participe", "affirmative": "The project will be finished soon.", "negative": "—"}], "example": {"en": "The results will be announced tomorrow.", "fr": "Les résultats seront annoncés demain."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The report ___ finished by Friday.", "options": ["will be", "was", "is", "were"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Passif futur : \"will be finished\"."}'),
  (2, 'qcm', '{"question": "Quelle est la structure du passif futur ?", "options": ["will + past participle", "will be + past participle", "was + -ing", "will have + participle"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Will be\" + participe passé."}'),
  (3, 'fill_blank', '{"sentence_before": "The new bridge ", "sentence_after": " (open) next year.", "correct_answers": ["will be opened"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif futur : \"will be opened\"."}'),
  (4, 'true_false', '{"statement": "\"The email will be sent tomorrow\" is passive future.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien du passif futur."}'),
  (5, 'matching', '{"instruction": "Relie la phrase active à sa version passive future.", "pairs": [{"left": "They will announce the results.", "right": "The results will be announced."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "decision", "will", "be", "made", "soon."], "correct_sentence": "The decision will be made soon.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : The winners ___ announced next week.", "options": ["will be", "was", "are", "were"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Passif futur : \"will be announced\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The house ", "sentence_after": " (sell) next month.", "correct_answers": ["will be sold"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif futur : \"will be sold\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Le passif avec le present perfect', '{"rule": "Le passif au present perfect se forme avec \"has/have been\" + participe passé, pour un résultat présent d''une action passée.", "table": [{"subject": "has/have been + participe", "affirmative": "The work has been completed.", "negative": "—"}], "example": {"en": "The documents have been signed.", "fr": "Les documents ont été signés."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The project ___ completed.", "options": ["has been", "have been", "is been", "was been"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Singulier : \"has been completed\"."}'),
  (2, 'qcm', '{"question": "Complète : The tickets ___ already sold.", "options": ["has been", "have been", "is been", "was"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Pluriel : \"have been sold\"."}'),
  (3, 'fill_blank', '{"sentence_before": "The car ", "sentence_after": " (repair) already.", "correct_answers": ["has been repaired"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif present perfect : \"has been repaired\"."}'),
  (4, 'true_false', '{"statement": "\"The email has been sent\" is passive present perfect.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien du passif present perfect."}'),
  (5, 'matching', '{"instruction": "Relie l''action active à sa version passive.", "pairs": [{"left": "They have finished the work.", "right": "The work has been finished."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "problem", "has", "been", "solved."], "correct_sentence": "The problem has been solved.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : All the seats ___ booked.", "options": ["has been", "have been", "is been", "was"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Pluriel : \"have been booked\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The mistake ", "sentence_after": " (correct) already.", "correct_answers": ["has been corrected"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif present perfect : \"has been corrected\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Passif dans les titres de presse', '{"rule": "Le passif est très fréquent dans les titres de presse pour mettre l''accent sur l''événement plutôt que sur qui l''a causé.", "table": [{"subject": "Titre de presse", "affirmative": "Man Arrested After Robbery", "negative": "—"}], "example": {"en": "\"Bridge Closed for Repairs\" — \"New Law Passed by Parliament\"", "fr": "\"Pont fermé pour travaux\" — \"Nouvelle loi adoptée par le Parlement\""}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Pourquoi la presse utilise-t-elle souvent le passif ?", "options": ["Pour être plus longue", "Pour mettre l''accent sur l''événement", "Par erreur", "C''est interdit sinon"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Ça met l''accent sur l''événement plutôt que l''auteur."}'),
  (2, 'qcm', '{"question": "\"New Bridge Opened\" est un exemple de :", "options": ["Voix active", "Voix passive", "Question", "Négation"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "C''est bien un titre au passif."}'),
  (3, 'fill_blank', '{"sentence_before": "\"Suspect ", "sentence_after": " After Investigation\" (arrêté)", "correct_answers": ["Arrested"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Arrested\" complète le titre passif."}'),
  (4, 'true_false', '{"statement": "News headlines often omit \"to be\" for brevity, even in passive voice.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une pratique courante en titraille."}'),
  (5, 'matching', '{"instruction": "Relie le titre à sa signification.", "pairs": [{"left": "Law Passed", "right": "Une loi a été adoptée"}, {"left": "Building Destroyed", "right": "Un bâtiment a été détruit"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["New", "Rules", "Announced", "Today."], "correct_sentence": "New Rules Announced Today.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Company Sold for Millions\" utilise :", "options": ["L''actif", "Le passif", "Le futur", "Le conditionnel"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "C''est bien un exemple de passif."}'),
  (8, 'fill_blank', '{"sentence_before": "\"Prices ", "sentence_after": " to Rise\" (attendus, expected)", "correct_answers": ["Expected"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Expected\" complète ce titre passif."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : le passif à tous les temps', '{"rule": "Cette leçon combine le passif au présent, passé, futur et present perfect pour une maîtrise complète de la voix passive.", "table": [{"subject": "Présent", "affirmative": "is/are + participe", "negative": "—"}, {"subject": "Passé", "affirmative": "was/were + participe", "negative": "—"}, {"subject": "Futur", "affirmative": "will be + participe", "negative": "—"}, {"subject": "Present perfect", "affirmative": "has/have been + participe", "negative": "—"}], "example": {"en": "The house is cleaned every week. It was built in 1990. It will be sold next year. It has been renovated recently.", "fr": "La maison est nettoyée chaque semaine. Elle a été construite en 1990. Elle sera vendue l''an prochain. Elle a été rénovée récemment."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 20 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : This song ___ (sing) by millions of people every year.", "options": ["is sung", "was sung", "will be sung", "has sung"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Habitude présente = passif présent."}'),
  (2, 'qcm', '{"question": "Complète : The email ___ (send) tomorrow.", "options": ["is sent", "was sent", "will be sent", "has been sent"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Futur = \"will be sent\"."}'),
  (3, 'fill_blank', '{"sentence_before": "The museum ", "sentence_after": " (build) in 1850.", "correct_answers": ["was built"], "feedback_correct": "Correct !", "feedback_incorrect": "Date précise passée = passif passé."}'),
  (4, 'true_false', '{"statement": "The passive can be used in every tense, following the same \"to be + participle\" logic.", "correct_answer": true, "feedback_correct": "Exact, bilan du passif réussi !", "feedback_incorrect": "Faux — c''est bien vrai pour tous les temps."}'),
  (5, 'matching', '{"instruction": "Bilan : relie le temps à sa structure passive.", "pairs": [{"left": "Présent", "right": "is/are + participe"}, {"left": "Passé", "right": "was/were + participe"}, {"left": "Futur", "right": "will be + participe"}], "feedback_correct": "Parfait, bilan du passif complet !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "results", "have", "been", "published."], "correct_sentence": "The results have been published.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : The report ___ already ___ (finish).", "options": ["has / been finished", "is / finished", "was / finish", "will / finished"], "correct_index": 0, "feedback_correct": "Correct ! Bilan du passif réussi.", "feedback_incorrect": "Passif present perfect : \"has been finished\"."}'),
  (8, 'fill_blank', '{"sentence_before": "This building ", "sentence_after": " (renovate) next year.", "correct_answers": ["will be renovated"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif futur : \"will be renovated\"."}')
) as v(position, type, content);
