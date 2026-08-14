-- Import des 36 unités pour l'anglais
-- Suppose que la ligne 'English' existe déjà dans languages (voir script précédent)

with lang as (select id from languages where code = 'en')
insert into units (language_id, cecr_level, position, title)
select lang.id, v.cecr_level, v.position, v.title from lang, (values
  (1, 'Les fondations', 'A1'),
  (2, 'Present simple', 'A1'),
  (3, 'Identifier et décrire', 'A1'),
  (4, 'Possession et quantité', 'A1'),
  (5, 'Present continuous', 'A1'),
  (6, 'Parler du passé (1)', 'A1'),
  (7, 'Parler du passé (2)', 'A1'),
  (8, 'Dénombrer et comparer', 'A1'),
  (9, 'Parler du futur', 'A2'),
  (10, 'Comparer', 'A2'),
  (11, 'Modaux de base', 'A2'),
  (12, 'Present perfect', 'A2'),
  (13, 'Se situer dans le temps et l''espace', 'A2'),
  (14, 'Nuancer', 'A2'),
  (15, 'Interagir', 'A2'),
  (16, 'Vocabulaire fonctionnel', 'A2'),
  (17, 'Present perfect continuous', 'B1'),
  (18, 'Récits au passé', 'B1'),
  (19, 'Hypothèses simples', 'B1'),
  (20, 'La voix passive', 'B1'),
  (21, 'Rapporter des paroles', 'B1'),
  (22, 'Préciser et relier', 'B1'),
  (23, 'Verbes en cascade', 'B1'),
  (24, 'Modaux avancés', 'B1'),
  (25, 'Hypothèses complexes', 'B2'),
  (26, 'Antériorité dans le passé', 'B2'),
  (27, 'Passif avancé', 'B2'),
  (28, 'Argumenter', 'B2'),
  (29, 'Vocabulaire idiomatique (1)', 'B2'),
  (30, 'Nuances modales', 'B2'),
  (31, 'Structures emphatiques', 'C1'),
  (32, 'Discours rapporté avancé', 'C1'),
  (33, 'Phrases clivées', 'C1'),
  (34, 'Vocabulaire idiomatique (2)', 'C1'),
  (35, 'Registres de langue', 'C1'),
  (36, 'Fluidité conversationnelle', 'C1')
) as v(position, title, cecr_level);
