-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 19 et 20 (B1)
-- ============================================


-- ===== Unité 19 =====


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
  where languages.code = 'en' and units.position = 19 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 19 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "If it rains, I will stay home.", "sentence_fr": "S''il pleut, je resterai à la maison.", "tip": "Type 1 : présent après \"if\", futur dans la proposition principale."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If you study hard, you will pass.", "sentence_fr": "Si tu étudies dur, tu réussiras.", "tip": "\"Will pass\" exprime une conséquence probable et réaliste."}'::jsonb);
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
  where languages.code = 'en' and units.position = 19 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 19 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "If I had more money, I would travel more.", "sentence_fr": "Si j''avais plus d''argent, je voyagerais plus.", "tip": "Type 2 : prétérit après \"if\", \"would\" dans la principale."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If she were here, she would help us.", "sentence_fr": "Si elle était là, elle nous aiderait.", "tip": "\"Were\" remplace \"was\" dans l''hypothèse irréelle, même au singulier."}'::jsonb);
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
  where languages.code = 'en' and units.position = 19 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 19 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What would you do if you won the lottery?", "sentence_fr": "Que ferais-tu si tu gagnais à la loterie ?", "tip": "Question hypothétique classique avec \"would\" et prétérit."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I would travel around the world if I could.", "sentence_fr": "Je voyagerais autour du monde si je le pouvais.", "tip": "\"If I could\" exprime une possibilité imaginée, pas réelle."}'::jsonb);
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
  where languages.code = 'en' and units.position = 19 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 19 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Unless you hurry, you''ll miss the train.", "sentence_fr": "À moins que tu te dépêches, tu vas rater le train.", "tip": "\"Unless\" équivaut à \"if... not\", une condition négative."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I won''t come unless you invite me.", "sentence_fr": "Je ne viendrai pas à moins que tu m''invites.", "tip": "\"Unless\" introduit une exception à la règle générale."}'::jsonb);
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
  where languages.code = 'en' and units.position = 19 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 19 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "As long as you''re happy, that''s what matters.", "sentence_fr": "Tant que tu es heureux, c''est ce qui compte.", "tip": "\"As long as\" pose une condition qui doit rester vraie."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "You can stay as long as you''re quiet.", "sentence_fr": "Tu peux rester tant que tu es silencieux.", "tip": "Condition continue, valable pendant toute la durée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 19 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 19 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "If I were you, I would apologize.", "sentence_fr": "À ta place, je m''excuserais.", "tip": "\"If I were you\" est une expression fixe pour donner un conseil."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If I were rich, I''d buy a big house.", "sentence_fr": "Si j''étais riche, j''achèterais une grande maison.", "tip": "\"I''d\" est la contraction naturelle de \"I would\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 19 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 19 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Provided that you finish on time, it''s fine.", "sentence_fr": "Pourvu que tu finisses à temps, c''est bon.", "tip": "\"Provided that\" est plus formel que \"if\" pour une condition."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "In case it rains, bring an umbrella.", "sentence_fr": "Au cas où il pleuvrait, prends un parapluie.", "tip": "\"In case\" anticipe une possibilité, par précaution."}'::jsonb);
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
  where languages.code = 'en' and units.position = 19 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 19 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What if we just stayed home tonight?", "sentence_fr": "Et si on restait à la maison ce soir ?", "tip": "\"What if\" pour proposer une idée ou une hypothèse."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Suppose you had to choose right now.", "sentence_fr": "Suppose que tu doives choisir maintenant.", "tip": "\"Suppose\" introduit une hypothèse à considérer."}'::jsonb);
end $$;


-- ===== Unité 20 =====


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
  where languages.code = 'en' and units.position = 20 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 20 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The letter was written by my grandmother.", "sentence_fr": "La lettre a été écrite par ma grand-mère.", "tip": "Voix passive : \"was written\" + \"by\" pour l''agent."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This house was built in 1920.", "sentence_fr": "Cette maison a été construite en 1920.", "tip": "L''agent n''est pas mentionné quand il est inconnu ou inutile."}'::jsonb);
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
  where languages.code = 'en' and units.position = 20 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 20 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The cake is being baked right now.", "sentence_fr": "Le gâteau est en train d''être cuit en ce moment.", "tip": "Passif au continu : \"is being baked\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The road is being repaired this week.", "sentence_fr": "La route est en cours de réparation cette semaine.", "tip": "\"Is being repaired\" insiste sur l''action en cours."}'::jsonb);
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
  where languages.code = 'en' and units.position = 20 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 20 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The project has been completed successfully.", "sentence_fr": "Le projet a été achevé avec succès.", "tip": "Passif au present perfect : \"has been completed\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "All the tickets have been sold already.", "sentence_fr": "Tous les billets ont déjà été vendus.", "tip": "\"Have been sold\" insiste sur le résultat présent."}'::jsonb);
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
  where languages.code = 'en' and units.position = 20 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 20 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The report will be finished by Friday.", "sentence_fr": "Le rapport sera terminé d''ici vendredi.", "tip": "Passif au futur : \"will be finished\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The results will be announced tomorrow.", "sentence_fr": "Les résultats seront annoncés demain.", "tip": "\"Will be announced\" pour une action future certaine."}'::jsonb);
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
  where languages.code = 'en' and units.position = 20 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 20 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "English is spoken in many countries.", "sentence_fr": "L''anglais est parlé dans de nombreux pays.", "tip": "Passif présent pour un fait général et durable."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Rice is grown in this region.", "sentence_fr": "Le riz est cultivé dans cette région.", "tip": "\"Is grown\" décrit une pratique habituelle et générale."}'::jsonb);
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
  where languages.code = 'en' and units.position = 20 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 20 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The window was broken by the storm.", "sentence_fr": "La fenêtre a été cassée par la tempête.", "tip": "\"By the storm\" précise la cause, même non humaine."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The car was damaged in the accident.", "sentence_fr": "La voiture a été endommagée dans l''accident.", "tip": "\"In the accident\" précise le contexte, pas l''agent direct."}'::jsonb);
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
  where languages.code = 'en' and units.position = 20 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 20 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "You are required to fill out this form.", "sentence_fr": "Vous êtes tenu de remplir ce formulaire.", "tip": "\"Are required to\" est une formule administrative fréquente."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Visitors are asked to remain quiet.", "sentence_fr": "Les visiteurs sont priés de rester silencieux.", "tip": "\"Are asked to\" pour une demande formelle et polie."}'::jsonb);
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
  where languages.code = 'en' and units.position = 20 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 20 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It is said that the house is haunted.", "sentence_fr": "On dit que la maison est hantée.", "tip": "\"It is said that\" pour rapporter une rumeur, sans source précise."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It is believed that he left the country.", "sentence_fr": "On pense qu''il a quitté le pays.", "tip": "\"It is believed that\" exprime une opinion générale répandue."}'::jsonb);
end $$;
