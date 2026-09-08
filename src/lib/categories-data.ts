import { Monitor, Laptop, Printer, Package, Apple, Zap, type LucideIcon } from 'lucide-react'

export type Category = {
  id: number; label: string; sublabel: string; href: string
  icon: LucideIcon; image: string; blurb: string
}

export const CATEGORIES: Category[] = [
  {
    id: 1, label: 'Computing', sublabel: 'Laptops & Desktops', href: '/categories/computing',
    icon: Laptop, image: '/products/lenovo-thinkpad-t14-g6-3d.png',
    blurb: 'High-performance laptops and desktops for work, study and play.',
  },
  {
    id: 2, label: 'Apple Collection', sublabel: 'Mac · iPhone · iPad', href: '/categories/apple',
    icon: Apple, image: '/products/apple-macbook-pro-16-m5-max-48gb-2tb-ssd-space-black-3d.png',
    blurb: 'Genuine Apple devices with full warranty and expert setup.',
  },
  {
    id: 3, label: 'Displays', sublabel: 'Monitors & POS Screens', href: '/categories/displays',
    icon: Monitor, image: '/products/lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz-3d.jpg',
    blurb: 'From FHD office monitors to ultrawide and 4K creator displays.',
  },
  {
    id: 4, label: 'Printing', sublabel: 'Inkjet · Laser · Toner', href: '/categories/printing',
    icon: Printer, image: '/products/brother-mfc-l2750dw-3d.png',
    blurb: 'Printers and genuine-quality toner & ink for home and office.',
  },
  {
    id: 5, label: 'Professional', sublabel: 'POS · Storage · Networking', href: '/categories/professional',
    icon: Package, image: '/products/appostars-ap-t3-g4-3d.png',
    blurb: 'Complete POS systems, scanners and networking for your business.',
  },
  {
    id: 6, label: 'Bundle & Save', sublabel: 'Curated deals — up to 20% off', href: '/bundles',
    icon: Zap, image: '/products/asus-rog-strix-scar-edition-18-g835lx-s9113-3d.png',
    blurb: 'Pre-matched setups for gaming, business and retail at a discount.',
  },
]
