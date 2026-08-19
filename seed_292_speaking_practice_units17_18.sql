-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 17 et 18 (B1)
-- ============================================


-- ===== Unité 17 =====


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
  where languages.code = 'en' and units.position = 17 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 17 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''ve been working here since March.", "sentence_fr": "Je travaille ici depuis mars.", "tip": "\"Been working\" insiste sur la continuité, pas juste le résultat."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She''s been studying for three hours.", "sentence_fr": "Elle étudie depuis trois heures.", "tip": "\"For three hours\" précise la durée de l''action en cours."}'::jsonb);
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
  where languages.code = 'en' and units.position = 17 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 17 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "How long have you been waiting?", "sentence_fr": "Depuis combien de temps attends-tu ?", "tip": "\"How long have you been\" pour interroger sur une durée continue."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I''ve been trying to reach you all day.", "sentence_fr": "J''essaie de te joindre toute la journée.", "tip": "\"All day\" renforce la persistance de l''action."}'::jsonb);
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
  where languages.code = 'en' and units.position = 17 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 17 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It''s been raining all morning.", "sentence_fr": "Il pleut depuis toute la matinée.", "tip": "Le sujet \"it\" pour parler de la météo qui dure."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "They''ve been living abroad for years.", "sentence_fr": "Ils vivent à l''étranger depuis des années.", "tip": "\"For years\" indique une durée longue et continue."}'::jsonb);
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
  where languages.code = 'en' and units.position = 17 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 17 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "My eyes hurt because I''ve been reading.", "sentence_fr": "J''ai mal aux yeux parce que je lis depuis un moment.", "tip": "La cause explique le résultat visible dans le présent."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She''s tired because she''s been running.", "sentence_fr": "Elle est fatiguée parce qu''elle a couru.", "tip": "L''action récente explique un état physique actuel."}'::jsonb);
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
  where languages.code = 'en' and units.position = 17 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 17 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Have you been feeling okay lately?", "sentence_fr": "Tu te sens bien ces derniers temps ?", "tip": "\"Lately\" s''utilise souvent avec le present perfect continu."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I haven''t been sleeping well recently.", "sentence_fr": "Je ne dors pas bien récemment.", "tip": "\"Recently\" indique une période récente et continue."}'::jsonb);
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
  where languages.code = 'en' and units.position = 17 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 17 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "We''ve been planning this trip for months.", "sentence_fr": "Nous préparons ce voyage depuis des mois.", "tip": "\"For months\" insiste sur la préparation longue et continue."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He''s been working too hard lately.", "sentence_fr": "Il travaille trop dur ces derniers temps.", "tip": "\"Too hard\" exprime un excès qui inquiète."}'::jsonb);
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
  where languages.code = 'en' and units.position = 17 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 17 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''ve been meaning to call you.", "sentence_fr": "Je comptais t''appeler.", "tip": "\"Been meaning to\" exprime une intention non réalisée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She''s been wanting to visit Japan for years.", "sentence_fr": "Elle veut visiter le Japon depuis des années.", "tip": "\"Wanting to\" au continu insiste sur un désir persistant."}'::jsonb);
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
  where languages.code = 'en' and units.position = 17 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 17 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What have you been up to lately?", "sentence_fr": "Qu''est-ce que tu deviens ces derniers temps ?", "tip": "\"What have you been up to\" est une question familière courante."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I''ve been thinking about changing jobs.", "sentence_fr": "Je pense à changer de travail.", "tip": "\"Thinking about\" + nom ou verbe en \"-ing\"."}'::jsonb);
end $$;


-- ===== Unité 18 =====


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
  where languages.code = 'en' and units.position = 18 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 18 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I was walking home when it started to rain.", "sentence_fr": "Je rentrais à pied quand il a commencé à pleuvoir.", "tip": "Le prétérit continu pose le décor, le prétérit simple l''interrompt."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She was cooking dinner when the phone rang.", "sentence_fr": "Elle préparait le dîner quand le téléphone a sonné.", "tip": "\"When\" introduit l''action brève qui interrompt l''action longue."}'::jsonb);
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
  where languages.code = 'en' and units.position = 18 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 18 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "By the time I arrived, they had already left.", "sentence_fr": "Au moment où je suis arrivé, ils étaient déjà partis.", "tip": "Le plus-que-parfait \"had left\" précède l''action passée simple."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She had finished her homework before dinner.", "sentence_fr": "Elle avait fini ses devoirs avant le dîner.", "tip": "\"Had finished\" montre l''antériorité par rapport à \"dinner\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 18 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 18 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "While I was reading, my sister was watching TV.", "sentence_fr": "Pendant que je lisais, ma sœur regardait la télé.", "tip": "\"While\" relie deux actions longues qui se déroulent en parallèle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "They were talking while waiting for the bus.", "sentence_fr": "Ils discutaient en attendant le bus.", "tip": "Deux actions continues simultanées, reliées par \"while\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 18 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 18 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "As soon as I got home, I called my mom.", "sentence_fr": "Dès que je suis rentré, j''ai appelé ma mère.", "tip": "\"As soon as\" relie deux actions passées très rapprochées."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Once she finished, she went straight to bed.", "sentence_fr": "Une fois qu''elle a fini, elle est allée directement se coucher.", "tip": "\"Once\" introduit une action achevée suivie d''une autre."}'::jsonb);
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
  where languages.code = 'en' and units.position = 18 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 18 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I used to live in a small village.", "sentence_fr": "J''habitais autrefois dans un petit village.", "tip": "\"Used to\" pour une habitude passée révolue."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We used to play outside every day.", "sentence_fr": "Nous jouions dehors tous les jours autrefois.", "tip": "\"Used to\" insiste sur un contraste avec le présent."}'::jsonb);
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
  where languages.code = 'en' and units.position = 18 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 18 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I hadn''t seen her in years when we met again.", "sentence_fr": "Je ne l''avais pas vue depuis des années quand on s''est revus.", "tip": "\"Hadn''t seen\" au plus-que-parfait négatif pour l''absence prolongée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He hadn''t finished eating when the bell rang.", "sentence_fr": "Il n''avait pas fini de manger quand la sonnerie a retenti.", "tip": "\"Hadn''t finished\" montre une action incomplète avant l''interruption."}'::jsonb);
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
  where languages.code = 'en' and units.position = 18 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 18 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The story took place a long time ago.", "sentence_fr": "L''histoire se déroulait il y a longtemps.", "tip": "\"Took place\" est l''expression standard pour situer un récit."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Suddenly, everything changed completely.", "sentence_fr": "Soudain, tout a complètement changé.", "tip": "\"Suddenly\" marque un tournant brusque dans un récit."}'::jsonb);
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
  where languages.code = 'en' and units.position = 18 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 18 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "In the end, everything turned out fine.", "sentence_fr": "Finalement, tout s''est bien terminé.", "tip": "\"In the end\" conclut un récit de façon naturelle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Eventually, she found what she was looking for.", "sentence_fr": "Finalement, elle a trouvé ce qu''elle cherchait.", "tip": "\"Eventually\" insiste sur un résultat obtenu après du temps."}'::jsonb);
end $$;
