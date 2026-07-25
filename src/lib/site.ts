/** Canonical site URL — set NEXT_PUBLIC_SITE_URL in production for correct SEO. */
export const SITE_URL = (
  process.env.NEXT_PUBLIC_SITE_URL ||
  (process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : 'http://localhost:3000')
).replace(/\/$/, '')

export const SITE_NAME = 'Trust Technology'
export const FOUNDED_YEAR = 2006
/** Computed, not hardcoded, so copy never goes stale as years pass. */
export const YEARS_IN_BUSINESS = new Date().getFullYear() - FOUNDED_YEAR
export const SITE_DESCRIPTION =
  `Tripoli’s premier tech store — ${YEARS_IN_BUSINESS} years of experience in premium laptops, desktops, POS systems, printers, monitors and accessories across Lebanon.`
