import Link from 'next/link'
import { Share2, Users, Eye, Activity, TrendingUp, TrendingDown, Minus, MessageCircle, ExternalLink, Settings2 } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { isFacebookConfigured } from '@/lib/facebook'
import { FacebookSyncButton } from '@/components/admin/FacebookSyncButton'

export const dynamic = 'force-dynamic'

type PageStats = {
  fetched_at: string
  fan_count: number | null
  followers_count: number | null
  impressions_28d: number | null
  engaged_users_28d: number | null
  page_views_28d: number | null
}

type Comment = {
  fb_comment_id: string
  post_id: string
  post_message: string | null
  post_permalink: string | null
  message: string
  from_name: string | null
  like_count: number
  comment_created_at: string | null
}

function fmt(n: number | null): string {
  if (n === null || n === undefined) return '—'
  return n.toLocaleString()
}

function timeAgo(iso: string | null) {
  if (!iso) return ''
  const mins = Math.round((Date.now() - new Date(iso).getTime()) / 60000)
  if (mins < 1) return 'just now'
  if (mins < 60) return `${mins}m ago`
  if (mins < 60 * 24) return `${Math.round(mins / 60)}h ago`
  return `${Math.round(mins / (60 * 24))}d ago`
}

function Delta({ current, previous }: { current: number | null; previous: number | null }) {
  if (current === null || previous === null) return null
  const diff = current - previous
  if (diff === 0) return <span className="inline-flex items-center gap-0.5 text-xs text-slate-400"><Minus size={11} /> no change</span>
  const up = diff > 0
  return (
    <span className={`inline-flex items-center gap-0.5 text-xs font-medium ${up ? 'text-emerald-600' : 'text-red-500'}`}>
      {up ? <TrendingUp size={11} /> : <TrendingDown size={11} />} {up ? '+' : ''}{diff.toLocaleString()}
    </span>
  )
}

function StatCard({ icon: Icon, label, value, delta }: { icon: typeof Users; label: string; value: string; delta?: React.ReactNode }) {
  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5">
      <div className="flex items-center gap-2 text-slate-400 mb-2">
        <Icon size={15} />
        <span className="text-xs font-medium uppercase tracking-wide">{label}</span>
      </div>
      <p className="text-2xl font-bold text-slate-900">{value}</p>
      {delta && <div className="mt-1">{delta}</div>}
    </div>
  )
}

function NotConfigured() {
  return (
    <div className="p-8 max-w-2xl">
      <div className="bg-white border border-slate-200 rounded-2xl p-8">
        <div className="w-12 h-12 rounded-2xl bg-blue-50 flex items-center justify-center mb-4">
          <Settings2 size={22} className="text-blue-600" />
        </div>
        <h1 className="text-lg font-bold text-slate-900">Connect the Facebook Page</h1>
        <p className="text-sm text-slate-500 mt-2 leading-relaxed">
          This pulls follower counts, engagement figures and post comments from{' '}
          <a href="https://www.facebook.com/trusttechnology.lb/" target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">
            facebook.com/trusttechnology.lb
          </a>{' '}
          via the Graph API. Add these two environment variables in Vercel (Project → Settings → Environment Variables), then redeploy:
        </p>
        <div className="mt-4 bg-slate-50 border border-slate-200 rounded-xl p-4 font-mono text-xs text-slate-700 space-y-1">
          <p>FB_PAGE_ID=<span className="text-slate-400">&lt;numeric Page ID&gt;</span></p>
          <p>FB_PAGE_ACCESS_TOKEN=<span className="text-slate-400">&lt;long-lived Page Access Token&gt;</span></p>
        </div>
        <ol className="mt-4 text-sm text-slate-500 space-y-1.5 list-decimal list-inside">
          <li>In Graph API Explorer, select your app and the trusttechnology.lb Page.</li>
          <li>Request permissions: <code className="text-slate-700">pages_read_engagement</code>, <code className="text-slate-700">pages_read_user_content</code>.</li>
          <li>Generate a Page Access Token, then exchange it for a long-lived one (Meta&apos;s Access Token Debugger → &quot;Extend Access Token&quot;) so it doesn&apos;t expire hourly.</li>
          <li>Copy the Page ID from the Page&apos;s About section or <code className="text-slate-700">GET /me?fields=id</code> using the token.</li>
        </ol>
        <Link href="/admin" className="inline-block mt-6 text-sm text-slate-400 hover:text-slate-600">← Back to dashboard</Link>
      </div>
    </div>
  )
}

