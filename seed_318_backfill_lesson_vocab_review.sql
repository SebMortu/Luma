-- ============================================
-- LUMA — Rattrapage : alimente la file de révision de vocabulaire à partir
-- de TOUTES les leçons déjà complétées par les utilisateurs (pas seulement
-- les futures leçons). Sans ça, seuls les mots des leçons terminées APRÈS
-- ce correctif de code seraient proposés en révision.
-- ============================================

insert into user_review_queue (user_id, item_type, item_id, content_en, content_fr, source_label, next_review_date)
select
  up.user_id,
  'vocabulary',
  null,
  entry->>'subject',
  entry->>'affirmative',
  'Leçon : ' || l.title,
  current_date
from user_progress up
join lessons l on l.id = up.lesson_id
cross join lateral jsonb_array_elements(coalesce(l.content->'table', '[]'::jsonb)) as entry
where up.status = 'completed'
  and entry->>'subject' is not null
  and entry->>'affirmative' is not null
on conflict (user_id, content_en) where item_type = 'vocabulary' do nothing;
