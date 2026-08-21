-- ============================================
-- LUMA — Audit vocabulaire A2 à C1 (28 unités, 224 leçons)
-- Même pattern que l'audit A1 : sur les VRAIES leçons de vocabulaire
-- (phrasal verbs, idiomes, slang), le tableau récapitulatif n'affichait
-- que 2-3 expressions, alors que l'exercice matching en testait 2-3 de
-- plus, jamais montrées. Les leçons de grammaire (bilans, patterns
-- structurels) ne sont PAS concernées par ce pattern — leur champ
-- "subject" sert à nommer des catégories grammaticales, pas du
-- vocabulaire à mémoriser, donc rien à corriger là.
-- ============================================

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'figure out', 'affirmative', 'comprendre/résoudre', 'negative', '—'),jsonb_build_object('subject', 'follow up', 'affirmative', 'faire un suivi', 'negative', '—'),jsonb_build_object('subject', 'point out', 'affirmative', 'souligner', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16)
  and position = 5;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'fall for', 'affirmative', 'tomber amoureux de', 'negative', '—'),jsonb_build_object('subject', 'look after', 'affirmative', 's''occuper de', 'negative', '—'),jsonb_build_object('subject', 'grow apart', 'affirmative', 's''éloigner', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 16)
  and position = 7;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'cheer up', 'affirmative', 'remonter le moral', 'negative', '—'),jsonb_build_object('subject', 'calm down', 'affirmative', 'se calmer', 'negative', '—'),jsonb_build_object('subject', 'freak out', 'affirmative', 'paniquer', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29)
  and position = 5;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'ramp up', 'affirmative', 'augmenter', 'negative', '—'),jsonb_build_object('subject', 'phase out', 'affirmative', 'supprimer progressivement', 'negative', '—'),jsonb_build_object('subject', 'kick off', 'affirmative', 'démarrer', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 29)
  and position = 6;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'hang in there', 'affirmative', 'tiens bon', 'negative', '—'),jsonb_build_object('subject', 'keep going', 'affirmative', 'continue', 'negative', '—'),jsonb_build_object('subject', 'don''t give in', 'affirmative', 'ne cède pas', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34)
  and position = 5;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'a lesson learned', 'affirmative', 'une leçon apprise', 'negative', '—'),jsonb_build_object('subject', 'fail forward', 'affirmative', 'échouer pour progresser', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34)
  and position = 6;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'call the shots', 'affirmative', 'prendre les décisions', 'negative', '—'),jsonb_build_object('subject', 'get ahead', 'affirmative', 'progresser / prendre de l''avance', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 34)
  and position = 7;

update lessons
set content = jsonb_set(content, '{table}', (content->'table') || jsonb_build_array(jsonb_build_object('subject', 'my bad', 'affirmative', 'c''est ma faute', 'negative', '—'),jsonb_build_object('subject', 'for real', 'affirmative', 'vraiment/sérieux', 'negative', '—'),jsonb_build_object('subject', 'sick (adjectif familier)', 'affirmative', 'génial (argot)', 'negative', '—')))
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35)
  and position = 7;