export default async function FacebookPage() {
  if (!isSupabaseConfigured()) return <NotConfigured />
  if (!isFacebookConfigured()) return <NotConfigured />

  const supabase = await createClient()
  const { data: statsRows } = await supabase
    .from('fb_page_stats')
    .select('fetched_at, fan_count, followers_count, impressions_28d, engaged_users_28d, page_views_28d')
    .order('fetched_at', { ascending: false })
    .limit(2)
  const [latest, previous] = (statsRows as PageStats[] | null) ?? []

  const { data: commentRows } = await supabase
    .from('fb_comments')
    .select('fb_comment_id, post_id, post_message, post_permalink, message, from_name, like_count, comment_created_at')
    .order('comment_created_at', { ascending: false })
    .limit(50)
  const comments = (commentRows as Comment[] | null) ?? []

  return (
    <div className="p-8 max-w-6xl">
      <div className="flex items-center justify-between mb-2">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-blue-600 flex items-center justify-center">
            <Share2 size={20} className="text-white" />
          </div>
          <div>
            <h1 className="text-xl font-bold text-slate-900">Facebook Page</h1>
            <a href="https://www.facebook.com/trusttechnology.lb/" target="_blank" rel="noopener noreferrer" className="text-xs text-blue-600 hover:underline inline-flex items-center gap-1">
              facebook.com/trusttechnology.lb <ExternalLink size={10} />
            </a>
          </div>
        </div>
        <FacebookSyncButton />
      </div>
      {latest && <p className="text-xs text-slate-400 mb-6">Last synced {timeAgo(latest.fetched_at)}</p>}
      {!latest && <p className="text-xs text-slate-400 mb-6">No data yet — click &quot;Sync now&quot; to fetch it for the first time.</p>}

      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-10">
        <StatCard icon={Users} label="Followers" value={fmt(latest?.followers_count ?? null)}
          delta={<Delta current={latest?.followers_count ?? null} previous={previous?.followers_count ?? null} />} />
        <StatCard icon={Users} label="Page Likes" value={fmt(latest?.fan_count ?? null)}
          delta={<Delta current={latest?.fan_count ?? null} previous={previous?.fan_count ?? null} />} />
        <StatCard icon={Eye} label="Impressions (28d)" value={fmt(latest?.impressions_28d ?? null)} />
        <StatCard icon={Activity} label="Engaged Users (28d)" value={fmt(latest?.engaged_users_28d ?? null)} />
      </div>

      <div className="flex items-center gap-2 mb-4">
        <MessageCircle size={17} className="text-slate-400" />
        <h2 className="text-base font-bold text-slate-900">What people are asking</h2>
        <span className="text-xs text-slate-400">({comments.length} recent comments)</span>
      </div>

      {comments.length === 0 ? (
        <div className="bg-white border border-slate-200 rounded-2xl p-8 text-center text-sm text-slate-400">
          No comments synced yet. If &quot;Sync now&quot; reports comments as FAILED, the Page Access Token likely needs the
          <code className="text-slate-600"> pages_read_user_content</code> permission (may require Meta App Review).
        </div>
      ) : (
        <div className="bg-white border border-slate-200 rounded-2xl divide-y divide-slate-100 overflow-hidden">
          {comments.map((c) => (
            <div key={c.fb_comment_id} className="p-4 sm:p-5">
              <div className="flex items-start justify-between gap-3">
                <div className="min-w-0">
                  <p className="text-sm text-slate-900"><span className="font-semibold">{c.from_name ?? 'Someone'}</span> {c.message}</p>
                  {c.post_message && (
                    <p className="text-xs text-slate-400 mt-1 truncate">on: &quot;{c.post_message}&quot;</p>
                  )}
                </div>
                <div className="shrink-0 text-right">
                  <p className="text-[11px] text-slate-400">{timeAgo(c.comment_created_at)}</p>
                  {c.like_count > 0 && <p className="text-[11px] text-slate-400 mt-0.5">👍 {c.like_count}</p>}
                </div>
              </div>
              {c.post_permalink && (
                <a href={c.post_permalink} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline mt-2">
                  View on Facebook <ExternalLink size={10} />
                </a>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
