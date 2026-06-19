import type { NavCategory } from './types'

export const NAV_CATEGORIES: NavCategory[] = [
  {
    label: 'Computing',
    slug: 'computing',
    columns: [
      {
        title: 'Laptops',
        items: [
          { label: 'Business Laptops', slug: 'laptops?tag=business' },
          { label: 'Student Laptops', slug: 'laptops?tag=student' },
          { label: 'Gaming Laptops', slug: 'laptops?tag=gaming' },
          { label: 'Standard Laptops', slug: 'laptops' },
        ],
      },
      {
        title: 'Desktops',
        items: [
          { label: 'Office Desktops', slug: 'desktops?tag=business' },
          { label: 'Gaming Desktops', slug: 'desktops?tag=gaming' },
        ],
      },
      {
        title: 'Apple',
        items: [
          { label: 'MacBooks', slug: 'apple?type=laptop' },
          { label: 'iMacs', slug: 'imacs' },
          { label: 'Mac Mini', slug: 'apple?type=desktop' },
        ],
      },
    ],
    featured: { label: 'Gaming Bundles', slug: 'bundles?type=gaming', tag: 'gaming' },
  },
  {
    label: 'Peripherals',
    slug: 'peripherals',
    columns: [
      {
        title: 'Input Devices',
        items: [
          { label: 'Mice', slug: 'mice' },
          { label: 'Keyboards', slug: 'keyboards' },
          { label: 'Webcams', slug: 'webcams' },
        ],
      },
      {
        title: 'Audio & Comfort',
        items: [
          { label: 'Headsets', slug: 'headsets' },
          { label: 'Bags & Cases', slug: 'bags' },
        ],
      },
    ],
  },
  {
    label: 'Displays',
    slug: 'displays',
    columns: [
      {
        title: 'Displays',
        items: [
          { label: 'Monitors', slug: 'monitors' },
          { label: 'POS Touch Screens', slug: 'pos-touch-screens' },
        ],
      },
    ],
  },
  {
    label: 'Printing',
    slug: 'printing',
    columns: [
      {
        title: 'Printers',
        items: [
          { label: 'Inkjet Printers', slug: 'inkjet' },
          { label: 'Laser Printers', slug: 'laser' },
          { label: 'Photocopiers', slug: 'photocopiers' },
        ],
      },
      {
        title: 'Consumables',
        items: [
          { label: 'Ink & Toner Finder', slug: 'ink-toner' },
        ],
      },
    ],
    featured: { label: 'Ink & Toner Finder', slug: 'ink-toner' },
  },
  {
    label: 'Professional',
    slug: 'professional',
    columns: [
      {
        title: 'Business Solutions',
        items: [
          { label: 'POS Systems', slug: 'pos-systems' },
          { label: 'Storage (SSD/HDD)', slug: 'storage' },
          { label: 'Networking', slug: 'networking' },
        ],
      },
    ],
    featured: { label: 'POS Bundles', slug: 'bundles?type=pos', tag: 'pos' },
  },
  {
    label: 'Apple',
    slug: 'apple',
    columns: [
      {
        title: 'Apple Collection',
        items: [
          { label: 'MacBooks', slug: 'apple?type=laptop' },
          { label: 'iMacs', slug: 'imacs' },
          { label: 'iPad', slug: 'apple?type=tablet' },
          { label: 'iPhone', slug: 'apple?type=phone' },
          { label: 'Apple Watch', slug: 'apple?type=watch' },
          { label: 'Accessories', slug: 'apple?type=accessory' },
        ],
      },
    ],
  },
]
