'use client'
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell } from 'recharts'
import type { SalesReport } from '@/lib/erp'

export function ReportsCharts({ report }: { report: SalesReport }) {
  const { revenueByMonth, topProducts } = report
  return (
    <div className="grid lg:grid-cols-2 gap-6">
      {/* Revenue by month */}
      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="font-semibold text-slate-900 text-sm mb-4">Revenue · last 6 months</p>
        <ResponsiveContainer width="100%" height={260}>
          <BarChart data={revenueByMonth} margin={{ top: 4, right: 4, bottom: 0, left: -16 }}>
            <XAxis dataKey="month" tick={{ fontSize: 12, fill: '#94a3b8' }} axisLine={false} tickLine={false} />
            <YAxis tick={{ fontSize: 12, fill: '#94a3b8' }} axisLine={false} tickLine={false} width={48} />
            <Tooltip
              cursor={{ fill: '#eff6ff' }}
              contentStyle={{ borderRadius: 12, border: '1px solid #e2e8f0', fontSize: 13 }}
              formatter={(v) => [`$${Number(v).toLocaleString()}`, 'Revenue']}
            />
            <Bar dataKey="revenue" radius={[6, 6, 0, 0]} fill="#2563eb" />
          </BarChart>
        </ResponsiveContainer>
      </div>

      {/* Top products */}
      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="font-semibold text-slate-900 text-sm mb-4">Top products by revenue</p>
        {topProducts.length === 0 ? (
          <p className="text-sm text-slate-400 py-16 text-center">No sales recorded yet.</p>
        ) : (
          <ResponsiveContainer width="100%" height={260}>
            <BarChart layout="vertical" data={topProducts} margin={{ top: 0, right: 12, bottom: 0, left: 8 }}>
              <XAxis type="number" hide />
              <YAxis type="category" dataKey="name" width={120} tick={{ fontSize: 11, fill: '#475569' }} axisLine={false} tickLine={false} tickFormatter={(v: string) => (v.length > 18 ? v.slice(0, 17) + '…' : v)} />
              <Tooltip
                cursor={{ fill: '#eff6ff' }}
                contentStyle={{ borderRadius: 12, border: '1px solid #e2e8f0', fontSize: 13 }}
                formatter={(v) => [`$${Number(v).toLocaleString()}`, 'Revenue']}
              />
              <Bar dataKey="revenue" radius={[0, 6, 6, 0]}>
                {topProducts.map((_, i) => (
                  <Cell key={i} fill={['#1e3a8a', '#2563eb', '#3b82f6', '#60a5fa', '#93c5fd', '#bfdbfe'][i] ?? '#2563eb'} />
                ))}
              </Bar>
            </BarChart>
          </ResponsiveContainer>
        )}
      </div>
    </div>
  )
}
