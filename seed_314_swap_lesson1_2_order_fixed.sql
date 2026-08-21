-- ============================================
-- LUMA — Réordonnancement pédagogique : les pronoms personnels doivent
-- précéder "to be" (on doit connaître I/you/he/she/it/we/they avant de
-- les conjuguer). Simple inversion des positions, aucune donnée perdue,
-- la progression de chaque utilisateur reste intacte (liée à l'id de leçon,
-- pas à sa position).
-- ============================================

update lessons set position = 99
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 1)
  and position = 1;

update lessons set position = 1
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 1)
  and position = 2;

update lessons set position = 2
where unit_id = (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 1)
  and position = 99;
