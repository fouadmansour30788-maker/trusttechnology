'use client'
import {
  LineChart, Line, BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell,
  FunnelChart, Funnel, LabelList, CartesianGrid,
} from 'recharts'
import type { SalesReport } from '@/lib/erp'

const tip = { borderRadius: 12, border: '1px solid #e2e8f0', fontSize: 13 } as const

export function ReportsCharts({ report }: { report: SalesReport }) {
  const { revenueByMonth, topProducts, funnel } = report
  return (
    <div className="space-y-6">
      <div className="grid lg:grid-cols-3 gap-6">
        {/* Revenue trend (line) */}
        <div className="lg:col-span-2 bg-white border border-slate-200 rounded-2xl p-5">
          <p className="font-semibold text-slate-900 text-sm mb-4">Revenue trend · last 6 months</p>
          <ResponsiveContainer width="100%" height={260}>
            <LineChart data={revenueByMonth} margin={{ top: 6, right: 8, bottom: 0, left: -12 }}>
              <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" vertical={false} />
              <XAxis dataKey="month" tick={{ fontSize: 12, fill: '#94a3b8' }} axisLine={false} tickLine={false} />
              <YAxis tick={{ fontSize: 12, fill: '#94a3b8' }} axisLine={false} tickLine={false} width={48} />
              <Tooltip contentStyle={tip} formatter={(v) => [`$${Number(v).toLocaleString()}`, 'Revenue']} />
              <Line type="monotone" dataKey="revenue" stroke="#2563eb" strokeWidth={3} dot={{ r: 4, fill: '#2563eb' }} activeDot={{ r: 6 }} />
            </LineChart>
          </ResponsiveContainer>
        </div>

        {/* Order funnel */}
        <div className="bg-white border border-slate-200 rounded-2xl p-5">
          <p className="font-semibold text-slate-900 text-sm mb-4">Order funnel</p>
          {funnel.every((f) => f.count === 0) ? (
            <p className="text-sm text-slate-400 py-16 text-center">No orders yet.</p>
          ) : (
            <ResponsiveContainer width="100%" height={260}>
              <FunnelChart>
                <Tooltip contentStyle={tip} />
                <Funnel dataKey="count" data={funnel} isAnimationActive>
                  <LabelList position="right" fill="#475569" stroke="none" dataKey="stage" className="text-xs" />
                  <LabelList position="left" fill="#0f172a" stroke="none" dataKey="count" className="text-xs font-semibold" />
                </Funnel>
              </FunnelChart>
            </ResponsiveContainer>
          )}
        </div>
      </div>

      {/* Top products */}
      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="font-semibold text-slate-900 text-sm mb-4">Top products by revenue</p>
        {topProducts.length === 0 ? (
          <p className="text-sm text-slate-400 py-16 text-center">No sales recorded yet.</p>
        ) : (
          <ResponsiveContainer width="100%" height={Math.max(180, topProducts.length * 44)}>
            <BarChart layout="vertical" data={topProducts} margin={{ top: 0, right: 16, bottom: 0, left: 8 }}>
              <XAxis type="number" hide />
              <YAxis type="category" dataKey="name" width={150} tick={{ fontSize: 11, fill: '#475569' }} axisLine={false} tickLine={false} tickFormatter={(v: string) => (v.length > 22 ? v.slice(0, 21) + '…' : v)} />
              <Tooltip cursor={{ fill: '#eff6ff' }} contentStyle={tip} formatter={(v) => [`$${Number(v).toLocaleString()}`, 'Revenue']} />
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
