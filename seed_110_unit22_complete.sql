-- ============================================
-- LUMA — Unité 22 (B1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : The man ___ called you is my brother.", "options": ["who", "which", "where", "when"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Pour une personne : \"who\"."}'),
  (6, 'fill_blank', '{"sentence_before": "The book ", "sentence_after": " I read was great. (que)", "correct_answers": ["that", "which"], "feedback_correct": "Correct !", "feedback_incorrect": "Pour une chose : \"that\" ou \"which\"."}'),
  (7, 'true_false', '{"statement": "\"Which\" is used for things, not people.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"which\" s''utilise bien pour les choses."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "woman", "who", "spoke", "was", "kind."], "correct_sentence": "The woman who spoke was kind.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : This is the house ___ I grew up.", "options": ["where", "whose", "who", "which"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Pour un lieu : \"where\"."}'),
  (6, 'fill_blank', '{"sentence_before": "That''s the man ", "sentence_after": " car was stolen. (dont)", "correct_answers": ["whose"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Whose\" marque la possession."}'),
  (7, 'true_false', '{"statement": "\"Whose\" is used to show possession.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"whose\" indique bien la possession."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "is", "the", "town", "where", "I", "was", "born."], "correct_sentence": "This is the town where I was born.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Une relative non déterminative est encadrée par :", "options": ["Des points", "Des virgules", "Rien", "Des tirets seulement"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Elle est encadrée par des virgules."}'),
  (6, 'fill_blank', '{"sentence_before": "My brother, ", "sentence_after": " lives in Paris, is a doctor. (non déterminative)", "correct_answers": ["who"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Who\" introduit l''information supplémentaire."}'),
  (7, 'true_false', '{"statement": "A non-defining relative clause gives essential information.", "correct_answer": false, "feedback_correct": "Exact — elle donne une info supplémentaire, pas essentielle.", "feedback_incorrect": "Faux — c''est l''inverse, l''info n''est pas essentielle."}'),
  (8, 'matching', '{"instruction": "Classe : déterminative ou non déterminative ?", "pairs": [{"left": "The book that I read...", "right": "déterminative"}, {"left": "My car, which is red,...", "right": "non déterminative"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Dans \"The book (that) I read\", on peut omettre \"that\" car il est :", "options": ["Sujet", "Complément d''objet", "Toujours obligatoire", "Impossible à omettre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "On peut omettre le relatif complément d''objet."}'),
  (6, 'fill_blank', '{"sentence_before": "The man ", "sentence_after": " called was rude. (sujet, ne peut PAS être omis)", "correct_answers": ["who", "that"], "feedback_correct": "Correct !", "feedback_incorrect": "En tant que sujet, le relatif reste obligatoire."}'),
  (7, 'true_false', '{"statement": "A relative pronoun as subject can never be omitted.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — le pronom sujet est bien obligatoire."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "movie", "I", "watched", "was", "great."], "correct_sentence": "The movie I watched was great.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Which pour commenter toute une phrase', '{"rule": "\"Which\" peut se référer non pas à un nom précis, mais à toute une proposition précédente, pour ajouter un commentaire.", "table": [{"subject": "which (commentaire)", "affirmative": "He was late, which annoyed everyone.", "negative": "—"}], "example": {"en": "She passed the exam, which made her parents proud.", "fr": "Elle a réussi l''examen, ce qui a rendu ses parents fiers."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Dans \"He apologized, which was nice\", \"which\" se réfère à :", "options": ["\"He\"", "Toute l''action de s''excuser", "\"nice\"", "Rien"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Which\" commente ici toute la proposition."}'),
  (2, 'qcm', '{"question": "Complète : She won the prize, ___ surprised everyone.", "options": ["which", "who", "whose", "where"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Which\" commente toute la phrase précédente."}'),
  (3, 'fill_blank', '{"sentence_before": "He lost his keys, ", "sentence_after": " was frustrating. (ce qui)", "correct_answers": ["which"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Ce qui\" (commentaire) = \"which\"."}'),
  (4, 'true_false', '{"statement": "This use of \"which\" is always preceded by a comma.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien toujours précédé d''une virgule."}'),
  (5, 'matching', '{"instruction": "Relie la phrase à son commentaire logique.", "pairs": [{"left": "He arrived late,", "right": "which annoyed the teacher."}, {"left": "She got the job,", "right": "which made her very happy."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "forgot", "her", "birthday,", "which", "upset", "her."], "correct_sentence": "He forgot her birthday, which upset her.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : It rained all day, ___ ruined our picnic.", "options": ["which", "who", "whose", "that"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Commentaire sur toute la phrase = \"which\"."}'),
  (8, 'fill_blank', '{"sentence_before": "She finished early, ", "sentence_after": " gave her time to relax. (ce qui)", "correct_answers": ["which"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Ce qui\" = \"which\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Les pronoms relatifs avec préposition', '{"rule": "Quand le relatif dépend d''une préposition, on peut la placer avant le relatif (formel : \"to whom\") ou à la fin de la phrase (informel : \"who...to\").", "table": [{"subject": "Formel", "affirmative": "the person to whom I spoke", "negative": "—"}, {"subject": "Informel", "affirmative": "the person (who) I spoke to", "negative": "—"}], "example": {"en": "This is the colleague I work with. / This is the colleague with whom I work.", "fr": "C''est le collègue avec qui je travaille."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle forme est la plus formelle ?", "options": ["the person I spoke to", "the person to whom I spoke", "les deux sont identiques", "aucune n''est correcte"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"To whom\" est plus formel."}'),
  (2, 'qcm', '{"question": "À l''oral informel, la préposition se place généralement :", "options": ["Avant le relatif", "En fin de phrase", "Jamais utilisée", "Au début de phrase"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "À l''oral, la préposition va en fin de phrase."}'),
  (3, 'fill_blank', '{"sentence_before": "This is the friend I told you ", "sentence_after": ". (à propos de)", "correct_answers": ["about"], "feedback_correct": "Correct !", "feedback_incorrect": "\"About\" se place en fin de phrase (informel)."}'),
  (4, 'true_false', '{"statement": "\"To whom\" is used in formal written English.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"to whom\" est bien utilisé dans l''anglais formel."}'),
  (5, 'matching', '{"instruction": "Relie la version formelle à l''informelle.", "pairs": [{"left": "the person to whom I wrote", "right": "the person I wrote to"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "is", "the", "book", "I", "was", "looking", "for."], "correct_sentence": "This is the book I was looking for.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"The topic about which we spoke\" est :", "options": ["Informel", "Formel", "Incorrect", "Familier"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Cette structure est formelle."}'),
  (8, 'fill_blank', '{"sentence_before": "That''s the company I work ", "sentence_after": ". (pour)", "correct_answers": ["for"], "feedback_correct": "Correct !", "feedback_incorrect": "\"For\" se place en fin de phrase (informel)."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Décrire des personnes et objets avec précision', '{"rule": "Cette leçon applique les relatives à des descriptions riches et précises, combinant who/which/whose/where pour caractériser précisément.", "table": [{"subject": "Combiné", "affirmative": "The woman whose car I borrowed, who lives nearby, works where I do.", "negative": "—"}], "example": {"en": "My neighbor, whose dog barks all night, is actually very nice.", "fr": "Mon voisin, dont le chien aboie toute la nuit, est en fait très gentil."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The restaurant ___ we ate was excellent.", "options": ["where", "who", "whose", "which"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Lieu = \"where\"."}'),
  (2, 'qcm', '{"question": "Complète : The author ___ books I love just released a new one.", "options": ["who", "whose", "which", "where"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Possession = \"whose\"."}'),
  (3, 'fill_blank', '{"sentence_before": "The city ", "sentence_after": " I was born has changed a lot.", "correct_answers": ["where"], "feedback_correct": "Correct !", "feedback_incorrect": "Lieu = \"where\"."}'),
  (4, 'true_false', '{"statement": "You can combine multiple relative clauses to add rich detail.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien possible de combiner plusieurs relatives."}'),
  (5, 'matching', '{"instruction": "Relie le pronom relatif à son usage.", "pairs": [{"left": "who", "right": "personne, sujet"}, {"left": "whose", "right": "possession"}, {"left": "where", "right": "lieu"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "teacher", "whose", "class", "I", "loved", "retired."], "correct_sentence": "The teacher whose class I loved retired.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : This is the café ___ we first met.", "options": ["where", "who", "whose", "which"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Lieu = \"where\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The student ", "sentence_after": " essay won the prize was thrilled. (dont)", "correct_answers": ["whose"], "feedback_correct": "Correct !", "feedback_incorrect": "Possession = \"whose\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : les relatives complètes', '{"rule": "Cette leçon consolide tous les pronoms relatifs vus dans l''unité : who, which, whose, where, l''omission possible, et les relatives déterminatives/non déterminatives.", "table": [{"subject": "Personnes", "affirmative": "who / whose", "negative": "—"}, {"subject": "Choses", "affirmative": "which / that", "negative": "—"}, {"subject": "Lieu", "affirmative": "where", "negative": "—"}], "example": {"en": "The woman who called, whose number I didn''t recognize, wanted to know where I lived.", "fr": "La femme qui a appelé, dont je ne reconnaissais pas le numéro, voulait savoir où j''habitais."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 22 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The house ___ we visited was beautiful.", "options": ["which", "who", "whose", "where"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Chose = \"which\" (ou \"that\")."}'),
  (2, 'qcm', '{"question": "Complète : The girl ___ dog got lost was crying.", "options": ["who", "whose", "which", "where"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Possession = \"whose\"."}'),
  (3, 'fill_blank', '{"sentence_before": "This is the park ", "sentence_after": " we used to play.", "correct_answers": ["where"], "feedback_correct": "Correct !", "feedback_incorrect": "Lieu = \"where\"."}'),
  (4, 'true_false', '{"statement": "\"That\" can replace \"who\" or \"which\" in defining relative clauses.", "correct_answer": true, "feedback_correct": "Exact, bilan des relatives réussi !", "feedback_incorrect": "Faux — \"that\" peut bien remplacer les deux dans ce cas."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque pronom relatif à son usage.", "pairs": [{"left": "who", "right": "personne"}, {"left": "which", "right": "chose"}, {"left": "whose", "right": "possession"}, {"left": "where", "right": "lieu"}], "feedback_correct": "Parfait, bilan des relatives complet !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "man", "whose", "car", "broke", "down", "called", "help."], "correct_sentence": "The man whose car broke down called help.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Dans quel cas peut-on omettre le pronom relatif ?", "options": ["Toujours", "Jamais", "Quand il est complément d''objet", "Quand il est sujet"], "correct_index": 2, "feedback_correct": "Correct ! Bilan des relatives réussi.", "feedback_incorrect": "On peut omettre le relatif complément d''objet."}'),
  (8, 'fill_blank', '{"sentence_before": "The book ", "sentence_after": " you gave me was amazing. (peut être omis)", "correct_answers": ["that", "which"], "feedback_correct": "Correct ! (ou peut être omis)", "feedback_incorrect": "\"That\"/\"which\" ici, ou peut être omis."}')
) as v(position, type, content);
