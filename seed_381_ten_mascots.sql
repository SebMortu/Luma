-- ============================================
-- LUMA — Retour à un panel de mascottes au choix (10, contre 6 initialement)
-- Remplace la mascotte unique "Echo" (trop sophistiquée visuellement) par un
-- vrai choix à l'inscription, avec des placeholders simples (couleur + emoji)
-- comme sur la toute première version — pas de vraie illustration nécessaire.
-- ============================================

-- Libère les références existantes avant de supprimer les personnages
update user_settings set guide_character_id = null;
delete from scenario_speaker_characters;
delete from characters;

insert into characters (slug, name, description, color, placeholder_emoji, position) values
  ('finn',   'Finn',   'Un renard malicieux et bienveillant, toujours partant pour une conversation.', '#F0973E', '🦊', 1),
  ('luna',   'Luna',   'Une chouette curieuse qui adore les mots compliqués et les explique avec patience.', '#8A6FE0', '🦉', 2),
  ('mochi',  'Mochi',  'Un panda tout doux, calme et encourageant même dans les moments difficiles.', '#E0685A', '🐼', 3),
  ('ember',  'Ember',  'Un petit dragon plein d''énergie qui célèbre chaque victoire avec enthousiasme.', '#D9534F', '🐉', 4),
  ('nori',   'Nori',   'Un chat espiègle, un brin taquin, qui aime te mettre au défi.', '#3BAF8A', '🐱', 5),
  ('sage',   'Sage',   'Une tortue sereine et méthodique, la voix de la régularité.', '#6FA84A', '🐢', 6),
  ('pip',    'Pip',    'Un lapin plein d''entrain, toujours prêt à bondir vers la prochaine leçon.', '#7CB0F8', '🐰', 7),
  ('coral',  'Coral',  'Un dauphin joueur qui rend chaque révision plus légère.', '#3B82F6', '🐬', 8),
  ('buddy',  'Buddy',  'Un chien loyal et chaleureux, ton compagnon fidèle au quotidien.', '#C99B5E', '🐶', 9),
  ('bao',    'Bao',    'Un koala tranquille, adepte des pauses bien méritées entre deux efforts.', '#8A93A8', '🐨', 10);
