'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import Image from 'next/image'
import { Loader2, Plus, Trash2, Upload, X, ArrowLeft } from 'lucide-react'
import type { Product, Category, Tag } from '@/lib/types'
import { createClient } from '@/lib/supabase/client'
import { saveProduct, type ProductInput } from '@/app/admin/actions'

const slugify = (s: string) => s.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '').slice(0, 60)

type Props = { product: Product | null; categories: Category[]; tags: Tag[] }

export function ProductForm({ product, categories, tags }: Props) {
  const router = useRouter()
  const [saving, startSave] = useTransition()
  const [error, setError] = useState<string | null>(null)

  const [name, setName] = useState(product?.name ?? '')
  const [slug, setSlug] = useState(product?.slug ?? '')
  const [slugTouched, setSlugTouched] = useState(Boolean(product))
  const [description, setDescription] = useState(product?.description ?? '')
  const [onRequest, setOnRequest] = useState(product ? product.price === 0 : false)
  const [price, setPrice] = useState(product && product.price > 0 ? String(product.price) : '')
  const [compare, setCompare] = useState(product?.compare_at_price ? String(product.compare_at_price) : '')
  const [categoryId, setCategoryId] = useState(product?.primary_category_id ?? '')
  const [stock, setStock] = useState(String(product?.stock ?? 0))
  const [sku, setSku] = useState(product?.sku ?? '')
  const [isActive, setIsActive] = useState(product?.is_active ?? true)
  const [isFeatured, setIsFeatured] = useState(product?.is_featured ?? false)
  const [images, setImages] = useState<string[]>(product?.images ?? [])
  const [uploading, setUploading] = useState(false)
  const [specs, setSpecs] = useState<{ k: string; v: string }[]>(
    Object.entries(product?.specs ?? {}).map(([k, v]) => ({ k, v: String(v) }))
  )
  const [tagIds, setTagIds] = useState<string[]>(product?.tags?.map((t) => t.id) ?? [])

  function onName(v: string) {
    setName(v)
    if (!slugTouched) setSlug(slugify(v))
  }

  async function onUpload(files: FileList | null) {
    if (!files?.length) return
    setUploading(true)
    setError(null)
    try {
      const supabase = createClient()
      const urls: string[] = []
      for (const file of Array.from(files)) {
        const path = `${slug || slugify(name) || 'product'}/${Date.now()}-${file.name.replace(/[^a-zA-Z0-9.]/g, '-')}`
        const { error } = await supabase.storage.from('product-images').upload(path, file, { upsert: true })
        if (error) throw error
        const { data } = supabase.storage.from('product-images').getPublicUrl(path)
        urls.push(data.publicUrl)
      }
      setImages((prev) => [...prev, ...urls])
    } catch (e) {
      setError(e instanceof Error ? `Image upload failed: ${e.message}` : 'Image upload failed')
    } finally {
      setUploading(false)
    }
  }

  function submit(e: React.FormEvent) {
    e.preventDefault()
    setError(null)
    const input: ProductInput = {
      id: product?.id,
      name: name.trim(),
      slug: slug.trim() || slugify(name),
      description: description.trim() || null,
      price: onRequest ? 0 : Number(price) || 0,
      compare_at_price: compare ? Number(compare) : null,
      primary_category_id: categoryId || null,
      stock: onRequest ? 0 : Number(stock) || 0,
      sku: sku.trim() || null,
      is_active: isActive,
      is_featured: isFeatured,
      specs: Object.fromEntries(specs.filter((s) => s.k.trim()).map((s) => [s.k.trim(), s.v.trim()])),
      images,
      tagIds,
    }
    if (!input.name) { setError('Name is required.'); return }
    startSave(async () => {
      const res = await saveProduct(input)
      if (res.error) setError(res.error)
      else router.push('/admin/products')
    })
  }

  const inputCls = 'w-full px-3 py-2 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400'
  const label = 'block text-xs font-medium text-slate-500 mb-1'
  const brandTags = tags.filter((t) => t.type === 'brand')
  const otherTags = tags.filter((t) => t.type !== 'brand')

  return (
    <form onSubmit={submit} className="max-w-3xl">
      <button type="button" onClick={() => router.back()} className="inline-flex items-center gap-1 text-sm text-slate-500 hover:text-slate-900 mb-4">
        <ArrowLeft size={15} /> Back
      </button>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">{product ? 'Edit product' : 'New product'}</h1>

      <div className="space-y-6">
        {/* Basics */}
        <section className="bg-white border border-slate-200 rounded-2xl p-5 space-y-4">
          <div>
            <label className={label}>Name *</label>
            <input className={inputCls} value={name} onChange={(e) => onName(e.target.value)} required />
          </div>
          <div className="grid sm:grid-cols-2 gap-4">
            <div>
              <label className={label}>Slug</label>
              <input className={inputCls} value={slug} onChange={(e) => { setSlug(e.target.value); setSlugTouched(true) }} />
            </div>
            <div>
              <label className={label}>SKU</label>
              <input className={inputCls} value={sku} onChange={(e) => setSku(e.target.value)} />
            </div>
          </div>
          <div>
            <label className={label}>Description</label>
            <textarea className={inputCls + ' resize-y'} rows={2} value={description} onChange={(e) => setDescription(e.target.value)} />
          </div>
        </section>

        {/* Pricing & stock */}
        <section className="bg-white border border-slate-200 rounded-2xl p-5 space-y-4">
          <label className="flex items-center gap-2 text-sm text-slate-700">
            <input type="checkbox" checked={onRequest} onChange={(e) => setOnRequest(e.target.checked)} />
            Call for price (no public price; shows WhatsApp inquiry)
          </label>
          {!onRequest && (
            <div className="grid sm:grid-cols-3 gap-4">
              <div>
                <label className={label}>Price ($)</label>
                <input type="number" step="0.01" className={inputCls} value={price} onChange={(e) => setPrice(e.target.value)} />
              </div>
              <div>
                <label className={label}>Compare-at ($)</label>
                <input type="number" step="0.01" className={inputCls} value={compare} onChange={(e) => setCompare(e.target.value)} />
              </div>
              <div>
                <label className={label}>Stock</label>
                <input type="number" className={inputCls} value={stock} onChange={(e) => setStock(e.target.value)} />
              </div>
            </div>
          )}
          <div>
            <label className={label}>Category</label>
            <select className={inputCls} value={categoryId} onChange={(e) => setCategoryId(e.target.value)}>
              <option value="">— none —</option>
              {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
            </select>
          </div>
          <div className="flex gap-6">
            <label className="flex items-center gap-2 text-sm text-slate-700"><input type="checkbox" checked={isActive} onChange={(e) => setIsActive(e.target.checked)} /> Active (visible)</label>
            <label className="flex items-center gap-2 text-sm text-slate-700"><input type="checkbox" checked={isFeatured} onChange={(e) => setIsFeatured(e.target.checked)} /> Featured</label>
          </div>
        </section>

        {/* Images */}
        <section className="bg-white border border-slate-200 rounded-2xl p-5">
          <label className={label}>Images</label>
          <div className="flex flex-wrap gap-3 mt-1">
            {images.map((url) => (
              <div key={url} className="relative w-20 h-20 rounded-lg overflow-hidden border border-slate-200 group">
                <Image src={url} alt="" fill className="object-cover" sizes="80px" />
                <button type="button" onClick={() => setImages((p) => p.filter((u) => u !== url))} className="absolute top-0.5 right-0.5 w-5 h-5 rounded bg-black/60 text-white flex items-center justify-center opacity-0 group-hover:opacity-100">
                  <X size={12} />
                </button>
              </div>
            ))}
            <label className="w-20 h-20 rounded-lg border-2 border-dashed border-slate-200 flex flex-col items-center justify-center gap-1 text-slate-400 hover:border-blue-300 hover:text-blue-500 cursor-pointer text-[10px]">
              {uploading ? <Loader2 size={16} className="animate-spin" /> : <Upload size={16} />}
              {uploading ? 'Uploading' : 'Upload'}
              <input type="file" accept="image/*" multiple className="hidden" onChange={(e) => onUpload(e.target.files)} disabled={uploading} />
            </label>
          </div>
        </section>

        {/* Specs */}
        <section className="bg-white border border-slate-200 rounded-2xl p-5">
          <label className={label}>Specifications</label>
          <div className="space-y-2 mt-1">
            {specs.map((s, i) => (
              <div key={i} className="flex gap-2">
                <input className={inputCls + ' max-w-[180px]'} placeholder="CPU" value={s.k} onChange={(e) => setSpecs((p) => p.map((x, j) => j === i ? { ...x, k: e.target.value } : x))} />
                <input className={inputCls} placeholder="Intel i7-1355U" value={s.v} onChange={(e) => setSpecs((p) => p.map((x, j) => j === i ? { ...x, v: e.target.value } : x))} />
                <button type="button" onClick={() => setSpecs((p) => p.filter((_, j) => j !== i))} className="p-2 text-slate-400 hover:text-red-600"><Trash2 size={15} /></button>
              </div>
            ))}
            <button type="button" onClick={() => setSpecs((p) => [...p, { k: '', v: '' }])} className="inline-flex items-center gap-1 text-sm text-blue-600 hover:text-blue-700">
              <Plus size={14} /> Add spec
            </button>
          </div>
        </section>

        {/* Tags */}
        {tags.length > 0 && (
          <section className="bg-white border border-slate-200 rounded-2xl p-5 space-y-3">
            <label className={label}>Brand &amp; tags</label>
            <div className="flex flex-wrap gap-2">
              {[...brandTags, ...otherTags].map((t) => {
                const on = tagIds.includes(t.id)
                return (
                  <button key={t.id} type="button"
                    onClick={() => setTagIds((p) => on ? p.filter((x) => x !== t.id) : [...p, t.id])}
                    className={`px-3 py-1 rounded-full text-sm border transition-colors ${on ? 'bg-blue-600 text-white border-blue-600' : 'bg-white text-slate-600 border-slate-200 hover:border-blue-300'}`}>
                    {t.name}
                  </button>
                )
              })}
            </div>
          </section>
        )}

        {error && <p className="text-sm text-red-600">{error}</p>}

        <div className="flex items-center gap-3">
          <button type="submit" disabled={saving} className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-indigo-600 text-white font-semibold px-6 py-2.5 rounded-xl shadow-lg shadow-blue-600/20 disabled:opacity-50">
            {saving && <Loader2 size={16} className="animate-spin" />}
            {product ? 'Save changes' : 'Create product'}
          </button>
          <button type="button" onClick={() => router.push('/admin/products')} className="text-sm text-slate-500 hover:text-slate-900">Cancel</button>
        </div>
      </div>
    </form>
  )
}
