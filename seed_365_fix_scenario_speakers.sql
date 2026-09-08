-- ============================================
-- LUMA — Fix majeur : speakers spéciaux non déclarés sur 154 scénarios
-- Les nœuds narratifs (pensée intérieure, narrateur, annonce...) utilisaient
-- des clés spéciales ("you_thought", "narrator", "announcement", "you_start")
-- jamais ajoutées au dictionnaire "characters" du scénario. Résultat : l'app
-- affichait littéralement "you_thought" ou "narrator" comme nom de
-- personnage à l'écran, au lieu d'un libellé lisible.
-- ============================================

update scenarios
set content = jsonb_set(
  content,
  '{characters}',
  coalesce(content->'characters', '{}'::jsonb)
    || case when content->'characters' ? 'you_thought' then '{}'::jsonb
         else jsonb_build_object('you_thought', '💭 Toi (pensée)') end
    || case when content->'characters' ? 'narrator' then '{}'::jsonb
         else jsonb_build_object('narrator', '🎙️ Narrateur') end
    || case when content->'characters' ? 'announcement' then '{}'::jsonb
         else jsonb_build_object('announcement', '📢 Annonce') end
    || case when content->'characters' ? 'you_start' then '{}'::jsonb
         else jsonb_build_object('you_start', 'Toi') end
)
where content is not null
and (
  content->'characters' is null
  or not (content->'characters' ? 'you_thought')
  or not (content->'characters' ? 'narrator')
  or not (content->'characters' ? 'announcement')
  or not (content->'characters' ? 'you_start')
)
-- Ne touche que les scénarios qui utilisent réellement au moins l'une de ces
-- clés spéciales quelque part dans leurs nœuds (évite d'ajouter des entrées
-- inutiles aux scénarios qui n'en ont pas besoin).
and exists (
  select 1 from jsonb_each(content->'nodes') as node(key, value)
  where value->>'speaker' in ('you_thought', 'narrator', 'announcement', 'you_start')
);
