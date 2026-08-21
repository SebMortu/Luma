-- ============================================
-- LUMA — Exercices de dictée à grande échelle (Unités 1-36, A1 à C1)
-- Réutilise les phrases déjà écrites et calibrées pour les exercices vocaux.
-- ============================================


-- ===== Unité 1 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "What is your name?", "sentence_fr": "Comment tu t''appelles ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This is a big house.", "sentence_fr": "C''est une grande maison."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We have a small car.", "sentence_fr": "Nous avons une petite voiture."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "They are playing outside.", "sentence_fr": "Ils jouent dehors."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I was tired yesterday.", "sentence_fr": "J''étais fatigué hier."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I visited my grandmother.", "sentence_fr": "J''ai rendu visite à ma grand-mère."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "How much water do you need?", "sentence_fr": "De combien d''eau as-tu besoin ?"}'::jsonb);
end $$;


-- ===== Unité 2 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She works in a bank.", "sentence_fr": "Elle travaille dans une banque."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Do you like coffee?", "sentence_fr": "Tu aimes le café ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We live in Paris.", "sentence_fr": "Nous vivons à Paris."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She always arrives late.", "sentence_fr": "Elle arrive toujours en retard."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He usually walks to work.", "sentence_fr": "Il marche habituellement pour aller au travail."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "My brother doesn''t like fish.", "sentence_fr": "Mon frère n''aime pas le poisson."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We study English together.", "sentence_fr": "Nous étudions l''anglais ensemble."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 2 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "How often do you exercise?", "sentence_fr": "À quelle fréquence fais-tu de l''exercice ?"}'::jsonb);
end $$;


-- ===== Unité 3 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This is an apple.", "sentence_fr": "C''est une pomme."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "There are three books here.", "sentence_fr": "Il y a trois livres ici."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I have two brothers.", "sentence_fr": "J''ai deux frères."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Is this your umbrella?", "sentence_fr": "C''est ton parapluie ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The children are playing.", "sentence_fr": "Les enfants jouent."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "There isn''t any milk left.", "sentence_fr": "Il ne reste plus de lait."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "These shoes are too small.", "sentence_fr": "Ces chaussures sont trop petites."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 3 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Is there a bank near here?", "sentence_fr": "Y a-t-il une banque près d''ici ?"}'::jsonb);
end $$;


-- ===== Unité 4 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Is that your bag?", "sentence_fr": "C''est ton sac ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "His job is very interesting.", "sentence_fr": "Son travail est très intéressant."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She hasn''t got a car.", "sentence_fr": "Elle n''a pas de voiture."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "There are many students here.", "sentence_fr": "Il y a beaucoup d''étudiants ici."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He has a few friends.", "sentence_fr": "Il a quelques amis."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Their dog is really friendly.", "sentence_fr": "Leur chien est vraiment gentil."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Have you got any brothers?", "sentence_fr": "Tu as des frères ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 4 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "How many eggs are there?", "sentence_fr": "Combien y a-t-il d''œufs ?"}'::jsonb);
end $$;


-- ===== Unité 5 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I am cooking dinner right now.", "sentence_fr": "Je prépare le dîner en ce moment."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We are waiting for the bus.", "sentence_fr": "Nous attendons le bus."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "What are you doing tonight?", "sentence_fr": "Qu''est-ce que tu fais ce soir ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s writing an email.", "sentence_fr": "Elle écrit un email."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Look! It''s raining outside.", "sentence_fr": "Regarde ! Il pleut dehors."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Are they coming to the party?", "sentence_fr": "Ils viennent à la fête ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s not feeling well today.", "sentence_fr": "Elle ne se sent pas bien aujourd''hui."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 5 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "They are still waiting outside.", "sentence_fr": "Ils attendent toujours dehors."}'::jsonb);
end $$;


