-- ============================================
-- LUMA — Unité 18 (B1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ watching TV at 8pm.", "options": ["was", "were", "am", "is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", on utilise \"was\"."}'),
  (6, 'fill_blank', '{"sentence_before": "They were ", "sentence_after": " (play) football.", "correct_answers": ["playing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Play\" + ing = \"playing\"."}'),
  (7, 'true_false', '{"statement": "The past continuous uses \"was/were\" + verb-ing.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien la structure du past continuous."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "was", "reading", "a", "book."], "correct_sentence": "She was reading a book.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ (cook) when the phone rang.", "options": ["was cooking", "cooked", "cook", "am cooking"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Action en cours interrompue = past continuous."}'),
  (6, 'fill_blank', '{"sentence_before": "The phone ", "sentence_after": " (ring) while I was cooking.", "correct_answers": ["rang"], "feedback_correct": "Correct !", "feedback_incorrect": "Action ponctuelle qui interrompt = past simple."}'),
  (7, 'true_false', '{"statement": "The past continuous sets the scene, the past simple interrupts it.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien leur relation typique."}'),
  (8, 'matching', '{"instruction": "Relie la phrase au bon temps.", "pairs": [{"left": "I was sleeping...", "right": "past continuous"}, {"left": "...when the alarm rang.", "right": "past simple"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ I was cooking, she was setting the table.", "options": ["While", "When", "After", "Before"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"While\" exprime la simultanéité."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " she was talking, I was listening carefully.", "correct_answers": ["While", "As"], "feedback_correct": "Correct !", "feedback_incorrect": "\"While\" ou \"as\" expriment la simultanéité."}'),
  (7, 'true_false', '{"statement": "\"While\" is typically followed by the past continuous.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"while\" s''accompagne bien du past continuous."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["While", "I", "was", "driving,", "it", "started", "raining."], "correct_sentence": "While I was driving, it started raining.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète le récit : It ___ raining when I left home.", "options": ["was", "were", "is", "did"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Contexte au past continuous : \"was raining\"."}'),
  (6, 'fill_blank', '{"sentence_before": "Suddenly, I ", "sentence_after": " (hear) a strange noise.", "correct_answers": ["heard"], "feedback_correct": "Correct !", "feedback_incorrect": "Événement ponctuel = past simple : \"heard\"."}'),
  (7, 'true_false', '{"statement": "A good story often mixes past simple and past continuous.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une bonne pratique narrative."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Suddenly,", "the", "lights", "went", "out."], "correct_sentence": "Suddenly, the lights went out.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Décrire une scène dans le passé', '{"rule": "Le past continuous est idéal pour planter le décor d''une scène passée : ce qui se passait, l''ambiance, les circonstances.", "table": [{"subject": "was/were + -ing", "affirmative": "The sun was shining, birds were singing.", "negative": "—"}], "example": {"en": "It was a beautiful morning. The sun was shining and people were walking in the park.", "fr": "C''était une belle matinée. Le soleil brillait et les gens se promenaient dans le parc."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The birds ___ singing in the trees.", "options": ["was", "were", "is", "are"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"birds\" (pluriel), on utilise \"were\"."}'),
  (2, 'qcm', '{"question": "Quel temps convient le mieux pour décrire une ambiance passée ?", "options": ["Present simple", "Past simple", "Past continuous", "Future"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Le past continuous décrit bien une ambiance/un décor."}'),
  (3, 'fill_blank', '{"sentence_before": "The music ", "sentence_after": " (play) softly in the background.", "correct_answers": ["was playing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Was playing\" décrit l''ambiance."}'),
  (4, 'true_false', '{"statement": "\"Everyone was smiling\" describes a scene in the past.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une description de scène."}'),
  (5, 'matching', '{"instruction": "Relie l''élément de scène à sa description au past continuous.", "pairs": [{"left": "the wind", "right": "was blowing"}, {"left": "the children", "right": "were playing"}, {"left": "the rain", "right": "was falling"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "leaves", "were", "falling", "slowly."], "correct_sentence": "The leaves were falling slowly.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Everyone ___ having a good time.", "options": ["was", "were", "is", "has"], "correct_index": 1, "feedback_correct": "Correct ! (\"everyone\" prend was en fait grammaticalement, mais l''usage courant varie)", "feedback_incorrect": "\"Everyone\" est singulier : \"was\" est aussi correct."}'),
  (8, 'fill_blank', '{"sentence_before": "The waves ", "sentence_after": " (crash) against the rocks.", "correct_answers": ["were crashing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Waves\" pluriel : \"were crashing\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Interruptions multiples dans un récit', '{"rule": "Un récit peut contenir plusieurs interruptions successives : chaque action ponctuelle (past simple) coupe une action en cours (past continuous).", "table": [{"subject": "Structure", "affirmative": "was/were + -ing... when + past simple", "negative": "—"}], "example": {"en": "I was sleeping when the phone rang. I was getting up when I heard a knock at the door.", "fr": "Je dormais quand le téléphone a sonné. Je me levais quand j''ai entendu frapper à la porte."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ (sleep) when the alarm went off.", "options": ["was sleeping", "slept", "sleep", "am sleeping"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Action en cours interrompue = past continuous."}'),
  (2, 'qcm', '{"question": "Complète : The alarm ___ (go) off while I was sleeping.", "options": ["was going", "went", "goes", "go"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Événement ponctuel = past simple : \"went\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (walk) home when it started to rain.", "correct_answers": ["was walking"], "feedback_correct": "Correct !", "feedback_incorrect": "Action en cours = past continuous."}'),
  (4, 'true_false', '{"statement": "A story can have multiple interruptions with different subjects.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien possible d''avoir plusieurs interruptions."}'),
  (5, 'matching', '{"instruction": "Relie l''action en cours à son interruption.", "pairs": [{"left": "I was cooking", "right": "when the smoke alarm rang"}, {"left": "She was driving", "right": "when she saw the accident"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "was", "reading", "when", "she", "arrived."], "correct_sentence": "I was reading when she arrived.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : They ___ (talk) when the teacher walked in.", "options": ["were talking", "talked", "talk", "are talking"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Action en cours = past continuous."}'),
  (8, 'fill_blank', '{"sentence_before": "The lights ", "sentence_after": " (go) out while we were eating dinner.", "correct_answers": ["went"], "feedback_correct": "Correct !", "feedback_incorrect": "Événement ponctuel = past simple."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Connecteurs narratifs (suddenly, meanwhile, then)', '{"rule": "Les connecteurs narratifs structurent un récit : \"suddenly\" (soudain), \"meanwhile\" (pendant ce temps), \"then\" (puis), \"eventually\" (finalement).", "table": [{"subject": "suddenly", "affirmative": "soudain", "negative": "—"}, {"subject": "meanwhile", "affirmative": "pendant ce temps", "negative": "—"}, {"subject": "eventually", "affirmative": "finalement", "negative": "—"}], "example": {"en": "I was walking home. Suddenly, it started to rain. Meanwhile, my friend was waiting at the café.", "fr": "Je rentrais chez moi. Soudain, il s''est mis à pleuvoir. Pendant ce temps, mon ami attendait au café."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Meanwhile\" veut dire :", "options": ["Soudain", "Pendant ce temps", "Finalement", "D''abord"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Meanwhile\" = pendant ce temps."}'),
  (2, 'qcm', '{"question": "\"Eventually\" veut dire :", "options": ["Soudain", "Jamais", "Finalement", "Rarement"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Eventually\" = finalement."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": ", the door opened. (soudain)", "correct_answers": ["Suddenly"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Soudain\" = \"Suddenly\"."}'),
  (4, 'true_false', '{"statement": "\"Then\" is used to sequence events one after another.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"then\" sert bien à ordonner les événements."}'),
  (5, 'matching', '{"instruction": "Relie le connecteur à sa fonction.", "pairs": [{"left": "first", "right": "début"}, {"left": "then", "right": "suite"}, {"left": "finally", "right": "fin"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Meanwhile,", "back", "at", "home,", "she", "was", "waiting."], "correct_sentence": "Meanwhile, back at home, she was waiting.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : We looked everywhere and ___ found the keys.", "options": ["suddenly", "eventually", "while", "meanwhile"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Après un effort, résultat final = \"eventually\"."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": ", we heard a loud noise. (soudain)", "correct_answers": ["Suddenly"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Soudain\" = \"Suddenly\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : raconter une histoire complète au passé', '{"rule": "Cette leçon combine past simple, past continuous, connecteurs narratifs et while/as pour raconter une histoire riche et fluide.", "table": [{"subject": "Décor", "affirmative": "It was raining, people were walking", "negative": "—"}, {"subject": "Événements", "affirmative": "Suddenly, I saw... Then, I ran...", "negative": "—"}, {"subject": "Simultanéité", "affirmative": "While I was waiting, she called", "negative": "—"}], "example": {"en": "It was a quiet evening. I was reading when suddenly the phone rang. While I was talking, someone knocked at the door. Eventually, I found out it was my neighbor.", "fr": "C''était une soirée tranquille. Je lisais quand soudain le téléphone a sonné. Pendant que je parlais, quelqu''un a frappé à la porte. J''ai finalement découvert que c''était mon voisin."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 18 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : It ___ (be) a quiet evening.", "options": ["was", "were", "is", "has been"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Contexte au passé : \"was\"."}'),
  (2, 'qcm', '{"question": "Complète : I ___ (read) when the phone rang.", "options": ["was reading", "read", "am reading", "have read"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Action interrompue = past continuous."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": ", someone knocked at the door. (soudain)", "correct_answers": ["Suddenly"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Soudain\" = \"Suddenly\"."}'),
  (4, 'true_false', '{"statement": "A well-structured story combines background (continuous) and events (simple).", "correct_answer": true, "feedback_correct": "Exact, bilan de l''unité réussi !", "feedback_incorrect": "Faux — c''est bien la bonne structure narrative."}'),
  (5, 'matching', '{"instruction": "Bilan : relie l''élément narratif à sa fonction.", "pairs": [{"left": "It was raining", "right": "décor (continuous)"}, {"left": "Suddenly, I heard a noise", "right": "événement (simple)"}, {"left": "While I was cooking...", "right": "simultanéité"}], "feedback_correct": "Parfait, tu sais raconter une histoire !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["While", "I", "was", "talking,", "she", "left."], "correct_sentence": "While I was talking, she left.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : ___, we found a solution.", "options": ["Eventually", "While", "As", "During"], "correct_index": 0, "feedback_correct": "Correct ! Bilan de l''unité réussi.", "feedback_incorrect": "Résultat final après effort = \"Eventually\"."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " I was cooking, the phone rang three times. (pendant que)", "correct_answers": ["While", "As"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Pendant que\" = \"While\" ou \"As\"."}')
) as v(position, type, content);
