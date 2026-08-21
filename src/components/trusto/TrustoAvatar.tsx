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
          <path d="M -9 -1 Q -6 -6 -3 -1" stroke="#0f172a" strokeWidth="2.4" strokeLinecap="round" fill="none" />
          <path d="M 3 -1 Q 6 -6 9 -1" stroke="#0f172a" strokeWidth="2.4" strokeLinecap="round" fill="none" />
          <path d="M -6 5.5 Q 0 12 6 5.5" stroke="#0f172a" strokeWidth="2.4" strokeLinecap="round" fill="none" />
        </>
      )
    case 'thinking':
      return (
        <>
          <circle cx="-6" cy="0" r="2.4" fill="#0f172a" />
          <circle cx="5.5" cy="-2" r="2.4" fill="#0f172a" />
          <path d="M -4 8 Q 1.5 5.5 7 8" stroke="#0f172a" strokeWidth="2.2" strokeLinecap="round" fill="none" />
        </>
      )
    case 'confused':
      return (
        <>
          <circle cx="-6" cy="0" r="2.4" fill="#0f172a" />
          <circle cx="6" cy="0" r="2.4" fill="#0f172a" />
          <path d="M -9 -6 L -2.5 -5" stroke="#0f172a" strokeWidth="2" strokeLinecap="round" />
          <path d="M -5.5 7 Q 0 4 5.5 7.5 Q 1.5 9 -5.5 7" fill="#0f172a" />
        </>
      )
    case 'reassuring':
      return (
        <>
          <circle cx="-6" cy="0" r="2.4" fill="#0f172a" />
          <circle cx="6" cy="0" r="2.4" fill="#0f172a" />
          <path d="M -5.5 6 Q 0 9.5 5.5 6" stroke="#0f172a" strokeWidth="2.2" strokeLinecap="round" fill="none" />
        </>
      )
    case 'idle':
    default:
      return (
        <>
          <circle cx="-6" cy="0" r="2.5" fill="#0f172a" />
          <circle cx="6" cy="0" r="2.5" fill="#0f172a" />
          <path d="M -4 7 Q 0 9 4 7" stroke="#0f172a" strokeWidth="2" strokeLinecap="round" fill="none" />
        </>
      )
  }
}

/**
 * Trusto — Trust Technology's mascot. An illustrated "glossy toy" character
 * (layered gradients + a soft highlight, à la Duolingo's owl) rather than a
 * literal 3D model — there's no real 3D asset to source, and this reads as
 * distinctly "our robot" while staying light enough to animate everywhere.
 *
 * Full-body, chibi-proportioned (big head, small body) so the same artwork
 * reads clearly both as a tiny 32px chat-bubble icon and as a full character
 * walking across the page — no separate "head-only" variant to maintain.
 */
