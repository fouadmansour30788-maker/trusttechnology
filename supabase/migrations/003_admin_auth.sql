-- Trust Technology — Back office auth, admin write access, image storage
-- Run AFTER 001_schema.sql and 002_seed_products.sql.

-- ── Staff profiles (1:1 with auth.users) ────────────────────────────────
CREATE TABLE IF NOT EXISTS profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT,
  full_name TEXT,
  role TEXT NOT NULL DEFAULT 'staff' CHECK (role IN ('admin', 'staff', 'viewer')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "profiles_self_read" ON profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "profiles_self_update" ON profiles FOR UPDATE USING (auth.uid() = id);

-- First user to sign up becomes admin; everyone after is staff.
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, role)
  VALUES (
    NEW.id, NEW.email,
    CASE WHEN (SELECT COUNT(*) FROM public.profiles) = 0 THEN 'admin' ELSE 'staff' END
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- Helper: is the current user staff or admin? (SECURITY DEFINER bypasses RLS)
CREATE OR REPLACE FUNCTION is_staff()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = auth.uid() AND role IN ('admin', 'staff')
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- ── Staff full access to catalog tables ─────────────────────────────────
-- (public_read_* policies from 001 still apply to anonymous visitors.)
CREATE POLICY "staff_all_products"      ON products      FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "staff_all_categories"    ON categories    FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "staff_all_tags"          ON tags          FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "staff_all_product_tags"  ON product_tags  FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "staff_all_bundles"       ON bundles       FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "staff_all_bundle_items"  ON bundle_items  FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "staff_all_orders"        ON orders        FOR ALL USING (is_staff()) WITH CHECK (is_staff());
CREATE POLICY "staff_all_order_items"   ON order_items   FOR ALL USING (is_staff()) WITH CHECK (is_staff());

-- ── Product image storage ───────────────────────────────────────────────
INSERT INTO storage.buckets (id, name, public)
VALUES ('product-images', 'product-images', TRUE)
ON CONFLICT (id) DO NOTHING;

CREATE POLICY "public_read_product_images"  ON storage.objects FOR SELECT USING (bucket_id = 'product-images');
CREATE POLICY "staff_insert_product_images" ON storage.objects FOR INSERT WITH CHECK (bucket_id = 'product-images' AND is_staff());
CREATE POLICY "staff_update_product_images" ON storage.objects FOR UPDATE USING (bucket_id = 'product-images' AND is_staff());
CREATE POLICY "staff_delete_product_images" ON storage.objects FOR DELETE USING (bucket_id = 'product-images' AND is_staff());
