import Link from 'next/link'
import { Sparkles, MessageCircle, Flame } from 'lucide-react'
import { HeroSection } from '@/components/home/HeroSection'
import { ProductShowcase3D } from '@/components/home/ProductShowcase3D'
import { BentoGrid } from '@/components/home/BentoGrid'
import { BrandMarquee } from '@/components/home/BrandMarquee'
import { WhyChooseUs } from '@/components/home/WhyChooseUs'
import { Testimonials } from '@/components/home/Testimonials'
import { ProductCard } from '@/components/products/ProductCard'
import { getProducts } from '@/lib/db'
import { getStoreTrending } from '@/lib/trending'
import type { Product } from '@/lib/types'

// Preferred showcase (all carry photos, verified real/clean, one per category);
// falls back to is_featured / first with images if these ever go stale.
const FEATURED_SLUGS = [
  'asus-rog-strix-scar-edition-18-g835lx-s9113',
  'lenovo-thinkpad-t14-g6',
  'apple-macbook-pro-16-m5-max-48gb-2tb-ssd-space-black',
  'seagate-24000-mah',
  'lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz',
  'canon-clj-mf657cdw-toner-canon-067-bk-c-m-y',
  'lenovo-tiny-thinkcenter-neo-50q-13b9004uex',
  'appostars-ap-3069-g8-new-metal-stand-l10-plastic-case-21-5-capacitive-true-flat-',
]

// Never show two products that share the same photo — a stale/short
// FEATURED_SLUGS list previously fell through to "first N with images" and
// surfaced near-duplicate catalog entries (e.g. the same printer listed
// under two SKUs) side by side.
function dedupeByImage(products: Product[]): Product[] {
  const seen = new Set<string>()
  return products.filter((p) => {
    const key = p.images[0] ?? p.id
    if (seen.has(key)) return false
    seen.add(key)
    return true
  })
}

function pickFeatured(all: Product[]): Product[] {
  const bySlug = FEATURED_SLUGS.map((s) => all.find((p) => p.slug === s)).filter(Boolean) as Product[]
  if (bySlug.length >= 4) return dedupeByImage(bySlug).slice(0, 8)
  const flagged = all.filter((p) => p.is_featured && p.images.length)
  const withImg = all.filter((p) => p.images.length)
  return dedupeByImage([...new Set([...bySlug, ...flagged, ...withImg])]).slice(0, 8)
}

export const dynamic = 'force-dynamic'

export default async function HomePage() {
  const allProducts = await getProducts()
  const FEATURED_PRODUCTS = pickFeatured(allProducts)
  const trending = await getStoreTrending(allProducts)
  return (
    <>
      <HeroSection />
      <ProductShowcase3D products={FEATURED_PRODUCTS.slice(0, 3)} />
      <BrandMarquee />
      <BentoGrid />
      <WhyChooseUs />

      {/* Trending Now — most-viewed products, last 7 days */}
      {trending.length >= 4 && (
        <section className="max-w-7xl mx-auto px-4 sm:px-6 pt-16">
          <div className="flex items-center gap-2 mb-8">
            <Flame size={20} className="text-orange-500" />
            <h2 className="text-3xl font-bold text-slate-900">Trending Now</h2>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            {trending.map(({ product, views }, i) => (
              <div key={product.id} className="relative h-full flex flex-col">
                <span className="absolute -top-2 -left-2 z-20 w-7 h-7 rounded-full bg-orange-500 text-white text-xs font-bold flex items-center justify-center shadow-lg shadow-orange-500/30 ring-2 ring-white">
                  {i + 1}
                </span>
                <div className="flex-1">
                  <ProductCard product={product} />
                </div>
                <p className="mt-1.5 text-center text-xs text-slate-400">
                  {views} view{views === 1 ? '' : 's'} this week
                </p>
              </div>
            ))}
          </div>
        </section>
      )}

      {/* Featured Products */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 py-16">
        <div className="flex items-center justify-between mb-8">
          <div>
            <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-1">Hand-picked</p>
            <h2 className="text-3xl font-bold text-slate-900">Featured Products</h2>
          </div>
          <Link href="/products" className="text-sm font-medium text-blue-600 hover:text-blue-700 transition-colors">
            View all →
          </Link>
        </div>
        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
          {FEATURED_PRODUCTS.map((p) => (
            <ProductCard key={p.id} product={p} />
          ))}
        </div>
      </section>

      <Testimonials />

      {/* Final CTA band */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 pb-20">
        <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-blue-600 to-blue-900 p-10 md:p-14 shadow-2xl shadow-blue-600/20">
          <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff14_1px,transparent_1px),linear-gradient(to_bottom,#ffffff14_1px,transparent_1px)] bg-[size:2.5rem_2.5rem] [mask-image:radial-gradient(ellipse_at_top_right,black,transparent_70%)]" />
          <div className="absolute -top-16 -right-10 w-72 h-72 rounded-full bg-white/10 blur-3xl" />
          <div className="relative flex flex-col md:flex-row items-start md:items-center justify-between gap-6">
            <div className="max-w-xl">
              <div className="inline-flex items-center gap-2 bg-white/15 text-white text-xs font-semibold uppercase tracking-widest px-3 py-1 rounded-full mb-4">
                <Sparkles size={12} /> Here to help
              </div>
              <h2 className="text-3xl md:text-4xl font-bold text-white leading-tight">Need help choosing the right tech?</h2>
              <p className="text-blue-100 mt-3 text-lg">
                Use our smart recommendation wizard, or chat with our team on WhatsApp — we reply within minutes.
              </p>
            </div>
            <div className="flex flex-col sm:flex-row gap-3 shrink-0">
              <Link
                href="/recommend"
                className="inline-flex items-center justify-center gap-2 bg-white text-blue-700 font-bold px-6 py-3.5 rounded-2xl hover:bg-blue-50 transition-colors"
              >
                <Sparkles size={18} /> Find My Setup
              </Link>
              <a
                href={`https://wa.me/9613393002?text=${encodeURIComponent('Hi Trust Technology! I need help choosing the right tech.')}`}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center justify-center gap-2 bg-emerald-500 hover:bg-emerald-400 text-white font-semibold px-6 py-3.5 rounded-2xl transition-colors"
              >
                <MessageCircle size={18} /> WhatsApp
              </a>
            </div>
          </div>
        </div>
      </section>
    </>
  )
}
