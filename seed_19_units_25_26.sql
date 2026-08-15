-- ===== Unité 25 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Third conditional', jsonb_build_object(
  'rule', 'If + past perfect, ... would have + participe passé. Regret ou hypothèse impossible sur le passé.',
  'example', jsonb_build_object('en', 'If I had studied harder, I would have passed the exam.', 'fr', 'Si j''avais étudié plus, j''aurais réussi l''examen.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If I ___ known, I would have helped.", "options": ["have", "had", "has", "having"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Past perfect : had."}'),
  (2, 'qcm', '{"question": "Complète : She ___ have passed if she had studied.", "options": ["will", "would", "had", "has"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "would have."}'),
  (3, 'fill_blank', '{"sentence_before": "If we ", "sentence_after": " earlier, we wouldn''t have missed the train. (étions partis)", "correct_answers": ["had left"], "feedback_correct": "Correct !", "feedback_incorrect": "had left."}'),
  (4, 'true_false', '{"statement": "\"If I would have known\" est grammaticalement correct.", "correct_answer": false, "feedback_correct": "Exact, jamais would have après if.", "feedback_incorrect": "En fait c''est faux : \"If I HAD known\"."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Mixed conditionals (passé -> présent)', jsonb_build_object(
  'rule', 'Condition passée (past perfect) -> conséquence présente (would + base verbale).',
  'example', jsonb_build_object('en', 'If I had taken that job, I would be rich now.', 'fr', 'Si j''avais pris ce poste, je serais riche maintenant.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If I ___ that job, I would be rich now.", "options": ["took", "had taken", "take", "would take"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "had taken."}'),
  (2, 'qcm', '{"question": "Quelle phrase est un mixed conditional ?", "options": ["If I had studied, I would have passed", "If I had met her, my life would be different now"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Mélange passé/présent."}'),
  (3, 'fill_blank', '{"sentence_before": "If they ", "sentence_after": " earlier, they would be millionaires today. (avaient investi)", "correct_answers": ["had invested"], "feedback_correct": "Correct !", "feedback_incorrect": "had invested."}'),
  (4, 'true_false', '{"statement": "Un mixed conditional combine toujours deux temps identiques.", "correct_answer": false, "feedback_correct": "Exact, c''est le mélange qui le caractérise.", "feedback_incorrect": "En fait c''est faux : deux temps différents."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Mixed conditionals (présent -> passé)', jsonb_build_object(
  'rule', 'Condition présente/générale (past simple) -> conséquence passée (would have + participe passé).',
  'example', jsonb_build_object('en', 'If he weren''t so stubborn, he would have listened to us.', 'fr', 'S''il n''était pas si têtu, il nous aurait écoutés.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If she ___ so shy, she would have spoken up.", "options": ["wasn''t", "weren''t", "hadn''t been", "hasn''t been"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "weren''t."}'),
  (2, 'qcm', '{"question": "Cette phrase parle d''une caractéristique...", "options": ["passée uniquement", "générale/permanente"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Générale/permanente."}'),
  (3, 'fill_blank', '{"sentence_before": "If he ", "sentence_after": " so lazy, he would have finished it. (n''était pas)", "correct_answers": ["weren''t"], "feedback_correct": "Correct !", "feedback_incorrect": "weren''t."}'),
  (4, 'true_false', '{"statement": "Les mixed conditionals suivent une logique temporelle réelle de la situation.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Wish et if only avec le passé', jsonb_build_object(
  'rule', 'wish/if only + past perfect pour exprimer un regret du passé.',
  'example', jsonb_build_object('en', 'I wish I had studied harder.', 'fr', 'J''aurais aimé étudier plus.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I wish I ___ harder.", "options": ["study", "studied", "had studied", "have studied"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "wish + past perfect : had studied."}'),
  (2, 'qcm', '{"question": "\"If only I had known!\" exprime...", "options": ["un souhait futur", "un regret du passé"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Un regret du passé."}'),
  (3, 'fill_blank', '{"sentence_before": "I wish I ", "sentence_after": " your advice. (avais écouté)", "correct_answers": ["had listened to"], "feedback_correct": "Correct !", "feedback_incorrect": "had listened to."}'),
  (4, 'true_false', '{"statement": "\"Wish\" suivi du present simple exprime un regret du passé.", "correct_answer": false, "feedback_correct": "Exact, il faut le past perfect.", "feedback_incorrect": "En fait c''est faux : wish + had + participe."}')
) as v(position, type, content);

-- ===== Unité 26 =====

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26
)
insert into lessons (unit_id, position, title, content)
select u.id, 1, 'Le past perfect simple', jsonb_build_object(
  'rule', 'had + participe passé, pour une action antérieure à un autre point du passé.',
  'example', jsonb_build_object('en', 'When I arrived, she had already left.', 'fr', 'Quand je suis arrivé, elle était déjà partie.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 1
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : When I arrived, they ___ already eaten.", "options": ["have", "had", "has", "having"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "had, past perfect."}'),
  (2, 'qcm', '{"question": "Le past perfect exprime...", "options": ["une action simultanée", "une action antérieure à un point du passé"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " snow before I visited Canada. (n''avais jamais vu)", "correct_answers": ["had never seen"], "feedback_correct": "Correct !", "feedback_incorrect": "had never seen."}'),
  (4, 'true_false', '{"statement": "Le past perfect s''ancre par rapport au présent, comme le present perfect.", "correct_answer": false, "feedback_correct": "Exact, il s''ancre par rapport à un point passé.", "feedback_incorrect": "En fait c''est faux : un repère passé, pas le présent."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26
)
insert into lessons (unit_id, position, title, content)
select u.id, 2, 'Le past perfect continuous', jsonb_build_object(
  'rule', 'had been + verbe en -ing, pour une durée avant un point du passé.',
  'example', jsonb_build_object('en', 'I was tired because I had been working all day.', 'fr', 'J''étais fatigué parce que je travaillais depuis toute la journée.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 2
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She was tired because she ___ running.", "options": ["had been", "has been", "was", "had"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "had been running."}'),
  (2, 'qcm', '{"question": "Le past perfect continuous insiste sur...", "options": ["le résultat", "la durée avant un point du passé"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La durée."}'),
  (3, 'fill_blank', '{"sentence_before": "They ", "sentence_after": " for an hour when the bus arrived. (attendaient)", "correct_answers": ["had been waiting"], "feedback_correct": "Correct !", "feedback_incorrect": "had been waiting."}'),
  (4, 'true_false', '{"statement": "Le past perfect continuous se forme avec had + verbe en -ing directement.", "correct_answer": false, "feedback_correct": "Exact, il faut had BEEN.", "feedback_incorrect": "En fait c''est faux : had been + -ing."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26
)
insert into lessons (unit_id, position, title, content)
select u.id, 3, 'Connecteurs typiques (before, after, by the time)', jsonb_build_object(
  'rule', 'Ces connecteurs signalent souvent l''usage du past perfect pour marquer l''antériorité.',
  'example', jsonb_build_object('en', 'By the time we arrived, the film had already started.', 'fr', 'Le temps qu''on arrive, le film avait déjà commencé.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 3
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : By the time we arrived, the film ___ started.", "options": ["has", "had", "have", "was"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "had, antériorité."}'),
  (2, 'qcm', '{"question": "\"Before\" et \"after\" signalent souvent...", "options": ["une simultanéité", "une antériorité"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Une antériorité."}'),
  (3, 'fill_blank', '{"sentence_before": "He ", "sentence_after": " his homework before dinner. (avait fini)", "correct_answers": ["had finished"], "feedback_correct": "Correct !", "feedback_incorrect": "had finished."}'),
  (4, 'true_false', '{"statement": "\"By the time\" indique toujours une action simultanée.", "correct_answer": false, "feedback_correct": "Exact, elle indique souvent une antériorité.", "feedback_incorrect": "En fait c''est faux : plutôt une antériorité."}')
) as v(position, type, content);

with u as (
  select units.id from units
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26
)
insert into lessons (unit_id, position, title, content)
select u.id, 4, 'Construire un récit avec plusieurs niveaux temporels', jsonb_build_object(
  'rule', 'Combiner past simple (trame principale) et past perfect (retour en arrière) pour un récit riche.',
  'example', jsonb_build_object('en', 'I felt terrible. I had eaten too much at the party.', 'fr', 'Je me sentais mal. J''avais trop mangé à la fête.')
)
from u;

with l as (
  select lessons.id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 4
)
insert into exercises (lesson_id, type, position, content, is_hybrid)
select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I realized I ___ my passport.", "options": ["forgot", "had forgotten", "forget", "have forgotten"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Antériorité : had forgotten."}'),
  (2, 'qcm', '{"question": "Quelle phrase marque un retour en arrière dans un récit ?", "options": ["I went to the party", "I had already left when he called"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "had already left = retour en arrière."}'),
  (3, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " when I called. (était déjà partie)", "correct_answers": ["had already left"], "feedback_correct": "Correct !", "feedback_incorrect": "had already left."}'),
  (4, 'true_false', '{"statement": "Utiliser le past perfect dans un récit permet de clarifier l''ordre chronologique des événements.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "En fait c''est vrai."}')
) as v(position, type, content);

