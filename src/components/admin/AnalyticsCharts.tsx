'use client'
import {
  ResponsiveContainer, AreaChart, Area, LineChart, Line, BarChart, Bar, Cell,
  XAxis, YAxis, CartesianGrid, Tooltip, PieChart, Pie,
  RadarChart, Radar, PolarGrid, PolarAngleAxis, PolarRadiusAxis,
  FunnelChart, Funnel, LabelList,
} from 'recharts'
import type { Analytics } from '@/lib/analytics'

// Validated categorical palette (fixed slot order — never cycled or re-ranked).
const CAT = ['#2a78d6', '#1baf7a', '#eda100', '#008300', '#4a3aa7', '#e34948', '#e87ba4', '#eb6834']
const BLUE = '#2a78d6'
const STATUS_COLORS: Record<string, string> = {
  draft: '#94a3b8', confirmed: '#2a78d6', fulfilled: '#0ca30c', cancelled: '#d03b3b',
}
const FUNNEL_ORDINAL = ['#1c5cab', '#3987e5', '#86b6ef']

const tip = { borderRadius: 12, border: '1px solid #e2e8f0', fontSize: 13 } as const
const tick = { fontSize: 11, fill: '#94a3b8' } as const
const money = (v: number) => `$${Number(v).toLocaleString()}`
const moneyAxis = (v: number) => (v >= 1000 ? `$${(v / 1000).toFixed(v >= 10000 ? 0 : 1)}k` : `$${v}`)

function Empty({ label }: { label: string }) {
  return <p className="text-sm text-slate-400 py-16 text-center">{label}</p>
}

export function Card({ title, subtitle, children, className = '' }: {
  title: string; subtitle?: string; children: React.ReactNode; className?: string
}) {
  return (
    <div className={`bg-white border border-slate-200 rounded-2xl p-5 ${className}`}>
      <p className="font-semibold text-slate-900 text-sm">{title}</p>
      {subtitle && <p className="text-xs text-slate-400 mt-0.5">{subtitle}</p>}
      <div className="mt-4">{children}</div>
    </div>
  )
}

// ── Revenue trend (area) ────────────────────────────────────────────────
export function RevenueTrend({ data }: { data: Analytics['monthly'] }) {
  if (data.every((d) => d.revenue === 0)) return <Empty label="No revenue recorded yet." />
  return (
    <ResponsiveContainer width="100%" height={260}>
      <AreaChart data={data} margin={{ top: 6, right: 8, bottom: 0, left: -4 }}>
        <defs>
          <linearGradient id="revFill" x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stopColor={BLUE} stopOpacity={0.18} />
            <stop offset="100%" stopColor={BLUE} stopOpacity={0} />
          </linearGradient>
        </defs>
        <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" vertical={false} />
        <XAxis dataKey="month" tick={tick} axisLine={false} tickLine={false} />
        <YAxis tick={tick} axisLine={false} tickLine={false} width={52} tickFormatter={moneyAxis} />
        <Tooltip contentStyle={tip} formatter={(v) => [money(Number(v)), 'Revenue']} />
        <Area type="monotone" dataKey="revenue" stroke={BLUE} strokeWidth={2} fill="url(#revFill)"
          dot={{ r: 3, fill: BLUE, strokeWidth: 0 }} activeDot={{ r: 5 }} />
      </AreaChart>
    </ResponsiveContainer>
  )
}

// ── Orders per month (bar) ──────────────────────────────────────────────
export function OrdersByMonth({ data }: { data: Analytics['monthly'] }) {
  if (data.every((d) => d.orders === 0)) return <Empty label="No orders yet." />
  return (
    <ResponsiveContainer width="100%" height={260}>
      <BarChart data={data} margin={{ top: 6, right: 8, bottom: 0, left: -16 }}>
        <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" vertical={false} />
        <XAxis dataKey="month" tick={tick} axisLine={false} tickLine={false} interval={1} />
        <YAxis tick={tick} axisLine={false} tickLine={false} allowDecimals={false} />
        <Tooltip contentStyle={tip} cursor={{ fill: '#f8fafc' }} formatter={(v) => [v, 'Orders']} />
        <Bar dataKey="orders" fill={BLUE} radius={[4, 4, 0, 0]} maxBarSize={22} />
      </BarChart>
    </ResponsiveContainer>
  )
}

