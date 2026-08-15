-- ===== Unité 23 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Verbes suivis du gérondif', jsonb_build_object(
  'rule', 'enjoy, like, love, hate, finish, avoid, suggest + verbe en -ing.',
  'example', jsonb_build_object('en', 'I enjoy reading.', 'fr', 'J''aime lire.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I enjoy ___ tennis.", "options": ["play", "playing", "to play", "plays"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "enjoy + gérondif : playing."}'),
  (2, 'qcm', '{"question": "Complète : She finished ___ dinner.", "options": ["cook", "cooking", "to cook", "cooks"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "finish + gérondif : cooking."}'),
  (3, 'fill_blank', '{"sentence_before": "He avoids ", "sentence_after": " sugar. (manger)", "correct_answers": ["eating"], "feedback_correct": "Correct !", "feedback_incorrect": "avoid + gérondif : eating."}'),
  (4, 'true_false', '{"statement": "\"Enjoy\" est toujours suivi de l''infinitif (to + verbe).", "correct_answer": false, "feedback_correct": "Exact, enjoy est suivi du gérondif.", "feedback_incorrect": "En fait c''est faux : enjoy + gérondif."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Verbes suivis de l''infinitif', jsonb_build_object(
  'rule', 'want, need, decide, plan, hope, promise + to + base verbale.',
  'example', jsonb_build_object('en', 'I want to leave.', 'fr', 'Je veux partir.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I want ___ leave.", "options": ["leave", "leaving", "to leave", "leaves"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "want + infinitif : to leave."}'),
  (2, 'qcm', '{"question": "Complète : She decided ___ study medicine.", "options": ["study", "studying", "to study", "studies"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "decide + infinitif : to study."}'),
  (3, 'fill_blank', '{"sentence_before": "They agreed ", "sentence_after": ". (aider)", "correct_answers": ["to help"], "feedback_correct": "Correct !", "feedback_incorrect": "agree + infinitif : to help."}'),
  (4, 'true_false', '{"statement": "\"Want\" est suivi du gérondif comme \"enjoy\".", "correct_answer": false, "feedback_correct": "Exact, want est suivi de l''infinitif.", "feedback_incorrect": "En fait c''est faux : want + infinitif."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Verbes à sens variable (stop, remember, try)', jsonb_build_object(
  'rule', 'stop + -ing (arrêter une habitude) vs stop + to (s''arrêter pour faire) ; sens différents.',
  'example', jsonb_build_object('en', 'I stopped smoking. I stopped to smoke.', 'fr', 'J''ai arrêté de fumer. Je me suis arrêté pour fumer.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I stopped smoking\" signifie...", "options": ["je me suis arrêté pour fumer", "j''ai arrêté de fumer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "j''ai arrêté de fumer."}'),
  (2, 'qcm', '{"question": "\"I stopped to smoke\" signifie...", "options": ["je me suis arrêté pour fumer", "j''ai arrêté de fumer"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "je me suis arrêté pour fumer."}'),
  (3, 'fill_blank', '{"sentence_before": "I remember ", "sentence_after": " the door. (avoir verrouillé)", "correct_answers": ["locking"], "feedback_correct": "Correct !", "feedback_incorrect": "remember + gérondif : locking."}'),
  (4, 'true_false', '{"statement": "\"Stop + -ing\" et \"stop + to\" ont exactement le même sens.", "correct_answer": false, "feedback_correct": "Exact, le sens change complètement.", "feedback_incorrect": "En fait c''est faux : les sens sont différents."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Pratiquer les deux constructions', jsonb_build_object(
  'rule', 'Combiner gérondif et infinitif dans un même contexte.',
  'example', jsonb_build_object('en', 'I want to learn French, and I enjoy practicing every day.', 'fr', 'Je veux apprendre le français, et j''aime pratiquer tous les jours.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I want ___ learn French and I enjoy ___ every day.", "options": ["to learn / practicing", "learning / to practice"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "want+infinitif, enjoy+gérondif."}'),
  (2, 'qcm', '{"question": "Complète : She suggested ___ for a walk.", "options": ["go", "going", "to go", "goes"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "suggest + gérondif : going."}'),
  (3, 'fill_blank', '{"sentence_before": "We hope ", "sentence_after": " Japan next year. (visiter)", "correct_answers": ["to visit"], "feedback_correct": "Correct !", "feedback_incorrect": "hope + infinitif : to visit."}'),
  (4, 'true_false', '{"statement": "Chaque verbe a une construction fixe à mémoriser au cas par cas.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

-- ===== Unité 24 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Must have (déduction forte)', jsonb_build_object(
  'rule', 'must have + participe passé pour une déduction quasi-certaine sur le passé.',
  'example', jsonb_build_object('en', 'She must have left already.', 'fr', 'Elle a dû déjà partir.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ have forgotten our meeting.", "options": ["must", "must to", "musts", "musted"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "must have."}'),
  (2, 'qcm', '{"question": "\"Must have\" exprime...", "options": ["une obligation passée", "une déduction forte"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Déduction forte."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " the exit. (avons dû rater)", "correct_answers": ["must have missed"], "feedback_correct": "Correct !", "feedback_incorrect": "must have missed."}'),
  (4, 'true_false', '{"statement": "\"Must have leave\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, il faut le participe passé.", "feedback_incorrect": "En fait c''est faux : \"must have LEFT\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Might/could have (possibilité)', jsonb_build_object(
  'rule', 'might/could have + participe passé pour une possibilité, pas une certitude.',
  'example', jsonb_build_object('en', 'He might have missed the bus.', 'fr', 'Il a peut-être raté le bus.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : He ___ have taken the wrong train.", "options": ["might", "must (certain)", "can"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Possibilité : might."}'),
  (2, 'qcm', '{"question": "\"Might have\" exprime...", "options": ["une certitude", "une possibilité"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Une possibilité."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " my keys at your place. (ai peut-être laissé)", "correct_answers": ["might have left"], "feedback_correct": "Correct !", "feedback_incorrect": "might have left."}'),
  (4, 'true_false', '{"statement": "\"Might have\" et \"must have\" expriment le même degré de certitude.", "correct_answer": false, "feedback_correct": "Exact, must have est bien plus certain.", "feedback_incorrect": "En fait c''est faux : les degrés sont différents."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Should have (regret, reproche)', jsonb_build_object(
  'rule', 'should have + participe passé = regret. shouldn''t have = reproche.',
  'example', jsonb_build_object('en', 'I should have studied more.', 'fr', 'J''aurais dû étudier plus.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ have called you earlier.", "options": ["should", "must", "can", "might"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Regret : should have."}'),
  (2, 'qcm', '{"question": "\"You shouldn''t have spent all that money\" exprime...", "options": ["un conseil futur", "un reproche sur le passé"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Reproche sur le passé."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " tell me the truth. (aurait dû)", "correct_answers": ["should have told"], "feedback_correct": "Correct !", "feedback_incorrect": "should have told."}'),
  (4, 'true_false', '{"statement": "\"Should have\" exprime un regret ou un reproche sur une action passée.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Can''t have (déduction négative)', jsonb_build_object(
  'rule', 'can''t have + participe passé pour une déduction négative forte.',
  'example', jsonb_build_object('en', 'They can''t have arrived yet.', 'fr', 'Ils ne peuvent pas encore être arrivés.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : They ___ have finished already, it''s too soon.", "options": ["can''t", "mustn''t", "shouldn''t"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Déduction négative : can''t."}'),
  (2, 'qcm', '{"question": "\"Can''t have\" exprime...", "options": ["une interdiction", "une déduction négative forte"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Déduction négative forte."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " him, she was in Paris. (n''a pas pu voir)", "correct_answers": ["can''t have seen"], "feedback_correct": "Correct !", "feedback_incorrect": "can''t have seen."}'),
  (4, 'true_false', '{"statement": "\"Must\" a une forme passée directe pour exprimer une obligation passée (musted).", "correct_answer": false, "feedback_correct": "Exact, on utilise had to.", "feedback_incorrect": "En fait c''est faux : pas de forme passée directe, on dit had to."}')
) as v(position, type, content);

