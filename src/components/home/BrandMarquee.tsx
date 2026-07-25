'use client'

// Brands we actually carry. SVG logos where available (Simple Icons, CC0),
// each with its official brand color baked into the file itself — an <img>
// can't be recolored with CSS, so the fill has to live in the SVG. The rest
// render as a clean wordmark so the strip stays uniform. No Simple Icons
// entry exists for Brother, so it stays a wordmark rather than sourcing a
// logo from somewhere with unclear licensing.
const BRANDS: { name: string; logo?: string }[] = [
  { name: 'Apple', logo: '/brands/apple.svg' },
  { name: 'Dell', logo: '/brands/dell.svg' },
  { name: 'HP', logo: '/brands/hp.svg' },
  { name: 'Lenovo', logo: '/brands/lenovo.svg' },
  { name: 'Acer', logo: '/brands/acer.svg' },
  { name: 'MSI', logo: '/brands/msibusiness.svg' },
  { name: 'NEC', logo: '/brands/nec.svg' },
  { name: 'Kyocera', logo: '/brands/kyocera.svg' },
  { name: 'Gigabyte' },
  { name: 'Philips' },
  { name: 'Cedar' },
  { name: 'Brother' },
]

export function BrandMarquee() {
  const row = [...BRANDS, ...BRANDS]
  return (
    <section className="py-10 border-y border-slate-200/70 bg-white/50">
      <p className="text-center text-xs uppercase tracking-widest text-slate-400 font-semibold mb-7">
        Authorized dealer for the brands you trust
      </p>
      <div className="relative overflow-hidden [mask-image:linear-gradient(to_right,transparent,black_12%,black_88%,transparent)]">
        <div className="flex w-max items-center animate-marquee gap-14 px-7">
          {row.map((b, i) => (
            <div key={`${b.name}-${i}`} className="shrink-0 flex items-center h-8 select-none" title={b.name}>
              {b.logo ? (
                // eslint-disable-next-line @next/next/no-img-element
                <img
                  src={b.logo}
                  alt={b.name}
                  className="h-7 w-auto max-w-[120px] object-contain opacity-90 hover:opacity-100 hover:scale-105 transition-all duration-300"
                />
              ) : (
                <span className="text-2xl md:text-3xl font-bold text-slate-300 hover:text-blue-600 transition-colors whitespace-nowrap">
                  {b.name}
                </span>
              )}
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
