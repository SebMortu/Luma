-- ============================================
-- LUMA — Unité 11 (A2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ I open the window?", "options": ["Can", "Must", "Should", "Would"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Can\" demande une permission."}'),
  (6, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " speak three languages.", "correct_answers": ["can"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Can\" exprime une capacité."}'),
  (7, 'true_false', '{"statement": "\"Can\" changes form with \"he\" (he cans).", "correct_answer": false, "feedback_correct": "Exact — les modaux ne changent jamais.", "feedback_incorrect": "Faux — \"can\" reste identique pour tous les sujets."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "can", "swim", "very", "well."], "correct_sentence": "I can swim very well.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : You ___ wear a seatbelt. (obligation)", "options": ["can", "must", "could", "should"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Obligation forte = \"must\"."}'),
  (6, 'fill_blank', '{"sentence_before": "You ", "sentence_after": " smoke here. (interdiction)", "correct_answers": ["mustn''t"], "feedback_correct": "Correct !", "feedback_incorrect": "Interdiction = \"mustn''t\"."}'),
  (7, 'true_false', '{"statement": "\"Mustn''t\" means it''s forbidden.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"mustn''t\" veut bien dire interdit."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["You", "must", "finish", "your", "homework."], "correct_sentence": "You must finish your homework.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She ___ to work on Saturdays.", "options": ["has", "have", "must", "can"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec \"she\", on utilise \"has to\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I don''t ", "sentence_after": " to go if I don''t want to. (absence d''obligation)", "correct_answers": ["have"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Don''t have to\" = pas d''obligation."}'),
  (7, 'true_false', '{"statement": "\"Have to\" expresses an external obligation (rules, laws).", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"have to\" exprime bien une obligation externe."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "have", "to", "leave", "now."], "correct_sentence": "We have to leave now.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : You ___ see a doctor. (conseil)", "options": ["must", "should", "can", "will"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Conseil = \"should\"."}'),
  (6, 'fill_blank', '{"sentence_before": "You ", "sentence_after": " not eat so fast. (tu ne devrais pas)", "correct_answers": ["should"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Should not\" (shouldn''t) = conseil négatif."}'),
  (7, 'true_false', '{"statement": "\"Should\" is stronger than \"must\".", "correct_answer": false, "feedback_correct": "Exact — \"must\" est plus fort qu''un simple conseil.", "feedback_incorrect": "Faux — \"must\" est plus contraignant que \"should\"."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["You", "should", "drink", "more", "water."], "correct_sentence": "You should drink more water.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'May et might (possibilité)', '{"rule": "\"May\" et \"might\" expriment une possibilité, une chance que quelque chose se produise. \"Might\" suggère une possibilité un peu plus faible que \"may\".", "table": [{"subject": "may", "affirmative": "il se peut que", "negative": "may not"}, {"subject": "might", "affirmative": "il se pourrait que", "negative": "might not"}], "example": {"en": "It may rain later. She might come to the party.", "fr": "Il se peut qu''il pleuve plus tard. Elle pourrait venir à la fête."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Might\" exprime :", "options": ["Une certitude", "Une possibilité", "Une obligation", "Une interdiction"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Might\" exprime une possibilité."}'),
  (2, 'qcm', '{"question": "Complète : She ___ be at home right now.", "options": ["must", "may", "should", "have to"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Possibilité = \"may\"."}'),
  (3, 'fill_blank', '{"sentence_before": "It ", "sentence_after": " snow tomorrow. (il se pourrait)", "correct_answers": ["might"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Il se pourrait\" = \"might\"."}'),
  (4, 'true_false', '{"statement": "\"May\" and \"might\" change form with \"he/she\".", "correct_answer": false, "feedback_correct": "Exact — les modaux ne changent jamais.", "feedback_incorrect": "Faux — ils restent identiques pour tous les sujets."}'),
  (5, 'matching', '{"instruction": "Relie le modal à son degré de certitude.", "pairs": [{"left": "will", "right": "certain"}, {"left": "may", "right": "possible"}, {"left": "might", "right": "peu probable"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "may", "be", "late", "today."], "correct_sentence": "He may be late today.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : They ___ not come, I''m not sure.", "options": ["might", "must", "should", "have to"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Incertitude = \"might not\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " go to the party, I haven''t decided. (il se peut que j''aille)", "correct_answers": ["may"], "feedback_correct": "Correct !", "feedback_incorrect": "\"May\" exprime la possibilité."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Demander la permission poliment', '{"rule": "Pour demander poliment une permission, on utilise \"Could I...?\" ou \"May I...?\", plus formels que \"Can I...?\".", "table": [{"subject": "Can I...?", "affirmative": "informel", "negative": "—"}, {"subject": "Could I...?", "affirmative": "poli", "negative": "—"}, {"subject": "May I...?", "affirmative": "très poli/formel", "negative": "—"}], "example": {"en": "May I ask you a question? Could I borrow your pen?", "fr": "Puis-je vous poser une question ? Pourrais-je emprunter votre stylo ?"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle est la formule la plus formelle ?", "options": ["Can I...?", "Could I...?", "May I...?", "Do I...?"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"May I...?\" est la plus formelle."}'),
  (2, 'qcm', '{"question": "Complète poliment : ___ I borrow your book?", "options": ["Can", "Could", "Must", "Will"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Could\" est une formule polie."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " I use your phone, please?", "correct_answers": ["May", "Could", "Can"], "feedback_correct": "Correct !", "feedback_incorrect": "Plusieurs formules sont possibles pour demander poliment."}'),
  (4, 'true_false', '{"statement": "\"Could I\" is more polite than \"Can I\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"Could I\" est bien plus poli."}'),
  (5, 'matching', '{"instruction": "Relie la formule à son niveau de politesse.", "pairs": [{"left": "Can I?", "right": "informel"}, {"left": "Could I?", "right": "poli"}, {"left": "May I?", "right": "très formel"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Could", "I", "have", "some", "water,", "please?"], "correct_sentence": "Could I have some water, please?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Dans un contexte professionnel formel, on préfère :", "options": ["Can I?", "May I?", "Gimme", "Hey, can you..."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"May I?\" convient au contexte formel."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " I sit here? (poliment)", "correct_answers": ["May", "Could"], "feedback_correct": "Correct !", "feedback_incorrect": "\"May I\" ou \"Could I\" sont polis."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Les règles et le règlement (au travail, à l''école)', '{"rule": "Cette leçon applique must/mustn''t/have to/should à des contextes de règles concrètes, au travail ou à l''école.", "table": [{"subject": "must", "affirmative": "obligation stricte", "negative": "—"}, {"subject": "mustn''t", "affirmative": "interdiction", "negative": "—"}, {"subject": "should", "affirmative": "recommandation", "negative": "—"}], "example": {"en": "Students must arrive on time and mustn''t use phones in class.", "fr": "Les élèves doivent arriver à l''heure et ne doivent pas utiliser leur téléphone en classe."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète le règlement : Employees ___ wear a badge.", "options": ["must", "mustn''t", "should", "may"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Règle obligatoire = \"must\"."}'),
  (2, 'qcm', '{"question": "Complète : Students ___ run in the hallway. (interdit)", "options": ["must", "mustn''t", "should", "can"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Interdiction = \"mustn''t\"."}'),
  (3, 'fill_blank', '{"sentence_before": "You ", "sentence_after": " arrive before 9am. (obligation)", "correct_answers": ["must"], "feedback_correct": "Correct !", "feedback_incorrect": "Obligation stricte = \"must\"."}'),
  (4, 'true_false', '{"statement": "School rules are usually expressed with \"must\" or \"mustn''t\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les règlements utilisent bien ces modaux."}'),
  (5, 'matching', '{"instruction": "Relie la règle à son sens.", "pairs": [{"left": "You must wear a uniform.", "right": "obligation"}, {"left": "You mustn''t be late.", "right": "interdiction"}, {"left": "You should study more.", "right": "conseil"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Employees", "mustn''t", "be", "late", "for", "meetings."], "correct_sentence": "Employees mustn''t be late for meetings.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : You ___ ask before leaving early. (recommandation)", "options": ["should", "mustn''t", "can''t", "won''t"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Recommandation = \"should\"."}'),
  (8, 'fill_blank', '{"sentence_before": "Visitors ", "sentence_after": " sign in at reception. (doivent)", "correct_answers": ["must"], "feedback_correct": "Correct !", "feedback_incorrect": "Obligation = \"must\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan des modaux (can, must, should, may)', '{"rule": "Cette leçon de révision combine tous les modaux de l''unité pour distinguer capacité, obligation, conseil et possibilité.", "table": [{"subject": "can", "affirmative": "capacité/permission", "negative": "—"}, {"subject": "must/have to", "affirmative": "obligation", "negative": "—"}, {"subject": "should", "affirmative": "conseil", "negative": "—"}, {"subject": "may/might", "affirmative": "possibilité", "negative": "—"}], "example": {"en": "You must wear a helmet, you should be careful, and you might fall if you''re not.", "fr": "Tu dois porter un casque, tu devrais être prudent, et tu pourrais tomber si tu ne l''es pas."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 11 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel modal exprime une capacité ?", "options": ["must", "can", "should", "might"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Capacité = \"can\"."}'),
  (2, 'qcm', '{"question": "Quel modal exprime un conseil ?", "options": ["must", "can", "should", "will"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Conseil = \"should\"."}'),
  (3, 'fill_blank', '{"sentence_before": "You ", "sentence_after": " see a dentist regularly. (devrais)", "correct_answers": ["should"], "feedback_correct": "Correct !", "feedback_incorrect": "Conseil = \"should\"."}'),
  (4, 'true_false', '{"statement": "\"Must\" and \"should\" express exactly the same strength.", "correct_answer": false, "feedback_correct": "Exact — \"must\" est plus fort qu''un conseil.", "feedback_incorrect": "Faux — \"must\" est une obligation, \"should\" un conseil."}'),
  (5, 'matching', '{"instruction": "Relie chaque modal à sa fonction.", "pairs": [{"left": "can", "right": "capacité"}, {"left": "must", "right": "obligation"}, {"left": "might", "right": "possibilité"}], "feedback_correct": "Parfait, bilan des modaux réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["You", "should", "always", "wear", "a", "seatbelt."], "correct_sentence": "You should always wear a seatbelt.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : It ___ be true, I''m not sure. (possibilité)", "options": ["must", "might", "should", "can"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Incertitude = \"might\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " speak Spanish fluently. (capacité)", "correct_answers": ["can"], "feedback_correct": "Correct !", "feedback_incorrect": "Capacité = \"can\"."}')
) as v(position, type, content);
