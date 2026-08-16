-- ============================================
-- LUMA — Import des 4 premières grilles (2 mots croisés, 2 mots fléchés)
-- ============================================

with lang as (select id from languages where code = 'en')
insert into word_puzzles (language_id, type, title, cecr_level, rows, cols, words)
select lang.id, v.type, v.title, v.cecr_level, v.rows, v.cols, v.words::jsonb from lang, (values
  ('crossword', 'Mini grille 1 · Couleurs & nature', 'A1', 3, 3, '[{"direction": "across", "clue": "Couleur du sang (color of blood)", "answer": "RED", "row": 1, "col": 0}, {"direction": "down", "clue": "Étendue d''eau salée (body of salt water)", "answer": "SEA", "row": 0, "col": 1}]'),
  ('crossword', 'Mini grille 2 · Ciel & mouvement', 'A1', 3, 3, '[{"direction": "across", "clue": "Étoile au centre de notre système solaire (star at the center of our solar system)", "answer": "SUN", "row": 1, "col": 0}, {"direction": "down", "clue": "Se déplacer rapidement à pied (move quickly on foot)", "answer": "RUN", "row": 0, "col": 1}]'),
  ('fleche', 'Mini grille 3 · Animal & orientation', 'A1', 3, 3, '[{"direction": "across", "clue": "Animal domestique qui miaule (common pet that says meow)", "answer": "CAT", "row": 1, "col": 0}, {"direction": "down", "clue": "Sert à trouver son chemin (used to find your way)", "answer": "MAP", "row": 0, "col": 1}]'),
  ('fleche', 'Mini grille 4 · Animal & forme physique', 'A1', 3, 4, '[{"direction": "across", "clue": "Animal qui peut voler, comme un moineau (animal that can fly, like a sparrow)", "answer": "BIRD", "row": 1, "col": 0}, {"direction": "down", "clue": "En bonne forme physique (in good physical shape)", "answer": "FIT", "row": 0, "col": 1}]')
) as v(type, title, cecr_level, rows, cols, words);
