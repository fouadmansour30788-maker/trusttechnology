'use client'
import { motion } from 'framer-motion'

export type TrustoMood = 'idle' | 'thinking' | 'excited' | 'reassuring' | 'celebratory' | 'confused'

const ACCENT: Record<TrustoMood, string> = {
  idle: '#3b82f6',
  thinking: '#f59e0b',
  excited: '#10b981',
  reassuring: '#3b82f6',
  celebratory: '#10b981',
  confused: '#f59e0b',
}

/** Eyes + mouth per mood, drawn around a shared (0,0) face-center coordinate space. */
function Face({ mood }: { mood: TrustoMood }) {
  switch (mood) {
    case 'excited':
    case 'celebratory':
      return (
        <>
          <path d="M -13 -2 Q -9 -9 -5 -2" stroke="#0f172a" strokeWidth="3.2" strokeLinecap="round" fill="none" />
          <path d="M 5 -2 Q 9 -9 13 -2" stroke="#0f172a" strokeWidth="3.2" strokeLinecap="round" fill="none" />
          <path d="M -9 8 Q 0 18 9 8" stroke="#0f172a" strokeWidth="3.2" strokeLinecap="round" fill="none" />
        </>
      )
    case 'thinking':
      return (
        <>
          <circle cx="-9" cy="0" r="3.4" fill="#0f172a" />
          <circle cx="8" cy="-3" r="3.4" fill="#0f172a" />
          <path d="M -6 12 Q 2 8 10 12" stroke="#0f172a" strokeWidth="3.2" strokeLinecap="round" fill="none" />
        </>
      )
    case 'confused':
      return (
        <>
          <circle cx="-9" cy="0" r="3.4" fill="#0f172a" />
          <circle cx="9" cy="0" r="3.4" fill="#0f172a" />
          <path d="M -13 -9 L -4 -7" stroke="#0f172a" strokeWidth="3" strokeLinecap="round" />
          <path d="M -8 10 Q 0 6 8 11 Q 2 13 -8 10" fill="#0f172a" />
        </>
      )
    case 'reassuring':
      return (
        <>
          <circle cx="-9" cy="0" r="3.4" fill="#0f172a" />
          <circle cx="9" cy="0" r="3.4" fill="#0f172a" />
          <path d="M -8 9 Q 0 14 8 9" stroke="#0f172a" strokeWidth="3.2" strokeLinecap="round" fill="none" />
        </>
      )
    case 'idle':
    default:
      return (
        <>
          <circle cx="-9" cy="0" r="3.6" fill="#0f172a" />
          <circle cx="9" cy="0" r="3.6" fill="#0f172a" />
          <path d="M -6 10 Q 0 13 6 10" stroke="#0f172a" strokeWidth="3" strokeLinecap="round" fill="none" />
        </>
      )
  }
}

/**
 * Trusto — Trust Technology's mascot. An illustrated "glossy toy" character
 * (layered gradients + a soft highlight, à la Duolingo's owl) rather than a
 * literal 3D model — there's no real 3D asset to source, and this reads as
 * distinctly "our robot" while staying light enough to animate everywhere.
 */
export function TrustoAvatar({ mood = 'idle', size = 56, animated = true, className = '' }: {
  mood?: TrustoMood
  size?: number
  animated?: boolean
  className?: string
}) {
  const accent = ACCENT[mood]
  return (
    <motion.svg
      viewBox="0 0 64 64"
      width={size}
      height={size}
      className={className}
      animate={animated ? { y: [0, -3, 0] } : undefined}
      transition={animated ? { duration: 2.6, repeat: Infinity, ease: 'easeInOut' } : undefined}
    >
      <defs>
        <linearGradient id={`trusto-body-${mood}`} x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#60a5fa" />
          <stop offset="100%" stopColor="#1d4ed8" />
        </linearGradient>
        <radialGradient id="trusto-highlight" cx="35%" cy="25%" r="60%">
          <stop offset="0%" stopColor="#ffffff" stopOpacity="0.55" />
          <stop offset="100%" stopColor="#ffffff" stopOpacity="0" />
        </radialGradient>
      </defs>

      {/* antenna */}
      <line x1="32" y1="6" x2="32" y2="13" stroke="#94a3b8" strokeWidth="2.5" strokeLinecap="round" />
      <motion.circle
        cx="32" cy="5" r="3" fill={accent}
        animate={animated ? { opacity: [1, 0.5, 1] } : undefined}
        transition={animated ? { duration: 1.6, repeat: Infinity, ease: 'easeInOut' } : undefined}
      />

      {/* head */}
      <rect x="8" y="13" width="48" height="42" rx="16" fill={`url(#trusto-body-${mood})`} />
      <rect x="8" y="13" width="48" height="42" rx="16" fill="url(#trusto-highlight)" />

      {/* face plate */}
      <rect x="15" y="22" width="34" height="24" rx="12" fill="#eff6ff" />
      <motion.g
        transform="translate(32, 34)"
        animate={animated ? { scaleY: [1, 1, 0.1, 1] } : undefined}
        transition={animated ? { duration: 3.4, repeat: Infinity, ease: 'easeInOut', times: [0, 0.85, 0.92, 1] } : undefined}
        style={{ transformOrigin: '32px 34px' }}
      >
        <Face mood={mood} />
      </motion.g>

      {/* side ears/lights */}
      <circle cx="9" cy="34" r="3" fill={accent} opacity="0.85" />
      <circle cx="55" cy="34" r="3" fill={accent} opacity="0.85" />
    </motion.svg>
  )
}
