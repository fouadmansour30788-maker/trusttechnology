import Link from 'next/link'
import Image from 'next/image'
import type { Product } from '@/lib/types'

// Apple.com-style 2x2 hero tiles: one flagship product each, a bold
// headline, a short honest subhead (no invented marketing claims — just
// real specs pulled from the product), soft tinted backgrounds, and
// Learn more / Buy links straight to the product page.
export type LineupTile = {
  product: Product
  headline: string
  subhead: string
  bg: string
  imgClassName?: string
}

export function HeroLineup({ tiles }: { tiles: LineupTile[] }) {
  if (tiles.length === 0) return null
  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 sm:gap-5">
        {tiles.map((t) => (
          <Tile key={t.product.id} tile={t} />
        ))}
      </div>
    </section>
  )
}

function Tile({ tile: t }: { tile: LineupTile }) {
  const onRequest = t.product.priceOnRequest || t.product.price === 0
  return (
    <div className={`relative overflow-hidden rounded-3xl ${t.bg} pt-10 px-8 sm:px-10 pb-0 min-h-[420px] flex flex-col`}>
      <div className="relative z-10 text-center">
        <h3 className="text-2xl sm:text-[2rem] font-bold tracking-tight leading-tight">{t.headline}</h3>
        <p className="mt-1.5 text-sm sm:text-base opacity-80">{t.subhead}</p>
        <div className="mt-4 flex items-center justify-center gap-5 text-sm font-medium">
          <Link href={`/products/${t.product.slug}`} className="underline underline-offset-4 hover:opacity-70 transition-opacity">
            Learn more
          </Link>
          <Link href={`/products/${t.product.slug}`} className="underline underline-offset-4 hover:opacity-70 transition-opacity">
            {onRequest ? 'Ask price' : `Buy — $${t.product.price.toFixed(0)}`}
          </Link>
        </div>
      </div>
      <Link
        href={`/products/${t.product.slug}`}
        className="relative flex-1 mt-6 block"
        aria-label={t.product.name}
      >
        {t.product.images[0] && (
          <Image
            src={t.product.images[0]}
            alt={t.product.name}
            fill
            sizes="(max-width:640px) 90vw, 45vw"
            className={t.imgClassName ?? 'object-contain object-bottom p-4'}
          />
        )}
      </Link>
    </div>
  )
}
