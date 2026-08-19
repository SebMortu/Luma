-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 23 et 24 (B1) — CLÔTURE DU NIVEAU B1
-- ============================================


-- ===== Unité 23 =====


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
  where languages.code = 'en' and units.position = 23 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 23 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I enjoy reading before bed.", "sentence_fr": "J''aime lire avant de dormir.", "tip": "\"Enjoy\" est toujours suivi d''un verbe en \"-ing\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She avoids eating too much sugar.", "sentence_fr": "Elle évite de manger trop de sucre.", "tip": "\"Avoid\" est aussi toujours suivi de \"-ing\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 23 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 23 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I want to learn a new language.", "sentence_fr": "Je veux apprendre une nouvelle langue.", "tip": "\"Want\" est suivi de \"to\" + infinitif."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She decided to move to another city.", "sentence_fr": "Elle a décidé de déménager dans une autre ville.", "tip": "\"Decided\" est également suivi de \"to\" + infinitif."}'::jsonb);
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
  where languages.code = 'en' and units.position = 23 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 23 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I stopped smoking two years ago.", "sentence_fr": "J''ai arrêté de fumer il y a deux ans.", "tip": "\"Stop + -ing\" signifie arrêter une habitude."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He stopped to smoke a cigarette.", "sentence_fr": "Il s''est arrêté pour fumer une cigarette.", "tip": "\"Stop + to\" signifie s''arrêter dans un but précis."}'::jsonb);
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
  where languages.code = 'en' and units.position = 23 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 23 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I remember locking the door.", "sentence_fr": "Je me souviens avoir fermé la porte.", "tip": "\"Remember + -ing\" pour un souvenir d''une action passée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Remember to lock the door before leaving.", "sentence_fr": "Souviens-toi de fermer la porte avant de partir.", "tip": "\"Remember + to\" pour une tâche future à ne pas oublier."}'::jsonb);
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
  where languages.code = 'en' and units.position = 23 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 23 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I regret telling her the truth.", "sentence_fr": "Je regrette de lui avoir dit la vérité.", "tip": "\"Regret + -ing\" pour une action passée regrettée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I regret to inform you of the delay.", "sentence_fr": "J''ai le regret de vous informer du retard.", "tip": "\"Regret + to\" est très formel, souvent en contexte professionnel."}'::jsonb);
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
  where languages.code = 'en' and units.position = 23 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 23 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She let her children stay up late.", "sentence_fr": "Elle a laissé ses enfants veiller tard.", "tip": "\"Let\" est suivi d''un infinitif sans \"to\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "My parents made me clean my room.", "sentence_fr": "Mes parents m''ont obligé à ranger ma chambre.", "tip": "\"Make\" est aussi suivi d''un infinitif sans \"to\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 23 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 23 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''d rather stay home tonight.", "sentence_fr": "Je préfère rester à la maison ce soir.", "tip": "\"Would rather\" est suivi d''un infinitif sans \"to\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "You''d better hurry up.", "sentence_fr": "Tu ferais mieux de te dépêcher.", "tip": "\"Had better\" est aussi suivi d''un infinitif sans \"to\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 23 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 23 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I look forward to seeing you soon.", "sentence_fr": "J''ai hâte de te voir bientôt.", "tip": "\"Look forward to\" est suivi de \"-ing\", pas de l''infinitif."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She''s used to working long hours.", "sentence_fr": "Elle a l''habitude de travailler de longues heures.", "tip": "\"Be used to\" + \"-ing\" pour une habitude acquise."}'::jsonb);
end $$;


-- ===== Unité 24 =====


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
  where languages.code = 'en' and units.position = 24 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 24 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "You must have forgotten your keys.", "sentence_fr": "Tu as dû oublier tes clés.", "tip": "\"Must have + participe\" pour une déduction forte au passé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She can''t have known about this.", "sentence_fr": "Elle n''a pas pu être au courant de ça.", "tip": "\"Can''t have\" exprime une quasi-impossibilité passée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 24 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 24 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He might have missed the train.", "sentence_fr": "Il a peut-être raté le train.", "tip": "\"Might have\" pour une possibilité passée incertaine."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "They could have called us earlier.", "sentence_fr": "Ils auraient pu nous appeler plus tôt.", "tip": "\"Could have\" exprime un reproche ou une possibilité non réalisée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 24 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 24 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "You should have told me sooner.", "sentence_fr": "Tu aurais dû me le dire plus tôt.", "tip": "\"Should have\" exprime un regret ou un reproche."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I shouldn''t have eaten so much.", "sentence_fr": "Je n''aurais pas dû manger autant.", "tip": "\"Shouldn''t have\" pour un regret sur une action passée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 24 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 24 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She needn''t have worried so much.", "sentence_fr": "Elle n''avait pas besoin de tant s''inquiéter.", "tip": "\"Needn''t have\" indique une action inutile mais faite."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "You didn''t need to bring anything.", "sentence_fr": "Tu n''avais pas besoin d''apporter quoi que ce soit.", "tip": "\"Didn''t need to\" indique simplement l''absence d''obligation."}'::jsonb);
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
  where languages.code = 'en' and units.position = 24 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 24 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He must be exhausted after that trip.", "sentence_fr": "Il doit être épuisé après ce voyage.", "tip": "\"Must be\" pour une déduction logique au présent."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "This can''t be right.", "sentence_fr": "Ça ne peut pas être juste.", "tip": "\"Can''t be\" exprime une quasi-certitude négative."}'::jsonb);
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
  where languages.code = 'en' and units.position = 24 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 24 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She may have already left.", "sentence_fr": "Elle est peut-être déjà partie.", "tip": "\"May have\" pour une possibilité passée, plus formel que \"might\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It could have been worse.", "sentence_fr": "Ça aurait pu être pire.", "tip": "\"Could have been\" pour imaginer une alternative passée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 24 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 24 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "You ought to apologize to her.", "sentence_fr": "Tu devrais t''excuser auprès d''elle.", "tip": "\"Ought to\" équivaut à \"should\", plus formel."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "We were supposed to meet at six.", "sentence_fr": "Nous étions censés nous retrouver à six heures.", "tip": "\"Was/were supposed to\" pour un arrangement non respecté."}'::jsonb);
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
  where languages.code = 'en' and units.position = 24 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 24 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I''d rather you didn''t tell anyone.", "sentence_fr": "Je préférerais que tu ne le dises à personne.", "tip": "\"I''d rather you\" + prétérit pour un souhait concernant autrui."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It''s high time we left.", "sentence_fr": "Il est grand temps qu''on parte.", "tip": "\"It''s high time\" + prétérit exprime une urgence."}'::jsonb);
end $$;
