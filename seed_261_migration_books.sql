-- ============================================
-- LUMA — Migration : nouveau menu "Livre"
-- Tables : books, book_pages, user_book_progress
-- ============================================

create table books (
  id uuid primary key default gen_random_uuid(),
  language_id uuid not null references languages(id) on delete cascade,
  title text not null,
  theme text not null,                    -- 'aventure', 'mystère', 'science-fiction'...
  description text not null,              -- pitch court affiché sur la couverture
  cecr_level text not null,                -- 'A1', 'A2', 'B1'...
  cover_emoji text not null default '📖',
  total_pages integer not null default 0,
  position integer not null,
  created_at timestamptz not null default now()
);

create table book_pages (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references books(id) on delete cascade,
  page_number integer not null,
  sentences jsonb not null default '[]',  -- [{"en": "...", "fr": "..."}, ...]
  created_at timestamptz not null default now(),
  unique (book_id, page_number)
);

create table user_book_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  book_id uuid not null references books(id) on delete cascade,
  current_page integer not null default 1,
  completed boolean not null default false,
  updated_at timestamptz not null default now(),
  unique (user_id, book_id)
);

-- RLS
alter table books enable row level security;
alter table book_pages enable row level security;
alter table user_book_progress enable row level security;

create policy "Books are viewable by everyone" on books for select using (true);
create policy "Book pages are viewable by everyone" on book_pages for select using (true);

create policy "Users can view their own book progress" on user_book_progress
  for select using (auth.uid() = user_id);
create policy "Users can insert their own book progress" on user_book_progress
  for insert with check (auth.uid() = user_id);
create policy "Users can update their own book progress" on user_book_progress
  for update using (auth.uid() = user_id);
