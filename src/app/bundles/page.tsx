import { Zap, ShoppingCart } from 'lucide-react'
import { Badge } from '@/components/ui/badge'

type Bundle = {
  id: string
  name: string
  tag: string
  description: string
  discount: number
  totalPrice: number
  originalPrice: number
  items: { name: string; price: number }[]
  type: 'gaming' | 'business' | 'pos'
}

const BUNDLES: Bundle[] = [
  {
    id: 'b1',
    name: 'Gaming Beast Setup',
    tag: 'gaming',
    description: 'Everything you need for a high-performance gaming station.',
    discount: 18,
    totalPrice: 3199,
    originalPrice: 3899,
    type: 'gaming',
    items: [
      { name: 'ASUS ROG Strix G16 Gaming Laptop', price: 1899 },
      { name: 'Samsung 27" Curved Gaming Monitor', price: 449 },
      { name: 'Logitech G502 Gaming Mouse', price: 79 },
      { name: 'HyperX Alloy FPS Keyboard', price: 129 },
      { name: 'HyperX Cloud II Headset', price: 99 },
    ],
  },
  {
    id: 'b2',
    name: 'Business Professional Bundle',
    tag: 'business',
    description: 'The complete office setup for productivity-focused professionals.',
    discount: 15,
    totalPrice: 2399,
    originalPrice: 2823,
    type: 'business',
    items: [
      { name: 'Dell Latitude 5540 Business Laptop', price: 1299 },
      { name: 'Dell 24" IPS Monitor', price: 329 },
      { name: 'Logitech MX Master 3 Mouse', price: 99 },
      { name: 'Logitech MX Keys Keyboard', price: 109 },
      { name: 'HP LaserJet Pro M404n', price: 499 },
    ],
  },
  {
    id: 'b3',
    name: 'POS Starter Package',
    tag: 'pos',
    description: 'Full point-of-sale system ready for retail and restaurant use.',
    discount: 20,
    totalPrice: 1499,
    originalPrice: 1872,
    type: 'pos',
    items: [
      { name: 'Sunmi T2 POS Terminal', price: 699 },
      { name: '15" POS Touch Screen Monitor', price: 449 },
      { name: 'Thermal Receipt Printer', price: 199 },
      { name: 'Barcode Scanner', price: 89 },
      { name: 'Cash Drawer', price: 79 },
    ],
  },
]

const TYPE_COLORS: Record<string, { gradient: string; border: string; badge: string }> = {
  gaming: {
    gradient: 'from-purple-900/30 to-zinc-900',
    border: 'border-purple-800/30',
    badge: 'bg-purple-600/20 text-purple-400',
  },
  business: {
    gradient: 'from-blue-900/30 to-zinc-900',
    border: 'border-blue-800/30',
    badge: 'bg-blue-600/20 text-blue-400',
  },
  pos: {
    gradient: 'from-amber-900/30 to-zinc-900',
    border: 'border-amber-800/30',
    badge: 'bg-amber-600/20 text-amber-400',
  },
}

export default function BundlesPage() {
  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      {/* Header */}
      <div className="mb-10 text-center max-w-2xl mx-auto">
        <div className="inline-flex items-center gap-2 bg-amber-600/10 border border-amber-600/20 rounded-full px-4 py-1.5 text-sm text-amber-400 mb-4">
          <Zap size={14} />
          Save up to 20%
        </div>
        <h1 className="text-4xl font-bold text-white">Bundle & Save</h1>
        <p className="text-zinc-400 mt-3 text-lg">
          Curated setups for gaming, business, and retail — everything pre-matched and discounted.
        </p>
      </div>

      {/* Bundles Grid */}
      <div className="grid md:grid-cols-3 gap-6">
        {BUNDLES.map((bundle) => {
          const colors = TYPE_COLORS[bundle.type]
          return (
            <div
              key={bundle.id}
              className={`bg-gradient-to-b ${colors.gradient} border ${colors.border} rounded-3xl p-6 flex flex-col`}
            >
              <div className="flex items-start justify-between mb-4">
                <span className={`text-xs font-semibold uppercase tracking-widest px-3 py-1 rounded-full ${colors.badge}`}>
                  {bundle.tag}
                </span>
                <Badge variant="red" className="text-sm px-2 py-1">-{bundle.discount}%</Badge>
              </div>

              <h2 className="text-xl font-bold text-white">{bundle.name}</h2>
              <p className="text-zinc-400 text-sm mt-2 mb-6 leading-relaxed">{bundle.description}</p>

              {/* Items List */}
              <div className="space-y-2 mb-6 flex-1">
                {bundle.items.map((item) => (
                  <div key={item.name} className="flex items-center justify-between text-sm">
                    <span className="text-zinc-300 truncate mr-2">{item.name}</span>
                    <span className="text-zinc-500 shrink-0">${item.price}</span>
                  </div>
                ))}
              </div>

              {/* Pricing */}
              <div className="border-t border-zinc-700/50 pt-4 mb-4">
                <div className="flex items-baseline gap-3">
                  <span className="text-3xl font-bold text-white">${bundle.totalPrice.toLocaleString()}</span>
                  <span className="text-zinc-500 line-through">${bundle.originalPrice.toLocaleString()}</span>
                </div>
                <p className="text-green-400 text-sm mt-1">
                  Save ${(bundle.originalPrice - bundle.totalPrice).toLocaleString()}
                </p>
              </div>

              <button className="w-full flex items-center justify-center gap-2 bg-white text-black font-semibold py-3 rounded-xl hover:bg-zinc-100 transition-colors">
                <ShoppingCart size={16} />
                Add Bundle to Cart
              </button>
            </div>
          )
        })}
      </div>

      {/* Custom bundle CTA */}
      <div className="mt-12 bg-zinc-900 border border-zinc-800 rounded-3xl p-8 text-center">
        <h2 className="text-2xl font-bold text-white mb-2">Need a custom bundle?</h2>
        <p className="text-zinc-400 mb-6">Tell us your requirements and budget — we&apos;ll put together the perfect setup.</p>
        <a
          href="https://wa.me/9616000000?text=I need a custom bundle"
          target="_blank"
          rel="noopener noreferrer"
          className="inline-flex items-center gap-2 bg-green-600 hover:bg-green-700 text-white font-semibold px-6 py-3 rounded-xl transition-colors"
        >
          Chat with us on WhatsApp
        </a>
      </div>
    </div>
  )
}
