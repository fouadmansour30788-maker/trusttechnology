'use client'
import { useState, useRef, useEffect } from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { ShoppingCart, Search, Menu, X, ChevronDown, User } from 'lucide-react'
import { MegaMenu } from './MegaMenu'
import { NAV_CATEGORIES } from '@/lib/nav-data'
import { useCartStore } from '@/store/cart'

export function Navbar() {
  const [activeMenu, setActiveMenu] = useState<string | null>(null)
  const [mobileOpen, setMobileOpen] = useState(false)
  const navRef = useRef<HTMLDivElement>(null)
  const totalItems = useCartStore((s) => s.totalItems())
  const openCart = useCartStore((s) => s.openCart)
  const [session, setSession] = useState<{ loggedIn: boolean; name: string | null } | null>(null)

  // On the homepage the nav floats transparent over the hero, like Apple's
  // product pages, then solidifies into a frosted bar once you scroll past
  // it. Every other page has no hero to float over, so it stays solid.
  const pathname = usePathname()
  const isHome = pathname === '/'
  const [scrolled, setScrolled] = useState(!isHome)
  useEffect(() => {
    if (!isHome) { setScrolled(true); return }
    function onScroll() { setScrolled(window.scrollY > 40) }
    onScroll()
    window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [isHome])

  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (navRef.current && !navRef.current.contains(e.target as Node)) {
        setActiveMenu(null)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  useEffect(() => {
    fetch('/api/auth/session').then((r) => r.json()).then(setSession).catch(() => {})
  }, [])

  return (
    <header
      ref={navRef}
      className={`sticky top-0 z-50 transition-[background-color,border-color,box-shadow,backdrop-filter] duration-300 ${
        scrolled
          ? 'bg-white/80 backdrop-blur-xl border-b border-slate-200 shadow-sm shadow-slate-900/5'
          : 'bg-transparent border-b border-transparent shadow-none'
      }`}
    >
      <div className="max-w-7xl mx-auto px-4 sm:px-6">
        <div className="flex items-center h-16 gap-6">

          {/* Logo */}
          <Link href="/" className="flex items-center gap-2 shrink-0" onClick={() => setActiveMenu(null)}>
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-blue-600 to-blue-800 flex items-center justify-center shadow-md shadow-blue-600/30">
              <span className="text-white font-bold text-sm">T</span>
            </div>
            <span className="font-bold text-slate-900 text-lg hidden sm:block">Trust Technology</span>
          </Link>

          {/* Desktop Nav */}
          <nav className="hidden lg:flex items-center gap-1 flex-1">
            {NAV_CATEGORIES.map((cat) => (
              <button
                key={cat.slug}
                onMouseEnter={() => setActiveMenu(cat.slug)}
                onClick={() => setActiveMenu(activeMenu === cat.slug ? null : cat.slug)}
                className={`flex items-center gap-1 px-3 py-2 text-sm rounded-lg transition-colors ${
                  activeMenu === cat.slug
                    ? 'text-blue-600 bg-blue-50'
                    : 'text-slate-600 hover:text-slate-900 hover:bg-slate-100'
                }`}
              >
                {cat.label}
                <ChevronDown
                  size={14}
                  className={`transition-transform ${activeMenu === cat.slug ? 'rotate-180' : ''}`}
                />
              </button>
            ))}
            <Link
              href="/bundles"
              className="px-3 py-2 text-sm text-blue-600 hover:text-blue-700 rounded-lg hover:bg-blue-50 transition-colors font-medium"
              onClick={() => setActiveMenu(null)}
            >
              Bundle & Save
            </Link>
            <Link
              href="/deals"
              className="px-3 py-2 text-sm text-red-600 hover:text-red-700 rounded-lg hover:bg-red-50 transition-colors font-medium"
              onClick={() => setActiveMenu(null)}
            >
              Deals
            </Link>
            <Link
              href="/about"
              className="px-3 py-2 text-sm text-slate-600 hover:text-slate-900 rounded-lg hover:bg-slate-100 transition-colors"
              onClick={() => setActiveMenu(null)}
            >
              About
            </Link>
          </nav>

          {/* Right Actions */}
          <div className="flex items-center gap-2 ml-auto">
            {/* Persistent, always-visible search trigger — opens the full search palette */}
            <button
              onClick={() => window.dispatchEvent(new Event('open-command-palette'))}
              className="hidden md:flex items-center gap-2 w-44 lg:w-72 bg-slate-50 hover:bg-white border-2 border-slate-200 hover:border-blue-400 rounded-xl px-3.5 py-2 text-sm text-slate-400 hover:text-slate-500 transition-colors shadow-sm"
            >
              <Search size={16} className="shrink-0" />
              <span className="flex-1 text-left truncate">Search products...</span>
              <kbd className="hidden lg:inline-block text-[10px] font-semibold text-slate-400 bg-white border border-slate-200 px-1.5 py-0.5 rounded">⌘K</kbd>
            </button>
            <button
              onClick={() => window.dispatchEvent(new Event('open-command-palette'))}
              className="md:hidden p-2 text-slate-500 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
              title="Search (⌘K)"
            >
              <Search size={20} />
            </button>

            <button
              onClick={openCart}
              className="relative p-2 text-slate-500 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
            >
              <ShoppingCart size={20} />
              {totalItems > 0 && (
                <span className="absolute -top-0.5 -right-0.5 w-5 h-5 bg-blue-600 rounded-full text-xs text-white flex items-center justify-center font-medium">
                  {totalItems > 9 ? '9+' : totalItems}
                </span>
              )}
            </button>

            {session?.loggedIn ? (
              <Link
                href="/account"
                title={session.name ? `Hi, ${session.name}` : 'Your account'}
                className="p-2 text-slate-500 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
              >
                <User size={20} />
              </Link>
            ) : (
              <div className="hidden sm:flex items-center gap-1">
                <Link
                  href="/login"
                  className="px-3 py-1.5 text-sm text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
                >
                  Log in
                </Link>
                <Link
                  href="/register"
                  className="px-3.5 py-1.5 text-sm font-semibold text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors"
                >
                  Sign up
                </Link>
              </div>
            )}
            {!session?.loggedIn && (
              <Link
                href="/login"
                title="Log in / Sign up"
                className="sm:hidden p-2 text-slate-500 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
              >
                <User size={20} />
              </Link>
            )}

            <Link
              href="/admin"
              className="hidden sm:flex items-center gap-1 px-3 py-1.5 text-sm text-slate-500 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
            >
              Admin
            </Link>

            {/* Mobile menu toggle */}
            <button
              onClick={() => setMobileOpen(!mobileOpen)}
              className="lg:hidden p-2 text-slate-500 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
            >
              {mobileOpen ? <X size={20} /> : <Menu size={20} />}
            </button>
          </div>
        </div>
      </div>

      {/* Mega Menu Dropdown */}
      {activeMenu && (
        <div onMouseLeave={() => setActiveMenu(null)}>
          {NAV_CATEGORIES.filter((c) => c.slug === activeMenu).map((cat) => (
            <MegaMenu key={cat.slug} category={cat} onClose={() => setActiveMenu(null)} />
          ))}
        </div>
      )}

      {/* Mobile Nav */}
      {mobileOpen && (
        <div className="lg:hidden border-t border-slate-200 bg-white">
          <div className="px-4 py-4 space-y-1 max-h-[70vh] overflow-y-auto">
            {NAV_CATEGORIES.map((cat) => (
              <div key={cat.slug}>
                <button
                  onClick={() =>
                    setActiveMenu(activeMenu === cat.slug ? null : cat.slug)
                  }
                  className="w-full flex items-center justify-between px-3 py-2 text-sm text-slate-700 rounded-lg hover:bg-slate-100"
                >
                  {cat.label}
                  <ChevronDown
                    size={14}
                    className={`transition-transform ${activeMenu === cat.slug ? 'rotate-180' : ''}`}
                  />
                </button>
                {activeMenu === cat.slug && (
                  <div className="pl-4 mt-1 space-y-1">
                    {cat.columns.flatMap((col) =>
                      col.items.map((item) => (
                        <Link
                          key={item.slug}
                          href={`/categories/${item.slug}`}
                          onClick={() => setMobileOpen(false)}
                          className="block px-3 py-1.5 text-sm text-slate-500 hover:text-blue-600 rounded-lg hover:bg-slate-100"
                        >
                          {item.label}
                        </Link>
                      ))
                    )}
                  </div>
                )}
              </div>
            ))}
            <Link
              href="/bundles"
              onClick={() => setMobileOpen(false)}
              className="block px-3 py-2 text-sm text-blue-600 font-medium rounded-lg hover:bg-blue-50"
            >
              Bundle & Save
            </Link>
            <Link
              href="/deals"
              onClick={() => setMobileOpen(false)}
              className="block px-3 py-2 text-sm text-red-600 font-medium rounded-lg hover:bg-red-50"
            >
              Deals
            </Link>
            <Link
              href="/about"
              onClick={() => setMobileOpen(false)}
              className="block px-3 py-2 text-sm text-slate-700 rounded-lg hover:bg-slate-100"
            >
              About
            </Link>
            {!session?.loggedIn && (
              <div className="flex gap-2 pt-2 mt-2 border-t border-slate-100">
                <Link
                  href="/login"
                  onClick={() => setMobileOpen(false)}
                  className="flex-1 text-center px-3 py-2 text-sm font-medium text-slate-700 border border-slate-200 rounded-lg hover:bg-slate-100"
                >
                  Log in
                </Link>
                <Link
                  href="/register"
                  onClick={() => setMobileOpen(false)}
                  className="flex-1 text-center px-3 py-2 text-sm font-semibold text-white bg-blue-600 hover:bg-blue-700 rounded-lg"
                >
                  Sign up
                </Link>
              </div>
            )}
          </div>
        </div>
      )}
    </header>
  )
}
