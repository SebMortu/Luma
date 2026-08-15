-- ===== Unité 15 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'L''impératif', jsonb_build_object(
  'rule', 'Base verbale seule (affirmatif), Don''t + base verbale (négatif). Ajout de please pour la politesse.',
  'example', jsonb_build_object('en', 'Close the door, please. Don''t be late.', 'fr', 'Ferme la porte, s''il te plaît. Ne sois pas en retard.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ the window, please.", "options": ["Close", "You close", "Closing", "To close"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Base verbale seule : Close."}'),
  (2, 'qcm', '{"question": "Complète : ___ touch that!", "options": ["Not", "Don''t", "No", "Never"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Don''t + base verbale."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " quiet, please. (Sois)", "correct_answers": ["Be"], "feedback_correct": "Correct !", "feedback_incorrect": "Be, impératif de to be."}'),
  (4, 'true_false', '{"statement": "L''impératif anglais nécessite toujours un sujet.", "correct_answer": false, "feedback_correct": "Exact, pas de sujet à l''impératif.", "feedback_incorrect": "En fait c''est faux : \"Close the door\", sans sujet."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Let''s + suggestions', jsonb_build_object(
  'rule', 'Let''s (= let us) + base verbale, inclut toujours le locuteur ET l''interlocuteur.',
  'example', jsonb_build_object('en', 'Let''s go to the cinema tonight.', 'fr', 'Allons au cinéma ce soir.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ go to the beach!", "options": ["Let''s", "Let", "We let", "Lets"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Let''s = let us."}'),
  (2, 'qcm', '{"question": "\"Let''s\" inclut...", "options": ["seulement le locuteur", "seulement l''interlocuteur", "les deux"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Let''s inclut toujours les deux personnes."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " about this. (N''argumentons pas)", "correct_answers": ["Let''s not argue"], "feedback_correct": "Correct !", "feedback_incorrect": "Let''s not argue."}'),
  (4, 'true_false', '{"statement": "\"Let''s\" ne concerne que la personne qui parle.", "correct_answer": false, "feedback_correct": "Exact, ça inclut l''interlocuteur aussi.", "feedback_incorrect": "En fait c''est faux : ça inclut toujours les deux."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Why don''t we / How about', jsonb_build_object(
  'rule', 'Why don''t we/you + base verbale. How about + gérondif.',
  'example', jsonb_build_object('en', 'How about watching a movie?', 'fr', 'Et si on regardait un film ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Why don''t we ___ pizza?", "options": ["order", "ordering", "to order", "orders"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Base verbale après why don''t we : order."}'),
  (2, 'qcm', '{"question": "Complète : How about ___ a movie?", "options": ["watch", "watching", "to watch", "watches"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "How about + gérondif : watching."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " for a walk? (Et si on allait)", "correct_answers": ["How about going"], "feedback_correct": "Correct !", "feedback_incorrect": "How about going."}'),
  (4, 'true_false', '{"statement": "\"How about go?\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, il faut le gérondif.", "feedback_incorrect": "En fait c''est faux : \"How about GOING?\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Formules de politesse', jsonb_build_object(
  'rule', 'Vocabulaire pour interagir poliment : could you, would you mind, excuse me.',
  'example', jsonb_build_object('en', 'Could you help me, please?', 'fr', 'Pourriez-vous m''aider, s''il vous plaît ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle formule est la plus polie ?", "options": ["Give me that!", "Could you give me that, please?"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Could you... est plus poli."}'),
  (2, 'qcm', '{"question": "Que signifie \"Excuse me\" ?", "options": ["Merci", "Excusez-moi", "Au revoir", "S''il vous plaît"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Excuse me = Excusez-moi."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " help me with this? (Pourriez-vous)", "correct_answers": ["Could you"], "feedback_correct": "Correct !", "feedback_incorrect": "Could you."}'),
  (4, 'true_false', '{"statement": "\"Could you\" est plus poli que l''impératif direct.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

-- ===== Unité 16 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Phrasal verbs du quotidien (1)', jsonb_build_object(
  'rule', 'get up, wake up, turn on/off, look for.',
  'example', jsonb_build_object('en', 'I get up at 7am.', 'fr', 'Je me lève à 7h.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"get up\" ?", "options": ["se coucher", "se lever", "manger", "partir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "get up = se lever."}'),
  (2, 'qcm', '{"question": "Que signifie \"look for\" ?", "options": ["regarder", "chercher", "trouver", "voir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "look for = chercher."}'),
  (3, 'fill_blank', '{"sentence_before": "Can you ", "sentence_after": " the TV? (éteindre)", "correct_answers": ["turn off"], "feedback_correct": "Correct !", "feedback_incorrect": "turn off = éteindre."}'),
  (4, 'true_false', '{"statement": "\"Turn on\" signifie \"éteindre\".", "correct_answer": false, "feedback_correct": "Exact, ça signifie allumer.", "feedback_incorrect": "En fait c''est faux : turn on = allumer."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Phrasal verbs du quotidien (2)', jsonb_build_object(
  'rule', 'look after, give up, find out, put on, take off.',
  'example', jsonb_build_object('en', 'She looks after her sister.', 'fr', 'Elle s''occupe de sa sœur.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"look after\" ?", "options": ["chercher", "s''occuper de", "regarder après", "trouver"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "look after = s''occuper de."}'),
  (2, 'qcm', '{"question": "Que signifie \"give up\" ?", "options": ["donner", "abandonner", "continuer", "recevoir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "give up = abandonner."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " the truth. (ai découvert)", "correct_answers": ["found out"], "feedback_correct": "Correct !", "feedback_incorrect": "found out = ai découvert."}'),
  (4, 'true_false', '{"statement": "\"Take off\" peut signifier à la fois \"enlever\" et \"décoller\" (avion).", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Phrasal verbs séparables', jsonb_build_object(
  'rule', 'Avec les verbes séparables, un pronom se place obligatoirement entre le verbe et la particule.',
  'example', jsonb_build_object('en', 'Turn it off. Pick me up at 8.', 'fr', 'Éteins-le. Viens me chercher à 8h.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle phrase est correcte ?", "options": ["Turn off it", "Turn it off"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le pronom se place entre : Turn it off."}'),
  (2, 'qcm', '{"question": "Complète : Can you pick ___ up at 5?", "options": ["me", "I", "my", "mine"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "pick ME up."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " this form. (Remplis)", "correct_answers": ["Fill in"], "feedback_correct": "Correct !", "feedback_incorrect": "Fill in."}'),
  (4, 'true_false', '{"statement": "Avec un pronom, on peut dire \"look after her\" ou \"look her after\".", "correct_answer": false, "feedback_correct": "Exact, look after est non-séparable.", "feedback_incorrect": "En fait c''est faux : toujours \"look after her\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Révision générale A2', jsonb_build_object(
  'rule', 'Cette leçon combine les points clés du niveau A2 : futur, comparatifs, modaux, present perfect, phrasal verbs.',
  'example', jsonb_build_object('en', 'I''m going to visit London next year.', 'fr', 'Je vais visiter Londres l''année prochaine.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ visit Rome next year.", "options": ["am going to", "go", "went", "going"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Projet futur : am going to."}'),
  (2, 'qcm', '{"question": "Complète : This is ___ than I expected.", "options": ["good", "gooder", "better", "best"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "good→better (irrégulier)."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " Italy twice. (ai déjà visité)", "correct_answers": ["have already visited"], "feedback_correct": "Correct !", "feedback_incorrect": "have already visited."}'),
  (4, 'true_false', '{"statement": "Le niveau A2 couvre le futur, les comparatifs, les modaux et le present perfect.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

