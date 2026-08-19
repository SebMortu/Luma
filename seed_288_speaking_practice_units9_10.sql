-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 9 et 10 (A2)
-- ============================================


-- ===== Unité 9 =====


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
  where languages.code = 'en' and units.position = 9 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 9 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I will call you tomorrow.", "sentence_fr": "Je t''appellerai demain.", "tip": "\"Will\" se contracte souvent en \"''ll\" à l''oral naturel."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She won''t be here tonight.", "sentence_fr": "Elle ne sera pas là ce soir.", "tip": "\"Won''t\" se prononce \"wont\", rime avec \"don''t\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 9 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 9 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''m going to visit my parents.", "sentence_fr": "Je vais rendre visite à mes parents.", "tip": "\"Going to\" se réduit souvent à \"gonna\" à l''oral familier."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Are you going to finish this today?", "sentence_fr": "Tu vas finir ça aujourd''hui ?", "tip": "L''intonation monte légèrement en fin de question."}'::jsonb);
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
  where languages.code = 'en' and units.position = 9 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 9 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The train leaves at nine o''clock.", "sentence_fr": "Le train part à neuf heures.", "tip": "Le présent simple exprime un horaire fixe, comme un programme."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The meeting starts next Monday.", "sentence_fr": "La réunion commence lundi prochain.", "tip": "\"Starts\" au présent simple pour un événement programmé."}'::jsonb);
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
  where languages.code = 'en' and units.position = 9 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 9 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''ll help you if you need it.", "sentence_fr": "Je t''aiderai si tu en as besoin.", "tip": "Après \"if\", on utilise le présent, pas \"will\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She''ll be happy when she hears this.", "sentence_fr": "Elle sera contente quand elle entendra ça.", "tip": "Après \"when\", le présent remplace le futur en anglais."}'::jsonb);
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
  where languages.code = 'en' and units.position = 9 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 9 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "By next year, I will have graduated.", "sentence_fr": "D''ici l''année prochaine, j''aurai obtenu mon diplôme.", "tip": "Le futur antérieur combine \"will have\" + participe passé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "They will have finished by then.", "sentence_fr": "Ils auront fini d''ici là.", "tip": "\"By then\" marque une échéance précise dans le futur."}'::jsonb);
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
  where languages.code = 'en' and units.position = 9 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 9 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I hope it won''t rain tomorrow.", "sentence_fr": "J''espère qu''il ne pleuvra pas demain.", "tip": "\"Won''t\" reste ferme même après \"hope\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Maybe she''ll come to the party.", "sentence_fr": "Peut-être qu''elle viendra à la fête.", "tip": "\"Maybe\" exprime l''incertitude avec \"will\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 9 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 9 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This time next week, I''ll be on vacation.", "sentence_fr": "À cette heure la semaine prochaine, je serai en vacances.", "tip": "Le futur continu \"will be + -ing\" pour une action en cours plus tard."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He''ll be working when you arrive.", "sentence_fr": "Il sera en train de travailler quand tu arriveras.", "tip": "\"Will be working\" décrit une action en déroulement dans le futur."}'::jsonb);
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
  where languages.code = 'en' and units.position = 9 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 9 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What are your plans for the weekend?", "sentence_fr": "Quels sont tes projets pour le week-end ?", "tip": "\"Plans\" au pluriel pour parler d''intentions générales."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I''m thinking of learning to cook.", "sentence_fr": "Je pense apprendre à cuisiner.", "tip": "\"Thinking of\" + verbe en \"-ing\" pour une intention envisagée."}'::jsonb);
end $$;


-- ===== Unité 10 =====


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
  where languages.code = 'en' and units.position = 10 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 10 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This restaurant is better than the last one.", "sentence_fr": "Ce restaurant est meilleur que le précédent.", "tip": "\"Better\" est le comparatif irrégulier de \"good\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Things are getting worse every day.", "sentence_fr": "Les choses empirent chaque jour.", "tip": "\"Worse\" est le comparatif irrégulier de \"bad\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 10 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 10 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The more you practice, the better you get.", "sentence_fr": "Plus tu pratiques, mieux tu deviens.", "tip": "Structure \"the more... the better\" pour une évolution parallèle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The sooner we start, the sooner we finish.", "sentence_fr": "Plus tôt on commence, plus tôt on finit.", "tip": "Cette structure double comparatif s''enchaîne sans pause."}'::jsonb);
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
  where languages.code = 'en' and units.position = 10 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 10 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She sings as beautifully as a professional.", "sentence_fr": "Elle chante aussi bien qu''une professionnelle.", "tip": "\"As... as\" s''applique aussi aux adverbes, pas que les adjectifs."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He doesn''t work as hard as his colleague.", "sentence_fr": "Il ne travaille pas aussi dur que son collègue.", "tip": "La négation porte sur toute la comparaison d''égalité."}'::jsonb);
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
  where languages.code = 'en' and units.position = 10 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 10 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This is by far the best solution.", "sentence_fr": "C''est de loin la meilleure solution.", "tip": "\"By far\" renforce le superlatif, insiste sur l''écart net."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It''s one of the most beautiful places I know.", "sentence_fr": "C''est l''un des plus beaux endroits que je connaisse.", "tip": "\"One of the most\" + adjectif long + nom pluriel."}'::jsonb);
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
  where languages.code = 'en' and units.position = 10 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 10 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "My phone is similar to yours.", "sentence_fr": "Mon téléphone est similaire au tien.", "tip": "\"Similar to\", jamais \"similar than\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This city is completely different from mine.", "sentence_fr": "Cette ville est complètement différente de la mienne.", "tip": "\"Different from\" reste la forme la plus naturelle."}'::jsonb);
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
  where languages.code = 'en' and units.position = 10 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 10 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The weather today is much colder than yesterday.", "sentence_fr": "Le temps aujourd''hui est bien plus froid qu''hier.", "tip": "\"Much\" renforce un comparatif : much colder, much better."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This laptop is a bit more expensive.", "sentence_fr": "Cet ordinateur portable est un peu plus cher.", "tip": "\"A bit\" nuance légèrement un comparatif."}'::jsonb);
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
  where languages.code = 'en' and units.position = 10 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 10 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He is the tallest person in his family.", "sentence_fr": "C''est la personne la plus grande de sa famille.", "tip": "\"Tallest\" ajoute simplement \"-est\" pour un adjectif court."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This was the most difficult exam I''ve taken.", "sentence_fr": "C''était l''examen le plus difficile que j''ai passé.", "tip": "\"Most difficult\" pour un adjectif long de plus de deux syllabes."}'::jsonb);
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
  where languages.code = 'en' and units.position = 10 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 10 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Which do you prefer, tea or coffee?", "sentence_fr": "Tu préfères quoi, le thé ou le café ?", "tip": "\"Prefer\" s''accentue sur la 2e syllabe : pri-FEUR."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I''d rather stay home than go out tonight.", "sentence_fr": "Je préfère rester à la maison que sortir ce soir.", "tip": "\"Would rather... than\" pour exprimer une préférence claire."}'::jsonb);
end $$;