// ── Donut with value-bearing legend ─────────────────────────────────────
function DonutBase({ data, colors, centerLabel, centerValue, unit }: {
  data: { name: string; value: number }[]
  colors: string[]
  centerLabel: string
  centerValue: string
  unit: 'money' | 'count'
}) {
  const total = data.reduce((s, d) => s + d.value, 0)
  return (
    <div className="flex flex-col sm:flex-row items-center gap-5">
      <div className="relative w-44 h-44 shrink-0">
        <ResponsiveContainer width="100%" height="100%">
          <PieChart>
            <Pie data={data} dataKey="value" nameKey="name" innerRadius="66%" outerRadius="98%"
              stroke="#ffffff" strokeWidth={2} isAnimationActive={false}>
              {data.map((_, i) => <Cell key={i} fill={colors[i % colors.length]} />)}
            </Pie>
            <Tooltip contentStyle={tip} formatter={(v, name) => [unit === 'money' ? money(Number(v)) : v, name]} />
          </PieChart>
        </ResponsiveContainer>
        <div className="absolute inset-0 flex flex-col items-center justify-center pointer-events-none">
          <p className="text-lg font-bold text-slate-900">{centerValue}</p>
          <p className="text-[10px] uppercase tracking-wide text-slate-400">{centerLabel}</p>
        </div>
      </div>
      {/* Value legend — visible labels are the contrast relief for light slots */}
      <ul className="flex-1 w-full space-y-1.5 text-sm">
        {data.map((d, i) => (
          <li key={d.name} className="flex items-center gap-2">
            <span className="w-2.5 h-2.5 rounded-full shrink-0" style={{ background: colors[i % colors.length] }} />
            <span className="text-slate-600 truncate flex-1">{d.name}</span>
            <span className="text-slate-900 font-medium tabular-nums">{unit === 'money' ? money(d.value) : d.value}</span>
            <span className="text-slate-400 tabular-nums w-10 text-right">{total ? Math.round((d.value / total) * 100) : 0}%</span>
          </li>
        ))}
      </ul>
    </div>
  )
}

export function CategoryDonut({ data }: { data: Analytics['categoryRevenue'] }) {
  if (data.length === 0) return <Empty label="No category sales yet." />
  const total = data.reduce((s, d) => s + d.revenue, 0)
  return (
    <DonutBase
      data={data.map((d) => ({ name: d.name, value: d.revenue }))}
      colors={CAT}
      centerLabel="total"
      centerValue={moneyAxis(total)}
      unit="money"
    />
  )
}

export function StatusDonut({ data }: { data: Analytics['statusMix'] }) {
  if (data.length === 0) return <Empty label="No orders yet." />
  const total = data.reduce((s, d) => s + d.count, 0)
  const label = (s: string) => s.charAt(0).toUpperCase() + s.slice(1)
  return (
    <DonutBase
      data={data.map((d) => ({ name: label(d.status), value: d.count }))}
      colors={data.map((d) => STATUS_COLORS[d.status] ?? '#94a3b8')}
      centerLabel="orders"
      centerValue={String(total)}
      unit="count"
    />
  )
}

// ── Store-health radar ──────────────────────────────────────────────────
export function HealthRadar({ data }: { data: Analytics['radar'] }) {
  if (data.length === 0) return <Empty label="Not enough data yet." />
  return (
    <ResponsiveContainer width="100%" height={260}>
      <RadarChart data={data} margin={{ top: 8, right: 24, bottom: 8, left: 24 }}>
        <PolarGrid stroke="#e2e8f0" />
        <PolarAngleAxis dataKey="axis" tick={{ fontSize: 11, fill: '#64748b' }} />
        <PolarRadiusAxis domain={[0, 100]} tick={false} axisLine={false} />
        <Tooltip contentStyle={tip} formatter={(v) => [`${v}/100`, 'Score']} />
        <Radar dataKey="score" stroke={BLUE} strokeWidth={2} fill={BLUE} fillOpacity={0.15}
          dot={{ r: 3, fill: BLUE, strokeWidth: 0 }} isAnimationActive={false} />
      </RadarChart>
    </ResponsiveContainer>
  )
}

