-- ============================================
-- LUMA — Unité 26 (B2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : When I arrived, she ___ already left.", "options": ["had", "has", "have", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Past perfect : \"had already left\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (finish) before she called.", "correct_answers": ["had finished"], "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité dans le passé = past perfect."}'),
  (7, 'true_false', '{"statement": "The past perfect describes an action before another past action.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "had", "never", "seen", "snow", "before."], "correct_sentence": "She had never seen snow before.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ been waiting for an hour when he arrived.", "options": ["had", "have", "was", "am"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Past perfect continuous : \"had been waiting\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She had been ", "sentence_after": " (study) all night before the exam.", "correct_answers": ["studying"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Study\" + ing = \"studying\"."}'),
  (7, 'true_false', '{"statement": "The past perfect continuous emphasizes duration before a past moment.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["They", "had", "been", "working", "for", "hours."], "correct_sentence": "They had been working for hours.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ the time I arrived, everyone had left.", "options": ["By", "At", "In", "On"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"By the time\" introduit une limite temporelle."}'),
  (6, 'fill_blank', '{"sentence_before": "I had finished ", "sentence_after": " she arrived. (avant que)", "correct_answers": ["before"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Avant que\" = \"before\"."}'),
  (7, 'true_false', '{"statement": "\"By the time\" often triggers the past perfect.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien un déclencheur fréquent."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["By", "the", "time", "we", "arrived,", "it", "had", "ended."], "correct_sentence": "By the time we arrived, it had ended.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Dans un récit à plusieurs niveaux, l''action la plus ancienne utilise :", "options": ["Present simple", "Past simple", "Past perfect", "Future"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "L''action la plus ancienne = past perfect."}'),
  (6, 'fill_blank', '{"sentence_before": "After she ", "sentence_after": " (leave), I called her. (avait quitté)", "correct_answers": ["had left"], "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité = past perfect : \"had left\"."}'),
  (7, 'true_false', '{"statement": "A complex narrative can mix past simple, past continuous, and past perfect.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien possible et courant."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "realized", "I", "had", "forgotten", "my", "keys."], "correct_sentence": "I realized I had forgotten my keys.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Past perfect vs past simple : le bon ordre chronologique', '{"rule": "Le past perfect marque clairement quelle action s''est produite EN PREMIER, quand deux actions passées sont mentionnées et que l''ordre n''est pas évident.", "table": [{"subject": "Ordre clair sans past perfect", "affirmative": "I ate after I cooked. (ordre déjà clair avec \"after\")", "negative": "—"}, {"subject": "Past perfect nécessaire", "affirmative": "I had eaten when she arrived. (précise l''antériorité)", "negative": "—"}], "example": {"en": "When I got to the station, the train had already left.", "fr": "Quand je suis arrivé à la gare, le train était déjà parti."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : When she woke up, the sun ___ already risen.", "options": ["had", "has", "have", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Le soleil s''est levé avant : past perfect."}'),
  (2, 'qcm', '{"question": "Pourquoi utilise-t-on le past perfect ici ?", "options": ["Par habitude", "Pour montrer quelle action s''est passée en premier", "C''est obligatoire toujours au passé", "Aucune raison précise"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le past perfect clarifie l''ordre chronologique."}'),
  (3, 'fill_blank', '{"sentence_before": "By the time I called, she ", "sentence_after": " (already, decide).", "correct_answers": ["had already decided"], "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité = past perfect."}'),
  (4, 'true_false', '{"statement": "If the order is already clear from words like \"before/after\", the past perfect is optional.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien vrai, même si toujours possible."}'),
  (5, 'matching', '{"instruction": "Relie la situation à l''action antérieure.", "pairs": [{"left": "When I arrived, the film...", "right": "had already started"}, {"left": "She was tired because she...", "right": "had been working all day"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "movie", "had", "started", "when", "we", "got", "there."], "correct_sentence": "The movie had started when we got there.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I couldn''t get in because I ___ (forget) my keys.", "options": ["had forgotten", "forgot", "forget", "was forgetting"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Cause antérieure = past perfect."}'),
  (8, 'fill_blank', '{"sentence_before": "She was upset because he ", "sentence_after": " (not, call) her back.", "correct_answers": ["hadn''t called"], "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité négative = \"hadn''t called\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'By the time, as soon as, once', '{"rule": "Ces connecteurs temporels précis structurent des récits complexes : \"by the time\" (au moment où), \"as soon as\" (dès que), \"once\" (une fois que).", "table": [{"subject": "by the time", "affirmative": "au moment où", "negative": "—"}, {"subject": "as soon as", "affirmative": "dès que", "negative": "—"}, {"subject": "once", "affirmative": "une fois que", "negative": "—"}], "example": {"en": "As soon as I finished, I called her. Once she arrives, we can start.", "fr": "Dès que j''ai fini, je l''ai appelée. Une fois qu''elle arrive, on peut commencer."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"As soon as\" veut dire :", "options": ["Plus tard", "Dès que", "Avant", "Jamais"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"As soon as\" = dès que."}'),
  (2, 'qcm', '{"question": "\"Once\" (connecteur) veut dire :", "options": ["Une fois que", "Toujours", "Souvent", "Rarement"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Once\" = une fois que."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " I heard the news, I called you. (dès que)", "correct_answers": ["As soon as"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Dès que\" = \"As soon as\"."}'),
  (4, 'true_false', '{"statement": "\"By the time\" can be used with both past perfect and future perfect.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien vrai selon le contexte temporel."}'),
  (5, 'matching', '{"instruction": "Relie le connecteur à sa traduction.", "pairs": [{"left": "as soon as", "right": "dès que"}, {"left": "once", "right": "une fois que"}, {"left": "by the time", "right": "au moment où"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Once", "you", "finish,", "let", "me", "know."], "correct_sentence": "Once you finish, let me know.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : ___ she left, everyone relaxed.", "options": ["As soon as", "By", "During", "For"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"As soon as\" = dès que."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " you understand the rules, the game is easy. (une fois que)", "correct_answers": ["Once"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Une fois que\" = \"Once\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Raconter un souvenir d''enfance complexe', '{"rule": "Cette leçon applique le past perfect (simple et continuous) à des récits de souvenirs d''enfance, souvent riches en plusieurs niveaux temporels.", "table": [{"subject": "Contexte", "affirmative": "past simple/continuous", "negative": "—"}, {"subject": "Antériorité", "affirmative": "past perfect", "negative": "—"}], "example": {"en": "By the time I was ten, I had already moved three times. I had been living in that city for two years when we moved again.", "fr": "Quand j''ai eu dix ans, j''avais déjà déménagé trois fois. J''habitais dans cette ville depuis deux ans quand on a encore déménagé."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : By the time I was twelve, I ___ (visit) five countries.", "options": ["had visited", "visited", "have visited", "was visiting"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité par rapport à un âge = past perfect."}'),
  (2, 'qcm', '{"question": "Complète : I ___ (live) there for years before we moved.", "options": ["had been living", "lived", "live", "was living"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Durée avant un autre événement passé = past perfect continuous."}'),
  (3, 'fill_blank', '{"sentence_before": "I had never ", "sentence_after": " (see) the ocean before that trip.", "correct_answers": ["seen"], "feedback_correct": "Correct !", "feedback_incorrect": "\"See\" au participe : \"seen\"."}'),
  (4, 'true_false', '{"statement": "Childhood memories often require multiple past tenses to be accurate.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien souvent nécessaire."}'),
  (5, 'matching', '{"instruction": "Relie l''élément du récit à son temps.", "pairs": [{"left": "Contexte général", "right": "past simple"}, {"left": "Action antérieure", "right": "past perfect"}, {"left": "Durée avant un événement", "right": "past perfect continuous"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "had", "always", "wanted", "to", "visit", "Japan."], "correct_sentence": "I had always wanted to visit Japan.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She had been dreaming of this moment ___ years.", "options": ["for", "since", "during", "at"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Durée = \"for\"."}'),
  (8, 'fill_blank', '{"sentence_before": "By the time I turned eighteen, I ", "sentence_after": " already left home.", "correct_answers": ["had"], "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité par rapport à un âge = \"had\" + participe."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : le past perfect dans un récit complexe', '{"rule": "Cette leçon consolide past perfect simple/continuous, connecteurs temporels précis (by the time, as soon as, once) pour construire un récit riche à plusieurs niveaux temporels.", "table": [{"subject": "Antériorité simple", "affirmative": "had + participe", "negative": "—"}, {"subject": "Antériorité durée", "affirmative": "had been + -ing", "negative": "—"}, {"subject": "Connecteurs", "affirmative": "by the time, as soon as, once", "negative": "—"}], "example": {"en": "By the time the ambulance arrived, the doctor had already stabilized the patient, who had been struggling to breathe for several minutes.", "fr": "Au moment où l''ambulance est arrivée, le médecin avait déjà stabilisé le patient, qui avait du mal à respirer depuis plusieurs minutes."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 26 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : By the time help arrived, she ___ (already, recover).", "options": ["had already recovered", "already recovered", "has already recovered", "was already recovering"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité = past perfect."}'),
  (2, 'qcm', '{"question": "Complète : ___ we finished, we celebrated.", "options": ["As soon as", "During", "For", "At"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"As soon as\" = dès que."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (wait) for two hours when the bus finally arrived. (had been waiting)", "correct_answers": ["had been waiting"], "feedback_correct": "Correct !", "feedback_incorrect": "Durée avant un événement passé = past perfect continuous."}'),
  (4, 'true_false', '{"statement": "A rich narrative can layer past simple, past perfect, and past perfect continuous together.", "correct_answer": true, "feedback_correct": "Exact, bilan de l''unité réussi !", "feedback_incorrect": "Faux — c''est bien possible et fréquent."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque temps à sa fonction narrative.", "pairs": [{"left": "past simple", "right": "événement principal"}, {"left": "past perfect", "right": "action antérieure"}, {"left": "past perfect continuous", "right": "durée avant un événement"}], "feedback_correct": "Parfait, bilan du past perfect réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Once", "the", "storm", "had", "passed,", "we", "went", "outside."], "correct_sentence": "Once the storm had passed, we went outside.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : By the time we got home, it ___ (stop) raining.", "options": ["had stopped", "stopped", "has stopped", "was stopping"], "correct_index": 0, "feedback_correct": "Correct ! Bilan de l''unité réussi.", "feedback_incorrect": "Antériorité = past perfect : \"had stopped\"."}'),
  (8, 'fill_blank', '{"sentence_before": "She had been crying, so her eyes ", "sentence_after": " red.", "correct_answers": ["were"], "feedback_correct": "Correct !", "feedback_incorrect": "Conséquence au past simple : \"were\"."}')
) as v(position, type, content);
