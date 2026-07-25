-- Trending signals: own-store product views, and cached Google Trends
-- search-interest scores for Lebanon (competitor-repricing trending needs
-- no new table — it's computed live from the existing competitor_prices /
-- competitor_price_history data).

CREATE TABLE IF NOT EXISTS product_view_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  viewed_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS pve_product_idx ON product_view_events (product_id, viewed_at DESC);
CREATE INDEX IF NOT EXISTS pve_viewed_at_idx ON product_view_events (viewed_at DESC);
ALTER TABLE product_view_events ENABLE ROW LEVEL SECURITY;
-- Public can log a view (POST via service role, see /api/track-view); only staff read.
CREATE POLICY "pve_staff_select" ON product_view_events FOR SELECT TO authenticated USING (true);
CREATE POLICY "pve_staff_insert" ON product_view_events FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "pve_staff_delete" ON product_view_events FOR DELETE TO authenticated USING (true);

CREATE TABLE IF NOT EXISTS trending_searches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  keyword TEXT NOT NULL,
  geo TEXT NOT NULL DEFAULT 'LB',
  score SMALLINT NOT NULL, -- Google's 0-100 relative-interest scale, most recent week
  prev_score SMALLINT,     -- previous week's score, for a rising/falling indicator
  fetched_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (keyword, geo)
);
ALTER TABLE trending_searches ENABLE ROW LEVEL SECURITY;
CREATE POLICY "ts_staff_select" ON trending_searches FOR SELECT TO authenticated USING (true);
CREATE POLICY "ts_staff_insert" ON trending_searches FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "ts_staff_update" ON trending_searches FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
