-- Trust Technology — customer accounts, wishlist, gift certificates
--
-- SECURITY FIX FIRST: handle_new_user() (003_admin_auth.sql) currently grants
-- staff/admin access to EVERY signup unconditionally — the first ever signup
-- becomes 'admin', every one after becomes 'staff'. That was harmless only
-- because no public signup form existed yet. This migration adds one
-- (customer self-registration), so the trigger must stop auto-promoting
-- ordinary signups before that ships. Staff accounts are no longer created by
-- "just sign up" — going forward, add a new staff member with:
--   INSERT INTO profiles (id, email, role) VALUES ('<auth.users id>', '<email>', 'staff');
-- (create the auth user first via the Supabase dashboard, then run that.)
-- Existing staff are untouched — this only changes what happens on INSERT.
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  RETURN NEW; -- no longer auto-creates a profiles/staff row for new signups
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ── Link customers to a real login (nullable — guest COD checkout still works) ─
ALTER TABLE customers ADD COLUMN IF NOT EXISTS auth_user_id UUID REFERENCES auth.users(id) UNIQUE;

-- customers is currently staff-only (is_staff() policy from 004_erp.sql) —
-- add a policy letting a signed-in customer read/update their own row.
CREATE POLICY "customer_self_select" ON customers FOR SELECT USING (auth.uid() = auth_user_id);
CREATE POLICY "customer_self_update" ON customers FOR UPDATE USING (auth.uid() = auth_user_id) WITH CHECK (auth.uid() = auth_user_id);

-- Same for sales_orders — a customer may read their own order history.
CREATE POLICY "customer_own_orders_select" ON sales_orders FOR SELECT
  USING (customer_id IN (SELECT id FROM customers WHERE auth_user_id = auth.uid()));
CREATE POLICY "customer_own_order_items_select" ON sales_order_items FOR SELECT
  USING (so_id IN (SELECT id FROM sales_orders WHERE customer_id IN (SELECT id FROM customers WHERE auth_user_id = auth.uid())));

-- ── Wishlist ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS wishlist_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  auth_user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (auth_user_id, product_id)
);
CREATE INDEX IF NOT EXISTS wishlist_items_user_idx ON wishlist_items (auth_user_id, created_at DESC);
ALTER TABLE wishlist_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY "wishlist_owner_select" ON wishlist_items FOR SELECT USING (auth.uid() = auth_user_id);
CREATE POLICY "wishlist_owner_insert" ON wishlist_items FOR INSERT WITH CHECK (auth.uid() = auth_user_id);
CREATE POLICY "wishlist_owner_delete" ON wishlist_items FOR DELETE USING (auth.uid() = auth_user_id);

-- ── Gift certificates ────────────────────────────────────────────────────
-- Purchased like any product through the existing COD flow: creates a
-- 'pending_payment' certificate + a linked sales_order for staff to confirm
-- by phone same as any order; staff then activate it from /admin (reveals
-- the redeemable code). No new payment infrastructure needed.
CREATE TABLE IF NOT EXISTS gift_certificates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code TEXT UNIQUE, -- assigned on activation, not at purchase time
  initial_balance NUMERIC NOT NULL CHECK (initial_balance > 0),
  remaining_balance NUMERIC NOT NULL,
  purchaser_auth_user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  purchaser_name TEXT NOT NULL,
  purchaser_phone TEXT NOT NULL,
  recipient_name TEXT,
  recipient_email TEXT,
  message TEXT,
  status TEXT NOT NULL DEFAULT 'pending_payment' CHECK (status IN ('pending_payment', 'active', 'redeemed', 'cancelled')),
  sales_order_id UUID REFERENCES sales_orders(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  activated_at TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS gift_certificates_purchaser_idx ON gift_certificates (purchaser_auth_user_id);
ALTER TABLE gift_certificates ENABLE ROW LEVEL SECURITY;
CREATE POLICY "gift_cert_staff_all" ON gift_certificates FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "gift_cert_purchaser_select" ON gift_certificates FOR SELECT USING (auth.uid() = purchaser_auth_user_id);

CREATE TABLE IF NOT EXISTS gift_certificate_redemptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  gift_certificate_id UUID NOT NULL REFERENCES gift_certificates(id) ON DELETE CASCADE,
  sales_order_id UUID REFERENCES sales_orders(id) ON DELETE SET NULL,
  amount_applied NUMERIC NOT NULL CHECK (amount_applied > 0),
  redeemed_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
ALTER TABLE gift_certificate_redemptions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "gift_cert_redemption_staff_all" ON gift_certificate_redemptions FOR ALL USING (is_staff()) WITH CHECK (is_staff());

-- Track a redemption applied to a regular order (checkout redemption discount).
ALTER TABLE sales_orders ADD COLUMN IF NOT EXISTS gift_certificate_amount_applied NUMERIC NOT NULL DEFAULT 0;
