-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unité 8 (A1) — CLÔTURE DU NIVEAU A1
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
  where languages.code = 'en' and units.position = 8 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 8 / position 1 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "There are twenty students in my class.", "sentence_fr": "Il y a vingt étudiants dans ma classe.", "tip": "\"Twenty\" : l''accent est sur la première syllabe, TOUEN-ti."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I have three apples and two bananas.", "sentence_fr": "J''ai trois pommes et deux bananes.", "tip": "Prononce chaque chiffre distinctement, sans les lier."}'::jsonb);
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
  where languages.code = 'en' and units.position = 8 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 8 / position 2 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This book is more interesting than that one.", "sentence_fr": "Ce livre est plus intéressant que celui-là.", "tip": "\"More... than\" pour les adjectifs longs comme \"interesting\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She is taller than her brother.", "sentence_fr": "Elle est plus grande que son frère.", "tip": "\"Taller\" ajoute \"-er\" pour les adjectifs courts."}'::jsonb);
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
  where languages.code = 'en' and units.position = 8 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 8 / position 3 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This is the biggest city in the country.", "sentence_fr": "C''est la plus grande ville du pays.", "tip": "\"Biggest\" double le \"g\" avant \"-est\" après une voyelle courte."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He is the most intelligent student here.", "sentence_fr": "C''est l''étudiant le plus intelligent ici.", "tip": "\"Most\" pour le superlatif des adjectifs longs."}'::jsonb);
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
  where languages.code = 'en' and units.position = 8 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 8 / position 4 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "My car is as fast as yours.", "sentence_fr": "Ma voiture est aussi rapide que la tienne.", "tip": "\"As... as\" encadre l''adjectif pour une comparaison d''égalité."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This test isn''t as difficult as I thought.", "sentence_fr": "Ce test n''est pas aussi difficile que je le pensais.", "tip": "La négation se place sur \"isn''t\", pas sur \"as\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 8 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 8 / position 5 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I need less sugar in my coffee.", "sentence_fr": "J''ai besoin de moins de sucre dans mon café.", "tip": "\"Less\" s''utilise avec les indénombrables comme \"sugar\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We have fewer problems now.", "sentence_fr": "Nous avons moins de problèmes maintenant.", "tip": "\"Fewer\" s''utilise avec les dénombrables comme \"problems\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 8 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 8 / position 6 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This is the cheapest restaurant in town.", "sentence_fr": "C''est le restaurant le moins cher de la ville.", "tip": "\"Cheapest\" : le \"ea\" se prononce comme un \"i\" long."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "That was the worst movie I''ve seen.", "sentence_fr": "C''était le pire film que j''ai vu.", "tip": "\"Worst\" est irrégulier, ne dis jamais \"badest\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 8 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 8 / position 7 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He earns twice as much as me.", "sentence_fr": "Il gagne deux fois plus que moi.", "tip": "\"Twice as much\" pour exprimer une proportion multipliée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This year is different from the last one.", "sentence_fr": "Cette année est différente de la précédente.", "tip": "\"Different from\" est la structure la plus naturelle en anglais."}'::jsonb);
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
  where languages.code = 'en' and units.position = 8 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 8 / position 8 introuvable, ignorée.';
    return;
  end if;

  select count(*) into v_count from exercises where lesson_id = v_lesson_id;
  update exercises set position = position * 2 where lesson_id = v_lesson_id;

  v_slot1 := floor(v_count * 2 * 0.33)::int;
  if v_slot1 % 2 = 0 then v_slot1 := v_slot1 + 1; end if;
  v_slot1 := greatest(v_slot1, 1);

  v_slot2 := floor(v_count * 2 * 0.66)::int;
  if v_slot2 % 2 = 0 then v_slot2 := v_slot2 + 1; end if;
  v_slot2 := greatest(v_slot2, v_slot1 + 2);

  insert into exercises (lesson_id, type, position, content) values
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Which one is the best option?", "sentence_fr": "Laquelle est la meilleure option ?", "tip": "\"Best\" est le superlatif irrégulier de \"good\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This is by far the easiest exercise.", "sentence_fr": "C''est de loin l''exercice le plus facile.", "tip": "\"By far\" renforce un superlatif, insiste sur l''écart."}'::jsonb);
end $$;