-- ===== Unité 6 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She worked at a hospital.", "sentence_fr": "Elle a travaillé dans un hôpital."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I didn''t sleep well last night.", "sentence_fr": "Je n''ai pas bien dormi la nuit dernière."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "They had a great time.", "sentence_fr": "Ils ont passé un bon moment."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She bought a new dress.", "sentence_fr": "Elle a acheté une nouvelle robe."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Where were you yesterday?", "sentence_fr": "Où étais-tu hier ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "They ate dinner together.", "sentence_fr": "Ils ont dîné ensemble."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I finished my homework early.", "sentence_fr": "J''ai fini mes devoirs tôt."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 6 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We didn''t have any problems.", "sentence_fr": "Nous n''avons eu aucun problème."}'::jsonb);
end $$;


-- ===== Unité 7 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I have already finished.", "sentence_fr": "J''ai déjà fini."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I have never tried sushi.", "sentence_fr": "Je n''ai jamais essayé de sushi."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We haven''t seen that movie yet.", "sentence_fr": "Nous n''avons pas encore vu ce film."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I have lived here for five years.", "sentence_fr": "J''habite ici depuis cinq ans."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''ve known her for a long time.", "sentence_fr": "Je la connais depuis longtemps."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "They haven''t decided yet.", "sentence_fr": "Ils n''ont pas encore décidé."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This is the best film I''ve ever seen.", "sentence_fr": "C''est le meilleur film que j''aie jamais vu."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 7 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''ve just finished my coffee.", "sentence_fr": "Je viens de finir mon café."}'::jsonb);
end $$;


-- ===== Unité 8 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I have three apples and two bananas.", "sentence_fr": "J''ai trois pommes et deux bananes."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She is taller than her brother.", "sentence_fr": "Elle est plus grande que son frère."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This is the biggest city in the country.", "sentence_fr": "C''est la plus grande ville du pays."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This test isn''t as difficult as I thought.", "sentence_fr": "Ce test n''est pas aussi difficile que je le pensais."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I need less sugar in my coffee.", "sentence_fr": "J''ai besoin de moins de sucre dans mon café."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "That was the worst movie I''ve seen.", "sentence_fr": "C''était le pire film que j''ai vu."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He earns twice as much as me.", "sentence_fr": "Il gagne deux fois plus que moi."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 8 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Which one is the best option?", "sentence_fr": "Laquelle est la meilleure option ?"}'::jsonb);
end $$;


-- ===== Unité 9 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She won''t be here tonight.", "sentence_fr": "Elle ne sera pas là ce soir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Are you going to finish this today?", "sentence_fr": "Tu vas finir ça aujourd''hui ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The meeting starts next Monday.", "sentence_fr": "La réunion commence lundi prochain."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''ll help you if you need it.", "sentence_fr": "Je t''aiderai si tu en as besoin."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "By next year, I will have graduated.", "sentence_fr": "D''ici l''année prochaine, j''aurai obtenu mon diplôme."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I hope it won''t rain tomorrow.", "sentence_fr": "J''espère qu''il ne pleuvra pas demain."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He''ll be working when you arrive.", "sentence_fr": "Il sera en train de travailler quand tu arriveras."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 9 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''m thinking of learning to cook.", "sentence_fr": "Je pense apprendre à cuisiner."}'::jsonb);
end $$;


-- ===== Unité 10 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Things are getting worse every day.", "sentence_fr": "Les choses empirent chaque jour."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The more you practice, the better you get.", "sentence_fr": "Plus tu pratiques, mieux tu deviens."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She sings as beautifully as a professional.", "sentence_fr": "Elle chante aussi bien qu''une professionnelle."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It''s one of the most beautiful places I know.", "sentence_fr": "C''est l''un des plus beaux endroits que je connaisse."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "My phone is similar to yours.", "sentence_fr": "Mon téléphone est similaire au tien."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The weather today is much colder than yesterday.", "sentence_fr": "Le temps aujourd''hui est bien plus froid qu''hier."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He is the tallest person in his family.", "sentence_fr": "C''est la personne la plus grande de sa famille."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 10 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Which do you prefer, tea or coffee?", "sentence_fr": "Tu préfères quoi, le thé ou le café ?"}'::jsonb);
end $$;


