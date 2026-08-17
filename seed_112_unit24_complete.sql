-- ============================================
-- LUMA — Unité 24 (dernière de B1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She''s not answering, she ___ be asleep.", "options": ["must", "can", "should", "would"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Déduction forte = \"must\"."}'),
  (6, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " have forgotten, he''s usually on time.", "correct_answers": ["must"], "feedback_correct": "Correct !", "feedback_incorrect": "Déduction forte au passé : \"must have\"."}'),
  (7, 'true_false', '{"statement": "\"Must have\" expresses a strong deduction about the past.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "must", "have", "left", "already."], "correct_sentence": "He must have left already.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She ___ have missed the bus, I''m not sure.", "options": ["must", "might", "will", "should"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Possibilité incertaine = \"might have\"."}'),
  (6, 'fill_blank', '{"sentence_before": "They ", "sentence_after": " have taken a different route. (auraient pu)", "correct_answers": ["could"], "feedback_correct": "Correct !", "feedback_incorrect": "Possibilité passée = \"could have\"."}'),
  (7, 'true_false', '{"statement": "\"Might have\" is less certain than \"must have\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"might have\" est bien moins certain."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "might", "have", "forgotten", "her", "phone."], "correct_sentence": "She might have forgotten her phone.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : You ___ have told me earlier! (reproche)", "options": ["should", "must", "might", "will"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Reproche = \"should have\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " have studied more. (regret)", "correct_answers": ["should"], "feedback_correct": "Correct !", "feedback_incorrect": "Regret = \"should have\"."}'),
  (7, 'true_false', '{"statement": "\"Should have\" expresses regret about something that didn''t happen.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage principal."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "should", "have", "left", "earlier."], "correct_sentence": "We should have left earlier.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : He ___ have done it, he was with me all day.", "options": ["can''t", "must", "might", "should"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Déduction négative forte = \"can''t have\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " have known, nobody told her. (ne peut pas)", "correct_answers": ["can''t", "couldn''t"], "feedback_correct": "Correct !", "feedback_incorrect": "Déduction négative = \"can''t have\" ou \"couldn''t have\"."}'),
  (7, 'true_false', '{"statement": "\"Can''t have\" is the negative equivalent of \"must have\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien l''équivalent négatif."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["That", "can''t", "have", "been", "easy."], "correct_sentence": "That can''t have been easy.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Bilan des modaux du passé (déduction)', '{"rule": "Cette leçon combine must have (certitude), might/could have (possibilité), can''t have (impossibilité) pour déduire ce qui s''est probablement passé.", "table": [{"subject": "must have", "affirmative": "certitude forte", "negative": "—"}, {"subject": "might/could have", "affirmative": "possibilité", "negative": "—"}, {"subject": "can''t have", "affirmative": "impossibilité", "negative": "—"}], "example": {"en": "The light is on, so someone must have forgotten to turn it off. It might have been Tom, but it can''t have been Sarah, she''s on holiday.", "fr": "La lumière est allumée, donc quelqu''un a dû oublier de l''éteindre. Ça pourrait être Tom, mais ça ne peut pas être Sarah, elle est en vacances."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel modal exprime la plus grande certitude ?", "options": ["might have", "must have", "could have", "may have"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Must have\" exprime la plus grande certitude."}'),
  (2, 'qcm', '{"question": "Complète : The ground is wet, it ___ have rained.", "options": ["must", "can''t", "shouldn''t", "won''t"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Déduction logique forte = \"must have\"."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " have seen us, we were right there. (a dû)", "correct_answers": ["must"], "feedback_correct": "Correct !", "feedback_incorrect": "\"A dû\" (déduction) = \"must have\"."}'),
  (4, 'true_false', '{"statement": "\"Can''t have\" expresses that something is logically impossible.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (5, 'matching', '{"instruction": "Relie le modal à son degré de certitude.", "pairs": [{"left": "must have", "right": "certain"}, {"left": "might have", "right": "possible"}, {"left": "can''t have", "right": "impossible"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "can''t", "have", "finished", "already."], "correct_sentence": "She can''t have finished already.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I''m not sure, but she ___ have called while I was out.", "options": ["must", "might", "can''t", "shouldn''t"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Incertitude = \"might have\"."}'),
  (8, 'fill_blank', '{"sentence_before": "That ", "sentence_after": " have been difficult for you. (a dû)", "correct_answers": ["must"], "feedback_correct": "Correct !", "feedback_incorrect": "Déduction empathique = \"must have\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Regrets et reproches nuancés', '{"rule": "\"Should have\" (regret/reproche), \"shouldn''t have\" (regret d''avoir fait quelque chose), \"could have\" (possibilité manquée) nuancent les regrets.", "table": [{"subject": "should have", "affirmative": "aurait dû (mais n''a pas fait)", "negative": "—"}, {"subject": "shouldn''t have", "affirmative": "n''aurait pas dû (mais a fait)", "negative": "—"}, {"subject": "could have", "affirmative": "aurait pu (occasion manquée)", "negative": "—"}], "example": {"en": "I shouldn''t have eaten so much. I could have said no.", "fr": "Je n''aurais pas dû manger autant. J''aurais pu dire non."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I shouldn''t have said that\" exprime :", "options": ["Un conseil futur", "Un regret d''avoir fait quelque chose", "Une certitude", "Une possibilité"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Regret d''une action commise = \"shouldn''t have\"."}'),
  (2, 'qcm', '{"question": "\"I could have helped you\" exprime :", "options": ["Une obligation", "Une occasion manquée", "Une certitude", "Un ordre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Could have\" exprime une possibilité/occasion manquée."}'),
  (3, 'fill_blank', '{"sentence_before": "You ", "sentence_after": " have listened to me! (n''aurais pas dû)", "correct_answers": ["shouldn''t"], "feedback_correct": "Correct !", "feedback_incorrect": "\"N''aurais pas dû\" = \"shouldn''t have\"."}'),
  (4, 'true_false', '{"statement": "\"Could have\" often expresses a missed opportunity.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien souvent son usage."}'),
  (5, 'matching', '{"instruction": "Relie la phrase à son sens.", "pairs": [{"left": "I should have called.", "right": "regret de ne pas avoir fait"}, {"left": "I shouldn''t have called.", "right": "regret d''avoir fait"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "could", "have", "won,", "but", "I", "gave", "up."], "correct_sentence": "I could have won, but I gave up.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : We ___ have taken the highway, it was faster.", "options": ["should", "shouldn''t", "can''t", "mustn''t"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Regret = \"should have\"."}'),
  (8, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " have trusted him. (n''aurait pas dû)", "correct_answers": ["shouldn''t"], "feedback_correct": "Correct !", "feedback_incorrect": "\"N''aurait pas dû\" = \"shouldn''t have\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Exprimer la surprise et le doute au passé', '{"rule": "Ces modaux passés permettent aussi d''exprimer la surprise (\"How could she have done that?\") ou le doute persistant sur un événement passé.", "table": [{"subject": "Surprise", "affirmative": "How could he have forgotten?", "negative": "—"}, {"subject": "Doute", "affirmative": "She might not have understood.", "negative": "—"}], "example": {"en": "I can''t believe he could have said that! She might not have received the message.", "fr": "Je n''arrive pas à croire qu''il ait pu dire ça ! Elle n''a peut-être pas reçu le message."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"How could she have known?\" exprime :", "options": ["Une certitude", "De la surprise/de l''incrédulité", "Un ordre", "Une obligation"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Cette structure exprime la surprise."}'),
  (2, 'qcm', '{"question": "Complète : I can''t believe he ___ have lied to us.", "options": ["could", "must", "should", "will"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Surprise/incrédulité = \"could have\"."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " not have seen the email yet. (pourrait ne pas)", "correct_answers": ["might"], "feedback_correct": "Correct !", "feedback_incorrect": "Doute = \"might not have\"."}'),
  (4, 'true_false', '{"statement": "\"How could he have done that?\" is a rhetorical expression of surprise.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une expression de surprise."}'),
  (5, 'matching', '{"instruction": "Relie la phrase à son émotion.", "pairs": [{"left": "How could you have forgotten?!", "right": "surprise/colère"}, {"left": "She might not have known.", "right": "doute"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["How", "could", "he", "have", "said", "that?"], "correct_sentence": "How could he have said that?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : They might not ___ received our message.", "options": ["have", "has", "had", "having"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Might not have\" + participe passé."}'),
  (8, 'fill_blank', '{"sentence_before": "I can''t believe she ", "sentence_after": " have done that! (aurait pu)", "correct_answers": ["could"], "feedback_correct": "Correct !", "feedback_incorrect": "Incrédulité = \"could have\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan final B1 : tous les modaux passés et grammaire du niveau', '{"rule": "Cette dernière leçon du niveau B1 combine tous les modaux passés (must/might/should/can''t have) avec le present perfect continuous, le passif, le discours rapporté et les relatives — un vrai bilan complet avant B2.", "table": [{"subject": "Déduction", "affirmative": "must have / can''t have / might have", "negative": "—"}, {"subject": "Regret", "affirmative": "should have / shouldn''t have", "negative": "—"}, {"subject": "Grammaire B1", "affirmative": "passif, discours rapporté, relatives", "negative": "—"}], "example": {"en": "I should have called earlier, but I was told the office was closed. It might have reopened by now, though I can''t have missed the announcement.", "fr": "J''aurais dû appeler plus tôt, mais on m''a dit que le bureau était fermé. Il a peut-être rouvert maintenant, même si je n''ai probablement pas manqué l''annonce."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 24 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ have left, her coat is still here.", "options": ["can''t", "must", "should", "will"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Déduction négative logique = \"can''t have\"."}'),
  (2, 'qcm', '{"question": "Complète : I ___ have told you sooner, I''m sorry.", "options": ["should", "must", "can''t", "might"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Regret/excuse = \"should have\"."}'),
  (3, 'fill_blank', '{"sentence_before": "The email ", "sentence_after": " (send) by the office already. (passif, present perfect)", "correct_answers": ["has been sent"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif present perfect : \"has been sent\"."}'),
  (4, 'true_false', '{"statement": "This unit combined deduction, regret, and general B1 grammar review.", "correct_answer": true, "feedback_correct": "Exact, bravo, tu as terminé le niveau B1 !", "feedback_incorrect": "Faux — c''est bien ce que cette unité a couvert."}'),
  (5, 'matching', '{"instruction": "Bilan B1 : relie chaque modal passé à son usage.", "pairs": [{"left": "must have", "right": "certitude"}, {"left": "should have", "right": "regret"}, {"left": "can''t have", "right": "impossibilité"}], "feedback_correct": "Parfait, félicitations pour avoir terminé B1 !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "must", "have", "left", "my", "keys", "at", "home."], "correct_sentence": "I must have left my keys at home.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : You ___ have warned me about the traffic!", "options": ["should", "can''t", "must", "won''t"], "correct_index": 0, "feedback_correct": "Correct ! Bravo, tu as terminé le niveau B1 !", "feedback_incorrect": "Reproche = \"should have\"."}'),
  (8, 'fill_blank', '{"sentence_before": "That ", "sentence_after": " have been a difficult decision for you. (a dû)", "correct_answers": ["must"], "feedback_correct": "Correct ! Félicitations pour avoir terminé le niveau B1 !", "feedback_incorrect": "Déduction empathique = \"must have\"."}')
) as v(position, type, content);
