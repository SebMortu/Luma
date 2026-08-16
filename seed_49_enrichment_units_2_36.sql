-- ============================================
-- LUMA — Enrichissement des Unités 2 à 36
-- Ajoute 1 exercice Association/Réordonner par unité (variété des formats)
-- ============================================

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le sujet à la bonne forme du verbe.", "pairs": [{"left": "He", "right": "works"}, {"left": "I", "right": "work"}, {"left": "They", "right": "work"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Do", "you", "speak", "French?"], "correct_sentence": "Do you speak French?", "feedback_correct": "Parfait !"}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le singulier à son pluriel irrégulier.", "pairs": [{"left": "child", "right": "children"}, {"left": "man", "right": "men"}, {"left": "foot", "right": "feet"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le possesseur à son adjectif possessif.", "pairs": [{"left": "Marc (homme)", "right": "his"}, {"left": "Julie (femme)", "right": "her"}, {"left": "Nous", "right": "our"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "is", "writing", "a", "letter."], "correct_sentence": "She is writing a letter.", "feedback_correct": "Parfait !"}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le verbe à sa forme au passé.", "pairs": [{"left": "like", "right": "liked"}, {"left": "study", "right": "studied"}, {"left": "stop", "right": "stopped"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie la base au passé irrégulier.", "pairs": [{"left": "go", "right": "went"}, {"left": "have", "right": "had"}, {"left": "see", "right": "saw"}, {"left": "come", "right": "came"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Classe : dénombrable ou indénombrable ?", "pairs": [{"left": "book", "right": "dénombrable"}, {"left": "water", "right": "indénombrable"}, {"left": "furniture", "right": "indénombrable"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le contexte à la forme adaptée.", "pairs": [{"left": "Décision spontanée", "right": "will"}, {"left": "Projet déjà décidé", "right": "going to"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie l''adjectif à son comparatif.", "pairs": [{"left": "tall", "right": "taller"}, {"left": "big", "right": "bigger"}, {"left": "good", "right": "better"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le modal à son sens.", "pairs": [{"left": "must", "right": "obligation"}, {"left": "mustn''t", "right": "interdiction"}, {"left": "should", "right": "conseil"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie chaque phrase au bon connecteur.", "pairs": [{"left": "I''ve lived here ___ ten years", "right": "for"}, {"left": "He has worked here ___ 2018", "right": "since"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie l''expression de temps à la bonne préposition.", "pairs": [{"left": "Monday", "right": "on"}, {"left": "June", "right": "in"}, {"left": "7am", "right": "at"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{"instruction": "Remets les adverbes de fréquence dans l''ordre croissant.", "words": ["never", "rarely", "sometimes", "usually", "always"], "correct_sentence": "never rarely sometimes usually always", "feedback_correct": "Parfait, c''est bien l''ordre croissant !"}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Let''s", "go", "to", "the", "cinema."], "correct_sentence": "Let''s go to the cinema.", "feedback_correct": "Parfait !"}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le phrasal verb à son sens.", "pairs": [{"left": "get up", "right": "se lever"}, {"left": "look for", "right": "chercher"}, {"left": "turn off", "right": "éteindre"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Classe les verbes qui refusent le continuous.", "pairs": [{"left": "know", "right": "refuse le continuous"}, {"left": "run", "right": "accepte le continuous"}, {"left": "believe", "right": "refuse le continuous"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "was", "watching", "TV."], "correct_sentence": "I was watching TV.", "feedback_correct": "Parfait !"}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie la phrase au type de conditionnel.", "pairs": [{"left": "If it rains, I''ll stay home", "right": "first (probable)"}, {"left": "If I were rich, I would travel", "right": "second (hypothétique)"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le temps de la phrase active au passif correspondant.", "pairs": [{"left": "présent", "right": "is/are + participe"}, {"left": "passé", "right": "was/were + participe"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le temps direct à sa forme rapportée.", "pairs": [{"left": "present", "right": "past"}, {"left": "will", "right": "would"}, {"left": "present perfect", "right": "past perfect"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le pronom relatif à son usage.", "pairs": [{"left": "who", "right": "personne"}, {"left": "which", "right": "chose"}, {"left": "where", "right": "lieu"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Classe : gérondif ou infinitif obligatoire ?", "pairs": [{"left": "enjoy", "right": "gérondif"}, {"left": "want", "right": "infinitif"}, {"left": "avoid", "right": "gérondif"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le modal+have au degré de certitude.", "pairs": [{"left": "must have", "right": "quasi-certain"}, {"left": "might have", "right": "possible"}, {"left": "can''t have", "right": "impossible"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie la condition à la conséquence correcte.", "pairs": [{"left": "If I had studied", "right": "I would have passed"}, {"left": "If I study", "right": "I will pass"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "had", "already", "left."], "correct_sentence": "She had already left.", "feedback_correct": "Parfait !"}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie la structure formelle à son équivalent moins formel.", "pairs": [{"left": "It is said that he is rich", "right": "People say he is rich"}, {"left": "He is believed to be honest", "right": "People believe he is honest"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le connecteur à sa fonction.", "pairs": [{"left": "however", "right": "opposition"}, {"left": "therefore", "right": "conséquence"}, {"left": "despite", "right": "opposition"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le phrasal verb avancé à son sens.", "pairs": [{"left": "bring up", "right": "évoquer un sujet"}, {"left": "come across", "right": "tomber sur"}, {"left": "put off", "right": "reporter"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie la structure à sa nuance exacte.", "pairs": [{"left": "wish + past simple", "right": "souhait présent"}, {"left": "wish + past perfect", "right": "regret passé"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Never", "have", "I", "seen", "such", "a", "mess."], "correct_sentence": "Never have I seen such a mess.", "feedback_correct": "Parfait !"}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le verbe introducteur à sa construction.", "pairs": [{"left": "deny", "right": "+ gérondif"}, {"left": "promise", "right": "+ infinitif"}, {"left": "admit", "right": "+ gérondif"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'reorder', 5, '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "was", "Sarah", "who", "broke", "the", "vase."], "correct_sentence": "It was Sarah who broke the vase.", "feedback_correct": "Parfait !"}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie l''idiome à son sens figuré.", "pairs": [{"left": "piece of cake", "right": "un jeu d''enfant"}, {"left": "under the weather", "right": "patraque"}, {"left": "out of the blue", "right": "de manière inattendue"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le mot informel à son équivalent formel.", "pairs": [{"left": "get", "right": "receive"}, {"left": "kids", "right": "children"}, {"left": "a lot of", "right": "numerous"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;


with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, 'matching', 5, '{"instruction": "Relie le marqueur oral à sa fonction.", "pairs": [{"left": "well", "right": "temporiser"}, {"left": "actually", "right": "nuancer"}, {"left": "anyway", "right": "conclure"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'::jsonb, false from l;
