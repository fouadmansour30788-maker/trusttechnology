// The real production domain, used as a safety net below — NOT as the
// primary source of truth. Set NEXT_PUBLIC_SITE_URL in Vercel (Production
// environment) as the actual source of truth; this constant only prevents
// a missing env var from silently leaking the *.vercel.app deployment URL
// into canonical/OG/sitemap/robots output again, as it did previously.
const PRODUCTION_URL = 'https://www.trusttechnologylb.com'

/** Canonical site URL for metadata, canonical tags, sitemap and robots.txt. */
export const SITE_URL = (
  process.env.NEXT_PUBLIC_SITE_URL ||
  (process.env.VERCEL_ENV === 'production' ? PRODUCTION_URL : null) ||
  (process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : null) ||
  'http://localhost:3000'
).replace(/\/$/, '')

/** Absolute canonical URL for a given path, e.g. canonicalFor('/warranty'). */
export function canonicalFor(path: string): string {
  return `${SITE_URL}${path.startsWith('/') ? path : `/${path}`}`
}

export const SITE_NAME = 'Trust Technology'
export const FOUNDED_YEAR = 2006
/** Computed, not hardcoded, so copy never goes stale as years pass. */
export const YEARS_IN_BUSINESS = new Date().getFullYear() - FOUNDED_YEAR
export const SITE_DESCRIPTION =
  `Tripoli’s premier tech store — ${YEARS_IN_BUSINESS} years of experience in premium laptops, desktops, POS systems, printers, monitors and accessories across Lebanon.`
