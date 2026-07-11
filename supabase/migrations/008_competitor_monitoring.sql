-- Competitor monitoring v2: price history, manual matching, stock status.

-- Append-only price history (one row per observed price change, incl. first sighting)
create table if not exists competitor_price_history (
  id uuid primary key default gen_random_uuid(),
  competitor text not null,
  external_id text not null,
  price numeric not null,
  recorded_at timestamptz not null default now()
);
create index if not exists cph_item_idx on competitor_price_history (competitor, external_id, recorded_at desc);
create index if not exists cph_recent_idx on competitor_price_history (recorded_at desc);

alter table competitor_price_history enable row level security;
create policy "cph_select" on competitor_price_history for select to authenticated using (true);
create policy "cph_insert" on competitor_price_history for insert to authenticated with check (true);

-- Match provenance: 'auto' (model-token), 'manual' (confirmed by staff — never
-- overwritten by sync), 'rejected' (staff said no — auto-matcher must not re-apply).
alter table competitor_prices add column if not exists match_source text not null default 'auto';
-- Competitor availability (from WooCommerce is_in_stock; their stock-out = our opportunity)
alter table competitor_prices add column if not exists in_stock boolean not null default true;
