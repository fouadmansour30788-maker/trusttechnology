-- External-marketplace trending: Best Buy is auto-fetched (self-serve API,
-- see BESTBUY_API_KEY), Amazon and AliExpress are staff-curated since
-- neither has a viable auto-fetch path right now (Amazon PA-API is closed
-- to new applicants and deprecating; AliExpress's affiliate API needs a
-- manual approval application we haven't submitted yet).

CREATE TABLE IF NOT EXISTS bestbuy_trending_products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  sku TEXT NOT NULL,
  keyword TEXT NOT NULL,
  name TEXT NOT NULL,
  price NUMERIC,
  image_url TEXT,
  product_url TEXT,
  review_count INTEGER,
  review_average NUMERIC,
  fetched_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (sku)
);
ALTER TABLE bestbuy_trending_products ENABLE ROW LEVEL SECURITY;
CREATE POLICY "bbtp_staff_select" ON bestbuy_trending_products FOR SELECT TO authenticated USING (true);
CREATE POLICY "bbtp_staff_insert" ON bestbuy_trending_products FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "bbtp_staff_update" ON bestbuy_trending_products FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "bbtp_staff_delete" ON bestbuy_trending_products FOR DELETE TO authenticated USING (true);

CREATE TABLE IF NOT EXISTS external_trending_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source TEXT NOT NULL CHECK (source IN ('amazon', 'aliexpress')),
  name TEXT NOT NULL,
  price NUMERIC,
  currency TEXT NOT NULL DEFAULT 'USD',
  url TEXT NOT NULL,
  image_url TEXT,
  note TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE external_trending_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY "eti_staff_select" ON external_trending_items FOR SELECT TO authenticated USING (true);
CREATE POLICY "eti_staff_insert" ON external_trending_items FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "eti_staff_delete" ON external_trending_items FOR DELETE TO authenticated USING (true);
