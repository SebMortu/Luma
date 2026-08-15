-- ===== Unité 19 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'First conditional', jsonb_build_object(
  'rule', 'If + present simple, ... will + base verbale. Condition réaliste et probable.',
  'example', jsonb_build_object('en', 'If it rains, I will stay home.', 'fr', 'S''il pleut, je resterai à la maison.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If it rains, I ___ stay home.", "options": ["will", "would", "am", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "First conditional : will."}'),
  (2, 'qcm', '{"question": "Complète : If you study hard, you ___ pass.", "options": ["will", "would", "passed", "pass"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "will pass."}'),
  (3, 'fill_blank', '{"sentence_before": "If she ", "sentence_after": ", tell her I''m busy. (appelle)", "correct_answers": ["calls"], "feedback_correct": "Correct !", "feedback_incorrect": "Present simple après if : calls."}'),
  (4, 'true_false', '{"statement": "\"If it will rain\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, jamais will après if.", "feedback_incorrect": "En fait c''est faux : \"If it RAINS\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Second conditional', jsonb_build_object(
  'rule', 'If + past simple, ... would + base verbale. Hypothèse irréelle ou peu probable.',
  'example', jsonb_build_object('en', 'If I won the lottery, I would travel the world.', 'fr', 'Si je gagnais au loto, je voyagerais dans le monde.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If I ___ a million euros, I would buy a house.", "options": ["have", "had", "will have", "would have"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Second conditional : had."}'),
  (2, 'qcm', '{"question": "Complète : If I were you, I ___ apologize.", "options": ["will", "would", "am", "was"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "would apologize."}'),
  (3, 'fill_blank', '{"sentence_before": "What ", "sentence_after": " if you lost your job? (ferais-tu)", "correct_answers": ["would you do"], "feedback_correct": "Correct !", "feedback_incorrect": "would you do."}'),
  (4, 'true_false', '{"statement": "\"If I would have time\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, jamais would après if.", "feedback_incorrect": "En fait c''est faux : \"If I HAD time\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'If I were you', jsonb_build_object(
  'rule', 'Dans le style soigné, were remplace was pour tous les sujets au second conditional.',
  'example', jsonb_build_object('en', 'If I were you, I would tell the truth.', 'fr', 'À ta place, je dirais la vérité.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If I ___ you, I would apologize.", "options": ["was", "were", "am", "be"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "were, forme soignée."}'),
  (2, 'qcm', '{"question": "\"If I were you\" est utilisé pour...", "options": ["donner un conseil", "poser une question", "décrire le passé"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Donner un conseil."}'),
  (3, 'fill_blank', '{"sentence_before": "If she ", "sentence_after": " taller, she could reach it. (était)", "correct_answers": ["were"], "feedback_correct": "Correct !", "feedback_incorrect": "were, forme soignée."}'),
  (4, 'true_false', '{"statement": "\"If I was you\" est totalement incorrect en anglais.", "correct_answer": false, "feedback_correct": "Exact, utilisé à l''oral informel mais were reste standard.", "feedback_incorrect": "En fait c''est faux : c''est utilisé à l''oral, mais were reste la forme soignée."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Choisir entre first et second conditional', jsonb_build_object(
  'rule', 'First = probable/réaliste. Second = hypothétique/peu probable.',
  'example', jsonb_build_object('en', 'If I have time, I will call you.', 'fr', 'Si j''ai le temps, je t''appellerai.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle phrase est la plus probable ?", "options": ["If it rains, I''ll stay home", "If it rained, I would stay home"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "First conditional = plus probable."}'),
  (2, 'qcm', '{"question": "Complète (hypothèse peu probable) : If I ___ rich, I would travel.", "options": ["am", "was", "were", "will be"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "were, second conditional."}'),
  (3, 'fill_blank', '{"sentence_before": "If we ", "sentence_after": " now, we will arrive on time. (partons)", "correct_answers": ["leave"], "feedback_correct": "Correct !", "feedback_incorrect": "Present simple : leave."}'),
  (4, 'true_false', '{"statement": "Le second conditional s''utilise pour une situation très probable.", "correct_answer": false, "feedback_correct": "Exact, c''est le first conditional.", "feedback_incorrect": "En fait c''est faux : second = peu probable."}')
) as v(position, type, content);

-- ===== Unité 20 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Le passif au présent', jsonb_build_object(
  'rule', 'sujet + is/are + participe passé.',
  'example', jsonb_build_object('en', 'English is spoken all over the world.', 'fr', 'L''anglais est parlé partout dans le monde.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : English ___ spoken here.", "options": ["is", "are", "was", "were"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Sujet singulier : is."}'),
  (2, 'qcm', '{"question": "Complète : Cars ___ made in this factory.", "options": ["is", "are", "was", "were"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Sujet pluriel : are."}'),
  (3, 'fill_blank', '{"sentence_before": "Breakfast ", "sentence_after": " from 7 to 10am. (est servi)", "correct_answers": ["is served"], "feedback_correct": "Correct !", "feedback_incorrect": "is served."}'),
  (4, 'true_false', '{"statement": "Le passif se forme avec to be + participe passé.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Le passif au passé', jsonb_build_object(
  'rule', 'sujet + was/were + participe passé.',
  'example', jsonb_build_object('en', 'This house was built in 1920.', 'fr', 'Cette maison a été construite en 1920.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : This house ___ built in 1920.", "options": ["is", "was", "were", "are"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Passé, singulier : was."}'),
  (2, 'qcm', '{"question": "Complète : The letters ___ sent yesterday.", "options": ["is", "was", "were", "are"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Passé, pluriel : were."}'),
  (3, 'fill_blank', '{"sentence_before": "My phone ", "sentence_after": " yesterday. (a été volé)", "correct_answers": ["was stolen"], "feedback_correct": "Correct !", "feedback_incorrect": "was stolen."}'),
  (4, 'true_false', '{"statement": "On garde toujours is/are au passif, peu importe le temps.", "correct_answer": false, "feedback_correct": "Exact, il faut conjuguer to be.", "feedback_incorrect": "En fait c''est faux : was/were au passé."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Quand utiliser le passif', jsonb_build_object(
  'rule', 'Quand l''agent est inconnu, évident, ou sans importance ; registre plus formel.',
  'example', jsonb_build_object('en', 'My car was stolen.', 'fr', 'Ma voiture a été volée.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quand utilise-t-on le passif ?", "options": ["quand l''agent est connu et important", "quand l''agent est inconnu ou sans importance"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Agent inconnu/sans importance."}'),
  (2, 'qcm', '{"question": "Complète : Mistakes ___ made.", "options": ["is", "are", "was", "were"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "Passé, pluriel : were."}'),
  (3, 'fill_blank', '{"sentence_before": "New rules ", "sentence_after": ". (ont été introduites)", "correct_answers": ["have been introduced"], "feedback_correct": "Correct !", "feedback_incorrect": "have been introduced."}'),
  (4, 'true_false', '{"statement": "Le passif est plus courant dans un contexte formel/journalistique.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Mentionner l''agent avec by', jsonb_build_object(
  'rule', 'Si l''agent est pertinent, on l''ajoute avec by.',
  'example', jsonb_build_object('en', 'The Mona Lisa was painted by Leonardo da Vinci.', 'fr', 'La Joconde a été peinte par Léonard de Vinci.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : This book was written ___ a famous author.", "options": ["by", "from", "with", "at"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "L''agent s''introduit avec by."}'),
  (2, 'qcm', '{"question": "Quelle phrase mentionne l''agent ?", "options": ["The song was recorded", "The song was recorded by the band"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "by the band mentionne l''agent."}'),
  (3, 'fill_blank', '{"sentence_before": "The Eiffel Tower was designed ", "sentence_after": " Gustave Eiffel. (par)", "correct_answers": ["by"], "feedback_correct": "Correct !", "feedback_incorrect": "by."}'),
  (4, 'true_false', '{"statement": "On mentionne toujours l''agent au passif, sans exception.", "correct_answer": false, "feedback_correct": "Exact, seulement si pertinent.", "feedback_incorrect": "En fait c''est faux : on l''omet souvent."}')
) as v(position, type, content);

