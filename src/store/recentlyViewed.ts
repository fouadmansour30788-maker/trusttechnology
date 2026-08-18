import { create } from 'zustand'
import { persist } from 'zustand/middleware'

export type ViewedSnapshot = {
  id: string
  slug: string
  name: string
  price: number
  priceOnRequest?: boolean
  image: string | null
  viewedAt: number
}

type RecentlyViewedStore = {
  items: ViewedSnapshot[]
  addViewed: (p: Omit<ViewedSnapshot, 'viewedAt'>) => void
}

const MAX_ITEMS = 12

export const useRecentlyViewedStore = create<RecentlyViewedStore>()(
  persist(
    (set) => ({
      items: [],
      addViewed: (p) =>
        set((state) => ({
          items: [{ ...p, viewedAt: Date.now() }, ...state.items.filter((i) => i.id !== p.id)].slice(0, MAX_ITEMS),
        })),
    }),
    { name: 'trust-tech-recently-viewed' }
  )
)
