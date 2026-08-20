-- ============================================
-- LUMA — Correctifs consolidés : audit exercices (A1-C1) + audit oral
-- ============================================

-- 1) Bug "m" sans apostrophe (Unité 1, A1)
update exercises
set content = jsonb_set(content, '{correct_answers}', '["am", "''m"]'::jsonb)
where content->>'sentence_before' = 'I '
  and content->>'sentence_after' = ' not ready yet.';

-- 2) QCM avec option méta ambiguë (Unité 8, A1) — reformulé sans ambiguïté
update exercises
set content = jsonb_set(
  jsonb_set(content, '{question}', '"Complète : We ___ (not, work) on Sundays."'::jsonb),
  '{options}', '["don''t work", "aren''t working", "doesn''t work", "not working"]'::jsonb
)
where content->>'question' = 'Complète : We ___ (not, work) today.';
-- correct_index reste à 0 ("don't work"), désormais sans ambiguïté (habitude claire avec "on Sundays")

-- 3) Distracteur trop faible "will visited" (Unité 9, A2)
update exercises
set content = jsonb_set(content, '{options}', '["am visiting", "visit", "visited", "will visit"]'::jsonb)
where content->>'question' = 'Complète : I ___ my sister this weekend.'
  and content->'options' ? 'will visited';

-- 4) Clé JSON parasite "affirmative" (Unité 31, C1)
update exercises
set content = content - 'affirmative'
where content->>'question' = 'Complète : Hardly ___ I arrived when it started raining.';

-- 5) Option QCM dupliquée "leaded" (Unité 12, A2)
update exercises
set content = jsonb_set(content, '{options}', '["leaded", "led", "leds", "leading"]'::jsonb)
where content->>'question' = 'Quel est le participe passé de "lead" ?';

-- 6) Exercices "matching" à une seule paire (Unités 19, 20 x2, 22) — étoffés à 3 paires
update exercises
set content = jsonb_set(content, '{pairs}', '[
  {"left": "Unless you hurry, you''ll be late.", "right": "If you don''t hurry, you''ll be late."},
  {"left": "Unless it rains, we''ll go out.", "right": "If it doesn''t rain, we''ll go out."},
  {"left": "Unless you study, you won''t pass.", "right": "If you don''t study, you won''t pass."}
]'::jsonb)
where content->>'instruction' = 'Relie la phrase avec "unless" à son équivalent avec "if".';

update exercises
set content = jsonb_set(content, '{pairs}', '[
  {"left": "They will announce the results.", "right": "The results will be announced."},
  {"left": "They will publish the report.", "right": "The report will be published."},
  {"left": "They will cancel the event.", "right": "The event will be cancelled."}
]'::jsonb)
where content->>'instruction' = 'Relie la phrase active à sa version passive future.';

update exercises
set content = jsonb_set(content, '{pairs}', '[
  {"left": "They have finished the work.", "right": "The work has been finished."},
  {"left": "They have solved the problem.", "right": "The problem has been solved."},
  {"left": "They have built the bridge.", "right": "The bridge has been built."}
]'::jsonb)
where content->>'instruction' = 'Relie l''action active à sa version passive.';

update exercises
set content = jsonb_set(content, '{pairs}', '[
  {"left": "the person to whom I wrote", "right": "the person I wrote to"},
  {"left": "the company for which I work", "right": "the company I work for"},
  {"left": "the topic about which we spoke", "right": "the topic we spoke about"}
]'::jsonb)
where content->>'instruction' = 'Relie la version formelle à l''informelle.';

-- 7) Bug "Mixed conditional:" collé dans la phrase vocale (Unité 25-26, B2)
update exercises
set content = jsonb_set(content, '{sentence}', '"If I had studied medicine, I would be a doctor now."'::jsonb)
where content->>'sentence' = 'Mixed conditional: if I had studied medicine, I would be a doctor now.';

-- 8) Ajout d'exercices de PRODUCTION pour l'Unité 36 (C1, Fluidité conversationnelle)
-- Recommandation de l'audit : cette unité reposait presque uniquement sur de la
-- reconnaissance passive (QCM "que veut dire X ?"). On ajoute 4 exercices fill_blank
-- qui exigent de produire soi-même le connecteur adapté, pas seulement de le reconnaître.
do $$
declare
  v_lesson_id uuid;
  v_max_pos int;
begin
  select lessons.id into v_lesson_id from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 1;

  select coalesce(max(position), 0) into v_max_pos from exercises where lesson_id = v_lesson_id;

  insert into exercises (lesson_id, position, type, content) values
    (v_lesson_id, v_max_pos + 1, 'fill_blank', '{"sentence_before": "I see your point, but ", "sentence_after": ", I still think we should wait.", "correct_answers": ["that said", "having said that"], "feedback_correct": "Correct ! Tu introduis bien une nuance polie.", "feedback_incorrect": "Pour nuancer poliment après avoir reconnu un point, on dit \"that said\" ou \"having said that\"."}'::jsonb),
    (v_lesson_id, v_max_pos + 2, 'fill_blank', '{"sentence_before": "", "sentence_after": ", we need to cut costs somewhere.", "correct_answers": ["in other words", "put simply"], "feedback_correct": "Correct ! Bonne reformulation.", "feedback_incorrect": "Pour reformuler plus simplement, on dit \"in other words\" ou \"put simply\"."}'::jsonb),
    (v_lesson_id, v_max_pos + 3, 'fill_blank', '{"sentence_before": "", "sentence_after": ", I think we should try a different approach entirely.", "correct_answers": ["here''s the thing", "the thing is"], "feedback_correct": "Correct ! Tu introduis bien un point important.", "feedback_incorrect": "Pour introduire un point clé, on dit \"here''s the thing\" ou \"the thing is\"."}'::jsonb),
    (v_lesson_id, v_max_pos + 4, 'fill_blank', '{"sentence_before": "We both want this project to succeed, so let''s try to ", "sentence_after": ".", "correct_answers": ["meet halfway", "find a compromise", "find some common ground"], "feedback_correct": "Correct ! Tu proposes bien un compromis.", "feedback_incorrect": "Pour proposer un compromis, on dit \"meet halfway\" ou \"find a compromise\"."}'::jsonb);
end $$;

-- select content from exercises where content->>'sentence_before' = 'I ' and content->>'sentence_after' = ' not ready yet.';
-- select content from exercises where content->>'question' like 'Complète : We ___ (not, work)%';
-- select content from exercises where content->>'question' = 'Complète : I ___ my sister this weekend.';
-- select content from exercises where content->>'question' like 'Complète : Hardly%';
-- select content from exercises where content->>'question' like '%participe passé de "lead"%';
-- select content from exercises where content->>'instruction' like 'Relie%unless%';
-- select content from exercises where content->>'sentence' like 'If I had studied medicine%';
