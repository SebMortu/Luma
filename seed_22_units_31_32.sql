-- ===== Unité 31 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Inversion après adverbes négatifs', jsonb_build_object(
  'rule', 'Quand un adverbe négatif ouvre la phrase (never, rarely, hardly), l''ordre auxiliaire-sujet s''inverse.',
  'example', jsonb_build_object('en', 'Never have I seen such a mess.', 'fr', 'Jamais je n''ai vu un tel désordre.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ have I seen such dedication.", "options": ["Never", "I never", "Not never"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Never + inversion."}'),
  (2, 'qcm', '{"question": "Quelle phrase utilise correctement l''inversion ?", "options": ["Never I have seen this", "Never have I seen this"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Never have I seen this."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " does she complain. (Rarement)", "correct_answers": ["Rarely"], "feedback_correct": "Correct !", "feedback_incorrect": "Rarely."}'),
  (4, 'true_false', '{"statement": "L''inversion après un adverbe négatif est courante à l''oral informel.", "correct_answer": false, "feedback_correct": "Exact, c''est une structure écrite/soutenue.", "feedback_incorrect": "En fait c''est faux : structure exclusivement écrite/soutenue."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Not only... but also', jsonb_build_object(
  'rule', 'Structure emphatique avec inversion dans la première partie.',
  'example', jsonb_build_object('en', 'Not only did she win, but she also broke the record.', 'fr', 'Non seulement elle a gagné, mais elle a aussi battu le record.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Not only ___ he late, but he also forgot the documents.", "options": ["was", "he was", "did he arrive"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "was, inversion."}'),
  (2, 'qcm', '{"question": "\"Not only... but also\" sert à...", "options": ["nuancer", "accumuler deux informations avec emphase"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Accumuler avec emphase."}'),
  (3, 'fill_blank', '{"sentence_before": "Not only ", "sentence_after": " late, but he also forgot the documents. (était-il)", "correct_answers": ["was he"], "feedback_correct": "Correct !", "feedback_incorrect": "was he."}'),
  (4, 'true_false', '{"statement": "\"Not only\" nécessite une inversion quand il est en début de phrase.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Hardly... when / No sooner... than', jsonb_build_object(
  'rule', 'Structures exprimant qu''une action a été immédiatement suivie d''une autre.',
  'example', jsonb_build_object('en', 'Hardly had I sat down when the phone rang.', 'fr', 'À peine assis, le téléphone a sonné.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Hardly ___ I sat down when the phone rang.", "options": ["had", "have", "did"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "had, past perfect + inversion."}'),
  (2, 'qcm', '{"question": "\"No sooner... than\" exprime...", "options": ["une action lointaine", "une action immédiatement suivie d''une autre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Action immédiatement suivie."}'),
  (3, 'fill_blank', '{"sentence_before": "No sooner ", "sentence_after": " than it started to rain. (était-elle partie)", "correct_answers": ["had she left"], "feedback_correct": "Correct !", "feedback_incorrect": "had she left."}'),
  (4, 'true_false', '{"statement": "\"Hardly... when\" et \"no sooner... than\" ont un sens similaire.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Little did he know', jsonb_build_object(
  'rule', 'Structure emphatique classique pour signaler une ignorance dramatique.',
  'example', jsonb_build_object('en', 'Little did he know what was about to happen.', 'fr', 'Il était loin de se douter de ce qui allait arriver.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Little ___ he know what was coming.", "options": ["did", "does", "had"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "did, inversion."}'),
  (2, 'qcm', '{"question": "\"Little did he know\" signifie...", "options": ["il savait très peu de choses en général", "il était loin de se douter de quelque chose"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Loin de se douter."}'),
  (3, 'fill_blank', '{"sentence_before": "Little ", "sentence_after": " what was about to happen. (savait-elle)", "correct_answers": ["did she know"], "feedback_correct": "Correct !", "feedback_incorrect": "did she know."}'),
  (4, 'true_false', '{"statement": "Ces structures d''inversion sont un signal de maîtrise avancée de l''anglais écrit.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

-- ===== Unité 32 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Rapporter un ordre ou un conseil', jsonb_build_object(
  'rule', 'tell/order + objet + to + infinitif pour un ordre. advise + objet + to + infinitif pour un conseil.',
  'example', jsonb_build_object('en', 'He told me to sit down.', 'fr', 'Il m''a dit de m''asseoir.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Sit down!\" devient...", "options": ["He told me sitting down", "He told me to sit down"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "told + objet + to + infinitif."}'),
  (2, 'qcm', '{"question": "\"You should rest,\" she said. -> devient...", "options": ["She advised me resting", "She advised me to rest"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "advised me to rest."}'),
  (3, 'fill_blank', '{"sentence_before": "The teacher warned us ", "sentence_after": " be late. (de ne pas)", "correct_answers": ["not to"], "feedback_correct": "Correct !", "feedback_incorrect": "not to."}'),
  (4, 'true_false', '{"statement": "\"Advise\" se construit avec \"that\" uniquement.", "correct_answer": false, "feedback_correct": "Exact, advise + objet + to + infinitif.", "feedback_incorrect": "En fait c''est faux : advise + objet + to + infinitif."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Deny, admit, insist', jsonb_build_object(
  'rule', 'deny/admit + gérondif. insist on + gérondif.',
  'example', jsonb_build_object('en', 'He denied stealing the money.', 'fr', 'Il a nié avoir volé l''argent.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : He denied ___ the money.", "options": ["steal", "to steal", "stealing", "stole"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "deny + gérondif : stealing."}'),
  (2, 'qcm', '{"question": "Complète : She insisted ___ paying for dinner.", "options": ["on", "to", "for", "at"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "insist on."}'),
  (3, 'fill_blank', '{"sentence_before": "He admitted ", "sentence_after": " a mistake. (avoir fait)", "correct_answers": ["making"], "feedback_correct": "Correct !", "feedback_incorrect": "admit + gérondif : making."}'),
  (4, 'true_false', '{"statement": "\"Deny\" se construit avec l''infinitif (to + verbe).", "correct_answer": false, "feedback_correct": "Exact, deny + gérondif.", "feedback_incorrect": "En fait c''est faux : deny doing, pas to do."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Promise, offer, threaten', jsonb_build_object(
  'rule', 'promise/offer/threaten + to + infinitif.',
  'example', jsonb_build_object('en', 'He promised to help me.', 'fr', 'Il a promis de m''aider.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : He promised ___ me move.", "options": ["help", "to help", "helping"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "promise + infinitif : to help."}'),
  (2, 'qcm', '{"question": "Complète : She offered ___ us to the airport.", "options": ["drive", "to drive", "driving"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "offer + infinitif : to drive."}'),
  (3, 'fill_blank', '{"sentence_before": "He threatened ", "sentence_after": " if things didn''t change. (de démissionner)", "correct_answers": ["to quit"], "feedback_correct": "Correct !", "feedback_incorrect": "threaten + infinitif : to quit."}'),
  (4, 'true_false', '{"statement": "\"Promise\", \"offer\" et \"threaten\" se construisent tous avec l''infinitif.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Choisir le bon verbe introducteur', jsonb_build_object(
  'rule', 'Utiliser un verbe précis rend le discours rapporté plus naturel et évite les répétitions.',
  'example', jsonb_build_object('en', 'She apologized for being late.', 'fr', 'Elle s''est excusée d''être en retard.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I''m sorry I''m late,\" she said. -> devient...", "options": ["She said she was sorry", "She apologized for being late"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "apologized for being late, plus naturel."}'),
  (2, 'qcm', '{"question": "Quel verbe convient pour rapporter une plainte ?", "options": ["promise", "complain", "offer"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "complain."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " about the noise. (s''est plainte)", "correct_answers": ["complained"], "feedback_correct": "Correct !", "feedback_incorrect": "complained."}'),
  (4, 'true_false', '{"statement": "Utiliser des verbes introducteurs variés rend le discours rapporté plus naturel qu''un say/tell systématique.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

