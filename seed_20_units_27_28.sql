-- ===== Unité 27 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Le passif avec modaux', jsonb_build_object(
  'rule', 'modal + be + participe passé.',
  'example', jsonb_build_object('en', 'The report must be finished by Friday.', 'fr', 'Le rapport doit être terminé vendredi.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : This task must ___ completed today.", "options": ["be", "is", "been", "being"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "must BE completed."}'),
  (2, 'qcm', '{"question": "Complète : The results should ___ announced tomorrow.", "options": ["be", "is", "been", "being"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "should BE announced."}'),
  (3, 'fill_blank', '{"sentence_before": "This issue can ", "sentence_after": " quickly. (être résolu)", "correct_answers": ["be fixed"], "feedback_correct": "Correct !", "feedback_incorrect": "be fixed."}'),
  (4, 'true_false', '{"statement": "\"Must completed\" est grammaticalement correct au passif.", "correct_answer": false, "feedback_correct": "Exact, il faut must BE completed.", "feedback_incorrect": "En fait c''est faux : il manque be."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Passif avec verbes à deux compléments', jsonb_build_object(
  'rule', 'Avec give/tell/offer/send, on peut mettre le bénéficiaire OU l''objet en sujet du passif.',
  'example', jsonb_build_object('en', 'She was given an award.', 'fr', 'Elle a reçu une récompense.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle version est la plus naturelle ?", "options": ["She was given a promotion", "A promotion was given to her"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Bénéficiaire en sujet = plus naturel."}'),
  (2, 'qcm', '{"question": "Complète : I ___ offered a new position.", "options": ["was", "am being", "have", "had"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "was offered."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " a gift from his colleagues. (a reçu)", "correct_answers": ["was given"], "feedback_correct": "Correct !", "feedback_incorrect": "was given."}'),
  (4, 'true_false', '{"statement": "Avec les verbes à deux compléments, seul l''objet donné peut être mis en sujet du passif.", "correct_answer": false, "feedback_correct": "Exact, le bénéficiaire peut aussi l''être.", "feedback_incorrect": "En fait c''est faux : le bénéficiaire est même plus naturel en sujet."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Is said to / is believed to', jsonb_build_object(
  'rule', 'Structure formelle pour rapporter une opinion générale sans l''attribuer nommément.',
  'example', jsonb_build_object('en', 'He is said to be very rich.', 'fr', 'On dit qu''il est très riche.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ to be the best candidate.", "options": ["is said", "said", "says", "is saying"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "is said to be."}'),
  (2, 'qcm', '{"question": "\"It is believed that...\" s''utilise pour...", "options": ["donner un fait certain", "rapporter une opinion générale sans l''attribuer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Opinion générale non attribuée."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " very talented. (est considéré comme)", "correct_answers": ["is thought to be"], "feedback_correct": "Correct !", "feedback_incorrect": "is thought to be."}'),
  (4, 'true_false', '{"statement": "\"Is said to\" est une structure courante en anglais journalistique.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Style académique et rapport', jsonb_build_object(
  'rule', 'Le passif est très utilisé dans les rapports formels pour rester neutre et objectif.',
  'example', jsonb_build_object('en', 'Several problems were identified during the review.', 'fr', 'Plusieurs problèmes ont été identifiés durant la révision.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Several issues ___ identified during the audit.", "options": ["was", "were", "is", "are"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "were, pluriel passé."}'),
  (2, 'qcm', '{"question": "Le passif est privilégié dans quel contexte ?", "options": ["conversation informelle", "rapports formels et académiques"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Rapports formels."}'),
  (3, 'fill_blank', '{"sentence_before": "The data ", "sentence_after": " carefully. (a été analysée)", "correct_answers": ["was analyzed"], "feedback_correct": "Correct !", "feedback_incorrect": "was analyzed."}'),
  (4, 'true_false', '{"statement": "Le style académique préfère généralement l''actif au passif.", "correct_answer": false, "feedback_correct": "Exact, c''est l''inverse.", "feedback_incorrect": "En fait c''est faux : le passif est privilégié."}')
) as v(position, type, content);

-- ===== Unité 28 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Connecteurs d''opposition (however, although)', jsonb_build_object(
  'rule', 'however (neutre/formel, début de phrase), although/even though (+ proposition complète).',
  'example', jsonb_build_object('en', 'Although it was raining, we went out.', 'fr', 'Bien qu''il pleuve, on est sorti.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ it was raining, we went out.", "options": ["However", "Although", "Despite", "Therefore"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Although + proposition."}'),
  (2, 'qcm', '{"question": "\"However\" se place généralement...", "options": ["au milieu d''une phrase", "en début de phrase, suivi d''une virgule"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Début de phrase, virgule."}'),
  (3, 'fill_blank', '{"sentence_before": "The exam was hard. ", "sentence_after": ", most students passed. (Cependant)", "correct_answers": ["However"], "feedback_correct": "Correct !", "feedback_incorrect": "However."}'),
  (4, 'true_false', '{"statement": "\"Although\" et \"however\" ont exactement la même construction grammaticale.", "correct_answer": false, "feedback_correct": "Exact, although introduit une proposition.", "feedback_incorrect": "En fait c''est faux : constructions différentes."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Despite et in spite of', jsonb_build_object(
  'rule', 'despite/in spite of + nom ou gérondif, jamais une proposition complète.',
  'example', jsonb_build_object('en', 'Despite the rain, we went out.', 'fr', 'Malgré la pluie, on est sorti.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ the traffic, we arrived on time.", "options": ["Although", "Despite", "However", "Therefore"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Despite + nom."}'),
  (2, 'qcm', '{"question": "\"Despite it was raining\" est-il correct ?", "options": ["Oui", "Non"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Non, despite ne prend pas de proposition complète."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " being tired, he kept working. (Malgré)", "correct_answers": ["Despite"], "feedback_correct": "Correct !", "feedback_incorrect": "Despite."}'),
  (4, 'true_false', '{"statement": "\"Despite\" peut être suivi directement d''une proposition complète comme \"although\".", "correct_answer": false, "feedback_correct": "Exact, il faut un nom ou un gérondif.", "feedback_incorrect": "En fait c''est faux : jamais de proposition complète."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Cause et conséquence (therefore, as a result)', jsonb_build_object(
  'rule', 'therefore/as a result pour la conséquence formelle. due to/owing to (+ nom) pour la cause.',
  'example', jsonb_build_object('en', 'Sales dropped. As a result, the company cut costs.', 'fr', 'Les ventes ont chuté. En conséquence, l''entreprise a réduit ses coûts.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : It rained heavily. ___, the match was cancelled.", "options": ["Due to", "As a result", "Despite", "Although"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "As a result = conséquence."}'),
  (2, 'qcm', '{"question": "Complète : The delay was ___ bad weather.", "options": ["due to", "therefore", "however", "although"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "due to + cause."}'),
  (3, 'fill_blank', '{"sentence_before": "Sales dropped. ", "sentence_after": ", we changed strategy. (Par conséquent)", "correct_answers": ["Therefore"], "feedback_correct": "Correct !", "feedback_incorrect": "Therefore."}'),
  (4, 'true_false', '{"statement": "\"Due to\" est suivi d''un nom, pas d''une proposition complète.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Construire une argumentation', jsonb_build_object(
  'rule', 'Combiner connecteurs d''opposition et de conséquence pour bâtir un argumentaire nuancé.',
  'example', jsonb_build_object('en', 'Although the project was risky, we decided to proceed.', 'fr', 'Bien que le projet soit risqué, on a décidé de continuer.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ the risks, she decided to invest.", "options": ["Despite", "Because", "Therefore"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Despite + nom."}'),
  (2, 'qcm', '{"question": "Quelle phrase construit une argumentation nuancée ?", "options": ["It was hard. We did it.", "Although it was hard, we succeeded, and as a result, we gained confidence."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La combinaison de connecteurs enrichit l''argumentation."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": ", it taught us valuable lessons. (Néanmoins)", "correct_answers": ["Nevertheless"], "feedback_correct": "Correct !", "feedback_incorrect": "Nevertheless."}'),
  (4, 'true_false', '{"statement": "Utiliser plusieurs connecteurs dans un même paragraphe est courant à l''écrit soigné.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

