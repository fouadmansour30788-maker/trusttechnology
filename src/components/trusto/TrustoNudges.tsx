'use client'
import { usePathname } from 'next/navigation'
import { useCartStore } from '@/store/cart'
import { useChatStore } from '@/store/chat'
import { useTrustoNudge, useExitIntent } from '@/hooks/useTrustoNudge'
import { TrustoBubble } from './TrustoBubble'

/**
 * Central place for Trusto's proactive, context-aware nudges — one per
 * real behavioral signal (page + idle time, cart state, exit-intent), never
 * raw cursor position. Each fires at most once per session so it reads as
 * "he noticed," not nagging.
 */
export function TrustoNudges() {
  const pathname = usePathname()
  const openChat = useChatStore((s) => s.open)
  const cartCount = useCartStore((s) => s.items.length)

  const isAdmin = pathname?.startsWith('/admin') ?? false
  const isHome = pathname === '/'
  const isCart = pathname === '/cart'
  const isCheckout = pathname === '/checkout'

  const home = useTrustoNudge('home-greeting', isHome, 6000)
  const cart = useTrustoNudge('cart-help', isCart && cartCount > 0, 7000)
  const checkout = useTrustoNudge('checkout-reassure', isCheckout, 2500)
  const exitIntent = useExitIntent('exit-intent', !isAdmin)

  if (isAdmin) return null

  // Only one bubble at a time — priority: whichever page-specific nudge is
  // active, otherwise exit-intent (which can fire on any page).
  if (home.show) {
    return (
      <TrustoBubble
        show mood="excited"
        message="Hey, I'm Trusto! Tell me what you need and I'll point you to the right product."
        cta={{ label: 'Ask Trusto', onClick: openChat }}
        onDismiss={home.dismiss}
      />
    )
  }
  if (cart.show) {
    return (
      <TrustoBubble
        show mood="reassuring"
        message="Questions before you check out? Cash on delivery, no card needed — happy to help."
        cta={{ label: 'Ask Trusto', onClick: openChat }}
        onDismiss={cart.dismiss}
      />
    )
  }
  if (checkout.show) {
    return (
      <TrustoBubble
        show mood="reassuring"
        message="You're safe here — pay cash when your order arrives, and we'll call to confirm first."
        onDismiss={checkout.dismiss}
      />
    )
  }
  if (exitIntent.show) {
    return (
      <TrustoBubble
        show mood="confused"
        message="Leaving already? If you didn't find what you needed, ask me — I know the whole catalog."
        cta={{ label: 'Ask Trusto', onClick: openChat }}
        onDismiss={exitIntent.dismiss}
      />
    )
  }
  return null
}
