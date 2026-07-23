'use client'
import { useEffect, useState } from 'react'
import { X, ShoppingCart, Plus, Minus, Trash2, MessageCircle, Truck, Check } from 'lucide-react'
import Image from 'next/image'
import Link from 'next/link'
import { useCartStore } from '@/store/cart'
import { Button } from '@/components/ui/button'
import type { Product } from '@/lib/types'

const WHATSAPP = '96171998983'

export function CartDrawer() {
  const { items, isOpen, closeCart, removeItem, updateQuantity, addItem, totalItems, totalPrice } =
    useCartStore()
  const [suggestions, setSuggestions] = useState<Product[]>([])
  const [added, setAdded] = useState<string | null>(null)

  const ids = items.map((i) => i.product.id).join(',')
  const categories = [...new Set(items.map((i) => i.product.primary_category_id).filter(Boolean))].join(',')

  useEffect(() => {
    // Cart-empty/closed suggestions are simply never rendered (gated below by
    // items.length > 0), so there's no need to clear state synchronously here.
    if (!isOpen || items.length === 0) return
    let cancelled = false
    const params = new URLSearchParams({ exclude: ids, categories })
    fetch(`/api/cart-suggestions?${params}`)
      .then((r) => r.json())
      .then((data) => { if (!cancelled) setSuggestions(data.products ?? []) })
      .catch(() => {})
    return () => { cancelled = true }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isOpen, ids, categories])

  if (!isOpen) return null

  const pricedTotal = totalPrice()
  const callCount = items.filter((i) => i.product.priceOnRequest || i.product.price === 0).length

  function buildQuote() {
    const lines = items.map(({ product, quantity }) => {
      const onRequest = product.priceOnRequest || product.price === 0
      const price = onRequest ? 'price on request' : `$${(product.price * quantity).toFixed(2)}`
      return `• ${quantity}× ${product.name} — ${price}`
    })
    const total = pricedTotal > 0 ? `\n\nPriced subtotal: $${pricedTotal.toFixed(2)}` : ''
    const msg = `Hi Trust Technology! I'd like a quote for:\n\n${lines.join('\n')}${total}\n\nPlease confirm availability and final pricing.`
    window.open(`https://wa.me/${WHATSAPP}?text=${encodeURIComponent(msg)}`, '_blank', 'noopener')
  }

  return (
    <>
      <div className="fixed inset-0 bg-slate-900/40 z-50 backdrop-blur-sm" onClick={closeCart} />

      <div className="fixed right-0 top-0 h-full w-full max-w-md bg-white border-l border-slate-200 z-50 flex flex-col shadow-2xl">
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-200">
          <div className="flex items-center gap-2">
            <ShoppingCart size={20} className="text-blue-600" />
            <span className="font-semibold text-slate-900">Your Quote</span>
            {totalItems() > 0 && (
              <span className="bg-blue-600 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">
                {totalItems()}
              </span>
            )}
          </div>
          <button onClick={closeCart} className="p-2 text-slate-400 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors">
            <X size={18} />
          </button>
        </div>

        {/* Items */}
        <div className="flex-1 overflow-y-auto px-6 py-4 space-y-4">
          {items.length === 0 ? (
            <div className="flex flex-col items-center justify-center h-full text-center gap-4">
              <ShoppingCart size={40} className="text-slate-300" />
              <p className="text-slate-500">Your quote list is empty</p>
              <Button variant="outline" size="sm" onClick={closeCart}>Continue Shopping</Button>
            </div>
          ) : (
            items.map(({ product, quantity }) => {
              const onRequest = product.priceOnRequest || product.price === 0
              return (
                <div key={product.id} className="flex gap-4 bg-slate-50 rounded-xl p-3 border border-slate-200">
                  <div className="w-16 h-16 rounded-lg bg-white border border-slate-100 shrink-0 overflow-hidden">
                    {product.images[0] ? (
                      <Image src={product.images[0]} alt={product.name} width={64} height={64} className="w-full h-full object-cover" />
                    ) : (
                      <div className="w-full h-full flex items-center justify-center text-slate-300 text-xs">No img</div>
                    )}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm text-slate-900 font-medium truncate">{product.name}</p>
                    <p className={`text-sm font-semibold mt-0.5 ${onRequest ? 'text-blue-600' : 'text-slate-900'}`}>
                      {onRequest ? 'Call for price' : `$${(product.price * quantity).toFixed(2)}`}
                    </p>
                    <div className="flex items-center gap-2 mt-2">
                      <button onClick={() => updateQuantity(product.id, quantity - 1)} className="w-6 h-6 rounded flex items-center justify-center bg-white border border-slate-200 hover:bg-slate-100 text-slate-500 transition-colors">
                        <Minus size={12} />
                      </button>
                      <span className="text-sm text-slate-900 w-6 text-center">{quantity}</span>
                      <button onClick={() => updateQuantity(product.id, quantity + 1)} className="w-6 h-6 rounded flex items-center justify-center bg-white border border-slate-200 hover:bg-slate-100 text-slate-500 transition-colors">
                        <Plus size={12} />
                      </button>
                    </div>
                  </div>
                  <button onClick={() => removeItem(product.id)} className="text-slate-300 hover:text-slate-600 transition-colors self-start mt-0.5">
                    <Trash2 size={16} />
                  </button>
                </div>
              )
            })
          )}
        </div>

        {/* Cross-sell */}
        {items.length > 0 && suggestions.length > 0 && (
          <div className="border-t border-slate-100 px-6 py-4">
            <p className="text-xs font-semibold text-slate-500 mb-3">You might also need</p>
            <div className="flex gap-3 overflow-x-auto pb-1 -mx-1 px-1">
              {suggestions.map((p) => (
                <div key={p.id} className="w-28 shrink-0">
                  <Link href={`/products/${p.slug}`} onClick={closeCart} className="block w-28 h-20 rounded-lg bg-slate-50 border border-slate-200 relative overflow-hidden">
                    {p.images[0] ? (
                      <Image src={p.images[0]} alt={p.name} fill className="object-contain p-2" sizes="112px" />
                    ) : (
                      <div className="w-full h-full flex items-center justify-center text-slate-300 text-[10px]">No img</div>
                    )}
                  </Link>
                  <p className="text-[11px] text-slate-600 mt-1.5 line-clamp-2 leading-tight">{p.name}</p>
                  <div className="flex items-center justify-between mt-1">
                    <span className="text-xs font-bold text-slate-900">${p.price.toFixed(0)}</span>
                    <button
                      onClick={() => { addItem(p); setAdded(p.id); setTimeout(() => setAdded(null), 1200) }}
                      className="w-6 h-6 rounded-md bg-blue-600 hover:bg-blue-700 text-white flex items-center justify-center transition-colors shrink-0"
                      aria-label={`Add ${p.name} to cart`}
                    >
                      {added === p.id ? <Check size={12} /> : <Plus size={12} />}
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Footer */}
        {items.length > 0 && (
          <div className="border-t border-slate-200 px-6 py-4 space-y-3">
            <div className="flex justify-between items-center">
              <span className="text-slate-500 text-sm">Priced subtotal</span>
              <span className="text-slate-900 font-bold text-lg">${pricedTotal.toFixed(2)}</span>
            </div>
            {callCount > 0 && (
              <p className="text-xs text-slate-400 -mt-1">
                {callCount} item{callCount > 1 ? 's' : ''} priced on request — included in your WhatsApp quote.
              </p>
            )}
            {pricedTotal > 0 && (
              <Link
                href="/checkout"
                onClick={closeCart}
                className="w-full inline-flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-xl shadow-lg shadow-blue-600/20 transition-colors"
              >
                <Truck size={18} /> Checkout — cash on delivery
              </Link>
            )}
            <button
              onClick={buildQuote}
              className={`w-full inline-flex items-center justify-center gap-2 font-semibold py-3 rounded-xl transition-colors ${
                pricedTotal > 0
                  ? 'bg-white border border-emerald-200 text-emerald-700 hover:bg-emerald-50'
                  : 'bg-emerald-500 hover:bg-emerald-600 text-white shadow-lg shadow-emerald-600/20'
              }`}
            >
              <MessageCircle size={18} /> Send quote on WhatsApp
            </button>
            <button onClick={closeCart} className="w-full text-center text-sm text-slate-500 hover:text-slate-900 transition-colors">
              Continue Shopping
            </button>
          </div>
        )}
      </div>
    </>
  )
}
