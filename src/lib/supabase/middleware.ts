import { createServerClient } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

export async function updateSession(request: NextRequest) {
  let response = NextResponse.next({ request })

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  // Not configured yet → let admin pages render their "connect Supabase" notice.
  if (!url || !key || url.includes('your-project') || !url.startsWith('http')) {
    return response
  }

  const supabase = createServerClient(url, key, {
    cookies: {
      getAll() {
        return request.cookies.getAll()
      },
      setAll(cookiesToSet) {
        cookiesToSet.forEach(({ name, value }) => request.cookies.set(name, value))
        response = NextResponse.next({ request })
        cookiesToSet.forEach(({ name, value, options }) => response.cookies.set(name, value, options))
      },
    },
  })

  const { data: { user } } = await supabase.auth.getUser()
  const path = request.nextUrl.pathname

  if (path.startsWith('/admin') && !path.startsWith('/admin/login')) {
    if (!user) {
      const redirect = request.nextUrl.clone()
      redirect.pathname = '/admin/login'
      redirect.searchParams.set('next', path)
      return NextResponse.redirect(redirect)
    }
    // Being logged in isn't enough -- /register is a public, self-service
    // signup using the same Supabase Auth pool as /admin/login, so an
    // ordinary customer account must not pass here. Only a profiles row
    // with role 'admin'/'staff' (granted deliberately, never automatically
    // — see handle_new_user() in 003/070) counts as back-office access.
    const { data: profile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .maybeSingle()
    const isStaff = profile?.role === 'admin' || profile?.role === 'staff'
    if (!isStaff) {
      const redirect = request.nextUrl.clone()
      redirect.pathname = '/admin/login'
      redirect.searchParams.set('next', path)
      redirect.searchParams.set('error', 'not_staff')
      return NextResponse.redirect(redirect)
    }
  }

  if (path.startsWith('/account') && !user) {
    const redirect = request.nextUrl.clone()
    redirect.pathname = '/login'
    redirect.searchParams.set('next', path)
    return NextResponse.redirect(redirect)
  }

  return response
}
