-- ===== Unité 36 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Connecteurs et marqueurs à l''oral', jsonb_build_object(
  'rule', 'Well, so, actually, I mean, anyway — servent à structurer la pensée en temps réel à l''oral.',
  'example', jsonb_build_object('en', 'Well, I think we should reconsider the plan.', 'fr', 'Bon, je pense qu''on devrait reconsidérer le plan.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Well\" en début de phrase sert à...", "options": ["conclure fermement", "introduire une réflexion, temporiser"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Introduire une réflexion."}'),
  (2, 'qcm', '{"question": "Quel marqueur signale une nuance ou correction ?", "options": ["anyway", "actually", "and"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "actually."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": ", I''m not sure this is a good idea. (Honnêtement)", "correct_answers": ["To be honest"], "feedback_correct": "Correct !", "feedback_incorrect": "To be honest."}'),
  (4, 'true_false', '{"statement": "Utiliser des marqueurs de discours à l''oral rend l''anglais plus naturel.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Gérer un débat (contre-arguments)', jsonb_build_object(
  'rule', 'I see your point but..., that''s true however..., the thing is...',
  'example', jsonb_build_object('en', 'I see your point, but I think there''s another way to look at it.', 'fr', 'Je comprends ton point de vue, mais je pense qu''on peut voir ça autrement.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I see your point, ___ I think differently.", "options": ["but", "so", "because", "and"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "but."}'),
  (2, 'qcm', '{"question": "\"The thing is...\" sert à...", "options": ["conclure", "introduire un point important dans un débat"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Introduire un point important."}'),
  (3, 'fill_blank', '{"sentence_before": "Not ", "sentence_after": " that it would save us money. (sans compter)", "correct_answers": ["to mention"], "feedback_correct": "Correct !", "feedback_incorrect": "to mention."}'),
  (4, 'true_false', '{"statement": "\"I see your point, but...\" est une façon polie d''introduire un désaccord.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Trouver un compromis', jsonb_build_object(
  'rule', 'Maybe we could meet halfway, what if we tried..., at the end of the day.',
  'example', jsonb_build_object('en', 'Maybe we could meet halfway on this.', 'fr', 'On pourrait peut-être trouver un compromis là-dessus.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Meet halfway\" signifie...", "options": ["se rencontrer géographiquement", "trouver un compromis"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Trouver un compromis."}'),
  (2, 'qcm', '{"question": "\"At the end of the day\" sert à...", "options": ["parler du soir", "conclure une réflexion"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Conclure une réflexion."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " we tried a different approach? (Et si)", "correct_answers": ["What if"], "feedback_correct": "Correct !", "feedback_incorrect": "What if."}'),
  (4, 'true_false', '{"statement": "\"Meet halfway\" est une expression uniquement littérale, sans sens figuré.", "correct_answer": false, "feedback_correct": "Exact, elle a un sens figuré très courant.", "feedback_incorrect": "En fait c''est faux : sens figuré = trouver un compromis."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Synthèse finale — fluidité complète', jsonb_build_object(
  'rule', 'Combiner tous les éléments du niveau C1 pour une expression fluide et naturelle.',
  'example', jsonb_build_object('en', 'Well, to be honest, what really surprised me was how calm she stayed.', 'fr', 'Bon, honnêtement, ce qui m''a vraiment surpris, c''est à quel point elle est restée calme.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle phrase combine plusieurs structures avancées C1 ?", "options": ["She was calm.", "Not only was she calm, but what surprised me most was how she helped everyone else."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La deuxième combine plusieurs structures avancées."}'),
  (2, 'qcm', '{"question": "Quel est l''objectif principal du niveau C1 ?", "options": ["connaître du vocabulaire de base", "s''exprimer avec fluidité et nuance"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Fluidité et nuance."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": ", we should just go for it. (Si tu veux mon avis)", "correct_answers": ["If you ask me"], "feedback_correct": "Correct !", "feedback_incorrect": "If you ask me."}'),
  (4, 'true_false', '{"statement": "La maîtrise du niveau C1 se mesure uniquement à la grammaire, pas à la fluidité.", "correct_answer": false, "feedback_correct": "Exact, la fluidité compte tout autant.", "feedback_incorrect": "En fait c''est faux : la fluidité et la nuance sont centrales aussi."}')
) as v(position, type, content);

