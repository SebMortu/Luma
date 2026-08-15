-- ===== Unité 29 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Phrasal verbs avancés (1)', jsonb_build_object(
  'rule', 'bring up, come across, get away with, go through.',
  'example', jsonb_build_object('en', 'She brought up an interesting point.', 'fr', 'Elle a soulevé un point intéressant.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"bring up\" ?", "options": ["élever un enfant", "évoquer un sujet", "les deux"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "bring up a les deux sens."}'),
  (2, 'qcm', '{"question": "Que signifie \"come across\" ?", "options": ["traverser", "tomber sur, sembler", "partir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "come across = tomber sur."}'),
  (3, 'fill_blank', '{"sentence_before": "He got away ", "sentence_after": " lying. (s''en est sorti sans punition)", "correct_answers": ["with"], "feedback_correct": "Correct !", "feedback_incorrect": "get away with."}'),
  (4, 'true_false', '{"statement": "\"Go through\" peut signifier \"traverser une épreuve\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Phrasal verbs avancés (2)', jsonb_build_object(
  'rule', 'put off, turn out, work out, take after.',
  'example', jsonb_build_object('en', 'We put off the meeting.', 'fr', 'On a reporté la réunion.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"put off\" ?", "options": ["reporter", "commencer", "annuler définitivement", "accepter"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "put off = reporter."}'),
  (2, 'qcm', '{"question": "Que signifie \"take after\" ?", "options": ["suivre quelqu''un", "ressembler à (famille)", "partir après"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "take after = ressembler à."}'),
  (3, 'fill_blank', '{"sentence_before": "Everything ", "sentence_after": " in the end. (s''est bien passé)", "correct_answers": ["worked out"], "feedback_correct": "Correct !", "feedback_incorrect": "worked out."}'),
  (4, 'true_false', '{"statement": "\"Turn out\" signifie \"s''avérer\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Phrasal verbs avancés (3)', jsonb_build_object(
  'rule', 'stand out, fall through, look into, back up.',
  'example', jsonb_build_object('en', 'Her work really stands out.', 'fr', 'Son travail se démarque vraiment.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"stand out\" ?", "options": ["se démarquer", "rester debout", "partir", "abandonner"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "stand out = se démarquer."}'),
  (2, 'qcm', '{"question": "Que signifie \"fall through\" ?", "options": ["réussir", "échouer (projet, plan)", "tomber physiquement"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "fall through = échouer."}'),
  (3, 'fill_blank', '{"sentence_before": "The police are ", "sentence_after": " the matter. (enquêtent sur)", "correct_answers": ["looking into"], "feedback_correct": "Correct !", "feedback_incorrect": "looking into."}'),
  (4, 'true_false', '{"statement": "\"Back up\" peut signifier \"soutenir\" ou \"sauvegarder\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Sens multiples et registre', jsonb_build_object(
  'rule', 'Beaucoup de phrasal verbs avancés sont polysémiques et varient en registre.',
  'example', jsonb_build_object('en', 'He comes across as rude.', 'fr', 'Il donne l''impression d''être impoli.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Come across\" peut aussi signifier...", "options": ["traverser", "donner l''impression de", "commencer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "come across = aussi \"donner l''impression\"."}'),
  (2, 'qcm', '{"question": "\"Hold on\" est plutôt de registre...", "options": ["familier", "très formel"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "hold on = familier."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " very confident. (donne l''impression d''être)", "correct_answers": ["comes across as"], "feedback_correct": "Correct !", "feedback_incorrect": "comes across as."}'),
  (4, 'true_false', '{"statement": "Tous les phrasal verbs n''ont qu''un seul sens possible.", "correct_answer": false, "feedback_correct": "Exact, beaucoup sont polysémiques.", "feedback_incorrect": "En fait c''est faux : beaucoup ont plusieurs sens."}')
) as v(position, type, content);

-- ===== Unité 30 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Wish + past simple/perfect', jsonb_build_object(
  'rule', 'wish + past simple = souhait présent irréel. wish + past perfect = regret du passé.',
  'example', jsonb_build_object('en', 'I wish I lived closer to my family.', 'fr', 'J''aimerais vivre plus près de ma famille.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I wish I ___ closer to my family.", "options": ["live", "lived", "had lived", "will live"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "wish + past simple : lived."}'),
  (2, 'qcm', '{"question": "Complète : I wish I ___ medicine. (regret du passé)", "options": ["study", "studied", "had studied"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "wish + past perfect : had studied."}'),
  (3, 'fill_blank', '{"sentence_before": "I wish I ", "sentence_after": " Spanish fluently. (parlais)", "correct_answers": ["spoke"], "feedback_correct": "Correct !", "feedback_incorrect": "spoke, souhait présent."}'),
  (4, 'true_false', '{"statement": "\"I wish I live closer\" est grammaticalement correct pour un souhait présent.", "correct_answer": false, "feedback_correct": "Exact, il faut le past simple.", "feedback_incorrect": "En fait c''est faux : \"I wish I LIVED closer\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'If only', jsonb_build_object(
  'rule', 'Version plus emphatique de wish, souvent utilisée seule.',
  'example', jsonb_build_object('en', 'If only I had known!', 'fr', 'Si seulement j''avais su !')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"If only\" est...", "options": ["moins emphatique que wish", "plus emphatique que wish"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Plus emphatique."}'),
  (2, 'qcm', '{"question": "Complète : ___ I had listened to your advice!", "options": ["If only", "Wish", "I wish that"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "If only."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " we had more money! (Si seulement)", "correct_answers": ["If only"], "feedback_correct": "Correct !", "feedback_incorrect": "If only."}'),
  (4, 'true_false', '{"statement": "\"If only\" peut s''utiliser seul, sans proposition principale.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Would rather', jsonb_build_object(
  'rule', 'would rather + base verbale (pour soi). would rather + past simple (pour quelqu''un d''autre).',
  'example', jsonb_build_object('en', 'I would rather stay home.', 'fr', 'Je préférerais rester à la maison.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I would rather ___ home tonight.", "options": ["stay", "stayed", "to stay", "staying"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "would rather + base verbale."}'),
  (2, 'qcm', '{"question": "Complète : I''d rather you ___ smoke here.", "options": ["don''t", "didn''t", "not", "won''t"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "would rather you + past simple : didn''t."}'),
  (3, 'fill_blank', '{"sentence_before": "I would rather ", "sentence_after": " in tonight. (rester)", "correct_answers": ["stay"], "feedback_correct": "Correct !", "feedback_incorrect": "stay."}'),
  (4, 'true_false', '{"statement": "\"I would rather you stay\" est la forme correcte quand ça concerne quelqu''un d''autre.", "correct_answer": false, "feedback_correct": "Exact, il faut le past simple.", "feedback_incorrect": "En fait c''est faux : \"I would rather you STAYED\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Had better', jsonb_build_object(
  'rule', 'had better + base verbale pour un conseil pressant, plus fort que should.',
  'example', jsonb_build_object('en', 'You had better hurry, or you''ll miss the train.', 'fr', 'Tu ferais mieux de te dépêcher, sinon tu vas rater le train.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : You ___ hurry, or you''ll be late.", "options": ["had better", "have better", "better had"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "had better."}'),
  (2, 'qcm', '{"question": "\"Had better\" est-il plus ou moins fort que \"should\" ?", "options": ["plus fort", "moins fort", "identique"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Plus fort que should."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " leave now. (ferions mieux de)", "correct_answers": ["had better"], "feedback_correct": "Correct !", "feedback_incorrect": "had better."}'),
  (4, 'true_false', '{"statement": "\"Had better\" a le même sens que \"had to\".", "correct_answer": false, "feedback_correct": "Exact, sens différents.", "feedback_incorrect": "En fait c''est faux : had better = conseil pressant, had to = obligation passée."}')
) as v(position, type, content);

