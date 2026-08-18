-- ============================================
-- LUMA — Série 'The Wonderful Wizard of Oz' (L. Frank Baum, 1900)
-- Livre-série (conteneur) + Tome 1 : Chapitres I-III
-- Texte original, domaine public (publié avant 1930)
-- ============================================


with lang as (select id from languages where code = 'en')
insert into books (language_id, title, theme, description, cecr_level, cover_emoji, total_pages, position, is_series)
select id, 'The Wonderful Wizard of Oz', 'Classique • L. Frank Baum (1900)', 'L''histoire complète de Dorothy et ses amis sur la route de brique jaune, en plusieurs tomes. Un classique de la littérature américaine, dans le domaine public.', 'B1', '🌪️', 0, 3, true
from lang;


with s as (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true),
     lang as (select id from languages where code = 'en')
insert into books (language_id, title, theme, description, cecr_level, cover_emoji, total_pages, position, series_id, volume_number)
select lang.id, 'Tome 1 : Le Cyclone', 'Classique • L. Frank Baum (1900)', 'Dorothy est emportée par un cyclone jusqu''au Pays d''Oz, rencontre la Sorcière du Nord, et sauve un étrange Épouvantail vivant.', 'B1', '🌪️', 37, 1, s.id, 1
from lang, s;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 1, '[{"en": "Dorothy lived in the midst of the great Kansas prairies, with Uncle Henry, who was a farmer, and Aunt Em, who was the farmer''s wife.", "fr": "Dorothy vivait au milieu des grandes prairies du Kansas, avec Oncle Henry, qui était fermier, et Tante Em, qui était la femme du fermier."}, {"en": "Their house was small, for the lumber to build it had to be carried by wagon many miles.", "fr": "Leur maison était petite, car le bois pour la construire avait dû être transporté en chariot sur de nombreux kilomètres."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 2, '[{"en": "There were four walls, a floor and a roof, which made one room; and this room contained a rusty looking cookstove, a cupboard for the dishes, a table, three or four chairs, and the beds.", "fr": "Il y avait quatre murs, un sol et un toit, formant une seule pièce ; et cette pièce contenait une cuisinière à l''aspect rouillé, un placard pour la vaisselle, une table, trois ou quatre chaises, et les lits."}, {"en": "There was no garret at all, and no cellar—except a small hole dug in the ground, called a cyclone cellar.", "fr": "Il n''y avait pas de grenier du tout, ni de cave—sauf un petit trou creusé dans le sol, appelé une cave à cyclone."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 3, '[{"en": "When Dorothy stood in the doorway and looked around, she could see nothing but the great gray prairie on every side.", "fr": "Quand Dorothy se tenait dans l''embrasure de la porte et regardait autour d''elle, elle ne voyait rien d''autre que la grande prairie grise de tous les côtés."}, {"en": "Not a tree nor a house broke the broad sweep of flat country that reached to the edge of the sky in all directions.", "fr": "Pas un arbre ni une maison ne brisait la vaste étendue de pays plat qui atteignait le bord du ciel dans toutes les directions."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 4, '[{"en": "When Aunt Em came there to live she was a young, pretty wife. The sun and wind had changed her, too.", "fr": "Quand Tante Em était venue vivre là, c''était une jeune et jolie épouse. Le soleil et le vent l''avaient changée, elle aussi."}, {"en": "She was thin and gaunt, and never smiled now.", "fr": "Elle était mince et décharnée, et ne souriait plus jamais."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 5, '[{"en": "Uncle Henry never laughed. He worked hard from morning till night and did not know what joy was.", "fr": "Oncle Henry ne riait jamais. Il travaillait dur du matin au soir et ne savait pas ce qu''était la joie."}, {"en": "It was Toto that made Dorothy laugh, and saved her from growing as gray as her other surroundings.", "fr": "C''était Toto qui faisait rire Dorothy, et qui l''empêchait de devenir aussi grise que tout ce qui l''entourait."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 6, '[{"en": "Today, however, they were not playing. Uncle Henry sat upon the doorstep and looked anxiously at the sky, which was even grayer than usual.", "fr": "Aujourd''hui, cependant, ils ne jouaient pas. Oncle Henry était assis sur le pas de la porte et regardait anxieusement le ciel, encore plus gris que d''habitude."}, {"en": "From the far north they heard a low wail of the wind, and Uncle Henry and Dorothy could see where the long grass bowed in waves before the coming storm.", "fr": "Du grand nord, ils entendaient un faible gémissement du vent, et Oncle Henry et Dorothy pouvaient voir l''herbe haute plier en vagues devant la tempête qui approchait."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 7, '[{"en": "Suddenly Uncle Henry stood up. ''There''s a cyclone coming, Em,'' he called to his wife.", "fr": "Soudain, Oncle Henry se leva. ''Un cyclone arrive, Em,'' cria-t-il à sa femme."}, {"en": "Aunt Em dropped her work and came to the door. ''Quick, Dorothy!'' she screamed. ''Run for the cellar!''", "fr": "Tante Em laissa tomber son travail et vint à la porte. ''Vite, Dorothy !'' cria-t-elle. ''Cours vers la cave !''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 8, '[{"en": "Toto jumped out of Dorothy''s arms and hid under the bed, and the girl started to get him.", "fr": "Toto sauta des bras de Dorothy et se cacha sous le lit, et la fillette se mit à le chercher."}, {"en": "When she was halfway across the room there came a great shriek from the wind, and the house shook so hard that she lost her footing and sat down suddenly upon the floor.", "fr": "Alors qu''elle traversait la pièce, un grand hurlement du vent retentit, et la maison trembla si fort qu''elle perdit l''équilibre et s''assit brusquement sur le sol."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 9, '[{"en": "Then a strange thing happened. The house whirled around two or three times and rose slowly through the air.", "fr": "Puis une chose étrange se produisit. La maison tourbillonna deux ou trois fois et s''éleva lentement dans les airs."}, {"en": "Dorothy felt as if she were going up in a balloon.", "fr": "Dorothy avait l''impression de monter dans un ballon."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 10, '[{"en": "It was very dark, and the wind howled horribly around her, but Dorothy found she was riding quite easily.", "fr": "Il faisait très sombre, et le vent hurlait horriblement autour d''elle, mais Dorothy trouvait qu''elle voyageait plutôt facilement."}, {"en": "Toto did not like it. He ran about the room, now here, now there, barking loudly.", "fr": "Toto n''aimait pas ça. Il courait dans la pièce, tantôt ici, tantôt là, en aboyant fort."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 11, '[{"en": "Once Toto got too near the open trap door, and fell in; and at first the little girl thought she had lost him.", "fr": "Une fois, Toto s''approcha trop de la trappe ouverte, et tomba dedans ; d''abord, la fillette crut l''avoir perdu."}, {"en": "She crept to the hole, caught Toto by the ear, and dragged him into the room again.", "fr": "Elle rampa jusqu''au trou, attrapa Toto par l''oreille, et le tira à nouveau dans la pièce."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 12, '[{"en": "In spite of the swaying of the house and the wailing of the wind, Dorothy soon closed her eyes and fell fast asleep.", "fr": "Malgré le balancement de la maison et le gémissement du vent, Dorothy ferma bientôt les yeux et s''endormit profondément."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 13, '[{"en": "She was awakened by a shock, so sudden and severe that if Dorothy had not been lying on the soft bed she might have been hurt.", "fr": "Elle fut réveillée par un choc, si soudain et si violent que si Dorothy n''avait pas été allongée sur le lit moelleux, elle aurait pu se blesser."}, {"en": "Dorothy sat up and noticed that the house was not moving; nor was it dark, for the bright sunshine came in at the window.", "fr": "Dorothy se redressa et remarqua que la maison ne bougeait plus ; il ne faisait plus sombre non plus, car un soleil éclatant entrait par la fenêtre."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 14, '[{"en": "The little girl gave a cry of amazement and looked about her, her eyes growing bigger and bigger at the wonderful sights she saw.", "fr": "La fillette poussa un cri d''émerveillement et regarda autour d''elle, ses yeux s''agrandissant devant les merveilles qu''elle voyait."}, {"en": "The cyclone had set the house down very gently—for a cyclone—in the midst of a country of marvelous beauty.", "fr": "Le cyclone avait posé la maison très doucement—pour un cyclone—au milieu d''un pays d''une beauté merveilleuse."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 15, '[{"en": "There were lovely patches of greensward all about, with stately trees bearing rich and luscious fruits.", "fr": "Il y avait de jolies pelouses vertes tout autour, avec des arbres majestueux portant des fruits riches et savoureux."}, {"en": "Banks of gorgeous flowers were on every hand, and birds with rare and brilliant plumage sang and fluttered in the trees.", "fr": "Des massifs de fleurs magnifiques se trouvaient de tous côtés, et des oiseaux au plumage rare et éclatant chantaient et voletaient dans les arbres."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 16, '[{"en": "While she stood looking eagerly at the strange and beautiful sights, she noticed coming toward her a group of the queerest people she had ever seen.", "fr": "Alors qu''elle regardait avec impatience ces vues étranges et magnifiques, elle remarqua venir vers elle un groupe des gens les plus étranges qu''elle ait jamais vus."}, {"en": "They were not as big as the grown folk she had always been used to; but neither were they very small.", "fr": "Ils n''étaient pas aussi grands que les adultes auxquels elle était habituée ; mais ils n''étaient pas très petits non plus."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 17, '[{"en": "Three were men and one a woman, and all were oddly dressed. They wore round hats that rose to a small point a foot above their heads.", "fr": "Trois étaient des hommes et une était une femme, et tous étaient étrangement habillés. Ils portaient des chapeaux ronds qui s''élevaient en une petite pointe au-dessus de leur tête."}, {"en": "The little woman walked up to Dorothy, made a low bow and said, in a sweet voice: ''You are welcome, most noble Sorceress, to the land of the Munchkins.''", "fr": "La petite femme s''approcha de Dorothy, fit une profonde révérence et dit, d''une voix douce : ''Soyez la bienvenue, noble Sorcière, au pays des Munchkins.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 18, '[{"en": "''We are so grateful to you for having killed the Wicked Witch of the East, and for setting our people free from bondage.''", "fr": "''Nous vous sommes tellement reconnaissants d''avoir tué la Méchante Sorcière de l''Est, et d''avoir libéré notre peuple de l''esclavage.''"}, {"en": "Dorothy listened to this speech with wonder. She had never killed anything in all her life.", "fr": "Dorothy écouta ce discours avec étonnement. Elle n''avait jamais tué quoi que ce soit de toute sa vie."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 19, '[{"en": "''You are very kind, but there must be some mistake. I have not killed anything,'' Dorothy said, with hesitation.", "fr": "''Vous êtes très aimable, mais il doit y avoir une erreur. Je n''ai rien tué,'' dit Dorothy, avec hésitation."}, {"en": "''Your house did, anyway,'' replied the little old woman, with a laugh. ''There are her two feet, still sticking out from under a block of wood.''", "fr": "''Votre maison si, en tout cas,'' répondit la petite vieille femme, en riant. ''Voilà ses deux pieds, qui dépassent encore de sous un bloc de bois.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 20, '[{"en": "Dorothy looked, and gave a little cry of fright. There, indeed, two feet were sticking out, shod in silver shoes with pointed toes.", "fr": "Dorothy regarda, et poussa un petit cri de frayeur. Là, en effet, deux pieds dépassaient, chaussés de souliers d''argent aux bouts pointus."}, {"en": "''She was the Wicked Witch of the East,'' answered the little woman. ''She has held all the Munchkins in bondage for many years.''", "fr": "''C''était la Méchante Sorcière de l''Est,'' répondit la petite femme. ''Elle a tenu tous les Munchkins en esclavage pendant de nombreuses années.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 21, '[{"en": "''Are you a real witch?'' Dorothy cried. ''Yes, indeed,'' answered the little woman. ''But I am a good witch, and the people love me.''", "fr": "''Êtes-vous une vraie sorcière ?'' s''écria Dorothy. ''Oui, en effet,'' répondit la petite femme. ''Mais je suis une bonne sorcière, et le peuple m''aime.''"}, {"en": "''There were only four witches in all the Land of Oz, and two of them, those who live in the North and the South, are good witches.''", "fr": "''Il n''y avait que quatre sorcières dans tout le Pays d''Oz, et deux d''entre elles, celles qui vivent au Nord et au Sud, sont de bonnes sorcières.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 22, '[{"en": "''Oz himself is the Great Wizard,'' answered the Witch, sinking her voice to a whisper. ''He is more powerful than all the rest of us together. He lives in the City of Emeralds.''", "fr": "''Oz lui-même est le Grand Magicien,'' répondit la Sorcière, baissant la voix jusqu''au murmure. ''Il est plus puissant que nous tous réunis. Il vit dans la Cité des Émeraudes.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 23, '[{"en": "''I am anxious to get back to my aunt and uncle. Can you help me find my way?'' asked Dorothy.", "fr": "''J''ai hâte de retrouver ma tante et mon oncle. Pouvez-vous m''aider à trouver mon chemin ?'' demanda Dorothy."}, {"en": "The Munchkins and the Witch looked at one another, and then at Dorothy, and shook their heads. There was a great desert on every side, and none could live to cross it.", "fr": "Les Munchkins et la Sorcière se regardèrent, puis regardèrent Dorothy, et secouèrent la tête. Il y avait un grand désert de tous côtés, et personne ne pouvait vivre pour le traverser."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 24, '[{"en": "Dorothy began to sob at this, for she felt lonely among all these strange people. The little old woman took off her cap, balanced it on her nose, and counted ''One, two, three'' in a solemn voice.", "fr": "Dorothy se mit à sangloter à cela, car elle se sentait seule parmi tous ces gens étranges. La petite vieille femme retira son bonnet, l''équilibra sur son nez, et compta ''Un, deux, trois'' d''une voix solennelle."}, {"en": "At once the cap changed to a slate, on which was written: ''LET DOROTHY GO TO THE CITY OF EMERALDS.''", "fr": "Aussitôt le bonnet se changea en ardoise, sur laquelle était écrit : ''QUE DOROTHY ALLE À LA CITÉ DES ÉMERAUDES.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 25, '[{"en": "''The road to the City of Emeralds is paved with yellow brick,'' said the Witch, ''so you cannot miss it.''", "fr": "''La route vers la Cité des Émeraudes est pavée de briques jaunes,'' dit la Sorcière, ''donc vous ne pouvez pas la manquer.''"}, {"en": "She came close to Dorothy and kissed her gently on the forehead, leaving a round, shining mark.", "fr": "Elle s''approcha de Dorothy et l''embrassa doucement sur le front, laissant une marque ronde et brillante."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 26, '[{"en": "When Dorothy was left alone she began to feel hungry. So she went to the cupboard and cut herself some bread, which she spread with butter.", "fr": "Quand Dorothy fut laissée seule, elle commença à avoir faim. Alors elle alla au placard et se coupa du pain, qu''elle tartina de beurre."}, {"en": "She gave some to Toto, and taking a pail from the shelf she carried it down to the little brook and filled it with clear, sparkling water.", "fr": "Elle en donna à Toto, et prenant un seau sur l''étagère, elle le porta jusqu''au petit ruisseau et le remplit d''eau claire et scintillante."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 27, '[{"en": "Dorothy had only one other dress, but that happened to be clean and was hanging on a peg beside her bed. It was gingham, with checks of white and blue.", "fr": "Dorothy n''avait qu''une seule autre robe, mais elle était justement propre et suspendue à un crochet près de son lit. C''était du vichy, à carreaux blancs et bleus."}, {"en": "She took a little basket and filled it with bread from the cupboard, laying a white cloth over the top.", "fr": "Elle prit un petit panier et le remplit de pain du placard, posant un linge blanc par-dessus."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 28, '[{"en": "At that moment Dorothy saw lying on the table the silver shoes that had belonged to the Witch of the East. ''I wonder if they will fit me,'' she said to Toto.", "fr": "À ce moment, Dorothy vit sur la table les souliers d''argent qui avaient appartenu à la Sorcière de l''Est. ''Je me demande s''ils m''iront,'' dit-elle à Toto."}, {"en": "She took off her old leather shoes and tried on the silver ones, which fitted her as well as if they had been made for her.", "fr": "Elle retira ses vieilles chaussures en cuir et essaya les souliers d''argent, qui lui allaient aussi bien que s''ils avaient été faits pour elle."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 29, '[{"en": "''Come along, Toto,'' she said. ''We will go to the Emerald City and ask the Great Oz how to get back to Kansas again.''", "fr": "''Viens, Toto,'' dit-elle. ''Nous allons aller à la Cité d''Émeraude et demander au Grand Oz comment retourner au Kansas.''"}, {"en": "There were several roads nearby, but it did not take her long to find the one paved with yellow bricks.", "fr": "Il y avait plusieurs routes à proximité, mais il ne lui fallut pas longtemps pour trouver celle pavée de briques jaunes."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 30, '[{"en": "Once in a while she would pass a house, and the people came out to look at her and bow low as she went by; for everyone knew she had killed the Wicked Witch.", "fr": "De temps en temps elle passait devant une maison, et les gens sortaient pour la regarder et s''incliner bien bas ; car tout le monde savait qu''elle avait tué la Méchante Sorcière."}, {"en": "Toward evening, when Dorothy was tired with her long walk, she came to a house rather larger than the rest, where people were dancing and celebrating their freedom.", "fr": "Vers le soir, alors que Dorothy était fatiguée de sa longue marche, elle arriva à une maison plutôt plus grande que les autres, où les gens dansaient et célébraient leur liberté."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 31, '[{"en": "Dorothy ate a hearty supper, waited upon by the rich Munchkin himself, whose name was Boq. When Boq saw her silver shoes he said, ''You must be a great sorceress.''", "fr": "Dorothy mangea un copieux souper, servie par le riche Munchkin lui-même, qui s''appelait Boq. Quand Boq vit ses souliers d''argent il dit : ''Vous devez être une grande sorcière.''"}, {"en": "''Blue is the color of the Munchkins, and white is the witch color. So we know you are a friendly witch,'' Boq explained.", "fr": "''Le bleu est la couleur des Munchkins, et le blanc est la couleur des sorcières. Donc nous savons que vous êtes une sorcière amicale,'' expliqua Boq."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 32, '[{"en": "She ate a hearty breakfast the next morning, and asked, ''How far is it to the Emerald City?''", "fr": "Elle prit un copieux petit-déjeuner le lendemain matin, et demanda : ''À quelle distance se trouve la Cité d''Émeraude ?''"}, {"en": "''It is a long way, and it will take you many days,'' answered Boq gravely. ''You must pass through rough and dangerous places.''", "fr": "''C''est loin, et cela vous prendra de nombreux jours,'' répondit gravement Boq. ''Vous devrez traverser des endroits rudes et dangereux.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 33, '[{"en": "When she had gone several miles she stopped to rest, and sat down on a fence. There was a great cornfield beyond, and she saw a Scarecrow, placed high on a pole to keep the birds away.", "fr": "Après avoir marché plusieurs kilomètres, elle s''arrêta pour se reposer, et s''assit sur une clôture. Il y avait un grand champ de maïs au-delà, et elle vit un Épouvantail, placé en haut d''un poteau pour éloigner les oiseaux."}, {"en": "While Dorothy was looking earnestly into the queer, painted face of the Scarecrow, she was surprised to see one of the eyes slowly wink at her.", "fr": "Alors que Dorothy regardait attentivement le drôle de visage peint de l''Épouvantail, elle fut surprise de voir un des yeux lui faire un clin d''œil lentement."}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 34, '[{"en": "''Good day,'' said the Scarecrow, in a rather husky voice. ''Did you speak?'' asked the girl, in wonder. ''Certainly,'' answered the Scarecrow. ''How do you do?''", "fr": "''Bonjour,'' dit l''Épouvantail, d''une voix plutôt rauque. ''Vous avez parlé ?'' demanda la fillette, étonnée. ''Certainement,'' répondit l''Épouvantail. ''Comment allez-vous ?''"}, {"en": "''I''m not feeling well,'' said the Scarecrow, with a smile, ''for it is very tedious being perched up here to scare away crows.''", "fr": "''Je ne me sens pas bien,'' dit l''Épouvantail, avec un sourire, ''car c''est très ennuyeux d''être perché ici pour effrayer les corbeaux.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 35, '[{"en": "Dorothy reached up both arms and lifted the figure off the pole, for, being stuffed with straw, it was quite light.", "fr": "Dorothy leva les deux bras et souleva la silhouette hors du poteau, car, étant rembourrée de paille, elle était plutôt légère."}, {"en": "''Thank you very much,'' said the Scarecrow, when he had been set down on the ground. ''I feel like a new man.''", "fr": "''Merci beaucoup,'' dit l''Épouvantail, une fois posé sur le sol. ''Je me sens comme un homme nouveau.''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 36, '[{"en": "''Who are you?'' asked the Scarecrow. ''And where are you going?'' ''My name is Dorothy,'' said the girl, ''and I am going to the Emerald City, to ask the Great Oz to send me back to Kansas.''", "fr": "''Qui êtes-vous ?'' demanda l''Épouvantail. ''Et où allez-vous ?'' ''Je m''appelle Dorothy,'' dit la fillette, ''et je vais à la Cité d''Émeraude, pour demander au Grand Oz de me renvoyer au Kansas.''"}, {"en": "''You see, I am stuffed, so I have no brains at all,'' he answered sadly. ''Do you think Oz would give me some brains?''", "fr": "''Vous voyez, je suis rembourré, donc je n''ai aucune cervelle,'' répondit-il tristement. ''Pensez-vous qu''Oz me donnerait un peu de cervelle ?''"}]'::jsonb from b;


with b as (select id from books where title = 'Tome 1 : Le Cyclone' and volume_number = 1 and series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true))
insert into book_pages (book_id, page_number, sentences)
select b.id, 37, '[{"en": "''I cannot tell,'' she returned, ''but you may come with me, if you like. If Oz will not give you any brains you will be no worse off than you are now.''", "fr": "''Je ne peux pas le dire,'' répondit-elle, ''mais vous pouvez venir avec moi, si vous voulez. Si Oz ne vous donne pas de cervelle, vous ne serez pas plus mal qu''aujourd''hui.''"}, {"en": "''I''ll tell you a secret,'' the Scarecrow continued, as he walked along. ''There is only one thing in the world I am afraid of.'' ''What is that?'' asked Dorothy. ''It''s a lighted match.''", "fr": "''Je vais vous dire un secret,'' continua l''Épouvantail, en marchant. ''Il n''y a qu''une seule chose au monde dont j''ai peur.'' ''C''est quoi ?'' demanda Dorothy. ''C''est une allumette enflammée.''"}]'::jsonb from b;
