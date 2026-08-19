-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 21 et 22 (B1)
-- ============================================


-- ===== Unité 21 =====


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
  where languages.code = 'en' and units.position = 21 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 21 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She said she was tired.", "sentence_fr": "Elle a dit qu''elle était fatiguée.", "tip": "Le discours indirect recule le temps : \"is\" devient \"was\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He told me he would call later.", "sentence_fr": "Il m''a dit qu''il appellerait plus tard.", "tip": "\"Will\" devient \"would\" au discours rapporté."}'::jsonb);
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
  where languages.code = 'en' and units.position = 21 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 21 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She asked me where I lived.", "sentence_fr": "Elle m''a demandé où j''habitais.", "tip": "L''ordre des mots reste affirmatif, pas interrogatif."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He asked if I was coming to the party.", "sentence_fr": "Il a demandé si je venais à la fête.", "tip": "\"If\" introduit une question fermée rapportée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 21 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 21 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "My mother told me not to worry.", "sentence_fr": "Ma mère m''a dit de ne pas m''inquiéter.", "tip": "\"Told me not to\" pour rapporter un ordre négatif."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The teacher asked us to be quiet.", "sentence_fr": "Le professeur nous a demandé d''être silencieux.", "tip": "\"Asked us to\" pour une demande polie rapportée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 21 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 21 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He said that he had already eaten.", "sentence_fr": "Il a dit qu''il avait déjà mangé.", "tip": "Le passé composé devient plus-que-parfait au discours rapporté."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She mentioned that she had visited Rome.", "sentence_fr": "Elle a mentionné qu''elle avait visité Rome.", "tip": "\"Mentioned that\" introduit une information rapportée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 21 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 21 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "They said they were leaving the next day.", "sentence_fr": "Ils ont dit qu''ils partaient le lendemain.", "tip": "\"Tomorrow\" devient \"the next day\" au discours rapporté."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She said she had seen him there before.", "sentence_fr": "Elle a dit qu''elle l''avait déjà vu là-bas.", "tip": "\"There\" reste souvent inchangé selon le contexte."}'::jsonb);
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
  where languages.code = 'en' and units.position = 21 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 21 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He explained why he was late.", "sentence_fr": "Il a expliqué pourquoi il était en retard.", "tip": "\"Explained why\" introduit une justification rapportée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She wondered whether it would rain.", "sentence_fr": "Elle se demandait s''il allait pleuvoir.", "tip": "\"Whether\" introduit une incertitude rapportée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 21 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 21 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "According to him, the meeting is cancelled.", "sentence_fr": "D''après lui, la réunion est annulée.", "tip": "\"According to\" attribue une information à une source."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She claims that she wasn''t there.", "sentence_fr": "Elle prétend qu''elle n''était pas là.", "tip": "\"Claims that\" introduit une affirmation à nuancer."}'::jsonb);
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
  where languages.code = 'en' and units.position = 21 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 21 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He admitted that he had made a mistake.", "sentence_fr": "Il a admis qu''il avait fait une erreur.", "tip": "\"Admitted that\" pour rapporter un aveu."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She promised she would help us.", "sentence_fr": "Elle a promis qu''elle nous aiderait.", "tip": "\"Promised\" au discours rapporté garde le sens d''engagement."}'::jsonb);
end $$;


-- ===== Unité 22 =====


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
  where languages.code = 'en' and units.position = 22 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 22 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The man who called you is my brother.", "sentence_fr": "L''homme qui t''a appelé est mon frère.", "tip": "\"Who\" relie une personne à une information la concernant."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The book that I read was amazing.", "sentence_fr": "Le livre que j''ai lu était incroyable.", "tip": "\"That\" peut remplacer \"which\" dans une relative essentielle."}'::jsonb);
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
  where languages.code = 'en' and units.position = 22 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 22 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This is the house where I grew up.", "sentence_fr": "C''est la maison où j''ai grandi.", "tip": "\"Where\" introduit un lieu dans une proposition relative."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I remember the day when we first met.", "sentence_fr": "Je me souviens du jour où on s''est rencontrés.", "tip": "\"When\" relie un moment précis à une information."}'::jsonb);
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
  where languages.code = 'en' and units.position = 22 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 22 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Although it was raining, we went outside.", "sentence_fr": "Bien qu''il pleuve, nous sommes sortis.", "tip": "\"Although\" introduit une opposition, comme \"even though\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She succeeded despite the difficulties.", "sentence_fr": "Elle a réussi malgré les difficultés.", "tip": "\"Despite\" + nom, contrairement à \"although\" + phrase."}'::jsonb);
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
  where languages.code = 'en' and units.position = 22 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 22 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I stayed home because I was sick.", "sentence_fr": "Je suis resté à la maison parce que j''étais malade.", "tip": "\"Because\" introduit une cause directe et simple."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Since it''s late, let''s go home.", "sentence_fr": "Puisqu''il est tard, rentrons.", "tip": "\"Since\" ici signifie \"puisque\", pas \"depuis\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 22 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 22 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I saved money in order to travel.", "sentence_fr": "J''ai économisé de l''argent afin de voyager.", "tip": "\"In order to\" est plus formel que \"to\" seul pour un but."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She studies hard so that she can succeed.", "sentence_fr": "Elle étudie dur pour pouvoir réussir.", "tip": "\"So that\" + sujet + verbe pour exprimer un but."}'::jsonb);
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
  where languages.code = 'en' and units.position = 22 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 22 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It was so cold that we stayed inside.", "sentence_fr": "Il faisait si froid que nous sommes restés à l''intérieur.", "tip": "\"So... that\" exprime une conséquence directe."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She was too tired to continue working.", "sentence_fr": "Elle était trop fatiguée pour continuer à travailler.", "tip": "\"Too... to\" exprime un excès empêchant une action."}'::jsonb);
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
  where languages.code = 'en' and units.position = 22 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 22 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Both my sister and I love music.", "sentence_fr": "Ma sœur et moi aimons tous les deux la musique.", "tip": "\"Both... and\" relie deux éléments de façon équilibrée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Neither he nor I agree with this.", "sentence_fr": "Ni lui ni moi ne sommes d''accord avec ça.", "tip": "\"Neither... nor\" pour une double négation liée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 22 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 22 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Not only is she smart, but also kind.", "sentence_fr": "Elle n''est pas seulement intelligente, mais aussi gentille.", "tip": "\"Not only... but also\" inverse l''ordre après \"not only\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Either we leave now or we''ll be late.", "sentence_fr": "Soit on part maintenant, soit on sera en retard.", "tip": "\"Either... or\" présente une alternative claire."}'::jsonb);
end $$;
