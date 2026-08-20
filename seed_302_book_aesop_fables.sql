-- ============================================
-- LUMA — Livre du domaine public : 'Fables d'Ésope' (6 fables classiques)
-- Texte fidèle aux versions anglaises du domaine public
-- ============================================


with lang as (select id from languages where code = 'en')
insert into books (language_id, title, theme, description, cecr_level, cover_emoji, total_pages, position)
select id, 'Aesop''s Fables', 'Classique • Fables antiques', 'Six fables intemporelles d''Ésope : la Tortue et le Lièvre, le Garçon qui criait au loup, le Renard et les Raisins, la Fourmi et la Sauterelle, le Lion et la Souris, et le Loup déguisé en mouton. Domaine public.', 'A2-B1', '🦉', 10, 7
from lang;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 1, '[{"en": "A Hare one day ridiculed the short feet and slow pace of a Tortoise.", "fr": "Un lièvre se moqua un jour des pattes courtes et de l''allure lente d''une tortue."}, {"en": "The Tortoise, laughing, said: ''Though you be swift as the wind, I will beat you in a race.''", "fr": "La tortue, en riant, répondit : ''Même si tu es rapide comme le vent, je te battrai à la course.''"}, {"en": "The Hare, thinking this simply impossible, agreed, and the Fox was chosen to fix the course.", "fr": "Le lièvre, pensant cela tout simplement impossible, accepta, et le renard fut choisi pour fixer le parcours."}, {"en": "On the day of the race, the two started together. The Tortoise never stopped, but went on with a slow, steady pace.", "fr": "Le jour de la course, les deux partirent ensemble. La tortue ne s''arrêta jamais, avançant d''un pas lent mais régulier."}, {"en": "The Hare, confident of victory, lay down by the wayside and fell fast asleep.", "fr": "Le lièvre, confiant en sa victoire, s''allongea au bord du chemin et s''endormit profondément."}, {"en": "At last waking and running as fast as he could, he saw the Tortoise had already reached the goal.", "fr": "Enfin réveillé et courant aussi vite qu''il le pouvait, il vit que la tortue avait déjà atteint le but."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 2, '[{"en": "Moral: Slow but steady wins the race.", "fr": "Morale : Lentement mais sûrement, on gagne la course."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 3, '[{"en": "A Shepherd-boy tended his flock near a village, and thought it great fun to hoax the villagers.", "fr": "Un jeune berger gardait son troupeau près d''un village, et trouvait très amusant de tromper les villageois."}, {"en": "He shouted, ''Wolf! Wolf!'' and when the people came running, he laughed at them for their pains.", "fr": "Il cria : ''Au loup ! Au loup !'' et quand les gens accoururent, il se moqua d''eux pour leur peine."}, {"en": "He did this more than once, and every time the villagers found they had been fooled.", "fr": "Il fit cela plus d''une fois, et à chaque fois les villageois se rendaient compte qu''ils avaient été dupés."}, {"en": "At last a Wolf really did come, and the Boy cried out as loud as he could.", "fr": "À la fin, un vrai loup arriva, et le garçon cria aussi fort qu''il le put."}, {"en": "But the villagers, used to his false alarms, took no notice of his cries for help.", "fr": "Mais les villageois, habitués à ses fausses alertes, ne prêtèrent aucune attention à ses appels au secours."}, {"en": "So the Wolf had it all his own way, and killed off sheep after sheep at his leisure.", "fr": "Ainsi le loup fit ce qu''il voulut, et tua mouton après mouton à son aise."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 4, '[{"en": "Moral: You cannot believe a liar even when he tells the truth.", "fr": "Morale : On ne peut pas croire un menteur, même quand il dit la vérité."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 5, '[{"en": "A hungry Fox saw some fine bunches of grapes hanging from a high vine.", "fr": "Un renard affamé vit de belles grappes de raisin suspendues à une vigne haute."}, {"en": "He tried again and again to reach them by jumping as high as he could.", "fr": "Il essaya encore et encore de les atteindre en sautant aussi haut que possible."}, {"en": "But it was all in vain, for they were just beyond his reach.", "fr": "Mais tout fut en vain, car elles étaient juste hors de sa portée."}, {"en": "At last he turned away, pretending not to care. ''They are sour anyway,'' he said, ''and not ripe as I thought.''", "fr": "Finalement il s''en alla, faisant semblant de s''en moquer. ''Ils sont sûrement acides,'' dit-il, ''et pas mûrs comme je le pensais.''"}, {"en": "Moral: It is easy to despise what you cannot get.", "fr": "Morale : Il est facile de mépriser ce qu''on ne peut pas obtenir."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 6, '[{"en": "In a field one summer''s day, a Grasshopper was hopping about, singing and chirping.", "fr": "Dans un champ, un jour d''été, une sauterelle sautillait ici et là, chantant et chantonnant."}, {"en": "An Ant passed by, carrying with great effort a grain of corn to store for winter.", "fr": "Une fourmi passa par là, transportant avec grand effort un grain de blé à mettre en réserve pour l''hiver."}, {"en": "''Why not stop and chat with me,'' said the Grasshopper, ''instead of toiling in that way?''", "fr": "''Pourquoi ne t''arrêtes-tu pas discuter avec moi,'' dit la sauterelle, ''au lieu de travailler ainsi ?''"}, {"en": "''I am helping to lay up food for the winter,'' said the Ant, ''and recommend you to do the same.''", "fr": "''J''aide à stocker de la nourriture pour l''hiver,'' dit la fourmi, ''et je te recommande de faire pareil.''"}, {"en": "''Why bother about winter?'' said the Grasshopper. ''We have plenty of food at present.''", "fr": "''Pourquoi se soucier de l''hiver ?'' dit la sauterelle. ''Nous avons plein de nourriture pour le moment.''"}, {"en": "But the Ant went on its way and continued its toil. When winter came, the Grasshopper had no food and found the Ants distributing corn from the stores they had collected in summer.", "fr": "Mais la fourmi poursuivit son chemin et continua son travail. Quand l''hiver arriva, la sauterelle n''avait pas de nourriture et trouva les fourmis en train de distribuer le blé qu''elles avaient récolté en été."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 7, '[{"en": "Moral: It is best to prepare for the days of necessity.", "fr": "Morale : Il vaut mieux se préparer pour les jours de nécessité."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 8, '[{"en": "A Lion was awakened from sleep by a Mouse running over his face.", "fr": "Un lion fut réveillé de son sommeil par une souris qui courait sur son visage."}, {"en": "Rising up angrily, he caught the Mouse and was about to kill it.", "fr": "Se levant avec colère, il attrapa la souris et s''apprêtait à la tuer."}, {"en": "The Mouse, terrified, pleaded: ''Please forgive me. If you spare my life, I may be able to repay you one day.''", "fr": "La souris, terrifiée, supplia : ''Pardonnez-moi, je vous en prie. Si vous m''épargnez, je pourrai peut-être vous rendre service un jour.''"}, {"en": "The Lion, amused by the idea, laughed and let the Mouse go.", "fr": "Le lion, amusé par cette idée, rit et laissa partir la souris."}, {"en": "Some time later, the Lion was caught in a hunter''s net. He roared loudly in distress.", "fr": "Quelque temps plus tard, le lion fut pris dans le filet d''un chasseur. Il rugit fort de détresse."}, {"en": "The Mouse, hearing him, ran and gnawed the ropes with its teeth, setting the Lion free.", "fr": "La souris, l''entendant, accourut et rongea les cordes avec ses dents, libérant le lion."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 9, '[{"en": "Moral: Little friends may prove great friends.", "fr": "Morale : De petits amis peuvent se révéler être de grands amis."}]'::jsonb from b;


with b as (select id from books where title = 'Aesop''s Fables' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 10, '[{"en": "A Wolf found that the Sheep were so afraid of him that he could not get near them.", "fr": "Un loup découvrit que les moutons avaient si peur de lui qu''il ne pouvait pas s''en approcher."}, {"en": "So he disguised himself in a sheepskin, and slipped in among the flock unnoticed.", "fr": "Alors il se déguisa avec une peau de mouton, et se glissa parmi le troupeau sans être remarqué."}, {"en": "Thus disguised, he managed to deceive the shepherd, and was shut in the fold with the sheep at night.", "fr": "Ainsi déguisé, il réussit à tromper le berger, et fut enfermé dans l''enclos avec les moutons la nuit."}, {"en": "But that very night, the shepherd, wanting a meal, went to the fold and killed the first sheep he laid his hands on.", "fr": "Mais cette nuit-là même, le berger, voulant un repas, alla à l''enclos et tua le premier mouton qu''il attrapa."}, {"en": "It happened to be the Wolf in disguise.", "fr": "Il se trouva que c''était le loup déguisé."}, {"en": "Moral: The evil doer often comes to harm through his own deceit.", "fr": "Morale : Celui qui fait le mal finit souvent par se blesser lui-même à cause de sa propre ruse."}]'::jsonb from b;
