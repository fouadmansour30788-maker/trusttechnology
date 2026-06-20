'use client'
import { useState, useRef, useEffect } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { ShoppingCart, Search, Menu, X, ChevronDown } from 'lucide-react'
import { MegaMenu } from './MegaMenu'
import { NAV_CATEGORIES } from '@/lib/nav-data'
import { useCartStore } from '@/store/cart'

export function Navbar() {
  const [activeMenu, setActiveMenu] = useState<string | null>(null)
  const [mobileOpen, setMobileOpen] = useState(false)
  const [searchOpen, setSearchOpen] = useState(false)
  const navRef = useRef<HTMLDivElement>(null)
  const router = useRouter()
  const totalItems = useCartStore((s) => s.totalItems())
  const openCart = useCartStore((s) => s.openCart)

  function handleSearch(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    const value = new FormData(e.currentTarget).get('q')?.toString().trim()
    setSearchOpen(false)
    if (value) router.push(`/products?q=${encodeURIComponent(value)}`)
  }

  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (navRef.current && !navRef.current.contains(e.target as Node)) {
        setActiveMenu(null)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  return (
    <header ref={navRef} className="sticky top-0 z-50 bg-white border-b border-slate-200 shadow-sm shadow-slate-900/5">
      <div className="max-w-7xl mx-auto px-4 sm:px-6">
        <div className="flex items-center h-16 gap-6">

          {/* Logo */}
          <Link href="/" className="flex items-center gap-2 shrink-0" onClick={() => setActiveMenu(null)}>
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-blue-600 to-indigo-600 flex items-center justify-center shadow-md shadow-blue-600/30">
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
              className="px-3 py-2 text-sm text-amber-600 hover:text-amber-700 rounded-lg hover:bg-amber-50 transition-colors font-medium"
              onClick={() => setActiveMenu(null)}
            >
              Bundle & Save
            </Link>
          </nav>

          {/* Right Actions */}
          <div className="flex items-center gap-2 ml-auto">
            {searchOpen ? (
              <form
                onSubmit={handleSearch}
                className="flex items-center gap-2 bg-slate-100 rounded-lg px-3 py-1.5 border border-slate-200 focus-within:border-blue-400 transition-colors"
              >
                <Search size={16} className="text-slate-400" />
                <input
                  autoFocus
                  type="text"
                  name="q"
                  placeholder="Search products..."
                  className="bg-transparent text-sm text-slate-900 placeholder-slate-400 outline-none w-40 md:w-64"
                  onBlur={() => setSearchOpen(false)}
                />
              </form>
            ) : (
              <button
                onClick={() => window.dispatchEvent(new Event('open-command-palette'))}
                className="p-2 text-slate-500 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
                title="Search (⌘K)"
              >
                <Search size={20} />
              </button>
            )}

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
              className="block px-3 py-2 text-sm text-amber-600 font-medium rounded-lg hover:bg-amber-50"
            >
              Bundle & Save
            </Link>
          </div>
        </div>
      )}
    </header>
  )
}
