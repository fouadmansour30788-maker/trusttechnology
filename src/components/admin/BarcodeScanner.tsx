'use client'
import { useEffect, useRef, useState } from 'react'
import { ScanBarcode, Camera, X } from 'lucide-react'
import type { ProductLite } from '@/lib/erp'

const norm = (s: string) => s.toUpperCase().replace(/[^A-Z0-9]/g, '')

type BarcodeDetectorLike = { detect: (source: CanvasImageSource) => Promise<{ rawValue: string }[]> }

function getDetector(): BarcodeDetectorLike | null {
  const w = window as unknown as { BarcodeDetector?: new (opts?: { formats?: string[] }) => BarcodeDetectorLike }
  if (!w.BarcodeDetector) return null
  try {
    return new w.BarcodeDetector({ formats: ['ean_13', 'ean_8', 'code_128', 'code_39', 'upc_a', 'upc_e', 'qr_code'] })
  } catch {
    return null
  }
}

/**
 * Counter barcode input: works with USB/Bluetooth scanner guns (they type the
 * code + Enter) and, on Chrome/Android, with the device camera.
 * Looks up products by SKU and hands the match to the sale form.
 */
export function BarcodeScanner({ products, onFound }: { products: ProductLite[]; onFound: (p: ProductLite) => void }) {
  const [code, setCode] = useState('')
  const [flash, setFlash] = useState<string | null>(null)
  const [cameraOpen, setCameraOpen] = useState(false)
  const videoRef = useRef<HTMLVideoElement>(null)
  const stopRef = useRef<() => void>(() => {})
  const [cameraSupported, setCameraSupported] = useState(false)

  useEffect(() => { setCameraSupported(getDetector() !== null) }, [])
  useEffect(() => () => stopRef.current(), [])

  function lookup(raw: string) {
    const n = norm(raw)
    if (n.length < 3) return
    const hit = products.find((p) => p.sku && norm(p.sku) === n)
    if (hit) {
      onFound(hit)
      setFlash(`✓ ${hit.name.slice(0, 40)}`)
    } else {
      setFlash(`No product with barcode/SKU “${raw.trim()}”`)
    }
    setCode('')
    setTimeout(() => setFlash(null), 2500)
  }

  async function openCamera() {
    const detector = getDetector()
    if (!detector) return
    setCameraOpen(true)
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ video: { facingMode: 'environment' } })
      const video = videoRef.current
      if (!video) return
      video.srcObject = stream
      await video.play()
      let active = true
      stopRef.current = () => {
        active = false
        stream.getTracks().forEach((t) => t.stop())
      }
      const scan = async () => {
        if (!active) return
        try {
          const codes = await detector.detect(video)
          if (codes.length > 0 && codes[0].rawValue) {
            stopRef.current()
            setCameraOpen(false)
            lookup(codes[0].rawValue)
            return
          }
        } catch { /* frame not ready */ }
        requestAnimationFrame(scan)
      }
      scan()
    } catch {
      setCameraOpen(false)
      setFlash('Camera unavailable — check permissions.')
      setTimeout(() => setFlash(null), 2500)
    }
  }

  function closeCamera() {
    stopRef.current()
    setCameraOpen(false)
  }

  return (
    <div className="mb-4">
      <div className="flex gap-2">
        <div className="flex items-center gap-2 flex-1 bg-slate-50 border border-slate-200 rounded-xl px-3">
          <ScanBarcode size={16} className="text-blue-600 shrink-0" />
          <input
            value={code}
            onChange={(e) => setCode(e.target.value)}
            onKeyDown={(e) => { if (e.key === 'Enter') { e.preventDefault(); lookup(code) } }}
            placeholder="Scan barcode or type SKU + Enter"
            className="flex-1 bg-transparent py-2.5 text-sm text-slate-900 placeholder-slate-400 outline-none"
          />
        </div>
        {cameraSupported && (
          <button type="button" onClick={openCamera}
            className="inline-flex items-center gap-1.5 text-xs font-semibold text-blue-700 bg-blue-50 hover:bg-blue-100 rounded-xl px-3.5"
            title="Scan with camera">
            <Camera size={14} /> Camera
          </button>
        )}
      </div>
      {flash && (
        <p className={`text-xs mt-1.5 ${flash.startsWith('✓') ? 'text-emerald-600' : 'text-amber-600'}`}>{flash}</p>
      )}

      {cameraOpen && (
        <div className="fixed inset-0 z-[70] bg-slate-900/80 flex items-center justify-center p-4" onClick={closeCamera}>
          <div className="bg-white rounded-2xl overflow-hidden max-w-md w-full" onClick={(e) => e.stopPropagation()}>
            <div className="flex items-center justify-between px-4 py-3 border-b border-slate-100">
              <p className="text-sm font-semibold text-slate-900">Point the camera at the barcode</p>
              <button onClick={closeCamera} className="p-1.5 text-slate-400 hover:text-slate-900"><X size={16} /></button>
            </div>
            {/* eslint-disable-next-line jsx-a11y/media-has-caption */}
            <video ref={videoRef} className="w-full aspect-[4/3] object-cover bg-black" playsInline muted />
          </div>
        </div>
      )}
    </div>
  )
}
