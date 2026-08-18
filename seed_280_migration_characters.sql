-- ============================================
-- LUMA — Migration : système de personnages / mascottes
-- Infrastructure complète, prête à recevoir de vraies illustrations
-- (les colonnes image_url sont nullables ; tant qu'elles sont vides,
-- l'app affiche un avatar placeholder emoji + couleur automatiquement)
-- ============================================

create table characters (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,               -- identifiant stable, ex: 'finn'
  name text not null,
  description text,                        -- petite bio / personnalité affichée à la sélection
  color text not null default '#FFB648',   -- couleur d'accent de l'avatar placeholder
  placeholder_emoji text not null default '✨',
  is_selectable_as_guide boolean not null default true,
  position integer not null default 0,

  -- URLs des illustrations par état émotionnel — vides pour l'instant.
  -- Dès qu'une image est renseignée ici, l'app l'utilise automatiquement
  -- à la place du placeholder emoji, sans aucun changement de code.
  image_neutral_url text,
  image_happy_url text,
  image_celebrating_url text,
  image_thinking_url text,
  image_sad_url text,
  image_waving_url text,

  created_at timestamptz not null default now()
);

alter table characters enable row level security;
create policy "Characters are viewable by everyone" on characters for select using (true);

-- Le guide choisi par l'utilisateur à l'inscription (modifiable ensuite dans Réglages)
alter table user_settings add column if not exists guide_character_id uuid references characters(id);

-- Table optionnelle : associe un "speaker" de dialogue de scénario (ex: "alex")
-- à un personnage visuel réel, sans toucher au contenu JSON des 150+ scénarios déjà écrits.
-- Tant qu'une paire n'est pas mappée ici, le scénario continue d'afficher juste le nom du speaker.
create table scenario_speaker_characters (
  id uuid primary key default gen_random_uuid(),
  scenario_id uuid not null references scenarios(id) on delete cascade,
  speaker_key text not null,               -- clé technique dans content.characters, ex: "alex"
  character_id uuid not null references characters(id) on delete cascade,
  unique (scenario_id, speaker_key)
);

alter table scenario_speaker_characters enable row level security;
create policy "Scenario character mapping viewable by everyone" on scenario_speaker_characters for select using (true);

-- ============================================
-- Personnages placeholder : 6 mascottes de la même typologie (petites
-- créatures lumineuses/animales, cohérentes avec l'identité "Lumen").
-- À remplacer plus tard par de vraies illustrations, juste en renseignant
-- les colonnes image_*_url ci-dessus — aucune autre modification requise.
-- ============================================
insert into characters (slug, name, description, color, placeholder_emoji, position) values
  ('finn', 'Finn', 'Un renard curieux et débrouillard, toujours prêt à explorer une nouvelle règle de grammaire.', '#F2872F', '🦊', 1),
  ('luna', 'Luna', 'Une chouette studieuse qui adore les défis et se souvient de tout.', '#8B7CF6', '🦉', 2),
  ('mochi', 'Mochi', 'Un petit panda tout doux, patient et encourageant même après une erreur.', '#3CE6C4', '🐼', 3),
  ('ember', 'Ember', 'Un jeune dragon plein d''énergie qui célèbre chaque victoire avec enthousiasme.', '#FFB648', '🐉', 4),
  ('nori', 'Nori', 'Un chat espiègle, un brin taquin, qui adore les scénarios rocambolesques.', '#2FE6C0', '🐱', 5),
  ('sage', 'Sage', 'Une tortue sereine et sage, parfaite pour les niveaux avancés et la grammaire fine.', '#6B57D6', '🐢', 6)
on conflict (slug) do nothing;
