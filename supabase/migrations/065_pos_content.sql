-- Rich product-page content for all 31 AppoStars POS-systems products
-- (terminals, price checker, printers, cash drawers, scanners, customer
-- displays, a card reader, and secondary POS monitors), built from the
-- supplier's own already-accurate specs (AppoStars is a regional brand
-- without Intel-ARK-style official pages, so specs come from our data
-- plus IBC International's AppoStars datasheet index for context).

UPDATE products SET
  description = $$AppoStars AP-T3-G4 is an all-in-one POS terminal built around an Intel Core i5 (4th Generation) processor with 8GB DDR3 RAM and a 128GB SSD, driving a 15.6" capacitive touchscreen at 1366*768 resolution.

It runs Win 10.

Finished in Full Black, it draws power from a DC 8A supply. An optional AP-VFD 40 Digits Customer Display VFD 2 Lines is available.$$,
  key_features = ARRAY[$$Intel Core i5 (4th Generation): 8GB DDR3 RAM, 128GB SSD for responsive checkout performance.$$, $$15.6" Capacitive Touchscreen: 1366*768 resolution.$$, $$Runs Win 10: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1366*768", "Second Display": "N/A", "CPU": "Intel Core i5 (4th Generation)", "Hard Disk Driver": "128GB SSD", "Memory": "8GB DDR3 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black", "Optional": "AP-VFD 40 Digits Customer Display VFD 2 Lines @ 40$", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "15.6\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-t3-g4';

UPDATE products SET
  description = $$AppoStars AP-T3-G6 is an all-in-one POS terminal built around an Intel Core i5 (6th Generation) processor with 8GB DDR4 RAM and a 256GB SSD, driving a 15.6" capacitive touchscreen at 1366*768 resolution.

It runs Win 10.

Finished in Full Black, it draws power from a DC 8A supply.$$,
  key_features = ARRAY[$$Intel Core i5 (6th Generation): 8GB DDR4 RAM, 256GB SSD for responsive checkout performance.$$, $$15.6" Capacitive Touchscreen: 1366*768 resolution.$$, $$Runs Win 10: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1366*768", "Second Display": "N/A", "CPU": "Intel Core i5 (6th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "15.6\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-t3-g6';

UPDATE products SET
  description = $$AppoStars AP-T3-G6.VFD is an all-in-one POS terminal built around an Intel Core i5 (6th Generation) processor with 8GB DDR4 RAM and a 256GB SSD, driving a 15.6" capacitive touchscreen at 1366*768 resolution.

It runs Win 10.

For the counter, it adds a built-in VFD customer-facing display.

Finished in Full Black, it draws power from a DC 8A supply.$$,
  key_features = ARRAY[$$Intel Core i5 (6th Generation): 8GB DDR4 RAM, 256GB SSD for responsive checkout performance.$$, $$15.6" Capacitive Touchscreen: 1366*768 resolution.$$, $$Built-in VFD customer-facing display.$$, $$Runs Win 10: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1366*768", "Second Display": "VFD 2 lines", "CPU": "Intel Core i5 (6th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "15.6\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-t3-g6-vfd';

UPDATE products SET
  description = $$AppoStars AP-A3-G5 is an all-in-one POS terminal built around an Intel Core i5 (5th Generation) processor with 8GB DDR3 RAM and a 256GB SSD, driving a 15" capacitive touchscreen at 1024*768 resolution.

It runs Win 10.

Finished in Full Black, it draws power from a DC 8A supply.$$,
  key_features = ARRAY[$$Intel Core i5 (5th Generation): 8GB DDR3 RAM, 256GB SSD for responsive checkout performance.$$, $$15" Capacitive Touchscreen: 1024*768 resolution.$$, $$Runs Win 10: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1024*768", "Second Display": "N/A", "CPU": "Intel Core i5 (5th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR3 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "15\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-a3-g5';

UPDATE products SET
  description = $$AppoStars AP-A3-G5.VFD is an all-in-one POS terminal built around an Intel Core i5 (5th Generation) processor with 8GB DDR3 RAM and a 256GB SSD, driving a 15" capacitive touchscreen at 1024*768 resolution.

It runs Win 10.

For the counter, it adds a built-in VFD customer-facing display.

Finished in Full Black, it draws power from a DC 8A supply.$$,
  key_features = ARRAY[$$Intel Core i5 (5th Generation): 8GB DDR3 RAM, 256GB SSD for responsive checkout performance.$$, $$15" Capacitive Touchscreen: 1024*768 resolution.$$, $$Built-in VFD customer-facing display.$$, $$Runs Win 10: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1024*768", "Second Display": "VFD 2 lines", "CPU": "Intel Core i5 (5th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR3 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "15\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-a3-g5-vfd';

UPDATE products SET
  description = $$AppoStars AP-A3-G8 is an all-in-one POS terminal built around an Intel Core i5 (8th Generation) processor with 8GB DDR4 RAM and a 128GB SSD, driving a 15" capacitive touchscreen at 1024*768 resolution.

It runs Win 10.

For the counter, it adds a built-in VFD customer-facing display.

Finished in Full Black, it draws power from a DC 6A supply.$$,
  key_features = ARRAY[$$Intel Core i5 (8th Generation): 8GB DDR4 RAM, 128GB SSD for responsive checkout performance.$$, $$15" Capacitive Touchscreen: 1024*768 resolution.$$, $$Built-in VFD customer-facing display.$$, $$Runs Win 10: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1024*768", "Second Display": "VFD 2 lines", "CPU": "Intel Core i5 (8th Generation)", "Hard Disk Driver": "128GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 10", "Power Supply": "DC 6A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "15\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-a3-g8';

UPDATE products SET
  description = $$AppoStars AP-F7-G10 is an all-in-one POS terminal built around an Intel Core i7 (10th Generation) processor with 8GB DDR4 RAM and a 256GB SSD, driving a 15.6" foldable capacitive touchscreen at 1366*768 resolution.

It runs Win 11, housed in a metal case on a foldable metal L6-B stand.

For the counter, it adds an 11.6" non-touch LCD second display (1366*768 resolution), built-in Wi-Fi and speaker, 1x LAN + 1x COM + 6x USB for peripherals like scanners, printers and cash drawers.

Finished in Full Black, it draws power from a DC 8A supply.$$,
  key_features = ARRAY[$$Intel Core i7 (10th Generation): 8GB DDR4 RAM, 256GB SSD for responsive checkout performance.$$, $$15.6" Foldable Capacitive Touchscreen: 1366*768 resolution.$$, $$Second Display: an 11.6" non-touch LCD second display (1366*768 resolution).$$, $$Built-In Wi-Fi + Speaker: wireless network setup with audio feedback for scans/sales.$$, $$Rich I/O: 1x LAN + 1x COM + 6x USB for scanners, printers, drawers and more.$$, $$Metal Case + a foldable metal L6-B stand: built for daily counter use.$$, $$Runs Win 11: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1366*768", "Second Display": "11.6\" non-touch LCD | Resolution: 1366*768", "CPU": "Intel Core i7 (10th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 11", "Power Supply": "DC 8A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "15.6\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-f7-g10-new-metal-case-l6-b-foldable-metal-stand-15-6-capacitive-fol';

UPDATE products SET
  description = $$AppoStars AP-A6-G6-256 is an all-in-one POS terminal built around an Intel Core i5 (6th Generation) processor with 8GB DDR4 RAM and a 256GB SSD, driving a 18.5" true flat capacitive touchscreen at 1920*1080 resolution.

It runs Win 10, housed in a metal case on a metal L4 stand.

For the counter, it adds an 11.6" non-touch LCD second display (1366*768 resolution), built-in Wi-Fi and speaker.

Finished in Full Black, it draws power from a DC 8A supply.$$,
  key_features = ARRAY[$$Intel Core i5 (6th Generation): 8GB DDR4 RAM, 256GB SSD for responsive checkout performance.$$, $$18.5" True Flat Capacitive Touchscreen: 1920*1080 resolution.$$, $$Second Display: an 11.6" non-touch LCD second display (1366*768 resolution).$$, $$Built-In Wi-Fi + Speaker: wireless network setup with audio feedback for scans/sales.$$, $$Metal Case + a metal L4 stand: built for daily counter use.$$, $$Runs Win 10: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1920*1080", "Second Display": "11.6\" non-touch LCD | Resolution: 1366*768", "CPU": "Intel Core i5 (6th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "18.5\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-a6-g6-256-new-metal-stand-l4-metal-case-18-5-capacitive-true-flat-t';

UPDATE products SET
  description = $$AppoStars AP-A6-G8-256 is an all-in-one POS terminal built around an Intel Core i5 (8th Generation) processor with 8GB DDR4 RAM and a 256GB SSD, driving a 18.5" true flat capacitive touchscreen at 1920*1080 resolution.

It runs Win 11, housed in a metal case on a metal L4 stand.

For the counter, it adds an 11.6" non-touch LCD second display (1366*768 resolution), built-in Wi-Fi and speaker.

Finished in Full Black, it draws power from a DC 8A supply.$$,
  key_features = ARRAY[$$Intel Core i5 (8th Generation): 8GB DDR4 RAM, 256GB SSD for responsive checkout performance.$$, $$18.5" True Flat Capacitive Touchscreen: 1920*1080 resolution.$$, $$Second Display: an 11.6" non-touch LCD second display (1366*768 resolution).$$, $$Built-In Wi-Fi + Speaker: wireless network setup with audio feedback for scans/sales.$$, $$Metal Case + a metal L4 stand: built for daily counter use.$$, $$Runs Win 11: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1920*1080", "Second Display": "11.6\" non-touch LCD | Resolution: 1366*768", "CPU": "Intel Core i5 (8th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 11", "Power Supply": "DC 8A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "18.5\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-a6-g8-256-new-metal-stand-l4-metal-case-18-5-capacitive-true-flat-t';

UPDATE products SET
  description = $$AppoStars AP-3069-G8 is an all-in-one POS terminal built around an Intel Core i5 (8th Generation) processor with 8GB DDR4 RAM and a 256GB SSD, driving a 21.5" true flat capacitive touchscreen at 1920*1080 resolution.

It runs Win 11, housed in a plastic case on a metal L10 stand.

For the counter, it adds built-in Wi-Fi and speaker.

Finished in Full Black, it draws power from a DC 8A supply.$$,
  key_features = ARRAY[$$Intel Core i5 (8th Generation): 8GB DDR4 RAM, 256GB SSD for responsive checkout performance.$$, $$21.5" True Flat Capacitive Touchscreen: 1920*1080 resolution.$$, $$Built-In Wi-Fi + Speaker: wireless network setup with audio feedback for scans/sales.$$, $$Plastic Case + a metal L10 stand: built for daily counter use.$$, $$Runs Win 11: ready for standard POS/retail software.$$],
  specs = $${"Resolution": "1920*1080", "Second Display": "N/A", "CPU": "Intel Core i5 (8th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 11", "Power Supply": "DC 8A", "Color": "Full Black", "Brand": "AppoStars", "Product Type": "POS Terminal", "Screen Size": "21.5\""}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-3069-g8-new-metal-stand-l10-plastic-case-21-5-capacitive-true-flat-';

UPDATE products SET
  description = $$AppoStars AP-X4-I3 is a wall-mounted price-checker kiosk for retail floors, built around an 11.6" capacitive touch LED screen at 1366x768 resolution, so shoppers can scan an item and see its price without a cashier.

It runs on an Intel Core i3 (3rd Generation) processor with 4GB DDR3 RAM and a 128GB SSD, running Windows 10 — enough for a dedicated price-lookup application to run reliably all day.

A built-in 2D scanner reads barcodes and QR codes directly, with Bluetooth and Wi-Fi for network and peripheral connectivity, and it ships with a wall-mounted bracket ready for installation on the shop floor.$$,
  key_features = ARRAY[$$11.6" Capacitive Touch LED Screen: 1366x768 resolution for clear on-screen pricing.$$, $$Built-In 2D Scanner: shoppers scan an item's barcode or QR code directly at the kiosk.$$, $$Intel Core i3 (3rd Gen), 4GB RAM, 128GB SSD: reliable all-day price-lookup performance.$$, $$Bluetooth + Wi-Fi: flexible network and peripheral connectivity.$$, $$Wall-Mounted Bracket Included: ready to install on the shop floor.$$],
  specs = $${"Resolution": "1366*768", "CPU": "Intel Core i3 (3rd Generation)", "Storage": "128GB SSD", "Memory": "4GB DDR3 RAM", "Operating System": "Win 10", "Power Supply": "DC 6A", "Brand": "AppoStars", "Product Type": "Price Checker Kiosk", "Screen Size": "11.6\"", "Scanner": "Built-in 2D scanner", "Connectivity": "Bluetooth + Wi-Fi", "Mount": "Wall-mounted bracket included"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-x4-i3-new-price-checker-11-6-capacitive-touch-led-screen-resolution';

UPDATE products SET
  description = $$AppoStars AP-11.6T is a genuine replacement 11.6" capacitive touch LCD panel (1366x768 resolution) for the second-display slot on AppoStars AP-T3 and AP-A6 series POS terminals — the same panel used as their built-in secondary customer-facing display.

It's sold as a spare part for repairs or upgrades, not as a standalone system, and matches the original panel's size and resolution exactly for a drop-in fit.$$,
  key_features = ARRAY[$$11.6" Capacitive Touch LCD: 1366x768 resolution, matching the original panel exactly.$$, $$Genuine Replacement Part: for AppoStars AP-T3 and AP-A6 series POS terminals.$$, $$Drop-In Fit: sized and specced to match the original second display.$$],
  specs = $${"Brand": "AppoStars", "Product Type": "Replacement Touch Screen Part", "Model": "AP-11.6T", "Screen Size": "11.6\"", "Resolution": "1366*768", "Compatibility": "AP-T3 / AP-A6 series POS terminals"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-optional-ap-11-6t-pos-system-part-11-6-touch-lcd-resolution-1366-768-f';

UPDATE products SET
  description = $$AppoStars AP-8360 is a budget-friendly everyday receipt printer for counters with lighter print volume, printing 80mm thermal receipts at up to 220mm/sec.

For reliability, it connects over USB + LAN.

Finished in Black with Orange, it drops into most POS setups as a standard 80mm thermal receipt printer.$$,
  key_features = ARRAY[$$80mm Thermal Printing: up to 220mm/sec print speed.$$, $$USB + LAN Connectivity: drops into most POS setups.$$, $$Standard 80mm Thermal Paper: widely available, low running cost.$$],
  specs = $${"Width": "80mm", "Printing Speed": "220mm/sec", "Interface": "USB + LAN", "Color": "Black with Orange", "Brand": "AppoStars", "Product Type": "Thermal Receipt Printer"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-8360';

UPDATE products SET
  description = $$AppoStars AP-8256 is a fast, durable receipt printer built for busy counters, printing 80mm thermal receipts at up to 250mm/sec.

For reliability, the print head is rated for 100km of use before it needs replacing and it connects over USB + LAN.

Finished in Black, it drops into most POS setups as a standard 80mm thermal receipt printer.$$,
  key_features = ARRAY[$$80mm Thermal Printing: up to 250mm/sec print speed.$$, $$Print Head Rated for 100km: built for sustained daily use.$$, $$USB + LAN Connectivity: drops into most POS setups.$$, $$Standard 80mm Thermal Paper: widely available, low running cost.$$],
  specs = $${"Printing Speed": "250mm/sec", "Width": "80mm", "Life Of Printing Head": "100km", "Interface": "USB + LAN", "Color": "Black", "Brand": "AppoStars", "Product Type": "Thermal Receipt Printer"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-8256';

UPDATE products SET
  description = $$AppoStars AP-8258 is the fastest of AppoStars' receipt printer line, built for high-volume counters, printing 80mm thermal receipts at up to 260mm/sec.

For reliability, the print head is rated for 100km of use before it needs replacing and it connects over USB + LAN.

Finished in Grey, it drops into most POS setups as a standard 80mm thermal receipt printer.$$,
  key_features = ARRAY[$$80mm Thermal Printing: up to 260mm/sec print speed.$$, $$Print Head Rated for 100km: built for sustained daily use.$$, $$USB + LAN Connectivity: drops into most POS setups.$$, $$Standard 80mm Thermal Paper: widely available, low running cost.$$],
  specs = $${"Printing Speed": "260mm/sec", "Width": "80mm", "Life Of Printing Head": "100km", "Interface": "USB + LAN", "Color": "Grey", "Brand": "AppoStars", "Product Type": "Thermal Receipt Printer"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-8258';

UPDATE products SET
  description = $$AppoStars AP-8060 is a compact, no-frills receipt printer for lower-volume setups without a network connection, printing 80mm thermal receipts at up to 3-5 IN/sec.

For reliability, it connects over USB.

Finished in Black, it drops into most POS setups as a standard 80mm thermal receipt printer.$$,
  key_features = ARRAY[$$80mm Thermal Printing: up to 3-5 IN/sec print speed.$$, $$USB Connectivity: drops into most POS setups.$$, $$Standard 80mm Thermal Paper: widely available, low running cost.$$],
  specs = $${"Width": "80mm", "Printing Speed": "3-5 IN/sec", "Power Supply": "DC 9V/1A", "Interface": "USB", "Color": "Black", "Brand": "AppoStars", "Product Type": "Thermal Receipt Printer"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-8060';

UPDATE products SET
  description = $$AppoStars AP-9210 is a dedicated thermal label printer for pricing and barcode labels, printing up to 100mm-wide labels (800 dots max) at 203 DPI resolution and speeds up to 160mm/sec.

It connects over USB for straightforward setup with standard POS and inventory software, making it a practical addition alongside a receipt printer for retail and warehouse labeling.$$,
  key_features = ARRAY[$$100mm Print Width (800 Dots Max): fits standard pricing and barcode label stock.$$, $$203 DPI Resolution: sharp barcode and text detail on labels.$$, $$Up to 160mm/sec Print Speed: keeps up with busy labeling runs.$$, $$USB Connectivity: straightforward setup with POS and inventory software.$$],
  specs = $${"Effective Print Width": "100mm (Max 800 points)", "Printing Speed": "160mm/sec (MAX)", "Resolution": "203DPI (8dot/mm)", "Interface": "USB", "Color": "Grey", "Brand": "AppoStars", "Product Type": "Thermal Label Printer"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-9210';

UPDATE products SET
  description = $$AppoStars AP-405A is a compact cash drawer that opens via a 12V DC pulse signal from a connected receipt printer or POS terminal, sized at 405 x 420 x 100mm to fit neatly under most POS counters.

It's a straightforward, no-frills drawer for counters that just need secure, reliable cash storage that opens automatically at the end of a sale.$$,
  key_features = ARRAY[$$12V DC Pulse-Opening: triggers automatically from a connected printer or POS terminal.$$, $$Compact 405 x 420 x 100mm Size: fits neatly under most POS counters.$$, $$Secure Cash Storage: reliable everyday operation for retail and hospitality counters.$$],
  specs = $${"Pulse Amplitude": "12V DC", "Size": "405(W)×420(L)×100(H)mm", "Brand": "AppoStars", "Product Type": "Cash Drawer"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-405a';

UPDATE products SET
  description = $$AppoStars AP-460 is a larger cash drawer with adjustable bill and coin compartments (bill slots from 70–86mm, coin slots from 69–85mm) so it can be configured for different currencies and note sizes, in a 460 x 460 x 115mm footprint.

Like AppoStars' other drawers, it's built to open automatically from a connected printer or POS terminal, giving cashiers secure, hands-free access to cash during checkout.$$,
  key_features = ARRAY[$$Adjustable Bill Compartments: 70–86mm slots, configurable for different note sizes.$$, $$Adjustable Coin Compartments: 69–85mm slots for flexible currency setups.$$, $$Larger 460 x 460 x 115mm Footprint: more storage than AppoStars' compact AP-405A.$$, $$Auto-Opens from Printer or POS Terminal: hands-free access during checkout.$$],
  specs = $${"Bill Width": "74/86/70/86/76mm(Adjustble)", "Bill Length": "185mm", "Coin Size": "69/85/69/85/74mm(Adjustble)", "Coin Length": "112mm", "Size": "460(W)×460(L)×115(H)mm", "Brand": "AppoStars", "Product Type": "Cash Drawer"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-460';

UPDATE products SET
  description = $$AppoStars AP-9400 is a versatile handheld scanner for everyday checkout scanning, built around an 800*600 pixels imaging sensor for fast, accurate barcode capture.

It reads barcodes across a depth of field of EAN-13 (13.34mil) 20mm—190mm.$$,
  key_features = ARRAY[$$800*600 pixels Imaging Sensor: fast, accurate barcode capture.$$, $$Depth of Field: EAN-13 (13.34mil) 20mm—190mm.$$, $$Handheld Barcode Scanner: built for retail and hospitality checkout.$$],
  specs = $${"Image": "800*600 pixels", "Depth Of Field": "EAN-13 (13.34mil) 20mm—190mm", "Brand": "AppoStars", "Product Type": "Handheld Barcode Scanner"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-9400';

UPDATE products SET
  description = $$AppoStars AP-9520SR is a long-range scanner that reads barcodes from well over arm's length away, built around a 1280*800 pixels imaging sensor for fast, accurate barcode capture.

It reads barcodes across a depth of field of UPC-A (13mil) 40mm—450mm.$$,
  key_features = ARRAY[$$1280*800 pixels Imaging Sensor: fast, accurate barcode capture.$$, $$Depth of Field: UPC-A (13mil) 40mm—450mm.$$, $$Long-Range Handheld Barcode Scanner: built for retail and hospitality checkout.$$],
  specs = $${"Image": "1280*800 pixels", "Depth Of Field": "UPC-A (13mil) 40mm—450mm", "Brand": "AppoStars", "Product Type": "Long-Range Handheld Barcode Scanner"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-9520sr';

UPDATE products SET
  description = $$AppoStars AP-A80 is a compact scan engine built into checkout counters, kiosks or self-service points rather than held by hand, built around a 640*480 pixels Global Shutter imaging sensor for fast, accurate barcode capture.

It reads barcodes across a depth of field of UPC-A (13mil) 0mm - 150mm.

It resolves barcode elements as fine as ≧50.102mm / 4 mils, for reading dense or small-format barcodes.$$,
  key_features = ARRAY[$$640*480 pixels Global Shutter Imaging Sensor: fast, accurate barcode capture.$$, $$Depth of Field: UPC-A (13mil) 0mm - 150mm.$$, $$Resolves Barcode Elements Down to ≧50.102mm / 4 mils: reads dense or small-format barcodes.$$, $$Fixed-Mount Barcode Scan Engine: built for retail and hospitality checkout.$$],
  specs = $${"Resolution": "≧50.102mm / 4 mils", "Image": "640*480 pixels Global Shutter", "Depth Of Field": "UPC-A (13mil) 0mm - 150mm", "Brand": "AppoStars", "Product Type": "Fixed-Mount Barcode Scan Engine"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-a80';

UPDATE products SET
  description = $$AppoStars AP-9519 is a straightforward handheld scanner for everyday checkout scanning, built around an 800*600 pixels imaging sensor for fast, accurate barcode capture.$$,
  key_features = ARRAY[$$800*600 pixels Imaging Sensor: fast, accurate barcode capture.$$, $$Handheld Barcode Scanner: built for retail and hospitality checkout.$$],
  specs = $${"Image": "800*600 pixels", "Brand": "AppoStars", "Product Type": "Handheld Barcode Scanner"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-9519';

UPDATE products SET
  description = $$AppoStars AP-9555HD is a compact handheld scanner suited to tight counter spaces, built around a 640*480 pixels Global Shutter imaging sensor for fast, accurate barcode capture.

It reads barcodes across a depth of field of 23cm.$$,
  key_features = ARRAY[$$640*480 pixels Global Shutter Imaging Sensor: fast, accurate barcode capture.$$, $$Depth of Field: 23cm.$$, $$Compact Handheld Barcode Scanner: built for retail and hospitality checkout.$$],
  specs = $${"Image": "640*480 pixels Global Shutter", "Depth Of Field": "23cm", "Brand": "AppoStars", "Product Type": "Compact Handheld Barcode Scanner"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-9555hd';

UPDATE products SET
  description = $$AppoStars AP-9533HD is a handheld scanner with solid working range for general retail use, built around a 640*480 pixels Global Shutter imaging sensor for fast, accurate barcode capture.

It reads barcodes across a depth of field of EAN-13 (13.34mil) 30mm—290mm.$$,
  key_features = ARRAY[$$640*480 pixels Global Shutter Imaging Sensor: fast, accurate barcode capture.$$, $$Depth of Field: EAN-13 (13.34mil) 30mm—290mm.$$, $$Handheld Barcode Scanner: built for retail and hospitality checkout.$$],
  specs = $${"Image": "640*480 pixels Global Shutter", "Depth Of Field": "EAN-13 (13.34mil) 30mm—290mm", "Brand": "AppoStars", "Product Type": "Handheld Barcode Scanner"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-9533hd';

UPDATE products SET
  description = $$AppoStars AP-LED8N is an 8-digit LED customer pole display that shows running totals and prices to shoppers during checkout, mounted on an adjustable pole and stand so it can be angled toward the customer.

It connects over Serial or USB and is powered directly from USB, so it drops into most existing POS setups without a separate power adapter.$$,
  key_features = ARRAY[$$8-Digit LED Display: clear, bright totals visible to the customer during checkout.$$, $$Adjustable Pole and Stand: angle the display toward the customer.$$, $$Serial + USB Interface: connects to most POS terminals and software.$$, $$USB-Powered: no separate power adapter needed.$$],
  specs = $${"Interface": "Serial + USB", "Power Supply": "USB", "Communication Interface": "Serial port", "Brand": "AppoStars", "Product Type": "Customer Pole Display", "Digits": "8"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-led8n';

UPDATE products SET
  description = $$AppoStars AP-210CE is a VFD (vacuum fluorescent display) customer-facing display for POS counters, showing running totals and item prices to shoppers as they check out.

It connects over PS/2 or USB, with power drawn from USB and serial, or USB alone depending on setup — flexible enough to fit most existing POS terminal configurations.$$,
  key_features = ARRAY[$$VFD Display: bright, clear totals visible to customers at checkout.$$, $$PS/2 or USB Interface: fits most existing POS terminal setups.$$, $$Flexible Power Options: USB & Serial, or USB alone.$$],
  specs = $${"Interface": "PS2 or USB", "Power Supply": "USB & Serial port or USB only", "Brand": "AppoStars", "Product Type": "Customer VFD Display"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-210ce';

UPDATE products SET
  description = $$AppoStars AP-MSR-3 is a 3-track magnetic stripe card reader for POS counters, reading standard magstripe bank and loyalty cards during checkout.

As with other magnetic stripe readers, it's built to swipe-read a card in a single pass and pass the encoded track data to your POS or payment software.$$,
  key_features = ARRAY[$$3-Track Magnetic Stripe Reading: compatible with standard magstripe bank and loyalty cards.$$, $$Single-Swipe Reading: fast, reliable capture at checkout.$$],
  specs = $${"Brand": "AppoStars", "Product Type": "Magnetic Stripe Card Reader", "Tracks": "3"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-msr-3';

UPDATE products SET
  description = $$AppoStars AP-1536-FHD is an FHD (1920*1080) widescreen display built for POS counters — a second screen for a customer-facing total display, or a compact monitor for a compact POS terminal.

It connects over HDMI, VGA, DC power adapter, running on 12V, 3.0A input power, in a 16:9 widescreen aspect ratio that fits neatly into a checkout counter setup.$$,
  key_features = ARRAY[$$Full HD 1920*1080 Resolution: sharp text and graphics for prices and totals.$$, $$HDMI, VGA, DC power adapter: flexible connection to a POS terminal or PC.$$, $$16:9 Widescreen Aspect Ratio.$$, $$12V, 3.0A Input Power.$$],
  specs = $${"Resolution": "FHD 1920*1080", "Input Interface": "HDMI, VGA, DC power adapter", "Input Power": "12V, 3.0A", "Screen Ratio": "16:9", "Brand": "AppoStars", "Product Type": "POS Display Monitor"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-1536-fhd';

UPDATE products SET
  description = $$AppoStars AP-1533 is an FHD (1920*1080) widescreen display built for POS counters — a second screen for a customer-facing total display, or a compact monitor for a compact POS terminal.

It connects over HDMI, VGA, DC power adapter, running on 12V, 3.0A input power, in a 16:9 widescreen aspect ratio that fits neatly into a checkout counter setup.$$,
  key_features = ARRAY[$$Full HD 1920*1080 Resolution: sharp text and graphics for prices and totals.$$, $$HDMI, VGA, DC power adapter: flexible connection to a POS terminal or PC.$$, $$16:9 Widescreen Aspect Ratio.$$, $$12V, 3.0A Input Power.$$],
  specs = $${"Resolution": "FHD 1920*1080", "Input Interface": "HDMI, VGA, DC power adapter", "Input Power": "12V, 3.0A", "Screen Ratio": "16:9", "Brand": "AppoStars", "Product Type": "POS Display Monitor"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-1533';

UPDATE products SET
  description = $$AppoStars AP-1561 is an FHD (1920*1080) widescreen display built for POS counters — a second screen for a customer-facing total display, or a compact monitor for a compact POS terminal.

It connects over HDMI, VGA, DC power adapter, running on 12V, 3.0A input power, in a 16:9 widescreen aspect ratio that fits neatly into a checkout counter setup.$$,
  key_features = ARRAY[$$Full HD 1920*1080 Resolution: sharp text and graphics for prices and totals.$$, $$HDMI, VGA, DC power adapter: flexible connection to a POS terminal or PC.$$, $$16:9 Widescreen Aspect Ratio.$$, $$12V, 3.0A Input Power.$$],
  specs = $${"Resolution": "FHD 1920*1080", "Input Interface": "HDMI, VGA, DC power adapter", "Input Power": "12V, 3.0A", "Screen Ratio": "16:9", "Brand": "AppoStars", "Product Type": "POS Display Monitor"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'appostars-ap-1561';
