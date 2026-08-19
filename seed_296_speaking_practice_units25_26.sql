-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 25 et 26 (B2)
-- ============================================


-- ===== Unité 25 =====


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
  where languages.code = 'en' and units.position = 25 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 25 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "If I had known, I wouldn''t have come.", "sentence_fr": "Si j''avais su, je ne serais pas venu.", "tip": "Type 3 : plus-que-parfait après \"if\", \"would have\" dans la principale."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If she had studied harder, she would have passed.", "sentence_fr": "Si elle avait étudié plus dur, elle aurait réussi.", "tip": "Hypothèse irréelle sur le passé, conséquence imaginée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 25 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 25 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Had I known the truth, I would have acted differently.", "sentence_fr": "Si j''avais su la vérité, j''aurais agi différemment.", "tip": "Inversion sans \"if\" : \"had I known\" remplace \"if I had known\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Were I in your position, I''d think twice.", "sentence_fr": "Si j''étais à ta place, j''y réfléchirais à deux fois.", "tip": "Inversion avec \"were\" pour une hypothèse présente formelle."}'::jsonb);
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
  where languages.code = 'en' and units.position = 25 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 25 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "If it hadn''t rained, we would have gone hiking.", "sentence_fr": "S''il n''avait pas plu, nous serions allés randonner.", "tip": "Négation dans la condition passée, conséquence irréelle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I wouldn''t have called if I hadn''t been worried.", "sentence_fr": "Je n''aurais pas appelé si je n''avais pas été inquiet.", "tip": "L''ordre des propositions peut s''inverser sans changer le sens."}'::jsonb);
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
  where languages.code = 'en' and units.position = 25 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 25 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "If I won the lottery, I would quit my job.", "sentence_fr": "Si je gagnais à la loterie, je quitterais mon travail.", "tip": "Hypothèse type 2 : peu probable mais possible dans le présent."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If I had won the lottery, I would have quit.", "sentence_fr": "Si j''avais gagné à la loterie, j''aurais quitté.", "tip": "Contraste avec le type 3 : hypothèse impossible sur le passé."}'::jsonb);
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
  where languages.code = 'en' and units.position = 25 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 25 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Mixed conditional: if I had studied medicine, I would be a doctor now.", "sentence_fr": "Conditionnel mixte : si j''avais étudié la médecine, je serais médecin maintenant.", "tip": "Condition passée, conséquence présente : c''est un conditionnel mixte."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If she weren''t so shy, she would have spoken up.", "sentence_fr": "Si elle n''était pas si timide, elle aurait pris la parole.", "tip": "Trait de caractère présent, conséquence sur une action passée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 25 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 25 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "But for your help, I would have failed.", "sentence_fr": "Sans ton aide, j''aurais échoué.", "tip": "\"But for\" est une façon formelle d''introduire une condition."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Without your support, this wouldn''t have been possible.", "sentence_fr": "Sans ton soutien, ça n''aurait pas été possible.", "tip": "\"Without\" + nom pour une condition implicite."}'::jsonb);
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
  where languages.code = 'en' and units.position = 25 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 25 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I wish I had studied harder in school.", "sentence_fr": "J''aimerais avoir étudié plus dur à l''école.", "tip": "\"Wish + plus-que-parfait\" pour un regret sur le passé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I wish I were taller.", "sentence_fr": "J''aimerais être plus grand.", "tip": "\"Wish + prétérit\" pour un souhait présent irréalisable."}'::jsonb);
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
  where languages.code = 'en' and units.position = 25 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 25 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "If only I had listened to my parents.", "sentence_fr": "Si seulement j''avais écouté mes parents.", "tip": "\"If only\" renforce l''émotion du regret, plus que \"wish\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If only she would call me back.", "sentence_fr": "Si seulement elle me rappelait.", "tip": "\"If only\" + \"would\" exprime une frustration face à une situation présente."}'::jsonb);
end $$;


