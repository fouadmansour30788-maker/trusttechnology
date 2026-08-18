-- B2B / bulk order quote requests. Same "capture + staff worklist" pattern
-- as trade_ins and stock_alerts elsewhere in this schema — no automated
-- quoting engine, staff price it manually by phone/WhatsApp and track
-- progress here.
CREATE SEQUENCE IF NOT EXISTS quote_seq START 1;
CREATE TABLE IF NOT EXISTS quote_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  reference TEXT UNIQUE DEFAULT ('QR-' || lpad(nextval('quote_seq')::text, 4, '0')),
  company_name TEXT NOT NULL,
  contact_name TEXT NOT NULL,
  phone TEXT NOT NULL,
  email TEXT,
  details TEXT NOT NULL,
  budget TEXT,
  status TEXT NOT NULL DEFAULT 'new' CHECK (status IN ('new', 'contacted', 'quoted', 'won', 'lost')),
  internal_notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE quote_requests ENABLE ROW LEVEL SECURITY;
CREATE POLICY "quote_requests_staff_select" ON quote_requests FOR SELECT TO authenticated USING (true);
CREATE POLICY "quote_requests_staff_update" ON quote_requests FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "quote_requests_staff_delete" ON quote_requests FOR DELETE TO authenticated USING (true);
-- No public INSERT policy — submission goes through a service-role API route.
