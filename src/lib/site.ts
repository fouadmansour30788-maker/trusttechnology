/** Canonical site URL — set NEXT_PUBLIC_SITE_URL in production for correct SEO. */
export const SITE_URL = (
  process.env.NEXT_PUBLIC_SITE_URL ||
  (process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : 'http://localhost:3000')
).replace(/\/$/, '')

export const SITE_NAME = 'Trust Technology'
export const SITE_DESCRIPTION =
  'Tripoli’s premier tech store — premium laptops, desktops, POS systems, printers, monitors and accessories across Lebanon.'
