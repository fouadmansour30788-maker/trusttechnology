import { create } from 'zustand'
import { persist } from 'zustand/middleware'
import type { CartItem, Product } from '@/lib/types'

type CartStore = {
  items: CartItem[]
  isOpen: boolean
  addItem: (product: Product, quantity?: number) => void
  removeItem: (productId: string) => void
  updateQuantity: (productId: string, quantity: number) => void
  clearCart: () => void
  openCart: () => void
  closeCart: () => void
  totalItems: () => number
  totalPrice: () => number
}

// The cart UI only ever reads id/name/slug/price/images/stock/priceOnRequest
// off a cart item's product (confirmed — nothing reads .specs/.tags/
// .description from a CartItem). Zustand's persist middleware
// JSON.stringifies + writes the WHOLE store to localStorage synchronously
// on every add/remove/update, so keeping full Product objects (specs
// dictionaries, tag arrays, long descriptions) in there was serializing far
// more than the cart needs on every click — measured live as the cause of
// a 300-540ms blocked-paint (bad INP) on the add-to-cart and checkout
// buttons. Trimmed here at the persistence boundary only; heavy fields are
// zeroed rather than made optional so this still satisfies the Product type
// everywhere else in the app that expects one.
function trimForStorage(product: Product): Product {
  return { ...product, specs: {}, tags: [], description: null }
}

export const useCartStore = create<CartStore>()(
  persist(
    (set, get) => ({
      items: [],
      isOpen: false,

      addItem: (product, quantity = 1) => {
        set((state) => {
          const existing = state.items.find((i) => i.product.id === product.id)
          if (existing) {
            return {
              items: state.items.map((i) =>
                i.product.id === product.id
                  ? { ...i, quantity: i.quantity + quantity }
                  : i
              ),
              isOpen: true,
            }
          }
          return { items: [...state.items, { product, quantity }], isOpen: true }
        })
      },

      removeItem: (productId) =>
        set((state) => ({ items: state.items.filter((i) => i.product.id !== productId) })),

      updateQuantity: (productId, quantity) =>
        set((state) => ({
          items:
            quantity <= 0
              ? state.items.filter((i) => i.product.id !== productId)
              : state.items.map((i) =>
                  i.product.id === productId ? { ...i, quantity } : i
                ),
        })),

      clearCart: () => set({ items: [] }),
      openCart: () => set({ isOpen: true }),
      closeCart: () => set({ isOpen: false }),
      totalItems: () => get().items.reduce((sum, i) => sum + i.quantity, 0),
      totalPrice: () => get().items.reduce((sum, i) => sum + i.product.price * i.quantity, 0),
    }),
    {
      name: 'trust-tech-cart',
      partialize: (state) => ({
        items: state.items.map((i) => ({ product: trimForStorage(i.product), quantity: i.quantity })),
      }),
    }
  )
)