-- ===== Unité 11 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "You must wear a seatbelt.", "sentence_fr": "Tu dois porter une ceinture de sécurité."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She can''t drive yet.", "sentence_fr": "Elle ne sait pas encore conduire."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "You could try calling her first.", "sentence_fr": "Tu pourrais essayer de l''appeler d''abord."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We shouldn''t waste so much food.", "sentence_fr": "Nous ne devrions pas gaspiller autant de nourriture."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "May I ask you a question?", "sentence_fr": "Puis-je te poser une question ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "You don''t have to come if you''re busy.", "sentence_fr": "Tu n''es pas obligé de venir si tu es occupé."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She might not come to the meeting.", "sentence_fr": "Elle pourrait ne pas venir à la réunion."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 11 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I would love to join you.", "sentence_fr": "J''adorerais me joindre à vous."}'::jsonb);
end $$;


-- ===== Unité 12 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She has lived in Paris since 2015.", "sentence_fr": "Elle vit à Paris depuis 2015."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Have you ever eaten sushi before?", "sentence_fr": "As-tu déjà mangé des sushis auparavant ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We haven''t started yet.", "sentence_fr": "Nous n''avons pas encore commencé."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Has he called you back already?", "sentence_fr": "Il t''a déjà rappelé ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It''s the first time she''s driven a car.", "sentence_fr": "C''est la première fois qu''elle conduit une voiture."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He''s been studying all afternoon.", "sentence_fr": "Il étudie depuis tout l''après-midi."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Have you finished reading that book yet?", "sentence_fr": "As-tu fini de lire ce livre ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 12 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''ve traveled to five different countries.", "sentence_fr": "J''ai voyagé dans cinq pays différents."}'::jsonb);
end $$;


-- ===== Unité 13 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The park is between the school and the library.", "sentence_fr": "Le parc est entre l''école et la bibliothèque."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Turn left at the traffic light.", "sentence_fr": "Tourne à gauche au feu."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''ll call you after the meeting.", "sentence_fr": "Elle t''appellera après la réunion."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We stayed there during the summer.", "sentence_fr": "Nous sommes restés là pendant l''été."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "There''s a lamp above the desk.", "sentence_fr": "Il y a une lampe au-dessus du bureau."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The road goes around the lake.", "sentence_fr": "La route contourne le lac."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The event takes place in the main hall.", "sentence_fr": "L''événement se déroule dans la salle principale."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 13 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She arrived just in time.", "sentence_fr": "Elle est arrivée juste à temps."}'::jsonb);
end $$;


-- ===== Unité 14 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It''s probably going to rain.", "sentence_fr": "Il va probablement pleuvoir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The movie was rather boring.", "sentence_fr": "Le film était plutôt ennuyeux."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I somewhat agree with you.", "sentence_fr": "Je suis quelque peu d''accord avec toi."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I don''t completely understand this.", "sentence_fr": "Je ne comprends pas complètement ça."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Actually, I think you''re wrong.", "sentence_fr": "En fait, je pense que tu as tort."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It seems like a good idea.", "sentence_fr": "Ça semble être une bonne idée."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "In a way, this makes things easier.", "sentence_fr": "D''une certaine façon, ça facilite les choses."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 14 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s more or less finished the project.", "sentence_fr": "Elle a plus ou moins fini le projet."}'::jsonb);
end $$;


-- ===== Unité 15 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Sorry, I didn''t catch that.", "sentence_fr": "Désolé, je n''ai pas saisi."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Could you explain that differently?", "sentence_fr": "Pourrais-tu expliquer ça différemment ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I see your point, but I disagree.", "sentence_fr": "Je comprends ton point de vue, mais je ne suis pas d''accord."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''m really impressed by your work.", "sentence_fr": "Je suis vraiment impressionné par ton travail."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''m sorry for being late.", "sentence_fr": "Je suis désolé d''être en retard."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Would you mind closing the door?", "sentence_fr": "Ça te dérangerait de fermer la porte ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Let''s meet up sometime next week.", "sentence_fr": "Retrouvons-nous un jour la semaine prochaine."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 15 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I really appreciate everything you''ve done.", "sentence_fr": "J''apprécie vraiment tout ce que tu as fait."}'::jsonb);
end $$;


