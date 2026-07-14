export type Guide = {
  slug: string
  title: string
  description: string
  emoji: string
  updated: string
  sections: { heading: string; paragraphs: string[] }[]
  cta: { label: string; href: string }
}

export const GUIDES: Guide[] = [
  {
    slug: 'best-laptop-university-students-lebanon',
    title: 'How to choose a university laptop in Lebanon (2026)',
    description: 'What actually matters for AUB/LU/BAU/USEK students — specs by major, realistic budgets in USD, and the mistakes to avoid.',
    emoji: '🎓',
    updated: '2026-07',
    sections: [
      {
        heading: 'Start from your major, not the brand',
        paragraphs: [
          'Business, law and humanities need reliability and battery life, not power: a Core i5 / Ryzen 5 with 8–16GB RAM and a 512GB SSD is plenty, usually $450–700.',
          'Engineering and architecture students running AutoCAD, Revit or SolidWorks need 16GB RAM minimum and a dedicated GPU (RTX 4050/5050 class) — realistically $800–1,300. Skimping here means fighting your laptop for five years.',
          'Computer science sits in between: prioritize 16GB RAM and a fast SSD over a GPU unless you work with ML or game engines.',
        ],
      },
      {
        heading: 'The specs that actually matter',
        paragraphs: [
          'RAM is the #1 regret purchase — 8GB feels fine in the shop and cramped by second year. If two models differ only in RAM, take the 16GB.',
          'SSD only (no HDD-only machines in 2026), 512GB minimum if you can. Screen: 15.6″ FHD is the sweet spot; 14″ if you commute daily between campus and home.',
          'Battery: anything under 6 real hours will chain you to the wall sockets in the library — with Lebanon’s power situation, battery life matters twice.',
        ],
      },
      {
        heading: 'Budget reality in USD',
        paragraphs: [
          'Under $500: solid for office work and browsing — expect i3/Ryzen 3 or older i5, 8GB. $500–800: the value zone — modern i5/Ryzen 5, 16GB is findable. $800–1,300: engineering-grade with dedicated graphics. Above that you’re paying for gaming performance or premium builds.',
          'Every laptop we sell is genuine with a 1-year warranty, and you can pay cash on delivery anywhere in Lebanon.',
        ],
      },
      {
        heading: 'Avoid these mistakes',
        paragraphs: [
          'Don’t buy on CPU name alone — an i7 with 8GB RAM loses to an i5 with 16GB for real student workloads.',
          'Don’t ignore the charger and warranty situation on gray-market imports. And don’t buy a gaming brick if you carry your laptop every day — weight is a daily tax.',
        ],
      },
    ],
    cta: { label: 'Let the AI build your student setup', href: '/setup-builder' },
  },
  {
    slug: 'gaming-laptop-buying-guide-lebanon',
    title: 'Gaming laptop buying guide for Lebanon (2026)',
    description: 'RTX 4050 vs 5050 vs higher, what 144Hz really means, cooling, and how to spend your budget where frames come from.',
    emoji: '🎮',
    updated: '2026-07',
    sections: [
      {
        heading: 'GPU first — it decides everything',
        paragraphs: [
          'The graphics card sets your frame rate ceiling. RTX 4050/5050 class handles esports (FIFA, Valorant, CS2) at high refresh and AAA titles at medium — the value pick around $800–1,100.',
          'RTX 4060/5060 and up is where AAA at high settings lives, typically $1,100–1,700. Beyond that you’re buying headroom for the next five years.',
        ],
      },
      {
        heading: 'Match the screen to the GPU',
        paragraphs: [
          'A 144Hz panel only pays off if the GPU can feed it — which it can in esports titles even on a 4050. For AAA single-player, image quality beats refresh: FHD/144Hz is the sensible default, QHD only from the 4060 class up.',
        ],
      },
      {
        heading: 'The specs people forget',
        paragraphs: [
          '16GB RAM is the floor for modern games — some now recommend 32GB. Cooling design matters more than 100MHz of boost clock: thin “stealth” gaming laptops throttle; honest chunky ones sustain performance.',
          'With generator power schedules in Lebanon, check the power brick rating too — gaming laptops gaming on battery lose half their performance by design.',
        ],
      },
      {
        heading: 'Our honest advice',
        paragraphs: [
          'Use the “Will it work for me?” check on any product page — tell it the games you play and it judges that exact model. If a machine we sell won’t run your games well, it will say so.',
        ],
      },
    ],
    cta: { label: 'Browse gaming laptops', href: '/products?q=gaming' },
  },
  {
    slug: 'pos-system-guide-lebanon-shops',
    title: 'Setting up a POS system for your shop in Lebanon',
    description: 'What a minimarket, pharmacy or clothing store actually needs: POS terminal, barcode scanner, receipt printer — and what it costs.',
    emoji: '🧾',
    updated: '2026-07',
    sections: [
      {
        heading: 'The three-piece core',
        paragraphs: [
          'Every counter needs: a POS terminal or PC to run your software, a barcode scanner, and a thermal receipt printer. For most small shops this core lands between $400 and $900 depending on terminal quality.',
          'Add a cash drawer (triggered by the printer) and, for supermarkets, a label scale. Pharmacies usually add a second scanner for deliveries.',
        ],
      },
      {
        heading: 'All-in-one POS vs a normal PC',
        paragraphs: [
          'Purpose-built POS terminals (touchscreen, fanless, spill-resistant) survive counter life and look professional. A regular desktop + monitor is cheaper and easier to repair. If your shop runs long hours in heat, fanless POS hardware earns its price.',
        ],
      },
      {
        heading: 'Scanners: 1D vs 2D',
        paragraphs: [
          'A 1D laser scanner reads standard product barcodes and costs less. A 2D imager also reads QR codes (increasingly used for payments and invoices in Lebanon) and scans from phone screens — worth the small premium in 2026.',
        ],
      },
      {
        heading: 'We set shops up end to end',
        paragraphs: [
          'We supply and configure the full POS-and-barcode range, deliver anywhere in Lebanon, and back it with warranty. Tell us your shop type on WhatsApp and we’ll quote a complete setup.',
        ],
      },
    ],
    cta: { label: 'See POS & barcode hardware', href: '/categories/pos-systems' },
  },
]
