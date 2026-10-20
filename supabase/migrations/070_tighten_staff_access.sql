-- Security fix: stop auto-granting back-office ("staff") access to every
-- public signup, and close a set of RLS policies that granted "any
-- authenticated user" access instead of checking is_staff().
--
-- Root cause: handle_new_user() (003_admin_auth.sql) inserted a profiles
-- row with role='staff' for EVERY new auth.users signup -- including
-- ordinary customers registering via the public /register page, which
-- uses the same Supabase Auth user pool as /admin/login. Since is_staff()
-- checks profiles.role IN ('admin','staff'), any customer who signed up
-- could then sign in at /admin/login and pass every is_staff() check.
--
-- Separately, several later feature migrations (competitors, repairs,
-- product questions, stock alerts, trending, reviews, quote requests,
-- Facebook integration) never used is_staff() at all -- they granted
-- "to authenticated using (true)", i.e. any logged-in user, which is
-- wrong for the same reason and would still be wrong even after the
-- trigger fix below, since it doesn't check role at all.

-- ── 1. Stop auto-granting staff role on signup ──────────────────────────
-- Keep the original bootstrap behaviour (first-ever signup becomes admin,
-- useful if profiles is ever empty in a fresh environment) but stop
-- promoting every signup after that. Going forward, granting staff access
-- is a deliberate action: insert a profiles row by hand (see the admin
-- back-office team-management UI, once built, or the Supabase SQL editor).
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT COUNT(*) FROM public.profiles) = 0 THEN
    INSERT INTO public.profiles (id, email, role) VALUES (NEW.id, NEW.email, 'admin');
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ── 2. Require is_staff() instead of blanket "any authenticated user" ──
-- competitor_prices (007_competitors.sql)
ALTER POLICY "competitor_prices_select" ON competitor_prices USING (is_staff());
ALTER POLICY "competitor_prices_insert" ON competitor_prices WITH CHECK (is_staff());
ALTER POLICY "competitor_prices_update" ON competitor_prices USING (is_staff()) WITH CHECK (is_staff());
ALTER POLICY "competitor_prices_delete" ON competitor_prices USING (is_staff());

-- competitor_price_history (008_competitor_monitoring.sql)
ALTER POLICY "cph_select" ON competitor_price_history USING (is_staff());
ALTER POLICY "cph_insert" ON competitor_price_history WITH CHECK (is_staff());

-- repairs (009_repairs_questions.sql)
ALTER POLICY "repairs_staff_select" ON repairs USING (is_staff());
ALTER POLICY "repairs_staff_insert" ON repairs WITH CHECK (is_staff());
ALTER POLICY "repairs_staff_update" ON repairs USING (is_staff()) WITH CHECK (is_staff());
ALTER POLICY "repairs_staff_delete" ON repairs USING (is_staff());

-- product_questions (009_repairs_questions.sql)
ALTER POLICY "pq_staff_select" ON product_questions USING (is_staff());
ALTER POLICY "pq_staff_insert" ON product_questions WITH CHECK (is_staff());
ALTER POLICY "pq_staff_update" ON product_questions USING (is_staff()) WITH CHECK (is_staff());
ALTER POLICY "pq_staff_delete" ON product_questions USING (is_staff());

-- stock_alerts (011_stock_alerts.sql)
ALTER POLICY "stock_alerts_staff_select" ON stock_alerts USING (is_staff());
ALTER POLICY "stock_alerts_staff_insert" ON stock_alerts WITH CHECK (is_staff());
ALTER POLICY "stock_alerts_staff_update" ON stock_alerts USING (is_staff()) WITH CHECK (is_staff());
ALTER POLICY "stock_alerts_staff_delete" ON stock_alerts USING (is_staff());

-- product_view_events (013_trending.sql)
ALTER POLICY "pve_staff_select" ON product_view_events USING (is_staff());
ALTER POLICY "pve_staff_insert" ON product_view_events WITH CHECK (is_staff());
ALTER POLICY "pve_staff_delete" ON product_view_events USING (is_staff());

-- trending_searches (013_trending.sql)
ALTER POLICY "ts_staff_select" ON trending_searches USING (is_staff());
ALTER POLICY "ts_staff_insert" ON trending_searches WITH CHECK (is_staff());
ALTER POLICY "ts_staff_update" ON trending_searches USING (is_staff()) WITH CHECK (is_staff());

-- bestbuy_trending_products (014_external_trending.sql)
ALTER POLICY "bbtp_staff_select" ON bestbuy_trending_products USING (is_staff());
ALTER POLICY "bbtp_staff_insert" ON bestbuy_trending_products WITH CHECK (is_staff());
ALTER POLICY "bbtp_staff_update" ON bestbuy_trending_products USING (is_staff()) WITH CHECK (is_staff());
ALTER POLICY "bbtp_staff_delete" ON bestbuy_trending_products USING (is_staff());

-- external_trending_items (014_external_trending.sql)
ALTER POLICY "eti_staff_select" ON external_trending_items USING (is_staff());
ALTER POLICY "eti_staff_insert" ON external_trending_items WITH CHECK (is_staff());
ALTER POLICY "eti_staff_delete" ON external_trending_items USING (is_staff());

-- reviews (018_reviews.sql) -- reviews_public_read (is_published) is untouched
ALTER POLICY "reviews_staff_select" ON reviews USING (is_staff());
ALTER POLICY "reviews_staff_update" ON reviews USING (is_staff()) WITH CHECK (is_staff());
ALTER POLICY "reviews_staff_delete" ON reviews USING (is_staff());
ALTER POLICY "reviews_staff_insert" ON reviews WITH CHECK (is_staff());

-- quote_requests (020_quote_requests.sql)
ALTER POLICY "quote_requests_staff_select" ON quote_requests USING (is_staff());
ALTER POLICY "quote_requests_staff_update" ON quote_requests USING (is_staff()) WITH CHECK (is_staff());
ALTER POLICY "quote_requests_staff_delete" ON quote_requests USING (is_staff());

-- fb_page_stats, fb_comments (067_facebook_integration.sql)
ALTER POLICY "fb_page_stats_select" ON fb_page_stats USING (is_staff());
ALTER POLICY "fb_page_stats_insert" ON fb_page_stats WITH CHECK (is_staff());
ALTER POLICY "fb_comments_select" ON fb_comments USING (is_staff());
ALTER POLICY "fb_comments_insert" ON fb_comments WITH CHECK (is_staff());
ALTER POLICY "fb_comments_update" ON fb_comments USING (is_staff()) WITH CHECK (is_staff());
