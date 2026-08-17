-- ============================================
-- LUMA — Unité 9 (A2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I ___ going to visit my family.", "options": ["am", "is", "are", "be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", on utilise \"am\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She is ", "sentence_after": " to buy a new car.", "correct_answers": ["going"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Going to\" exprime une intention."}'),
  (7, 'true_false', '{"statement": "\"Going to\" is used for planned intentions.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"going to\" exprime bien une intention prévue."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "are", "going", "to", "travel."], "correct_sentence": "We are going to travel.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I think it ___ rain tomorrow.", "options": ["will", "going to", "is", "am"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Prédiction incertaine = \"will\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " help you! (décision spontanée)", "correct_answers": ["will", "''ll"], "feedback_correct": "Correct !", "feedback_incorrect": "Décision spontanée = \"will\"."}'),
  (7, 'true_false', '{"statement": "\"Will\" changes form depending on the subject.", "correct_answer": false, "feedback_correct": "Exact — \"will\" ne change jamais.", "feedback_incorrect": "Faux — \"will\" reste identique pour tous les sujets."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "will", "call", "you", "later."], "correct_sentence": "She will call you later.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ you come to the party?", "options": ["Will", "Are", "Do", "Is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Question au futur avec \"will\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " not be there tomorrow.", "correct_answers": ["will"], "feedback_correct": "Correct !", "feedback_incorrect": "Négation : \"will not\" (won''t)."}'),
  (7, 'true_false', '{"statement": "\"Won''t\" means \"will not\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"won''t\" est bien la contraction de \"will not\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Will", "they", "arrive", "on", "time?"], "correct_sentence": "Will they arrive on time?", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Plan\" veut dire :", "options": ["Passé", "Projet", "Souvenir", "Problème"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Plan\" = projet."}'),
  (6, 'fill_blank', '{"sentence_before": "My ", "sentence_after": " is to travel next year. (objectif)", "correct_answers": ["goal"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Objectif\" = \"goal\"."}'),
  (7, 'true_false', '{"statement": "\"Intention\" and \"plan\" can be used similarly.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les deux mots sont bien proches en sens."}'),
  (8, 'matching', '{"instruction": "Relie le mot au projet à sa traduction.", "pairs": [{"left": "dream", "right": "rêve"}, {"left": "ambition", "right": "ambition"}, {"left": "resolution", "right": "résolution"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Present continuous pour le futur proche', '{"rule": "Le present continuous peut aussi exprimer un futur proche déjà planifié, souvent avec une date précise.", "table": [{"subject": "I am + verb-ing", "affirmative": "I am meeting him tomorrow.", "negative": "—"}], "example": {"en": "I am flying to London next Monday.", "fr": "Je m''envole pour Londres lundi prochain."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : We ___ dinner with friends tonight. (déjà organisé)", "options": ["will have", "are having", "have", "had"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Projet déjà organisé = present continuous."}'),
  (2, 'qcm', '{"question": "\"I am starting my new job Monday\" exprime :", "options": ["Une habitude", "Un futur planifié", "Un passé", "Une capacité"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "C''est un futur proche déjà organisé."}'),
  (3, 'fill_blank', '{"sentence_before": "She is ", "sentence_after": " (leave) for Paris tomorrow.", "correct_answers": ["leaving"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Leave\" + ing = \"leaving\"."}'),
  (4, 'true_false', '{"statement": "The present continuous for future needs a time expression.", "correct_answer": true, "feedback_correct": "Exact, sinon on ne saurait pas si c''est maintenant ou plus tard.", "feedback_incorrect": "Faux — une expression de temps est bien nécessaire."}'),
  (5, 'matching', '{"instruction": "Relie la phrase à son usage.", "pairs": [{"left": "I am eating now.", "right": "présent en cours"}, {"left": "I am eating with him Friday.", "right": "futur planifié"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "are", "flying", "to", "Rome", "Friday."], "correct_sentence": "We are flying to Rome Friday.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I ___ my sister this weekend.", "options": ["am visiting", "visit", "visited", "will visited"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Futur planifié = present continuous."}'),
  (8, 'fill_blank', '{"sentence_before": "They are ", "sentence_after": " (get) married in June.", "correct_answers": ["getting"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Get\" + ing = \"getting\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Exprimer ses rêves et ambitions', '{"rule": "\"Would like to\" (aimerait) et \"hope to\" (espère) permettent d''exprimer des souhaits et ambitions pour le futur, de façon plus nuancée que \"want\".", "table": [{"subject": "would like to", "affirmative": "aimerait", "negative": "—"}, {"subject": "hope to", "affirmative": "espère", "negative": "—"}, {"subject": "dream of", "affirmative": "rêve de", "negative": "—"}], "example": {"en": "I would like to travel the world one day.", "fr": "J''aimerais voyager autour du monde un jour."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ to become a doctor.", "options": ["hope", "hopes", "hoping", "hoped"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"I\", pas de -s : \"hope\"."}'),
  (2, 'qcm', '{"question": "\"Would like to\" veut dire :", "options": ["Doit", "Aimerait", "Peut", "Sait"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Would like to\" = aimerait."}'),
  (3, 'fill_blank', '{"sentence_before": "She dreams ", "sentence_after": " living abroad.", "correct_answers": ["of"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Dream of\" = rêver de."}'),
  (4, 'true_false', '{"statement": "\"I would like to\" is more polite than \"I want to\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"would like to\" est bien plus poli."}'),
  (5, 'matching', '{"instruction": "Relie l''expression à sa traduction.", "pairs": [{"left": "hope to", "right": "espérer"}, {"left": "dream of", "right": "rêver de"}, {"left": "plan to", "right": "prévoir de"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "would", "like", "to", "learn", "French."], "correct_sentence": "I would like to learn French.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : We ___ to visit Japan someday.", "options": ["hope", "hopes", "hoping", "hoped"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"we\", pas de -s : \"hope\"."}'),
  (8, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " to start his own business.", "correct_answers": ["hopes"], "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"he\", on ajoute -s : \"hopes\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Faire des prédictions (probablement / peut-être)', '{"rule": "Pour nuancer une prédiction, on ajoute des adverbes comme \"probably\" (probablement) ou \"maybe/perhaps\" (peut-être).", "table": [{"subject": "probably", "affirmative": "probablement", "negative": "—"}, {"subject": "maybe / perhaps", "affirmative": "peut-être", "negative": "—"}, {"subject": "definitely", "affirmative": "certainement", "negative": "—"}], "example": {"en": "It will probably rain tomorrow. Maybe we should stay home.", "fr": "Il pleuvra probablement demain. On devrait peut-être rester à la maison."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Probably\" veut dire :", "options": ["Jamais", "Probablement", "Certainement", "Rarement"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Probably\" = probablement."}'),
  (2, 'qcm', '{"question": "Où se place \"probably\" avec \"will\" ?", "options": ["Avant will", "Après will", "En fin de phrase", "En début de phrase"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Probably\" se place après \"will\" : \"will probably\"."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": ", she will come later. (peut-être)", "correct_answers": ["Maybe"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Peut-être\" = \"Maybe\"."}'),
  (4, 'true_false', '{"statement": "\"Definitely\" expresses more certainty than \"maybe\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"definitely\" exprime bien plus de certitude."}'),
  (5, 'matching', '{"instruction": "Classe du moins au plus certain.", "pairs": [{"left": "maybe", "right": "peu certain"}, {"left": "probably", "right": "assez certain"}, {"left": "definitely", "right": "très certain"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "will", "probably", "be", "sunny."], "correct_sentence": "It will probably be sunny.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Perhaps\" est synonyme de :", "options": ["Definitely", "Maybe", "Never", "Always"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Perhaps\" = \"maybe\" (peut-être)."}'),
  (8, 'fill_blank', '{"sentence_before": "I will ", "sentence_after": " be late. (probablement)", "correct_answers": ["probably"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Probablement\" = \"probably\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Parler de l''avenir : bilan will / going to / present continuous', '{"rule": "Cette leçon combine les trois façons de parler du futur : \"will\" (décision spontanée/prédiction), \"going to\" (intention prévue), \"present continuous\" (projet organisé avec date).", "table": [{"subject": "will", "affirmative": "décision spontanée", "negative": "I''ll help you"}, {"subject": "going to", "affirmative": "intention prévue", "negative": "I''m going to study"}, {"subject": "present continuous", "affirmative": "projet organisé", "negative": "I''m meeting her Friday"}], "example": {"en": "I''m going to travel this year. I''m flying to Rome in March. I think I''ll love it!", "fr": "Je vais voyager cette année. Je m''envole pour Rome en mars. Je pense que je vais adorer !"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 9 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Pour une décision prise à l''instant, on utilise :", "options": ["will", "going to", "present continuous", "past simple"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Décision spontanée = \"will\"."}'),
  (2, 'qcm', '{"question": "Pour un projet avec billet déjà acheté, on utilise plutôt :", "options": ["will", "going to ou present continuous", "past simple", "present simple"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Projet organisé = \"going to\" ou present continuous."}'),
  (3, 'fill_blank', '{"sentence_before": "I think it ", "sentence_after": " be a great trip. (prédiction)", "correct_answers": ["will"], "feedback_correct": "Correct !", "feedback_incorrect": "Prédiction = \"will\"."}'),
  (4, 'true_false', '{"statement": "\"Going to\" and \"will\" are always 100% interchangeable.", "correct_answer": false, "feedback_correct": "Exact — chacun a sa nuance propre.", "feedback_incorrect": "Faux — ils ont des nuances différentes."}'),
  (5, 'matching', '{"instruction": "Relie l''usage à la forme du futur.", "pairs": [{"left": "Décision spontanée", "right": "will"}, {"left": "Intention prévue", "right": "going to"}, {"left": "Projet organisé avec date", "right": "present continuous"}], "feedback_correct": "Parfait, tu maîtrises le futur !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''m", "going", "to", "call", "her", "later."], "correct_sentence": "I''m going to call her later.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Oh, the phone is ringing — I ___ answer it!", "options": ["will", "am going to", "am answering", "answered"], "correct_index": 0, "feedback_correct": "Correct ! Décision spontanée à l''instant.", "feedback_incorrect": "Décision spontanée immédiate = \"will\"."}'),
  (8, 'fill_blank', '{"sentence_before": "We are ", "sentence_after": " a party next Saturday. (organisons déjà)", "correct_answers": ["having"], "feedback_correct": "Correct !", "feedback_incorrect": "Projet déjà organisé = present continuous : \"having\"."}')
) as v(position, type, content);