-- ===== Unité 16 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Is service included in the price?", "sentence_fr": "Le service est-il inclus dans le prix ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I need a prescription for this.", "sentence_fr": "J''ai besoin d''une ordonnance pour ça."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Is this seat taken?", "sentence_fr": "Cette place est-elle prise ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "My phone battery is almost dead.", "sentence_fr": "La batterie de mon téléphone est presque morte."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Could you recommend a good hotel?", "sentence_fr": "Pourriez-vous recommander un bon hôtel ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Can I pay by card?", "sentence_fr": "Je peux payer par carte ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "What time does the store close?", "sentence_fr": "À quelle heure ferme le magasin ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 16 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Could you send me the invoice?", "sentence_fr": "Pourriez-vous m''envoyer la facture ?"}'::jsonb);
end $$;


-- ===== Unité 17 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s been studying for three hours.", "sentence_fr": "Elle étudie depuis trois heures."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''ve been trying to reach you all day.", "sentence_fr": "J''essaie de te joindre toute la journée."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "They''ve been living abroad for years.", "sentence_fr": "Ils vivent à l''étranger depuis des années."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s tired because she''s been running.", "sentence_fr": "Elle est fatiguée parce qu''elle a couru."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Have you been feeling okay lately?", "sentence_fr": "Tu te sens bien ces derniers temps ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We''ve been planning this trip for months.", "sentence_fr": "Nous préparons ce voyage depuis des mois."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''ve been meaning to call you.", "sentence_fr": "Je comptais t''appeler."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 17 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''ve been thinking about changing jobs.", "sentence_fr": "Je pense à changer de travail."}'::jsonb);
end $$;


-- ===== Unité 18 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I was walking home when it started to rain.", "sentence_fr": "Je rentrais à pied quand il a commencé à pleuvoir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She had finished her homework before dinner.", "sentence_fr": "Elle avait fini ses devoirs avant le dîner."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "While I was reading, my sister was watching TV.", "sentence_fr": "Pendant que je lisais, ma sœur regardait la télé."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Once she finished, she went straight to bed.", "sentence_fr": "Une fois qu''elle a fini, elle est allée directement se coucher."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I used to live in a small village.", "sentence_fr": "J''habitais autrefois dans un petit village."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He hadn''t finished eating when the bell rang.", "sentence_fr": "Il n''avait pas fini de manger quand la sonnerie a retenti."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The story took place a long time ago.", "sentence_fr": "L''histoire se déroulait il y a longtemps."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 18 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "In the end, everything turned out fine.", "sentence_fr": "Finalement, tout s''est bien terminé."}'::jsonb);
end $$;


-- ===== Unité 19 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "If you study hard, you will pass.", "sentence_fr": "Si tu étudies dur, tu réussiras."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "If she were here, she would help us.", "sentence_fr": "Si elle était là, elle nous aiderait."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "What would you do if you won the lottery?", "sentence_fr": "Que ferais-tu si tu gagnais à la loterie ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I won''t come unless you invite me.", "sentence_fr": "Je ne viendrai pas à moins que tu m''invites."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "As long as you''re happy, that''s what matters.", "sentence_fr": "Tant que tu es heureux, c''est ce qui compte."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "If I were you, I would apologize.", "sentence_fr": "À ta place, je m''excuserais."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "In case it rains, bring an umbrella.", "sentence_fr": "Au cas où il pleuvrait, prends un parapluie."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 19 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "What if we just stayed home tonight?", "sentence_fr": "Et si on restait à la maison ce soir ?"}'::jsonb);
end $$;


