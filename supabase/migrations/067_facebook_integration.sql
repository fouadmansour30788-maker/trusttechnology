-- Facebook Page insights + comments, synced from the Graph API (see
-- src/lib/facebook.ts and /api/facebook/sync). Same shape as the
-- competitor-price sync: cron writes via the service-role key, staff read
-- via RLS.

create table if not exists fb_page_stats (
  id uuid primary key default gen_random_uuid(),
  page_id text not null,
  fan_count integer,
  followers_count integer,
  impressions_28d integer,
  engaged_users_28d integer,
  page_views_28d integer,
  fetched_at timestamptz not null default now(),
  created_at timestamptz not null default now()
);

create index if not exists fb_page_stats_fetched_idx on fb_page_stats (fetched_at desc);

create table if not exists fb_comments (
  id uuid primary key default gen_random_uuid(),
  fb_comment_id text not null unique,
  post_id text not null,
  post_message text,
  post_permalink text,
  message text not null,
  from_name text,
  like_count integer default 0,
  comment_created_at timestamptz,
  fetched_at timestamptz not null default now(),
  created_at timestamptz not null default now()
);

create index if not exists fb_comments_created_idx on fb_comments (comment_created_at desc);
create index if not exists fb_comments_post_idx on fb_comments (post_id);

alter table fb_page_stats enable row level security;
alter table fb_comments enable row level security;

create policy "fb_page_stats_select" on fb_page_stats
  for select to authenticated using (true);
create policy "fb_page_stats_insert" on fb_page_stats
  for insert to authenticated with check (true);

create policy "fb_comments_select" on fb_comments
  for select to authenticated using (true);
create policy "fb_comments_insert" on fb_comments
  for insert to authenticated with check (true);
create policy "fb_comments_update" on fb_comments
  for update to authenticated using (true) with check (true);
