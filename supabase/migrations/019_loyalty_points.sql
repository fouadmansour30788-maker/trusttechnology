-- Loyalty points: earn 1 point per $1 of subtotal on every order, redeemable
-- at checkout (100 points = $1 off), same "no new payment infra" approach as
-- gift certificates — it's just a discount applied inside the existing COD
-- checkout flow. Redemption requires a signed-in, account-linked customer
-- (so there's an unambiguous balance to spend); earning happens on every
-- order regardless, so guest customers accrue points that show up once they
-- register with the same phone number.
ALTER TABLE customers ADD COLUMN IF NOT EXISTS points_balance INTEGER NOT NULL DEFAULT 0;

CREATE TABLE IF NOT EXISTS points_ledger (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  delta INTEGER NOT NULL,
  reason TEXT NOT NULL CHECK (reason IN ('purchase', 'redemption', 'manual_adjustment')),
  sales_order_id UUID REFERENCES sales_orders(id) ON DELETE SET NULL,
  note TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS points_ledger_customer_idx ON points_ledger (customer_id, created_at DESC);
ALTER TABLE points_ledger ENABLE ROW LEVEL SECURITY;
CREATE POLICY "points_ledger_staff_all" ON points_ledger FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "points_ledger_owner_select" ON points_ledger FOR SELECT
  USING (customer_id IN (SELECT id FROM customers WHERE auth_user_id = auth.uid()));
