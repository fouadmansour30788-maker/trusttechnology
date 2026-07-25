-- Customer restock / price-drop email alerts.
CREATE TABLE IF NOT EXISTS stock_alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  kind TEXT NOT NULL CHECK (kind IN ('restock','price_drop')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  notified_at TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS stock_alerts_pending_idx ON stock_alerts (product_id, kind) WHERE notified_at IS NULL;
ALTER TABLE stock_alerts ENABLE ROW LEVEL SECURITY;
-- Same pattern as `repairs`: staff manage everything; the public subscribes via a service-role API route.
CREATE POLICY "stock_alerts_staff_select" ON stock_alerts FOR SELECT TO authenticated USING (true);
CREATE POLICY "stock_alerts_staff_insert" ON stock_alerts FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "stock_alerts_staff_update" ON stock_alerts FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "stock_alerts_staff_delete" ON stock_alerts FOR DELETE TO authenticated USING (true);
