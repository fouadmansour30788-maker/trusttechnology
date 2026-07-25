import type { Product } from '@/lib/types'

/**
 * Spec-based filter facets (CPU, Graphics, Screen size, Storage). The
 * catalog's spec values are free-text strings from manufacturer sheets
 * ("NVIDIA® GeForce RTX™ 5060 8GB GDDR7, Boost Clock 2497MHz, TGP 100W..."),
 * not clean categories — each facet has an `extract` heuristic that buckets
 * the raw string into a shopper-facing value. A product that doesn't parse
 * cleanly is just omitted from that one facet (it stays fully browsable,
 * only absent from that specific filter) rather than shown wrong.
 */

function firstSpec(specs: Record<string, string> | undefined, keys: string[]): string | null {
  if (!specs) return null
  for (const k of keys) {
    if (specs[k]) return specs[k]
  }
  return null
}

/** Strip trademark/registered/copyright marks so "Core™ Ultra" still matches "core ultra". */
function clean(raw: string): string {
  return raw.toLowerCase().replace(/[™®©]/g, '')
}

function cpuFamily(raw: string): string | null {
  const s = clean(raw)
  if (/core\s*ultra\s*9/.test(s)) return 'Core Ultra 9'
  if (/core\s*ultra\s*7/.test(s)) return 'Core Ultra 7'
  if (/core\s*ultra\s*5/.test(s)) return 'Core Ultra 5'
  if (/core\s*ultra\s*3/.test(s)) return 'Core Ultra 3'
  if (/\bi9\b|core\s*i9/.test(s)) return 'Core i9'
  if (/\bi7\b|core\s*i7/.test(s)) return 'Core i7'
  if (/\bi5\b|core\s*i5/.test(s)) return 'Core i5'
  if (/\bi3\b|core\s*i3/.test(s)) return 'Core i3'
  if (/ryzen\s*9/.test(s)) return 'Ryzen 9'
  if (/ryzen\s*7/.test(s)) return 'Ryzen 7'
  if (/ryzen\s*5/.test(s)) return 'Ryzen 5'
  if (/ryzen\s*3/.test(s)) return 'Ryzen 3'
  if (/\bcore\s*9\b/.test(s)) return 'Core 9'
  if (/\bcore\s*7\b/.test(s)) return 'Core 7'
  if (/\bcore\s*5\b/.test(s)) return 'Core 5'
  if (/snapdragon/.test(s)) return 'Snapdragon (ARM)'
  if (/celeron/.test(s)) return 'Celeron'
  if (/pentium/.test(s)) return 'Pentium'
  if (/athlon/.test(s)) return 'Athlon'
  if (/\bn\d{3,4}\b/.test(s)) return 'Intel N-series'
  if (/apple\s*m\d/.test(s)) return 'Apple M-series'
  if (/apple\s*a\d/.test(s)) return 'Apple A-series'
  return null
}

function vgaFamily(raw: string): string | null {
  const s = clean(raw)
  if (/nvidia|geforce|\brtx\b|\bgtx\b|\bmx\d{3}\b/.test(s)) return 'NVIDIA (Dedicated)'
  if (/radeon/.test(s) && /\d{3}m\b|\brx\s?\d/.test(s)) return 'AMD Radeon (Dedicated)'
  if (/radeon/.test(s)) return 'AMD Radeon (Integrated)'
  if (/adreno|qualcomm/.test(s)) return 'Qualcomm Adreno'
  if (/iris|intel/.test(s)) return 'Intel (Integrated)'
  if (/apple|\d+[\s-]core gpu/.test(s)) return 'Apple GPU (Integrated)'
  return null
}