-- ===== Unité 20 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This house was built in 1920.", "sentence_fr": "Cette maison a été construite en 1920."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The road is being repaired this week.", "sentence_fr": "La route est en cours de réparation cette semaine."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The project has been completed successfully.", "sentence_fr": "Le projet a été achevé avec succès."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The report will be finished by Friday.", "sentence_fr": "Le rapport sera terminé d''ici vendredi."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "English is spoken in many countries.", "sentence_fr": "L''anglais est parlé dans de nombreux pays."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The window was broken by the storm.", "sentence_fr": "La fenêtre a été cassée par la tempête."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Visitors are asked to remain quiet.", "sentence_fr": "Les visiteurs sont priés de rester silencieux."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 20 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It is said that the house is haunted.", "sentence_fr": "On dit que la maison est hantée."}'::jsonb);
end $$;


-- ===== Unité 21 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He told me he would call later.", "sentence_fr": "Il m''a dit qu''il appellerait plus tard."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He asked if I was coming to the party.", "sentence_fr": "Il a demandé si je venais à la fête."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "My mother told me not to worry.", "sentence_fr": "Ma mère m''a dit de ne pas m''inquiéter."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She mentioned that she had visited Rome.", "sentence_fr": "Elle a mentionné qu''elle avait visité Rome."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "They said they were leaving the next day.", "sentence_fr": "Ils ont dit qu''ils partaient le lendemain."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She wondered whether it would rain.", "sentence_fr": "Elle se demandait s''il allait pleuvoir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She claims that she wasn''t there.", "sentence_fr": "Elle prétend qu''elle n''était pas là."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 21 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She promised she would help us.", "sentence_fr": "Elle a promis qu''elle nous aiderait."}'::jsonb);
end $$;


-- ===== Unité 22 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The book that I read was amazing.", "sentence_fr": "Le livre que j''ai lu était incroyable."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I remember the day when we first met.", "sentence_fr": "Je me souviens du jour où on s''est rencontrés."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She succeeded despite the difficulties.", "sentence_fr": "Elle a réussi malgré les difficultés."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Since it''s late, let''s go home.", "sentence_fr": "Puisqu''il est tard, rentrons."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She studies hard so that she can succeed.", "sentence_fr": "Elle étudie dur pour pouvoir réussir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She was too tired to continue working.", "sentence_fr": "Elle était trop fatiguée pour continuer à travailler."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Both my sister and I love music.", "sentence_fr": "Ma sœur et moi aimons tous les deux la musique."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 22 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Either we leave now or we''ll be late.", "sentence_fr": "Soit on part maintenant, soit on sera en retard."}'::jsonb);
end $$;


-- ===== Unité 23 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I enjoy reading before bed.", "sentence_fr": "J''aime lire avant de dormir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I want to learn a new language.", "sentence_fr": "Je veux apprendre une nouvelle langue."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I stopped smoking two years ago.", "sentence_fr": "J''ai arrêté de fumer il y a deux ans."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Remember to lock the door before leaving.", "sentence_fr": "Souviens-toi de fermer la porte avant de partir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I regret to inform you of the delay.", "sentence_fr": "J''ai le regret de vous informer du retard."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She let her children stay up late.", "sentence_fr": "Elle a laissé ses enfants veiller tard."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''d rather stay home tonight.", "sentence_fr": "Je préfère rester à la maison ce soir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 23 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s used to working long hours.", "sentence_fr": "Elle a l''habitude de travailler de longues heures."}'::jsonb);
end $$;


-- ===== Unité 24 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She can''t have known about this.", "sentence_fr": "Elle n''a pas pu être au courant de ça."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "They could have called us earlier.", "sentence_fr": "Ils auraient pu nous appeler plus tôt."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "You should have told me sooner.", "sentence_fr": "Tu aurais dû me le dire plus tôt."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She needn''t have worried so much.", "sentence_fr": "Elle n''avait pas besoin de tant s''inquiéter."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This can''t be right.", "sentence_fr": "Ça ne peut pas être juste."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She may have already left.", "sentence_fr": "Elle est peut-être déjà partie."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "You ought to apologize to her.", "sentence_fr": "Tu devrais t''excuser auprès d''elle."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 24 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''d rather you didn''t tell anyone.", "sentence_fr": "Je préférerais que tu ne le dises à personne."}'::jsonb);
end $$;


