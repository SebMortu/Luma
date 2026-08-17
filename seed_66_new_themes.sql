-- ============================================
-- LUMA — Nouvelles thématiques 16 et 17
-- ============================================

with lang as (select id from languages where code = 'en')
insert into scenario_themes (language_id, category, title, position)
select lang.id, v.category, v.title, v.position from lang, (values
  ('pays', 'Road trip en Australie', 16),
  ('quotidien', 'Sport', 17)
) as v(category, title, position);
