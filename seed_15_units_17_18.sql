-- ===== Unité 17 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Formation et usage', jsonb_build_object(
  'rule', 'have/has been + verbe en -ing. Met l''accent sur la durée et le caractère continu d''une action.',
  'example', jsonb_build_object('en', 'I''ve been waiting for an hour.', 'fr', 'J''attends depuis une heure.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ been studying for three hours.", "options": ["have", "has", "am", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec I : have."}'),
  (2, 'qcm', '{"question": "Complète : It ___ been raining all day.", "options": ["have", "has", "is", "was"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec it : has."}'),
  (3, 'fill_blank', '{"sentence_before": "She''s been ", "sentence_after": " — her eyes are red. (pleuré)", "correct_answers": ["crying"], "feedback_correct": "Correct !", "feedback_incorrect": "cry+ing = crying."}'),
  (4, 'true_false', '{"statement": "\"I''ve been knowing her for years\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, know reste au simple.", "feedback_incorrect": "En fait c''est faux : \"I''ve KNOWN her\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Present perfect simple vs continuous', jsonb_build_object(
  'rule', 'Simple = résultat/quantité. Continuous = durée/processus/effets visibles.',
  'example', jsonb_build_object('en', 'I''ve been writing reports all day.', 'fr', 'J''écris des rapports depuis ce matin.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle phrase insiste sur la durée ?", "options": ["I''ve written five reports", "I''ve been writing reports all day"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le continuous insiste sur la durée."}'),
  (2, 'qcm', '{"question": "Complète : I ___ five reports this week (résultat).", "options": ["have written", "have been writing"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Résultat quantifié : simple."}'),
  (3, 'fill_blank', '{"sentence_before": "Why are you out of breath? — I ", "sentence_after": ". (ai couru)", "correct_answers": ["have been running"], "feedback_correct": "Correct !", "feedback_incorrect": "have been running."}'),
  (4, 'true_false', '{"statement": "Le present perfect continuous met l''accent sur le résultat plutôt que la durée.", "correct_answer": false, "feedback_correct": "Exact, c''est l''inverse.", "feedback_incorrect": "En fait c''est faux : il insiste sur la durée."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'For et since avec le continuous', jsonb_build_object(
  'rule', 'Même logique que le present perfect simple : for + durée, since + point de départ.',
  'example', jsonb_build_object('en', 'I''ve been studying English for three years.', 'fr', 'J''étudie l''anglais depuis trois ans.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I''ve been living here ___ 2019.", "options": ["for", "since", "from", "at"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Point de départ : since."}'),
  (2, 'qcm', '{"question": "Complète : She''s been waiting ___ two hours.", "options": ["for", "since", "from", "at"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Durée : for."}'),
  (3, 'fill_blank', '{"sentence_before": "They''ve been living here ", "sentence_after": " six months. (depuis)", "correct_answers": ["for"], "feedback_correct": "Correct !", "feedback_incorrect": "Durée : for."}'),
  (4, 'true_false', '{"statement": "\"For\" s''utilise avec un point de départ précis.", "correct_answer": false, "feedback_correct": "Exact, for = durée.", "feedback_incorrect": "En fait c''est faux : since = point de départ."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Les verbes d''état interdits au continuous', jsonb_build_object(
  'rule', 'Certains verbes (know, believe, own, understand) restent toujours au present perfect simple.',
  'example', jsonb_build_object('en', 'I''ve known her for years.', 'fr', 'Je la connais depuis des années.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel verbe reste toujours au present perfect simple ?", "options": ["run", "know", "write", "play"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "know refuse le continuous."}'),
  (2, 'qcm', '{"question": "Complète : I''ve ___ her for ten years.", "options": ["known", "been knowing", "knowing", "know"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "known, forme simple."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " about you. (ai pensé)", "correct_answers": ["have been thinking"], "feedback_correct": "Correct !", "feedback_incorrect": "think accepte le continuous."}'),
  (4, 'true_false', '{"statement": "Tous les verbes acceptent la forme continuous sans exception.", "correct_answer": false, "feedback_correct": "Exact, certains verbes d''état la refusent.", "feedback_incorrect": "En fait c''est faux : know par exemple la refuse."}')
) as v(position, type, content);

-- ===== Unité 18 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Formation du past continuous', jsonb_build_object(
  'rule', 'was/were + verbe en -ing.',
  'example', jsonb_build_object('en', 'I was watching TV when she called.', 'fr', 'Je regardais la télé quand elle a appelé.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ working when he arrived.", "options": ["was", "were", "am", "is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec I : was."}'),
  (2, 'qcm', '{"question": "Complète : They ___ playing football.", "options": ["was", "were", "is", "am"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec they : were."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " when I called. (dormait)", "correct_answers": ["was sleeping"], "feedback_correct": "Correct !", "feedback_incorrect": "was sleeping."}'),
  (4, 'true_false', '{"statement": "\"They was playing\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, il faut were.", "feedback_incorrect": "En fait c''est faux : \"They WERE playing\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Past continuous vs past simple', jsonb_build_object(
  'rule', 'Structure classique : when + past simple, past continuous — l''action longue est interrompue par l''action courte.',
  'example', jsonb_build_object('en', 'I was watching TV when she called.', 'fr', 'Je regardais la télé quand elle a appelé.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ TV when she ___.", "options": ["was watching / called", "watched / was calling"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Action longue interrompue par action courte."}'),
  (2, 'qcm', '{"question": "Quelle action est la plus longue ?", "options": ["l''action au past continuous", "l''action au past simple"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Le continuous décrit l''action longue."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " home when it started to rain. (marchait)", "correct_answers": ["was walking"], "feedback_correct": "Correct !", "feedback_incorrect": "was walking."}'),
  (4, 'true_false', '{"statement": "Le past continuous décrit toujours une action ponctuelle et brève.", "correct_answer": false, "feedback_correct": "Exact, c''est le past simple.", "feedback_incorrect": "En fait c''est faux : le continuous décrit une action en cours."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'While et as (simultanéité)', jsonb_build_object(
  'rule', 'while + past continuous, past continuous (deux actions parallèles).',
  'example', jsonb_build_object('en', 'While I was cooking, he was setting the table.', 'fr', 'Pendant que je cuisinais, il mettait la table.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ I was cooking, he was setting the table.", "options": ["While", "When", "Because", "So"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "While = pendant que."}'),
  (2, 'qcm', '{"question": "\"While\" exprime...", "options": ["une cause", "une simultanéité", "une conséquence", "un but"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "while = simultanéité."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " I was leaving, the phone rang. (Alors que)", "correct_answers": ["As"], "feedback_correct": "Correct !", "feedback_incorrect": "As = alors que."}'),
  (4, 'true_false', '{"statement": "\"While\" s''utilise pour deux actions qui se passent en même temps.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Raconter une histoire complète', jsonb_build_object(
  'rule', 'Combiner past simple (actions successives) et past continuous (contexte/actions en cours) pour un récit riche.',
  'example', jsonb_build_object('en', 'I was walking home when I saw an old friend.', 'fr', 'Je rentrais chez moi quand j''ai vu un vieil ami.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ home when I ___ an old friend.", "options": ["was walking / saw", "walked / was seeing"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "was walking / saw."}'),
  (2, 'qcm', '{"question": "Quelle phrase utilise correctement les deux temps ?", "options": ["I was walk when I saw him", "I was walking when I saw him"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "was walking, forme correcte."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " for an hour. (avons discuté)", "correct_answers": ["talked"], "feedback_correct": "Correct !", "feedback_incorrect": "talked, past simple."}'),
  (4, 'true_false', '{"statement": "On ne peut jamais combiner past simple et past continuous dans la même phrase.", "correct_answer": false, "feedback_correct": "Exact, c''est la structure classique du récit.", "feedback_incorrect": "En fait c''est faux : c''est très courant."}')
) as v(position, type, content);