-- ===== Unité 25 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "If I had known, I wouldn''t have come.", "sentence_fr": "Si j''avais su, je ne serais pas venu."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Had I known the truth, I would have acted differently.", "sentence_fr": "Si j''avais su la vérité, j''aurais agi différemment."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I wouldn''t have called if I hadn''t been worried.", "sentence_fr": "Je n''aurais pas appelé si je n''avais pas été inquiet."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "If I won the lottery, I would quit my job.", "sentence_fr": "Si je gagnais à la loterie, je quitterais mon travail."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Mixed conditional: if I had studied medicine, I would be a doctor now.", "sentence_fr": "Conditionnel mixte : si j''avais étudié la médecine, je serais médecin maintenant."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Without your support, this wouldn''t have been possible.", "sentence_fr": "Sans ton soutien, ça n''aurait pas été possible."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I wish I had studied harder in school.", "sentence_fr": "J''aimerais avoir étudié plus dur à l''école."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 25 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "If only I had listened to my parents.", "sentence_fr": "Si seulement j''avais écouté mes parents."}'::jsonb);
end $$;


-- ===== Unité 26 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He had already left when I called.", "sentence_fr": "Il était déjà parti quand j''ai appelé."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I had never seen such a beautiful sunset before.", "sentence_fr": "Je n''avais jamais vu un si beau coucher de soleil avant."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Once he had finished eating, he left the table.", "sentence_fr": "Une fois qu''il avait fini de manger, il a quitté la table."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Hardly had she sat down when the phone rang.", "sentence_fr": "À peine s''était-elle assise que le téléphone a sonné."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I realized I had made a terrible mistake.", "sentence_fr": "J''ai réalisé que j''avais fait une terrible erreur."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The house looked exactly as it had before the fire.", "sentence_fr": "La maison ressemblait exactement à ce qu''elle était avant l''incendie."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "If only I hadn''t wasted so much time.", "sentence_fr": "Si seulement je n''avais pas gaspillé autant de temps."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 26 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The letter that had arrived that morning changed everything.", "sentence_fr": "La lettre arrivée ce matin-là a tout changé."}'::jsonb);
end $$;


-- ===== Unité 27 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She was offered a promotion last month.", "sentence_fr": "On lui a offert une promotion le mois dernier."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He is thought to be the best candidate.", "sentence_fr": "Il est considéré comme le meilleur candidat."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The building needs to be renovated.", "sentence_fr": "Le bâtiment a besoin d''être rénové."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Being asked to leave, she felt embarrassed.", "sentence_fr": "S''étant fait demander de partir, elle s''est sentie gênée."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The project is said to be finished by June.", "sentence_fr": "Le projet est censé être terminé d''ici juin."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It is rumored that the company will close.", "sentence_fr": "On raconte que l''entreprise va fermer."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Get your car washed before the trip.", "sentence_fr": "Fais laver ta voiture avant le voyage."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 27 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The decision was made without consulting us.", "sentence_fr": "La décision a été prise sans nous consulter."}'::jsonb);
end $$;


-- ===== Unité 28 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "On the one hand, it''s expensive; on the other hand, it''s worth it.", "sentence_fr": "D''un côté c''est cher, de l''autre ça en vaut la peine."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This clearly demonstrates that change is needed.", "sentence_fr": "Cela démontre clairement qu''un changement est nécessaire."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Moreover, the results speak for themselves.", "sentence_fr": "De plus, les résultats parlent d''eux-mêmes."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "However, there are some drawbacks to consider.", "sentence_fr": "Cependant, il y a quelques inconvénients à considérer."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This raises an important question about ethics.", "sentence_fr": "Cela soulève une question importante sur l''éthique."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Proponents claim it will boost the economy.", "sentence_fr": "Les partisans affirment que ça stimulera l''économie."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "To sum up, we need a more sustainable approach.", "sentence_fr": "Pour résumer, nous avons besoin d''une approche plus durable."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 28 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It could be argued that the results are misleading.", "sentence_fr": "On pourrait soutenir que les résultats sont trompeurs."}'::jsonb);
end $$;


