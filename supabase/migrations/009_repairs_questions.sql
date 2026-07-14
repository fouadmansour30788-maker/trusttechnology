-- Repair/service tickets + product Q&A.

CREATE SEQUENCE IF NOT EXISTS rep_seq START 1;
CREATE TABLE IF NOT EXISTS repairs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  reference TEXT UNIQUE DEFAULT ('REP-' || lpad(nextval('rep_seq')::text, 4, '0')),
  customer_name TEXT NOT NULL,
  phone TEXT NOT NULL,
  device TEXT NOT NULL,
  problem TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'received' CHECK (status IN ('received','diagnosing','awaiting_approval','repairing','ready','delivered','cancelled')),
  quote NUMERIC,
  internal_notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE repairs ENABLE ROW LEVEL SECURITY;
-- Staff manage everything; the public books/tracks via service-role API routes.
CREATE POLICY "repairs_staff_select" ON repairs FOR SELECT TO authenticated USING (true);
CREATE POLICY "repairs_staff_insert" ON repairs FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "repairs_staff_update" ON repairs FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "repairs_staff_delete" ON repairs FOR DELETE TO authenticated USING (true);

CREATE TABLE IF NOT EXISTS product_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  question TEXT NOT NULL,
  answer TEXT,
  is_published BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  answered_at TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS pq_product_idx ON product_questions (product_id, is_published);
ALTER TABLE product_questions ENABLE ROW LEVEL SECURITY;
-- Everyone can read published Q&A on the storefront; staff manage the rest.
CREATE POLICY "pq_public_read" ON product_questions FOR SELECT USING (is_published);
CREATE POLICY "pq_staff_select" ON product_questions FOR SELECT TO authenticated USING (true);
CREATE POLICY "pq_staff_insert" ON product_questions FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "pq_staff_update" ON product_questions FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "pq_staff_delete" ON product_questions FOR DELETE TO authenticated USING (true);
