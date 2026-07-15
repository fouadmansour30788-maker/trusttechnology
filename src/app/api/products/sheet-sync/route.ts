import { NextResponse } from 'next/server'
import { createClient as createServiceClient, type SupabaseClient } from '@supabase/supabase-js'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'
export const maxDuration = 60

/**
 * Google-Sheet → catalog sync. Reads the published-CSV URL in SHEET_CSV_URL
 * and upserts products by `slug` (the stable key; blank slug = new product).
 *
 * Column contract (header names, case-insensitive):
 *   slug (key) · name* · category · brand · price · compare_at_price · cost ·
 *   vat_rate · cpu ram storage vga screen os warranty · description ·
 *   image_url (blank keeps existing) · active · featured · colors
 * `stock` is intentionally NOT synced — the ERP owns it.
 *
 * Auth: staff session (admin button) OR Bearer CRON_SECRET (Apps Script timer).
 */

// Minimal CSV parser (quotes, escaped quotes, newlines in cells).
function parseCsv(text: string): string[][] {
  const rows: string[][] = []
  let row: string[] = []
  let cell = ''
  let inQuotes = false
  for (let i = 0; i < text.length; i++) {
    const c = text[i]
    if (inQuotes) {
      if (c === '"') {
        if (text[i + 1] === '"') { cell += '"'; i++ } else inQuotes = false
      } else cell += c
    } else if (c === '"') inQuotes = true
    else if (c === ',') { row.push(cell); cell = '' }
    else if (c === '\n' || c === '\r') {
      if (c === '\r' && text[i + 1] === '\n') i++
      row.push(cell); cell = ''
      if (row.some((x) => x.trim() !== '')) rows.push(row)
      row = []
    } else cell += c
  }
  row.push(cell)
  if (row.some((x) => x.trim() !== '')) rows.push(row)
  return rows
}

const SPEC_COLS: Record<string, string> = {
  cpu: 'CPU', ram: 'RAM', storage: 'Storage', vga: 'VGA',
  screen: 'Screen', os: 'OS', warranty: 'Warranty',
}

function slugify(name: string): string {
  return name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '').slice(0, 90)
}

const truthy = (s: string) => ['true', 'yes', '1', 'y'].includes(s.trim().toLowerCase())

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type AnyClient = SupabaseClient<any, any, any>

