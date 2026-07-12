'use client'
import { useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { ShoppingCart, ChevronRight, Star, Shield, Truck, MessageCircle, Package } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { useCartStore } from '@/store/cart'
import type { Product } from '@/lib/types'

const WHATSAPP = '96171998983'

export function ProductDetail({ product: p }: { product: Product }) {
  const addItem = useCartStore((s) => s.addItem)
  const onRequest = p.priceOnRequest || p.price === 0
  const [qty, setQty] = useState(1)
  const [active, setActive] = useState(0)
  const [color, setColor] = useState(p.colors?.[0] ?? '')
  const cartProduct = color ? { ...p, name: `${p.name} — ${color}` } : p
  const discount = p.compare_at_price
    ? Math.round(((p.compare_at_price - p.price) / p.compare_at_price) * 100)
    : null

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      {/* Breadcrumb */}
      <nav className="flex items-center gap-1 text-xs text-slate-400 mb-6">
        <Link href="/" className="hover:text-blue-600">Home</Link>
        <ChevronRight size={12} />
        <Link href="/products" className="hover:text-blue-600">Products</Link>
        <ChevronRight size={12} />
        <span className="text-slate-600 truncate max-w-[200px]">{p.name}</span>
      </nav>

      <div className="grid md:grid-cols-2 gap-10 lg:gap-16">
        {/* Gallery */}
        <div className="space-y-3">
          <div className="aspect-square bg-white border border-slate-200 rounded-2xl flex items-center justify-center relative overflow-hidden">
            {discount && (
              <Badge variant="red" className="absolute top-4 left-4 text-sm px-3 py-1 z-10">-{discount}% OFF</Badge>
            )}
            {p.images[active] ? (
              <Image src={p.images[active]} alt={p.name} fill className="object-contain p-6" sizes="(max-width:768px) 100vw, 50vw" priority />
            ) : (
              <Package size={72} className="text-slate-200" />
            )}
          </div>
          {p.images.length > 1 && (
            <div className="grid grid-cols-4 gap-2">
              {p.images.slice(0, 4).map((img, i) => (
                <button
                  key={img}
                  onClick={() => setActive(i)}
                  className={`aspect-square bg-white border rounded-xl overflow-hidden relative transition-colors ${i === active ? 'border-blue-400' : 'border-slate-200 hover:border-slate-300'}`}
                >
                  <Image src={img} alt="" fill className="object-contain p-2" sizes="120px" />
                </button>
              ))}
            </div>
          )}
        </div>

        {/* Info */}
        <div className="space-y-6">
          <div className="flex flex-wrap gap-2">
            {p.tags?.map((t) => <Badge key={t.id} variant="blue">{t.name}</Badge>)}
          </div>

          <div>
            <h1 className="text-3xl font-bold text-slate-900 leading-tight">{p.name}</h1>
            <div className="flex items-center gap-2 mt-2">
              {[...Array(5)].map((_, i) => <Star key={i} size={14} className="fill-blue-400 text-blue-400" />)}
              <span className="text-slate-400 text-sm">4.8 (24 reviews)</span>
            </div>
          </div>

          {/* Price */}
          {onRequest ? (
            <p className="text-2xl font-bold text-blue-600">Call for price</p>
          ) : (
            <div className="flex items-center gap-3 flex-wrap">
              <span className="text-4xl font-bold text-slate-900">${p.price.toFixed(2)}</span>
              {p.compare_at_price && <span className="text-slate-400 line-through text-xl">${p.compare_at_price.toFixed(2)}</span>}
              {p.bestPrice && (
                <span className="inline-flex items-center gap-1 bg-emerald-600 text-white text-xs font-semibold rounded-full px-2.5 py-1">
                  🇱🇧 Best price in Lebanon
                </span>
              )}
            </div>
          )}

          {p.description && <p className="text-slate-500 leading-relaxed whitespace-pre-line">{p.description}</p>}

          {/* Colour options */}
          {p.colors && p.colors.length > 0 && (
            <div>
              <p className="text-sm font-medium text-slate-700 mb-2">Colour: <span className="text-slate-500">{color}</span></p>
              <div className="flex flex-wrap gap-2">
                {p.colors.map((c) => (
                  <button
                    key={c}
                    onClick={() => setColor(c)}
                    className={`px-3.5 py-1.5 rounded-full text-sm border transition-colors ${
                      color === c ? 'border-blue-600 bg-blue-50 text-blue-700 font-medium' : 'border-slate-200 text-slate-600 hover:border-slate-300'
                    }`}
                  >
                    {c}
                  </button>
                ))}
              </div>
            </div>
          )}

          {/* Actions */}
          {onRequest ? (
            <a
              href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent('Hi, I would like a price for: ' + cartProduct.name)}`}
              target="_blank" rel="noopener noreferrer"
              className="flex items-center justify-center gap-2 w-full py-3.5 rounded-xl bg-blue-600 hover:bg-blue-700 text-white font-semibold transition-colors"
            >
              <MessageCircle size={18} /> Ask for price on WhatsApp
            </a>
          ) : (
            <div className="space-y-3">
              <div className="flex items-center gap-3">
                <div className="flex items-center border border-slate-200 rounded-xl overflow-hidden">
                  <button onClick={() => setQty(Math.max(1, qty - 1))} className="px-4 py-3 text-slate-500 hover:bg-slate-100">−</button>
                  <span className="px-4 text-slate-900 font-medium w-12 text-center">{qty}</span>
                  <button onClick={() => setQty(qty + 1)} className="px-4 py-3 text-slate-500 hover:bg-slate-100">+</button>
                </div>
                <span className="text-slate-400 text-sm">{p.stock > 0 ? `${p.stock} in stock` : 'Out of stock'}</span>
              </div>
              <Button fullWidth size="lg" onClick={() => addItem(cartProduct, qty)} disabled={p.stock === 0}>
                <ShoppingCart size={18} /> Add to cart — ${(p.price * qty).toFixed(2)}
              </Button>
              <a
                href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent("Hi, I'm interested in: " + cartProduct.name)}`}
                target="_blank" rel="noopener noreferrer"
                className="flex items-center justify-center gap-2 w-full py-3 rounded-xl border border-blue-200 text-blue-700 hover:bg-blue-50 transition-colors text-sm font-medium"
              >
                <MessageCircle size={16} /> Order via WhatsApp
              </a>
            </div>
          )}

          <div className="grid grid-cols-2 gap-3 pt-4 border-t border-slate-200">
            <div className="flex items-center gap-2 text-sm text-slate-500"><Shield size={16} className="text-blue-600 shrink-0" /> Genuine product</div>
            <div className="flex items-center gap-2 text-sm text-slate-500"><Truck size={16} className="text-blue-600 shrink-0" /> Fast delivery</div>
          </div>
        </div>
      </div>

      {/* Specs */}
      {Object.keys(p.specs).length > 0 && (
        <div className="mt-12 max-w-3xl">
          <h2 className="text-xl font-bold text-slate-900 mb-4">Specifications</h2>
          <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden">
            {Object.entries(p.specs).map(([key, value], i) => (
              <div key={key} className={`flex items-start gap-4 px-6 py-3.5 ${i % 2 === 0 ? 'bg-white' : 'bg-slate-50/60'}`}>
                <span className="text-slate-400 text-sm w-40 shrink-0">{key}</span>
                <span className="text-slate-700 text-sm">{value}</span>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
