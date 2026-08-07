import { create } from 'zustand'

type WishlistStore = {
  ids: Set<string>
  loaded: boolean
  needsAuth: boolean
  hydrate: () => Promise<void>
  toggle: (productId: string) => Promise<'added' | 'removed' | 'unauthorized' | 'error'>
  has: (productId: string) => boolean
}

// Client-side cache of the signed-in customer's wishlisted product IDs —
// hydrated once from /api/wishlist and kept in sync via toggle(). Not
// localStorage-persisted (unlike cart/compare) since it's account-scoped,
// not device-scoped; a signed-out visitor just sees an empty, unauthenticated set.
export const useWishlistStore = create<WishlistStore>()((set, get) => ({
  ids: new Set(),
  loaded: false,
  needsAuth: false,
  hydrate: async () => {
    if (get().loaded) return
    try {
      const res = await fetch('/api/wishlist')
      if (res.status === 401) {
        set({ loaded: true, needsAuth: true })
        return
      }
      const data = await res.json()
      set({ ids: new Set<string>(data.ids ?? []), loaded: true, needsAuth: false })
    } catch {
      set({ loaded: true })
    }
  },
  toggle: async (productId) => {
    const isIn = get().ids.has(productId)
    // Optimistic update.
    set((state) => {
      const ids = new Set(state.ids)
      if (isIn) ids.delete(productId)
      else ids.add(productId)
      return { ids }
    })
    try {
      const res = isIn
        ? await fetch(`/api/wishlist?productId=${encodeURIComponent(productId)}`, { method: 'DELETE' })
        : await fetch('/api/wishlist', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ productId }) })
      if (res.status === 401) {
        // Revert optimistic change — the caller should redirect to /login.
        set((state) => {
          const ids = new Set(state.ids)
          if (isIn) ids.add(productId)
          else ids.delete(productId)
          return { ids, needsAuth: true }
        })
        return 'unauthorized'
      }
      if (!res.ok) throw new Error('failed')
      return isIn ? 'removed' : 'added'
    } catch {
      // Revert on failure.
      set((state) => {
        const ids = new Set(state.ids)
        if (isIn) ids.add(productId)
        else ids.delete(productId)
        return { ids }
      })
      return 'error'
    }
  },
  has: (productId) => get().ids.has(productId),
}))