// ── Order funnel (ordinal blues) ────────────────────────────────────────
export function OrderFunnel({ data }: { data: Analytics['funnel'] }) {
  if (data.every((f) => f.count === 0)) return <Empty label="No orders yet." />
  const withFill = data.map((d, i) => ({ ...d, fill: FUNNEL_ORDINAL[i % FUNNEL_ORDINAL.length] }))
  return (
    <ResponsiveContainer width="100%" height={260}>
      <FunnelChart margin={{ top: 8, right: 90, bottom: 8, left: 12 }}>
        <Tooltip contentStyle={tip} />
        <Funnel dataKey="count" data={withFill} isAnimationActive={false}>
          <LabelList position="right" fill="#475569" stroke="none" dataKey="stage" fontSize={12} />
          <LabelList position="left" fill="#0f172a" stroke="none" dataKey="count" fontSize={12} fontWeight={600} />
        </Funnel>
      </FunnelChart>
    </ResponsiveContainer>
  )
}

// ── Weekday pattern ─────────────────────────────────────────────────────
export function WeekdayBar({ data }: { data: Analytics['weekday'] }) {
  if (data.every((d) => d.orders === 0)) return <Empty label="No orders yet." />
  return (
    <ResponsiveContainer width="100%" height={260}>
      <BarChart data={data} margin={{ top: 6, right: 8, bottom: 0, left: -16 }}>
        <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" vertical={false} />
        <XAxis dataKey="day" tick={tick} axisLine={false} tickLine={false} />
        <YAxis tick={tick} axisLine={false} tickLine={false} allowDecimals={false} />
        <Tooltip contentStyle={tip} cursor={{ fill: '#f8fafc' }}
          formatter={(v, name) => (name === 'orders' ? [v, 'Orders'] : [money(Number(v)), 'Revenue'])} />
        <Bar dataKey="orders" fill={BLUE} radius={[4, 4, 0, 0]} maxBarSize={26} />
      </BarChart>
    </ResponsiveContainer>
  )
}

// ── Horizontal ranking bar (single hue — color never encodes rank) ──────
export function RankBar({ data, valueLabel }: {
  data: { name: string; revenue: number }[]
  valueLabel: string
}) {
  if (data.length === 0) return <Empty label="Nothing to rank yet." />
  return (
    <ResponsiveContainer width="100%" height={Math.max(180, data.length * 40)}>
      <BarChart layout="vertical" data={data} margin={{ top: 0, right: 56, bottom: 0, left: 8 }}>
        <XAxis type="number" hide />
        <YAxis type="category" dataKey="name" width={150} tick={{ fontSize: 11, fill: '#475569' }}
          axisLine={false} tickLine={false}
          tickFormatter={(v: string) => (v.length > 22 ? v.slice(0, 21) + '…' : v)} />
        <Tooltip cursor={{ fill: '#f8fafc' }} contentStyle={tip} formatter={(v) => [money(Number(v)), valueLabel]} />
        <Bar dataKey="revenue" fill={BLUE} radius={[0, 4, 4, 0]} maxBarSize={20}>
          <LabelList dataKey="revenue" position="right" fill="#64748b" fontSize={11}
            formatter={(v) => moneyAxis(Number(v))} />
        </Bar>
      </BarChart>
    </ResponsiveContainer>
  )
}

// ── Compact sparkline (admin home) ──────────────────────────────────────
export function Sparkline({ data }: { data: Analytics['monthly'] }) {
  return (
    <ResponsiveContainer width="100%" height={56}>
      <LineChart data={data} margin={{ top: 4, right: 4, bottom: 4, left: 4 }}>
        <Tooltip contentStyle={tip} formatter={(v) => [money(Number(v)), 'Revenue']} labelFormatter={(_, p) => p?.[0]?.payload?.month ?? ''} />
        <Line type="monotone" dataKey="revenue" stroke={BLUE} strokeWidth={2} dot={false} activeDot={{ r: 4 }} />
      </LineChart>
    </ResponsiveContainer>
  )
}
