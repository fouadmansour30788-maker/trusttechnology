-- Rich product-page content for all 55 printing-category products (HP,
-- Canon, Epson) -- the final catalog category. Descriptions, key
-- features, expanded specs and warranty text, parsed from the
-- supplier's own already-detailed description field (speed, resolution,
-- duty cycle, memory, connectivity, functions) into structured specs
-- and real prose. Fixes two data-entry typos caught during review and
-- verified against Canon's own spec pages: Pixma G4470's '110.0 ipm'
-- (should be 11.0 ipm) and LBP646Cdw's '25PM' (should be 25ppm).

UPDATE products SET
  description = $$EPSON TM-T20X (051) Thermal Receipt Printer is Epson's dependable, high-volume entry-level receipt printer, printing thermal receipts at up to 200mm/sec over USB + Serial.

Like the rest of Epson's TM series, it's built for continuous daily use at the counter, with the reliability retailers and restaurants depend on for fast, unattended receipt printing.$$,
  key_features = ARRAY[$$Up to 200mm/sec Print Speed: fast receipt printing even during busy periods.$$, $$USB + Serial Connectivity: drops into most POS setups.$$, $$Thermal Printing: no ink or toner to replace, low running cost.$$],
  specs = $${"Brand": "Epson", "Product Type": "Thermal Receipt Printer", "Model": "TM-T20X", "SKU": "C31CH26051", "Print Speed": "200mm/sec", "Interface": "USB + Serial"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'epson-tm-t20x-051-thermal-receipt-printer';

UPDATE products SET
  description = $$EPSON TM-T20X (052) Thermal Receipt Printer is Epson's dependable, high-volume entry-level receipt printer, printing thermal receipts at up to 200mm/sec over LAN.

Like the rest of Epson's TM series, it's built for continuous daily use at the counter, with the reliability retailers and restaurants depend on for fast, unattended receipt printing.$$,
  key_features = ARRAY[$$Up to 200mm/sec Print Speed: fast receipt printing even during busy periods.$$, $$LAN Connectivity: drops into most POS setups.$$, $$Thermal Printing: no ink or toner to replace, low running cost.$$],
  specs = $${"Brand": "Epson", "Product Type": "Thermal Receipt Printer", "Model": "TM-T20X", "SKU": "C31CH26052", "Print Speed": "200mm/sec", "Interface": "LAN"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'epson-tm-t20x-052-thermal-receipt-printer';

UPDATE products SET
  description = $$EPSON TM-T20III (011) Thermal Receipt Printer is a fast, reliable mid-range receipt printer for busy counters, printing thermal receipts at up to 250mm/sec over USB + Serial.

Like the rest of Epson's TM series, it's built for continuous daily use at the counter, with the reliability retailers and restaurants depend on for fast, unattended receipt printing.$$,
  key_features = ARRAY[$$Up to 250mm/sec Print Speed: fast receipt printing even during busy periods.$$, $$USB + Serial Connectivity: drops into most POS setups.$$, $$Thermal Printing: no ink or toner to replace, low running cost.$$],
  specs = $${"Brand": "Epson", "Product Type": "Thermal Receipt Printer", "Model": "TM-T20III", "SKU": "C31CH51011", "Print Speed": "250mm/sec", "Interface": "USB + Serial"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'epson-tm-t20iii-011-thermal-receipt-printer';

UPDATE products SET
  description = $$EPSON TM-T20III (012) Thermal Receipt Printer is a fast, reliable mid-range receipt printer for busy counters, printing thermal receipts at up to 250mm/sec over LAN.

Like the rest of Epson's TM series, it's built for continuous daily use at the counter, with the reliability retailers and restaurants depend on for fast, unattended receipt printing.$$,
  key_features = ARRAY[$$Up to 250mm/sec Print Speed: fast receipt printing even during busy periods.$$, $$LAN Connectivity: drops into most POS setups.$$, $$Thermal Printing: no ink or toner to replace, low running cost.$$],
  specs = $${"Brand": "Epson", "Product Type": "Thermal Receipt Printer", "Model": "TM-T20III", "SKU": "C31CH51012", "Print Speed": "250mm/sec", "Interface": "LAN"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'epson-tm-t20iii-012-thermal-receipt-printer';

UPDATE products SET
  description = $$EPSON TM-M30II (122) Thermal Receipt Printer is a compact, modern receipt printer with fast print speed and flexible connectivity, printing thermal receipts at up to 250mm/sec over USB + LAN + Near Field Communication (NFC).

Like the rest of Epson's TM series, it's built for continuous daily use at the counter, with the reliability retailers and restaurants depend on for fast, unattended receipt printing.$$,
  key_features = ARRAY[$$Up to 250mm/sec Print Speed: fast receipt printing even during busy periods.$$, $$USB + LAN + Near Field Communication (NFC) Connectivity: drops into most POS setups.$$, $$Thermal Printing: no ink or toner to replace, low running cost.$$],
  specs = $${"Brand": "Epson", "Product Type": "Thermal Receipt Printer", "Model": "TM-M30II", "SKU": "C31CJ27122", "Print Speed": "250mm/sec", "Interface": "USB + LAN + Near Field Communication (NFC)"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'epson-tm-m30ii-122-thermal-receipt-printer';

UPDATE products SET
  description = $$EPSON TM-M30II (112) Thermal Receipt Printer is a compact, modern receipt printer with fast print speed and flexible connectivity, printing thermal receipts at up to 250mm/sec over USB + LAN + Bluetooth.

Like the rest of Epson's TM series, it's built for continuous daily use at the counter, with the reliability retailers and restaurants depend on for fast, unattended receipt printing.$$,
  key_features = ARRAY[$$Up to 250mm/sec Print Speed: fast receipt printing even during busy periods.$$, $$USB + LAN + Bluetooth Connectivity: drops into most POS setups.$$, $$Thermal Printing: no ink or toner to replace, low running cost.$$],
  specs = $${"Brand": "Epson", "Product Type": "Thermal Receipt Printer", "Model": "TM-M30II", "SKU": "C31CJ27112", "Print Speed": "250mm/sec", "Interface": "USB + LAN + Bluetooth"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'epson-tm-m30ii-112-thermal-receipt-printer';

UPDATE products SET
  description = $$EPSON LQ-350 is a 24-pin dot-matrix printer built for multi-part forms and carbon-copy printing that thermal and inkjet printers can't do — invoices, delivery notes and receipts needing original + 3 copies in a single pass.

It's a 80-column A4 printer rated for 300 cps (10 cpi) High Speed Draft, connecting over Parallel, USB and Serial to fit into existing office and warehouse setups.$$,
  key_features = ARRAY[$$Multi-Part Printing: original + 3 copies in one pass, ideal for invoices and delivery notes.$$, $$80-column A4 Format: fits standard multi-part business forms.$$, $$Rated 300 cps (10 cpi) High Speed Draft: fast draft-quality output for high-volume printing.$$, $$Parallel, USB and Serial Connectivity.$$],
  specs = $${"Brand": "Epson", "Product Type": "Dot Matrix Printer", "Print Head": "24-pin", "Format": "80-column (A4)", "Copies": "original + 3 copies", "Speed": "300 cps (10 cpi) High Speed Draft", "Connectivity": "Parallel, USB and Serial"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'epson-printer-lq-350-dot-matrix-a4-24-pins';

UPDATE products SET
  description = $$EPSON LQ-690II is a 24-pin dot-matrix printer built for multi-part forms and carbon-copy printing that thermal and inkjet printers can't do — invoices, delivery notes and receipts needing original + 6 copies in a single pass.

It's a 106-column A4 printer rated for 487 cps High Speed Draft, connecting over Parallel and USB 2.0 to fit into existing office and warehouse setups.$$,
  key_features = ARRAY[$$Multi-Part Printing: original + 6 copies in one pass, ideal for invoices and delivery notes.$$, $$106-column A4 Format: fits standard multi-part business forms.$$, $$Rated 487 cps High Speed Draft: fast draft-quality output for high-volume printing.$$, $$Parallel and USB 2.0 Connectivity.$$],
  specs = $${"Brand": "Epson", "Product Type": "Dot Matrix Printer", "Print Head": "24-pin", "Format": "106-column (A4)", "Copies": "original + 6 copies", "Speed": "487 cps High Speed Draft", "Connectivity": "Parallel and USB 2.0"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'epson-printer-lq-690ii-dot-matrix-a4-24-pins-flat-bed';

UPDATE products SET
  description = $$HP PSC D2320 is a 3-in-1 inkjet color A4 printer (Print/Scan/Copy), rated at 20ppm Black | 16ppm color with 1200x1200dpi, 4800x1200dpi resolution.

It's rated for a 1000-page monthly duty cycle.$$,
  key_features = ARRAY[$$Print Speed: 20ppm Black | 16ppm color.$$, $$Resolution: 1200x1200dpi, 4800x1200dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$1000-Page Monthly Duty Cycle: built for sustained office/business use.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Inkjet, Color, A4)", "Print Speed": "20ppm Black | 16ppm color", "Resolution": "1200x1200dpi, 4800x1200dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "1000 pages/month", "Connectivity": "USB", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-psc-d2320-supplies-305-black-305-color';

UPDATE products SET
  description = $$HP PSC Ink Advantage 2875 is a 3-in-1 inkjet color A4 printer (Print/Scan/Copy), rated at 20ppm Black/16ppm color with 1200x1200dpi, 4800x1200dpi resolution.

Connects over Wi-Fi.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 1000-page monthly duty cycle, with 86MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20ppm Black/16ppm color.$$, $$Resolution: 1200x1200dpi, 4800x1200dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$, $$Mobile Printing: Apple AirPrint.$$, $$1000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$86MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Inkjet, Color, A4)", "Print Speed": "20ppm Black/16ppm color", "Resolution": "1200x1200dpi, 4800x1200dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "1000 pages/month", "Memory": "86MB", "Connectivity": "Wi-Fi", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-psc-ink-advantage-2875-supplies-653-black-653-color';

UPDATE products SET
  description = $$Deskjet Plus Ink Advantage 4276 is a 4-in-1 inkjet color A4 printer (Print/Scan/Copy/Fax), rated at 20ppm Black/16ppm color with 1200x1200dpi, 4800x1200dpi resolution.

Connects over Wi-Fi, with an automatic document feeder (ADF) for multi-page scan/copy jobs.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 1000-page monthly duty cycle, with 64MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20ppm Black/16ppm color.$$, $$Resolution: 1200x1200dpi, 4800x1200dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Mobile Printing: Apple AirPrint.$$, $$1000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$64MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Inkjet, Color, A4)", "Print Speed": "20ppm Black/16ppm color", "Resolution": "1200x1200dpi, 4800x1200dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "1000 pages/month", "Memory": "64MB", "Connectivity": "Wi-Fi", "ADF": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-deskjet-plus-ink-advantage-4276-supplies-653-black-653-color';

UPDATE products SET
  description = $$HP PSC 581 Smart Tank is a 3-in-1 inkjet color A4 printer (Print/Scan/Copy), rated at 22ppm Black/16ppm color with 1200x1200dpi, 4800x1200dpi resolution.

Connects over Wi-Fi, with a flatbed for books, photos and single sheets.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 3000-page monthly duty cycle.$$,
  key_features = ARRAY[$$Print Speed: 22ppm Black/16ppm color.$$, $$Resolution: 1200x1200dpi, 4800x1200dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$3000-Page Monthly Duty Cycle: built for sustained office/business use.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Inkjet, Color, A4)", "Print Speed": "22ppm Black/16ppm color", "Resolution": "1200x1200dpi, 4800x1200dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "3000 pages/month", "Connectivity": "Wi-Fi", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-psc-581-smart-tank-supplies-gt53-gt52';

UPDATE products SET
  description = $$HP PSC 530 Smart Tank is a 3-in-1 inkjet color A4 printer (Print/Scan/Copy), rated at 22ppm Black/16ppm color with 1200x1200dpi, 4800x1200dpi resolution.

Connects over Wi-Fi and Bluetooth, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 1000-page monthly duty cycle, with 256MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 22ppm Black/16ppm color.$$, $$Resolution: 1200x1200dpi, 4800x1200dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + Bluetooth.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Mobile Printing: Apple AirPrint.$$, $$1000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$256MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Inkjet, Color, A4)", "Print Speed": "22ppm Black/16ppm color", "Resolution": "1200x1200dpi, 4800x1200dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "1000 pages/month", "Memory": "256MB", "Connectivity": "Wi-Fi + Bluetooth", "ADF": "Yes", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-psc-530-smart-tank-supplies-gt53-gt52';

UPDATE products SET
  description = $$HP Officejet 9730 A3 All in one is a 3-in-1 inkjet color A3 printer (Print/Scan/Copy), rated at 34ppm Black / 34ppm Color with 1200x1200dpi, 4800x1200dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets, automatic two-sided (duplex) printing.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 30,000-page monthly duty cycle, with 512MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 34ppm Black / 34ppm Color.$$, $$Resolution: 1200x1200dpi, 4800x1200dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint.$$, $$30,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$512MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Inkjet, Color, A3)", "Print Speed": "34ppm Black / 34ppm Color", "Resolution": "1200x1200dpi, 4800x1200dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "30,000 pages/month", "Memory": "512MB", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-officejet-9730-a3-all-in-one-supplies-938-black-938-color';

UPDATE products SET
  description = $$HP Scanjet Pro 2600f1 is an archiving flatbed scanner for digitizing and archiving documents, scanning at up to 25ppm / 50ipm with 600dpi (ADF) / 1200dpi (flatbed) resolution.

A 60-sheet automatic document feeder handles multi-page jobs unattended, with duplex (two-sided) scanning in a single pass, rated for a 1,500-page daily duty cycle — built for sustained document-heavy office use. 64MB of onboard memory keeps scanning fast even on large batch jobs.$$,
  key_features = ARRAY[$$Up to 25ppm / 50ipm Scan Speed: fast digitization of multi-page documents.$$, $$600dpi (ADF) / 1200dpi (flatbed) Resolution: crisp, legible scans for archiving and OCR.$$, $$60-sheet Automatic Document Feeder with Duplex Scanning.$$, $$1,500-Page Daily Duty Cycle: built for sustained office document workloads.$$],
  specs = $${"Brand": "HP", "Product Type": "Document Scanner", "Scan Type": "Archiving Flatbed Scanner", "Resolution": "600dpi (ADF) / 1200dpi (flatbed)", "Scan Speed": "25ppm / 50ipm", "ADF Capacity": "60-sheet", "Duplex": "Yes", "Daily Duty Cycle": "1,500 pages", "Memory": "64MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-scanjet-pro-2600f1';

UPDATE products SET
  description = $$HP Scanjet Pro 3600f1 is an archiving flatbed scanner for digitizing and archiving documents, scanning at up to 30ppm / 60ipm with 600dpi (ADF) / 1200dpi (flatbed) resolution.

A 60-sheet automatic document feeder handles multi-page jobs unattended, with duplex (two-sided) scanning in a single pass, rated for a 3,000-page daily duty cycle — built for sustained document-heavy office use. 256MB of onboard memory keeps scanning fast even on large batch jobs.$$,
  key_features = ARRAY[$$Up to 30ppm / 60ipm Scan Speed: fast digitization of multi-page documents.$$, $$600dpi (ADF) / 1200dpi (flatbed) Resolution: crisp, legible scans for archiving and OCR.$$, $$60-sheet Automatic Document Feeder with Duplex Scanning.$$, $$3,000-Page Daily Duty Cycle: built for sustained office document workloads.$$],
  specs = $${"Brand": "HP", "Product Type": "Document Scanner", "Scan Type": "Archiving Flatbed Scanner", "Resolution": "600dpi (ADF) / 1200dpi (flatbed)", "Scan Speed": "30ppm / 60ipm", "ADF Capacity": "60-sheet", "Duplex": "Yes", "Daily Duty Cycle": "3,000 pages", "Memory": "256MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-scanjet-pro-3600f1';

UPDATE products SET
  description = $$HP Scanjet Pro 3000s4 is a sheet-fed scanner for digitizing and archiving documents, scanning at up to 40ppm / 80ipm with 600dpi optical resolution.

A 50-sheet automatic document feeder handles multi-page jobs unattended, with duplex (two-sided) scanning in a single pass, rated for a 4,000-page daily duty cycle — built for sustained document-heavy office use. 256MB of onboard memory keeps scanning fast even on large batch jobs.$$,
  key_features = ARRAY[$$Up to 40ppm / 80ipm Scan Speed: fast digitization of multi-page documents.$$, $$600dpi optical Resolution: crisp, legible scans for archiving and OCR.$$, $$50-sheet Automatic Document Feeder with Duplex Scanning.$$, $$4,000-Page Daily Duty Cycle: built for sustained office document workloads.$$],
  specs = $${"Brand": "HP", "Product Type": "Document Scanner", "Scan Type": "Sheet-Fed Scanner", "Resolution": "600dpi optical", "Scan Speed": "40ppm / 80ipm", "ADF Capacity": "50-sheet", "Duplex": "Yes", "Daily Duty Cycle": "4,000 pages", "Memory": "256MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-scanjet-pro-3000s4';

UPDATE products SET
  description = $$ScanJet Enterprise Flow 5000s5 is an enterprise flow sheet-fed scanner for digitizing and archiving documents, scanning at up to 65ppm / 130ipm with 600dpi optical resolution.

A 80-sheet automatic document feeder handles multi-page jobs unattended, with duplex (two-sided) scanning in a single pass, rated for a 7,500-page daily duty cycle — built for sustained document-heavy office use.$$,
  key_features = ARRAY[$$Up to 65ppm / 130ipm Scan Speed: fast digitization of multi-page documents.$$, $$600dpi optical Resolution: crisp, legible scans for archiving and OCR.$$, $$80-sheet Automatic Document Feeder with Duplex Scanning.$$, $$7,500-Page Daily Duty Cycle: built for sustained office document workloads.$$],
  specs = $${"Brand": "HP", "Product Type": "Document Scanner", "Scan Type": "Enterprise Flow Sheet-Fed Scanner", "Resolution": "600dpi optical", "Scan Speed": "65ppm / 130ipm", "ADF Capacity": "80-sheet", "Duplex": "Yes", "Daily Duty Cycle": "7,500 pages"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-scanjet-enterprise-flow-5000s5';

UPDATE products SET
  description = $$ScanJet Enterprise Flow 7000s3 is an enterprise flow sheet-fed scanner for digitizing and archiving documents, scanning at up to 75ppm / 150ipm with 600dpi optical resolution.

A 80-sheet automatic document feeder handles multi-page jobs unattended, with duplex (two-sided) scanning in a single pass, rated for a 7,500-page daily duty cycle — built for sustained document-heavy office use.$$,
  key_features = ARRAY[$$Up to 75ppm / 150ipm Scan Speed: fast digitization of multi-page documents.$$, $$600dpi optical Resolution: crisp, legible scans for archiving and OCR.$$, $$80-sheet Automatic Document Feeder with Duplex Scanning.$$, $$7,500-Page Daily Duty Cycle: built for sustained office document workloads.$$],
  specs = $${"Brand": "HP", "Product Type": "Document Scanner", "Scan Type": "Enterprise Flow Sheet-Fed Scanner", "Resolution": "600dpi optical", "Scan Speed": "75ppm / 150ipm", "ADF Capacity": "80-sheet", "Duplex": "Yes", "Daily Duty Cycle": "7,500 pages"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-scanjet-enterprise-flow-7000s3';

UPDATE products SET
  description = $$HP Laserjet M111a is a single-function laser mono A4 printer, rated at 20ppm with 600x600dpi resolution.

It's rated for a 8,000-page monthly duty cycle, with 16MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20ppm.$$, $$Resolution: 600x600dpi.$$, $$8,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$16MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "20ppm", "Resolution": "600x600dpi", "Duty Cycle": "8,000 pages/month", "Memory": "16MB", "Connectivity": "USB", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-m111a-supplies-w1500a';

UPDATE products SET
  description = $$HP Laserjet M111w is a single-function laser mono A4 printer, rated at 20ppm with 600x600dpi resolution.

Connects over Wi-Fi.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 8,000-page monthly duty cycle, with 32MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20ppm.$$, $$Resolution: 600x600dpi.$$, $$Connectivity: Wi-Fi.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$8,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$32MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "20ppm", "Resolution": "600x600dpi", "Duty Cycle": "8,000 pages/month", "Memory": "32MB", "Connectivity": "Wi-Fi", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-m111w-supplies-w1500a';

UPDATE products SET
  description = $$HP Laserjet Pro 4003n is a single-function laser mono A4 printer, rated at 40ppm with 1200dpi resolution.

Connects over wired network.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 80,000-page monthly duty cycle, with 256MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 40ppm.$$, $$Resolution: 1200dpi.$$, $$Connectivity: wired network.$$, $$Mobile Printing: Apple AirPrint.$$, $$80,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$256MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "40ppm", "Resolution": "1200dpi", "Duty Cycle": "80,000 pages/month", "Memory": "256MB", "Processor": "1200MHz", "Connectivity": "wired network", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-pro-4003n-supplies-w1510a';

UPDATE products SET
  description = $$HP Laserjet Pro 4003dn is a single-function laser mono A4 printer, rated at 40ppm with 1200dpi resolution.

Connects over wired network, with automatic two-sided (duplex) printing.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 80,000-page monthly duty cycle, with 256MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 40ppm.$$, $$Resolution: 1200dpi.$$, $$Connectivity: wired network.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint.$$, $$80,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$256MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "40ppm", "Resolution": "1200dpi", "Duty Cycle": "80,000 pages/month", "Memory": "256MB", "Processor": "1200MHz", "Connectivity": "wired network", "Duplex": "Yes", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-pro-4003dn-supplies-w1510a';

UPDATE products SET
  description = $$HP Laserjet Pro 4003dW is a single-function laser mono A4 printer, rated at 40ppm with 1200dpi resolution.

Connects over Wi-Fi and wired network, with automatic two-sided (duplex) printing.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 80,000-page monthly duty cycle, with 256MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 40ppm.$$, $$Resolution: 1200dpi.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint.$$, $$80,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$256MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "40ppm", "Resolution": "1200dpi", "Duty Cycle": "80,000 pages/month", "Memory": "256MB", "Processor": "1200MHz", "Connectivity": "Wi-Fi + wired network", "Duplex": "Yes", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-pro-4003dw-supplies-w1510a';

UPDATE products SET
  description = $$HP Laserjet Pro 501dn is a single-function laser mono A4 printer, rated at 45ppm with 600dpi resolution.

Connects over wired network, with automatic two-sided (duplex) printing.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 100,000-page monthly duty cycle, with 256MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 45ppm.$$, $$Resolution: 600dpi.$$, $$Connectivity: wired network.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint.$$, $$100,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$256MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "45ppm", "Resolution": "600dpi", "Duty Cycle": "100,000 pages/month", "Memory": "256MB", "Processor": "1500MHz", "Connectivity": "wired network", "Duplex": "Yes", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-pro-501dn-supplies-cf287a';

UPDATE products SET
  description = $$HP CLJ 150NW is a single-function laser color A4 printer, rated at 18ppm Black & 4ppm Color with 600x600dpi resolution.

Connects over Wi-Fi and wired network.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 20,000-page monthly duty cycle, with 64MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 18ppm Black & 4ppm Color.$$, $$Resolution: 600x600dpi.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Mobile Printing: Apple AirPrint.$$, $$20,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$64MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Color, A4)", "Print Speed": "18ppm Black & 4ppm Color", "Resolution": "600x600dpi", "Duty Cycle": "20,000 pages/month", "Memory": "64MB", "Processor": "400MHz", "Connectivity": "Wi-Fi + wired network", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-150nw-supplies-w2070a';

UPDATE products SET
  description = $$HP CLJ Pro 3203dw is a single-function laser color A4 printer, rated at 25ppm Black/Color with 600x600dpi resolution.

Connects over Wi-Fi and wired network, with automatic two-sided (duplex) printing.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 40,000-page monthly duty cycle, with 256MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 25ppm Black/Color.$$, $$Resolution: 600x600dpi.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint.$$, $$40,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$256MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Color, A4)", "Print Speed": "25ppm Black/Color", "Resolution": "600x600dpi", "Duty Cycle": "40,000 pages/month", "Memory": "256MB", "Connectivity": "Wi-Fi + wired network", "Duplex": "Yes", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-pro-3203dw-supplies-w2220a';

UPDATE products SET
  description = $$HP CLJ Pro 4203dw is a single-function laser color A4 printer, rated at 33ppm Black/Color with 600x600dpi resolution.

Connects over Wi-Fi and wired network and Bluetooth, with automatic two-sided (duplex) printing.

It's rated for a 50,000-page monthly duty cycle, with 512MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 33ppm Black/Color.$$, $$Resolution: 600x600dpi.$$, $$Connectivity: Wi-Fi + wired network + Bluetooth.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$50,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$512MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Color, A4)", "Print Speed": "33ppm Black/Color", "Resolution": "600x600dpi", "Duty Cycle": "50,000 pages/month", "Memory": "512MB", "Processor": "1.2GHz", "Connectivity": "Wi-Fi + wired network + Bluetooth", "Duplex": "Yes", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-pro-4203dw-supplies-w2300a';

UPDATE products SET
  description = $$HP CLJ 5225N A3 is a single-function laser color A3 printer, rated at 20ppm Black & Color with 600x600dpi resolution.

Connects over wired network.

It's rated for a 75,000-page monthly duty cycle, with 192MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20ppm Black & Color.$$, $$Resolution: 600x600dpi.$$, $$Connectivity: wired network.$$, $$75,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$192MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Color, A3)", "Print Speed": "20ppm Black & Color", "Resolution": "600x600dpi", "Duty Cycle": "75,000 pages/month", "Memory": "192MB", "Processor": "540MHz", "Connectivity": "wired network", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-5225n-a3-supplies-ce740a';

UPDATE products SET
  description = $$HP CLJ 5225DN A3 is a single-function laser color A3 printer, rated at 20ppm Black & Color with 600x600dpi resolution.

Connects over wired network, with automatic two-sided (duplex) printing.

It's rated for a 75,000-page monthly duty cycle, with 192MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20ppm Black & Color.$$, $$Resolution: 600x600dpi.$$, $$Connectivity: wired network.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$75,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$192MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "Printer (Laser, Color, A3)", "Print Speed": "20ppm Black & Color", "Resolution": "600x600dpi", "Duty Cycle": "75,000 pages/month", "Memory": "192MB", "Processor": "540MHz", "Connectivity": "wired network", "Duplex": "Yes", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-5225dn-a3-supplies-ce740a';

UPDATE products SET
  description = $$HP Laserjet MFP M141a is a 3-in-1 laser mono A4 printer (Print/Scan/Copy), rated at 20ppm with 600dpi resolution.

Connects over USB, with a flatbed for books, photos and single sheets.

It's rated for a 8,000-page monthly duty cycle, with 64MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20ppm.$$, $$Resolution: 600dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$8,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$64MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Mono, A4)", "Print Speed": "20ppm", "Resolution": "600dpi", "Duty Cycle": "8,000 pages/month", "Memory": "64MB", "Connectivity": "USB", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-mfp-m141a-supplies-w1500a';

UPDATE products SET
  description = $$HP Laserjet MFP M141W is a 3-in-1 laser mono A4 printer (Print/Scan/Copy), rated at 20ppm with 600dpi resolution.

Connects over Wi-Fi, with a flatbed for books, photos and single sheets.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 8,000-page monthly duty cycle, with 64MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20ppm.$$, $$Resolution: 600dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$, $$Mobile Printing: Apple AirPrint.$$, $$8,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$64MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Mono, A4)", "Print Speed": "20ppm", "Resolution": "600dpi", "Duty Cycle": "8,000 pages/month", "Memory": "64MB", "Connectivity": "Wi-Fi", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-mfp-m141w-supplies-w1500a';

UPDATE products SET
  description = $$HP Laserjet M137fnw mfp is a 4-in-1 laser mono A4 printer (Print/Scan/Copy/Fax), rated at 20 ppm with 600dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 10,000-page monthly duty cycle, with 128MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 20 ppm.$$, $$Resolution: 600dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Mobile Printing: Apple AirPrint.$$, $$10,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$128MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Mono, A4)", "Print Speed": "20 ppm", "Resolution": "600dpi", "Duty Cycle": "10,000 pages/month", "Memory": "128MB", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-m137fnw-mfp-supplies-w1106a';

UPDATE products SET
  description = $$HP Laserjet M236SDW mfp is a 3-in-1 laser mono A4 printer (Print/Scan/Copy), rated at 29ppm with 600dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, automatic two-sided (duplex) printing.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 20,000-page monthly duty cycle, with 64MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 29ppm.$$, $$Resolution: 600dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$20,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$64MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Mono, A4)", "Print Speed": "29ppm", "Resolution": "600dpi", "Duty Cycle": "20,000 pages/month", "Memory": "64MB", "Processor": "500MHz", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-m236sdw-mfp-supplies-w1360a';

UPDATE products SET
  description = $$HP Laserjet 4103dw mfp is a 3-in-1 laser mono A4 printer (Print/Scan/Copy), rated at 40ppm with 1200dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, automatic two-sided (duplex) printing.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 80,000-page monthly duty cycle, with 512MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 40ppm.$$, $$Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$80,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$512MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Mono, A4)", "Print Speed": "40ppm", "Resolution": "1200dpi", "Duty Cycle": "80,000 pages/month", "Memory": "512MB", "Processor": "1.2GHz", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-4103dw-mfp-supplies-w1510a';

UPDATE products SET
  description = $$HP Laserjet M4103fdw mfp is a 4-in-1 laser mono A4 printer (Print/Scan/Copy/Fax), rated at 40ppm with 1200dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, automatic two-sided (duplex) printing.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 80,000-page monthly duty cycle, with 512MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 40ppm.$$, $$Resolution: 1200dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$80,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$512MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Mono, A4)", "Print Speed": "40ppm", "Resolution": "1200dpi", "Duty Cycle": "80,000 pages/month", "Memory": "512MB", "Processor": "1.2GHz", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-laserjet-m4103fdw-mfp-supplies-w1510a';

UPDATE products SET
  description = $$HP CLJ Pro MFP M178nw is a 3-in-1 laser color A4 printer (Print/Scan/Copy), rated at 18ppm Black & 4ppm Color with 600dpi resolution.

Connects over Wi-Fi and wired network, with a flatbed for books, photos and single sheets.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 20,000-page monthly duty cycle, with 128MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 18ppm Black & 4ppm Color.$$, $$Resolution: 600dpi.$$, $$Scan Resolution: 4800dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Mobile Printing: Apple AirPrint.$$, $$20,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$128MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Color, A4)", "Print Speed": "18ppm Black & 4ppm Color", "Resolution": "600dpi", "Scan Resolution": "4800dpi", "Duty Cycle": "20,000 pages/month", "Memory": "128MB", "Processor": "800MHz", "Connectivity": "Wi-Fi + wired network", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-pro-mfp-m178nw-supplies-w2070a';

UPDATE products SET
  description = $$HP CLJ Pro MFP M179fnw is a 4-in-1 laser color A4 printer (Print/Scan/Copy/Fax), rated at 18ppm Black & 4ppm Color with 600dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 20,000-page monthly duty cycle, with 128MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 18ppm Black & 4ppm Color.$$, $$Resolution: 600dpi.$$, $$Scan Resolution: 4800dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Mobile Printing: Apple AirPrint.$$, $$20,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$128MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Color, A4)", "Print Speed": "18ppm Black & 4ppm Color", "Resolution": "600dpi", "Scan Resolution": "4800dpi", "Duty Cycle": "20,000 pages/month", "Memory": "128MB", "Processor": "800MHz", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-pro-mfp-m179fnw-supplies-w2070a';

