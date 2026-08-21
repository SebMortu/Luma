-- ============================================
-- LUMA — Passage à une mascotte unique (au lieu de 6 personnages au choix)
-- + préparation du schéma pour une évolution en plusieurs formes plus tard
-- (décision de contenu future, pas un nouveau chantier technique)
-- ============================================

-- 1) Colonnes prêtes pour l'évolution (inutilisées pour l'instant : une seule forme)
alter table characters add column if not exists evolution_stage integer not null default 1;
alter table characters add column if not exists min_cecr_level text; -- ex: 'B1' -> forme débloquée à partir de B1 ; NULL = dispo dès le début

-- 2) Nettoyage : retire les mappings scénario -> anciens personnages, puis les 6 anciens personnages
delete from scenario_speaker_characters;
delete from characters;

-- 3) La mascotte unique — Forme 1 (disponible dès l'inscription, tous niveaux)
insert into characters (slug, name, description, color, placeholder_emoji, evolution_stage, min_cecr_level)
values (
  'mascot',
  'Echo',
  'Un renard malicieux et bienveillant, toujours partant pour une conversation. Il t''accompagne à chaque leçon, du tout premier mot jusqu''à la maîtrise complète.',
  '#3B82F6',
  '🦊',
  1,
  null
);

-- 4) Ré-assigne automatiquement TOUS les utilisateurs existants à la mascotte unique
-- (il n'y a plus de choix à faire, donc plus besoin de leur redemander)
update user_settings
set guide_character_id = (select id from characters where slug = 'mascot')
where guide_character_id is null or guide_character_id not in (select id from characters);