export function TrustoAvatar({
  mood = 'idle', size = 56, animated = true, walking = false, speed = 'walk', className = '',
}: {
  mood?: TrustoMood
  size?: number
  animated?: boolean
  /** When true, arms/legs swing through a walk cycle instead of idling. */
  walking?: boolean
  /** Governs how fast the walk cycle plays — 'run' is snappier and bouncier. */
  speed?: 'walk' | 'run'
  className?: string
}) {
  const accent = ACCENT[mood]
  const gradientId = `trusto-body-${mood}`
  const cycle = speed === 'run' ? 0.34 : 0.62
  const bob = animated && !walking ? { y: [0, -3, 0] } : walking ? { y: [0, -2, 0, -2, 0] } : undefined
  const bobTransition = walking
    ? { duration: cycle * 2, repeat: Infinity, ease: 'easeInOut' as const }
    : { duration: 2.6, repeat: Infinity, ease: 'easeInOut' as const }

  return (
    <motion.svg
      viewBox="0 0 64 64"
      width={size}
      height={size}
      className={className}
      animate={bob}
      transition={bob ? bobTransition : undefined}
    >
      <defs>
        <linearGradient id={gradientId} x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#60a5fa" />
          <stop offset="100%" stopColor="#1d4ed8" />
        </linearGradient>
        <radialGradient id="trusto-highlight" cx="35%" cy="25%" r="60%">
          <stop offset="0%" stopColor="#ffffff" stopOpacity="0.55" />
          <stop offset="100%" stopColor="#ffffff" stopOpacity="0" />
        </radialGradient>
      </defs>

      {/* back arm (renders behind torso so the swing reads as 3D) */}
      <motion.g
        style={{ transformOrigin: '50px 33px' }}
        animate={walking ? { rotate: speed === 'run' ? [24, -24, 24] : [16, -16, 16] } : undefined}
        transition={walking ? { duration: cycle, repeat: Infinity, ease: 'easeInOut' } : undefined}
      >
        <rect x="47" y="32" width="6.5" height="15" rx="3.25" fill={`url(#${gradientId})`} />
      </motion.g>

      {/* legs */}
      <motion.g
        style={{ transformOrigin: '27px 46px' }}
        animate={walking ? { rotate: speed === 'run' ? [-26, 26, -26] : [-18, 18, -18] } : undefined}
        transition={walking ? { duration: cycle, repeat: Infinity, ease: 'easeInOut' } : undefined}
      >
        <rect x="23" y="45" width="8" height="14" rx="4" fill={`url(#${gradientId})`} />
      </motion.g>
      <motion.g
        style={{ transformOrigin: '37px 46px' }}
        animate={walking ? { rotate: speed === 'run' ? [26, -26, 26] : [18, -18, 18] } : undefined}
        transition={walking ? { duration: cycle, repeat: Infinity, ease: 'easeInOut' } : undefined}
      >
        <rect x="33" y="45" width="8" height="14" rx="4" fill={`url(#${gradientId})`} />
      </motion.g>

      {/* torso */}
      <rect x="20" y="29" width="24" height="19" rx="9" fill={`url(#${gradientId})`} />
      <rect x="20" y="29" width="24" height="19" rx="9" fill="url(#trusto-highlight)" />

      {/* front arm */}
      <motion.g
        style={{ transformOrigin: '14px 33px' }}
        animate={walking ? { rotate: speed === 'run' ? [-24, 24, -24] : [-16, 16, -16] } : undefined}
        transition={walking ? { duration: cycle, repeat: Infinity, ease: 'easeInOut' } : undefined}
      >
        <rect x="10.5" y="32" width="6.5" height="15" rx="3.25" fill={`url(#${gradientId})`} />
      </motion.g>

      {/* antenna */}
      <line x1="32" y1="2" x2="32" y2="7.5" stroke="#94a3b8" strokeWidth="2.2" strokeLinecap="round" />
      <motion.circle
        cx="32" cy="1.5" r="2.4" fill={accent}
        animate={animated ? { opacity: [1, 0.5, 1] } : undefined}
        transition={animated ? { duration: 1.6, repeat: Infinity, ease: 'easeInOut' } : undefined}
      />

      {/* head */}
      <rect x="15" y="6" width="34" height="27" rx="13" fill={`url(#${gradientId})`} />
      <rect x="15" y="6" width="34" height="27" rx="13" fill="url(#trusto-highlight)" />

      {/* face plate */}
      <rect x="20.5" y="13" width="23" height="16" rx="8" fill="#eff6ff" />
      <motion.g
        transform="translate(32, 21)"
        animate={animated ? { scaleY: [1, 1, 0.1, 1] } : undefined}
        transition={animated ? { duration: 3.4, repeat: Infinity, ease: 'easeInOut', times: [0, 0.85, 0.92, 1] } : undefined}
        style={{ transformOrigin: '32px 21px' }}
      >
        <Face mood={mood} />
      </motion.g>

      {/* side ears/lights */}
      <circle cx="16" cy="19.5" r="2.3" fill={accent} opacity="0.85" />
      <circle cx="48" cy="19.5" r="2.3" fill={accent} opacity="0.85" />
    </motion.svg>
  )
}
