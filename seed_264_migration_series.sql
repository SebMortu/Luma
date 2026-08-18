-- ============================================
-- LUMA — Migration : livres en plusieurs tomes (séries)
-- ============================================

alter table books add column is_series boolean not null default false;
alter table books add column series_id uuid references books(id) on delete cascade;
alter table books add column volume_number integer;

-- Un livre "série" n'a pas de pages propres (total_pages reste à 0),
-- il sert de conteneur. Les tomes ont series_id = id de la série.
