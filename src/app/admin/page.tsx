import Link from 'next/link'
import { Package, CheckCircle, AlertTriangle, Phone, Plus, ArrowRight } from 'lucide-react'
import { getAdminStats } from '@/lib/db'

export const dynamic = 'force-dynamic'

export default async function AdminDashboard() {
  const s = await getAdminStats()
  const cards = [
    { label: 'Total products', value: s.products, icon: Package, color: 'text-blue-600 bg-blue-50' },
    { label: 'Active', value: s.active, icon: CheckCircle, color: 'text-emerald-600 bg-emerald-50' },
    { label: 'Out of stock', value: s.outOfStock, icon: AlertTriangle, color: 'text-amber-600 bg-amber-50' },
    { label: 'Call for price', value: s.callForPrice, icon: Phone, color: 'text-indigo-600 bg-indigo-50' },
  ]
  return (
    <div className="p-8">
      <div className="flex items-center justify-between mb-8">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Dashboard</h1>
          <p className="text-slate-500 text-sm mt-0.5">Overview of your catalog.</p>
        </div>
        <Link href="/admin/products/new" className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-indigo-600 text-white text-sm font-semibold px-4 py-2.5 rounded-xl shadow-lg shadow-blue-600/20">
          <Plus size={16} /> Add product
        </Link>
      </div>

      <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        {cards.map(({ label, value, icon: Icon, color }) => (
          <div key={label} className="bg-white border border-slate-200 rounded-2xl p-5">
            <div className={`w-10 h-10 rounded-xl flex items-center justify-center mb-3 ${color}`}>
              <Icon size={18} />
            </div>
            <p className="text-3xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-0.5">{label}</p>
          </div>
        ))}
      </div>

      <Link href="/admin/products" className="group inline-flex items-center gap-2 text-sm font-medium text-blue-600 hover:text-blue-700">
        Manage products <ArrowRight size={15} className="group-hover:translate-x-0.5 transition-transform" />
      </Link>
    </div>
  )
}
