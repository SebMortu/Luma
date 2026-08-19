-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 15 et 16 (A2) — CLÔTURE DU NIVEAU A2
-- ============================================


-- ===== Unité 15 =====


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
  where languages.code = 'en' and units.position = 15 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 15 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Could you repeat that, please?", "sentence_fr": "Pourrais-tu répéter ça, s''il te plaît ?", "tip": "\"Repeat\" s''accentue sur la 2e syllabe : ri-PIT."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Sorry, I didn''t catch that.", "sentence_fr": "Désolé, je n''ai pas saisi.", "tip": "\"Catch that\" est une expression idiomatique pour \"comprendre\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 15 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 15 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What do you mean by that?", "sentence_fr": "Qu''est-ce que tu veux dire par là ?", "tip": "\"What do you mean\" pour demander une clarification."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Could you explain that differently?", "sentence_fr": "Pourrais-tu expliquer ça différemment ?", "tip": "\"Differently\" se prononce en 3 syllabes fluides."}'::jsonb);
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
  where languages.code = 'en' and units.position = 15 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 15 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I totally agree with you.", "sentence_fr": "Je suis totalement d''accord avec toi.", "tip": "\"Totally\" renforce l''accord de façon naturelle et courante."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I see your point, but I disagree.", "sentence_fr": "Je comprends ton point de vue, mais je ne suis pas d''accord.", "tip": "\"I see your point\" reconnaît poliment avant de contredire."}'::jsonb);
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
  where languages.code = 'en' and units.position = 15 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 15 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "That''s a great idea!", "sentence_fr": "C''est une super idée !", "tip": "L''intonation monte sur \"great\" pour montrer l''enthousiasme."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I''m really impressed by your work.", "sentence_fr": "Je suis vraiment impressionné par ton travail.", "tip": "\"Impressed\" : le \"-ed\" se prononce \"t\" après un son sourd."}'::jsonb);
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
  where languages.code = 'en' and units.position = 15 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 15 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''m sorry for being late.", "sentence_fr": "Je suis désolé d''être en retard.", "tip": "\"Sorry for\" + verbe en \"-ing\" pour s''excuser d''une action."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I didn''t mean to upset you.", "sentence_fr": "Je ne voulais pas te contrarier.", "tip": "\"Didn''t mean to\" s''excuse sans intention préalable."}'::jsonb);
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
  where languages.code = 'en' and units.position = 15 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 15 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Would you mind closing the door?", "sentence_fr": "Ça te dérangerait de fermer la porte ?", "tip": "\"Would you mind\" + verbe en \"-ing\", forme très polie."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Could I ask you a favor?", "sentence_fr": "Pourrais-je te demander une faveur ?", "tip": "\"Ask a favor\" est l''expression standard pour demander un service."}'::jsonb);
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
  where languages.code = 'en' and units.position = 15 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 15 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Let''s meet up sometime next week.", "sentence_fr": "Retrouvons-nous un jour la semaine prochaine.", "tip": "\"Meet up\" est plus familier et amical que \"meet\" seul."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "How about grabbing lunch together?", "sentence_fr": "Ça te dit qu''on déjeune ensemble ?", "tip": "\"How about\" + verbe en \"-ing\" pour proposer une activité."}'::jsonb);
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
  where languages.code = 'en' and units.position = 15 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 15 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Thanks a lot for your help.", "sentence_fr": "Merci beaucoup pour ton aide.", "tip": "\"Thanks a lot\" est plus familier que \"thank you very much\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I really appreciate everything you''ve done.", "sentence_fr": "J''apprécie vraiment tout ce que tu as fait.", "tip": "\"Appreciate\" s''accentue sur la 2e syllabe : a-PRI-ci-eit."}'::jsonb);
end $$;


-- ===== Unité 16 =====


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
  where languages.code = 'en' and units.position = 16 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 16 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Can I have the bill, please?", "sentence_fr": "Je peux avoir l''addition, s''il vous plaît ?", "tip": "\"Bill\" en anglais britannique, \"check\" en américain."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Is service included in the price?", "sentence_fr": "Le service est-il inclus dans le prix ?", "tip": "\"Included\" : le \"-ed\" se prononce \"id\" après un \"d\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 16 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 16 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Where is the nearest pharmacy?", "sentence_fr": "Où se trouve la pharmacie la plus proche ?", "tip": "\"Pharmacy\" s''accentue sur la première syllabe : FAR-ma-si."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I need a prescription for this.", "sentence_fr": "J''ai besoin d''une ordonnance pour ça.", "tip": "\"Prescription\" : le \"p\" est bien détaché, pas \"per-scription\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 16 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 16 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "How much does a ticket cost?", "sentence_fr": "Combien coûte un billet ?", "tip": "\"Cost\" se prononce avec un \"o\" ouvert, comme dans \"lost\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Is this seat taken?", "sentence_fr": "Cette place est-elle prise ?", "tip": "\"Taken\" : l''accent est sur la première syllabe."}'::jsonb);
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
  where languages.code = 'en' and units.position = 16 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 16 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What''s the wifi password here?", "sentence_fr": "Quel est le mot de passe wifi ici ?", "tip": "\"Password\" se prononce en deux syllabes fluides."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "My phone battery is almost dead.", "sentence_fr": "La batterie de mon téléphone est presque morte.", "tip": "\"Battery\" se prononce en 3 syllabes : BAT-eu-ri."}'::jsonb);
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
  where languages.code = 'en' and units.position = 16 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 16 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Could you recommend a good hotel?", "sentence_fr": "Pourriez-vous recommander un bon hôtel ?", "tip": "\"Recommend\" s''accentue sur la dernière syllabe."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Is breakfast included in the room rate?", "sentence_fr": "Le petit-déjeuner est-il inclus dans le prix de la chambre ?", "tip": "\"Rate\" rime avec \"late\", un \"éi\" bien clair."}'::jsonb);
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
  where languages.code = 'en' and units.position = 16 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 16 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''d like to open a bank account.", "sentence_fr": "J''aimerais ouvrir un compte en banque.", "tip": "\"Account\" s''accentue sur la 2e syllabe : a-COUNT."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Can I pay by card?", "sentence_fr": "Je peux payer par carte ?", "tip": "\"Pay by card\" s''enchaîne naturellement en une phrase fluide."}'::jsonb);
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
  where languages.code = 'en' and units.position = 16 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 16 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What time does the store close?", "sentence_fr": "À quelle heure ferme le magasin ?", "tip": "\"Close\" (fermer) se prononce avec un \"z\", contrairement à l''adjectif \"close\" (proche)."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Is there an elevator in this building?", "sentence_fr": "Y a-t-il un ascenseur dans ce bâtiment ?", "tip": "\"Elevator\" en américain, \"lift\" en britannique."}'::jsonb);
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
  where languages.code = 'en' and units.position = 16 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 16 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''d like to report a problem.", "sentence_fr": "J''aimerais signaler un problème.", "tip": "\"Report\" s''accentue sur la 2e syllabe : ri-PORT."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Could you send me the invoice?", "sentence_fr": "Pourriez-vous m''envoyer la facture ?", "tip": "\"Invoice\" s''accentue sur la première syllabe : IN-voiss."}'::jsonb);
end $$;