-- ===== Unité 26 =====


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
  where languages.code = 'en' and units.position = 26 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 26 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "By the time she arrived, the movie had already started.", "sentence_fr": "Au moment où elle est arrivée, le film avait déjà commencé.", "tip": "\"By the time\" marque un point de repère dans le passé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "He had already left when I called.", "sentence_fr": "Il était déjà parti quand j''ai appelé.", "tip": "\"Had left\" précède clairement \"called\" dans la chronologie."}'::jsonb);
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
  where languages.code = 'en' and units.position = 26 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 26 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I had never seen such a beautiful sunset before.", "sentence_fr": "Je n''avais jamais vu un si beau coucher de soleil avant.", "tip": "\"Had never seen\" pour une expérience inédite avant un moment donné."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She had never traveled abroad until that summer.", "sentence_fr": "Elle n''avait jamais voyagé à l''étranger jusqu''à cet été-là.", "tip": "\"Until that summer\" marque la fin de cette absence d''expérience."}'::jsonb);
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
  where languages.code = 'en' and units.position = 26 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 26 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Once he had finished eating, he left the table.", "sentence_fr": "Une fois qu''il avait fini de manger, il a quitté la table.", "tip": "\"Once\" + plus-que-parfait insiste sur l''achèvement avant l''action suivante."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "After she had locked the door, she realized she''d forgotten her keys.", "sentence_fr": "Après avoir fermé la porte, elle a réalisé qu''elle avait oublié ses clés.", "tip": "Deux plus-que-parfaits enchaînés pour une séquence complexe."}'::jsonb);
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
  where languages.code = 'en' and units.position = 26 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 26 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "No sooner had I arrived than it started to rain.", "sentence_fr": "À peine étais-je arrivé qu''il a commencé à pleuvoir.", "tip": "\"No sooner... than\" avec inversion, structure littéraire."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Hardly had she sat down when the phone rang.", "sentence_fr": "À peine s''était-elle assise que le téléphone a sonné.", "tip": "\"Hardly... when\" fonctionne comme \"no sooner... than\"."}'::jsonb);
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
  where languages.code = 'en' and units.position = 26 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 26 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I realized I had made a terrible mistake.", "sentence_fr": "J''ai réalisé que j''avais fait une terrible erreur.", "tip": "Le plus-que-parfait montre l''antériorité par rapport à \"realized\"."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "She admitted she had lied about her age.", "sentence_fr": "Elle a admis qu''elle avait menti sur son âge.", "tip": "\"Had lied\" précède clairement le moment de l''aveu."}'::jsonb);
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
  where languages.code = 'en' and units.position = 26 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 26 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The house looked exactly as it had before the fire.", "sentence_fr": "La maison ressemblait exactement à ce qu''elle était avant l''incendie.", "tip": "Comparaison entre un état présent et un état antérieur au passé."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Everything had changed since I had last visited.", "sentence_fr": "Tout avait changé depuis ma dernière visite.", "tip": "Double plus-que-parfait pour deux références au passé."}'::jsonb);
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
  where languages.code = 'en' and units.position = 26 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 26 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "He wished he hadn''t said such hurtful things.", "sentence_fr": "Il aurait aimé ne pas avoir dit des choses aussi blessantes.", "tip": "\"Wish + hadn''t\" pour un regret profond sur une action passée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If only I hadn''t wasted so much time.", "sentence_fr": "Si seulement je n''avais pas gaspillé autant de temps.", "tip": "\"If only + hadn''t\" renforce l''intensité du regret."}'::jsonb);
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
  where languages.code = 'en' and units.position = 26 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 26 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "The letter that had arrived that morning changed everything.", "sentence_fr": "La lettre arrivée ce matin-là a tout changé.", "tip": "\"That had arrived\" précise l''antériorité dans une proposition relative."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "The decision she had made years earlier still affected her.", "sentence_fr": "La décision qu''elle avait prise des années plus tôt l''affectait encore.", "tip": "\"Years earlier\" précise la distance temporelle du plus-que-parfait."}'::jsonb);
end $$;
