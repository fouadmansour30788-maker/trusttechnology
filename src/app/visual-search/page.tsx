'use client'
import { useRef, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { Camera, Loader2, Package, ShoppingCart, AlertTriangle, Wrench, Check, X } from 'lucide-react'
import { useCartStore } from '@/store/cart'
import type { Product } from '@/lib/types'

type Match = { product: Product; reason: string }
type Result = { description: string; damaged: boolean; matches: Match[] }

const MAX_DIM = 1024

/** Downscale + JPEG-encode in-browser so we never ship a multi-MB photo to the API. */
function resizeToBase64(file: File): Promise<{ base64: string; mimeType: string }> {
  return new Promise((resolve, reject) => {
    const img = document.createElement('img')
    const reader = new FileReader()
    reader.onload = () => { img.src = reader.result as string }
    reader.onerror = reject
    img.onload = () => {
      const scale = Math.min(1, MAX_DIM / Math.max(img.width, img.height))
      const canvas = document.createElement('canvas')
      canvas.width = Math.round(img.width * scale)
      canvas.height = Math.round(img.height * scale)
      const ctx = canvas.getContext('2d')
      if (!ctx) return reject(new Error('canvas unavailable'))
      ctx.drawImage(img, 0, 0, canvas.width, canvas.height)
      const dataUrl = canvas.toDataURL('image/jpeg', 0.82)
      resolve({ base64: dataUrl.split(',')[1] ?? '', mimeType: 'image/jpeg' })
    }
    img.onerror = reject
    reader.readAsDataURL(file)
  })
}

export default function VisualSearchPage() {
  const addItem = useCartStore((s) => s.addItem)
  const inputRef = useRef<HTMLInputElement>(null)
  const [preview, setPreview] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<Result | null>(null)
  const [added, setAdded] = useState<string | null>(null)

  async function onFile(file: File | undefined) {
    if (!file) return
    setError(null)
    setResult(null)
    setPreview(URL.createObjectURL(file))
    setLoading(true)
    try {
      const { base64, mimeType } = await resizeToBase64(file)
      const res = await fetch('/api/visual-search', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ imageBase64: base64, mimeType }),
      })
      const data = await res.json()
      if (data.ok) setResult(data)
      else setError(typeof data.error === 'string' && data.error.length > 12 ? data.error : 'Could not read that photo — try another.')
    } catch {
      setError('Network error — please try again.')
    } finally {
      setLoading(false)
    }
  }

  function reset() {
    setPreview(null)
    setResult(null)
    setError(null)
    if (inputRef.current) inputRef.current.value = ''
  }

  return (
    <div className="max-w-2xl mx-auto px-4 sm:px-6 py-12">
      <div className="text-center mb-8">
        <span className="inline-flex items-center gap-2 bg-blue-50 text-blue-700 text-sm font-medium rounded-full px-4 py-1.5 mb-4">
          <Camera size={14} /> Visual search
        </span>
        <h1 className="text-3xl sm:text-4xl font-bold text-slate-900">Snap a photo. We&apos;ll find it.</h1>
        <p className="text-slate-500 mt-3 max-w-lg mx-auto">
          Not sure what a part or device is called? Upload a photo and our AI will identify it and match it against our catalog — or point you to repairs if it looks damaged.
        </p>
      </div>

      {!preview ? (
        <label className="flex flex-col items-center justify-center gap-3 border-2 border-dashed border-slate-300 hover:border-blue-400 rounded-2xl py-14 cursor-pointer transition-colors bg-white">
          <Camera size={32} className="text-slate-300" />
          <span className="text-sm font-medium text-slate-600">Tap to take or upload a photo</span>
          <input ref={inputRef} type="file" accept="image/*" capture="environment" className="hidden"
            onChange={(e) => onFile(e.target.files?.[0])} />
        </label>
      ) : (
        <div className="bg-white border border-slate-200 rounded-2xl p-4">
          <div className="relative">
            <div className="relative w-full aspect-video rounded-xl overflow-hidden bg-slate-100">
              <Image src={preview} alt="Uploaded photo" fill className="object-contain" unoptimized />
            </div>
            <button onClick={reset} className="absolute top-2 right-2 w-8 h-8 rounded-full bg-white/90 border border-slate-200 flex items-center justify-center text-slate-500 hover:text-slate-900">
              <X size={15} />
            </button>
          </div>

          {loading && (
            <div className="flex items-center justify-center gap-2 text-slate-500 text-sm py-8">
              <Loader2 size={16} className="animate-spin" /> Looking at your photo…
            </div>
          )}

          {error && <p className="text-sm text-red-600 bg-red-50 rounded-xl px-4 py-3 mt-4">{error}</p>}

          {result && (
            <div className="mt-4">
              <p className="text-slate-700 leading-relaxed">{result.description}</p>

              {result.damaged && (
                <div className="mt-4 flex items-start gap-3 bg-amber-50 border border-amber-100 rounded-xl px-4 py-3.5">
                  <AlertTriangle size={18} className="text-amber-600 shrink-0 mt-0.5" />
                  <div>
                    <p className="text-sm font-semibold text-amber-900">This looks like it might be damaged</p>
                    <p className="text-xs text-amber-700 mt-0.5">We do free diagnosis on laptops, desktops, printers and POS hardware.</p>
                    <Link href="/repairs" className="inline-flex items-center gap-1.5 mt-2 text-sm font-semibold text-amber-900 hover:underline">
                      <Wrench size={14} /> Book a free diagnosis
                    </Link>
                  </div>
                </div>
              )}

              {result.matches.length > 0 ? (
                <div className="mt-5 space-y-3">
                  <p className="text-sm font-semibold text-slate-900">Closest matches in our catalog</p>
                  {result.matches.map(({ product: p, reason }) => {
                    const onReq = p.priceOnRequest || p.price === 0
                    return (
                      <div key={p.slug} className="flex gap-4 bg-slate-50 border border-slate-200 rounded-2xl p-4">
                        <Link href={`/products/${p.slug}`} className="w-16 h-16 rounded-xl bg-white shrink-0 overflow-hidden relative flex items-center justify-center">
                          {p.images[0] ? <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="64px" /> : <Package size={18} className="text-slate-300" />}
                        </Link>
                        <div className="flex-1 min-w-0">
                          <Link href={`/products/${p.slug}`} className="font-semibold text-slate-900 hover:text-blue-600 leading-snug line-clamp-2 text-sm">{p.name}</Link>
                          <p className="text-xs text-slate-500 mt-1 leading-relaxed">{reason}</p>
                          <div className="flex items-center justify-between mt-2">
                            <span className={`text-sm font-bold ${onReq ? 'text-blue-600' : 'text-slate-900'}`}>{onReq ? 'Call for price' : `$${p.price.toFixed(0)}`}</span>
                            {!onReq && (
                              <button onClick={() => { addItem(p); setAdded(p.slug); setTimeout(() => setAdded(null), 1500) }}
                                className="inline-flex items-center gap-1.5 text-xs font-semibold bg-blue-600 hover:bg-blue-700 text-white px-3 py-1.5 rounded-lg transition-colors">
                                {added === p.slug ? <><Check size={12} /> Added</> : <><ShoppingCart size={12} /> Add</>}
                              </button>
                            )}
                          </div>
                        </div>
                      </div>
                    )
                  })}
                </div>
              ) : !result.damaged && (
                <p className="text-sm text-slate-400 mt-4">No close matches in our catalog — try our <Link href="/products" className="text-blue-600 hover:underline">full product list</Link> or ask on WhatsApp.</p>
              )}

              <button onClick={reset} className="mt-5 text-sm font-medium text-slate-500 hover:text-slate-900">Try another photo</button>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
