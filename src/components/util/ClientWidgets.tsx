'use client'
import dynamic from 'next/dynamic'

// Non-critical, site-wide widgets. Code-split + client-only so their JS
// (the 186-product search index, framer-motion) loads AFTER the page is
// interactive, keeping initial hydration light and improving INP.
const CommandPalette = dynamic(
  () => import('@/components/search/CommandPalette').then((m) => m.CommandPalette),
  { ssr: false }
)
const ChatWidget = dynamic(
  () => import('@/components/ai/ChatWidget').then((m) => m.ChatWidget),
  { ssr: false }
)

export function ClientWidgets() {
  return (
    <>
      <CommandPalette />
      <ChatWidget />
    </>
  )
}
