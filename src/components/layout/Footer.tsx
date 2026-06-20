import Link from 'next/link'
import { MapPin, Phone, Mail } from 'lucide-react'

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
                { label: 'Bundle & Save', href: '/bundles' },
                { label: 'Apple Collection', href: '/categories/apple' },
                { label: 'Deals', href: '/products?sale=true' },
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
              {['About Us', 'Contact', 'Warranty Policy', 'Returns'].map((item) => (
                <li key={item}>
                  <span className="hover:text-blue-600 transition-colors cursor-pointer">{item}</span>
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
