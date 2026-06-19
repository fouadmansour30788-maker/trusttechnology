'use client'
import { useCartStore } from '@/store/cart'
import { Trash2, Plus, Minus, ShoppingCart, ArrowRight } from 'lucide-react'
import Link from 'next/link'
import Image from 'next/image'
import { Button } from '@/components/ui/button'

export default function CartPage() {
  const { items, removeItem, updateQuantity, totalItems, totalPrice, clearCart } = useCartStore()

  if (items.length === 0) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 py-24 flex flex-col items-center justify-center text-center gap-6">
        <ShoppingCart size={48} className="text-zinc-700" />
        <h1 className="text-2xl font-bold text-white">Your cart is empty</h1>
        <p className="text-zinc-400">Add some products to get started.</p>
        <Link href="/categories/computing">
          <Button size="lg">Shop Now</Button>
        </Link>
      </div>
    )
  }

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      <h1 className="text-3xl font-bold text-white mb-8">
        Your Cart ({totalItems()} {totalItems() === 1 ? 'item' : 'items'})
      </h1>

      <div className="grid lg:grid-cols-3 gap-8">
        {/* Items */}
        <div className="lg:col-span-2 space-y-4">
          {items.map(({ product, quantity }) => (
            <div
              key={product.id}
              className="flex gap-4 bg-zinc-900 border border-zinc-800 rounded-2xl p-4"
            >
              <div className="w-20 h-20 rounded-xl bg-zinc-800 shrink-0 flex items-center justify-center overflow-hidden">
                {product.images[0] ? (
                  <Image src={product.images[0]} alt={product.name} width={80} height={80} className="object-cover" />
                ) : (
                  <span className="text-2xl">📦</span>
                )}
              </div>

              <div className="flex-1 min-w-0">
                <Link href={`/products/${product.slug}`} className="font-semibold text-white hover:text-blue-400 transition-colors line-clamp-2">
                  {product.name}
                </Link>
                {product.sku && <p className="text-zinc-500 text-xs mt-0.5">SKU: {product.sku}</p>}

                <div className="flex items-center justify-between mt-3">
                  <div className="flex items-center border border-zinc-700 rounded-lg overflow-hidden">
                    <button
                      onClick={() => updateQuantity(product.id, quantity - 1)}
                      className="px-3 py-1.5 text-zinc-400 hover:text-white hover:bg-zinc-800 transition-colors"
                    >
                      <Minus size={12} />
                    </button>
                    <span className="px-3 text-white text-sm">{quantity}</span>
                    <button
                      onClick={() => updateQuantity(product.id, quantity + 1)}
                      className="px-3 py-1.5 text-zinc-400 hover:text-white hover:bg-zinc-800 transition-colors"
                    >
                      <Plus size={12} />
                    </button>
                  </div>
                  <div className="flex items-center gap-4">
                    <span className="font-bold text-white">${(product.price * quantity).toFixed(2)}</span>
                    <button
                      onClick={() => removeItem(product.id)}
                      className="text-zinc-600 hover:text-red-400 transition-colors"
                    >
                      <Trash2 size={16} />
                    </button>
                  </div>
                </div>
              </div>
            </div>
          ))}

          <button onClick={clearCart} className="text-sm text-zinc-500 hover:text-red-400 transition-colors mt-2">
            Clear cart
          </button>
        </div>

        {/* Order Summary */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6 h-fit space-y-4">
          <h2 className="text-lg font-bold text-white">Order Summary</h2>

          <div className="space-y-2 text-sm">
            {items.map(({ product, quantity }) => (
              <div key={product.id} className="flex justify-between text-zinc-400">
                <span className="truncate max-w-[180px]">{product.name} × {quantity}</span>
                <span>${(product.price * quantity).toFixed(2)}</span>
              </div>
            ))}
          </div>

          <div className="border-t border-zinc-800 pt-4 flex justify-between">
            <span className="text-zinc-400">Subtotal</span>
            <span className="text-white font-bold">${totalPrice().toFixed(2)}</span>
          </div>

          <div className="flex justify-between text-sm">
            <span className="text-zinc-400">Shipping</span>
            <span className="text-zinc-400">Calculated at checkout</span>
          </div>

          <div className="border-t border-zinc-800 pt-4 flex justify-between">
            <span className="text-white font-bold">Total</span>
            <span className="text-white font-bold text-xl">${totalPrice().toFixed(2)}</span>
          </div>

          <Button fullWidth size="lg">
            Proceed to Checkout <ArrowRight size={16} />
          </Button>

          <a
            href={`https://wa.me/9616000000?text=I'd like to order: ${items.map((i) => `${i.product.name} x${i.quantity}`).join(', ')}`}
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-center gap-2 w-full py-3 rounded-xl border border-green-700/50 text-green-400 hover:bg-green-900/20 transition-colors text-sm font-medium"
          >
            Order via WhatsApp
          </a>
        </div>
      </div>
    </div>
  )
}
