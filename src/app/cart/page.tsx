'use client'
import { useCartStore } from '@/store/cart'
import { Trash2, Plus, Minus, ShoppingCart, ArrowRight, MessageCircle } from 'lucide-react'
import Link from 'next/link'
import Image from 'next/image'
import { Button } from '@/components/ui/button'

const WHATSAPP = '96171998983'

export default function CartPage() {
  const { items, removeItem, updateQuantity, totalItems, totalPrice, clearCart } = useCartStore()

  if (items.length === 0) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 py-24 flex flex-col items-center justify-center text-center gap-6">
        <ShoppingCart size={48} className="text-slate-300" />
        <h1 className="text-2xl font-bold text-slate-900">Your cart is empty</h1>
        <p className="text-slate-500">Add some products to get started.</p>
        <Link href="/products"><Button size="lg">Shop Now</Button></Link>
      </div>
    )
  }

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      <h1 className="text-3xl font-bold text-slate-900 mb-8">
        Your Cart ({totalItems()} {totalItems() === 1 ? 'item' : 'items'})
      </h1>

      <div className="grid lg:grid-cols-3 gap-8">
        {/* Items */}
        <div className="lg:col-span-2 space-y-4">
          {items.map(({ product, quantity }) => {
            const onRequest = product.priceOnRequest || product.price === 0
            return (
              <div key={product.id} className="flex gap-4 bg-white border border-slate-200 rounded-2xl p-4 shadow-soft">
                <div className="w-20 h-20 rounded-xl bg-slate-100 shrink-0 flex items-center justify-center overflow-hidden relative">
                  {product.images[0] ? (
                    <Image src={product.images[0]} alt={product.name} fill className="object-cover" sizes="80px" />
                  ) : (
                    <span className="text-2xl">📦</span>
                  )}
                </div>

                <div className="flex-1 min-w-0">
                  <Link href={`/products/${product.slug}`} className="font-semibold text-slate-900 hover:text-blue-600 transition-colors line-clamp-2">
                    {product.name}
                  </Link>
                  {product.sku && <p className="text-slate-400 text-xs mt-0.5">SKU: {product.sku}</p>}

                  <div className="flex items-center justify-between mt-3">
                    <div className="flex items-center border border-slate-200 rounded-lg overflow-hidden">
                      <button onClick={() => updateQuantity(product.id, quantity - 1)} className="px-3 py-1.5 text-slate-500 hover:bg-slate-100 transition-colors"><Minus size={12} /></button>
                      <span className="px-3 text-slate-900 text-sm">{quantity}</span>
                      <button onClick={() => updateQuantity(product.id, quantity + 1)} className="px-3 py-1.5 text-slate-500 hover:bg-slate-100 transition-colors"><Plus size={12} /></button>
                    </div>
                    <div className="flex items-center gap-4">
                      <span className={`font-bold ${onRequest ? 'text-blue-600' : 'text-slate-900'}`}>
                        {onRequest ? 'Call for price' : `$${(product.price * quantity).toFixed(2)}`}
                      </span>
                      <button onClick={() => removeItem(product.id)} className="text-slate-300 hover:text-slate-600 transition-colors"><Trash2 size={16} /></button>
                    </div>
                  </div>
                </div>
              </div>
            )
          })}

          <button onClick={clearCart} className="text-sm text-slate-400 hover:text-slate-700 transition-colors mt-2">Clear cart</button>
        </div>

        {/* Order Summary */}
        <div className="bg-white border border-slate-200 rounded-2xl p-6 h-fit space-y-4 shadow-soft">
          <h2 className="text-lg font-bold text-slate-900">Order Summary</h2>

          <div className="space-y-2 text-sm">
            {items.map(({ product, quantity }) => (
              <div key={product.id} className="flex justify-between text-slate-500">
                <span className="truncate max-w-[180px]">{product.name} × {quantity}</span>
                <span>{product.priceOnRequest || product.price === 0 ? 'Call' : `$${(product.price * quantity).toFixed(2)}`}</span>
              </div>
            ))}
          </div>

          <div className="border-t border-slate-100 pt-4 flex justify-between">
            <span className="text-slate-500">Subtotal</span>
            <span className="text-slate-900 font-bold">${totalPrice().toFixed(2)}</span>
          </div>

          <div className="flex justify-between text-sm">
            <span className="text-slate-500">Shipping</span>
            <span className="text-slate-500">Calculated at checkout</span>
          </div>

          <div className="border-t border-slate-100 pt-4 flex justify-between">
            <span className="text-slate-900 font-bold">Total</span>
            <span className="text-slate-900 font-bold text-xl">${totalPrice().toFixed(2)}</span>
          </div>

          <a
            href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent("I'd like to order: " + items.map((i) => `${i.product.name} x${i.quantity}`).join(', '))}`}
            target="_blank" rel="noopener noreferrer"
            className="flex items-center justify-center gap-2 w-full py-3 rounded-xl bg-blue-600 hover:bg-blue-700 text-white font-semibold transition-colors"
          >
            <MessageCircle size={16} /> Order via WhatsApp
          </a>
        </div>
      </div>
    </div>
  )
}
