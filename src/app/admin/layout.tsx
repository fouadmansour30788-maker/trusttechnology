import Link from 'next/link'
import { Package, LayoutDashboard, Database, LogOut, Boxes, ClipboardList, Truck, ShoppingBag, Users, BarChart3 } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { signOut } from './actions'

const NAV = [
  { label: 'Dashboard', href: '/admin', icon: LayoutDashboard },
  { label: 'Products', href: '/admin/products', icon: Package },
  { label: 'Sales', href: '/admin/sales', icon: ShoppingBag },
  { label: 'Customers', href: '/admin/customers', icon: Users },
  { label: 'Inventory', href: '/admin/inventory', icon: Boxes },
  { label: 'Purchase Orders', href: '/admin/purchase-orders', icon: ClipboardList },
  { label: 'Suppliers', href: '/admin/suppliers', icon: Truck },
  { label: 'Reports', href: '/admin/reports', icon: BarChart3 },
]

function NotConfigured() {
  return (
    <div className="min-h-screen flex items-center justify-center px-4 bg-slate-50">
      <div className="max-w-md text-center bg-white border border-slate-200 rounded-2xl shadow-sm p-8">
        <div className="w-12 h-12 rounded-2xl bg-blue-50 flex items-center justify-center mx-auto mb-4">
          <Database size={22} className="text-blue-600" />
        </div>
        <h1 className="text-lg font-bold text-slate-900">Connect Supabase to use the back office</h1>
        <p className="text-sm text-slate-500 mt-2 leading-relaxed">
          The back office stores products in a database. Follow <code className="text-blue-600">SUPABASE_SETUP.md</code> in
          the project root: create a free Supabase project, run the three migrations, then set
          <code className="text-slate-700"> NEXT_PUBLIC_SUPABASE_URL</code> and
          <code className="text-slate-700"> NEXT_PUBLIC_SUPABASE_ANON_KEY</code> in <code>.env.local</code> and restart.
        </p>
        <Link href="/" className="inline-block mt-6 text-sm text-slate-400 hover:text-slate-600">← Back to store</Link>
      </div>
    </div>
  )
}

export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  if (!isSupabaseConfigured()) return <NotConfigured />

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  // Unauthenticated → render bare (this is the /admin/login page).
  if (!user) return <div className="bg-slate-50 min-h-screen">{children}</div>

  return (
    <div className="flex min-h-screen bg-slate-50">
      <aside className="w-56 bg-white border-r border-slate-200 flex flex-col shrink-0">
        <div className="px-4 py-5 border-b border-slate-200">
          <div className="flex items-center gap-2">
            <div className="w-7 h-7 rounded-lg bg-gradient-to-br from-blue-600 to-blue-800 flex items-center justify-center">
              <span className="text-white font-bold text-xs">T</span>
            </div>
            <span className="font-semibold text-slate-900 text-sm">Back Office</span>
          </div>
        </div>
        <nav className="flex-1 px-3 py-4 space-y-0.5">
          {NAV.map(({ label, href, icon: Icon }) => (
            <Link key={href} href={href} className="flex items-center gap-3 px-3 py-2 rounded-lg text-sm text-slate-600 hover:text-slate-900 hover:bg-slate-100 transition-colors">
              <Icon size={16} />
              {label}
            </Link>
          ))}
        </nav>
        <div className="px-3 py-3 border-t border-slate-200">
          <p className="px-3 text-xs text-slate-400 truncate mb-2">{user.email}</p>
          <form action={signOut}>
            <button className="w-full flex items-center gap-2 px-3 py-2 rounded-lg text-sm text-slate-500 hover:text-red-600 hover:bg-red-50 transition-colors">
              <LogOut size={15} /> Sign out
            </button>
          </form>
          <Link href="/" className="block px-3 mt-1 text-xs text-slate-400 hover:text-slate-600">← Back to store</Link>
        </div>
      </aside>

      <div className="flex-1 overflow-auto">{children}</div>
    </div>
  )
}
