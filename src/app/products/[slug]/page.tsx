'use client'
import { useState } from 'react'
import { ShoppingCart, ChevronRight, Star, Shield, Truck, MessageCircle } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { useCartStore } from '@/store/cart'
import type { Product } from '@/lib/types'

// Mock product — replace with Supabase query by slug
const MOCK_PRODUCT: Product = {
  id: '1',
  name: 'Dell Latitude 5540 Business Laptop',
  slug: 'dell-latitude-5540',
  description: 'The Dell Latitude 5540 is a premium business laptop built for professionals. Featuring 13th Gen Intel Core i7, it delivers reliable performance for demanding workloads.',
  price: 1299,
  compare_at_price: 1499,
  primary_category_id: null,
  images: [],
  stock: 5,
  sku: 'DELL-5540-I7',
  is_active: true,
  is_featured: true,
  specs: {
    Processor: 'Intel Core i7-1365U (13th Gen)',
    RAM: '16GB DDR4 3200MHz',
    Storage: '512GB NVMe SSD',
    Display: '15.6" FHD IPS Anti-glare',
    Graphics: 'Intel Iris Xe',
    Battery: '56Whr, up to 12 hours',
    OS: 'Windows 11 Pro',
    Weight: '1.85 kg',
  },
  created_at: '',
  updated_at: '',
  tags: [
    { id: 't1', name: 'Dell', slug: 'dell', type: 'brand' },
    { id: 't2', name: 'Business', slug: 'business', type: 'use_case' },
    { id: 't3', name: 'Laptop', slug: 'laptop', type: 'type' },
  ],
}

export default function ProductPage() {
  const [qty, setQty] = useState(1)
  const addItem = useCartStore((s) => s.addItem)
  const p = MOCK_PRODUCT
  const discount = p.compare_at_price
    ? Math.round(((p.compare_at_price - p.price) / p.compare_at_price) * 100)
    : null

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      {/* Breadcrumb */}
      <nav className="flex items-center gap-1 text-xs text-zinc-500 mb-6">
        <a href="/" className="hover:text-white">Home</a>
        <ChevronRight size={12} />
        <a href="/categories/computing" className="hover:text-white">Computing</a>
        <ChevronRight size={12} />
        <a href="/categories/laptops" className="hover:text-white">Laptops</a>
        <ChevronRight size={12} />
        <span className="text-zinc-300">{p.name}</span>
      </nav>

      <div className="grid md:grid-cols-2 gap-10 lg:gap-16">
        {/* Image Gallery */}
        <div className="space-y-3">
          <div className="aspect-square bg-zinc-900 border border-zinc-800 rounded-2xl flex items-center justify-center relative">
            {discount && (
              <Badge variant="red" className="absolute top-4 left-4 text-sm px-3 py-1">
                -{discount}% OFF
              </Badge>
            )}
            <span className="text-zinc-600 text-6xl">📦</span>
          </div>
          <div className="grid grid-cols-4 gap-2">
            {[1, 2, 3, 4].map((i) => (
              <div
                key={i}
                className="aspect-square bg-zinc-900 border border-zinc-800 rounded-xl flex items-center justify-center cursor-pointer hover:border-zinc-600 transition-colors"
              >
                <span className="text-zinc-700 text-xl">📦</span>
              </div>
            ))}
          </div>
        </div>

        {/* Product Info */}
        <div className="space-y-6">
          {/* Tags */}
          <div className="flex flex-wrap gap-2">
            {p.tags?.map((t) => (
              <Badge key={t.id} variant="blue">{t.name}</Badge>
            ))}
          </div>

          <div>
            <h1 className="text-3xl font-bold text-white leading-tight">{p.name}</h1>

            {/* Rating */}
            <div className="flex items-center gap-2 mt-2">
              {[...Array(5)].map((_, i) => (
                <Star key={i} size={14} className="fill-amber-400 text-amber-400" />
              ))}
              <span className="text-zinc-500 text-sm">4.8 (24 reviews)</span>
            </div>
          </div>

          {/* Price */}
          <div className="flex items-baseline gap-3">
            <span className="text-4xl font-bold text-white">${p.price.toFixed(2)}</span>
            {p.compare_at_price && (
              <span className="text-zinc-500 line-through text-xl">
                ${p.compare_at_price.toFixed(2)}
              </span>
            )}
          </div>

          {/* Description */}
          {p.description && (
            <p className="text-zinc-400 leading-relaxed">{p.description}</p>
          )}

          {/* Qty + Add to Cart */}
          <div className="space-y-3">
            <div className="flex items-center gap-3">
              <div className="flex items-center border border-zinc-700 rounded-xl overflow-hidden">
                <button
                  onClick={() => setQty(Math.max(1, qty - 1))}
                  className="px-4 py-3 text-zinc-400 hover:text-white hover:bg-zinc-800 transition-colors"
                >
                  −
                </button>
                <span className="px-4 text-white font-medium w-12 text-center">{qty}</span>
                <button
                  onClick={() => setQty(Math.min(p.stock, qty + 1))}
                  className="px-4 py-3 text-zinc-400 hover:text-white hover:bg-zinc-800 transition-colors"
                >
                  +
                </button>
              </div>
              <span className="text-zinc-500 text-sm">{p.stock} in stock</span>
            </div>

            <Button fullWidth size="lg" onClick={() => { addItem(p, qty) }}>
              <ShoppingCart size={18} />
              Add to Cart — ${(p.price * qty).toFixed(2)}
            </Button>

            <a
              href={`https://wa.me/9616000000?text=Hi, I'm interested in: ${p.name}`}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center justify-center gap-2 w-full py-3 rounded-xl border border-green-700/50 text-green-400 hover:bg-green-900/20 transition-colors text-sm font-medium"
            >
              <MessageCircle size={16} />
              Order via WhatsApp
            </a>
          </div>

          {/* Trust Badges */}
          <div className="grid grid-cols-2 gap-3 pt-4 border-t border-zinc-800">
            <div className="flex items-center gap-2 text-sm text-zinc-400">
              <Shield size={16} className="text-blue-400 shrink-0" />
              Genuine product
            </div>
            <div className="flex items-center gap-2 text-sm text-zinc-400">
              <Truck size={16} className="text-blue-400 shrink-0" />
              Fast delivery
            </div>
          </div>
        </div>
      </div>

      {/* Specs Table */}
      {Object.keys(p.specs).length > 0 && (
        <div className="mt-12">
          <h2 className="text-xl font-bold text-white mb-4">Specifications</h2>
          <div className="bg-zinc-900 border border-zinc-800 rounded-2xl overflow-hidden">
            {Object.entries(p.specs).map(([key, value], i) => (
              <div
                key={key}
                className={`flex items-start gap-4 px-6 py-4 ${
                  i % 2 === 0 ? 'bg-zinc-900' : 'bg-zinc-950'
                }`}
              >
                <span className="text-zinc-500 text-sm w-40 shrink-0">{key}</span>
                <span className="text-white text-sm">{value}</span>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
