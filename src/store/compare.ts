import { create } from 'zustand'
import { persist } from 'zustand/middleware'
import type { Product } from '@/lib/types'

const MAX_COMPARE = 3

type CompareStore = {
  items: Product[]
  toggle: (product: Product) => void
  remove: (productId: string) => void
  clear: () => void
  has: (productId: string) => boolean
}

export const useCompareStore = create<CompareStore>()(
  persist(
    (set, get) => ({
      items: [],
      toggle: (product) =>
        set((state) => {
          if (state.items.some((p) => p.id === product.id)) {
            return { items: state.items.filter((p) => p.id !== product.id) }
          }
          if (state.items.length >= MAX_COMPARE) {
            // Replace the oldest selection so the button always responds.
            return { items: [...state.items.slice(1), product] }
          }
          return { items: [...state.items, product] }
        }),
      remove: (productId) => set((state) => ({ items: state.items.filter((p) => p.id !== productId) })),
      clear: () => set({ items: [] }),
      has: (productId) => get().items.some((p) => p.id === productId),
    }),
    { name: 'trust-compare' }
  )
)