-- ===== Unité 29 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I''m feeling under the weather today.", "sentence_fr": "Je ne me sens pas très bien aujourd''hui."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Let''s not beat around the bush.", "sentence_fr": "N''y allons pas par quatre chemins."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "That''s the last straw for me.", "sentence_fr": "C''est la goutte d''eau qui fait déborder le vase."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Let''s just wing it tonight.", "sentence_fr": "Improvisons ce soir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He''s always been a bit of a night owl.", "sentence_fr": "Il a toujours été un peu couche-tard."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Every cloud has a silver lining.", "sentence_fr": "Après la pluie vient le beau temps."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Let''s think outside the box on this one.", "sentence_fr": "Pensons différemment pour celui-ci."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 29 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s got a lot on her plate right now.", "sentence_fr": "Elle a beaucoup de choses à gérer en ce moment."}'::jsonb);
end $$;


-- ===== Unité 30 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "You must be joking!", "sentence_fr": "Tu dois plaisanter !"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She may well be right about this.", "sentence_fr": "Elle a bien pu avoir raison là-dessus."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "You could at least say thank you.", "sentence_fr": "Tu pourrais au moins dire merci."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He needn''t have bothered coming.", "sentence_fr": "Il n''avait pas besoin de se donner la peine de venir."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I daresay she''ll be there.", "sentence_fr": "J''ose dire qu''elle sera là."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It stands to reason that prices will rise.", "sentence_fr": "Il est logique que les prix augmentent."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We may as well try, we have nothing to lose.", "sentence_fr": "Autant essayer, on n''a rien à perdre."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 30 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She would never have guessed the outcome.", "sentence_fr": "Elle n''aurait jamais deviné le résultat."}'::jsonb);
end $$;


-- ===== Unité 31 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It was John who broke the window.", "sentence_fr": "C''est John qui a cassé la fenêtre."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "What surprised me was her honesty.", "sentence_fr": "Ce qui m''a surpris, c''est son honnêteté."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Rarely do we get such an opportunity.", "sentence_fr": "Rarement avons-nous une telle opportunité."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Little did I know what awaited me.", "sentence_fr": "Je ne savais pas du tout ce qui m''attendait."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Such was her determination that nothing stopped her.", "sentence_fr": "Telle était sa détermination que rien ne l''arrêtait."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Do come and visit us sometime.", "sentence_fr": "Viens vraiment nous rendre visite un jour."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It was only then that I realized my mistake.", "sentence_fr": "Ce n''est qu''alors que j''ai réalisé mon erreur."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 31 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "All she did was apologize.", "sentence_fr": "Tout ce qu''elle a fait, c''est s''excuser."}'::jsonb);
end $$;


-- ===== Unité 32 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She hinted that she might resign.", "sentence_fr": "Elle a laissé entendre qu''elle pourrait démissionner."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She regretted not having told the truth sooner.", "sentence_fr": "Elle a regretté de ne pas avoir dit la vérité plus tôt."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Witnesses testified that they had seen nothing.", "sentence_fr": "Les témoins ont témoigné n''avoir rien vu."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The doctor recommended that he rest for a week.", "sentence_fr": "Le médecin a recommandé qu''il se repose une semaine."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She confessed that she had never really liked him.", "sentence_fr": "Elle a avoué qu''elle ne l''avait en fait jamais vraiment aimé."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Experts warned that the situation could worsen.", "sentence_fr": "Les experts ont averti que la situation pourrait empirer."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He observed that attitudes were changing.", "sentence_fr": "Il a observé que les attitudes changeaient."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 32 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It was rumored that the deal had fallen through.", "sentence_fr": "On racontait que l''accord était tombé à l''eau."}'::jsonb);
end $$;


