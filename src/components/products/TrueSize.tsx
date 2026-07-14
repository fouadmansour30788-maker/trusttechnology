'use client'
import { useEffect, useState } from 'react'
import { Ruler, X, CreditCard } from 'lucide-react'

const CARD_MM = 85.6 // ISO credit-card width — the universal calibration object

/** Parse a screen diagonal (inches) from a spec string or product name. */
export function parseScreenInches(text: string): number | null {
  const m = text.match(/(\d{2}(?:\.\d)?)\s*(?:"|″|”|''|\s?-?\s?inch)/i)
  if (!m) return null
  const inches = parseFloat(m[1])
  return inches >= 10 && inches <= 49 ? inches : null
}

function aspectFor(text: string): { w: number; h: number } {
  if (/16:10|wuxga|1920\s?x\s?1200|2560\s?x\s?1600|2880\s?x\s?1800/i.test(text)) return { w: 16, h: 10 }
  if (/3:2|2256\s?x\s?1504|2880\s?x\s?1920/i.test(text)) return { w: 3, h: 2 }
  return { w: 16, h: 9 }
}

export function TrueSize({ productName, screenText }: { productName: string; screenText: string }) {
  const inches = parseScreenInches(screenText) ?? parseScreenInches(productName)
  const [open, setOpen] = useState(false)
  const [pxPerMm, setPxPerMm] = useState<number | null>(null)
  const [cardPx, setCardPx] = useState(320)

  useEffect(() => {
    const saved = localStorage.getItem('tt-px-per-mm')
    if (saved) setPxPerMm(Number(saved))
  }, [])

  if (!inches) return null

  const { w, h } = aspectFor(screenText + ' ' + productName)
  const diagMm = inches * 25.4
  const widthMm = diagMm * (w / Math.sqrt(w * w + h * h))
  const heightMm = diagMm * (h / Math.sqrt(w * w + h * h))

  function confirmCalibration() {
    const ppm = cardPx / CARD_MM
    localStorage.setItem('tt-px-per-mm', String(ppm))
    setPxPerMm(ppm)
  }

  return (
    <>
      <button onClick={() => setOpen(true)}
        className="inline-flex items-center gap-1.5 text-sm font-medium text-blue-600 hover:text-blue-700">
        <Ruler size={14} /> See the {inches}″ screen at real size
      </button>

      {open && (
        <div className="fixed inset-0 z-[60] bg-slate-900/50 backdrop-blur-sm flex items-center justify-center p-4" onClick={() => setOpen(false)}>
          <div className="bg-white rounded-2xl shadow-2xl max-w-3xl w-full max-h-[90vh] overflow-auto p-6" onClick={(e) => e.stopPropagation()}>
            <div className="flex items-start justify-between gap-4 mb-4">
              <div>
                <p className="font-bold text-slate-900">True-size preview — {inches}″ screen</p>
                <p className="text-xs text-slate-400 mt-0.5">{productName}</p>
              </div>
              <button onClick={() => setOpen(false)} className="p-2 text-slate-400 hover:text-slate-900 hover:bg-slate-100 rounded-lg shrink-0"><X size={18} /></button>
            </div>

            {pxPerMm === null ? (
              <div>
                <p className="text-sm text-slate-600 leading-relaxed mb-4">
                  <CreditCard size={15} className="inline text-blue-600 mr-1" />
                  One-time setup: hold any bank/ID card against your screen and drag the slider until the
                  outline matches your card’s width exactly.
                </p>
                <div className="border-2 border-dashed border-blue-400 rounded-lg bg-blue-50/50 mb-4 flex items-center justify-center"
                  style={{ width: cardPx, height: cardPx * (53.98 / 85.6), maxWidth: '100%' }}>
                  <span className="text-xs text-blue-500">match your card to this box</span>
                </div>
                <input type="range" min={150} max={Math.min(700, typeof window !== 'undefined' ? window.innerWidth - 80 : 700)} value={cardPx}
                  onChange={(e) => setCardPx(Number(e.target.value))} className="w-full mb-4" />
                <button onClick={confirmCalibration}
                  className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-5 py-2.5 rounded-xl">
                  It matches — show me the screen
                </button>
              </div>
            ) : (
              <div>
                <p className="text-sm text-slate-600 mb-3">
                  This rectangle is the <span className="font-semibold">actual physical size</span> of the {inches}″ display
                  ({Math.round(widthMm / 10)} × {Math.round(heightMm / 10)} cm).
                  {widthMm * pxPerMm > (typeof window !== 'undefined' ? window.innerWidth - 100 : 800) && ' It’s bigger than this window — scroll inside the box.'}
                </p>
                <div className="overflow-auto border border-slate-200 rounded-xl p-4 bg-slate-50">
                  <div className="relative bg-slate-900 rounded-md shrink-0"
                    style={{ width: widthMm * pxPerMm, height: heightMm * pxPerMm }}>
                    <span className="absolute inset-0 flex items-center justify-center text-slate-500 text-sm">{inches}″ · {w}:{h}</span>
                    {/* credit card for scale */}
                    <div className="absolute bottom-3 right-3 border border-slate-500 rounded-sm bg-slate-700/60 flex items-center justify-center"
                      style={{ width: CARD_MM * pxPerMm, height: 53.98 * pxPerMm }}>
                      <span className="text-[10px] text-slate-400">your card</span>
                    </div>
                  </div>
                </div>
                <button onClick={() => setPxPerMm(null)} className="mt-3 text-xs text-slate-400 hover:text-slate-600">Re-calibrate</button>
              </div>
            )}
          </div>
        </div>
      )}
    </>
  )
}
