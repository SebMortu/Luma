-- ============================================
-- LUMA — Fix résiduel : le tableau de vocabulaire (utilisé par la révision
-- espacée, pas juste l'exercice) gardait la traduction ambiguë "léger/lumière"
-- pour "light" malgré la correction précédente du QCM.
-- ============================================

update lessons
set content = jsonb_set(
  content,
  '{table}',
  (
    select jsonb_agg(
      case when entry->>'subject' = 'light'
        then jsonb_set(entry, '{affirmative}', '"léger"')
        else entry
      end
    )
    from jsonb_array_elements(content->'table') as entry
  )
)
where unit_id = (select id from units where cecr_level = 'A0' and position = 0)
and position = 46;
