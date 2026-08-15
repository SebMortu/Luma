-- ===== Unité 11 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Can (capacité, permission)', jsonb_build_object(
  'rule', 'can + base verbale, jamais de -s, jamais de "to". Négatif : can''t/cannot.',
  'example', jsonb_build_object('en', 'I can speak three languages.', 'fr', 'Je parle trois langues.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ swim very well.", "options": ["can", "cans", "can to", "canning"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "can, invariable."}'),
  (2, 'qcm', '{"question": "Complète : ___ I open the window?", "options": ["Can", "Do", "Am", "Are"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Can I."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " drive yet. (ne sait pas)", "correct_answers": ["can''t"], "feedback_correct": "Correct !", "feedback_incorrect": "can''t = ne peut pas."}'),
  (4, 'true_false', '{"statement": "\"She can to swim\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, jamais de to après can.", "feedback_incorrect": "En fait c''est faux : \"She can swim\", sans to."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Must et mustn''t', jsonb_build_object(
  'rule', 'must = obligation forte. mustn''t = interdiction (pas l''absence d''obligation !).',
  'example', jsonb_build_object('en', 'I must finish this today. You mustn''t smoke here.', 'fr', 'Je dois finir ça aujourd''hui. Il est interdit de fumer ici.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : You ___ smoke here (interdiction).", "options": ["mustn''t", "don''t have to", "can''t", "won''t"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "mustn''t = interdit."}'),
  (2, 'qcm', '{"question": "\"Mustn''t\" signifie...", "options": ["pas obligatoire", "interdit", "possible", "conseillé"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "mustn''t = interdit."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " finish this report today. (dois)", "correct_answers": ["must"], "feedback_correct": "Correct !", "feedback_incorrect": "must = obligation."}'),
  (4, 'true_false', '{"statement": "\"Mustn''t\" et \"don''t have to\" ont le même sens.", "correct_answer": false, "feedback_correct": "Exact, mustn''t = interdit, don''t have to = pas obligatoire mais permis.", "feedback_incorrect": "En fait c''est faux : les sens sont différents."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Have to (obligation externe)', jsonb_build_object(
  'rule', 'have to pour une obligation imposée par les circonstances.',
  'example', jsonb_build_object('en', 'I have to work tomorrow.', 'fr', 'Je dois travailler demain.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ work tomorrow.", "options": ["have to", "must to", "can to", "has"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "have to."}'),
  (2, 'qcm', '{"question": "Complète : She ___ to finish this today.", "options": ["have", "has", "must", "can"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec she : has to."}'),
  (3, 'fill_blank', '{"sentence_before": "You ", "sentence_after": " come if you''re busy. (n''êtes pas obligé de)", "correct_answers": ["don''t have to"], "feedback_correct": "Correct !", "feedback_incorrect": "don''t have to."}'),
  (4, 'true_false', '{"statement": "\"Have to\" se conjugue comme un verbe normal (has to à la 3e personne).", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Should (conseil)', jsonb_build_object(
  'rule', 'should + base verbale pour donner un conseil. Négatif : shouldn''t.',
  'example', jsonb_build_object('en', 'You should drink more water.', 'fr', 'Tu devrais boire plus d''eau.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : You ___ see a doctor.", "options": ["should", "must", "can", "have"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "should = conseil."}'),
  (2, 'qcm', '{"question": "Quelle phrase exprime un conseil ?", "options": ["You must go", "You should go", "You can go"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "should = conseil."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " be late. (ne devrions pas)", "correct_answers": ["shouldn''t"], "feedback_correct": "Correct !", "feedback_incorrect": "shouldn''t."}'),
  (4, 'true_false', '{"statement": "\"Should\" exprime une obligation aussi forte que \"must\".", "correct_answer": false, "feedback_correct": "Exact, should = conseil, must = obligation forte.", "feedback_incorrect": "En fait c''est faux : should est plus faible que must."}')
) as v(position, type, content);

-- ===== Unité 12 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Formation et expérience de vie', jsonb_build_object(
  'rule', 'have/has + participe passé. Exprime une expérience de vie sans moment précisé.',
  'example', jsonb_build_object('en', 'I have visited Japan twice.', 'fr', 'J''ai visité le Japon deux fois.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ visited Japan.", "options": ["have", "has", "am", "had"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Avec I : have."}'),
  (2, 'qcm', '{"question": "Complète : She ___ never seen this film.", "options": ["have", "has", "is", "was"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Avec she : has."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " sushi? (As-tu déjà essayé)", "correct_answers": ["Have you ever tried"], "feedback_correct": "Correct !", "feedback_incorrect": "Have you ever tried."}'),
  (4, 'true_false', '{"statement": "Le present perfect s''utilise avec un moment précis comme \"yesterday\".", "correct_answer": false, "feedback_correct": "Exact, incompatible avec un moment précis.", "feedback_incorrect": "En fait c''est faux : yesterday nécessite le past simple."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Present perfect vs past simple', jsonb_build_object(
  'rule', 'Present perfect = moment non précisé. Past simple = moment précisé, action terminée.',
  'example', jsonb_build_object('en', 'I have visited Rome. I visited Rome in 2019.', 'fr', 'J''ai visité Rome. J''ai visité Rome en 2019.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I ___ him yesterday.", "options": ["have seen", "saw", "has seen", "see"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "yesterday = moment précis : past simple, saw."}'),
  (2, 'qcm', '{"question": "Quelle phrase est correcte ?", "options": ["I have seen him yesterday", "I saw him yesterday"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "yesterday impose le past simple."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " Rome twice. (ai visité, pas de date précise)", "correct_answers": ["have visited"], "feedback_correct": "Correct !", "feedback_incorrect": "have visited, sans date précise."}'),
  (4, 'true_false', '{"statement": "\"I have seen him yesterday\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, incompatible.", "feedback_incorrect": "En fait c''est faux : yesterday impose le past simple."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'For et since', jsonb_build_object(
  'rule', 'for + durée (for 5 years). since + point de départ (since 2019).',
  'example', jsonb_build_object('en', 'I''ve lived here for 5 years.', 'fr', 'J''habite ici depuis 5 ans.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I''ve lived here ___ ten years.", "options": ["for", "since", "from", "at"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Durée : for."}'),
  (2, 'qcm', '{"question": "Complète : He has worked here ___ 2018.", "options": ["for", "since", "from", "at"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Point de départ : since."}'),
  (3, 'fill_blank', '{"sentence_before": "She has studied English ", "sentence_after": " 2020. (depuis)", "correct_answers": ["since"], "feedback_correct": "Correct !", "feedback_incorrect": "since = point de départ."}'),
  (4, 'true_false', '{"statement": "\"For\" s''utilise avec un point de départ précis comme une année.", "correct_answer": false, "feedback_correct": "Exact, c''est since.", "feedback_incorrect": "En fait c''est faux : for s''utilise avec une durée."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Ever et never', jsonb_build_object(
  'rule', 'ever pour les questions d''expérience, never pour dire jamais.',
  'example', jsonb_build_object('en', 'Have you ever been to London?', 'fr', 'Tu es déjà allé à Londres ?')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : ___ you ever tried sushi?", "options": ["Have", "Has", "Do", "Did"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Have you ever."}'),
  (2, 'qcm', '{"question": "Complète : I have ___ seen that movie.", "options": ["ever", "never", "not", "no"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "never = jamais."}'),
  (3, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " seen that movie. (n''avons jamais vu)", "correct_answers": ["have never seen"], "feedback_correct": "Correct !", "feedback_incorrect": "have never seen."}'),
  (4, 'true_false', '{"statement": "\"I haven''t never seen it\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, double négation impossible.", "feedback_incorrect": "En fait c''est faux : \"I have never seen it\"."}')
) as v(position, type, content);

