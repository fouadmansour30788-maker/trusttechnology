'use client'

const BRANDS = ['Apple', 'Dell', 'HP', 'Lenovo', 'Acer', 'MSI', 'Gigabyte', 'Philips', 'NEC', 'Cedar']

export function BrandMarquee() {
  const row = [...BRANDS, ...BRANDS]
  return (
    <section className="py-10 border-y border-slate-200/70 bg-white/50">
      <p className="text-center text-xs uppercase tracking-widest text-slate-400 font-semibold mb-6">
        Authorized dealer for the brands you trust
      </p>
      <div className="relative overflow-hidden [mask-image:linear-gradient(to_right,transparent,black_12%,black_88%,transparent)]">
        <div className="flex w-max animate-marquee gap-12 px-6">
          {row.map((b, i) => (
            <span
              key={`${b}-${i}`}
              className="text-2xl md:text-3xl font-bold text-slate-300 hover:text-blue-600 transition-colors whitespace-nowrap select-none"
            >
              {b}
            </span>
          ))}
        </div>
      </div>
    </section>
  )
}
