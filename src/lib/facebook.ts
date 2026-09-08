import 'server-only'
import type { SupabaseClient } from '@supabase/supabase-js'

/**
 * Facebook Page insights + comments, via the Graph API.
 *
 * Requires FB_PAGE_ID and FB_PAGE_ACCESS_TOKEN (a long-lived Page Access
 * Token — Page tokens derived from a long-lived User token don't expire).
 * Insights and comments are fetched independently and each failure is
 * reported separately, so a missing permission (e.g. pages_read_user_content
 * not yet approved) doesn't take down the whole sync.
 */

type AnyClient = SupabaseClient<any, any, any>

const GRAPH = 'https://graph.facebook.com/v21.0'

export type FacebookSyncSummary = {
  stats: { ok: boolean; error?: string }
  comments: { ok: boolean; fetched: number; error?: string }
}

function creds() {
  const pageId = process.env.FB_PAGE_ID
  const token = process.env.FB_PAGE_ACCESS_TOKEN
  if (!pageId || !token) return null
  return { pageId, token }
}

async function fetchJSON(url: string) {
  const res = await fetch(url, { cache: 'no-store' })
  const data = await res.json()
  if (!res.ok || data.error) {
    throw new Error(data.error?.message || `Graph API ${res.status}`)
  }
  return data
}

async function syncPageStats(supabase: AnyClient, pageId: string, token: string): Promise<FacebookSyncSummary['stats']> {
  try {
    const fields = 'fan_count,followers_count'
    const page = await fetchJSON(`${GRAPH}/${pageId}?fields=${fields}&access_token=${token}`)

    // page insights: 28-day totals for impressions/engaged users/views.
    // Metrics occasionally get renamed/retired by Meta; each is fetched
    // independently so one deprecated metric doesn't blank the others.
    const metricVal = async (metric: string) => {
      try {
        const d = await fetchJSON(`${GRAPH}/${pageId}/insights/${metric}/days_28?access_token=${token}`)
        const v = d.data?.[0]?.values?.at(-1)?.value
        return typeof v === 'number' ? v : null
      } catch {
        return null
      }
    }
    const [impressions, engaged, views] = await Promise.all([
      metricVal('page_impressions'),
      metricVal('page_engaged_users'),
      metricVal('page_views_total'),
    ])

    await supabase.from('fb_page_stats').insert({
      page_id: pageId,
      fan_count: page.fan_count ?? null,
      followers_count: page.followers_count ?? null,
      impressions_28d: impressions,
      engaged_users_28d: engaged,
      page_views_28d: views,
    })
    return { ok: true }
  } catch (e) {
    return { ok: false, error: (e instanceof Error ? e.message : String(e)).slice(0, 200) }
  }
}

async function syncComments(supabase: AnyClient, pageId: string, token: string): Promise<FacebookSyncSummary['comments']> {
  try {
    const posts = await fetchJSON(
      `${GRAPH}/${pageId}/posts?fields=id,message,permalink_url,comments.limit(50){message,from,created_time,like_count}&limit=25&access_token=${token}`
    )
    let fetched = 0
    const rows: Record<string, unknown>[] = []
    for (const post of posts.data ?? []) {
      const postMessage = typeof post.message === 'string' ? post.message.slice(0, 200) : null
      for (const c of post.comments?.data ?? []) {
        rows.push({
          fb_comment_id: c.id,
          post_id: post.id,
          post_message: postMessage,
          post_permalink: post.permalink_url ?? null,
          message: c.message ?? '',
          from_name: c.from?.name ?? null,
          like_count: c.like_count ?? 0,
          comment_created_at: c.created_time ?? null,
        })
        fetched++
      }
    }
    if (rows.length > 0) {
      // upsert on the unique fb_comment_id so re-syncing doesn't duplicate
      const { error } = await supabase.from('fb_comments').upsert(rows, { onConflict: 'fb_comment_id' })
      if (error) throw new Error(error.message)
    }
    return { ok: true, fetched }
  } catch (e) {
    return { ok: false, fetched: 0, error: (e instanceof Error ? e.message : String(e)).slice(0, 200) }
  }
}

export async function syncFacebookData(supabase: AnyClient): Promise<FacebookSyncSummary> {
  const c = creds()
  if (!c) {
    const err = 'FB_PAGE_ID / FB_PAGE_ACCESS_TOKEN not configured'
    return { stats: { ok: false, error: err }, comments: { ok: false, fetched: 0, error: err } }
  }
  const [stats, comments] = await Promise.all([
    syncPageStats(supabase, c.pageId, c.token),
    syncComments(supabase, c.pageId, c.token),
  ])
  return { stats, comments }
}

export function isFacebookConfigured(): boolean {
  return creds() !== null
}
