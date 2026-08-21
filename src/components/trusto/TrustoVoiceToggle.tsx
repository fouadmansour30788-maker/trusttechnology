'use client'
import { useEffect, useState } from 'react'
import { Volume2, VolumeX } from 'lucide-react'
import { isTrustoVoiceMuted, setTrustoVoiceMuted } from '@/lib/trustoVoice'

/** Small mute switch for Trusto's voice lines — defaults to on, but forced
 * audio needs an easy, discoverable off-switch. */
export function TrustoVoiceToggle({ className = '' }: { className?: string }) {
  const [muted, setMuted] = useState(false)
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    setMuted(isTrustoVoiceMuted())
    setMounted(true)
  }, [])

  if (!mounted) return null

  return (
    <button
      onClick={() => { const next = !muted; setMuted(next); setTrustoVoiceMuted(next) }}
      title={muted ? 'Unmute Trusto' : 'Mute Trusto'}
      aria-label={muted ? 'Unmute Trusto' : 'Mute Trusto'}
      className={className}
    >
      {muted ? <VolumeX size={14} /> : <Volume2 size={14} />}
    </button>
  )
}
