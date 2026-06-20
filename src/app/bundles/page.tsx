import { Zap, ShoppingCart, Check, Gamepad2, Briefcase, Store, Sparkles } from 'lucide-react'

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
  popular?: boolean
}

const BUNDLES: Bundle[] = [
  {
    id: 'b1', name: 'Gaming Beast Setup', tag: 'Gaming', type: 'gaming',
    description: 'Everything you need for a high-performance gaming station.',
    discount: 18, totalPrice: 3199, originalPrice: 3899,
    items: [
      { name: 'ROG Strix G16 Gaming Laptop', price: 1899 },
      { name: '27" Curved Gaming Monitor', price: 449 },
      { name: 'Gaming Mouse', price: 79 },
      { name: 'Mechanical Keyboard', price: 129 },
      { name: 'Wireless Headset', price: 99 },
    ],
  },
  {
    id: 'b2', name: 'Business Professional', tag: 'Business', type: 'business', popular: true,
    description: 'The complete office setup for productivity-focused professionals.',
    discount: 15, totalPrice: 2399, originalPrice: 2823,
    items: [
      { name: 'Latitude Business Laptop', price: 1299 },
      { name: '24" IPS Monitor', price: 329 },
      { name: 'MX Master Mouse', price: 99 },
      { name: 'MX Keys Keyboard', price: 109 },
      { name: 'LaserJet Pro Printer', price: 499 },
    ],
  },
  {
    id: 'b3', name: 'POS Starter Package', tag: 'Retail', type: 'pos',
    description: 'A full point-of-sale system ready for retail and restaurant use.',
    discount: 20, totalPrice: 1499, originalPrice: 1872,
    items: [
      { name: 'POS Terminal', price: 699 },
      { name: '15" Touch Screen', price: 449 },
      { name: 'Thermal Receipt Printer', price: 199 },
      { name: 'Barcode Scanner', price: 89 },
      { name: 'Cash Drawer', price: 79 },
    ],
  },
]

const TYPE = {
  gaming: { icon: Gamepad2, accent: 'text-violet-600 bg-violet-50', bar: 'from-violet-500 to-fuchsia-500' },
  business: { icon: Briefcase, accent: 'text-blue-600 bg-blue-50', bar: 'from-blue-600 to-indigo-500' },
  pos: { icon: Store, accent: 'text-amber-600 bg-amber-50', bar: 'from-amber-500 to-orange-500' },
} as const

export const metadata = { title: 'Bundle & Save' }

export default function BundlesPage() {
  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-14">
      {/* Header */}
      <div className="mb-12 text-center max-w-2xl mx-auto">
        <div className="inline-flex items-center gap-2 bg-white border border-amber-100 rounded-full px-4 py-1.5 text-sm text-amber-600 mb-5 shadow-sm">
          <Zap size={14} /> Save up to 20%
        </div>
        <h1 className="text-4xl md:text-5xl font-bold text-slate-900 leading-tight">
          Bundle <span className="text-gradient">&amp; Save</span>
        </h1>
        <p className="text-slate-500 mt-4 text-lg">
          Curated setups for gaming, business, and retail — pre-matched and discounted.
        </p>
      </div>

      {/* Bundles */}
      <div className="grid md:grid-cols-3 gap-6 items-start">
        {BUNDLES.map((bundle) => {
          const t = TYPE[bundle.type]
          const Icon = t.icon
          const saved = bundle.originalPrice - bundle.totalPrice
          return (
            <div
              key={bundle.id}
              className={`group relative bg-white rounded-3xl border p-6 flex flex-col transition-all duration-300 hover:-translate-y-1 hover:shadow-glow ${
                bundle.popular ? 'border-blue-200 ring-1 ring-blue-200 shadow-soft md:-mt-2' : 'border-slate-200 shadow-soft'
              }`}
            >
              {/* Accent bar */}
              <div className={`absolute inset-x-6 top-0 h-1 rounded-b-full bg-gradient-to-r ${t.bar}`} />

              {bundle.popular && (
                <span className="absolute -top-3 left-1/2 -translate-x-1/2 inline-flex items-center gap-1 bg-gradient-to-r from-blue-600 to-indigo-600 text-white text-xs font-semibold px-3 py-1 rounded-full shadow-md shadow-blue-600/25">
                  <Sparkles size={11} /> Most popular
                </span>
              )}

              <div className="flex items-center justify-between mb-4 mt-1">
                <div className="flex items-center gap-2.5">
                  <span className={`w-10 h-10 rounded-xl flex items-center justify-center ${t.accent}`}>
                    <Icon size={18} />
                  </span>
                  <span className="text-xs font-semibold uppercase tracking-widest text-slate-400">{bundle.tag}</span>
                </div>
                <span className="text-xs font-bold text-white bg-red-500 px-2 py-1 rounded-md">-{bundle.discount}%</span>
              </div>

              <h2 className="text-xl font-bold text-slate-900">{bundle.name}</h2>
              <p className="text-slate-500 text-sm mt-2 mb-5 leading-relaxed">{bundle.description}</p>

              <ul className="space-y-2.5 mb-6 flex-1">
                {bundle.items.map((item) => (
                  <li key={item.name} className="flex items-center justify-between text-sm">
                    <span className="flex items-center gap-2 text-slate-600 min-w-0">
                      <Check size={14} className="text-emerald-500 shrink-0" />
                      <span className="truncate">{item.name}</span>
                    </span>
                    <span className="text-slate-400 shrink-0 ml-2">${item.price}</span>
                  </li>
                ))}
              </ul>

              <div className="border-t border-slate-100 pt-4 mb-4">
                <div className="flex items-baseline gap-2.5">
                  <span className="text-3xl font-bold text-slate-900">${bundle.totalPrice.toLocaleString()}</span>
                  <span className="text-slate-400 line-through text-sm">${bundle.originalPrice.toLocaleString()}</span>
                  <span className="ml-auto text-xs font-semibold text-emerald-700 bg-emerald-50 px-2 py-1 rounded-md">
                    Save ${saved.toLocaleString()}
                  </span>
                </div>
              </div>

              <button className="w-full flex items-center justify-center gap-2 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-semibold py-3 rounded-xl shadow-lg shadow-blue-600/20 transition-all">
                <ShoppingCart size={16} /> Add bundle to cart
              </button>
            </div>
          )
        })}
      </div>

      {/* Custom bundle CTA */}
      <div className="mt-14 relative overflow-hidden rounded-3xl bg-gradient-to-br from-slate-900 to-indigo-950 p-10 text-center">
        <div className="absolute -top-16 -right-10 w-72 h-72 rounded-full bg-blue-500/20 blur-3xl" />
        <div className="absolute -bottom-20 -left-10 w-72 h-72 rounded-full bg-violet-500/20 blur-3xl" />
        <div className="relative">
          <h2 className="text-2xl md:text-3xl font-bold text-white mb-2">Need a custom bundle?</h2>
          <p className="text-slate-300 mb-6 max-w-xl mx-auto">
            Tell us your requirements and budget — we&apos;ll put together the perfect setup for you.
          </p>
          <a
            href="https://wa.me/96171998983?text=I%20need%20a%20custom%20bundle"
            target="_blank" rel="noopener noreferrer"
            className="inline-flex items-center gap-2 bg-white text-slate-900 font-semibold px-6 py-3 rounded-xl hover:bg-slate-100 transition-colors"
          >
            Chat with us on WhatsApp
          </a>
        </div>
      </div>
    </div>
  )
}
