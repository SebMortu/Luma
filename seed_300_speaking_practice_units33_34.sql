-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 33 et 34 (C1)
-- ============================================


-- ===== Unité 33 =====


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
  where languages.code = 'en' and units.position = 33 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 33 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What I really admire about her is her patience.", "sentence_fr": "Ce que j''admire vraiment chez elle, c''est sa patience.", "tip": "\"What I admire is\" isole précisément l''élément mis en avant."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "What annoys me most is his constant lateness.", "sentence_fr": "Ce qui m''agace le plus, c''est son éternel retard.", "tip": "\"What annoys me most\" concentre l''attention sur une seule critique."}'::jsonb);
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
  where languages.code = 'en' and units.position = 33 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 33 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It was in Paris that we first met.", "sentence_fr": "C''est à Paris que nous nous sommes rencontrés pour la première fois.", "tip": "\"It was... that\" met l''accent sur le lieu précis."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It wasn''t until later that I understood.", "sentence_fr": "Ce n''est que plus tard que j''ai compris.", "tip": "\"It wasn''t until\" retarde et souligne le moment de compréhension."}'::jsonb);
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
  where languages.code = 'en' and units.position = 33 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 33 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The reason why she left is still unclear.", "sentence_fr": "La raison pour laquelle elle est partie reste floue.", "tip": "\"The reason why\" introduit une cause mise en relief."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The place where I grew up has changed completely.", "sentence_fr": "L''endroit où j''ai grandi a complètement changé.", "tip": "\"The place where\" isole le lieu comme sujet principal."}'::jsonb);
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
  where languages.code = 'en' and units.position = 33 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 33 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What happened next was completely unexpected.", "sentence_fr": "Ce qui s''est passé ensuite était totalement inattendu.", "tip": "\"What happened next was\" structure une narration mise en relief."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "What she said next surprised everyone.", "sentence_fr": "Ce qu''elle a dit ensuite a surpris tout le monde.", "tip": "\"What she said\" isole précisément la déclaration marquante."}'::jsonb);
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
  where languages.code = 'en' and units.position = 33 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 33 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "All that matters now is your recovery.", "sentence_fr": "Tout ce qui compte maintenant, c''est ta guérison.", "tip": "\"All that matters\" concentre l''attention sur une priorité unique."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "All I ask is a little more time.", "sentence_fr": "Tout ce que je demande, c''est un peu plus de temps.", "tip": "\"All I ask is\" formule une requête de façon nuancée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 33 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 33 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It''s her confidence that I find most striking.", "sentence_fr": "C''est sa confiance que je trouve la plus frappante.", "tip": "\"It''s... that I find\" met en avant une qualité personnelle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It''s not the money that motivates me.", "sentence_fr": "Ce n''est pas l''argent qui me motive.", "tip": "Structure clivée négative pour clarifier une vraie motivation."}'::jsonb);
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
  where languages.code = 'en' and units.position = 33 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 33 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The one thing I regret is not speaking up.", "sentence_fr": "La seule chose que je regrette, c''est de ne pas avoir parlé.", "tip": "\"The one thing\" isole un regret unique et précis."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The only person who understood was my sister.", "sentence_fr": "La seule personne qui a compris, c''était ma sœur.", "tip": "\"The only person who\" souligne l''exclusivité d''une situation."}'::jsonb);
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
  where languages.code = 'en' and units.position = 33 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 33 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What matters is not what you say, but what you do.", "sentence_fr": "Ce qui compte, ce n''est pas ce que tu dis, mais ce que tu fais.", "tip": "Structure clivée en contraste, opposant deux idées."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It''s not that I don''t care, it''s that I''m busy.", "sentence_fr": "Ce n''est pas que ça ne m''intéresse pas, c''est que je suis occupé.", "tip": "\"It''s not that... it''s that\" nuance une explication complexe."}'::jsonb);
end $$;


-- ===== Unité 34 =====


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
  where languages.code = 'en' and units.position = 34 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 34 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He''s a bit of a loose cannon at work.", "sentence_fr": "Il est un peu imprévisible au travail.", "tip": "\"Loose cannon\" décrit une personne imprévisible, parfois dangereuse."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She really knows how to read the room.", "sentence_fr": "Elle sait vraiment cerner l''ambiance d''un groupe.", "tip": "\"Read the room\" signifie percevoir l''atmosphère sociale."}'::jsonb);
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
  where languages.code = 'en' and units.position = 34 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 34 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Let''s not reinvent the wheel here.", "sentence_fr": "Ne réinventons pas la roue ici.", "tip": "Expression pour dire d''utiliser des méthodes déjà éprouvées."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We need to hit the ground running.", "sentence_fr": "Nous devons démarrer sur les chapeaux de roue.", "tip": "\"Hit the ground running\" signifie commencer efficacement et vite."}'::jsonb);
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
  where languages.code = 'en' and units.position = 34 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 34 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "That comment really rubbed me the wrong way.", "sentence_fr": "Ce commentaire m''a vraiment agacé.", "tip": "\"Rub someone the wrong way\" signifie irriter quelqu''un."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He always seems to be walking on eggshells.", "sentence_fr": "Il semble toujours marcher sur des œufs.", "tip": "\"Walk on eggshells\" signifie agir avec grande prudence."}'::jsonb);
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
  where languages.code = 'en' and units.position = 34 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 34 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She''s been burning the candle at both ends lately.", "sentence_fr": "Elle se surmène beaucoup ces derniers temps.", "tip": "\"Burn the candle at both ends\" signifie s''épuiser à force de travail."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I think we should let sleeping dogs lie.", "sentence_fr": "Je pense qu''on devrait laisser les choses tranquilles.", "tip": "\"Let sleeping dogs lie\" signifie ne pas raviver un problème."}'::jsonb);
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
  where languages.code = 'en' and units.position = 34 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 34 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "His argument doesn''t hold water.", "sentence_fr": "Son argument ne tient pas debout.", "tip": "\"Doesn''t hold water\" signifie qu''un argument est peu solide."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She always manages to read between the lines.", "sentence_fr": "Elle arrive toujours à lire entre les lignes.", "tip": "\"Read between the lines\" signifie percevoir un sens caché."}'::jsonb);
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
  where languages.code = 'en' and units.position = 34 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 34 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "We''re all just cogs in the machine here.", "sentence_fr": "Nous sommes tous juste des rouages de la machine ici.", "tip": "Expression pour décrire un sentiment d''insignifiance dans un système."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This decision could open a can of worms.", "sentence_fr": "Cette décision pourrait ouvrir une boîte de Pandore.", "tip": "\"Open a can of worms\" signifie créer des problèmes complexes."}'::jsonb);
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
  where languages.code = 'en' and units.position = 34 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 34 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He tends to jump on the bandwagon quickly.", "sentence_fr": "Il a tendance à suivre la tendance rapidement.", "tip": "\"Jump on the bandwagon\" signifie suivre une mode populaire."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She''s always been the black sheep of the family.", "sentence_fr": "Elle a toujours été le mouton noir de la famille.", "tip": "\"Black sheep\" désigne la personne différente ou marginale d''un groupe."}'::jsonb);
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
  where languages.code = 'en' and units.position = 34 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 34 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Let''s cut to the chase and discuss the budget.", "sentence_fr": "Allons droit au but et discutons du budget.", "tip": "\"Cut to the chase\" signifie aller directement à l''essentiel."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "That''s the elephant in the room nobody mentions.", "sentence_fr": "C''est le sujet tabou que personne n''aborde.", "tip": "\"Elephant in the room\" désigne un problème évident mais ignoré."}'::jsonb);
end $$;
