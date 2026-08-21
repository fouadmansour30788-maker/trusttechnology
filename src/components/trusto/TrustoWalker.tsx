'use client'
import { useEffect, useState } from 'react'
import { usePathname } from 'next/navigation'
import { motion, AnimatePresence } from 'framer-motion'
import { useChatStore } from '@/store/chat'
import { TrustoAvatar } from './TrustoAvatar'
import { speakTrusto, randomGreeting } from '@/lib/trustoVoice'

type Trip = { direction: 'ltr' | 'rtl'; speed: 'walk' | 'run' }

const MIN_GAP_MS = 55_000
const MAX_GAP_MS = 110_000

function randomTrip(): Trip {
  return {
    direction: Math.random() < 0.5 ? 'ltr' : 'rtl',
    // Mostly walks — the occasional run reads as a fun surprise, not the norm.
    speed: Math.random() < 0.2 ? 'run' : 'walk',
  }
}

/**
 * Trusto occasionally strolls (or, rarely, sprints) across the bottom of the
 * screen — a lightweight "he's alive" touch. Session-paced (not on a fixed
 * interval) so it never fires while someone's actively chatting with him,
 * and skipped entirely on /admin where it'd just be noise for staff.
 */
export function TrustoWalker() {
  const pathname = usePathname()
  const chatOpen = useChatStore((s) => s.isOpen)
  const [trip, setTrip] = useState<Trip | null>(null)

  const isAdmin = pathname?.startsWith('/admin') ?? false

  useEffect(() => {
    if (isAdmin) return
    let timer: ReturnType<typeof setTimeout>

    function scheduleNext() {
      const gap = MIN_GAP_MS + Math.random() * (MAX_GAP_MS - MIN_GAP_MS)
      timer = setTimeout(() => {
        if (document.visibilityState !== 'visible' || useChatStore.getState().isOpen) {
          scheduleNext()
          return
        }
        const t = randomTrip()
        setTrip(t)
        // Roughly half his walk-bys get a little voice line — enough to feel
        // alive without turning into a chirping toy.
        if (Math.random() < 0.5) speakTrusto(randomGreeting())
      }, gap)
    }
    scheduleNext()
    return () => clearTimeout(timer)
  }, [isAdmin])

  if (isAdmin || chatOpen || !trip) return null

  const travel = typeof window !== 'undefined' ? window.innerWidth + 200 : 1600
  const fromX = trip.direction === 'ltr' ? -170 : travel - 170
  const toX = trip.direction === 'ltr' ? travel - 170 : -170
  const duration = trip.speed === 'run' ? travel / 340 : travel / 130

  return (
    <AnimatePresence>
      <motion.div
        key={`${trip.direction}-${trip.speed}-${fromX}`}
        className="fixed bottom-3 left-0 z-[40] pointer-events-none"
        initial={{ x: fromX }}
        animate={{ x: toX }}
        transition={{ duration, ease: 'linear' }}
        onAnimationComplete={() => setTrip(null)}
        style={{ scaleX: trip.direction === 'ltr' ? 1 : -1 }}
      >
        <TrustoAvatar mood="excited" size={84} walking speed={trip.speed} holdingLaptop />
      </motion.div>
    </AnimatePresence>
  )
}
