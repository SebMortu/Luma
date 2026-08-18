-- ============================================
-- LUMA — Livre pilote A1 : 'The Lost Cat' (6 pages)
-- ============================================


with lang as (select id from languages where code = 'en')
insert into books (language_id, title, theme, description, cecr_level, cover_emoji, total_pages, position)
select id, 'The Lost Cat', 'Vie quotidienne', 'Emma cherche son chat partout dans le quartier. Une histoire simple et touchante pour débuter en lecture.', 'A1', '🐱', 6, 1
from lang;


with b as (select id from books where title = 'The Lost Cat' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 1, '[{"en": "Emma lives in a small house.", "fr": "Emma vit dans une petite maison."}, {"en": "She has a black cat named Milo.", "fr": "Elle a un chat noir qui s''appelle Milo."}, {"en": "Milo is Emma''s best friend.", "fr": "Milo est le meilleur ami d''Emma."}, {"en": "Every morning, Milo waits by the door.", "fr": "Chaque matin, Milo attend près de la porte."}]'::jsonb from b;


with b as (select id from books where title = 'The Lost Cat' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 2, '[{"en": "One day, Emma opens the door.", "fr": "Un jour, Emma ouvre la porte."}, {"en": "Milo runs outside very fast.", "fr": "Milo court dehors très vite."}, {"en": "\"Milo, come back!\" Emma shouts.", "fr": "\"Milo, reviens !\" crie Emma."}, {"en": "But Milo doesn''t stop.", "fr": "Mais Milo ne s''arrête pas."}, {"en": "He disappears around the corner.", "fr": "Il disparaît au coin de la rue."}]'::jsonb from b;


with b as (select id from books where title = 'The Lost Cat' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 3, '[{"en": "Emma is very worried.", "fr": "Emma est très inquiète."}, {"en": "She puts on her shoes quickly.", "fr": "Elle met ses chaussures rapidement."}, {"en": "\"I have to find him,\" she says.", "fr": "\"Je dois le retrouver,\" dit-elle."}, {"en": "She walks into the street.", "fr": "Elle marche dans la rue."}]'::jsonb from b;


with b as (select id from books where title = 'The Lost Cat' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 4, '[{"en": "Emma sees her neighbor, Mr. Chen.", "fr": "Emma voit son voisin, M. Chen."}, {"en": "\"Have you seen my cat?\" she asks.", "fr": "\"Avez-vous vu mon chat ?\" demande-t-elle."}, {"en": "\"A black cat? Yes!\" Mr. Chen says.", "fr": "\"Un chat noir ? Oui !\" dit M. Chen."}, {"en": "\"He went toward the park.\"", "fr": "\"Il est allé vers le parc.\""}, {"en": "Emma says thank you and runs to the park.", "fr": "Emma dit merci et court vers le parc."}]'::jsonb from b;


with b as (select id from books where title = 'The Lost Cat' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 5, '[{"en": "At the park, Emma looks everywhere.", "fr": "Au parc, Emma cherche partout."}, {"en": "She looks under the trees.", "fr": "Elle regarde sous les arbres."}, {"en": "She looks behind the benches.", "fr": "Elle regarde derrière les bancs."}, {"en": "Then she hears a small sound.", "fr": "Puis elle entend un petit bruit."}, {"en": "\"Meow!\"", "fr": "\"Miaou !\""}]'::jsonb from b;


with b as (select id from books where title = 'The Lost Cat' and language_id = (select id from languages where code = 'en'))
insert into book_pages (book_id, page_number, sentences)
select b.id, 6, '[{"en": "Milo is sitting under a big tree.", "fr": "Milo est assis sous un grand arbre."}, {"en": "\"There you are!\" Emma says happily.", "fr": "\"Te voilà !\" dit Emma joyeusement."}, {"en": "She picks up Milo and hugs him.", "fr": "Elle prend Milo dans ses bras et le serre fort."}, {"en": "\"Let''s go home, Milo.\"", "fr": "\"Rentrons à la maison, Milo.\""}, {"en": "They walk home together, side by side.", "fr": "Ils rentrent ensemble, côte à côte."}]'::jsonb from b;
