'use client'
import { Suspense, useState } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import Link from 'next/link'
import { LogIn, Loader2 } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import { AuthCard } from '@/components/ui/AuthCard'

export default function LoginPage() {
  return (
    <Suspense>
      <LoginForm />
    </Suspense>
  )
}

function LoginForm() {
  const router = useRouter()
  const params = useSearchParams()
  const next = params.get('next') || '/account'
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError(null)
    setLoading(true)
    try {
      const supabase = createClient()
      const { error } = await supabase.auth.signInWithPassword({ email, password })
      if (error) { setError('Incorrect email or password.'); return }
      router.replace(next)
      router.refresh()
    } catch {
      setError('Could not reach the server. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <AuthCard icon={<LogIn size={22} />} title="Sign in" subtitle="Access your orders, wishlist, and gift certificates.">
      <form onSubmit={onSubmit} className="space-y-3">
        <input
          type="email" required value={email} onChange={(e) => setEmail(e.target.value)}
          placeholder="Email"
          className="w-full px-4 py-3 rounded-xl border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
        />
        <input
          type="password" required value={password} onChange={(e) => setPassword(e.target.value)}
          placeholder="Password"
          className="w-full px-4 py-3 rounded-xl border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
        />
        {error && <p className="text-sm text-red-600">{error}</p>}
        <button
          type="submit" disabled={loading}
          className="w-full inline-flex items-center justify-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white font-semibold py-3 rounded-xl shadow-lg shadow-blue-600/20 disabled:opacity-50"
        >
          {loading ? <Loader2 size={16} className="animate-spin" /> : null}
          Sign in
        </button>
      </form>

      <p className="text-sm text-slate-500 mt-5 text-center">
        New here?{' '}
        <Link href={`/register${next !== '/account' ? `?next=${encodeURIComponent(next)}` : ''}`} className="text-blue-600 hover:text-blue-700 font-medium">
          Create an account
        </Link>
      </p>
    </AuthCard>
  )
}
