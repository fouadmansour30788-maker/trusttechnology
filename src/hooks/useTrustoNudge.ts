'use client'
import { useEffect, useState } from 'react'

/**
 * Shows a Trusto nudge once per browser session for a given `id`, after
 * `condition` has been true continuously for `delayMs` — so a nudge tied to
 * "idle on this page" doesn't fire the instant a condition flickers true.
 * Session-scoped (not permanent) so returning visitors see nudges again
 * without it feeling like nagging within a single visit.
 */
export function useTrustoNudge(id: string, condition: boolean, delayMs = 4000) {
  const [show, setShow] = useState(false)

  useEffect(() => {
    if (!condition) return
    const key = `trusto-nudge-${id}`
    if (typeof window === 'undefined' || sessionStorage.getItem(key)) return
    const timer = setTimeout(() => {
      if (sessionStorage.getItem(key)) return
      sessionStorage.setItem(key, '1')
      setShow(true)
    }, delayMs)
    return () => clearTimeout(timer)
  }, [id, condition, delayMs])

  return { show, dismiss: () => setShow(false) }
}

/** Fires once per session the moment the cursor leaves toward the browser chrome (classic, well-supported exit-intent — not continuous mouse tracking). */
export function useExitIntent(id: string, enabled = true) {
  const [show, setShow] = useState(false)

  useEffect(() => {
    if (!enabled || typeof window === 'undefined') return
    const key = `trusto-nudge-${id}`
    if (sessionStorage.getItem(key)) return

    function onMouseOut(e: MouseEvent) {
      if (e.clientY > 0 || sessionStorage.getItem(key)) return
      sessionStorage.setItem(key, '1')
      setShow(true)
      document.removeEventListener('mouseout', onMouseOut)
    }
    document.addEventListener('mouseout', onMouseOut)
    return () => document.removeEventListener('mouseout', onMouseOut)
  }, [id, enabled])

  return { show, dismiss: () => setShow(false) }
}
