-- Competitor price monitoring
create table if not exists competitor_prices (
  id uuid primary key default gen_random_uuid(),
  competitor text not null,
  external_id text not null,
  name text not null,
  sku text,
  url text,
  price numeric not null,
  previous_price numeric,
  price_changed_at timestamptz,
  matched_product_id uuid references products(id) on delete set null,
  fetched_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  unique (competitor, external_id)
);

create index if not exists competitor_prices_matched_idx on competitor_prices (matched_product_id) where matched_product_id is not null;

alter table competitor_prices enable row level security;

-- Staff (any authenticated user) can read and write; the cron job uses the
-- service-role key which bypasses RLS.
create policy "competitor_prices_select" on competitor_prices
  for select to authenticated using (true);
create policy "competitor_prices_insert" on competitor_prices
  for insert to authenticated with check (true);
create policy "competitor_prices_update" on competitor_prices
  for update to authenticated using (true) with check (true);
create policy "competitor_prices_delete" on competitor_prices
  for delete to authenticated using (true);
