-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 29 et 30 (B2) — CLÔTURE DU NIVEAU B2
-- ============================================


-- ===== Unité 29 =====


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
  where languages.code = 'en' and units.position = 29 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 29 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It''s raining cats and dogs outside.", "sentence_fr": "Il pleut des cordes dehors.", "tip": "\"Cats and dogs\" est une expression idiomatique classique pour une forte pluie."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I''m feeling under the weather today.", "sentence_fr": "Je ne me sens pas très bien aujourd''hui.", "tip": "\"Under the weather\" signifie se sentir légèrement malade."}'::jsonb);
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
  where languages.code = 'en' and units.position = 29 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 29 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Let''s not beat around the bush.", "sentence_fr": "N''y allons pas par quatre chemins.", "tip": "\"Beat around the bush\" signifie éviter le sujet principal."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She hit the nail on the head.", "sentence_fr": "Elle a mis le doigt dessus.", "tip": "\"Hit the nail on the head\" signifie avoir parfaitement raison."}'::jsonb);
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
  where languages.code = 'en' and units.position = 29 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 29 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It cost me an arm and a leg.", "sentence_fr": "Ça m''a coûté les yeux de la tête.", "tip": "\"An arm and a leg\" pour exprimer un prix très élevé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "That''s the last straw for me.", "sentence_fr": "C''est la goutte d''eau qui fait déborder le vase.", "tip": "\"The last straw\" marque la limite de la patience atteinte."}'::jsonb);
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
  where languages.code = 'en' and units.position = 29 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 29 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''m on the fence about this decision.", "sentence_fr": "Je suis indécis à propos de cette décision.", "tip": "\"On the fence\" signifie hésiter, ne pas avoir choisi de camp."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Let''s just wing it tonight.", "sentence_fr": "Improvisons ce soir.", "tip": "\"Wing it\" signifie improviser sans préparation."}'::jsonb);
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
  where languages.code = 'en' and units.position = 29 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 29 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He''s always been a bit of a night owl.", "sentence_fr": "Il a toujours été un peu couche-tard.", "tip": "\"Night owl\" désigne une personne active le soir/la nuit."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She''s an early bird, up at six every day.", "sentence_fr": "Elle est matinale, levée à six heures tous les jours.", "tip": "\"Early bird\" est l''opposé de \"night owl\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 29 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 29 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Don''t judge a book by its cover.", "sentence_fr": "Il ne faut pas se fier aux apparences.", "tip": "Expression très courante pour ne pas juger sur l''apparence."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Every cloud has a silver lining.", "sentence_fr": "Après la pluie vient le beau temps.", "tip": "Expression qui encourage à voir le positif dans l''adversité."}'::jsonb);
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
  where languages.code = 'en' and units.position = 29 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 29 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I need to touch base with the team.", "sentence_fr": "J''ai besoin de faire le point avec l''équipe.", "tip": "\"Touch base\" signifie contacter brièvement quelqu''un."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Let''s think outside the box on this one.", "sentence_fr": "Pensons différemment pour celui-ci.", "tip": "\"Think outside the box\" signifie être créatif, sortir du cadre."}'::jsonb);
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
  where languages.code = 'en' and units.position = 29 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 29 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She''s got a lot on her plate right now.", "sentence_fr": "Elle a beaucoup de choses à gérer en ce moment.", "tip": "\"A lot on her plate\" signifie avoir beaucoup de responsabilités."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We''re all in the same boat here.", "sentence_fr": "Nous sommes tous dans la même situation ici.", "tip": "\"In the same boat\" signifie partager la même situation difficile."}'::jsonb);
end $$;


-- ===== Unité 30 =====


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
  where languages.code = 'en' and units.position = 30 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 30 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "You must be joking!", "sentence_fr": "Tu dois plaisanter !", "tip": "\"Must be\" exprime une forte incrédulité, presque de la surprise."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This can''t possibly be true.", "sentence_fr": "Ça ne peut absolument pas être vrai.", "tip": "\"Can''t possibly\" renforce l''impossibilité perçue."}'::jsonb);
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
  where languages.code = 'en' and units.position = 30 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 30 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She may well be right about this.", "sentence_fr": "Elle a bien pu avoir raison là-dessus.", "tip": "\"May well\" nuance une possibilité assez probable."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It might just work after all.", "sentence_fr": "Ça pourrait finalement marcher.", "tip": "\"Might just\" nuance un optimisme prudent."}'::jsonb);
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
  where languages.code = 'en' and units.position = 30 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 30 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "You could at least say thank you.", "sentence_fr": "Tu pourrais au moins dire merci.", "tip": "\"Could at least\" exprime un reproche léger et poli."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We should really get going now.", "sentence_fr": "Nous devrions vraiment y aller maintenant.", "tip": "\"Should really\" renforce discrètement une recommandation."}'::jsonb);
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
  where languages.code = 'en' and units.position = 30 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 30 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He needn''t have bothered coming.", "sentence_fr": "Il n''avait pas besoin de se donner la peine de venir.", "tip": "\"Needn''t have\" nuance une action jugée inutile a posteriori."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "You didn''t have to explain yourself.", "sentence_fr": "Tu n''avais pas à te justifier.", "tip": "\"Didn''t have to\" est plus neutre que \"needn''t have\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 30 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 30 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I daresay she''ll be there.", "sentence_fr": "J''ose dire qu''elle sera là.", "tip": "\"I daresay\" est une formule britannique très nuancée et polie."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I suppose that could be true.", "sentence_fr": "Je suppose que ça pourrait être vrai.", "tip": "\"I suppose\" nuance une acceptation prudente."}'::jsonb);
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
  where languages.code = 'en' and units.position = 30 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 30 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It stands to reason that prices will rise.", "sentence_fr": "Il est logique que les prix augmentent.", "tip": "\"Stands to reason\" introduit une déduction logique évidente."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It goes without saying that we''ll help.", "sentence_fr": "Il va sans dire que nous aiderons.", "tip": "\"Goes without saying\" pour une évidence non contestable."}'::jsonb);
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
  where languages.code = 'en' and units.position = 30 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 30 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "You might as well tell the truth now.", "sentence_fr": "Autant dire la vérité maintenant.", "tip": "\"Might as well\" suggère qu''il n''y a pas de meilleure option."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We may as well try, we have nothing to lose.", "sentence_fr": "Autant essayer, on n''a rien à perdre.", "tip": "\"May as well\" est interchangeable avec \"might as well\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 30 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 30 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She would never have guessed the outcome.", "sentence_fr": "Elle n''aurait jamais deviné le résultat.", "tip": "\"Would never have\" nuance une certitude rétrospective forte."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I couldn''t possibly accept this gift.", "sentence_fr": "Je ne pourrais absolument pas accepter ce cadeau.", "tip": "\"Couldn''t possibly\" exprime un refus poli mais catégorique."}'::jsonb);
end $$;
