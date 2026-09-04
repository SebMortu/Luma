-- ============================================
-- LUMA — Complète Niveau 1 (4 mots) et crée Niveau 2 (20 mots + exercices)
-- pour les 10 thèmes de vocabulaire.
-- ============================================

update vocab_theme_levels
set words = words || '[{"en": "crispy", "fr": "croustillant", "level": "A2"}, {"en": "marinate", "fr": "mariner", "level": "B1"}, {"en": "portion", "fr": "portion", "level": "A2"}, {"en": "bland", "fr": "fade/sans saveur", "level": "B1"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'cuisine')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "chop", "fr": "hacher", "level": "A2"}, {"en": "whisk", "fr": "fouetter", "level": "B1"}, {"en": "peel", "fr": "éplucher", "level": "A2"}, {"en": "grate", "fr": "râper", "level": "B1"}, {"en": "steam", "fr": "cuire à la vapeur", "level": "B1"}, {"en": "broth", "fr": "bouillon", "level": "B1"}, {"en": "crust", "fr": "croûte", "level": "A2"}, {"en": "batter", "fr": "pâte à frire", "level": "B1"}, {"en": "garnish", "fr": "garniture", "level": "B2"}, {"en": "savory", "fr": "salé/savoureux", "level": "B2"}, {"en": "sour", "fr": "acide", "level": "A2"}, {"en": "bitter", "fr": "amer", "level": "A2"}, {"en": "overcooked", "fr": "trop cuit", "level": "B1"}, {"en": "undercooked", "fr": "pas assez cuit", "level": "B1"}, {"en": "nutritious", "fr": "nutritif", "level": "B1"}, {"en": "organic", "fr": "biologique", "level": "A2"}, {"en": "condiment", "fr": "condiment", "level": "B1"}, {"en": "tablespoon", "fr": "cuillère à soupe", "level": "A2"}, {"en": "simmering pot", "fr": "marmite qui mijote", "level": "B1"}, {"en": "aftertaste", "fr": "arrière-goût", "level": "B2"}]'::jsonb
from vocab_themes where slug = 'cuisine';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'cuisine' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"hacher\" = ?", "options": ["sour", "aftertaste", "simmering pot", "chop"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"chop\"."}'),(2, 'qcm', '{"question": "\"éplucher\" = ?", "options": ["peel", "batter", "organic", "bitter"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"peel\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "steam", "right": "cuire à la vapeur"}, {"left": "broth", "right": "bouillon"}, {"left": "crust", "right": "croûte"}, {"left": "batter", "right": "pâte à frire"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "savory", "right": "salé/savoureux"}, {"left": "sour", "right": "acide"}, {"left": "bitter", "right": "amer"}, {"left": "overcooked", "right": "trop cuit"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"nutritif\" = ", "sentence_after": "", "correct_answers": ["nutritious"], "feedback_correct": "Correct !", "feedback_incorrect": "\"nutritif\" se dit \"nutritious\" en anglais."}'),(6, 'true_false', '{"statement": "\"condiment\" veut dire \"condiment\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "keyboard", "fr": "clavier", "level": "A1"}, {"en": "firmware", "fr": "micrologiciel", "level": "C1"}, {"en": "bandwidth", "fr": "bande passante", "level": "B2"}, {"en": "shortcut", "fr": "raccourci", "level": "B1"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'technologie')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "router", "fr": "routeur", "level": "B1"}, {"en": "firewall", "fr": "pare-feu", "level": "B1"}, {"en": "interface", "fr": "interface", "level": "B1"}, {"en": "algorithm", "fr": "algorithme", "level": "B1"}, {"en": "server", "fr": "serveur", "level": "B1"}, {"en": "crash", "fr": "planter (logiciel)", "level": "A2"}, {"en": "encryption", "fr": "chiffrement", "level": "B2"}, {"en": "bug fix", "fr": "correction de bug", "level": "B1"}, {"en": "touchscreen", "fr": "écran tactile", "level": "A2"}, {"en": "processor", "fr": "processeur", "level": "B1"}, {"en": "streaming", "fr": "diffusion en continu", "level": "A2"}, {"en": "hacker", "fr": "pirate informatique", "level": "A2"}, {"en": "subscription", "fr": "abonnement", "level": "A2"}, {"en": "compatible", "fr": "compatible", "level": "B1"}, {"en": "outdated", "fr": "obsolète", "level": "B1"}, {"en": "troubleshoot", "fr": "dépanner", "level": "B2"}, {"en": "gigabyte", "fr": "gigaoctet", "level": "A2"}, {"en": "virtual reality", "fr": "réalité virtuelle", "level": "B1"}, {"en": "artificial intelligence", "fr": "intelligence artificielle", "level": "B1"}, {"en": "glitchy", "fr": "buggé", "level": "B2"}]'::jsonb
from vocab_themes where slug = 'technologie';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'technologie' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"routeur\" = ?", "options": ["artificial intelligence", "router", "streaming", "touchscreen"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"router\"."}'),(2, 'qcm', '{"question": "\"interface\" = ?", "options": ["glitchy", "algorithm", "interface", "crash"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"interface\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "server", "right": "serveur"}, {"left": "crash", "right": "planter (logiciel)"}, {"left": "encryption", "right": "chiffrement"}, {"left": "bug fix", "right": "correction de bug"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "processor", "right": "processeur"}, {"left": "streaming", "right": "diffusion en continu"}, {"left": "hacker", "right": "pirate informatique"}, {"left": "subscription", "right": "abonnement"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"obsolète\" = ", "sentence_after": "", "correct_answers": ["outdated"], "feedback_correct": "Correct !", "feedback_incorrect": "\"obsolète\" se dit \"outdated\" en anglais."}'),(6, 'true_false', '{"statement": "\"gigabyte\" veut dire \"gigaoctet\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "whistle", "fr": "coup de sifflet", "level": "B1"}, {"en": "substitute", "fr": "remplaçant", "level": "B1"}, {"en": "endurance", "fr": "endurance", "level": "B1"}, {"en": "cheer", "fr": "encourager", "level": "A2"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'sport')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "stadium", "fr": "stade", "level": "A1"}, {"en": "tournament", "fr": "tournoi", "level": "A2"}, {"en": "goalkeeper", "fr": "gardien de but", "level": "A2"}, {"en": "penalty", "fr": "pénalty", "level": "A2"}, {"en": "draw", "fr": "match nul", "level": "B1"}, {"en": "underdog", "fr": "outsider", "level": "B2"}, {"en": "fitness", "fr": "forme physique", "level": "A2"}, {"en": "stretching", "fr": "étirements", "level": "A2"}, {"en": "halftime", "fr": "mi-temps", "level": "A2"}, {"en": "spectator", "fr": "spectateur", "level": "B1"}, {"en": "trophy", "fr": "trophée", "level": "A2"}, {"en": "qualify", "fr": "se qualifier", "level": "B1"}, {"en": "training camp", "fr": "stage d''entraînement", "level": "B1"}, {"en": "physical therapy", "fr": "kinésithérapie", "level": "B1"}, {"en": "comeback", "fr": "retour en force", "level": "B1"}, {"en": "undefeated", "fr": "invaincu", "level": "B2"}, {"en": "league", "fr": "ligue", "level": "A2"}, {"en": "captain", "fr": "capitaine", "level": "A1"}, {"en": "substitute bench", "fr": "banc de touche", "level": "B1"}, {"en": "personal best", "fr": "record personnel", "level": "B1"}]'::jsonb
from vocab_themes where slug = 'sport';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'sport' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"stade\" = ?", "options": ["personal best", "trophy", "training camp", "stadium"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"stadium\"."}'),(2, 'qcm', '{"question": "\"gardien de but\" = ?", "options": ["stretching", "physical therapy", "qualify", "goalkeeper"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"goalkeeper\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "draw", "right": "match nul"}, {"left": "underdog", "right": "outsider"}, {"left": "fitness", "right": "forme physique"}, {"left": "stretching", "right": "étirements"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "spectator", "right": "spectateur"}, {"left": "trophy", "right": "trophée"}, {"left": "qualify", "right": "se qualifier"}, {"left": "training camp", "right": "stage d''entraînement"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"retour en force\" = ", "sentence_after": "", "correct_answers": ["comeback"], "feedback_correct": "Correct !", "feedback_incorrect": "\"retour en force\" se dit \"comeback\" en anglais."}'),(6, 'true_false', '{"statement": "\"league\" veut dire \"ligue\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "visa", "fr": "visa", "level": "A2"}, {"en": "shuttle", "fr": "navette", "level": "B1"}, {"en": "checkpoint", "fr": "point de contrôle", "level": "B1"}, {"en": "tourist trap", "fr": "piège à touristes", "level": "C1"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'voyage')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "departure", "fr": "départ", "level": "A2"}, {"en": "arrival", "fr": "arrivée", "level": "A2"}, {"en": "connecting flight", "fr": "vol de correspondance", "level": "B1"}, {"en": "check-in", "fr": "enregistrement", "level": "A2"}, {"en": "boarding pass", "fr": "carte d''embarquement", "level": "A2"}, {"en": "timezone", "fr": "fuseau horaire", "level": "B1"}, {"en": "guided tour", "fr": "visite guidée", "level": "A2"}, {"en": "local cuisine", "fr": "cuisine locale", "level": "A2"}, {"en": "off the beaten path", "fr": "hors des sentiers battus", "level": "C1"}, {"en": "road trip", "fr": "road trip", "level": "A2"}, {"en": "scenic route", "fr": "route panoramique", "level": "B1"}, {"en": "all-inclusive", "fr": "tout compris", "level": "B1"}, {"en": "visa-free", "fr": "sans visa", "level": "B2"}, {"en": "border crossing", "fr": "passage de frontière", "level": "B1"}, {"en": "travel insurance", "fr": "assurance voyage", "level": "B1"}, {"en": "cultural shock", "fr": "choc culturel", "level": "B2"}, {"en": "nomad", "fr": "nomade", "level": "B1"}, {"en": "expedition", "fr": "expédition", "level": "B1"}, {"en": "stopover", "fr": "escale (courte)", "level": "B1"}, {"en": "bucket list", "fr": "liste de choses à faire avant de mourir", "level": "B2"}]'::jsonb
from vocab_themes where slug = 'voyage';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'voyage' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"départ\" = ?", "options": ["departure", "boarding pass", "guided tour", "road trip"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"departure\"."}'),(2, 'qcm', '{"question": "\"vol de correspondance\" = ?", "options": ["road trip", "connecting flight", "all-inclusive", "expedition"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"connecting flight\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "boarding pass", "right": "carte d''embarquement"}, {"left": "timezone", "right": "fuseau horaire"}, {"left": "guided tour", "right": "visite guidée"}, {"left": "local cuisine", "right": "cuisine locale"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "road trip", "right": "road trip"}, {"left": "scenic route", "right": "route panoramique"}, {"left": "all-inclusive", "right": "tout compris"}, {"left": "visa-free", "right": "sans visa"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"assurance voyage\" = ", "sentence_after": "", "correct_answers": ["travel insurance"], "feedback_correct": "Correct !", "feedback_incorrect": "\"assurance voyage\" se dit \"travel insurance\" en anglais."}'),(6, 'true_false', '{"statement": "\"nomad\" veut dire \"nomade\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "erosion", "fr": "érosion", "level": "B2"}, {"en": "species", "fr": "espèce", "level": "B1"}, {"en": "nesting", "fr": "nidification", "level": "B2"}, {"en": "canopy", "fr": "canopée", "level": "B2"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'nature')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "waterfall", "fr": "cascade", "level": "A2"}, {"en": "cave", "fr": "grotte", "level": "A2"}, {"en": "volcano", "fr": "volcan", "level": "A2"}, {"en": "glacier", "fr": "glacier", "level": "B1"}, {"en": "coral reef", "fr": "récif corallien", "level": "B1"}, {"en": "predator", "fr": "prédateur", "level": "B1"}, {"en": "migration", "fr": "migration", "level": "B1"}, {"en": "pollinator", "fr": "pollinisateur", "level": "B2"}, {"en": "carbon footprint", "fr": "empreinte carbone", "level": "B2"}, {"en": "solar power", "fr": "énergie solaire", "level": "B1"}, {"en": "wind turbine", "fr": "éolienne", "level": "B1"}, {"en": "fossil fuel", "fr": "combustible fossile", "level": "B2"}, {"en": "natural disaster", "fr": "catastrophe naturelle", "level": "B1"}, {"en": "wetland", "fr": "zone humide", "level": "B2"}, {"en": "thriving", "fr": "florissant/prospère", "level": "B2"}, {"en": "fragile ecosystem", "fr": "écosystème fragile", "level": "B2"}, {"en": "national park", "fr": "parc national", "level": "A2"}, {"en": "hiking trail", "fr": "sentier de randonnée", "level": "A2"}, {"en": "scenery", "fr": "paysage", "level": "B1"}, {"en": "untouched nature", "fr": "nature préservée", "level": "B2"}]'::jsonb
from vocab_themes where slug = 'nature';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'nature' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"cascade\" = ?", "options": ["waterfall", "solar power", "wind turbine", "fossil fuel"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"waterfall\"."}'),(2, 'qcm', '{"question": "\"volcan\" = ?", "options": ["volcano", "fragile ecosystem", "glacier", "solar power"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"volcano\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "coral reef", "right": "récif corallien"}, {"left": "predator", "right": "prédateur"}, {"left": "migration", "right": "migration"}, {"left": "pollinator", "right": "pollinisateur"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "solar power", "right": "énergie solaire"}, {"left": "wind turbine", "right": "éolienne"}, {"left": "fossil fuel", "right": "combustible fossile"}, {"left": "natural disaster", "right": "catastrophe naturelle"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"florissant/prospère\" = ", "sentence_after": "", "correct_answers": ["thriving"], "feedback_correct": "Correct !", "feedback_incorrect": "\"florissant/prospère\" se dit \"thriving\" en anglais."}'),(6, 'true_false', '{"statement": "\"national park\" veut dire \"parc national\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "tailored", "fr": "sur mesure", "level": "B2"}, {"en": "clearance sale", "fr": "soldes de fin de série", "level": "B2"}, {"en": "layering", "fr": "superposition (vêtements)", "level": "B2"}, {"en": "chic", "fr": "chic", "level": "A2"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'mode')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "hem", "fr": "ourlet", "level": "B1"}, {"en": "zipper", "fr": "fermeture éclair", "level": "A2"}, {"en": "pattern", "fr": "motif", "level": "A2"}, {"en": "faux leather", "fr": "similicuir", "level": "B1"}, {"en": "tailor", "fr": "tailleur (métier)", "level": "B1"}, {"en": "designer brand", "fr": "marque de créateur", "level": "B1"}, {"en": "fast fashion", "fr": "mode éphémère", "level": "B2"}, {"en": "thrift store", "fr": "friperie", "level": "B1"}, {"en": "dress code", "fr": "code vestimentaire", "level": "B1"}, {"en": "runway", "fr": "podium (défilé)", "level": "B1"}, {"en": "statement piece", "fr": "pièce forte (tenue)", "level": "B2"}, {"en": "versatile", "fr": "polyvalent", "level": "B1"}, {"en": "loose fit", "fr": "coupe ample", "level": "B1"}, {"en": "tight fit", "fr": "coupe ajustée", "level": "B1"}, {"en": "seasonal collection", "fr": "collection saisonnière", "level": "B1"}, {"en": "price tag", "fr": "étiquette de prix", "level": "A2"}, {"en": "shopping spree", "fr": "virée shopping", "level": "B1"}, {"en": "impulse buy", "fr": "achat impulsif", "level": "B2"}, {"en": "capsule wardrobe", "fr": "garde-robe capsule", "level": "C1"}, {"en": "timeless style", "fr": "style intemporel", "level": "B2"}]'::jsonb
from vocab_themes where slug = 'mode';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'mode' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"ourlet\" = ?", "options": ["capsule wardrobe", "dress code", "hem", "shopping spree"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"hem\"."}'),(2, 'qcm', '{"question": "\"motif\" = ?", "options": ["pattern", "fast fashion", "price tag", "designer brand"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"pattern\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "tailor", "right": "tailleur (métier)"}, {"left": "designer brand", "right": "marque de créateur"}, {"left": "fast fashion", "right": "mode éphémère"}, {"left": "thrift store", "right": "friperie"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "runway", "right": "podium (défilé)"}, {"left": "statement piece", "right": "pièce forte (tenue)"}, {"left": "versatile", "right": "polyvalent"}, {"left": "loose fit", "right": "coupe ample"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"collection saisonnière\" = ", "sentence_after": "", "correct_answers": ["seasonal collection"], "feedback_correct": "Correct !", "feedback_incorrect": "\"collection saisonnière\" se dit \"seasonal collection\" en anglais."}'),(6, 'true_false', '{"statement": "\"shopping spree\" veut dire \"virée shopping\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "vaccine", "fr": "vaccin", "level": "A2"}, {"en": "infection", "fr": "infection", "level": "A2"}, {"en": "pharmacist", "fr": "pharmacien", "level": "A2"}, {"en": "relapse", "fr": "rechute", "level": "B2"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'sante')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "diagnosis", "fr": "diagnostic", "level": "B1"}, {"en": "surgery", "fr": "chirurgie", "level": "B1"}, {"en": "physical exam", "fr": "examen physique", "level": "B1"}, {"en": "blood test", "fr": "prise de sang", "level": "A2"}, {"en": "side effect", "fr": "effet secondaire", "level": "B1"}, {"en": "chronic", "fr": "chronique", "level": "B1"}, {"en": "healing", "fr": "guérison (processus)", "level": "B1"}, {"en": "first aid", "fr": "premiers secours", "level": "A2"}, {"en": "mental health", "fr": "santé mentale", "level": "B1"}, {"en": "nutrition", "fr": "nutrition", "level": "A2"}, {"en": "hydrate", "fr": "s''hydrater", "level": "A2"}, {"en": "insomnia", "fr": "insomnie", "level": "B1"}, {"en": "stress relief", "fr": "soulagement du stress", "level": "B1"}, {"en": "emergency room", "fr": "urgences (hôpital)", "level": "B1"}, {"en": "clinic", "fr": "clinique", "level": "A2"}, {"en": "therapy session", "fr": "séance de thérapie", "level": "B1"}, {"en": "prevention", "fr": "prévention", "level": "B1"}, {"en": "healthy habits", "fr": "bonnes habitudes", "level": "A2"}, {"en": "balanced diet", "fr": "alimentation équilibrée", "level": "B1"}, {"en": "recovery time", "fr": "temps de récupération", "level": "B1"}]'::jsonb
from vocab_themes where slug = 'sante';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'sante' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"diagnostic\" = ?", "options": ["first aid", "diagnosis", "stress relief", "side effect"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"diagnosis\"."}'),(2, 'qcm', '{"question": "\"examen physique\" = ?", "options": ["physical exam", "nutrition", "balanced diet", "first aid"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"physical exam\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "side effect", "right": "effet secondaire"}, {"left": "chronic", "right": "chronique"}, {"left": "healing", "right": "guérison (processus)"}, {"left": "first aid", "right": "premiers secours"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "nutrition", "right": "nutrition"}, {"left": "hydrate", "right": "s''hydrater"}, {"left": "insomnia", "right": "insomnie"}, {"left": "stress relief", "right": "soulagement du stress"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"clinique\" = ", "sentence_after": "", "correct_answers": ["clinic"], "feedback_correct": "Correct !", "feedback_incorrect": "\"clinique\" se dit \"clinic\" en anglais."}'),(6, 'true_false', '{"statement": "\"prevention\" veut dire \"prévention\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "onboarding", "fr": "intégration (nouvel employé)", "level": "B2"}, {"en": "bonus", "fr": "prime", "level": "A2"}, {"en": "shift", "fr": "poste/équipe (horaire)", "level": "B1"}, {"en": "headquarters", "fr": "siège social", "level": "B1"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'travail')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "applicant", "fr": "candidat", "level": "B1"}, {"en": "interview", "fr": "entretien d''embauche", "level": "A2"}, {"en": "qualification", "fr": "qualification", "level": "B1"}, {"en": "supervisor", "fr": "superviseur", "level": "B1"}, {"en": "performance review", "fr": "évaluation de performance", "level": "B1"}, {"en": "work-life balance", "fr": "équilibre vie pro/perso", "level": "B1"}, {"en": "remote work", "fr": "télétravail", "level": "A2"}, {"en": "office politics", "fr": "jeux de pouvoir au bureau", "level": "C1"}, {"en": "assignment", "fr": "mission/tâche", "level": "A2"}, {"en": "networking", "fr": "réseautage", "level": "B1"}, {"en": "layoff", "fr": "licenciement", "level": "B2"}, {"en": "severance package", "fr": "indemnité de licenciement", "level": "C1"}, {"en": "job offer", "fr": "offre d''emploi", "level": "A2"}, {"en": "probation period", "fr": "période d''essai", "level": "B2"}, {"en": "cover letter", "fr": "lettre de motivation", "level": "B1"}, {"en": "skill set", "fr": "ensemble de compétences", "level": "B1"}, {"en": "mentor", "fr": "mentor", "level": "B1"}, {"en": "career path", "fr": "parcours professionnel", "level": "B1"}, {"en": "workplace", "fr": "lieu de travail", "level": "A2"}, {"en": "productivity", "fr": "productivité", "level": "B1"}]'::jsonb
from vocab_themes where slug = 'travail';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'travail' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"candidat\" = ?", "options": ["severance package", "applicant", "assignment", "skill set"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"applicant\"."}'),(2, 'qcm', '{"question": "\"qualification\" = ?", "options": ["severance package", "qualification", "work-life balance", "performance review"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"qualification\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "performance review", "right": "évaluation de performance"}, {"left": "work-life balance", "right": "équilibre vie pro/perso"}, {"left": "remote work", "right": "télétravail"}, {"left": "office politics", "right": "jeux de pouvoir au bureau"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "networking", "right": "réseautage"}, {"left": "layoff", "right": "licenciement"}, {"left": "severance package", "right": "indemnité de licenciement"}, {"left": "job offer", "right": "offre d''emploi"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"lettre de motivation\" = ", "sentence_after": "", "correct_answers": ["cover letter"], "feedback_correct": "Correct !", "feedback_incorrect": "\"lettre de motivation\" se dit \"cover letter\" en anglais."}'),(6, 'true_false', '{"statement": "\"mentor\" veut dire \"mentor\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "plumbing", "fr": "plomberie", "level": "B1"}, {"en": "insulation", "fr": "isolation", "level": "B2"}, {"en": "mortgage", "fr": "prêt immobilier", "level": "B2"}, {"en": "appliance", "fr": "électroménager", "level": "B1"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'maison')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "blueprint", "fr": "plan (architecture)", "level": "B1"}, {"en": "foundation", "fr": "fondation", "level": "B1"}, {"en": "staircase", "fr": "escalier", "level": "A2"}, {"en": "attic", "fr": "grenier", "level": "A2"}, {"en": "basement", "fr": "sous-sol", "level": "A2"}, {"en": "ceiling", "fr": "plafond", "level": "A1"}, {"en": "windowsill", "fr": "rebord de fenêtre", "level": "B1"}, {"en": "doorstep", "fr": "pas de la porte", "level": "B1"}, {"en": "real estate agent", "fr": "agent immobilier", "level": "B1"}, {"en": "down payment", "fr": "apport initial", "level": "B2"}, {"en": "fixer", "fr": "bricoleur", "level": "B1"}, {"en": "open floor plan", "fr": "plan ouvert (intérieur)", "level": "B2"}, {"en": "curb appeal", "fr": "attrait extérieur (maison)", "level": "C1"}, {"en": "neighborhood", "fr": "quartier", "level": "A2"}, {"en": "household chores", "fr": "tâches ménagères", "level": "A2"}, {"en": "home improvement", "fr": "amélioration de l''habitat", "level": "B1"}, {"en": "energy efficient", "fr": "économe en énergie", "level": "B1"}, {"en": "square footage", "fr": "surface habitable", "level": "B2"}, {"en": "move-in ready", "fr": "prêt à emménager", "level": "B2"}, {"en": "declutter", "fr": "désencombrer", "level": "B1"}]'::jsonb
from vocab_themes where slug = 'maison';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'maison' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"plan (architecture)\" = ?", "options": ["down payment", "household chores", "blueprint", "windowsill"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"blueprint\"."}'),(2, 'qcm', '{"question": "\"escalier\" = ?", "options": ["blueprint", "foundation", "staircase", "move-in ready"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"staircase\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "basement", "right": "sous-sol"}, {"left": "ceiling", "right": "plafond"}, {"left": "windowsill", "right": "rebord de fenêtre"}, {"left": "doorstep", "right": "pas de la porte"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "down payment", "right": "apport initial"}, {"left": "fixer", "right": "bricoleur"}, {"left": "open floor plan", "right": "plan ouvert (intérieur)"}, {"left": "curb appeal", "right": "attrait extérieur (maison)"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"tâches ménagères\" = ", "sentence_after": "", "correct_answers": ["household chores"], "feedback_correct": "Correct !", "feedback_incorrect": "\"tâches ménagères\" se dit \"household chores\" en anglais."}'),(6, 'true_false', '{"statement": "\"energy efficient\" veut dire \"économe en énergie\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);

update vocab_theme_levels
set words = words || '[{"en": "relieved", "fr": "soulagé", "level": "A2"}, {"en": "frustrated", "fr": "frustré", "level": "A2"}, {"en": "nostalgic", "fr": "nostalgique", "level": "B1"}, {"en": "indifferent", "fr": "indifférent", "level": "B1"}]'::jsonb
where theme_id = (select id from vocab_themes where slug = 'emotions')
and position = 1;

insert into vocab_theme_levels (theme_id, position, title, words)
select id, 2, 'Niveau 2', '[{"en": "overjoyed", "fr": "fou de joie", "level": "B1"}, {"en": "heartbroken", "fr": "le cœur brisé", "level": "B1"}, {"en": "furious", "fr": "furieux", "level": "B1"}, {"en": "terrified", "fr": "terrifié", "level": "A2"}, {"en": "content", "fr": "satisfait/content", "level": "B1"}, {"en": "bittersweet", "fr": "doux-amer", "level": "B2"}, {"en": "apathetic", "fr": "apathique", "level": "C1"}, {"en": "euphoric", "fr": "euphorique", "level": "B2"}, {"en": "insecure", "fr": "peu sûr de soi", "level": "B1"}, {"en": "compassionate", "fr": "compatissant", "level": "B1"}, {"en": "irritable", "fr": "irritable", "level": "B1"}, {"en": "hopeful", "fr": "plein d''espoir", "level": "A2"}, {"en": "melancholic", "fr": "mélancolique", "level": "B2"}, {"en": "thrilled", "fr": "ravi/enthousiaste", "level": "B1"}, {"en": "regretful", "fr": "plein de regrets", "level": "B1"}, {"en": "carefree", "fr": "insouciant", "level": "B1"}, {"en": "vulnerable", "fr": "vulnérable", "level": "B1"}, {"en": "determined", "fr": "déterminé", "level": "A2"}, {"en": "skeptical", "fr": "sceptique", "level": "B1"}, {"en": "content with life", "fr": "satisfait de sa vie", "level": "B1"}]'::jsonb
from vocab_themes where slug = 'emotions';

with l as (
  select vtl.id from vocab_theme_levels vtl
  join vocab_themes vt on vt.id = vtl.theme_id
  where vt.slug = 'emotions' and vtl.position = 2
)
insert into vocab_theme_exercises (level_id, position, type, content)
select l.id, v.position, v.type, v.content::jsonb from l, (values
(1, 'qcm', '{"question": "\"fou de joie\" = ?", "options": ["regretful", "euphoric", "heartbroken", "overjoyed"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"overjoyed\"."}'),(2, 'qcm', '{"question": "\"furieux\" = ?", "options": ["irritable", "apathetic", "content with life", "furious"], "correct_index": 3, "feedback_correct": "Correct !", "feedback_incorrect": "La bonne réponse est \"furious\"."}'),(3, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "content", "right": "satisfait/content"}, {"left": "bittersweet", "right": "doux-amer"}, {"left": "apathetic", "right": "apathique"}, {"left": "euphoric", "right": "euphorique"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(4, 'matching', '{"instruction": "Relie le mot anglais à sa traduction.", "pairs": [{"left": "compassionate", "right": "compatissant"}, {"left": "irritable", "right": "irritable"}, {"left": "hopeful", "right": "plein d''espoir"}, {"left": "melancholic", "right": "mélancolique"}], "feedback_correct": "Bravo !", "feedback_incorrect": "Regarde bien les mots."}'),(5, 'fill_blank', '{"sentence_before": "\"plein de regrets\" = ", "sentence_after": "", "correct_answers": ["regretful"], "feedback_correct": "Correct !", "feedback_incorrect": "\"plein de regrets\" se dit \"regretful\" en anglais."}'),(6, 'true_false', '{"statement": "\"vulnerable\" veut dire \"vulnérable\".", "correct_answer": true, "feedback_correct": "Correct !", "feedback_incorrect": "Regarde bien la traduction."}')
) as v(position, type, content);