-- ===== Unité 33 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "What I really admire about her is her patience.", "sentence_fr": "Ce que j''admire vraiment chez elle, c''est sa patience."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It was in Paris that we first met.", "sentence_fr": "C''est à Paris que nous nous sommes rencontrés pour la première fois."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The place where I grew up has changed completely.", "sentence_fr": "L''endroit où j''ai grandi a complètement changé."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "What happened next was completely unexpected.", "sentence_fr": "Ce qui s''est passé ensuite était totalement inattendu."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "All that matters now is your recovery.", "sentence_fr": "Tout ce qui compte maintenant, c''est ta guérison."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It''s her confidence that I find most striking.", "sentence_fr": "C''est sa confiance que je trouve la plus frappante."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "The only person who understood was my sister.", "sentence_fr": "La seule personne qui a compris, c''était ma sœur."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 33 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "It''s not that I don''t care, it''s that I''m busy.", "sentence_fr": "Ce n''est pas que ça ne m''intéresse pas, c''est que je suis occupé."}'::jsonb);
end $$;


-- ===== Unité 34 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She really knows how to read the room.", "sentence_fr": "Elle sait vraiment cerner l''ambiance d''un groupe."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Let''s not reinvent the wheel here.", "sentence_fr": "Ne réinventons pas la roue ici."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "He always seems to be walking on eggshells.", "sentence_fr": "Il semble toujours marcher sur des œufs."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s been burning the candle at both ends lately.", "sentence_fr": "Elle se surmène beaucoup ces derniers temps."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She always manages to read between the lines.", "sentence_fr": "Elle arrive toujours à lire entre les lignes."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "This decision could open a can of worms.", "sentence_fr": "Cette décision pourrait ouvrir une boîte de Pandore."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "She''s always been the black sheep of the family.", "sentence_fr": "Elle a toujours été le mouton noir de la famille."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 34 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "That''s the elephant in the room nobody mentions.", "sentence_fr": "C''est le sujet tabou que personne n''aborde."}'::jsonb);
end $$;


-- ===== Unité 35 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Hey, can we push our meeting back a bit?", "sentence_fr": "Hé, on peut décaler notre réunion un peu ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Thanks a ton, you really saved me there!", "sentence_fr": "Merci mille fois, tu m''as vraiment sauvé là !"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "We regret to inform you of the cancellation.", "sentence_fr": "Nous avons le regret de vous informer de l''annulation."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Should you require further information, please contact us.", "sentence_fr": "Si vous avez besoin de plus d''informations, contactez-nous."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "I beg to differ on this particular matter.", "sentence_fr": "Je me permets de ne pas être d''accord sur ce point précis."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "You might wanna rethink that, honestly.", "sentence_fr": "Tu devrais peut-être reconsidérer ça, honnêtement."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Kindly find attached the requested documents.", "sentence_fr": "Veuillez trouver ci-joint les documents demandés."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 35 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Hope you''re doing okay!", "sentence_fr": "J''espère que tu vas bien !"}'::jsonb);
end $$;


-- ===== Unité 36 =====


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 1;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Well, you know, it''s kind of complicated.", "sentence_fr": "Bon, tu sais, c''est un peu compliqué."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 2;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Right, so basically, here''s the plan.", "sentence_fr": "Bon, donc en gros, voici le plan."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 3;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "That''s actually a really good point.", "sentence_fr": "C''est en fait un très bon point."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 4;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Sorry, could you say that again?", "sentence_fr": "Désolé, tu pourrais redire ça ?"}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 5;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "To be honest, I wasn''t expecting that.", "sentence_fr": "Pour être honnête, je m''attendais pas à ça."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 6;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "At the end of the day, it doesn''t really matter.", "sentence_fr": "En fin de compte, ça n''a pas vraiment d''importance."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 7;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "If you ask me, we should just go for it.", "sentence_fr": "Si tu veux mon avis, on devrait juste se lancer."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 36 and lessons.position = 8;

  if v_lesson_id is null then return; end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot := floor(v_count * 2 * 0.5)::int;
  if v_slot % 2 = 0 then v_slot := v_slot + 1; end if;
  v_slot := greatest(v_slot, 1);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'dictation', v_slot, '{"sentence": "Anyway, that''s pretty much it for today.", "sentence_fr": "Bref, c''est à peu près tout pour aujourd''hui."}'::jsonb);
end $$;
