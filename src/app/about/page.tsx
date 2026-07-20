import Link from 'next/link'
import {
  ShieldCheck, Wallet, Activity, Cpu, MapPin, Phone, Mail,
  MessageCircle, ArrowRight, Sparkles, Package, Layers,
} from 'lucide-react'
import { CATALOG_PRODUCTS } from '@/data/products'

export const metadata = {
  title: 'About Us',
  description:
    'Trust Technology is Tripoli’s premier tech store — premium laptops, desktops, POS systems, printers, monitors and accessories, with honest pricing and genuine warranty across Lebanon.',
}

const WHATSAPP = '96171998983'

const VALUES = [
  {
    icon: ShieldCheck,
    title: 'Genuine Warranty',
    text: 'Authorized dealer — every product we sell is 100% genuine and backed by a real warranty.',
  },
  {
    icon: Wallet,
    title: 'Honest Pricing',
    text: 'Clear, fair prices with no surprises. If a price needs a quote, we say so up front.',
  },
  {
    icon: Activity,
    title: 'Same-Day Service',
    text: 'Free diagnostics, expert advice before you buy, and fast turnaround when you need help.',
  },
  {
    icon: Cpu,
    title: 'Expert Guidance',
    text: 'From a student laptop to a full POS setup for your business — we match the hardware to the job.',
  },
]