export async function POST(req: Request) {
  if (!isSupabaseConfigured()) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  // Auth: Apps Script secret, or a logged-in staff session.
  let supabase: AnyClient
  const auth = req.headers.get('authorization')
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL!
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (process.env.CRON_SECRET && auth === `Bearer ${process.env.CRON_SECRET}`) {
    if (!serviceKey) return NextResponse.json({ error: 'service key missing' }, { status: 500 })
    supabase = createServiceClient(url, serviceKey, { auth: { persistSession: false } })
  } else {
    const session = await createClient()
    const { data: { user } } = await session.auth.getUser()
    if (!user) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
    supabase = session as unknown as AnyClient
  }

  const csvUrl = process.env.SHEET_CSV_URL
  if (!csvUrl) return NextResponse.json({ notConfigured: true, error: 'Set SHEET_CSV_URL in Vercel env (the sheet’s publish-to-web CSV link).' }, { status: 200 })

  let csvText: string
  try {
    const res = await fetch(csvUrl, { cache: 'no-store', signal: AbortSignal.timeout(20000) })
    if (!res.ok) throw new Error(`HTTP ${res.status}`)
    csvText = await res.text()
  } catch (e) {
    return NextResponse.json({ error: `Could not fetch the sheet CSV: ${e instanceof Error ? e.message : e}` }, { status: 502 })
  }

  const rows = parseCsv(csvText)
  if (rows.length < 2) return NextResponse.json({ error: 'Sheet is empty (needs a header row + data rows).' }, { status: 400 })
  const header = rows[0].map((h) => h.trim().toLowerCase())
  const col = (row: string[], name: string): string | undefined => {
    const i = header.indexOf(name)
    return i >= 0 ? (row[i] ?? '').trim() : undefined
  }
  if (!header.includes('name')) return NextResponse.json({ error: 'Sheet must have a "name" column.' }, { status: 400 })

  // Reference data
  const [{ data: prodData }, { data: catData }, { data: tagData }] = await Promise.all([
    supabase.from('products').select('id, slug'),
    supabase.from('categories').select('id, slug, name'),
    supabase.from('tags').select('id, name, slug, type'),
  ])
  const bySlug = new Map(((prodData as { id: string; slug: string }[]) ?? []).map((p) => [p.slug, p.id]))
  const cats = (catData as { id: string; slug: string; name: string }[]) ?? []
  const findCat = (v: string) => cats.find((c) => c.slug === v.toLowerCase() || c.name.toLowerCase() === v.toLowerCase())?.id ?? null
  const brandTags = new Map(
    (((tagData as { id: string; name: string; type: string }[]) ?? []).filter((t) => t.type === 'brand')).map((t) => [t.name.toLowerCase(), t.id])
  )
  const brandTagIds = new Set(brandTags.values())

  let updated = 0, created = 0, skipped = 0
  const warnings: string[] = []

  for (const row of rows.slice(1)) {
    const name = col(row, 'name')
    if (!name) { skipped++; continue }
    let slug = (col(row, 'slug') ?? '').toLowerCase()

    // Build the field payload from present columns only.
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const fields: Record<string, any> = { name }
    const category = col(row, 'category')
    if (category !== undefined && category !== '') {
      const catId = findCat(category)
      if (catId) fields.primary_category_id = catId
      else if (!warnings.includes(`unknown category "${category}"`)) warnings.push(`unknown category "${category}"`)
    }
    const num = (v: string | undefined) => (v === undefined || v === '' ? undefined : Number(v.replace(/[$,\s]/g, '')) || 0)
    const price = num(col(row, 'price')); if (price !== undefined) fields.price = price
    const cap = num(col(row, 'compare_at_price')); if (cap !== undefined) fields.compare_at_price = cap > 0 ? cap : null
    const cost = num(col(row, 'cost')); if (cost !== undefined) fields.cost = cost
    const vat = num(col(row, 'vat_rate')); if (vat !== undefined) fields.vat_rate = vat
    const desc = col(row, 'description'); if (desc !== undefined && desc !== '') fields.description = desc
    const active = col(row, 'active'); if (active !== undefined && active !== '') fields.is_active = truthy(active)
    const featured = col(row, 'featured'); if (featured !== undefined && featured !== '') fields.is_featured = truthy(featured)
    const sku = col(row, 'sku'); if (sku !== undefined) fields.sku = sku || null
    const colors = col(row, 'colors')
    if (colors !== undefined) fields.colors = colors ? colors.split(',').map((c) => c.trim()).filter(Boolean) : []
    const image = col(row, 'image_url')
    if (image) fields.images = [image] // blank keeps existing images

    // Specs from individual columns (only when at least one spec column exists)
    if (Object.keys(SPEC_COLS).some((k) => header.includes(k))) {
      const specs: Record<string, string> = {}
      for (const [colName, key] of Object.entries(SPEC_COLS)) {
        const v = col(row, colName)
        if (v) specs[key] = v
      }
      fields.specs = specs
    }

    let productId = slug ? bySlug.get(slug) : undefined
    if (productId) {
      const { error } = await supabase.from('products').update(fields).eq('id', productId)
      if (error) { warnings.push(`update failed for ${slug}: ${error.message}`.slice(0, 120)); skipped++; continue }
      updated++
    } else {
      if (!slug) slug = slugify(name)
      let unique = slug, n = 2
      while (bySlug.has(unique)) unique = `${slug}-${n++}`
      const { data: ins, error } = await supabase
        .from('products')
        .insert({ ...fields, slug: unique, stock: 0, is_active: fields.is_active ?? true })
        .select('id')
        .single()
      if (error || !ins) { warnings.push(`create failed for "${name}": ${error?.message}`.slice(0, 120)); skipped++; continue }
      productId = (ins as { id: string }).id
      bySlug.set(unique, productId)
      created++
    }

    // Brand tag: replace any existing brand link with the sheet's brand.
    const brand = col(row, 'brand')
    if (brand) {
      let tagId = brandTags.get(brand.toLowerCase())
      if (!tagId) {
        const { data: newTag } = await supabase
          .from('tags')
          .insert({ name: brand, slug: slugify(brand), type: 'brand' })
          .select('id')
          .single()
        if (newTag) { tagId = (newTag as { id: string }).id; brandTags.set(brand.toLowerCase(), tagId); brandTagIds.add(tagId) }
      }
      if (tagId) {
        await supabase.from('product_tags').delete().eq('product_id', productId).in('tag_id', [...brandTagIds].filter((id) => id !== tagId))
        await supabase.from('product_tags').upsert({ product_id: productId, tag_id: tagId })
      }
    }
  }

  return NextResponse.json({ ok: true, updated, created, skipped, warnings: warnings.slice(0, 8) })
}
