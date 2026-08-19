-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 31 et 32 (C1)
-- ============================================


-- ===== Unité 31 =====


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
  where languages.code = 'en' and units.position = 31 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 31 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It was John who broke the window.", "sentence_fr": "C''est John qui a cassé la fenêtre.", "tip": "\"It was... who\" met en relief le responsable de l''action."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It is honesty that matters most.", "sentence_fr": "C''est l''honnêteté qui compte le plus.", "tip": "\"It is... that\" isole l''élément le plus important de la phrase."}'::jsonb);
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
  where languages.code = 'en' and units.position = 31 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 31 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "What I need is a good night''s sleep.", "sentence_fr": "Ce dont j''ai besoin, c''est d''une bonne nuit de sommeil.", "tip": "\"What I need is\" met l''accent sur le besoin exprimé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "What surprised me was her honesty.", "sentence_fr": "Ce qui m''a surpris, c''est son honnêteté.", "tip": "\"What surprised me was\" structure emphatique introduite par \"what\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 31 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 31 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Never have I seen such dedication.", "sentence_fr": "Jamais je n''ai vu un tel dévouement.", "tip": "Inversion après \"never\" en début de phrase pour l''emphase."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Rarely do we get such an opportunity.", "sentence_fr": "Rarement avons-nous une telle opportunité.", "tip": "Inversion après un adverbe de fréquence négatif placé en tête."}'::jsonb);
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
  where languages.code = 'en' and units.position = 31 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 31 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Little did I know what awaited me.", "sentence_fr": "Je ne savais pas du tout ce qui m''attendait.", "tip": "\"Little did I know\" est une structure emphatique classique."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Not until later did she understand.", "sentence_fr": "Ce n''est que plus tard qu''elle a compris.", "tip": "\"Not until\" en tête de phrase entraîne une inversion."}'::jsonb);
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
  where languages.code = 'en' and units.position = 31 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 31 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "So beautiful was the view that we stopped.", "sentence_fr": "La vue était si belle que nous nous sommes arrêtés.", "tip": "Inversion après \"so + adjectif\" en début de phrase."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Such was her determination that nothing stopped her.", "sentence_fr": "Telle était sa détermination que rien ne l''arrêtait.", "tip": "\"Such was\" pour une emphase élégante et littéraire."}'::jsonb);
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
  where languages.code = 'en' and units.position = 31 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 31 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Do come and visit us sometime.", "sentence_fr": "Viens vraiment nous rendre visite un jour.", "tip": "\"Do\" emphatique renforce une invitation sincère."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I did tell you this would happen.", "sentence_fr": "Je t''avais bien dit que ça arriverait.", "tip": "\"Did\" emphatique insiste sur la véracité passée d''une affirmation."}'::jsonb);
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
  where languages.code = 'en' and units.position = 31 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 31 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It is precisely this issue that concerns me.", "sentence_fr": "C''est précisément ce problème qui me préoccupe.", "tip": "\"It is precisely\" renforce l''emphase sur l''élément isolé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It was only then that I realized my mistake.", "sentence_fr": "Ce n''est qu''alors que j''ai réalisé mon erreur.", "tip": "\"It was only then that\" structure emphatique temporelle."}'::jsonb);
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
  where languages.code = 'en' and units.position = 31 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 31 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "All I want is a little peace and quiet.", "sentence_fr": "Tout ce que je veux, c''est un peu de calme.", "tip": "\"All I want is\" isole le désir essentiel de la phrase."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "All she did was apologize.", "sentence_fr": "Tout ce qu''elle a fait, c''est s''excuser.", "tip": "\"All she did was\" minimise ou souligne une action selon le ton."}'::jsonb);
end $$;


-- ===== Unité 32 =====


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
  where languages.code = 'en' and units.position = 32 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 32 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He implied that the project had failed.", "sentence_fr": "Il a laissé entendre que le projet avait échoué.", "tip": "\"Implied that\" rapporte une suggestion indirecte, pas explicite."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She hinted that she might resign.", "sentence_fr": "Elle a laissé entendre qu''elle pourrait démissionner.", "tip": "\"Hinted that\" pour une allusion subtile et rapportée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 32 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 32 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He denied having stolen the money.", "sentence_fr": "Il a nié avoir volé l''argent.", "tip": "\"Denied having\" + participe passé pour nier une action passée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She regretted not having told the truth sooner.", "sentence_fr": "Elle a regretté de ne pas avoir dit la vérité plus tôt.", "tip": "\"Regretted not having\" combine regret et négation au passé."}'::jsonb);
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
  where languages.code = 'en' and units.position = 32 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 32 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The report alleges that funds were misused.", "sentence_fr": "Le rapport allègue que des fonds ont été détournés.", "tip": "\"Alleges that\" reste prudent, sans confirmer l''accusation."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Witnesses testified that they had seen nothing.", "sentence_fr": "Les témoins ont témoigné n''avoir rien vu.", "tip": "\"Testified that\" pour rapporter une déclaration officielle."}'::jsonb);
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
  where languages.code = 'en' and units.position = 32 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 32 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He insisted that she be present at the meeting.", "sentence_fr": "Il a insisté pour qu''elle soit présente à la réunion.", "tip": "Le subjonctif \"be\" après \"insisted that\", sans \"s\" à la 3e personne."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The doctor recommended that he rest for a week.", "sentence_fr": "Le médecin a recommandé qu''il se repose une semaine.", "tip": "\"Recommended that\" + subjonctif, structure formelle."}'::jsonb);
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
  where languages.code = 'en' and units.position = 32 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 32 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She confessed that she had never really liked him.", "sentence_fr": "Elle a avoué qu''elle ne l''avait en fait jamais vraiment aimé.", "tip": "\"Confessed that\" pour un aveu personnel et sincère."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He conceded that his plan had a flaw.", "sentence_fr": "Il a concédé que son plan avait un défaut.", "tip": "\"Conceded that\" pour admettre un point à contrecœur."}'::jsonb);
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
  where languages.code = 'en' and units.position = 32 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 32 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The committee ruled that the decision was unfair.", "sentence_fr": "Le comité a jugé que la décision était injuste.", "tip": "\"Ruled that\" pour rapporter une décision officielle et formelle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Experts warned that the situation could worsen.", "sentence_fr": "Les experts ont averti que la situation pourrait empirer.", "tip": "\"Warned that\" introduit une mise en garde rapportée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 32 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 32 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "She remarked that the weather had been unusual.", "sentence_fr": "Elle a fait remarquer que le temps avait été inhabituel.", "tip": "\"Remarked that\" pour une observation rapportée, ton neutre."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He observed that attitudes were changing.", "sentence_fr": "Il a observé que les attitudes changeaient.", "tip": "\"Observed that\" insiste sur une constatation réfléchie."}'::jsonb);
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
  where languages.code = 'en' and units.position = 32 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 32 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It was rumored that the deal had fallen through.", "sentence_fr": "On racontait que l''accord était tombé à l''eau.", "tip": "\"It was rumored\" rapporte une information non confirmée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Sources suggest that changes are imminent.", "sentence_fr": "Des sources suggèrent que des changements sont imminents.", "tip": "\"Sources suggest\" est typique du langage journalistique."}'::jsonb);
end $$;
