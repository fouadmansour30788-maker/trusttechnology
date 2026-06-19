'use client'
import { useState } from 'react'
import { Save, ArrowLeft, Plus, X } from 'lucide-react'
import Link from 'next/link'
import { Button } from '@/components/ui/button'

const ALL_TAGS = [
  { id: 't1', name: 'Apple', slug: 'apple', type: 'brand' },
  { id: 't2', name: 'Dell', slug: 'dell', type: 'brand' },
  { id: 't3', name: 'HP', slug: 'hp', type: 'brand' },
  { id: 't4', name: 'Lenovo', slug: 'lenovo', type: 'brand' },
  { id: 't5', name: 'Gaming', slug: 'gaming', type: 'use_case' },
  { id: 't6', name: 'Business', slug: 'business', type: 'use_case' },
  { id: 't7', name: 'Student', slug: 'student', type: 'use_case' },
  { id: 't8', name: 'Laptop', slug: 'laptop', type: 'type' },
  { id: 't9', name: 'Desktop', slug: 'desktop', type: 'type' },
  { id: 't10', name: 'Printer', slug: 'printer', type: 'type' },
]

export default function ProductFormPage() {
  const [form, setForm] = useState({
    name: '',
    sku: '',
    price: '',
    compare_at_price: '',
    stock: '',
    description: '',
    primary_category: '',
    is_active: true,
    is_featured: false,
  })
  const [selectedTags, setSelectedTags] = useState<string[]>([])
  const [specs, setSpecs] = useState<{ key: string; value: string }[]>([])

  function toggleTag(id: string) {
    setSelectedTags((prev) => prev.includes(id) ? prev.filter((t) => t !== id) : [...prev, id])
  }

  function addSpec() {
    setSpecs((prev) => [...prev, { key: '', value: '' }])
  }

  function updateSpec(i: number, field: 'key' | 'value', val: string) {
    setSpecs((prev) => prev.map((s, idx) => idx === i ? { ...s, [field]: val } : s))
  }

  function removeSpec(i: number) {
    setSpecs((prev) => prev.filter((_, idx) => idx !== i))
  }

  const tagsByType = {
    brand: ALL_TAGS.filter((t) => t.type === 'brand'),
    use_case: ALL_TAGS.filter((t) => t.type === 'use_case'),
    type: ALL_TAGS.filter((t) => t.type === 'type'),
  }

  return (
    <div className="p-8 max-w-3xl">
      <div className="flex items-center gap-4 mb-8">
        <Link href="/admin/products" className="p-2 text-zinc-400 hover:text-white hover:bg-zinc-800 rounded-lg transition-colors">
          <ArrowLeft size={18} />
        </Link>
        <div>
          <h1 className="text-2xl font-bold text-white">New Product</h1>
          <p className="text-zinc-500 text-sm">Fill in the details below</p>
        </div>
      </div>

      <div className="space-y-6">
        {/* Basic Info */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6 space-y-4">
          <h2 className="font-semibold text-white">Basic Information</h2>
          <div>
            <label className="block text-sm text-zinc-400 mb-1.5">Product Name *</label>
            <input
              value={form.name}
              onChange={(e) => setForm({ ...form, name: e.target.value })}
              placeholder="e.g. Dell Latitude 5540 Business Laptop"
              className="w-full bg-zinc-800 border border-zinc-700 rounded-xl px-4 py-2.5 text-white placeholder-zinc-600 outline-none focus:border-blue-500 transition-colors text-sm"
            />
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm text-zinc-400 mb-1.5">SKU</label>
              <input
                value={form.sku}
                onChange={(e) => setForm({ ...form, sku: e.target.value })}
                placeholder="e.g. DELL-5540-I7"
                className="w-full bg-zinc-800 border border-zinc-700 rounded-xl px-4 py-2.5 text-white placeholder-zinc-600 outline-none focus:border-blue-500 transition-colors text-sm"
              />
            </div>
            <div>
              <label className="block text-sm text-zinc-400 mb-1.5">Stock</label>
              <input
                type="number"
                value={form.stock}
                onChange={(e) => setForm({ ...form, stock: e.target.value })}
                placeholder="0"
                className="w-full bg-zinc-800 border border-zinc-700 rounded-xl px-4 py-2.5 text-white placeholder-zinc-600 outline-none focus:border-blue-500 transition-colors text-sm"
              />
            </div>
          </div>
          <div>
            <label className="block text-sm text-zinc-400 mb-1.5">Description</label>
            <textarea
              value={form.description}
              onChange={(e) => setForm({ ...form, description: e.target.value })}
              rows={3}
              placeholder="Product description..."
              className="w-full bg-zinc-800 border border-zinc-700 rounded-xl px-4 py-2.5 text-white placeholder-zinc-600 outline-none focus:border-blue-500 transition-colors text-sm resize-none"
            />
          </div>
        </div>

        {/* Pricing */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6 space-y-4">
          <h2 className="font-semibold text-white">Pricing</h2>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm text-zinc-400 mb-1.5">Price (USD) *</label>
              <input
                type="number"
                value={form.price}
                onChange={(e) => setForm({ ...form, price: e.target.value })}
                placeholder="0.00"
                className="w-full bg-zinc-800 border border-zinc-700 rounded-xl px-4 py-2.5 text-white placeholder-zinc-600 outline-none focus:border-blue-500 transition-colors text-sm"
              />
            </div>
            <div>
              <label className="block text-sm text-zinc-400 mb-1.5">Compare-at Price</label>
              <input
                type="number"
                value={form.compare_at_price}
                onChange={(e) => setForm({ ...form, compare_at_price: e.target.value })}
                placeholder="Original price (optional)"
                className="w-full bg-zinc-800 border border-zinc-700 rounded-xl px-4 py-2.5 text-white placeholder-zinc-600 outline-none focus:border-blue-500 transition-colors text-sm"
              />
            </div>
          </div>
        </div>

        {/* Tags */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6 space-y-4">
          <h2 className="font-semibold text-white">Tags & Classification</h2>
          {(['brand', 'use_case', 'type'] as const).map((type) => (
            <div key={type}>
              <p className="text-xs uppercase tracking-widest text-zinc-500 mb-2">
                {type === 'use_case' ? 'Use Case' : type.charAt(0).toUpperCase() + type.slice(1)}
              </p>
              <div className="flex flex-wrap gap-2">
                {tagsByType[type].map((tag) => (
                  <button
                    key={tag.id}
                    onClick={() => toggleTag(tag.id)}
                    className={`px-3 py-1 rounded-lg text-sm border transition-colors ${
                      selectedTags.includes(tag.id)
                        ? 'bg-blue-600/20 border-blue-500 text-blue-400'
                        : 'bg-zinc-800 border-zinc-700 text-zinc-400 hover:border-zinc-500 hover:text-white'
                    }`}
                  >
                    {tag.name}
                  </button>
                ))}
              </div>
            </div>
          ))}
        </div>

        {/* Specs */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6 space-y-4">
          <div className="flex items-center justify-between">
            <h2 className="font-semibold text-white">Specifications</h2>
            <button
              onClick={addSpec}
              className="flex items-center gap-1 text-sm text-blue-400 hover:text-blue-300 transition-colors"
            >
              <Plus size={14} /> Add Row
            </button>
          </div>
          {specs.length === 0 && (
            <p className="text-zinc-600 text-sm">No specs added. Click &quot;Add Row&quot; to start.</p>
          )}
          <div className="space-y-2">
            {specs.map((spec, i) => (
              <div key={i} className="flex gap-2 items-center">
                <input
                  value={spec.key}
                  onChange={(e) => updateSpec(i, 'key', e.target.value)}
                  placeholder="e.g. Processor"
                  className="flex-1 bg-zinc-800 border border-zinc-700 rounded-lg px-3 py-2 text-white placeholder-zinc-600 text-sm outline-none focus:border-blue-500"
                />
                <input
                  value={spec.value}
                  onChange={(e) => updateSpec(i, 'value', e.target.value)}
                  placeholder="e.g. Intel Core i7"
                  className="flex-1 bg-zinc-800 border border-zinc-700 rounded-lg px-3 py-2 text-white placeholder-zinc-600 text-sm outline-none focus:border-blue-500"
                />
                <button onClick={() => removeSpec(i)} className="p-2 text-zinc-600 hover:text-red-400 transition-colors">
                  <X size={14} />
                </button>
              </div>
            ))}
          </div>
        </div>

        {/* Visibility */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6">
          <h2 className="font-semibold text-white mb-4">Visibility</h2>
          <div className="space-y-3">
            {[
              { key: 'is_active', label: 'Active (visible in store)' },
              { key: 'is_featured', label: 'Featured on homepage' },
            ].map(({ key, label }) => (
              <label key={key} className="flex items-center gap-3 cursor-pointer">
                <input
                  type="checkbox"
                  checked={form[key as 'is_active' | 'is_featured']}
                  onChange={(e) => setForm({ ...form, [key]: e.target.checked })}
                  className="w-4 h-4 rounded border-zinc-600 bg-zinc-800 accent-blue-600"
                />
                <span className="text-sm text-zinc-300">{label}</span>
              </label>
            ))}
          </div>
        </div>

        {/* Submit */}
        <div className="flex items-center gap-3 justify-end">
          <Link href="/admin/products">
            <Button variant="ghost">Cancel</Button>
          </Link>
          <Button>
            <Save size={16} /> Save Product
          </Button>
        </div>
      </div>
    </div>
  )
}
