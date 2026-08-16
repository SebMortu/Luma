-- ============================================
-- LUMA — Migration : jeux de mots (mots croisés / mots fléchés)
-- ============================================

create table word_puzzles (
  id uuid primary key default gen_random_uuid(),
  language_id uuid not null references languages(id) on delete cascade,
  type text not null,              -- 'crossword' ou 'fleche'
  title text not null,
  cecr_level text not null,
  rows integer not null,
  cols integer not null,
  words jsonb not null,            -- [{direction, clue, answer, row, col}]
  created_at timestamptz not null default now()
);

create table word_puzzle_scores (
  id uuid primary key default gen_random_uuid(),
  puzzle_id uuid not null references word_puzzles(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  display_name text not null,
  time_seconds integer not null,
  created_at timestamptz not null default now()
);

alter table word_puzzles enable row level security;
alter table word_puzzle_scores enable row level security;

create policy "public read word_puzzles" on word_puzzles for select using (true);
-- Le classement est visible par tous (pas de données sensibles, juste pseudo + temps)
create policy "public read word_puzzle_scores" on word_puzzle_scores for select using (true);
create policy "user inserts own score" on word_puzzle_scores
  for insert with check (auth.uid() = user_id);

grant select on word_puzzles to anon, authenticated;
grant select, insert on word_puzzle_scores to anon, authenticated;
