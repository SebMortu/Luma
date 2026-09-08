-- ============================================
-- LUMA — Audit "Apprendre" : reclassement de run/come
-- Ces deux verbes étaient rangés dans la famille "voyelle_a_i_u" (begin/began/begun...)
-- alors que leur participe est identique à la base (run/ran/run, come/came/come),
-- pas une forme en "u" — ça casse le motif que le regroupement est censé enseigner.
-- ============================================

update irregular_verbs
set family = 'base_egal_participe'
where base_form in ('run', 'come')
and family = 'voyelle_a_i_u';
