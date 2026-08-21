'use client'
import { useRouter, useSearchParams } from 'next/navigation'
import { ChevronDown, SlidersHorizontal, X } from 'lucide-react'
import { useEffect, useState } from 'react'
import type { Tag } from '@/lib/types'
import { SPEC_FACETS, parseSpecParam, specParamToString, type SpecFacetKey } from '@/lib/spec-facets'

type Props = {
  tags: Tag[]
  specFacetOptions?: Partial<Record<SpecFacetKey, { value: string; count: number }[]>>
}

type FilterSection = { label: string; type: string }

const SECTIONS: FilterSection[] = [
  { label: 'Brand', type: 'brand' },
  { label: 'Use Case', type: 'use_case' },
  { label: 'Type', type: 'type' },
]

export function FilterSidebar({ tags, specFacetOptions = {} }: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [expanded, setExpanded] = useState<Record<string, boolean>>({
    brand: true,
    use_case: true,
    type: true,
    cpu: true,
    vga: true,
    screen: true,
    storage: true,
  })

  const [mobileOpen, setMobileOpen] = useState(false)

  const selectedTags = searchParams.get('tags')?.split(',').filter(Boolean) ?? []
  const selectedSpecs = parseSpecParam(searchParams.get('specs') ?? undefined)
  const hasAnyFilter = selectedTags.length > 0 || Object.values(selectedSpecs).some((v) => v && v.length > 0)
  const activeCount = selectedTags.length + Object.values(selectedSpecs).reduce((n, v) => n + (v?.length ?? 0), 0)

  // Lock background scroll while the mobile drawer is open.
  useEffect(() => {
    if (!mobileOpen) return
    document.body.style.overflow = 'hidden'
    return () => { document.body.style.overflow = '' }
  }, [mobileOpen])

  function toggleTag(slug: string) {
    const next = selectedTags.includes(slug)
      ? selectedTags.filter((t) => t !== slug)
      : [...selectedTags, slug]
    const params = new URLSearchParams(searchParams.toString())
    if (next.length > 0) params.set('tags', next.join(','))
    else params.delete('tags')
    router.push(`?${params.toString()}`, { scroll: false })
  }

  function toggleSpec(key: SpecFacetKey, value: string) {
    const current = selectedSpecs[key] ?? []
    const next = current.includes(value) ? current.filter((v) => v !== value) : [...current, value]
    const updated = { ...selectedSpecs, [key]: next }
    const params = new URLSearchParams(searchParams.toString())
    const str = specParamToString(updated)
    if (str) params.set('specs', str)
    else params.delete('specs')
    router.push(`?${params.toString()}`, { scroll: false })
  }

  function clearAll() {
    const params = new URLSearchParams(searchParams.toString())
    params.delete('tags')
    params.delete('specs')
    router.push(`?${params.toString()}`, { scroll: false })
  }

  const groupedTags = Object.fromEntries(
    SECTIONS.map(({ type }) => [type, tags.filter((t) => t.type === type)])
  )

  const filterBody = (
    <>
        {SECTIONS.map(({ label, type }) => (
          <div key={type} className="bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm">
            <button
              onClick={() => setExpanded((p) => ({ ...p, [type]: !p[type] }))}
              className="w-full flex items-center justify-between px-4 py-3 text-sm text-slate-700 hover:text-slate-900"
            >
              <span className="font-medium">{label}</span>
              <ChevronDown
                size={14}
                className={`transition-transform text-slate-400 ${expanded[type] ? 'rotate-180' : ''}`}
              />
            </button>
            {expanded[type] && (
              <div className="px-4 pb-3 space-y-1.5">
                {groupedTags[type]?.map((tag) => (
                  <label key={tag.id} className="flex items-center gap-2 cursor-pointer group">
                    <input
                      type="checkbox"
                      checked={selectedTags.includes(tag.slug)}
                      onChange={() => toggleTag(tag.slug)}
                      className="w-3.5 h-3.5 rounded border-slate-300 bg-white text-blue-600 accent-blue-600"
                    />
                    <span className="text-sm text-slate-500 group-hover:text-slate-900 transition-colors">
                      {tag.name}
                    </span>
                  </label>
                ))}
                {groupedTags[type]?.length === 0 && (
                  <p className="text-xs text-slate-400">None available</p>
                )}
              </div>
            )}
          </div>
        ))}

        {/* Spec-based filters (CPU, Graphics, Screen size, Storage) — only shown when the
            current product list actually has that spec (e.g. hidden for accessories). */}
        {SPEC_FACETS.map(({ key, label }) => {
          const options = specFacetOptions[key]
          if (!options || options.length === 0) return null
          const selected = selectedSpecs[key] ?? []
          return (
            <div key={key} className="bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm">
              <button
                onClick={() => setExpanded((p) => ({ ...p, [key]: !p[key] }))}
                className="w-full flex items-center justify-between px-4 py-3 text-sm text-slate-700 hover:text-slate-900"
              >
                <span className="font-medium">{label}</span>
                <ChevronDown size={14} className={`transition-transform text-slate-400 ${expanded[key] ? 'rotate-180' : ''}`} />
              </button>
              {expanded[key] && (
                <div className="px-4 pb-3 space-y-1.5">
                  {options.map(({ value, count }) => (
                    <label key={value} className="flex items-center gap-2 cursor-pointer group">
                      <input
                        type="checkbox"
                        checked={selected.includes(value)}
                        onChange={() => toggleSpec(key, value)}
                        className="w-3.5 h-3.5 rounded border-slate-300 bg-white text-blue-600 accent-blue-600"
                      />
                      <span className="text-sm text-slate-500 group-hover:text-slate-900 transition-colors flex-1">
                        {value}
                      </span>
                      <span className="text-xs text-slate-300">{count}</span>
                    </label>
                  ))}
                </div>
              )}
            </div>
          )
        })}

        {/* Sort */}
        <div className="bg-white border border-slate-200 rounded-xl overflow-hidden mt-2 shadow-sm">
          <div className="px-4 py-3">
            <p className="text-sm font-medium text-slate-700 mb-2">Sort by</p>
            <select
              value={searchParams.get('sort') ?? 'featured'}
              onChange={(e) => {
                const params = new URLSearchParams(searchParams.toString())
                params.set('sort', e.target.value)
                router.push(`?${params.toString()}`, { scroll: false })
              }}
              className="w-full bg-slate-50 border border-slate-200 rounded-lg px-2 py-1.5 text-sm text-slate-900 outline-none focus:border-blue-400"
            >
              <option value="featured">Featured</option>
              <option value="price_asc">Price: Low to High</option>
              <option value="price_desc">Price: High to Low</option>
              <option value="newest">Newest</option>
            </select>
          </div>
        </div>
    </>
  )

  return (
    <>
      {/* Mobile trigger — replaces the sidebar below md, opens a slide-in drawer */}
      <button
        onClick={() => setMobileOpen(true)}
        className="md:hidden w-full flex items-center justify-between gap-2 bg-white border border-slate-200 rounded-xl px-4 py-3 shadow-sm mb-4"
      >
        <span className="flex items-center gap-2 text-sm font-semibold text-slate-900">
          <SlidersHorizontal size={16} className="text-slate-500" />
          Filters &amp; Sort
          {activeCount > 0 && (
            <span className="inline-flex items-center justify-center min-w-[20px] h-5 px-1 rounded-full bg-blue-600 text-white text-xs font-bold">
              {activeCount}
            </span>
          )}
        </span>
        <ChevronDown size={16} className="text-slate-400 -rotate-90" />
      </button>

      {/* Desktop sidebar */}
      <aside className="hidden md:block w-56 shrink-0">
        <div className="sticky top-20 space-y-1">
          <div className="flex items-center justify-between mb-4">
            <span className="text-sm font-semibold text-slate-900">Filters</span>
            {hasAnyFilter && (
              <button onClick={clearAll} className="text-xs text-blue-600 hover:text-blue-700">
                Clear all
              </button>
            )}
          </div>
          {filterBody}
        </div>
      </aside>

      {/* Mobile drawer */}
      {mobileOpen && (
        <div className="md:hidden fixed inset-0 z-50">
          <div className="absolute inset-0 bg-black/40" onClick={() => setMobileOpen(false)} />
          <div className="absolute right-0 top-0 h-full w-[85%] max-w-sm bg-white shadow-2xl flex flex-col">
            <div className="flex items-center justify-between px-4 py-4 border-b border-slate-200 shrink-0">
              <span className="text-sm font-semibold text-slate-900">Filters &amp; Sort</span>
              <div className="flex items-center gap-3">
                {hasAnyFilter && (
                  <button onClick={clearAll} className="text-xs text-blue-600 hover:text-blue-700">
                    Clear all
                  </button>
                )}
                <button onClick={() => setMobileOpen(false)} className="p-1.5 -mr-1.5 text-slate-500 hover:text-slate-900" aria-label="Close filters">
                  <X size={20} />
                </button>
              </div>
            </div>
            <div className="flex-1 overflow-y-auto px-4 py-4 space-y-1">{filterBody}</div>
            <div className="p-4 border-t border-slate-200 shrink-0">
              <button
                onClick={() => setMobileOpen(false)}
                className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-xl transition-colors"
              >
                Show results
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  )
}
