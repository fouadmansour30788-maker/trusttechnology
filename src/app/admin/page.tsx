import { Package, ShoppingBag, Tag, TrendingUp } from 'lucide-react'

const STATS = [
  { label: 'Total Products', value: '124', change: '+12 this month', icon: Package, color: 'text-blue-400' },
  { label: 'Total Orders', value: '38', change: '+5 this week', icon: ShoppingBag, color: 'text-green-400' },
  { label: 'Categories', value: '6', change: '', icon: Tag, color: 'text-purple-400' },
  { label: 'Revenue (MTD)', value: '$14,820', change: '+22% vs last month', icon: TrendingUp, color: 'text-amber-400' },
]

const RECENT_ORDERS = [
  { id: 'ORD-001', customer: 'Ahmad K.', total: '$1,299', status: 'confirmed', date: 'Today' },
  { id: 'ORD-002', customer: 'Sara M.', total: '$649', status: 'pending', date: 'Today' },
  { id: 'ORD-003', customer: 'Nour H.', total: '$3,199', status: 'shipped', date: 'Yesterday' },
  { id: 'ORD-004', customer: 'Karim R.', total: '$329', status: 'delivered', date: '2 days ago' },
]

const STATUS_COLORS: Record<string, string> = {
  pending: 'bg-amber-600/20 text-amber-400',
  confirmed: 'bg-blue-600/20 text-blue-400',
  shipped: 'bg-purple-600/20 text-purple-400',
  delivered: 'bg-green-600/20 text-green-400',
}

export default function AdminDashboard() {
  return (
    <div className="p-8">
      <div className="mb-8">
        <h1 className="text-2xl font-bold text-white">Dashboard</h1>
        <p className="text-zinc-500 text-sm mt-1">Trust Technology — Admin Overview</p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        {STATS.map(({ label, value, change, icon: Icon, color }) => (
          <div key={label} className="bg-zinc-900 border border-zinc-800 rounded-2xl p-5">
            <div className="flex items-center justify-between mb-3">
              <span className="text-zinc-500 text-sm">{label}</span>
              <Icon size={18} className={color} />
            </div>
            <p className="text-2xl font-bold text-white">{value}</p>
            {change && <p className="text-zinc-500 text-xs mt-1">{change}</p>}
          </div>
        ))}
      </div>

      <div className="grid lg:grid-cols-2 gap-6">
        {/* Recent Orders */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6">
          <div className="flex items-center justify-between mb-5">
            <h2 className="font-semibold text-white">Recent Orders</h2>
            <a href="/admin/orders" className="text-xs text-blue-400 hover:text-blue-300">View all</a>
          </div>
          <div className="space-y-3">
            {RECENT_ORDERS.map((order) => (
              <div key={order.id} className="flex items-center justify-between py-2 border-b border-zinc-800 last:border-0">
                <div>
                  <p className="text-sm text-white font-medium">{order.customer}</p>
                  <p className="text-xs text-zinc-500">{order.id} · {order.date}</p>
                </div>
                <div className="flex items-center gap-3">
                  <span className={`text-xs px-2 py-0.5 rounded-md ${STATUS_COLORS[order.status]}`}>
                    {order.status}
                  </span>
                  <span className="text-sm font-semibold text-white">{order.total}</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Quick Actions */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6">
          <h2 className="font-semibold text-white mb-5">Quick Actions</h2>
          <div className="grid grid-cols-2 gap-3">
            {[
              { label: 'Add Product', href: '/admin/products/new', icon: Package },
              { label: 'View Orders', href: '/admin/orders', icon: ShoppingBag },
              { label: 'Manage Tags', href: '/admin/tags', icon: Tag },
              { label: 'Go to Store', href: '/', icon: TrendingUp },
            ].map(({ label, href, icon: Icon }) => (
              <a
                key={href}
                href={href}
                className="flex items-center gap-3 p-4 bg-zinc-800 hover:bg-zinc-700 rounded-xl transition-colors text-sm text-zinc-300 hover:text-white"
              >
                <Icon size={16} className="text-blue-400" />
                {label}
              </a>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