export default function AboutPage() {
  const productCount = CATALOG_PRODUCTS.length
  const brandCount = new Set(
    CATALOG_PRODUCTS.flatMap((p) => (p.tags ?? []).filter((t) => t.type === 'brand').map((t) => t.slug))
  ).size

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6">
      {/* ── Hero ─────────────────────────────────────────────── */}
      <section className="pt-16 pb-12 text-center">
        <div className="inline-flex items-center gap-2 bg-blue-50 text-blue-700 text-sm font-medium rounded-full px-4 py-1.5 mb-6">
          <Sparkles size={14} />
          Tripoli, Lebanon
        </div>
        <h1 className="text-4xl sm:text-5xl font-bold text-slate-900 tracking-tight">
          Your trusted technology partner
        </h1>
        <p className="mt-5 max-w-2xl mx-auto text-lg text-slate-500 leading-relaxed">
          Trust Technology is Tripoli’s premier tech store. We supply premium laptops,
          desktops, monitors, printers, POS systems and accessories to homes and
          businesses across Lebanon — with the advice to match.
        </p>
      </section>

      {/* ── Stats ────────────────────────────────────────────── */}
      <section className="grid grid-cols-3 gap-4 max-w-3xl mx-auto pb-16">
        {[
          { icon: Package, value: `${productCount}+`, label: 'Products in catalog' },
          { icon: Layers, value: `${brandCount}+`, label: 'Brands we carry' },
          { icon: MapPin, value: 'All Lebanon', label: 'Fast delivery' },
        ].map(({ icon: Icon, value, label }) => (
          <div
            key={label}
            className="bg-white rounded-2xl border border-slate-100 shadow-xl shadow-slate-900/5 px-4 py-6 text-center"
          >
            <span className="mx-auto mb-3 w-10 h-10 rounded-xl bg-blue-50 flex items-center justify-center">
              <Icon size={20} className="text-blue-600" />
            </span>
            <p className="text-2xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-1">{label}</p>
          </div>
        ))}
      </section>

      {/* ── Values ───────────────────────────────────────────── */}
      <section className="pb-20">
        <h2 className="text-2xl sm:text-3xl font-bold text-slate-900 text-center mb-10">
          Why people buy from us
        </h2>
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-5">
          {VALUES.map(({ icon: Icon, title, text }) => (
            <div
              key={title}
              className="bg-white rounded-2xl border border-slate-100 shadow-xl shadow-slate-900/5 p-6"
            >
              <span className="w-11 h-11 rounded-xl bg-blue-50 flex items-center justify-center mb-4">
                <Icon size={22} className="text-blue-600" />
              </span>
              <p className="font-semibold text-slate-900 mb-2">{title}</p>
              <p className="text-sm text-slate-500 leading-relaxed">{text}</p>
            </div>
          ))}
        </div>
      </section>

      {/* ── Business clients ────────────────────────────────── */}
      <section className="pb-20">
        <div className="grid lg:grid-cols-2 gap-10 items-center">
          <div>
            <div className="inline-flex items-center gap-2 bg-blue-50 text-blue-700 text-sm font-medium rounded-full px-4 py-1.5 mb-5">
              <Cpu size={14} />
              For businesses
            </div>
            <h2 className="text-2xl sm:text-3xl font-bold text-slate-900">
              Equipping teams, not just individuals
            </h2>
            <p className="mt-4 text-slate-500 leading-relaxed">
              From a single POS setup to fleet laptops for a growing office, we work with
              Tripoli businesses on bulk pricing, delivery scheduling, and after-sales
              support — so your team is never waiting on hardware.
            </p>
            <a
              href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent('Hi! I would like to talk about equipment for my business.')}`}
              target="_blank"
              rel="noopener noreferrer"
              className="mt-6 inline-flex items-center gap-2 text-blue-600 hover:text-blue-700 font-semibold"
            >
              Talk to us about your business <ArrowRight size={16} />
            </a>
          </div>
          <div className="rounded-3xl overflow-hidden border border-slate-100 shadow-xl shadow-slate-900/5 aspect-video bg-slate-900">
            <video
              src="/about/business-professionals.mp4"
              autoPlay muted loop playsInline preload="metadata"
              className="w-full h-full object-cover"
            />
          </div>
        </div>
      </section>

      {/* ── Contact ──────────────────────────────────────────── */}
      <section id="contact" className="pb-20 scroll-mt-24">
        <div className="rounded-3xl bg-gradient-to-br from-blue-600 to-blue-800 shadow-2xl shadow-blue-600/30 px-6 sm:px-12 py-12">
          <div className="grid lg:grid-cols-2 gap-10 items-center">
            <div>
              <h2 className="text-2xl sm:text-3xl font-bold text-white">Talk to us</h2>
              <p className="mt-3 text-blue-100 leading-relaxed">
                Questions about a product, a quote for your business, or not sure what
                to buy? Message us on WhatsApp — it’s the fastest way to reach the team.
              </p>
              <a
                href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent('Hi Trust Technology! I have a question.')}`}
                target="_blank"
                rel="noopener noreferrer"
                className="mt-6 inline-flex items-center gap-2 bg-white text-blue-700 font-semibold rounded-xl px-6 py-3 shadow-lg hover:bg-blue-50 transition-colors"
              >
                <MessageCircle size={18} /> Chat on WhatsApp
              </a>
            </div>
            <div className="space-y-4">
              {[
                { icon: Phone, label: 'Phone / WhatsApp', value: '+961 71 998 983', href: `https://wa.me/${WHATSAPP}` },
                { icon: Mail, label: 'Email', value: 'info@trust-tech.lb', href: 'mailto:info@trust-tech.lb' },
                { icon: MapPin, label: 'Store', value: 'Tripoli, Lebanon', href: null },
              ].map(({ icon: Icon, label, value, href }) => (
                <div key={label} className="flex items-center gap-4 bg-white/10 rounded-2xl px-5 py-4">
                  <span className="w-10 h-10 rounded-xl bg-white/15 flex items-center justify-center shrink-0">
                    <Icon size={18} className="text-white" />
                  </span>
                  <div>
                    <p className="text-xs text-blue-200">{label}</p>
                    {href ? (
                      <a href={href} className="text-white font-medium hover:underline" target={href.startsWith('http') ? '_blank' : undefined} rel="noopener noreferrer">
                        {value}
                      </a>
                    ) : (
                      <p className="text-white font-medium">{value}</p>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* ── CTA ──────────────────────────────────────────────── */}
      <section className="pb-8 text-center">
        <h2 className="text-2xl font-bold text-slate-900">Ready to find your next device?</h2>
        <div className="mt-6 flex flex-wrap justify-center gap-3">
          <Link
            href="/products"
            className="inline-flex items-center gap-2 bg-blue-600 text-white font-semibold rounded-xl px-6 py-3 shadow-lg shadow-blue-600/30 hover:bg-blue-700 transition-colors"
          >
            Browse products <ArrowRight size={16} />
          </Link>
          <Link
            href="/recommend"
            className="inline-flex items-center gap-2 bg-white text-slate-700 font-semibold rounded-xl px-6 py-3 border border-slate-200 hover:bg-slate-50 transition-colors"
          >
            <Sparkles size={16} className="text-blue-600" /> Ask the AI advisor
          </Link>
        </div>
      </section>
    </div>
  )
}
