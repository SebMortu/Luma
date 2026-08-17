-- ============================================
-- LUMA — Unité 8 (dernière de A1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Water\" est un nom :", "options": ["Dénombrable", "Indénombrable", "Les deux", "Aucun"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Water\" est indénombrable (pas de pluriel)."}'),
  (6, 'fill_blank', '{"sentence_before": "I need some ", "sentence_after": ". (information, indénombrable)", "correct_answers": ["information"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Information\" est indénombrable, jamais \"informations\"."}'),
  (7, 'true_false', '{"statement": "\"Furniture\" is countable in English.", "correct_answer": false, "feedback_correct": "Exact — \"furniture\" est indénombrable.", "feedback_incorrect": "Faux — \"furniture\" est indénombrable en anglais."}'),
  (8, 'matching', '{"instruction": "Classe le nom : dénombrable ou indénombrable ?", "pairs": [{"left": "apple", "right": "dénombrable"}, {"left": "rice", "right": "indénombrable"}, {"left": "chair", "right": "dénombrable"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : How ___ apples do you have?", "options": ["much", "many", "a lot", "some"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Apples\" est dénombrable : \"many\"."}'),
  (6, 'fill_blank', '{"sentence_before": "How ", "sentence_after": " water do you drink? (indénombrable)", "correct_answers": ["much"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Water\" est indénombrable : \"much\"."}'),
  (7, 'true_false', '{"statement": "\"A lot of\" works with both countable and uncountable nouns.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"a lot of\" fonctionne bien avec les deux."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "don''t", "have", "much", "time."], "correct_sentence": "I don''t have much time.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She has ___ friends here. (peu, dénombrable)", "options": ["little", "few", "much", "less"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Friends\" est dénombrable : \"few\"."}'),
  (6, 'fill_blank', '{"sentence_before": "There is ", "sentence_after": " sugar left. (peu, indénombrable)", "correct_answers": ["little"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Sugar\" est indénombrable : \"little\"."}'),
  (7, 'true_false', '{"statement": "\"A few\" and \"few\" have exactly the same meaning.", "correct_answer": false, "feedback_correct": "Exact — \"a few\" (quelques) est positif, \"few\" (peu) est plus négatif.", "feedback_incorrect": "Faux — la nuance entre les deux est importante."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "a", "few", "questions."], "correct_sentence": "I have a few questions.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She ___ a teacher.", "options": ["am", "is", "are", "be"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Révision : \"she is\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (go) to Spain last year.", "correct_answers": ["went"], "feedback_correct": "Correct !", "feedback_incorrect": "Révision : passé irrégulier de \"go\" = \"went\"."}'),
  (7, 'true_false', '{"statement": "\"There are some milk\" is correct.", "correct_answer": false, "feedback_correct": "Exact — \"milk\" est indénombrable, il faut \"there is some milk\".", "feedback_incorrect": "Faux — \"milk\" est indénombrable, donc \"there IS\"."}'),
  (8, 'matching', '{"instruction": "Révision : relie chaque règle à son exemple.", "pairs": [{"left": "Present simple", "right": "I work every day"}, {"left": "Past simple", "right": "I worked yesterday"}, {"left": "Present continuous", "right": "I am working now"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Révision : le présent (simple et continuous)', '{"rule": "Cette leçon de révision combine present simple (habitudes) et present continuous (actions en cours) vus dans les unités précédentes.", "table": [{"subject": "Habitude", "affirmative": "I work every day", "negative": "I don''t work on Sundays"}, {"subject": "En cours", "affirmative": "I am working now", "negative": "I am not working now"}], "example": {"en": "I usually work from home, but today I am working at the office.", "fr": "Je travaille habituellement depuis chez moi, mais aujourd''hui je travaille au bureau."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Right now, I ___ (write) an email.", "options": ["write", "am writing", "writes", "wrote"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Action en cours = present continuous."}'),
  (2, 'qcm', '{"question": "Complète : Every day, she ___ (walk) to work.", "options": ["walk", "walks", "is walking", "walked"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Habitude = present simple avec -s."}'),
  (3, 'fill_blank', '{"sentence_before": "Look! It ", "sentence_after": " (rain).", "correct_answers": ["is raining"], "feedback_correct": "Correct !", "feedback_incorrect": "Action visible maintenant = present continuous."}'),
  (4, 'true_false', '{"statement": "\"I am liking this song\" is correct English.", "correct_answer": false, "feedback_correct": "Exact — \"like\" est un verbe d''état, on dit \"I like this song\".", "feedback_incorrect": "Faux — \"like\" ne prend pas -ing."}'),
  (5, 'matching', '{"instruction": "Relie la phrase au bon temps.", "pairs": [{"left": "I play tennis on Mondays.", "right": "present simple"}, {"left": "I am playing tennis now.", "right": "present continuous"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "usually", "wakes", "up", "early."], "correct_sentence": "She usually wakes up early.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : We ___ (not, work) today.", "options": ["don''t work", "aren''t working", "les deux sont possibles selon le contexte", "doesn''t work"], "correct_index": 2, "feedback_correct": "Correct ! Ça dépend si c''est une habitude ou maintenant.", "feedback_incorrect": "Les deux formes existent selon le contexte (habitude vs maintenant)."}'),
  (8, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " (not, like) coffee. (habitude)", "correct_answers": ["doesn''t like"], "feedback_correct": "Correct !", "feedback_incorrect": "Habitude négative avec \"he\" : \"doesn''t like\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Révision : le passé (to be, réguliers, irréguliers)', '{"rule": "Cette leçon révise les trois formes du passé vues : \"was/were\", les verbes réguliers (+ed), et les verbes irréguliers à mémoriser.", "table": [{"subject": "to be", "affirmative": "was / were", "negative": "wasn''t / weren''t"}, {"subject": "Réguliers", "affirmative": "walked, played", "negative": "didn''t walk"}, {"subject": "Irréguliers", "affirmative": "went, saw, had", "negative": "didn''t go"}], "example": {"en": "I was tired, so I stayed home and watched a movie.", "fr": "J''étais fatigué, donc je suis resté à la maison et j''ai regardé un film."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ tired yesterday.", "options": ["am", "was", "is", "be"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"To be\" au passé avec \"I\" : \"was\"."}'),
  (2, 'qcm', '{"question": "Quel est le passé de \"play\" (régulier) ?", "options": ["played", "plaied", "play", "playing"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Verbe régulier : \"played\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " (see) my friends last weekend.", "correct_answers": ["saw"], "feedback_correct": "Correct !", "feedback_incorrect": "\"See\" irrégulier au passé : \"saw\"."}'),
  (4, 'true_false', '{"statement": "\"Did you went there?\" is grammatically correct.", "correct_answer": false, "feedback_correct": "Exact — c''est \"Did you go there?\"", "feedback_incorrect": "Faux — après \"did\", on utilise la base verbale."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à son passé.", "pairs": [{"left": "have", "right": "had"}, {"left": "watch", "right": "watched"}, {"left": "be", "right": "was/were"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "didn''t", "go", "to", "the", "party."], "correct_sentence": "We didn''t go to the party.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : They ___ happy about the news.", "options": ["was", "were", "is", "are"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"To be\" au passé avec \"they\" : \"were\"."}'),
  (8, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " (not, eat) breakfast this morning.", "correct_answers": ["didn''t eat"], "feedback_correct": "Correct !", "feedback_incorrect": "Négation passée : \"didn''t eat\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Révision : quantités et dénombrable/indénombrable', '{"rule": "Cette leçon consolide some/any, much/many, few/little vus dans cette unité, appliqués à des contextes variés du quotidien.", "table": [{"subject": "some/any", "affirmative": "affirmatif/négatif-question", "negative": "—"}, {"subject": "much/many", "affirmative": "indénombrable/dénombrable", "negative": "—"}, {"subject": "few/little", "affirmative": "peu (dénombrable/indénombrable)", "negative": "—"}], "example": {"en": "There isn''t much time and there are few options left.", "fr": "Il n''y a pas beaucoup de temps et il reste peu d''options."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Is there ___ bread left?", "options": ["some", "any", "many", "few"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Dans une question, on utilise \"any\"."}'),
  (2, 'qcm', '{"question": "Complète : How ___ money do you have? (indénombrable)", "options": ["many", "much", "few", "little"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Money\" est indénombrable : \"much\"."}'),
  (3, 'fill_blank', '{"sentence_before": "There are ", "sentence_after": " people here today. (peu, dénombrable)", "correct_answers": ["few"], "feedback_correct": "Correct !", "feedback_incorrect": "\"People\" est dénombrable : \"few\"."}'),
  (4, 'true_false', '{"statement": "\"I have some questions\" is a correct affirmative sentence.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien correct, \"some\" en affirmatif."}'),
  (5, 'matching', '{"instruction": "Relie l''expression à son contexte.", "pairs": [{"left": "some", "right": "affirmatif"}, {"left": "any", "right": "négatif/question"}, {"left": "a lot of", "right": "grande quantité"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "don''t", "have", "any", "money."], "correct_sentence": "I don''t have any money.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : There is ___ sugar in the cupboard. (peu, indénombrable)", "options": ["few", "little", "many", "some are"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Sugar\" est indénombrable : \"little\"."}'),
  (8, 'fill_blank', '{"sentence_before": "We have ", "sentence_after": " friends coming tonight. (quelques)", "correct_answers": ["a few"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Quelques\" (positif) = \"a few\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan final A1 : se présenter en détail', '{"rule": "Cette dernière leçon du niveau A1 combine toutes les compétences apprises : se présenter, parler de sa routine, raconter un souvenir, exprimer ses goûts et ses quantités — un vrai bilan complet avant de passer au niveau A2.", "table": [{"subject": "Présent", "affirmative": "I am / I work / I am working", "negative": "—"}, {"subject": "Passé", "affirmative": "I was / I worked / I went", "negative": "—"}, {"subject": "Goûts", "affirmative": "I like / I love / I hate", "negative": "—"}], "example": {"en": "Hi, I''m Alex. I usually work in an office, but yesterday I worked from home. I love coffee and I have a few hobbies, like reading.", "fr": "Salut, je suis Alex. Je travaille habituellement au bureau, mais hier j''ai travaillé depuis chez moi. J''adore le café et j''ai quelques passe-temps, comme la lecture."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 8 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète le bilan : Hi, I ___ Alex.", "options": ["am", "is", "are", "be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"I am\" pour se présenter."}'),
  (2, 'qcm', '{"question": "Complète : Yesterday, I ___ (work) from home.", "options": ["work", "worked", "am working", "works"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Yesterday\" = past simple : \"worked\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " reading books. (j''adore)", "correct_answers": ["love"], "feedback_correct": "Correct !", "feedback_incorrect": "\"J''adore\" = \"I love\"."}'),
  (4, 'true_false', '{"statement": "This lesson combines present, past, and preferences.", "correct_answer": true, "feedback_correct": "Exact, c''est le bilan complet du niveau A1 !", "feedback_incorrect": "Faux — cette leçon combine bien tout ce qui a été vu."}'),
  (5, 'matching', '{"instruction": "Relie chaque partie du bilan à sa fonction.", "pairs": [{"left": "I am Alex", "right": "se présenter"}, {"left": "I worked from home", "right": "raconter le passé"}, {"left": "I love coffee", "right": "exprimer un goût"}], "feedback_correct": "Parfait, tu maîtrises le bilan A1 !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "have", "a", "few", "hobbies."], "correct_sentence": "I have a few hobbies.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I usually ___ (work) in an office.", "options": ["work", "worked", "am working", "works"], "correct_index": 0, "feedback_correct": "Correct ! Bravo, tu as terminé le niveau A1 !", "feedback_incorrect": "Habitude = present simple : \"work\"."}'),
  (8, 'fill_blank', '{"sentence_before": "Nice to ", "sentence_after": " you! (rencontrer)", "correct_answers": ["meet"], "feedback_correct": "Correct ! Félicitations pour avoir terminé le niveau A1 !", "feedback_incorrect": "\"Rencontrer\" = \"meet\"."}')
) as v(position, type, content);
