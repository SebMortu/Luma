-- ============================================
-- LUMA — Unité 28 (B2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She is rich; ___, she is unhappy.", "options": ["however", "because", "so", "and"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Opposition = \"however\"."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " it was raining, we went out. (bien que)", "correct_answers": ["Although"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Bien que\" = \"Although\"."}'),
  (7, 'true_false', '{"statement": "\"However\" is typically followed by a comma.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"however\" est bien suivi d''une virgule."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Although", "it", "rained,", "we", "had", "fun."], "correct_sentence": "Although it rained, we had fun.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ the rain, we went out.", "options": ["Despite", "Although", "Because", "So"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Despite\" est suivi d''un nom, pas d''une proposition."}'),
  (6, 'fill_blank', '{"sentence_before": "In spite ", "sentence_after": " the traffic, we arrived on time.", "correct_answers": ["of"], "feedback_correct": "Correct !", "feedback_incorrect": "\"In spite of\" + nom."}'),
  (7, 'true_false', '{"statement": "\"Despite\" is followed directly by a noun or -ing, not \"that\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"despite\" est bien suivi directement d''un nom/-ing."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Despite", "being", "tired,", "she", "kept", "working."], "correct_sentence": "Despite being tired, she kept working.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : It rained heavily; ___, the match was cancelled.", "options": ["as a result", "although", "despite", "however"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Conséquence = \"as a result\"."}'),
  (6, 'fill_blank', '{"sentence_before": "He was late; ", "sentence_after": ", he missed the meeting. (par conséquent)", "correct_answers": ["therefore"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Par conséquent\" = \"therefore\"."}'),
  (7, 'true_false', '{"statement": "\"Therefore\" expresses a consequence.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"therefore\" exprime bien une conséquence."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Therefore,", "we", "had", "to", "cancel", "the", "trip."], "correct_sentence": "Therefore, we had to cancel the trip.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Pour introduire un premier argument, on peut utiliser :", "options": ["Firstly", "However", "Therefore", "Despite"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Firstly\" introduit le premier argument."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": ", we must consider the cost. (de plus)", "correct_answers": ["Furthermore", "Moreover"], "feedback_correct": "Correct !", "feedback_incorrect": "\"De plus\" = \"Furthermore\" ou \"Moreover\"."}'),
  (7, 'true_false', '{"statement": "A good argument uses connectors to structure ideas clearly.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une bonne pratique."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["In", "conclusion,", "this", "solution", "is", "the", "best."], "correct_sentence": "In conclusion, this solution is the best.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Even though vs even if', '{"rule": "\"Even though\" (même si, fait avéré) introduit un fait réel malgré lequel quelque chose se produit. \"Even if\" (même si, hypothèse) introduit une condition hypothétique.", "table": [{"subject": "even though (fait)", "affirmative": "Even though it was raining, I went out. (il pleuvait vraiment)", "negative": "—"}, {"subject": "even if (hypothèse)", "affirmative": "I''ll go even if it rains. (peut-être qu''il pleuvra)", "negative": "—"}], "example": {"en": "Even though I was tired, I finished the race. I''ll finish even if it takes all night.", "fr": "Même si j''étais fatigué, j''ai fini la course. Je finirai même si ça prend toute la nuit."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Even though\" introduit :", "options": ["Un fait réel", "Une hypothèse", "Un ordre", "Une question"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Even though\" introduit un fait avéré."}'),
  (2, 'qcm', '{"question": "\"Even if\" introduit :", "options": ["Un fait certain", "Une hypothèse/possibilité", "Un regret", "Une obligation"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Even if\" introduit une hypothèse."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " I don''t have much money, I''ll help you. (même si, hypothèse)", "correct_answers": ["Even if"], "feedback_correct": "Correct !", "feedback_incorrect": "Hypothèse = \"Even if\"."}'),
  (4, 'true_false', '{"statement": "\"Even though\" is used for a fact that already happened or is true.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien pour un fait avéré."}'),
  (5, 'matching', '{"instruction": "Relie la phrase au bon connecteur.", "pairs": [{"left": "___ it was expensive, I bought it. (fait réel)", "right": "Even though"}, {"left": "I''ll go ___ it rains. (hypothèse)", "right": "even if"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Even", "though", "I", "was", "scared,", "I", "did", "it."], "correct_sentence": "Even though I was scared, I did it.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : ___ he apologizes, I won''t forgive him. (hypothèse)", "options": ["Even though", "Even if", "Despite", "However"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Hypothèse = \"Even if\"."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " she was sick, she came to work. (bien que, fait réel)", "correct_answers": ["Even though"], "feedback_correct": "Correct !", "feedback_incorrect": "Fait réel = \"Even though\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'On the other hand / whereas (contraster deux idées)', '{"rule": "\"On the other hand\" (d''un autre côté) et \"whereas\" (alors que/tandis que) permettent de contraster deux idées ou situations opposées.", "table": [{"subject": "on the other hand", "affirmative": "d''un autre côté", "negative": "—"}, {"subject": "whereas", "affirmative": "alors que/tandis que", "negative": "—"}], "example": {"en": "I love the city; on the other hand, my sister prefers the countryside. He is outgoing, whereas she is shy.", "fr": "J''adore la ville ; d''un autre côté, ma sœur préfère la campagne. Il est sociable, alors qu''elle est timide."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Whereas\" veut dire :", "options": ["Parce que", "Alors que/tandis que", "Donc", "Malgré"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Whereas\" = alors que."}'),
  (2, 'qcm', '{"question": "\"On the other hand\" introduit :", "options": ["Une cause", "Un contraste", "Une conséquence", "Un ordre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"On the other hand\" introduit un contraste."}'),
  (3, 'fill_blank', '{"sentence_before": "He likes tea, ", "sentence_after": " she prefers coffee. (alors que)", "correct_answers": ["whereas"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Alors que\" = \"whereas\"."}'),
  (4, 'true_false', '{"statement": "\"Whereas\" and \"while\" can both express contrast between two facts.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les deux peuvent bien exprimer un contraste."}'),
  (5, 'matching', '{"instruction": "Relie l''expression de contraste à sa traduction.", "pairs": [{"left": "whereas", "right": "alors que"}, {"left": "on the other hand", "right": "d''un autre côté"}, {"left": "by contrast", "right": "en revanche"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Some", "people", "love", "cities;", "on", "the", "other", "hand,", "others", "prefer", "nature."], "correct_sentence": "Some people love cities; on the other hand, others prefer nature.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : She is very organized, ___ her brother is quite messy.", "options": ["whereas", "because", "so", "if"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Contraste = \"whereas\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I prefer summer; ", "sentence_after": ", my husband loves winter. (d''un autre côté)", "correct_answers": ["on the other hand"], "feedback_correct": "Correct !", "feedback_incorrect": "\"D''un autre côté\" = \"on the other hand\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Consequently, thus, hence (conséquence formelle)', '{"rule": "Ces connecteurs de conséquence formels sont interchangeables avec \"therefore\" et \"as a result\", typiques de l''écrit académique et professionnel.", "table": [{"subject": "consequently", "affirmative": "par conséquent", "negative": "—"}, {"subject": "thus", "affirmative": "ainsi", "negative": "—"}, {"subject": "hence", "affirmative": "d''où/par conséquent", "negative": "—"}], "example": {"en": "The evidence was insufficient; consequently, the case was dismissed.", "fr": "Les preuves étaient insuffisantes ; par conséquent, l''affaire a été classée."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Thus\" veut dire :", "options": ["Malgré", "Ainsi/donc", "Bien que", "Mais"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Thus\" = ainsi/donc."}'),
  (2, 'qcm', '{"question": "\"Hence\" est plutôt utilisé dans un registre :", "options": ["Très familier", "Formel/académique", "Enfantin", "Argotique"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Hence\" est typique du registre formel."}'),
  (3, 'fill_blank', '{"sentence_before": "Sales dropped; ", "sentence_after": ", the company cut costs. (par conséquent)", "correct_answers": ["consequently"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Par conséquent\" = \"consequently\"."}'),
  (4, 'true_false', '{"statement": "\"Thus\", \"hence\", and \"consequently\" all express consequence formally.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les trois expriment bien une conséquence formelle."}'),
  (5, 'matching', '{"instruction": "Relie le connecteur formel à son équivalent courant.", "pairs": [{"left": "consequently", "right": "so"}, {"left": "hence", "right": "therefore"}, {"left": "thus", "right": "as a result"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "budget", "was", "cut;", "hence,", "the", "delay."], "correct_sentence": "The budget was cut; hence, the delay.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : The results were unclear; ___, further research is needed.", "options": ["thus", "despite", "although", "whereas"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Conséquence formelle = \"thus\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The system failed; ", "sentence_after": ", we lost the data. (par conséquent)", "correct_answers": ["consequently"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Par conséquent\" = \"consequently\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : construire une argumentation complète', '{"rule": "Cette leçon combine tous les connecteurs de l''unité (opposition, cause/conséquence, contraste) pour structurer une argumentation complète et nuancée.", "table": [{"subject": "Opposition", "affirmative": "however, although, despite, even though/if", "negative": "—"}, {"subject": "Conséquence", "affirmative": "therefore, thus, consequently, hence", "negative": "—"}, {"subject": "Contraste", "affirmative": "whereas, on the other hand", "negative": "—"}], "example": {"en": "Although the plan has risks, it also offers great benefits. On the other hand, doing nothing has its own consequences. Therefore, we should proceed carefully.", "fr": "Bien que le plan comporte des risques, il offre aussi de grands bénéfices. D''un autre côté, ne rien faire a aussi ses conséquences. Par conséquent, nous devrions avancer prudemment."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 28 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ the challenges, the project succeeded.", "options": ["Despite", "Because", "So", "Whereas"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Opposition + nom = \"Despite\"."}'),
  (2, 'qcm', '{"question": "Complète : Costs increased; ___, we raised our prices.", "options": ["therefore", "although", "whereas", "despite"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Conséquence = \"therefore\"."}'),
  (3, 'fill_blank', '{"sentence_before": "He works in finance, ", "sentence_after": " his wife works in art. (alors que)", "correct_answers": ["whereas"], "feedback_correct": "Correct !", "feedback_incorrect": "Contraste = \"whereas\"."}'),
  (4, 'true_false', '{"statement": "A strong argument uses a variety of connectors: opposition, consequence, and contrast.", "correct_answer": true, "feedback_correct": "Exact, bilan de l''argumentation réussi !", "feedback_incorrect": "Faux — c''est bien une bonne pratique argumentative."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque connecteur à sa catégorie.", "pairs": [{"left": "however", "right": "opposition"}, {"left": "thus", "right": "conséquence"}, {"left": "whereas", "right": "contraste"}], "feedback_correct": "Parfait, bilan de l''argumentation réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Even", "though", "it''s", "difficult,", "we", "must", "try."], "correct_sentence": "Even though it''s difficult, we must try.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : ___ of the delay, the team finished on time.", "options": ["In spite", "Because", "So", "Whereas"], "correct_index": 0, "feedback_correct": "Correct ! Bilan de l''argumentation réussi.", "feedback_incorrect": "\"In spite of\" = malgré."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": ", we recommend approving this plan. (en conclusion)", "correct_answers": ["In conclusion"], "feedback_correct": "Correct !", "feedback_incorrect": "\"En conclusion\" = \"In conclusion\"."}')
) as v(position, type, content);