function screenSize(raw: string): string | null {
  const m = raw.match(/(\d{1,2}(?:\.\d)?)\s*[″"'']/) ?? raw.match(/^(\d{1,2}(?:\.\d)?)/)
  if (!m) return null
  const inches = parseFloat(m[1])
  if (inches < 9 || inches > 40) return null
  return `${inches}″`
}

function storageCapacity(raw: string): string | null {
  const stripped = raw.replace(/\([^)]*\)/g, '') // drop M.2 form-factor codes like "(2242)"
  const m = stripped.match(/(\d+(?:\.\d)?)\s*(TB|GB|TERRA)?/i)
  if (!m) return null
  const num = parseFloat(m[1])
  const unit = (m[2] ?? 'GB').toUpperCase()
  const gb = unit === 'TB' || unit === 'TERRA' ? num * 1000 : num
  if (gb < 32) return null // below any real drive size in this catalog — avoid false positives
  return gb >= 1000 ? `${Math.round(gb / 1000)}TB` : `${Math.round(gb)}GB`
}

export type SpecFacetKey = 'cpu' | 'vga' | 'screen' | 'storage'

export const SPEC_FACETS: { key: SpecFacetKey; label: string; specKeys: string[]; extract: (raw: string) => string | null; order?: string[] }[] = [
  { key: 'cpu', label: 'CPU', specKeys: ['CPU'], extract: cpuFamily,
    order: ['Apple M-series', 'Apple A-series', 'Core Ultra 9', 'Core Ultra 7', 'Core Ultra 5', 'Core Ultra 3', 'Core i9', 'Core i7', 'Core i5', 'Core i3', 'Core 9', 'Core 7', 'Core 5', 'Ryzen 9', 'Ryzen 7', 'Ryzen 5', 'Ryzen 3', 'Snapdragon (ARM)', 'Intel N-series', 'Celeron', 'Pentium', 'Athlon'] },
  { key: 'vga', label: 'Graphics', specKeys: ['VGA', 'Graphics'], extract: vgaFamily,
    order: ['NVIDIA (Dedicated)', 'AMD Radeon (Dedicated)', 'AMD Radeon (Integrated)', 'Intel (Integrated)', 'Apple GPU (Integrated)', 'Qualcomm Adreno'] },
  { key: 'screen', label: 'Screen Size', specKeys: ['Screen', 'Resolution'], extract: screenSize },
  { key: 'storage', label: 'Storage', specKeys: ['Storage', 'Hard Disk'], extract: storageCapacity },
]

/** The bucketed facet value for one product, or null if it doesn't apply/parse. */
export function facetValue(product: Product, facetKey: SpecFacetKey): string | null {
  const facet = SPEC_FACETS.find((f) => f.key === facetKey)
  if (!facet) return null
  const raw = firstSpec(product.specs, facet.specKeys)
  return raw ? facet.extract(raw) : null
}

/** Distinct values present in a product list, ordered sensibly (by rank list, else count desc). */
export function facetOptions(products: Product[], facetKey: SpecFacetKey): { value: string; count: number }[] {
  const facet = SPEC_FACETS.find((f) => f.key === facetKey)
  const counts = new Map<string, number>()
  for (const p of products) {
    const v = facetValue(p, facetKey)
    if (v) counts.set(v, (counts.get(v) ?? 0) + 1)
  }
  const entries = [...counts.entries()].map(([value, count]) => ({ value, count }))
  if (facet?.order) {
    const rank = new Map(facet.order.map((v, i) => [v, i]))
    entries.sort((a, b) => (rank.get(a.value) ?? 99) - (rank.get(b.value) ?? 99))
  } else {
    entries.sort((a, b) => {
      // Numeric-looking values (screen sizes, storage) sort ascending by number.
      const na = parseFloat(a.value), nb = parseFloat(b.value)
      if (!Number.isNaN(na) && !Number.isNaN(nb) && na !== nb) return na - nb
      return b.count - a.count
    })
  }
  return entries
}

/** Parse the `specs` URL param: "cpu:Core i7,storage:512GB" → { cpu: ['Core i7'], storage: ['512GB'] }. */
export function parseSpecParam(param: string | undefined): Partial<Record<SpecFacetKey, string[]>> {
  const out: Partial<Record<SpecFacetKey, string[]>> = {}
  if (!param) return out
  for (const token of param.split(',')) {
    const idx = token.indexOf(':')
    if (idx < 0) continue
    const key = token.slice(0, idx) as SpecFacetKey
    const value = decodeURIComponent(token.slice(idx + 1))
    if (!SPEC_FACETS.some((f) => f.key === key)) continue
    out[key] = [...(out[key] ?? []), value]
  }
  return out
}

export function specParamToString(selected: Partial<Record<SpecFacetKey, string[]>>): string {
  const tokens: string[] = []
  for (const [key, values] of Object.entries(selected)) {
    for (const v of values ?? []) tokens.push(`${key}:${encodeURIComponent(v)}`)
  }
  return tokens.join(',')
}

/** True when a product matches every selected facet filter (AND across facets, OR within one). */
export function matchesSpecFilters(product: Product, selected: Partial<Record<SpecFacetKey, string[]>>): boolean {
  for (const [key, values] of Object.entries(selected)) {
    if (!values || values.length === 0) continue
    const v = facetValue(product, key as SpecFacetKey)
    if (!v || !values.includes(v)) return false
  }
  return true
}
