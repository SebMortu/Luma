-- ============================================
-- LUMA — Monnaie virtuelle "Lums" 🪙 + Boutique (Phase 1)
-- Phase 1 : protections de série achetables, cadres de profil, badges
-- cosmétiques. Les cartes postales/destinations et scénarios bonus sont
-- prévus pour une phase 2 (contenu à concevoir, pas juste du code).
-- ============================================

alter table user_settings add column if not exists lums_balance integer not null default 0;
alter table user_settings add column if not exists equipped_frame_id uuid;

create table shop_items (
  id uuid primary key default gen_random_uuid(),
  category text not null check (category in ('streak_freeze', 'profile_frame', 'badge')),
  slug text not null unique,
  name text not null,
  description text,
  price integer not null,
  emoji text,
  frame_css text,  -- pour les cadres de profil : style de bordure CSS
  position integer not null default 0
);

alter table shop_items enable row level security;
create policy "Shop items are viewable by everyone"
  on shop_items for select using (true);

create table user_shop_purchases (
  user_id uuid not null references auth.users(id) on delete cascade,
  item_id uuid not null references shop_items(id) on delete cascade,
  purchased_at timestamptz not null default now(),
  primary key (user_id, item_id)
);

alter table user_shop_purchases enable row level security;
create policy "Users manage their own purchases"
  on user_shop_purchases for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

alter table user_settings add constraint fk_equipped_frame foreign key (equipped_frame_id) references shop_items(id);

-- ============================================
-- Catalogue de départ
-- ============================================

insert into shop_items (category, slug, name, description, price, emoji, position) values
  ('streak_freeze', 'freeze', 'Protection de série', 'Protège ta série un jour si tu manques une session. Se cumule avec celles déjà gagnées.', 40, '🧊', 1);

insert into shop_items (category, slug, name, description, price, frame_css, position) values
  ('profile_frame', 'frame_gold',      'Cadre doré',          'Un anneau doré classique et élégant.', 60,  '3px solid #D4A82F', 1),
  ('profile_frame', 'frame_silver',    'Cadre argenté',       'Sobre et lumineux.', 60,               '3px solid #B8C0CC', 2),
  ('profile_frame', 'frame_emerald',   'Cadre émeraude',      'Vert profond, pour les habitués de la régularité.', 80, '3px solid #2E9E6B', 3),
  ('profile_frame', 'frame_ruby',      'Cadre rubis',         'Rouge intense, pour les plus déterminés.', 80,      '3px solid #C0392B', 4),
  ('profile_frame', 'frame_sapphire',  'Cadre saphir',        'Bleu profond et apaisant.', 80,                     '3px solid #2E5EA8', 5),
  ('profile_frame', 'frame_rainbow',   'Cadre arc-en-ciel',   'Dégradé multicolore, pour se démarquer.', 150,       '3px solid transparent', 6),
  ('profile_frame', 'frame_dashed',    'Cadre pointillé',     'Un style plus décontracté.', 50,                    '3px dashed #8A93A8', 7),
  ('profile_frame', 'frame_double',    'Cadre double liseré', 'Deux traits fins superposés.', 100,                 '3px double #6B4A24', 8);

insert into shop_items (category, slug, name, description, price, emoji, position) values
  ('badge', 'badge_early_bird',   'Lève-tôt',        'Pour les leçons faites avant 8h du matin.', 30, '🌅', 1),
  ('badge', 'badge_night_owl',    'Oiseau de nuit',  'Pour les leçons faites après 22h.', 30,          '🦉', 2),
  ('badge', 'badge_perfectionist','Perfectionniste', 'Pour ceux qui visent toujours 100%.', 50,        '💯', 3),
  ('badge', 'badge_bookworm',     'Rat de bibliothèque', 'Pour les amateurs de lecture.', 40,           '📚', 4),
  ('badge', 'badge_globe',        'Globe-trotter',   'Pour les explorateurs de scénarios.', 40,        '🌍', 5),
  ('badge', 'badge_collector',    'Collectionneur',  'Pour ceux qui aiment tout amasser.', 60,         '🏆', 6);
