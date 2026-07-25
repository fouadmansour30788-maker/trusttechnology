import 'server-only'

/**
 * Google Trends has no official public API — this uses the same unofficial
 * endpoints community libraries (e.g. `google-trends-api`) rely on: fetch
 * the site for cookies, call /explore for a widget token, then
 * /widgetdata/multiline for the actual weekly interest-over-time series.
 * Verified working for geo=LB 2026-07; Google may change/rate-limit this
 * without notice, so every step retries with backoff and callers must
 * treat failures as "skip this keyword," never as fatal.
 *
 * Each request asks about exactly ONE keyword. Google self-scales results
 * within a single request (peak week = 100) — comparing scores ACROSS
 * separate requests would be misleading, so we only report each keyword's
 * own week-over-week direction, never a cross-keyword ranking.
 */

const UA = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36'
const GEO = 'LB'

/** Tech categories relevant to a Lebanese computer store. */
export const TRENDING_KEYWORDS = [
  'laptop', 'gaming laptop', 'iphone', 'macbook', 'monitor',
  'graphics card', 'printer', 'pos system',
]

type CookieJar = Map<string, string>

function parseSetCookies(headers: Headers): CookieJar {
  const jar: CookieJar = new Map()
  const raw = (headers as unknown as { getSetCookie?: () => string[] }).getSetCookie?.() ?? []
  for (const line of raw) {
    const [pair] = line.split(';')
    const idx = pair.indexOf('=')
    if (idx > 0) jar.set(pair.slice(0, idx).trim(), pair.slice(idx + 1).trim())
  }
  return jar
}

function cookieHeader(jar: CookieJar): string {
  return [...jar.entries()].map(([k, v]) => `${k}=${v}`).join('; ')
}

async function withRetry<T>(fn: () => Promise<T>, attempts = 3): Promise<T> {
  let lastErr: unknown
  for (let i = 0; i < attempts; i++) {
    try {
      return await fn()
    } catch (e) {
      lastErr = e
      if (i < attempts - 1) await new Promise((r) => setTimeout(r, 1200 * (i + 1)))
    }
  }
  throw lastErr
}

async function getCookies(): Promise<CookieJar> {
  const res = await fetch(`https://trends.google.com/?geo=${GEO}`, {
    headers: { 'User-Agent': UA },
    signal: AbortSignal.timeout(15000),
    cache: 'no-store',
  })
  return parseSetCookies(res.headers)
}

/** One keyword's last two weekly interest scores (0-100, self-scaled), or null if it couldn't be fetched. */
export async function fetchKeywordTrend(keyword: string): Promise<{ keyword: string; score: number; prevScore: number | null } | null> {
  try {
    return await withRetry(async () => {
      const jar = await getCookies()
      const exploreReq = JSON.stringify({
        comparisonItem: [{ keyword, geo: GEO, time: 'today 3-m' }],
        category: 0,
        property: '',
      })
      const exploreRes = await fetch(
        `https://trends.google.com/trends/api/explore?hl=en-US&tz=-180&req=${encodeURIComponent(exploreReq)}`,
        { headers: { 'User-Agent': UA, Cookie: cookieHeader(jar) }, signal: AbortSignal.timeout(15000), cache: 'no-store' }
      )
      if (!exploreRes.ok) throw new Error(`explore HTTP ${exploreRes.status}`)
      for (const [k, v] of parseSetCookies(exploreRes.headers)) jar.set(k, v)
      const exploreText = await exploreRes.text()
      const exploreJson = JSON.parse(exploreText.split('\n').slice(1).join('\n'))
      const widget = (exploreJson.widgets as { id: string; token: string; request: unknown }[]).find((w) => w.id === 'TIMESERIES')
      if (!widget) throw new Error('no TIMESERIES widget')

      await new Promise((r) => setTimeout(r, 600)) // don't hammer immediately after explore

      const dataRes = await fetch(
        `https://trends.google.com/trends/api/widgetdata/multiline?hl=en-US&tz=-180&req=${encodeURIComponent(JSON.stringify(widget.request))}&token=${widget.token}`,
        { headers: { 'User-Agent': UA, Cookie: cookieHeader(jar) }, signal: AbortSignal.timeout(15000), cache: 'no-store' }
      )
      if (!dataRes.ok) throw new Error(`widgetdata HTTP ${dataRes.status}`)
      const dataText = await dataRes.text()
      const dataJson = JSON.parse(dataText.split('\n').slice(1).join('\n'))
      type Point = { value: number[] }
      const points = (dataJson.default.timelineData as Point[]).map((p) => p.value[0])
      if (points.length === 0) throw new Error('empty timeline')

      const score = points[points.length - 1]
      const prevScore = points.length >= 2 ? points[points.length - 2] : null
      return { keyword, score, prevScore }
    })
  } catch (e) {
    console.error(`[google-trends] "${keyword}" failed: ${e instanceof Error ? e.message : e}`)
    return null
  }
}

/** Fetch every curated keyword sequentially (politely spaced) within a time budget. */
export async function fetchAllTrends(deadline = Date.now() + 45_000): Promise<{ keyword: string; score: number; prevScore: number | null }[]> {
  const out: { keyword: string; score: number; prevScore: number | null }[] = []
  for (const keyword of TRENDING_KEYWORDS) {
    if (Date.now() > deadline) break
    const result = await fetchKeywordTrend(keyword)
    if (result) out.push(result)
    await new Promise((r) => setTimeout(r, 800))
  }
  return out
}
