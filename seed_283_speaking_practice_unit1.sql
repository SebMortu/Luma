-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' pour l'Unité 1 (Leçons 2 à 8)
-- Insertion dynamique et sans risque : les positions existantes sont doublées
-- (créant des espaces impairs), puis les exercices vocaux sont placés dans ces
-- espaces, entrelacés dès la création — quel que soit le nombre d'exercices déjà présents.
-- ============================================


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot1 int;
  v_slot2 int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 1 / position 2 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;

  -- Double les positions existantes pour créer des espaces impairs libres
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  -- Calcule deux emplacements impairs répartis (~1/3 et ~2/3 de la leçon)
  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What is your name?", "sentence_fr": "Comment tu t''appelles ?", "tip": "Prononce bien \"what\" avec un son \"w\" net."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She is my friend.", "sentence_fr": "Elle est mon amie.", "tip": "Le \"she\" se prononce avec un \"sh\" doux, pas un \"s\"."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot1 int;
  v_slot2 int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 1 / position 3 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;

  -- Double les positions existantes pour créer des espaces impairs libres
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  -- Calcule deux emplacements impairs répartis (~1/3 et ~2/3 de la leçon)
  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This is a big house.", "sentence_fr": "C''est une grande maison.", "tip": "Le \"th\" de \"this\" se prononce en plaçant la langue entre les dents."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "They are very happy.", "sentence_fr": "Ils sont très heureux.", "tip": "Le \"th\" de \"they\" est sonore, fais vibrer ta gorge."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot1 int;
  v_slot2 int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 1 / position 4 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;

  -- Double les positions existantes pour créer des espaces impairs libres
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  -- Calcule deux emplacements impairs répartis (~1/3 et ~2/3 de la leçon)
  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This is my book.", "sentence_fr": "C''est mon livre.", "tip": "Distingue bien \"this\" (proche) et \"that\" (loin)."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We have a small car.", "sentence_fr": "Nous avons une petite voiture.", "tip": "Le \"h\" de \"have\" est aspiré, on l''entend légèrement."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot1 int;
  v_slot2 int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 1 / position 5 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;

  -- Double les positions existantes pour créer des espaces impairs libres
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  -- Calcule deux emplacements impairs répartis (~1/3 et ~2/3 de la leçon)
  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I am reading a book now.", "sentence_fr": "Je lis un livre en ce moment.", "tip": "Enchaîne \"I am\" naturellement, presque comme \"I''m\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "They are playing outside.", "sentence_fr": "Ils jouent dehors.", "tip": "Le \"-ing\" final se prononce \"igne\", sans trop insister sur le \"g\"."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot1 int;
  v_slot2 int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 1 / position 6 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;

  -- Double les positions existantes pour créer des espaces impairs libres
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  -- Calcule deux emplacements impairs répartis (~1/3 et ~2/3 de la leçon)
  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I was tired yesterday.", "sentence_fr": "J''étais fatigué hier.", "tip": "\"Was\" se prononce avec un \"w\" doux et un \"z\" à la fin."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We were at home.", "sentence_fr": "Nous étions à la maison.", "tip": "\"Were\" rime avec \"her\", pas avec \"where\"."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot1 int;
  v_slot2 int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 1 / position 7 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;

  -- Double les positions existantes pour créer des espaces impairs libres
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  -- Calcule deux emplacements impairs répartis (~1/3 et ~2/3 de la leçon)
  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I visited my grandmother.", "sentence_fr": "J''ai rendu visite à ma grand-mère.", "tip": "Le \"-ed\" final de \"visited\" s''entend comme une syllabe en plus."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She finished her homework.", "sentence_fr": "Elle a fini ses devoirs.", "tip": "Ici le \"-ed\" de \"finished\" se prononce \"t\", pas \"ed\"."}'::jsonb);
end $$;


do $$
declare
  v_lesson_id uuid;
  v_count int;
  v_slot1 int;
  v_slot2 int;
begin
  select lessons.id into v_lesson_id
  from lessons
  join units on units.id = lessons.unit_id
  join languages on languages.id = units.language_id
  where languages.code = 'en' and units.position = 1 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 1 / position 8 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;

  -- Double les positions existantes pour créer des espaces impairs libres
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  -- Calcule deux emplacements impairs répartis (~1/3 et ~2/3 de la leçon)
  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "There are many apples.", "sentence_fr": "Il y a beaucoup de pommes.", "tip": "\"Many\" se prononce \"mèni\", pas comme il s''écrit."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "How much water do you need?", "sentence_fr": "De combien d''eau as-tu besoin ?", "tip": "\"Much\" se prononce avec un \"u\" bref, comme dans \"cup\"."}'::jsonb);
end $$;