UPDATE products SET
  description = $$HP CLJ Pro MFP 3303sdw is a 3-in-1 laser color A4 printer (Print/Scan/Copy), rated at 25ppm Black & Color with 600dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets, automatic two-sided (duplex) printing.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 40,000-page monthly duty cycle, with 512MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 25ppm Black & Color.$$, $$Resolution: 600dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint.$$, $$40,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$512MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Color, A4)", "Print Speed": "25ppm Black & Color", "Resolution": "600dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "40,000 pages/month", "Memory": "512MB", "Processor": "1.2GHz", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-pro-mfp-3303sdw-supplies-w2220a';

UPDATE products SET
  description = $$HP CLJ Pro MFP 3303fdw is a 4-in-1 laser color A4 printer (Print/Scan/Copy/Fax), rated at 25ppm Black & Color with 600dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets, automatic two-sided (duplex) printing.

Supports Apple AirPrint for printing directly from a phone or tablet.

It's rated for a 40,000-page monthly duty cycle, with 512MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 25ppm Black & Color.$$, $$Resolution: 600dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint.$$, $$40,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$512MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Color, A4)", "Print Speed": "25ppm Black & Color", "Resolution": "600dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "40,000 pages/month", "Memory": "512MB", "Processor": "1.2GHz", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-pro-mfp-3303fdw-supplies-w2220a';

