-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 27 et 28 (B2)
-- ============================================


-- ===== Unité 27 =====


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
  where languages.code = 'en' and units.position = 27 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 27 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I was given a warning by my manager.", "sentence_fr": "J''ai reçu un avertissement de mon manager.", "tip": "Passif avec double complément : \"I was given\" au lieu de \"a warning was given to me\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She was offered a promotion last month.", "sentence_fr": "On lui a offert une promotion le mois dernier.", "tip": "Le bénéficiaire devient sujet, structure typiquement anglaise."}'::jsonb);
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
  where languages.code = 'en' and units.position = 27 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 27 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The suspect is believed to have fled the country.", "sentence_fr": "Le suspect est présumé avoir fui le pays.", "tip": "Passif + infinitif parfait pour rapporter une croyance sur le passé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He is thought to be the best candidate.", "sentence_fr": "Il est considéré comme le meilleur candidat.", "tip": "\"Is thought to be\" nuance une opinion générale sans l''affirmer."}'::jsonb);
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
  where languages.code = 'en' and units.position = 27 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 27 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The building needs to be renovated.", "sentence_fr": "Le bâtiment a besoin d''être rénové.", "tip": "\"Needs to be\" + participe passé pour une nécessité passive."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This issue requires to be addressed immediately.", "sentence_fr": "Ce problème doit être traité immédiatement.", "tip": "Structure passive pour insister sur l''urgence de l''action."}'::jsonb);
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
  where languages.code = 'en' and units.position = 27 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 27 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Having been warned twice, he finally listened.", "sentence_fr": "Ayant été averti deux fois, il a finalement écouté.", "tip": "Participe passif en début de phrase pour une cause antérieure."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Being asked to leave, she felt embarrassed.", "sentence_fr": "S''étant fait demander de partir, elle s''est sentie gênée.", "tip": "\"Being asked\" introduit une circonstance passive simultanée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 27 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 27 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The project is said to be finished by June.", "sentence_fr": "Le projet est censé être terminé d''ici juin.", "tip": "\"Is said to be\" rapporte une information sans en confirmer la source."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The bridge is expected to be completed next year.", "sentence_fr": "Le pont devrait être achevé l''année prochaine.", "tip": "\"Is expected to\" exprime une anticipation générale."}'::jsonb);
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
  where languages.code = 'en' and units.position = 27 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 27 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It is rumored that the company will close.", "sentence_fr": "On raconte que l''entreprise va fermer.", "tip": "\"It is rumored that\" introduit une rumeur non confirmée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It has been reported that prices will rise.", "sentence_fr": "Il a été rapporté que les prix vont augmenter.", "tip": "\"It has been reported\" attribue l''information à une source officielle."}'::jsonb);
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
  where languages.code = 'en' and units.position = 27 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 27 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Get your car washed before the trip.", "sentence_fr": "Fais laver ta voiture avant le voyage.", "tip": "\"Get + objet + participe passé\" pour faire faire quelque chose."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I had my hair cut yesterday.", "sentence_fr": "Je me suis fait couper les cheveux hier.", "tip": "\"Have + objet + participe passé\" est plus formel que \"get\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 27 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 27 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The decision was made without consulting us.", "sentence_fr": "La décision a été prise sans nous consulter.", "tip": "\"Without consulting\" ajoute une nuance critique au passif."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Mistakes were made throughout the project.", "sentence_fr": "Des erreurs ont été commises tout au long du projet.", "tip": "Le passif évite de désigner un responsable précis."}'::jsonb);
end $$;


-- ===== Unité 28 =====


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
  where languages.code = 'en' and units.position = 28 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 28 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "On the one hand, it''s expensive; on the other hand, it''s worth it.", "sentence_fr": "D''un côté c''est cher, de l''autre ça en vaut la peine.", "tip": "\"On the one hand... on the other hand\" structure un argument équilibré."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "While I understand your point, I still disagree.", "sentence_fr": "Bien que je comprenne ton point de vue, je reste en désaccord.", "tip": "\"While\" ici introduit une concession avant l''opposition."}'::jsonb);
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
  where languages.code = 'en' and units.position = 28 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 28 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This clearly demonstrates that change is needed.", "sentence_fr": "Cela démontre clairement qu''un changement est nécessaire.", "tip": "\"Clearly demonstrates\" renforce une affirmation argumentative."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The evidence strongly suggests otherwise.", "sentence_fr": "Les preuves suggèrent fortement le contraire.", "tip": "\"Strongly suggests\" nuance sans être catégorique."}'::jsonb);
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
  where languages.code = 'en' and units.position = 28 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 28 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Furthermore, this approach saves both time and money.", "sentence_fr": "De plus, cette approche fait gagner du temps et de l''argent.", "tip": "\"Furthermore\" ajoute un argument supplémentaire, ton formel."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Moreover, the results speak for themselves.", "sentence_fr": "De plus, les résultats parlent d''eux-mêmes.", "tip": "\"Moreover\" est interchangeable avec \"furthermore\" à l''écrit formel."}'::jsonb);
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
  where languages.code = 'en' and units.position = 28 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 28 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "However, there are some drawbacks to consider.", "sentence_fr": "Cependant, il y a quelques inconvénients à considérer.", "tip": "\"However\" introduit une nuance ou une objection."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Nevertheless, we should proceed with caution.", "sentence_fr": "Néanmoins, nous devrions procéder avec prudence.", "tip": "\"Nevertheless\" est plus formel que \"but\" pour nuancer."}'::jsonb);
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
  where languages.code = 'en' and units.position = 28 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 28 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "This raises an important question about ethics.", "sentence_fr": "Cela soulève une question importante sur l''éthique.", "tip": "\"Raises a question\" introduit une problématique argumentative."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It''s worth considering the long-term consequences.", "sentence_fr": "Il vaut la peine de considérer les conséquences à long terme.", "tip": "\"It''s worth considering\" invite à la réflexion approfondie."}'::jsonb);
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
  where languages.code = 'en' and units.position = 28 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 28 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Critics argue that this policy is flawed.", "sentence_fr": "Les critiques soutiennent que cette politique est erronée.", "tip": "\"Critics argue that\" rapporte une opposition sans y adhérer."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Proponents claim it will boost the economy.", "sentence_fr": "Les partisans affirment que ça stimulera l''économie.", "tip": "\"Proponents claim\" présente un point de vue favorable, distancié."}'::jsonb);
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
  where languages.code = 'en' and units.position = 28 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 28 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "In conclusion, the benefits outweigh the risks.", "sentence_fr": "En conclusion, les bénéfices l''emportent sur les risques.", "tip": "\"In conclusion\" introduit la synthèse finale d''un argument."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "To sum up, we need a more sustainable approach.", "sentence_fr": "Pour résumer, nous avons besoin d''une approche plus durable.", "tip": "\"To sum up\" est une alternative plus courante à l''oral."}'::jsonb);
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
  where languages.code = 'en' and units.position = 28 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 28 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It could be argued that the results are misleading.", "sentence_fr": "On pourrait soutenir que les résultats sont trompeurs.", "tip": "\"It could be argued\" nuance une critique de façon prudente."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Some would say this is simply not enough.", "sentence_fr": "Certains diraient que ce n''est tout simplement pas suffisant.", "tip": "\"Some would say\" attribue l''opinion à un groupe non défini."}'::jsonb);
end $$;
