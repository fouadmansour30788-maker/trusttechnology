-- Rich product-page content for the desktop/AIO/mini-PC catalog,
-- same treatment as migration 060 for laptops: multi-paragraph
-- descriptions, key-feature bullets, expanded specs and warranty text,
-- sourced from Intel ARK for every distinct chip in the category.

UPDATE products SET
  description = $$THINKCENTER M70T GEN 5 12U60046GP is a desktop built around a Core I7-14700 processor and Intel UHD Graphics 770, paired with 8GB DDR5 and a 512GB NVME.

Core I7-14700 brings 20 cores (8 performance + 12 efficiency) and 28 threads, 33MB cache to the table, with a 2.1GHz base clock and speeds up to 5.4GHz — mainstream desktop performance chip for productivity, multitasking and light creative work.

Intel UHD Graphics 770 (32 execution units, Xe (Gen12, desktop UHD)) handles graphics duties on-chip — capable entry-level desktop integrated graphics that handles everyday multitasking, media and light creative work comfortably.

It ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core I7-14700 Performance: 20 cores, 28 threads, 33MB cache, boosting up to 5.4GHz.$$, $$Intel UHD Graphics 770 Graphics: Capable entry-level desktop integrated graphics that handles everyday multitasking, media and light creative work comfortably.$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: WIRED KEYBOARD AND MOUSE, WIFI+BLUETOOTH.$$],
  specs = $${"CPU": "Core I7-14700", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN", "VGA": "Intel UHD Graphics 770", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK/WIRED KEYBOARD AND MOUSE /WIFI+BLUETOOTH", "Brand": "Lenovo", "Product Type": "Tower Desktop", "Model": "12U60046GP", "Processor Cores": "20 (8P+12E)", "Processor Threads": "28", "Processor Speed": "2.1GHz, up to 5.4GHz", "Processor Cache": "33MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkcenter-m70t-gen-5-12u60046gp';

UPDATE products SET
  description = $$TINY THINKCENTER Neo 50q 13B9004UEX is a compact mini PC built around a Core 7-240H processor, paired with 8GB DDR5 and a 512GB NVME.

Core 7-240H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.5GHz base clock and speeds up to 5.2GHz — mainstream-performance H-series chip for gaming/creator laptops, Intel's non-'Ultra' Arrow Lake-H rebrand tier, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

It ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core 7-240H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 5.2GHz.$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: USB KEYB AND MOUSE, VESA MOUNT.$$],
  specs = $${"CPU": "Core 7-240H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE / VESA MOUNT", "Brand": "Lenovo", "Product Type": "Mini PC", "Model": "13B9004UEX", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.5GHz, up to 5.2GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-tiny-thinkcenter-neo-50q-13b9004uex';

UPDATE products SET
  description = $$THINKCENTER Neo 50T 13BD001WEX is a desktop built around a Core ULTRA 5-225U processor, paired with 16GB DDR5 and a 512GB NVME.

Core ULTRA 5-225U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 4.5GHz — efficiency-focused ultraportable chip for everyday productivity with modest integrated graphics, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

It ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 5-225U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 4.5GHz.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: USB KEYB AND MOUSE.$$],
  specs = $${"CPU": "Core ULTRA 5-225U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE", "Brand": "Lenovo", "Product Type": "Tower Desktop", "Model": "13BD001WEX", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkcenter-neo-50t-13bd001wex';

UPDATE products SET
  description = $$THINKCENTER Neo 50T 13BD002WEX is a desktop built around a Core ULTRA 5-225U processor, paired with 8GB DDR5 and a 512GB NVME.

Core ULTRA 5-225U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 4.5GHz — efficiency-focused ultraportable chip for everyday productivity with modest integrated graphics, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

It ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 5-225U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 4.5GHz.$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: USB KEYB AND MOUSE.$$],
  specs = $${"CPU": "Core ULTRA 5-225U", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE", "Brand": "Lenovo", "Product Type": "Tower Desktop", "Model": "13BD002WEX", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkcenter-neo-50t-13bd002wex';

UPDATE products SET
  description = $$TINY THINKCENTER Neo 50q 13HR000PEX is a compact mini PC built around a Core ULTRA 5-226V processor and Intel Arc 130V, paired with 16GB DDR5 and a 512GB NVME.

Core ULTRA 5-226V brings 8 cores (4 performance + 4 efficiency) and 8 threads, 8MB cache to the table, with a 2.1GHz base clock and speeds up to 4.5GHz — premium efficiency-first chip built for thin laptops, here powering a compact all-in-one or mini PC with class-leading power efficiency, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

Intel Arc 130V (7 Xe cores, Xe2 (Battlemage-derived)) handles graphics duties on-chip — efficient integrated graphics for a compact all-in-one or mini PC, handling everyday multitasking and media smoothly.

It ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 5-226V Performance: 8 cores, 8 threads, 8MB cache, boosting up to 4.5GHz.$$, $$Intel Arc 130V Graphics: Efficient integrated graphics for a compact all-in-one or mini PC, handling everyday multitasking and media smoothly.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: USB KEYB AND MOUSE, VESA MOUNT.$$],
  specs = $${"CPU": "Core ULTRA 5-226V", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE / VESA MOUNT", "Brand": "Lenovo", "Product Type": "Mini PC", "Model": "13HR000PEX", "Processor Cores": "8 (4P+4E)", "Processor Threads": "8", "Processor Speed": "2.1GHz, up to 4.5GHz", "Processor Cache": "8MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-tiny-thinkcenter-neo-50q-13hr000pex';

UPDATE products SET
  description = $$TINY THINKCENTER Neo 50q 13B9004SEX is a compact mini PC built around a CORE 5-210H processor, paired with 8GB DDR5 and a 512GB NVME.

CORE 5-210H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — mainstream H-series laptop chip for everyday performance notebooks, one tier below Core 7/9 240H-series, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

It ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE 5-210H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.8GHz.$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: USB KEYB AND MOUSE, VESA MOUNT.$$],
  specs = $${"CPU": "CORE 5-210H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE / VESA MOUNT", "Brand": "Lenovo", "Product Type": "Mini PC", "Model": "13B9004SEX", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-tiny-thinkcenter-neo-50q-13b9004sex';

UPDATE products SET
  description = $$THINKCENTER NEO 50T GEN 5 12UD00C2GP is a desktop built around a Core I3-14100 processor and Intel UHD Graphics 730, paired with 8GB DDR5 and a 512GB NVME.

Core I3-14100 brings 4 cores and 8 threads, 12MB cache to the table, with a 3.5GHz base clock and speeds up to 4.7GHz — entry-level desktop chip for everyday office and productivity tasks.

Intel UHD Graphics 730 (24 execution units, Xe (Gen12, desktop UHD)) handles graphics duties on-chip — basic desktop integrated graphics for office use and video playback, not intended for gaming.

It ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core I3-14100 Performance: 4 cores, 8 threads, 12MB cache, boosting up to 4.7GHz.$$, $$Intel UHD Graphics 730 Graphics: Basic desktop integrated graphics for office use and video playback, not intended for gaming.$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: WIRED KEYBOARD AND MOUSE.$$],
  specs = $${"CPU": "Core I3-14100", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "VGA": "Intel UHD Graphics 730", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK/WIRED KEYBOARD AND MOUSE", "Brand": "Lenovo", "Product Type": "Tower Desktop", "Model": "12UD00C2GP", "Processor Cores": "4", "Processor Threads": "8", "Processor Speed": "3.5GHz, up to 4.7GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkcenter-neo-50t-gen-5-12ud00c2gp';

UPDATE products SET
  description = $$TINY THINKCENTER M80Q GEN 4 12EAS2KN00 is a compact mini PC built around a Core I3-13100T processor and Intel UHD Graphics 730, paired with 8GB DDR5 and a 256GB NVME.

Core I3-13100T brings 4 cores and 8 threads, 12MB cache to the table, with a 2.5GHz base clock and speeds up to 4.2GHz — low-power entry-level desktop chip suited to compact PCs where quiet, cool operation matters as much as raw speed.

Intel UHD Graphics 730 (24 execution units, Xe (Gen12, desktop UHD)) handles graphics duties on-chip — basic desktop integrated graphics for office use and video playback, not intended for gaming.

It ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core I3-13100T Performance: 4 cores, 8 threads, 12MB cache, boosting up to 4.2GHz.$$, $$Intel UHD Graphics 730 Graphics: Basic desktop integrated graphics for office use and video playback, not intended for gaming.$$, $$8GB DDR5 Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: WIRED KEYBOARD AND MOUSE.$$],
  specs = $${"CPU": "Core I3-13100T", "RAM": "8GB DDR5", "Storage": "256GB NVME", "Language": "EN", "VGA": "Intel UHD Graphics 730", "Warranty": "2 YEARS", "OS": "DOS", "Color": "BLACK /WIRED KEYBOARD AND MOUSE", "Brand": "Lenovo", "Product Type": "Mini PC", "Model": "12EAS2KN00", "Processor Cores": "4", "Processor Threads": "8", "Processor Speed": "2.5GHz, up to 4.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-tiny-thinkcenter-m80q-gen-4-12eas2kn00';

UPDATE products SET
  description = $$MSI AIO AM242TP 1M-839US is an all-in-one desktop built around a Core 7-150U processor, paired with 16GB DDR5 and a 1TB NVME + 1TB HDD.

Core 7-150U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.8GHz base clock and speeds up to 5.4GHz — upper-mid ultraportable chip for productivity laptops, sits just below the Core Ultra 7 155U in Intel's parallel non-AI lineup, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

Everything is built into a 23.8" FHD TOUCHSCREEN all-in-one display — runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$Core 7-150U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5.4GHz.$$, $$23.8" FHD TOUCHSCREEN All-in-One Display: no separate tower or cables to a monitor.$$, $$16GB DDR5 Memory + 1TB NVME + 1TB HDD: smooth multitasking with fast boot and load times.$$, $$Included Extras: WIRELESS KEYBOARD AND MOUSE.$$],
  specs = $${"CPU": "Core 7-150U", "RAM": "16GB DDR5", "Storage": "1TB NVME + 1TB HDD", "Language": "EN", "Screen": "23.8\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / BLACK/WIRELESS KEYBOARD AND MOUSE", "Brand": "MSI", "Product Type": "All-in-One Desktop", "Model": "839US", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.8GHz, up to 5.4GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'msi-aio-am242tp-1m-839us';

UPDATE products SET
  description = $$DELL AIO 24 DEC24250-7482WHT-PUS is an all-in-one desktop built around a Core 7-150U processor, paired with 16GB DDR5 and a 512GB NVME.

Core 7-150U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.8GHz base clock and speeds up to 5.4GHz — upper-mid ultraportable chip for productivity laptops, sits just below the Core Ultra 7 155U in Intel's parallel non-AI lineup, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

Everything is built into a 23.8" FHD TOUCHSCREEN all-in-one display — runs Windows 11, finished in WHITE.$$,
  key_features = ARRAY[$$Core 7-150U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5.4GHz.$$, $$23.8" FHD TOUCHSCREEN All-in-One Display: no separate tower or cables to a monitor.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: DELL PRO KEYBOARD AND MOUSE KM5221W WHITE (COPILOT).$$],
  specs = $${"CPU": "Core 7-150U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "23.8\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / WHITE/DELL PRO KEYBOARD AND MOUSE KM5221W WHITE (COPILOT)", "Brand": "Dell", "Product Type": "All-in-One Desktop", "Model": "DEC24250-7482WHT-PUS", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.8GHz, up to 5.4GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'dell-aio-24-dec24250-7482wht-pus';

UPDATE products SET
  description = $$Lenovo ThinkCentre AiO Neo 50a-24 G6 13QG0016EX is an all-in-one desktop built around a CORE ULTRA 5-226V processor and Intel Arc 130V, paired with 16GB DDR5 ON BOARD and a 512GB NVME.

CORE ULTRA 5-226V brings 8 cores (4 performance + 4 efficiency) and 8 threads, 8MB cache to the table, with a 2.1GHz base clock and speeds up to 4.5GHz — premium efficiency-first chip built for thin laptops, here powering a compact all-in-one or mini PC with class-leading power efficiency, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

Intel Arc 130V (7 Xe cores, Xe2 (Battlemage-derived)) handles graphics duties on-chip — efficient integrated graphics for a compact all-in-one or mini PC, handling everyday multitasking and media smoothly.

Everything is built into a 23.8" FHD TOUCHSCREEN all-in-one display — ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$CORE ULTRA 5-226V Performance: 8 cores, 8 threads, 8MB cache, boosting up to 4.5GHz.$$, $$Intel Arc 130V Graphics: Efficient integrated graphics for a compact all-in-one or mini PC, handling everyday multitasking and media smoothly.$$, $$23.8" FHD TOUCHSCREEN All-in-One Display: no separate tower or cables to a monitor.$$, $$16GB DDR5 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: WIRED KEYBOARD AND MOUSE.$$],
  specs = $${"CPU": "CORE ULTRA 5-226V", "RAM": "16GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "23.8\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY/ WIRED KEYBOARD AND MOUSE", "Brand": "Lenovo", "Product Type": "All-in-One Desktop", "Model": "13QG0016EX", "Processor Cores": "8 (4P+4E)", "Processor Threads": "8", "Processor Speed": "2.1GHz, up to 4.5GHz", "Processor Cache": "8MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkcentre-aio-neo-50a-24-g6-13qg0016ex';

UPDATE products SET
  description = $$Lenovo ThinkCentre AiO Neo 50a-24 G5 12SC00ANEX is an all-in-one desktop built around a CORE 5-210H processor, paired with 16GB DDR5 and a 512GB NVME.

CORE 5-210H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — mainstream H-series laptop chip for everyday performance notebooks, one tier below Core 7/9 240H-series, chosen here as a laptop-class chip for its low power draw and quiet, fanless-friendly operation in this compact build.

Everything is built into a 23.8" FHD TOUCHSCREEN all-in-one display — ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$CORE 5-210H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.8GHz.$$, $$23.8" FHD TOUCHSCREEN All-in-One Display: no separate tower or cables to a monitor.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Included Extras: WIRED KEYBOARD AND MOUSE.$$],
  specs = $${"CPU": "CORE 5-210H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "23.8\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY/ WIRED KEYBOARD AND MOUSE", "Brand": "Lenovo", "Product Type": "All-in-One Desktop", "Model": "12SC00ANEX", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkcentre-aio-neo-50a-24-g5-12sc00anex';
