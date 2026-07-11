# Back Office Setup (Supabase)

The storefront works without a database (it falls back to the static catalog in
`src/data/products.ts`). The **back office** (`/admin`) needs Supabase to store and
edit products. Follow these steps once.

## 1. Create a free Supabase project
1. Go to https://supabase.com → **New project**. Pick a name, a strong DB password, and a region close to Lebanon (e.g. Frankfurt).
2. Wait ~2 minutes for it to provision.

## 2. Get your keys
In the project: **Settings → API**. Copy:
- **Project URL** → `NEXT_PUBLIC_SUPABASE_URL`
- **anon public** key → `NEXT_PUBLIC_SUPABASE_ANON_KEY`

Put them in **`.env.local`** (local dev):
```
NEXT_PUBLIC_SUPABASE_URL=https://YOUR-REF.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...your-anon-key...
```
And in **Vercel → Project → Settings → Environment Variables** (production), same two keys. Redeploy after adding.

## 3. Run the migrations (in order)
In Supabase: **SQL Editor → New query**. Paste and **Run** each file, in this order:
1. `supabase/migrations/001_schema.sql` — tables, categories, base tags, RLS
2. `supabase/migrations/002_seed_products.sql` — the 186 real products + brand tags
3. `supabase/migrations/003_admin_auth.sql` — staff login, admin write access, image storage bucket

> If step 3 errors on a `storage.objects` policy that already exists, it's safe to ignore — the bucket/policies are already in place.

### Later migrations
Run any newer files in `supabase/migrations/` the same way, in numeric order:
- `007_competitors.sql` — competitor price monitoring table
- `008_competitor_monitoring.sql` — price history, manual matching, competitor stock status

### Competitor price monitoring (optional, for the daily auto-sync)
The **Competitors** admin page works immediately via its "Sync now" button (uses your
staff session). For the automatic daily sync (Vercel Cron, 5:00 UTC), add two more
env vars in **Vercel → Settings → Environment Variables**:
- `CRON_SECRET` — any long random string (Vercel sends it with cron requests).
- `SUPABASE_SERVICE_ROLE_KEY` — Supabase **Settings → API → service_role** key
  (server-only; never expose it in the browser).
Redeploy after adding.

## 4. Create your admin user
**Authentication → Users → Add user** → enter your email + a password → **Create**.
- The **first** user created automatically becomes `admin` (later users are `staff`).
- Tip: tick "Auto Confirm User" so you can log in immediately.

## 5. Use it
- Local: restart `npm run dev`, go to **http://localhost:3000/admin**, sign in.
- Production: after the Vercel redeploy, go to **your-domain.com/admin**.

You can now **add, edit, delete products**, upload images, manage stock and "call for price"
flags, and toggle visibility — all changes appear instantly on the storefront `/products`.

## Notes
- **Images** upload to the `product-images` storage bucket (created by migration 003) and are served via public URLs. The form uses Supabase Storage; the local `public/products/*` images from the seed are referenced by URL string in the seeded rows.
- **Product images on Next/Image:** external Supabase URLs need to be allowed. If product
  thumbnails 404 on production, add your Supabase hostname to `next.config.ts`:
  ```ts
  images: { remotePatterns: [{ protocol: 'https', hostname: 'YOUR-REF.supabase.co' }] }
  ```
- **AI advisor** (`/recommend`) is separate — it needs `ANTHROPIC_API_KEY` (also set in Vercel).
- **Security:** writes are protected by row-level security — only logged-in staff can modify the catalog; the public can only read active products.
