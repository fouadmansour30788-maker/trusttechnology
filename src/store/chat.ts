import { create } from 'zustand'

type ChatStore = {
  isOpen: boolean
  open: () => void
  close: () => void
  toggle: () => void
}

// Not persisted — the chat window should start closed on a fresh page load,
// only opened by the launcher or a Trusto nudge CTA.
export const useChatStore = create<ChatStore>()((set) => ({
  isOpen: false,
  open: () => set({ isOpen: true }),
  close: () => set({ isOpen: false }),
  toggle: () => set((state) => ({ isOpen: !state.isOpen })),
}))
