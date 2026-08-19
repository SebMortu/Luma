-- ============================================
-- LUMA — Exercices 'Lecture à voix haute' — Unités 35 et 36 (C1) — CLÔTURE FINALE DES 36 UNITÉS
-- ============================================


-- ===== Unité 35 =====


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
  where languages.code = 'en' and units.position = 35 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 35 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Would it be possible to reschedule our meeting?", "sentence_fr": "Serait-il possible de reprogrammer notre réunion ?", "tip": "Registre très formel, typique d''un contexte professionnel."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Hey, can we push our meeting back a bit?", "sentence_fr": "Hé, on peut décaler notre réunion un peu ?", "tip": "Registre familier, adapté entre collègues proches."}'::jsonb);
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
  where languages.code = 'en' and units.position = 35 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 35 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I would be most grateful for your assistance.", "sentence_fr": "Je vous serais très reconnaissant de votre aide.", "tip": "\"Most grateful\" est une formule très polie et formelle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Thanks a ton, you really saved me there!", "sentence_fr": "Merci mille fois, tu m''as vraiment sauvé là !", "tip": "\"Thanks a ton\" est très familier, entre amis."}'::jsonb);
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
  where languages.code = 'en' and units.position = 35 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 35 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "We regret to inform you of the cancellation.", "sentence_fr": "Nous avons le regret de vous informer de l''annulation.", "tip": "Formule standard des courriers professionnels officiels."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Bad news, it''s cancelled.", "sentence_fr": "Mauvaise nouvelle, c''est annulé.", "tip": "Registre oral direct et informel, sans formalités."}'::jsonb);
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
  where languages.code = 'en' and units.position = 35 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 35 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Should you require further information, please contact us.", "sentence_fr": "Si vous avez besoin de plus d''informations, contactez-nous.", "tip": "\"Should you require\" est une inversion très formelle et écrite."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Let me know if you need anything else.", "sentence_fr": "Fais-moi signe si tu as besoin d''autre chose.", "tip": "Registre neutre à familier, très courant à l''oral."}'::jsonb);
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
  where languages.code = 'en' and units.position = 35 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 35 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I beg to differ on this particular matter.", "sentence_fr": "Je me permets de ne pas être d''accord sur ce point précis.", "tip": "\"I beg to differ\" est extrêmement formel et poli."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Nah, I don''t really agree with that.", "sentence_fr": "Non, je suis pas vraiment d''accord avec ça.", "tip": "\"Nah\" est très familier, à l''oral entre proches uniquement."}'::jsonb);
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
  where languages.code = 'en' and units.position = 35 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 35 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "It would be advisable to reconsider your approach.", "sentence_fr": "Il serait conseillé de reconsidérer votre approche.", "tip": "\"It would be advisable\" reste distant et professionnel."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "You might wanna rethink that, honestly.", "sentence_fr": "Tu devrais peut-être reconsidérer ça, honnêtement.", "tip": "\"Wanna\" marque un registre familier et décontracté."}'::jsonb);
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
  where languages.code = 'en' and units.position = 35 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 35 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Kindly find attached the requested documents.", "sentence_fr": "Veuillez trouver ci-joint les documents demandés.", "tip": "\"Kindly find attached\" est une formule d''email très formelle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Here''s the stuff you asked for, by the way.", "sentence_fr": "Voici les trucs que tu as demandés, au fait.", "tip": "\"Stuff\" et \"by the way\" marquent un registre très relâché."}'::jsonb);
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
  where languages.code = 'en' and units.position = 35 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 35 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "I trust this correspondence finds you well.", "sentence_fr": "J''espère que ce courrier vous trouve en bonne santé.", "tip": "Formule d''ouverture très formelle, typiquement britannique."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Hope you''re doing okay!", "sentence_fr": "J''espère que tu vas bien !", "tip": "Formule d''ouverture décontractée, usage quotidien courant."}'::jsonb);
end $$;


