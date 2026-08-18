-- Product reviews (star rating + optional comment), moderated by staff before
-- appearing on the storefront. Public submission goes through a service-role
-- API route so unpublished reviews can't be enumerated by anyone but staff.
CREATE TABLE IF NOT EXISTS reviews (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  customer_name TEXT NOT NULL,
  rating SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  is_published BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS reviews_product_idx ON reviews (product_id, is_published);
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;
CREATE POLICY "reviews_public_read" ON reviews FOR SELECT USING (is_published);
CREATE POLICY "reviews_staff_select" ON reviews FOR SELECT TO authenticated USING (true);
CREATE POLICY "reviews_staff_update" ON reviews FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "reviews_staff_delete" ON reviews FOR DELETE TO authenticated USING (true);
CREATE POLICY "reviews_staff_insert" ON reviews FOR INSERT TO authenticated WITH CHECK (true);
