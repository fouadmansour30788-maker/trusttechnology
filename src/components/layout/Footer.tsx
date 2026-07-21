import Link from 'next/link'
import { MapPin, Phone, Mail, MessageCircle } from 'lucide-react'

const FACEBOOK_URL = 'https://www.facebook.com/trusttechnology.lb/'
const WHATSAPP_URL = 'https://wa.me/96171998983'

function FacebookIcon({ size = 15 }: { size?: number }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
      <path d="M22 12.06C22 6.5 17.52 2 12 2S2 6.5 2 12.06c0 5.02 3.66 9.18 8.44 9.94v-7.03H7.9v-2.91h2.54V9.85c0-2.51 1.49-3.9 3.77-3.9 1.09 0 2.24.2 2.24.2v2.46h-1.26c-1.24 0-1.63.77-1.63 1.56v1.88h2.78l-.44 2.91h-2.34V22c4.78-.76 8.44-4.92 8.44-9.94Z" />
    </svg>
  )
}

export function Footer() {
  return (
    <footer className="bg-white border-t border-slate-200 mt-24">
      <div className="max-w-7xl mx-auto px-6 py-12">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
          <div className="col-span-2 md:col-span-1">
            <div className="flex items-center gap-2 mb-4">
              <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-blue-600 to-blue-800 flex items-center justify-center shadow-md shadow-blue-600/30">
                <span className="text-white font-bold text-sm">T</span>
              </div>
              <span className="font-bold text-slate-900">Trust Technology</span>
            </div>
            <p className="text-slate-500 text-sm leading-relaxed">
              Your trusted technology partner in Tripoli. Premium products, expert service.
            </p>
            <div className="mt-4 space-y-2 text-sm text-slate-500">
              <div className="flex items-center gap-2">
                <MapPin size={14} />
                <span>Tripoli, Lebanon</span>
              </div>
              <div className="flex items-center gap-2">
                <Phone size={14} />
                <span>+961 71 998 983</span>
              </div>
              <div className="flex items-center gap-2">
                <Mail size={14} />
                <span>info@trust-tech.lb</span>
              </div>
            </div>
            <div className="flex items-center gap-2 mt-4">
              <a href={FACEBOOK_URL} target="_blank" rel="noopener noreferrer" aria-label="Facebook"
                className="w-8 h-8 rounded-lg bg-slate-100 hover:bg-blue-50 text-slate-500 hover:text-blue-600 flex items-center justify-center transition-colors">
                <FacebookIcon size={15} />
              </a>
              <a href={WHATSAPP_URL} target="_blank" rel="noopener noreferrer" aria-label="WhatsApp"
                className="w-8 h-8 rounded-lg bg-slate-100 hover:bg-emerald-50 text-slate-500 hover:text-emerald-600 flex items-center justify-center transition-colors">
                <MessageCircle size={15} />
              </a>
            </div>
          </div>

          <div>
            <p className="text-sm font-semibold text-slate-900 mb-4">Products</p>
            <ul className="space-y-2 text-sm text-slate-500">
              {['Computing', 'Peripherals', 'Displays', 'Printing', 'Professional'].map((item) => (
                <li key={item}>
                  <Link href={`/categories/${item.toLowerCase()}`} className="hover:text-blue-600 transition-colors">
                    {item}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          <div>
            <p className="text-sm font-semibold text-slate-900 mb-4">Store</p>
            <ul className="space-y-2 text-sm text-slate-500">
              {[
                { label: 'AI Setup Builder', href: '/setup-builder' },
                { label: 'Bundle & Save', href: '/bundles' },
                { label: 'Apple Collection', href: '/categories/apple' },
                { label: 'Deals', href: '/deals' },
                { label: 'New Arrivals', href: '/products?sort=newest' },
              ].map((item) => (
                <li key={item.href}>
                  <Link href={item.href} className="hover:text-blue-600 transition-colors">
                    {item.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          <div>
            <p className="text-sm font-semibold text-slate-900 mb-4">Support</p>
            <ul className="space-y-2 text-sm text-slate-500">
              {[
                { label: 'About Us', href: '/about' },
                { label: 'Contact', href: '/about#contact' },
                { label: 'Track Order', href: '/track' },
                { label: 'Repairs & Service', href: '/repairs' },
                { label: 'Warranty Policy', href: '/warranty' },
                { label: 'Returns & Exchange', href: '/returns' },
                { label: 'FAQ', href: '/faq' },
                { label: 'Buying Guides', href: '/guides' },
              ].map((item) => (
                <li key={item.href}>
                  <Link href={item.href} className="hover:text-blue-600 transition-colors">
                    {item.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        </div>

        <div className="mt-10 pt-6 border-t border-slate-200 flex flex-col sm:flex-row justify-between items-center gap-4 text-xs text-slate-400">
          <p>© 2026 Trust Technology. All rights reserved.</p>
          <p>Tripoli, Lebanon</p>
        </div>
      </div>
    </footer>
  )
}