-- ===== Unité 36 =====


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
  where languages.code = 'en' and units.position = 36 and lessons.position = 1;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 36 / position 1 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Well, you know, it''s kind of complicated.", "sentence_fr": "Bon, tu sais, c''est un peu compliqué.", "tip": "\"Well, you know\" sont des marqueurs de discours pour gagner du temps."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "I mean, it could go either way, really.", "sentence_fr": "Enfin, ça pourrait aller dans les deux sens, vraiment.", "tip": "\"I mean\" reformule ou nuance ce qui vient d''être dit."}'::jsonb);
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
  where languages.code = 'en' and units.position = 36 and lessons.position = 2;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 36 / position 2 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "So, anyway, what were we talking about?", "sentence_fr": "Bon, bref, de quoi on parlait ?", "tip": "\"Anyway\" relance une conversation après une digression."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Right, so basically, here''s the plan.", "sentence_fr": "Bon, donc en gros, voici le plan.", "tip": "\"Basically\" introduit un résumé simplifié."}'::jsonb);
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
  where languages.code = 'en' and units.position = 36 and lessons.position = 3;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 36 / position 3 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "That''s actually a really good point.", "sentence_fr": "C''est en fait un très bon point.", "tip": "\"Actually\" nuance ou renforce une réaction spontanée."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Yeah, I see what you mean.", "sentence_fr": "Ouais, je vois ce que tu veux dire.", "tip": "\"I see what you mean\" montre l''écoute active dans une conversation."}'::jsonb);
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
  where languages.code = 'en' and units.position = 36 and lessons.position = 4;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 36 / position 4 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Sorry, could you say that again?", "sentence_fr": "Désolé, tu pourrais redire ça ?", "tip": "Formule naturelle pour demander une répétition poliment."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "Wait, what do you mean by that exactly?", "sentence_fr": "Attends, tu veux dire quoi exactement par là ?", "tip": "\"Wait\" interrompt naturellement pour clarifier."}'::jsonb);
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
  where languages.code = 'en' and units.position = 36 and lessons.position = 5;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 36 / position 5 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Anyway, long story short, it worked out.", "sentence_fr": "Bref, pour faire court, ça s''est bien passé.", "tip": "\"Long story short\" résume rapidement une histoire longue."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "To be honest, I wasn''t expecting that.", "sentence_fr": "Pour être honnête, je m''attendais pas à ça.", "tip": "\"To be honest\" introduit une opinion sincère et directe."}'::jsonb);
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
  where languages.code = 'en' and units.position = 36 and lessons.position = 6;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 36 / position 6 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "You know what I mean, right?", "sentence_fr": "Tu vois ce que je veux dire, non ?", "tip": "Cette formule cherche une confirmation implicite de l''interlocuteur."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "At the end of the day, it doesn''t really matter.", "sentence_fr": "En fin de compte, ça n''a pas vraiment d''importance.", "tip": "\"At the end of the day\" introduit une conclusion pragmatique."}'::jsonb);
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
  where languages.code = 'en' and units.position = 36 and lessons.position = 7;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 36 / position 7 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Honestly speaking, I have mixed feelings about this.", "sentence_fr": "Honnêtement, j''ai des sentiments partagés là-dessus.", "tip": "\"Honestly speaking\" prépare une opinion nuancée à venir."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "If you ask me, we should just go for it.", "sentence_fr": "Si tu veux mon avis, on devrait juste se lancer.", "tip": "\"If you ask me\" introduit une opinion personnelle assumée."}'::jsonb);
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
  where languages.code = 'en' and units.position = 36 and lessons.position = 8;

  if v_lesson_id is null then
    raise notice 'Leçon Unité 36 / position 8 introuvable, ignorée.';
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
    (v_lesson_id, 'speaking_practice', v_slot1, '{"sentence": "Anyway, that''s pretty much it for today.", "sentence_fr": "Bref, c''est à peu près tout pour aujourd''hui.", "tip": "\"Pretty much\" nuance une affirmation de façon naturelle."}'::jsonb),
    (v_lesson_id, 'speaking_practice', v_slot2, '{"sentence": "It was great catching up with you!", "sentence_fr": "C''était génial de discuter avec toi !", "tip": "\"Catching up\" désigne une conversation pour se donner des nouvelles."}'::jsonb);
end $$;
