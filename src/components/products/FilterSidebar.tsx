'use client'
import { useRouter, useSearchParams } from 'next/navigation'
import { ChevronDown } from 'lucide-react'
import { useState } from 'react'
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

  const selectedTags = searchParams.get('tags')?.split(',').filter(Boolean) ?? []
  const selectedSpecs = parseSpecParam(searchParams.get('specs') ?? undefined)
  const hasAnyFilter = selectedTags.length > 0 || Object.values(selectedSpecs).some((v) => v && v.length > 0)

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

  return (
    <aside className="w-56 shrink-0">
      <div className="sticky top-20 space-y-1">
        <div className="flex items-center justify-between mb-4">
          <span className="text-sm font-semibold text-slate-900">Filters</span>
          {hasAnyFilter && (
            <button onClick={clearAll} className="text-xs text-blue-600 hover:text-blue-700">
              Clear all
            </button>
          )}
        </div>

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
      </div>
    </aside>
  )
}
