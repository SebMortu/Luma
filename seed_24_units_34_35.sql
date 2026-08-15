-- ===== Unité 34 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Expressions sur l''effort et la réussite', jsonb_build_object(
  'rule', 'hit the nail on the head, piece of cake, the ball is in your court.',
  'example', jsonb_build_object('en', 'That exam was a piece of cake.', 'fr', 'Cet examen était un jeu d''enfant.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"a piece of cake\" ?", "options": ["un gâteau", "un jeu d''enfant", "une tâche difficile"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "a piece of cake = un jeu d''enfant."}'),
  (2, 'qcm', '{"question": "Que signifie \"hit the nail on the head\" ?", "options": ["se tromper", "voir juste", "abandonner"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "voir juste."}'),
  (3, 'fill_blank', '{"sentence_before": "The ball is ", "sentence_after": " now. (dans ton camp)", "correct_answers": ["in your court"], "feedback_correct": "Correct !", "feedback_incorrect": "in your court."}'),
  (4, 'true_false', '{"statement": "\"Once in a blue moon\" signifie \"très souvent\".", "correct_answer": false, "feedback_correct": "Exact, ça signifie très rarement.", "feedback_incorrect": "En fait c''est faux : ça signifie très rarement."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Expressions sur la difficulté', jsonb_build_object(
  'rule', 'break the ice, bite the bullet, under the weather, back to the drawing board.',
  'example', jsonb_build_object('en', 'I feel a bit under the weather today.', 'fr', 'Je ne me sens pas très bien aujourd''hui.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"under the weather\" ?", "options": ["patraque, pas en forme", "très en forme", "à l''extérieur"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "patraque, pas en forme."}'),
  (2, 'qcm', '{"question": "Que signifie \"break the ice\" ?", "options": ["casser quelque chose", "briser la glace, détendre l''atmosphère"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "détendre l''atmosphère."}'),
  (3, 'fill_blank', '{"sentence_before": "It''s time to ", "sentence_after": " and tell her. (se résigner)", "correct_answers": ["bite the bullet"], "feedback_correct": "Correct !", "feedback_incorrect": "bite the bullet."}'),
  (4, 'true_false', '{"statement": "\"Back to the drawing board\" signifie \"réussi du premier coup\".", "correct_answer": false, "feedback_correct": "Exact, ça signifie retour à la case départ.", "feedback_incorrect": "En fait c''est faux : ça signifie un échec, retour au début."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Expressions sur l''argent et le temps', jsonb_build_object(
  'rule', 'cost an arm and a leg, save for a rainy day, in the nick of time, out of the blue.',
  'example', jsonb_build_object('en', 'This phone cost me an arm and a leg.', 'fr', 'Ce téléphone m''a coûté les yeux de la tête.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"cost an arm and a leg\" ?", "options": ["coûter très cher", "être gratuit", "coûter peu"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "coûter très cher."}'),
  (2, 'qcm', '{"question": "Que signifie \"out of the blue\" ?", "options": ["de manière prévue", "de manière inattendue"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "de manière inattendue."}'),
  (3, 'fill_blank', '{"sentence_before": "We arrived just ", "sentence_after": ". (juste à temps)", "correct_answers": ["in the nick of time"], "feedback_correct": "Correct !", "feedback_incorrect": "in the nick of time."}'),
  (4, 'true_false', '{"statement": "\"Save for a rainy day\" signifie \"dépenser tout son argent\".", "correct_answer": false, "feedback_correct": "Exact, ça signifie mettre de côté.", "feedback_incorrect": "En fait c''est faux : mettre de côté pour les coups durs."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Utiliser les idiomes en contexte', jsonb_build_object(
  'rule', 'Les idiomes ne se traduisent jamais littéralement — ils doivent être mémorisés comme des blocs figés.',
  'example', jsonb_build_object('en', 'Don''t beat around the bush, just tell me what happened.', 'fr', 'Arrête de tourner autour du pot, dis-moi juste ce qui s''est passé.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Que signifie \"beat around the bush\" ?", "options": ["aller droit au but", "tourner autour du pot"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "tourner autour du pot."}'),
  (2, 'qcm', '{"question": "Peut-on traduire les idiomes mot à mot d''une langue à l''autre ?", "options": ["Oui, toujours", "Non, rarement"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Non, rarement."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " about the surprise party. (a vendu la mèche)", "correct_answers": ["let the cat out of the bag"], "feedback_correct": "Correct !", "feedback_incorrect": "let the cat out of the bag."}'),
  (4, 'true_false', '{"statement": "Le français et l''anglais utilisent souvent des images corporelles différentes pour la même idée idiomatique.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

-- ===== Unité 35 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Vocabulaire formel vs informel', jsonb_build_object(
  'rule', 'De nombreux mots ont un équivalent plus formel (get->receive, a lot of->numerous, kids->children).',
  'example', jsonb_build_object('en', 'We received numerous applications.', 'fr', 'Nous avons reçu de nombreuses candidatures.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quel est l''équivalent formel de \"get\" ?", "options": ["receive", "take", "has"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "receive."}'),
  (2, 'qcm', '{"question": "Quel est l''équivalent formel de \"kids\" ?", "options": ["children", "babies", "people"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "children."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " your application. (avons reçu, formel)", "correct_answers": ["received"], "feedback_correct": "Correct !", "feedback_incorrect": "received."}'),
  (4, 'true_false', '{"statement": "\"A lot of\" et \"numerous\" ont le même sens mais un registre différent.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'L''email professionnel', jsonb_build_object(
  'rule', 'Formules d''ouverture, de politesse et de clôture typiques des emails formels.',
  'example', jsonb_build_object('en', 'I am writing to inquire about...', 'fr', 'Je vous écris pour me renseigner sur...')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle formule d''ouverture est la plus formelle ?", "options": ["Hey!", "I am writing to inquire about..."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "I am writing to inquire about..."}'),
  (2, 'qcm', '{"question": "Quelle formule convient pour clore un email formel ?", "options": ["Bye!", "I look forward to hearing from you."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "I look forward to hearing from you."}'),
  (3, 'fill_blank', '{"sentence_before": "Would you ", "sentence_after": " sending me the report? (cela vous dérangerait-il de)", "correct_answers": ["mind"], "feedback_correct": "Correct !", "feedback_incorrect": "mind."}'),
  (4, 'true_false', '{"statement": "\"I am writing to inquire about\" est une formule familière.", "correct_answer": false, "feedback_correct": "Exact, c''est très formel.", "feedback_incorrect": "En fait c''est faux : c''est une formule très formelle."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'L''anglais familier et les contractions orales', jsonb_build_object(
  'rule', 'gonna (going to), wanna (want to), gotta (got to) — contractions à l''oral décontracté uniquement.',
  'example', jsonb_build_object('en', 'I''m gonna grab a coffee, you want one?', 'fr', 'Je vais chercher un café, tu en veux un ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Gonna\" est la contraction orale de...", "options": ["going to", "got to", "want to"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "going to."}'),
  (2, 'qcm', '{"question": "Peut-on utiliser \"gonna\" dans un email professionnel ?", "options": ["Oui", "Non"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Non."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " grab a coffee. (vais, contraction orale)", "correct_answers": ["gonna"], "feedback_correct": "Correct !", "feedback_incorrect": "gonna."}'),
  (4, 'true_false', '{"statement": "Ces contractions orales sont acceptables à l''écrit formel.", "correct_answer": false, "feedback_correct": "Exact, réservées à l''oral décontracté.", "feedback_incorrect": "En fait c''est faux : jamais à l''écrit formel."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Choisir le bon registre selon le contexte', jsonb_build_object(
  'rule', 'Adapter son vocabulaire et ses tournures selon l''interlocuteur.',
  'example', jsonb_build_object('en', 'Could you please send me the file?', 'fr', 'Pourriez-vous m''envoyer le fichier ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle phrase convient à un supérieur hiérarchique ?", "options": ["Send me that file!", "Could you please send me that file?"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Could you please..."}'),
  (2, 'qcm', '{"question": "Pourquoi adapter son registre est important ?", "options": ["ce n''est pas important", "ça évite de sonner déplacé selon le contexte"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Évite de sonner déplacé."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " elaborate on that point, please? (Pourriez-vous)", "correct_answers": ["Could you"], "feedback_correct": "Correct !", "feedback_incorrect": "Could you."}'),
  (4, 'true_false', '{"statement": "Le même registre convient à toutes les situations, formelles ou informelles.", "correct_answer": false, "feedback_correct": "Exact, le registre doit s''adapter.", "feedback_incorrect": "En fait c''est faux : le registre doit s''adapter au contexte."}')
) as v(position, type, content);

