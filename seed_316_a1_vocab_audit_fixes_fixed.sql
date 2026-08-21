-- ============================================
-- LUMA — Audit complet du vocabulaire A1 (Unités 1-8, 64 leçons)
-- Correction du pattern systémique : les leçons de vocabulaire n'affichaient
-- que 3-4 mots dans leur tableau récapitulatif, alors que l'exercice
-- "matching" en testait 3 de plus, jamais montrés ni enseignés explicitement.
-- Ce correctif complète chaque tableau avec les mots manquants.
-- (Le cas Unité 1 / Leçon 7 "objets du quotidien" — wallet/umbrella/glasses —
-- avait déjà été identifié manuellement et suit le même correctif ci-dessous.)
-- ============================================

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(
  jsonb_build_object('subject', 'wallet', 'affirmative', 'portefeuille', 'negative', '—'),
  jsonb_build_object('subject', 'umbrella', 'affirmative', 'parapluie', 'negative', '—'),
  jsonb_build_object('subject', 'glasses', 'affirmative', 'lunettes', 'negative', '—')
))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 1)
  and position = 7;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'chef', 'affirmative', 'cuisinier', 'negative', '—'),jsonb_build_object('subject', 'farmer', 'affirmative', 'agriculteur', 'negative', '—'),jsonb_build_object('subject', 'driver', 'affirmative', 'chauffeur', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2)
  and position = 6;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'go shopping', 'affirmative', 'faire du shopping', 'negative', '—'),jsonb_build_object('subject', 'meet friends', 'affirmative', 'voir des amis', 'negative', '—'),jsonb_build_object('subject', 'stay home', 'affirmative', 'rester à la maison', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 2)
  and position = 8;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'dress', 'affirmative', 'robe', 'negative', '—'),jsonb_build_object('subject', 'skirt', 'affirmative', 'jupe', 'negative', '—'),jsonb_build_object('subject', 'hat', 'affirmative', 'chapeau', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3)
  and position = 6;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'hallway', 'affirmative', 'couloir', 'negative', '—'),jsonb_build_object('subject', 'garage', 'affirmative', 'garage', 'negative', '—'),jsonb_build_object('subject', 'basement', 'affirmative', 'sous-sol', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3)
  and position = 7;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'in front of', 'affirmative', 'devant', 'negative', '—'),jsonb_build_object('subject', 'behind', 'affirmative', 'derrière', 'negative', '—'),jsonb_build_object('subject', 'between', 'affirmative', 'entre', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 3)
  and position = 8;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'shoulder', 'affirmative', 'épaule', 'negative', '—'),jsonb_build_object('subject', 'knee', 'affirmative', 'genou', 'negative', '—'),jsonb_build_object('subject', 'finger', 'affirmative', 'doigt', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4)
  and position = 5;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'nephew', 'affirmative', 'neveu', 'negative', '—'),jsonb_build_object('subject', 'grandson', 'affirmative', 'petit-fils', 'negative', '—'),jsonb_build_object('subject', 'in-laws', 'affirmative', 'beaux-parents', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4)
  and position = 6;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'cheese', 'affirmative', 'fromage', 'negative', '—'),jsonb_build_object('subject', 'chicken', 'affirmative', 'poulet', 'negative', '—'),jsonb_build_object('subject', 'fish', 'affirmative', 'poisson', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 4)
  and position = 7;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'foggy', 'affirmative', 'brumeux', 'negative', '—'),jsonb_build_object('subject', 'stormy', 'affirmative', 'orageux', 'negative', '—'),jsonb_build_object('subject', 'hot', 'affirmative', 'chaud', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5)
  and position = 6;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'subway', 'affirmative', 'métro', 'negative', '—'),jsonb_build_object('subject', 'boat', 'affirmative', 'bateau', 'negative', '—'),jsonb_build_object('subject', 'taxi', 'affirmative', 'taxi', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 5)
  and position = 7;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'fever', 'affirmative', 'fièvre', 'negative', '—'),jsonb_build_object('subject', 'cough', 'affirmative', 'toux', 'negative', '—'),jsonb_build_object('subject', 'sore throat', 'affirmative', 'mal de gorge', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6)
  and position = 7;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'trip', 'affirmative', 'voyage', 'negative', '—'),jsonb_build_object('subject', 'souvenir', 'affirmative', 'souvenir (objet)', 'negative', '—'),jsonb_build_object('subject', 'postcard', 'affirmative', 'carte postale', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 6)
  and position = 8;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'exciting', 'affirmative', 'passionnant', 'negative', '—'),jsonb_build_object('subject', 'tiring', 'affirmative', 'fatigant', 'negative', '—'),jsonb_build_object('subject', 'relaxing', 'affirmative', 'relaxant', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 7)
  and position = 7;
