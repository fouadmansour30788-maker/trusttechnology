'use client'

const MUTE_KEY = 'trusto-voice-muted'

/** Segment-based so a line can code-switch languages (e.g. English "Hi!" then
 * Lebanese Arabic) — each segment gets its own utterance with its own voice/lang,
 * spoken back-to-back via the browser's speech queue. */
type Segment = { text: string; lang: 'en-US' | 'ar' }
export type Greeting = Segment[]

/** A handful of short, friendly bilingual greetings — casual Lebanese-store
 * mascot voice, not a script. Arabic written in script (not transliterated)
 * since that's what gives the speech engine a real Arabic voice to read with,
 * rather than an English voice mangling romanized text. */
export const TRUSTO_GREETINGS: Greeting[] = [
  [{ text: 'Hi!', lang: 'en-US' }, { text: 'أنا هون، تعا شوف شو عنا.', lang: 'ar' }],
  [{ text: 'Hey!', lang: 'en-US' }, { text: 'أنا ناطركن، قوليلي شو بدك.', lang: 'ar' }],
  [{ text: 'Welcome!', lang: 'en-US' }, { text: 'تفضل، أنا ترستو، جاهز ساعدك.', lang: 'ar' }],
]

export function isTrustoVoiceMuted(): boolean {
  if (typeof window === 'undefined') return true
  return localStorage.getItem(MUTE_KEY) === '1'
}

export function setTrustoVoiceMuted(muted: boolean) {
  if (typeof window === 'undefined') return
  localStorage.setItem(MUTE_KEY, muted ? '1' : '0')
  if (muted) window.speechSynthesis?.cancel()
}

/** Speaks a greeting via the browser's built-in TTS. Silently no-ops if
 * unsupported, muted, or a voice for the language isn't available — this is
 * a nice-to-have flourish, never something the UI depends on. */
export function speakTrusto(greeting: Greeting) {
  if (typeof window === 'undefined') return
  const synth = window.speechSynthesis
  if (!synth || isTrustoVoiceMuted()) return
  synth.cancel()
  for (const seg of greeting) {
    const utter = new SpeechSynthesisUtterance(seg.text)
    utter.lang = seg.lang
    utter.pitch = 1.15
    utter.rate = 1.02
    synth.speak(utter)
  }
}

export function randomGreeting(): Greeting {
  return TRUSTO_GREETINGS[Math.floor(Math.random() * TRUSTO_GREETINGS.length)]
}
