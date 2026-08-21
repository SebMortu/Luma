-- ============================================
-- LUMA — Passage à une mascotte unique (au lieu de 6 personnages au choix)
-- + préparation du schéma pour une évolution en plusieurs formes plus tard
-- CORRIGÉ : les références de user_settings vers characters doivent être
-- libérées AVANT de supprimer les anciens personnages (contrainte de clé
-- étrangère), pas après.
-- ============================================

-- 1) Colonnes prêtes pour l'évolution (inutilisées pour l'instant : une seule forme)
alter table characters add column if not exists evolution_stage integer not null default 1;
alter table characters add column if not exists min_cecr_level text;

-- 2) Libère d'abord toutes les références vers les anciens personnages
update user_settings set guide_character_id = null;

-- 3) Nettoyage : retire les mappings scénario -> anciens personnages, puis les 6 anciens personnages
delete from scenario_speaker_characters;
delete from characters;

-- 4) La mascotte unique — Forme 1 (disponible dès l'inscription, tous niveaux)
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

-- 5) Ré-assigne maintenant TOUS les utilisateurs à la mascotte unique
update user_settings
set guide_character_id = (select id from characters where slug = 'mascot');