UPDATE products SET
  description = $$HP CLJ Pro MFP 4303DW is a 3-in-1 laser color A4 printer (Print/Scan/Copy), rated at 33ppm Black & Color with 600dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets, automatic two-sided (duplex) printing.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 50,000-page monthly duty cycle, with 512MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 33ppm Black & Color.$$, $$Resolution: 600dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$50,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$512MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Color, A4)", "Print Speed": "33ppm Black & Color", "Resolution": "600dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "50,000 pages/month", "Memory": "512MB", "Processor": "1200MHz", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-pro-mfp-4303dw-supplies-w2300a';

UPDATE products SET
  description = $$HP CLJ Pro MFP 4303FDW is a 4-in-1 laser color A4 printer (Print/Scan/Copy/Fax), rated at 33ppm Black & Color with 600dpi resolution.

Connects over Wi-Fi and wired network, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets, automatic two-sided (duplex) printing.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 50,000-page monthly duty cycle, with 512MB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 33ppm Black & Color.$$, $$Resolution: 600dpi.$$, $$Scan Resolution: 1200dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$50,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$512MB Onboard Memory.$$],
  specs = $${"Brand": "HP", "Product Type": "MFP (Laser, Color, A4)", "Print Speed": "33ppm Black & Color", "Resolution": "600dpi", "Scan Resolution": "1200dpi", "Duty Cycle": "50,000 pages/month", "Memory": "512MB", "Processor": "1200MHz", "Connectivity": "Wi-Fi + wired network", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-clj-pro-mfp-4303fdw-supplies-w2300a';

UPDATE products SET
  description = $$CANON Pixma MG2541S ; (INK 445BK - 446 CLR) is a 3-in-1 inkjet color A4 printer (Print/Scan/Copy), rated at 8 ipm Black | 4.0 ipm color with 4800dpi resolution.$$,
  key_features = ARRAY[$$Print Speed: 8 ipm Black | 4.0 ipm color.$$, $$Resolution: 4800dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$],
  specs = $${"Brand": "Canon", "Product Type": "MFP (Inkjet, Color, A4)", "Print Speed": "8 ipm Black | 4.0 ipm color", "Resolution": "4800dpi", "Connectivity": "USB", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-pixma-mg2541s-ink-445bk-446-clr';

UPDATE products SET
  description = $$CANON Pixma G3410 Ink Tank ; (INK GI-490 BK|C|M|Y) is a 3-in-1 inkjet color A4 printer (Print/Scan/Copy), rated at 8.8 ipm black | 5.0 ipm color with 4800dpi resolution.

Connects over Wi-Fi, with a flatbed for books, photos and single sheets.$$,
  key_features = ARRAY[$$Print Speed: 8.8 ipm black | 5.0 ipm color.$$, $$Resolution: 4800dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$],
  specs = $${"Brand": "Canon", "Product Type": "MFP (Inkjet, Color, A4)", "Print Speed": "8.8 ipm black | 5.0 ipm color", "Resolution": "4800dpi", "Connectivity": "Wi-Fi", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-pixma-g3410-ink-tank-ink-gi-490-bk-c-m-y';

UPDATE products SET
  description = $$CANON Pixma G4470 Ink Tank ; (INK GI-41 PGBK|C|M|Y) is a 4-in-1 inkjet color A4 printer (Print/Scan/Copy/Fax), rated at 11.0 ipm black | 6.0 ipm color with 4800dpi resolution.

Connects over Wi-Fi, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.$$,
  key_features = ARRAY[$$Print Speed: 11.0 ipm black | 6.0 ipm color.$$, $$Resolution: 4800dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$],
  specs = $${"Brand": "Canon", "Product Type": "MFP (Inkjet, Color, A4)", "Print Speed": "11.0 ipm black | 6.0 ipm color", "Resolution": "4800dpi", "Connectivity": "Wi-Fi", "ADF": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-pixma-g4470-ink-tank-ink-gi-41-pgbk-c-m-y';

UPDATE products SET
  description = $$CANON LJ LBP 6030 ; (Toner Canon 725 or HP CE285A) is a single-function laser mono A4 printer, rated at 18ppm with 600dpi resolution.

It's rated for a 5,000-page monthly duty cycle.$$,
  key_features = ARRAY[$$Print Speed: 18ppm.$$, $$Resolution: 600dpi.$$, $$5,000-Page Monthly Duty Cycle: built for sustained office/business use.$$],
  specs = $${"Brand": "Canon", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "18ppm", "Resolution": "600dpi", "Duty Cycle": "5,000 pages/month", "Connectivity": "USB", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a';

UPDATE products SET
  description = $$CANON LJ LBP 6030 ; (Toner Canon 725 or HP CE285A) is a single-function laser mono A4 printer, rated at 18ppm with 600dpi resolution.

It's rated for a 5,000-page monthly duty cycle.$$,
  key_features = ARRAY[$$Print Speed: 18ppm.$$, $$Resolution: 600dpi.$$, $$5,000-Page Monthly Duty Cycle: built for sustained office/business use.$$],
  specs = $${"Brand": "Canon", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "18ppm", "Resolution": "600dpi", "Duty Cycle": "5,000 pages/month", "Connectivity": "USB", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a-2';

UPDATE products SET
  description = $$CANON LJ LBP236DW ; (Toner Canon 057) is a single-function laser mono A4 printer, rated at 38ppm with 1200dpi resolution.

Connects over Wi-Fi and wired network, with automatic two-sided (duplex) printing.

It's rated for a 80,000-page monthly duty cycle.$$,
  key_features = ARRAY[$$Print Speed: 38ppm.$$, $$Resolution: 1200dpi.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$80,000-Page Monthly Duty Cycle: built for sustained office/business use.$$],
  specs = $${"Brand": "Canon", "Product Type": "Printer (Laser, Mono, A4)", "Print Speed": "38ppm", "Resolution": "1200dpi", "Duty Cycle": "80,000 pages/month", "Connectivity": "Wi-Fi + wired network", "Duplex": "Yes", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-lj-lbp236dw-toner-canon-057';

UPDATE products SET
  description = $$CANON MFP MF3010 ; (Toner Canon 725 or HP CE285A) is a 3-in-1 laser mono A4 printer (Print/Scan/Copy), rated at 18ppm with 600dpi resolution.

Connects over USB, with a flatbed for books, photos and single sheets.

It's rated for a 8,000-page monthly duty cycle.$$,
  key_features = ARRAY[$$Print Speed: 18ppm.$$, $$Resolution: 600dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$8,000-Page Monthly Duty Cycle: built for sustained office/business use.$$],
  specs = $${"Brand": "Canon", "Product Type": "MFP (Laser, Mono, A4)", "Print Speed": "18ppm", "Resolution": "600dpi", "Duty Cycle": "8,000 pages/month", "Connectivity": "USB", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-mfp-mf3010-toner-canon-725-or-hp-ce285a';

UPDATE products SET
  description = $$CANON MFP MF275DW ; (Toner Canon 071) is a 4-in-1 laser mono A4 printer (Print/Scan/Copy/Fax), rated at 29ppm with 2400dpi resolution.

Connects over Wi-Fi, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets, automatic two-sided (duplex) printing.

It's rated for a 20,000-page monthly duty cycle.$$,
  key_features = ARRAY[$$Print Speed: 29ppm.$$, $$Resolution: 2400dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$20,000-Page Monthly Duty Cycle: built for sustained office/business use.$$],
  specs = $${"Brand": "Canon", "Product Type": "MFP (Laser, Mono, A4)", "Print Speed": "29ppm", "Resolution": "2400dpi", "Duty Cycle": "20,000 pages/month", "Connectivity": "Wi-Fi", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-mfp-mf275dw-toner-canon-071';

UPDATE products SET
  description = $$CANON CLJ LBP646CDW ; (Toner Canon 075 BK|C|M|Y) is a single-function laser color A4 printer, rated at 25ppm with 1200dpi resolution.

Connects over Wi-Fi and wired network, with automatic two-sided (duplex) printing.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 30,000-page monthly duty cycle, with 1GB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 25ppm.$$, $$Resolution: 1200dpi.$$, $$Connectivity: Wi-Fi + wired network.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$30,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$1GB Onboard Memory.$$],
  specs = $${"Brand": "Canon", "Product Type": "Printer (Laser, Color, A4)", "Print Speed": "25ppm", "Resolution": "1200dpi", "Duty Cycle": "30,000 pages/month", "Memory": "1GB", "Connectivity": "Wi-Fi + wired network", "Duplex": "Yes", "Functions": "Print"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-clj-lbp646cdw-toner-canon-075-bk-c-m-y';

UPDATE products SET
  description = $$CANON CLJ MF657CDW ; (Toner Canon 067 BK|C|M|Y) is a 4-in-1 laser color A4 printer (Print/Scan/Copy/Fax), rated at 21ppm with 1200dpi resolution.

Connects over Wi-Fi, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets, automatic two-sided (duplex) printing.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 30,000-page monthly duty cycle, with 1GB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 21ppm.$$, $$Resolution: 1200dpi.$$, $$Print/Scan/Copy/Fax: 4-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$30,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$1GB Onboard Memory.$$],
  specs = $${"Brand": "Canon", "Product Type": "MFP (Laser, Color, A4)", "Print Speed": "21ppm", "Resolution": "1200dpi", "Duty Cycle": "30,000 pages/month", "Memory": "1GB", "Connectivity": "Wi-Fi", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy/Fax"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-clj-mf657cdw-toner-canon-067-bk-c-m-y';

UPDATE products SET
  description = $$CANON CLJ MF752CDW ; (Toner Canon 069 BK|C|M|Y) is a 3-in-1 laser color A4 printer (Print/Scan/Copy), rated at 33ppm with 1200dpi resolution.

Connects over Wi-Fi, with an automatic document feeder (ADF) for multi-page scan/copy jobs, a flatbed for books, photos and single sheets, automatic two-sided (duplex) printing.

Supports Apple AirPrint and Mopria (Android) printing for printing directly from a phone or tablet.

It's rated for a 50,000-page monthly duty cycle, with 1GB of onboard memory.$$,
  key_features = ARRAY[$$Print Speed: 33ppm.$$, $$Resolution: 1200dpi.$$, $$Print/Scan/Copy: 3-in-1 device in one machine.$$, $$Connectivity: Wi-Fi.$$, $$Automatic Document Feeder (ADF): scan or copy multi-page documents unattended.$$, $$Automatic Duplex Printing: two-sided printing without manually flipping pages.$$, $$Mobile Printing: Apple AirPrint + Mopria (Android) printing.$$, $$50,000-Page Monthly Duty Cycle: built for sustained office/business use.$$, $$1GB Onboard Memory.$$],
  specs = $${"Brand": "Canon", "Product Type": "MFP (Laser, Color, A4)", "Print Speed": "33ppm", "Resolution": "1200dpi", "Duty Cycle": "50,000 pages/month", "Memory": "1GB", "Connectivity": "Wi-Fi", "ADF": "Yes", "Duplex": "Yes", "Functions": "Print/Scan/Copy"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-clj-mf752cdw-toner-canon-069-bk-c-m-y';

UPDATE products SET
  description = $$CANON Scanner LIDE 300 is a slim, USB-powered flatbed photo and document scanner, capturing at up to 2400dpi resolution with a scan-to-cloud time of 10 seconds.

It draws power directly from its USB connection — no separate power adapter or cable clutter — making it easy to set up on any desk.$$,
  key_features = ARRAY[$$Up to 2400dpi Resolution: sharp detail for photos and documents.$$, $$Scan-to-Cloud in 10 seconds: fast scanning direct to cloud storage.$$, $$USB-Powered: no separate power adapter needed.$$, $$Slim, Space-Saving Design: fits easily on any desk.$$],
  specs = $${"Brand": "Canon", "Product Type": "Flatbed Scanner", "Model": "LIDE Series", "Resolution": "2400dpi", "Scan-to-Cloud Time": "10 seconds", "Power": "USB-powered"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-scanner-lide-300';

UPDATE products SET
  description = $$CANON Scanner LIDE 400 is a slim, USB-powered flatbed photo and document scanner, capturing at up to 4800dpi resolution with a scan-to-cloud time of 8 seconds.

It draws power directly from its USB connection — no separate power adapter or cable clutter — making it easy to set up on any desk.$$,
  key_features = ARRAY[$$Up to 4800dpi Resolution: sharp detail for photos and documents.$$, $$Scan-to-Cloud in 8 seconds: fast scanning direct to cloud storage.$$, $$USB-Powered: no separate power adapter needed.$$, $$Slim, Space-Saving Design: fits easily on any desk.$$],
  specs = $${"Brand": "Canon", "Product Type": "Flatbed Scanner", "Model": "LIDE Series", "Resolution": "4800dpi", "Scan-to-Cloud Time": "8 seconds", "Power": "USB-powered"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'canon-scanner-lide-400';
