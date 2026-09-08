-- Rich product-page content for the laptop catalog: multi-paragraph
-- descriptions, scannable key-feature bullets, an expanded spec table
-- (processor cores/threads/speed/cache, graphics memory, brand/model),
-- and a per-product warranty paragraph. Sourced from Intel ARK, AMD.com,
-- NVIDIA.com and Apple Newsroom for every distinct chip in the catalog;
-- see the conversation for the 8 anomalies intentionally left untouched
-- (7 "MacBook Neo 13" SKUs listing an impossible iPhone chip, pending
-- your input; ThinkBook 16 G9's CPU field was auto-corrected in place).

UPDATE products SET
  description = $$ASUS ROG STRIX SCAR EDITION 18 G835LX-S9113 is a gaming laptop built around a CORE ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5090 Laptop GPU, paired with 64GB DDR5 and a 2TB NVME.

CORE ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5090 Laptop GPU, ships with 24GB of GDDR7 over a 256-bit bus, 10496 CUDA cores — flagship mobile GPU, NVIDIA's fastest laptop GPU for 4K gaming, VR, and professional AI/creative workloads.

Rounding out the package is a 18" 2.5K WQXGA (2560 x 1600) 240HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in OFF BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5090 Laptop GPU Graphics: 24GB GDDR7 for flagship mobile GPU, NVIDIA's fastest laptop GPU for 4K gaming, VR, and professional AI/creative workloads.$$, $$Display: 18" 2.5K WQXGA (2560 x 1600) 240HZ.$$, $$64GB DDR5 Memory + 2TB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes ROG GLADIUS 3 MOUSE P514 + ROG BACKPACK.$$],
  specs = $${"CPU": "CORE ULTRA 9 275HX", "RAM": "64GB DDR5", "Storage": "2TB NVME", "Language": "EN", "Screen": "18\" 2.5K WQXGA (2560 x 1600) 240HZ", "VGA": "RTX 5090 24GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "OFF BLACK/ROG GLADIUS 3 MOUSE P514 + ROG BACKPACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Model": "G835LX-S9113", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "24GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-rog-strix-scar-edition-18-g835lx-s9113';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — CORE ULTRA 9 285H / RTX 5090 24GB is a gaming laptop built around a CORE ULTRA 9 285H processor and discrete NVIDIA GeForce RTX 5090 Laptop GPU, paired with 64GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 9 285H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.4GHz — flagship Core Ultra H-series chip for high-performance thin gaming/creator laptops.

NVIDIA GeForce RTX 5090 Laptop GPU, ships with 24GB of GDDR7 over a 256-bit bus, 10496 CUDA cores — flagship mobile GPU, NVIDIA's fastest laptop GPU for 4K gaming, VR, and professional AI/creative workloads.

Rounding out the package is a 16" (2560 x 1600) OLED 240HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in PLATINUM WHITE.$$,
  key_features = ARRAY[$$CORE ULTRA 9 285H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5090 Laptop GPU Graphics: 24GB GDDR7 for flagship mobile GPU, NVIDIA's fastest laptop GPU for 4K gaming, VR, and professional AI/creative workloads.$$, $$Display: 16" (2560 x 1600) OLED 240HZ.$$, $$64GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes ROG IMPACT MOUSE + ROG SLEEVE.$$],
  specs = $${"CPU": "CORE ULTRA 9 285H", "RAM": "64GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" (2560 x 1600) OLED 240HZ", "VGA": "RTX 5090 24GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "PLATINUM WHITE/ROG IMPACT MOUSE + ROG SLEEVE", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.4GHz", "Processor Cache": "24MB", "Graphics Memory": "24GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-285h-rtx-5090-24gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5090 24GB is a gaming laptop built around a CORE ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5090 Laptop GPU, paired with 64GB DDR5 and a 2TB NVME.

CORE ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5090 Laptop GPU, ships with 24GB of GDDR7 over a 256-bit bus, 10496 CUDA cores — flagship mobile GPU, NVIDIA's fastest laptop GPU for 4K gaming, VR, and professional AI/creative workloads.

Rounding out the package is a 16" WQXGA (2560 x 1600) 240HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in OFF BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5090 Laptop GPU Graphics: 24GB GDDR7 for flagship mobile GPU, NVIDIA's fastest laptop GPU for 4K gaming, VR, and professional AI/creative workloads.$$, $$Display: 16" WQXGA (2560 x 1600) 240HZ.$$, $$64GB DDR5 Memory + 2TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 9 275HX", "RAM": "64GB DDR5", "Storage": "2TB NVME", "Language": "EN", "Screen": "16\" WQXGA (2560 x 1600) 240HZ", "VGA": "RTX 5090 24GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "OFF BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "24GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5080 16GB is a gaming laptop built around a CORE ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5080 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

CORE ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5080 Laptop GPU, ships with 16GB of GDDR7 over a 256-bit bus, 7680 CUDA cores — high-end mobile GPU for 4K gaming and demanding creative/AI workloads.

Rounding out the package is a 16-inch QHD+ (2560x1600) 240Hz display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in VOLT GREEN.$$,
  key_features = ARRAY[$$CORE ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5080 Laptop GPU Graphics: 16GB GDDR7 for high-end mobile GPU for 4K gaming and demanding creative/AI workloads.$$, $$Display: 16-inch QHD+ (2560x1600) 240Hz.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "16-inch QHD+ (2560x1600) 240Hz", "VGA": "RTX 5080 16GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "VOLT GREEN", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "16GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5080-16gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5070TI 12GB is a gaming laptop built around a CORE ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5070 Ti Laptop GPU, paired with 32GB DDR5 and a 2TB NVME.

CORE ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5070 Ti Laptop GPU, ships with 12GB of GDDR7 over a 192-bit bus, 5888 CUDA cores — upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.

Rounding out the package is a 18" 2.5K WQXGA (2560 x 1600) 240HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in VOLT GREEN.$$,
  key_features = ARRAY[$$CORE ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5070 Ti Laptop GPU Graphics: 12GB GDDR7 for upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.$$, $$Display: 18" 2.5K WQXGA (2560 x 1600) 240HZ.$$, $$32GB DDR5 Memory + 2TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "2TB NVME", "Language": "EN/AR", "Screen": "18\" 2.5K WQXGA (2560 x 1600) 240HZ", "VGA": "RTX 5070TI 12GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "VOLT GREEN", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "12GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070ti-12gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5070TI 12GB is a gaming laptop built around a CORE ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5070 Ti Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

CORE ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5070 Ti Laptop GPU, ships with 12GB of GDDR7 over a 192-bit bus, 5888 CUDA cores — upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.

Rounding out the package is a 16-inch QHD+ (2560x1600) 240Hz display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ECLIPSE GRAY.$$,
  key_features = ARRAY[$$CORE ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5070 Ti Laptop GPU Graphics: 12GB GDDR7 for upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.$$, $$Display: 16-inch QHD+ (2560x1600) 240Hz.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes ROG IMPACT MOUSE + ROG BACKPACK.$$],
  specs = $${"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16-inch QHD+ (2560x1600) 240Hz", "VGA": "RTX 5070TI 12GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE GRAY/ROG IMPACT MOUSE + ROG BACKPACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "12GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070ti-12gb-2';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen AI MAX+ 395 / AMD RADEON 8060S is a gaming laptop built around a AMD Ryzen AI MAX+ 395 processor and AMD Radeon 8060S, paired with 64GB DDR5 ON BOARD and a 1TB NVME.

AMD Ryzen AI MAX+ 395 brings 16 cores and 32 threads, 64MB cache to the table, with a 3GHz base clock and speeds up to 5.1GHz — flagship high-end mobile workstation chip with a huge integrated GPU (Radeon 8060S, 40 CUs) rivaling discrete-class graphics performance — used in premium 'mini-PC-class' laptops.

AMD Radeon 8060S (40 compute units, RDNA 3.5) handles graphics duties on-chip — high-end/flagship integrated GPU ("Strix Halo") that rivals discrete mobile GPUs — by far the most powerful integrated graphics AMD ships, aimed at gaming and local AI workloads on Ryzen AI Max+ 395.

Rounding out the package is a 13.4" 2.5K(2560 x 1600) 180Hz TOUCHSCREEN display with touch input — it runs Windows 11, finished in OFF BLACK.$$,
  key_features = ARRAY[$$AMD Ryzen AI MAX+ 395 Performance: 16 cores, 32 threads, 64MB cache, boosting up to 5.1GHz.$$, $$AMD Radeon 8060S Graphics: High-end/flagship integrated GPU ("Strix Halo") that rivals discrete mobile GPUs — by far the most powerful integrated graphics AMD ships, aimed at gaming and local AI workloads on Ryzen AI Max+ 395.$$, $$Display: 13.4" 2.5K(2560 x 1600) 180Hz TOUCHSCREEN.$$, $$64GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen AI MAX+ 395", "RAM": "64GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "13.4\" 2.5K(2560 x 1600) 180Hz TOUCHSCREEN", "VGA": "AMD RADEON 8060S", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "OFF BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16", "Processor Threads": "32", "Processor Speed": "3GHz, up to 5.1GHz", "Processor Cache": "64MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-ai-max-395-amd-radeon-8060s';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen AI MAX+ 395 / AMD RADEON 8060S is a gaming laptop built around a AMD Ryzen AI MAX+ 395 processor and AMD Radeon 8060S, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

AMD Ryzen AI MAX+ 395 brings 16 cores and 32 threads, 64MB cache to the table, with a 3GHz base clock and speeds up to 5.1GHz — flagship high-end mobile workstation chip with a huge integrated GPU (Radeon 8060S, 40 CUs) rivaling discrete-class graphics performance — used in premium 'mini-PC-class' laptops.

AMD Radeon 8060S (40 compute units, RDNA 3.5) handles graphics duties on-chip — high-end/flagship integrated GPU ("Strix Halo") that rivals discrete mobile GPUs — by far the most powerful integrated graphics AMD ships, aimed at gaming and local AI workloads on Ryzen AI Max+ 395.

Rounding out the package is a 13.4" 2.5K(2560 x 1600) 180Hz TOUCHSCREEN display with touch input — it runs Windows 11, finished in OFF BLACK.$$,
  key_features = ARRAY[$$AMD Ryzen AI MAX+ 395 Performance: 16 cores, 32 threads, 64MB cache, boosting up to 5.1GHz.$$, $$AMD Radeon 8060S Graphics: High-end/flagship integrated GPU ("Strix Halo") that rivals discrete mobile GPUs — by far the most powerful integrated graphics AMD ships, aimed at gaming and local AI workloads on Ryzen AI Max+ 395.$$, $$Display: 13.4" 2.5K(2560 x 1600) 180Hz TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen AI MAX+ 395", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "13.4\" 2.5K(2560 x 1600) 180Hz TOUCHSCREEN", "VGA": "AMD RADEON 8060S", "Warranty": "2 YEARS", "OS": "WIN 11", "Color": "OFF BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16", "Processor Threads": "32", "Processor Speed": "3GHz, up to 5.1GHz", "Processor Cache": "64MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-ai-max-395-amd-radeon-8060s-2';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD RYZEN 9-9955HX / RTX 5070TI 12GB is a gaming laptop built around a AMD RYZEN 9-9955HX processor and discrete NVIDIA GeForce RTX 5070 Ti Laptop GPU, paired with 16GB DDR5 and a 1TB NVME.

AMD RYZEN 9-9955HX brings 16 cores and 32 threads, 64MB cache to the table, with a 2.5GHz base clock and speeds up to 5.4GHz — flagship desktop-replacement gaming/creator processor, top-of-stack 16-core Zen 5 mobile chip.

NVIDIA GeForce RTX 5070 Ti Laptop GPU, ships with 12GB of GDDR7 over a 192-bit bus, 5888 CUDA cores — upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.

Rounding out the package is a 16-inch WUXGA 165HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ECLIPSE GRAY.$$,
  key_features = ARRAY[$$AMD RYZEN 9-9955HX Performance: 16 cores, 32 threads, 64MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5070 Ti Laptop GPU Graphics: 12GB GDDR7 for upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.$$, $$Display: 16-inch WUXGA 165HZ.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD RYZEN 9-9955HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "16-inch WUXGA 165HZ", "VGA": "RTX 5070TI 12GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE GRAY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16", "Processor Threads": "32", "Processor Speed": "2.5GHz, up to 5.4GHz", "Processor Cache": "64MB", "Graphics Memory": "12GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5060 8GB is a gaming laptop built around a CORE ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

CORE ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 18" 2.5K WQXGA (2560 x 1600) 240HZ display — it runs Windows 11, finished in ECLIPSE GRAY.$$,
  key_features = ARRAY[$$CORE ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 18" 2.5K WQXGA (2560 x 1600) 240HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "18\" 2.5K WQXGA (2560 x 1600) 240HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ECLIPSE GRAY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen 9 8940HX / RTX 5070 8GB is a gaming laptop built around a AMD Ryzen 9 8940HX processor and discrete NVIDIA GeForce RTX 5070 Laptop GPU, paired with 16GB DDR5 and a 1TB NVME.

AMD Ryzen 9 8940HX brings 16 cores and 32 threads, 64MB cache to the table, with a 2.4GHz base clock and speeds up to 5.3GHz — desktop-replacement gaming/workstation processor for high-end laptops, 16 full Zen 4 cores.

NVIDIA GeForce RTX 5070 Laptop GPU, 4608 CUDA cores — mid-range mobile GPU for solid 1440p gaming and creator workloads.

Rounding out the package is a 16" WUXGA 165HZ display — it runs Windows 11, finished in ECLIPSE GRAY.$$,
  key_features = ARRAY[$$AMD Ryzen 9 8940HX Performance: 16 cores, 32 threads, 64MB cache, boosting up to 5.3GHz.$$, $$NVIDIA GeForce RTX 5070 Laptop GPU Graphics: 8 or 12 (two variants ship under the same name)GB GDDR7 for mid-range mobile GPU for solid 1440p gaming and creator workloads.$$, $$Display: 16" WUXGA 165HZ.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 9 8940HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WUXGA 165HZ", "VGA": "RTX 5070 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ECLIPSE GRAY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16", "Processor Threads": "32", "Processor Speed": "2.4GHz, up to 5.3GHz", "Processor Cache": "64MB", "Graphics Memory": "8 or 12 (two variants ship under the same name)GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen 7 260 / RTX 5060 8GB is a gaming laptop built around a AMD Ryzen 7 260 processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 16GB DDR5 and a 1TB NVME.

AMD Ryzen 7 260 brings 8 cores and 16 threads, 16MB cache to the table, with a 3.8GHz base clock and speeds up to 5.1GHz — higher-clocked 8-core Ryzen 200-series chip for mainstream performance laptops.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 18"WUXGA 144HZ display — it runs Windows 11, finished in GRAY.$$,
  key_features = ARRAY[$$AMD Ryzen 7 260 Performance: 8 cores, 16 threads, 16MB cache, boosting up to 5.1GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 18"WUXGA 144HZ.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 7 260", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "18\"WUXGA 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "GRAY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "8", "Processor Threads": "16", "Processor Speed": "3.8GHz, up to 5.1GHz", "Processor Cache": "16MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-7-260-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — SNAPDRAGON X PLUS X1P 42 100 3.4 GHZ is a gaming laptop built around a SNAPDRAGON X PLUS X1P 42 100 3.4 GHZ processor, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

SNAPDRAGON X PLUS X1P 42 100 3.4 GHZ brings 8 cores and 8 threads, 30MB cache to the table, with speeds up to 3.4GHz — value-tier Windows-on-Arm chip for long-battery-life productivity laptops, cut down from the flagship X Elite.

Rounding out the package is a 13"OLED (2880 x 1800) DETACHABLE display — it runs Windows 11, finished in QUALCOMM SNAPDRAGON X ELITE ADRENO.$$,
  key_features = ARRAY[$$SNAPDRAGON X PLUS X1P 42 100 3.4 GHZ Performance: 8 cores, 8 threads, 30MB cache, boosting up to 3.4GHz.$$, $$Display: 13"OLED (2880 x 1800) DETACHABLE.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes NANO BLACK.$$],
  specs = $${"CPU": "SNAPDRAGON X PLUS X1P 42 100 3.4 GHZ", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "13\"OLED (2880 x 1800) DETACHABLE", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "QUALCOMM SNAPDRAGON X ELITE ADRENO / NANO BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "up to 3.4GHz", "Processor Cache": "30MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-snapdragon-x-plus-x1p-42-100-3-4-ghz';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core ULTRA 9 285H / RTX5070 8GB is a gaming laptop built around a Core ULTRA 9 285H processor and discrete NVIDIA GeForce RTX 5070 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

Core ULTRA 9 285H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.4GHz — flagship Core Ultra H-series chip for high-performance thin gaming/creator laptops.

NVIDIA GeForce RTX 5070 Laptop GPU, 4608 CUDA cores — mid-range mobile GPU for solid 1440p gaming and creator workloads.

Rounding out the package is a 16" 2K 144HZ display — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 9 285H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5070 Laptop GPU Graphics: 8 or 12 (two variants ship under the same name)GB GDDR7 for mid-range mobile GPU for solid 1440p gaming and creator workloads.$$, $$Display: 16" 2K 144HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 9 285H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K 144HZ", "VGA": "RTX5070 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.4GHz", "Processor Cache": "24MB", "Graphics Memory": "8 or 12 (two variants ship under the same name)GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-285h-rtx5070-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen 9 365 / RTX 5060 8GB is a gaming laptop built around a AMD Ryzen 9 365 processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

AMD Ryzen 9 365 brings 10 cores (4 performance + 6 efficiency) and 20 threads, 24MB cache to the table, with a 2GHz base clock and speeds up to 5GHz — flagship-tier thin-and-light AI PC chip with strong multi-threaded performance and integrated Radeon 880M graphics.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 17.3" (1920 x 1200) 144HZ display — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$AMD Ryzen 9 365 Performance: 10 cores, 20 threads, 24MB cache, boosting up to 5GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 17.3" (1920 x 1200) 144HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 9 365", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "17.3\" (1920 x 1200) 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "10 (4P+6E)", "Processor Threads": "20", "Processor Speed": "2GHz, up to 5GHz", "Processor Cache": "24MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-365-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen 9 8940HX / RTX 5060 8GB is a gaming laptop built around a AMD Ryzen 9 8940HX processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

AMD Ryzen 9 8940HX brings 16 cores and 32 threads, 64MB cache to the table, with a 2.4GHz base clock and speeds up to 5.3GHz — desktop-replacement gaming/workstation processor for high-end laptops, 16 full Zen 4 cores.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 16-inch diagonal, 2K (1920 x 1200) 144HZ display — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$AMD Ryzen 9 8940HX Performance: 16 cores, 32 threads, 64MB cache, boosting up to 5.3GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 16-inch diagonal, 2K (1920 x 1200) 144HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 9 8940HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16-inch diagonal, 2K (1920 x 1200) 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16", "Processor Threads": "32", "Processor Speed": "2.4GHz, up to 5.3GHz", "Processor Cache": "64MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core ULTRA 7 255H / RTX 5060 8GB is a gaming laptop built around a Core ULTRA 7 255H processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 16GB DDR5 and a 1TB NVME.

Core ULTRA 7 255H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.1GHz — upper-mid Core Ultra H-series chip for mainstream performance/gaming laptops.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 16-inch diagonal, 2K (1920 x 1200) 144HZ display — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 7 255H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.1GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 16-inch diagonal, 2K (1920 x 1200) 144HZ.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16-inch diagonal, 2K (1920 x 1200) 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.1GHz", "Processor Cache": "24MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-7-255h-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5090 24GB is a gaming laptop built around a Core ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5090 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

Core ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5090 Laptop GPU, ships with 24GB of GDDR7 over a 256-bit bus, 10496 CUDA cores — flagship mobile GPU, NVIDIA's fastest laptop GPU for 4K gaming, VR, and professional AI/creative workloads.

Rounding out the package is a 16" WQXGA (2560x1600) OLED 240HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ECLIPSE BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5090 Laptop GPU Graphics: 24GB GDDR7 for flagship mobile GPU, NVIDIA's fastest laptop GPU for 4K gaming, VR, and professional AI/creative workloads.$$, $$Display: 16" WQXGA (2560x1600) OLED 240HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "16\" WQXGA (2560x1600) OLED 240HZ", "VGA": "RTX 5090 24GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "24GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-2';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5080 16GB is a gaming laptop built around a Core ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5080 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

Core ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5080 Laptop GPU, ships with 16GB of GDDR7 over a 256-bit bus, 7680 CUDA cores — high-end mobile GPU for 4K gaming and demanding creative/AI workloads.

Rounding out the package is a 16" WQXGA (2560x1600) OLED 240HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ECLIPSE BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5080 Laptop GPU Graphics: 16GB GDDR7 for high-end mobile GPU for 4K gaming and demanding creative/AI workloads.$$, $$Display: 16" WQXGA (2560x1600) OLED 240HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "16\" WQXGA (2560x1600) OLED 240HZ", "VGA": "RTX 5080 16GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "16GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5080-16gb-2';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5070 8GB is a gaming laptop built around a Core ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5070 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

Core ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5070 Laptop GPU, 4608 CUDA cores — mid-range mobile GPU for solid 1440p gaming and creator workloads.

Rounding out the package is a 16" WQXGA (2560x1600) OLED 165HZ display — it runs Windows 11, finished in ECLIPSE BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5070 Laptop GPU Graphics: 8 or 12 (two variants ship under the same name)GB GDDR7 for mid-range mobile GPU for solid 1440p gaming and creator workloads.$$, $$Display: 16" WQXGA (2560x1600) OLED 165HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WQXGA (2560x1600) OLED 165HZ", "VGA": "RTX 5070 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ECLIPSE BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "8 or 12 (two variants ship under the same name)GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core I9-14900HX / RTX 5070 8GB is a gaming laptop built around a Core I9-14900HX processor and discrete NVIDIA GeForce RTX 5070 Laptop GPU, paired with 16GB DDR5 and a 1TB NVME.

Core I9-14900HX brings 24 cores (8 performance + 16 efficiency) and 32 threads, 36MB cache to the table, with a 2.2GHz base clock and speeds up to 5.8GHz — flagship desktop-replacement gaming processor, Intel's fastest 14th-gen mobile chip.

NVIDIA GeForce RTX 5070 Laptop GPU, 4608 CUDA cores — mid-range mobile GPU for solid 1440p gaming and creator workloads.

Rounding out the package is a 15.1" WQXGA (2560x1600) OLED 165HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ECLIPSE BLACK.$$,
  key_features = ARRAY[$$Core I9-14900HX Performance: 24 cores, 32 threads, 36MB cache, boosting up to 5.8GHz.$$, $$NVIDIA GeForce RTX 5070 Laptop GPU Graphics: 8 or 12 (two variants ship under the same name)GB GDDR7 for mid-range mobile GPU for solid 1440p gaming and creator workloads.$$, $$Display: 15.1" WQXGA (2560x1600) OLED 165HZ.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I9-14900HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "15.1\" WQXGA (2560x1600) OLED 165HZ", "VGA": "RTX 5070 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "32", "Processor Speed": "2.2GHz, up to 5.8GHz", "Processor Cache": "36MB", "Graphics Memory": "8 or 12 (two variants ship under the same name)GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i9-14900hx-rtx-5070-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5060 8GB is a gaming laptop built around a Core ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

Core ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 16" WQXGA (2560x1600) 240HZ display — it runs Windows 11, finished in STORM GREY.$$,
  key_features = ARRAY[$$Core ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 16" WQXGA (2560x1600) 240HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WQXGA (2560x1600) 240HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "STORM GREY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb-2';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core I7-13650HX / RTX 5060 8GB is a gaming laptop built around a Core I7-13650HX processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 32GB DDR5 and a 512GB NVME.

Core I7-13650HX brings 14 cores (6 performance + 8 efficiency) and 20 threads, 24MB cache to the table, with a 2.6GHz base clock and speeds up to 4.9GHz — desktop-derived HX chip for mid-range gaming laptops.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 17.3" FHD 165HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I7-13650HX Performance: 14 cores, 20 threads, 24MB cache, boosting up to 4.9GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 17.3" FHD 165HZ.$$, $$32GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I7-13650HX", "RAM": "32GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "17.3\" FHD 165HZ", "VGA": "RTX 5060 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "LUNA GREY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "14 (6P+8E)", "Processor Threads": "20", "Processor Speed": "2.6GHz, up to 4.9GHz", "Processor Cache": "24MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core I7-14700HX / RTX 5060 8GB is a gaming laptop built around a Core I7-14700HX processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 16GB DDR5 and a 512GB NVME.

Core I7-14700HX brings 20 cores (8 performance + 12 efficiency) and 28 threads, 33MB cache to the table, with a 2.1GHz base clock and speeds up to 5.5GHz — high-end desktop-replacement gaming/creator chip, near flagship performance short of the i9-14900HX.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 15.6" FHD 144HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I7-14700HX Performance: 20 cores, 28 threads, 33MB cache, boosting up to 5.5GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 15.6" FHD 144HZ.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I7-14700HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "LUNA GREY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "20 (8P+12E)", "Processor Threads": "28", "Processor Speed": "2.1GHz, up to 5.5GHz", "Processor Cache": "33MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i7-14700hx-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core I7-13650HX / RTX 5050 8GB is a gaming laptop built around a Core I7-13650HX processor and discrete NVIDIA GeForce RTX 5050 Laptop GPU, paired with 24GB DDR5 and a 512GB NVME.

Core I7-13650HX brings 14 cores (6 performance + 8 efficiency) and 20 threads, 24MB cache to the table, with a 2.6GHz base clock and speeds up to 4.9GHz — desktop-derived HX chip for mid-range gaming laptops.

NVIDIA GeForce RTX 5050 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 2560 CUDA cores — entry-level Blackwell mobile GPU aimed at 1080p gaming.

Rounding out the package is a 17.3" FHD 165HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I7-13650HX Performance: 14 cores, 20 threads, 24MB cache, boosting up to 4.9GHz.$$, $$NVIDIA GeForce RTX 5050 Laptop GPU Graphics: 8GB GDDR7 for entry-level Blackwell mobile GPU aimed at 1080p gaming.$$, $$Display: 17.3" FHD 165HZ.$$, $$24GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I7-13650HX", "RAM": "24GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "17.3\" FHD 165HZ", "VGA": "RTX 5050 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "LUNA GREY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "14 (6P+8E)", "Processor Threads": "20", "Processor Speed": "2.6GHz, up to 4.9GHz", "Processor Cache": "24MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-5050-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core I7-13650HX / RTX 5050 8GB is a gaming laptop built around a Core I7-13650HX processor and discrete NVIDIA GeForce RTX 5050 Laptop GPU, paired with 16GB DDR5 and a 512GB NVME.

Core I7-13650HX brings 14 cores (6 performance + 8 efficiency) and 20 threads, 24MB cache to the table, with a 2.6GHz base clock and speeds up to 4.9GHz — desktop-derived HX chip for mid-range gaming laptops.

NVIDIA GeForce RTX 5050 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 2560 CUDA cores — entry-level Blackwell mobile GPU aimed at 1080p gaming.

Rounding out the package is a 15.3" WUXGA (1920x1200) 165HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ECLIPSE BLACK.$$,
  key_features = ARRAY[$$Core I7-13650HX Performance: 14 cores, 20 threads, 24MB cache, boosting up to 4.9GHz.$$, $$NVIDIA GeForce RTX 5050 Laptop GPU Graphics: 8GB GDDR7 for entry-level Blackwell mobile GPU aimed at 1080p gaming.$$, $$Display: 15.3" WUXGA (1920x1200) 165HZ.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I7-13650HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200) 165HZ", "VGA": "RTX 5050 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "14 (6P+8E)", "Processor Threads": "20", "Processor Speed": "2.6GHz, up to 4.9GHz", "Processor Cache": "24MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-5050-8gb-2';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen 7 250 8 CORES / RTX 5060 8GB is a gaming laptop built around a AMD Ryzen 7 250 8 CORES processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 16GB DDR5 and a 512GB NVME.

AMD Ryzen 7 250 8 CORES brings 8 cores and 16 threads, 16MB cache to the table, with a 3.3GHz base clock and speeds up to 5.1GHz — mainstream 8-core thin-and-light laptop chip with integrated Radeon 780M graphics and a basic NPU.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 15.6" FHD 144HZ display — it runs Windows 11, finished in LUNA GREY.$$,
  key_features = ARRAY[$$AMD Ryzen 7 250 8 CORES Performance: 8 cores, 16 threads, 16MB cache, boosting up to 5.1GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 15.6" FHD 144HZ.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 7 250 8 CORES", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "LUNA GREY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "8", "Processor Threads": "16", "Processor Speed": "3.3GHz, up to 5.1GHz", "Processor Cache": "16MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-7-250-8-cores-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core I7-13650HX / RTX 3050 6GB is a gaming laptop built around a Core I7-13650HX processor and discrete NVIDIA GeForce RTX 3050 Laptop GPU, paired with 16GB DDR5 and a 512GB NVME.

Core I7-13650HX brings 14 cores (6 performance + 8 efficiency) and 20 threads, 24MB cache to the table, with a 2.6GHz base clock and speeds up to 4.9GHz — desktop-derived HX chip for mid-range gaming laptops.

NVIDIA GeForce RTX 3050 Laptop GPU, ships with 6GB of GDDR6 over a 96-bit bus, 2560 CUDA cores — entry-level Ampere mobile GPU for budget 1080p gaming, older generation still found in value laptops.

Rounding out the package is a 15.6" FHD 144HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I7-13650HX Performance: 14 cores, 20 threads, 24MB cache, boosting up to 4.9GHz.$$, $$NVIDIA GeForce RTX 3050 Laptop GPU Graphics: 6GB GDDR6 for entry-level Ampere mobile GPU for budget 1080p gaming, older generation still found in value laptops.$$, $$Display: 15.6" FHD 144HZ.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I7-13650HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 3050 6GB", "Warranty": "1 YEAR", "OS": "DOS", "Color": "LUNA GREY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "14 (6P+8E)", "Processor Threads": "20", "Processor Speed": "2.6GHz, up to 4.9GHz", "Processor Cache": "24MB", "Graphics Memory": "6GB GDDR6"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-3050-6gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD RYZEN 5 7235HS / RTX 4050 6GB is a gaming laptop built around a AMD RYZEN 5 7235HS processor and discrete NVIDIA GeForce RTX 4050 Laptop GPU, paired with 16GB DDR5 and a 512GB SSD.

AMD RYZEN 5 7235HS brings 4 cores and 8 threads, 8MB cache to the table, with a 3.2GHz base clock and speeds up to 4.2GHz — budget quad-core mobile chip for light everyday laptop tasks, not a true 6-core Ryzen 7.

NVIDIA GeForce RTX 4050 Laptop GPU, ships with 6GB of GDDR6 over a 96-bit bus, 2560 CUDA cores — entry-level Ada Lovelace mobile GPU for 1080p gaming, previous generation.

Rounding out the package is a 15.6" FHD 144HZ display — it runs Windows 11, finished in LUNA GREY.$$,
  key_features = ARRAY[$$AMD RYZEN 5 7235HS Performance: 4 cores, 8 threads, 8MB cache, boosting up to 4.2GHz.$$, $$NVIDIA GeForce RTX 4050 Laptop GPU Graphics: 6GB GDDR6 for entry-level Ada Lovelace mobile GPU for 1080p gaming, previous generation.$$, $$Display: 15.6" FHD 144HZ.$$, $$16GB DDR5 Memory + 512GB SSD: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD RYZEN 5 7235HS", "RAM": "16GB DDR5", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 4050 6GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "LUNA GREY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "4", "Processor Threads": "8", "Processor Speed": "3.2GHz, up to 4.2GHz", "Processor Cache": "8MB", "Graphics Memory": "6GB GDDR6"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-5-7235hs-rtx-4050-6gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen Z1 Extreme 8 CORES / AMD RADEON is a gaming laptop built around a AMD Ryzen Z1 Extreme 8 CORES processor and 12-compute-unit RDNA 3 integrated Radeon graphics (the full, unlocked Z1 Extreme iGPU), paired with 32GB DDR5 ON BOARD and a 1TB NVME.

AMD Ryzen Z1 Extreme 8 CORES brings 8 cores and 16 threads, 16MB cache to the table, with a 3.3GHz base clock and speeds up to 5.1GHz — handheld-gaming-console-class APU (used in ROG Ally, etc.) tuned for high graphics performance at low power envelopes rather than typical clamshell laptop use.

Graphics are handled by 12-compute-unit RDNA 3 integrated Radeon graphics (the full, unlocked Z1 Extreme iGPU).

Rounding out the package is a 8" WUXGA (1920x1200) IPS 500nits Glossy / Anti-fingerprint, 100% sRGB, 48-120Hz VRR, Panda King Glass, Low Blue Light, Touch display with touch input — it runs Windows 11, finished in Nebula Nocturne.$$,
  key_features = ARRAY[$$AMD Ryzen Z1 Extreme 8 CORES Performance: 8 cores, 16 threads, 16MB cache, boosting up to 5.1GHz.$$, $$Integrated Graphics: 12-compute-unit RDNA 3 integrated Radeon graphics (the full, unlocked Z1 Extreme iGPU).$$, $$Display: 8" WUXGA (1920x1200) IPS 500nits Glossy / Anti-fingerprint, 100% sRGB, 48-120Hz VRR, Panda King Glass, Low Blue Light, Touch.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen Z1 Extreme 8 CORES", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "8\" WUXGA (1920x1200) IPS 500nits Glossy / Anti-fingerprint, 100% sRGB, 48-120Hz VRR, Panda King Glass, Low Blue Light, Touch", "VGA": "AMD RADEON", "Warranty": "1 YEAR", "Color": "STEAM OS / Nebula Nocturne", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "8", "Processor Threads": "16", "Processor Speed": "3.3GHz, up to 5.1GHz", "Processor Cache": "16MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-z1-extreme-8-cores-amd-radeon';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core I5-13450HX / RTX 3050 6GB is a gaming laptop built around a Core I5-13450HX processor and discrete NVIDIA GeForce RTX 3050 Laptop GPU, paired with 16GB DDR5 and a 512GB NVME.

Core I5-13450HX brings 10 cores (6 performance + 4 efficiency) and 16 threads, 20MB cache to the table, with a 2.4GHz base clock and speeds up to 4.6GHz — entry point into Intel's desktop-derived HX line for gaming laptops.

NVIDIA GeForce RTX 3050 Laptop GPU, ships with 6GB of GDDR6 over a 96-bit bus, 2560 CUDA cores — entry-level Ampere mobile GPU for budget 1080p gaming, older generation still found in value laptops.

Rounding out the package is a 15.6" FHD 144HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I5-13450HX Performance: 10 cores, 16 threads, 20MB cache, boosting up to 4.6GHz.$$, $$NVIDIA GeForce RTX 3050 Laptop GPU Graphics: 6GB GDDR6 for entry-level Ampere mobile GPU for budget 1080p gaming, older generation still found in value laptops.$$, $$Display: 15.6" FHD 144HZ.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I5-13450HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 3050 6GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "LUNA GREY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.4GHz, up to 4.6GHz", "Processor Cache": "20MB", "Graphics Memory": "6GB GDDR6"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i5-13450hx-rtx-3050-6gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core ULTRA 9 285HX / RTX 5070TI DDR7 12GB is a gaming laptop built around a Core ULTRA 9 285HX processor and discrete NVIDIA GeForce RTX 5070 Ti Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

Core ULTRA 9 285HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.8GHz base clock and speeds up to 5.5GHz — flagship desktop-replacement gaming/workstation processor, Intel's fastest mobile chip in the Arrow Lake-HX generation.

NVIDIA GeForce RTX 5070 Ti Laptop GPU, ships with 12GB of GDDR7 over a 192-bit bus, 5888 CUDA cores — upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.

Rounding out the package is a 18" QHD+ (2560x1600) 240HZ display — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 9 285HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.5GHz.$$, $$NVIDIA GeForce RTX 5070 Ti Laptop GPU Graphics: 12GB GDDR7 for upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.$$, $$Display: 18" QHD+ (2560x1600) 240HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 9 285HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "18\" QHD+ (2560x1600) 240HZ", "VGA": "RTX 5070TI DDR7 12GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.8GHz, up to 5.5GHz", "Processor Cache": "36MB", "Graphics Memory": "12GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-285hx-rtx-5070ti-ddr7-12gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD Ryzen 9 8940HX / RTX 5070TI DDR7 12GB is a gaming laptop built around a AMD Ryzen 9 8940HX processor and discrete NVIDIA GeForce RTX 5070 Ti Laptop GPU, paired with 16GB DDR5 and a 1TB NVME.

AMD Ryzen 9 8940HX brings 16 cores and 32 threads, 64MB cache to the table, with a 2.4GHz base clock and speeds up to 5.3GHz — desktop-replacement gaming/workstation processor for high-end laptops, 16 full Zen 4 cores.

NVIDIA GeForce RTX 5070 Ti Laptop GPU, ships with 12GB of GDDR7 over a 192-bit bus, 5888 CUDA cores — upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.

Rounding out the package is a 16" WQXGA (2560x1600) 240HZ display — it runs Windows 11, finished in GRAY.$$,
  key_features = ARRAY[$$AMD Ryzen 9 8940HX Performance: 16 cores, 32 threads, 64MB cache, boosting up to 5.3GHz.$$, $$NVIDIA GeForce RTX 5070 Ti Laptop GPU Graphics: 12GB GDDR7 for upper mid-range/high-performance mobile GPU for high-refresh 1440p and entry 4K gaming.$$, $$Display: 16" WQXGA (2560x1600) 240HZ.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 9 8940HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WQXGA (2560x1600) 240HZ", "VGA": "RTX 5070TI DDR7 12GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "GRAY", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16", "Processor Threads": "32", "Processor Speed": "2.4GHz, up to 5.3GHz", "Processor Cache": "64MB", "Graphics Memory": "12GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070ti-ddr7-12gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core i7-14650HX / RTX 5060 DDR7 8GB is a gaming laptop built around a Core i7-14650HX processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 16GB DDR5 and a 512GB NVME.

Core i7-14650HX brings 16 cores (8 performance + 8 efficiency) and 24 threads, 30MB cache to the table, with a 2.2GHz base clock and speeds up to 5.2GHz — higher-core-count desktop-replacement chip for performance gaming laptops.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 15.6" FHD 144HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core i7-14650HX Performance: 16 cores, 24 threads, 30MB cache, boosting up to 5.2GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 15.6" FHD 144HZ.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core i7-14650HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5060 DDR7 8GB", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16 (8P+8E)", "Processor Threads": "24", "Processor Speed": "2.2GHz, up to 5.2GHz", "Processor Cache": "30MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i7-14650hx-rtx-5060-ddr7-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core i7-14650HX / RTX 5050 DDR7 8GB is a gaming laptop built around a Core i7-14650HX processor and discrete NVIDIA GeForce RTX 5050 Laptop GPU, paired with 16GB DDR5 and a 512GB NVME.

Core i7-14650HX brings 16 cores (8 performance + 8 efficiency) and 24 threads, 30MB cache to the table, with a 2.2GHz base clock and speeds up to 5.2GHz — higher-core-count desktop-replacement chip for performance gaming laptops.

NVIDIA GeForce RTX 5050 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 2560 CUDA cores — entry-level Blackwell mobile GPU aimed at 1080p gaming.

Rounding out the package is a 15.6" FHD 144HZ display — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$Core i7-14650HX Performance: 16 cores, 24 threads, 30MB cache, boosting up to 5.2GHz.$$, $$NVIDIA GeForce RTX 5050 Laptop GPU Graphics: 8GB GDDR7 for entry-level Blackwell mobile GPU aimed at 1080p gaming.$$, $$Display: 15.6" FHD 144HZ.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core i7-14650HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5050 DDR7 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "16 (8P+8E)", "Processor Threads": "24", "Processor Speed": "2.2GHz, up to 5.2GHz", "Processor Cache": "30MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i7-14650hx-rtx-5050-ddr7-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core 7-240H / RTX 5060 8GB is a gaming laptop built around a Core 7-240H processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 16GB DDR5 and a 512 GB NVME.

Core 7-240H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.5GHz base clock and speeds up to 5.2GHz — mainstream-performance H-series chip for gaming/creator laptops, Intel's non-'Ultra' Arrow Lake-H rebrand tier.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 15.6" FHD 144HZ display — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$Core 7-240H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 5.2GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 15.6" FHD 144HZ.$$, $$16GB DDR5 Memory + 512 GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core 7-240H", "RAM": "16GB DDR5", "Storage": "512 GB NVME", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.5GHz, up to 5.2GHz", "Processor Cache": "24MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-7-240h-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core 9-270H is a gaming laptop built around a Core 9-270H processor, paired with 32GB DDR5 and a 1TB NVME.

Core 9-270H brings 14 cores (6 performance + 8 efficiency) and 20 threads, 24MB cache to the table, with a 2.7GHz base clock and speeds up to 5.8GHz — highest-tier non-'Ultra' H-series chip, near-flagship gaming/creator performance without the Ultra branding/NPU emphasis.

Rounding out the package is a 15.6" FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in CLASSIC BLACK.$$,
  key_features = ARRAY[$$Core 9-270H Performance: 14 cores, 20 threads, 24MB cache, boosting up to 5.8GHz.$$, $$Display: 15.6" FHD TOUCHSCREEN.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core 9-270H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "15.6\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / CLASSIC BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "14 (6P+8E)", "Processor Threads": "20", "Processor Speed": "2.7GHz, up to 5.8GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-9-270h';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — AMD RYZEN 5 7535HS / RTX 4050 6GB is a gaming laptop built around a AMD RYZEN 5 7535HS processor and discrete NVIDIA GeForce RTX 4050 Laptop GPU, paired with 8GB DDR5 and a 512GB SSD.

AMD RYZEN 5 7535HS brings 6 cores and 12 threads, 16MB cache to the table, with a 3.3GHz base clock and speeds up to 4.55GHz — mainstream 6-core mobile gaming/creator chip, one tier above the 7235HS.

NVIDIA GeForce RTX 4050 Laptop GPU, ships with 6GB of GDDR6 over a 96-bit bus, 2560 CUDA cores — entry-level Ada Lovelace mobile GPU for 1080p gaming, previous generation.

Rounding out the package is a 15.6" FHD 144HZ display — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$AMD RYZEN 5 7535HS Performance: 6 cores, 12 threads, 16MB cache, boosting up to 4.55GHz.$$, $$NVIDIA GeForce RTX 4050 Laptop GPU Graphics: 6GB GDDR6 for entry-level Ada Lovelace mobile GPU for 1080p gaming, previous generation.$$, $$Display: 15.6" FHD 144HZ.$$, $$8GB DDR5 Memory + 512GB SSD: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD RYZEN 5 7535HS", "RAM": "8GB DDR5", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 4050 6GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "6", "Processor Threads": "12", "Processor Speed": "3.3GHz, up to 4.55GHz", "Processor Cache": "16MB", "Graphics Memory": "6GB GDDR6"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-amd-ryzen-5-7535hs-rtx-4050-6gb';

UPDATE products SET
  description = $$The MSI Claw is a Windows 11 handheld gaming PC, not a clamshell laptop — a 7" 120Hz touchscreen with a full game-controller layout built around a Core ULTRA 7 155U processor.

Core ULTRA 7 155U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 4.8GHz — first-generation Core Ultra ultraportable chip, notable for introducing Intel's on-die NPU (AI Boost) and tile-based chiplet design.

With 16GB of memory and a 1TB SSD, it runs full PC games natively over Wi-Fi or docked to a monitor. Ships with a free MSI Claw travel case.$$,
  key_features = ARRAY[$$Core ULTRA 7 155U Performance: 12 cores, 14 threads, boosting up to 4.8GHz.$$, $$7" 120Hz Touchscreen: built-in game controls either side of the display.$$, $$16GB Memory + 1TB SSD: enough headroom to install and run full PC game libraries.$$, $$Includes a free MSI Claw travel case for on-the-go gaming.$$],
  specs = $${"CPU": "Core ULTRA 7 155U", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "7\" FHD 120HZ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL ARC / BLACK/FREE MSI CLAW TRAVEL CASE", "Brand": "MSI", "Product Type": "Handheld Gaming PC", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'msi-gaming-laptop-core-ultra-7-155u';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core 7 SERIES 2 240H / RTX 5060 8GB is a gaming laptop built around a Core 7 SERIES 2 240H processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 32GB DDR5 and a 1TB NVME.

Core 7 SERIES 2 240H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.5GHz base clock and speeds up to 5.2GHz — mainstream-performance H-series chip for gaming/creator laptops, Intel's non-'Ultra' Arrow Lake-H rebrand tier.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 16" WVA (2560x1600) 120HZ display — it runs Windows 11, finished in Interstellar Indigo.$$,
  key_features = ARRAY[$$Core 7 SERIES 2 240H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 5.2GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 16" WVA (2560x1600) 120HZ.$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core 7 SERIES 2 240H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WVA (2560x1600) 120HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "Interstellar Indigo", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.5GHz, up to 5.2GHz", "Processor Cache": "24MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-7-series-2-240h-rtx-5060-8gb';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5060 8GB is a gaming laptop built around a Core ULTRA 9 275HX processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 16GB DDR5 and a 1TB NVME.

Core ULTRA 9 275HX brings 24 cores (8 performance + 16 efficiency) and 24 threads, 36MB cache to the table, with a 2.7GHz base clock and speeds up to 5.4GHz — high-end desktop-replacement chip for gaming/workstation laptops, one tier below the flagship 285HX.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 16" OLED (2560x1600) 240HZ display — it runs Windows 11, finished in OBSIDIAN BLACK.$$,
  key_features = ARRAY[$$Core ULTRA 9 275HX Performance: 24 cores, 24 threads, 36MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 16" OLED (2560x1600) 240HZ.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 9 275HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" OLED (2560x1600) 240HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "OBSIDIAN BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "24 (8P+16E)", "Processor Threads": "24", "Processor Speed": "2.7GHz, up to 5.4GHz", "Processor Cache": "36MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb-3';

UPDATE products SET
  description = $$ASUS GAMING LAPTOP — Core I9-13900H / RTX 5060 8GB is a gaming laptop built around a Core I9-13900H processor and discrete NVIDIA GeForce RTX 5060 Laptop GPU, paired with 16GB DDR4 and a 512GB NVME.

Core I9-13900H brings 14 cores (6 performance + 8 efficiency) and 20 threads, 24MB cache to the table, with a 2.6GHz base clock and speeds up to 5.4GHz — flagship H-series chip for high-performance thin gaming/creator laptops.

NVIDIA GeForce RTX 5060 Laptop GPU, ships with 8GB of GDDR7 over a 128-bit bus, 3328 CUDA cores — entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.

Rounding out the package is a 15.6" FHD 165HZ display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$Core I9-13900H Performance: 14 cores, 20 threads, 24MB cache, boosting up to 5.4GHz.$$, $$NVIDIA GeForce RTX 5060 Laptop GPU Graphics: 8GB GDDR7 for entry-to-mainstream Blackwell mobile GPU, a step above the RTX 5050 for solid 1080p/light 1440p gaming.$$, $$Display: 15.6" FHD 165HZ.$$, $$16GB DDR4 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I9-13900H", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD 165HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK", "Brand": "Asus", "Product Type": "Gaming Laptop", "Processor Cores": "14 (6P+8E)", "Processor Threads": "20", "Processor Speed": "2.6GHz, up to 5.4GHz", "Processor Cache": "24MB", "Graphics Memory": "8GB GDDR7"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-gaming-laptop-core-i9-13900h-rtx-5060-8gb';

UPDATE products SET
  description = $$LENOVO YOGA 7 AURA EDITION 15ILL9 83HM002WUS is a laptop built around a Core ULTRA 7 258V processor and Intel Arc 140V, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

Core ULTRA 7 258V brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — premium efficiency-first ultraportable chip, identical CPU config to 256V but paired with 32GB on-package memory.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 15.3" 2.8K WQXGA+ (2880x1800) TOUCHSCREEN display with touch input — it runs Windows 11, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core ULTRA 7 258V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 15.3" 2.8K WQXGA+ (2880x1800) TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 7 258V", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "15.3\" 2.8K WQXGA+ (2880x1800) TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "LUNA GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83HM002WUS", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-yoga-7-aura-edition-15ill9-83hm002wus';

UPDATE products SET
  description = $$LENOVO IDEAPAD 5 2 IN 1 16 83KS001BUS is a 2-in-1 laptop built around a Core ULTRA 7 255U processor, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

Core ULTRA 7 255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 16" WUXGA (1920x1200)X360 TOUCHSCREEN display with touch input — it runs Windows 11, finished in COSMIC BLUE.$$,
  key_features = ARRAY[$$Core ULTRA 7 255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 16" WUXGA (1920x1200)X360 TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$360° Convertible Hinge: folds flat into tablet mode for note-taking and presentations.$$, $$Bundled Extras: includes LENOVO DIGITAL PEN 2.$$],
  specs = $${"CPU": "Core ULTRA 7 255U", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WUXGA (1920x1200)X360 TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / COSMIC BLUE/LENOVO DIGITAL PEN 2", "Brand": "Lenovo", "Product Type": "2-in-1 Laptop", "Model": "83KS001BUS", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-5-2-in-1-16-83ks001bus';

UPDATE products SET
  description = $$LENOVO YOGA 7 16AHP9 83DM0006US is a 2-in-1 laptop built around a AMD RYZEN 7 8840HS processor and AMD Radeon 780M, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

AMD RYZEN 7 8840HS brings 8 cores and 16 threads, 16MB cache to the table, with a 3.3GHz base clock and speeds up to 5.1GHz — performance mainstream laptop/handheld chip with strong Radeon 780M graphics, popular in gaming handhelds and thin creator laptops.

AMD Radeon 780M (12 compute units, RDNA 3) handles graphics duties on-chip — high-performing integrated GPU for its era — capable of genuine 1080p light gaming, among the fastest integrated graphics before Strix Halo.

Rounding out the package is a 16" WUXGA (1920x1200)X360 TOUCHSCREEN display with touch input — it runs Windows 11, finished in ARCTIC GREY.$$,
  key_features = ARRAY[$$AMD RYZEN 7 8840HS Performance: 8 cores, 16 threads, 16MB cache, boosting up to 5.1GHz.$$, $$AMD Radeon 780M Graphics: High-performing integrated GPU for its era — capable of genuine 1080p light gaming, among the fastest integrated graphics before Strix Halo.$$, $$Display: 16" WUXGA (1920x1200)X360 TOUCHSCREEN.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$360° Convertible Hinge: folds flat into tablet mode for note-taking and presentations.$$],
  specs = $${"CPU": "AMD RYZEN 7 8840HS", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WUXGA (1920x1200)X360 TOUCHSCREEN", "VGA": "AMD RADEON 780M", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ARCTIC GREY", "Brand": "Lenovo", "Product Type": "2-in-1 Laptop", "Model": "83DM0006US", "Processor Cores": "8", "Processor Threads": "16", "Processor Speed": "3.3GHz, up to 5.1GHz", "Processor Cache": "16MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-yoga-7-16ahp9-83dm0006us';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 15IPH11 83UR0042DP is a laptop built around a Core ULTRA 7 355 processor, paired with 16GB DDR5 and a 512GB NVME.

Core ULTRA 7 355 brings 8 cores and 8 threads, 12MB cache to the table, with a 2.3GHz base clock and speeds up to 4.7GHz — balanced mid-tier next-gen AI PC chip aimed at everyday productivity with battery-life headroom.

Rounding out the package is a 15.3" WUXGA (1920x1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core ULTRA 7 355 Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.7GHz.$$, $$Display: 15.3" WUXGA (1920x1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core ULTRA 7 355", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / LUNA GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83UR0042DP", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.3GHz, up to 4.7GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-15iph11-83ur0042dp';

UPDATE products SET
  description = $$LENOVO V14 G5 IRL 83HDA06JUS is a laptop built around a Core 7-240H processor, paired with 16GB DDR5 and a 1TB NVME.

Core 7-240H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.5GHz base clock and speeds up to 5.2GHz — mainstream-performance H-series chip for gaming/creator laptops, Intel's non-'Ultra' Arrow Lake-H rebrand tier.

Rounding out the package is a 14" FHD display — it runs WIN11, finished in BUSINESS BLACK.$$,
  key_features = ARRAY[$$Core 7-240H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 5.2GHz.$$, $$Display: 14" FHD.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core 7-240H", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN11", "Color": "INTEL / BUSINESS BLACK", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83HDA06JUS", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.5GHz, up to 5.2GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v14-g5-irl-83hda06jus';

UPDATE products SET
  description = $$LENOVO V15 G5 IRL 83HFA08GUS is a laptop built around a Core 7-240H processor, paired with 16GB DDR5 and a 1TB NVME.

Core 7-240H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.5GHz base clock and speeds up to 5.2GHz — mainstream-performance H-series chip for gaming/creator laptops, Intel's non-'Ultra' Arrow Lake-H rebrand tier.

Rounding out the package is a 15.6" FHD display — it runs WIN11, finished in BUSINESS BLACK.$$,
  key_features = ARRAY[$$Core 7-240H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 5.2GHz.$$, $$Display: 15.6" FHD.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core 7-240H", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "WIN11", "Color": "INTEL / BUSINESS BLACK", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83HFA08GUS", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.5GHz, up to 5.2GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v15-g5-irl-83hfa08gus';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 15IRH10 83K100E7DP is a laptop built around a Core I7-13620H processor, paired with 16GB DDR5 and a 512GB NVME.

Core I7-13620H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.4GHz base clock and speeds up to 4.9GHz — performance H-series chip for mainstream gaming/creator laptops.

Rounding out the package is a 15.3" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I7-13620H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 4.9GHz.$$, $$Display: 15.3" FHD.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I7-13620H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" FHD", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / LUNA GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83K100E7DP", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.4GHz, up to 4.9GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-15irh10-83k100e7dp';

UPDATE products SET
  description = $$LENOVO V15 G5 IRL 83HF00EMIG is a laptop built around a Core I7-13620H processor, paired with 16GB DDR5 and a 512GB NVME.

Core I7-13620H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.4GHz base clock and speeds up to 4.9GHz — performance H-series chip for mainstream gaming/creator laptops.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I7-13620H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 4.9GHz.$$, $$Display: 15.6" FHD.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I7-13620H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83HF00EMIG", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.4GHz, up to 4.9GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v15-g5-irl-83hf00emig';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 15IPH11 83UR007RDP is a laptop built around a Core ULTRA 5 322 processor, paired with 16GB DDR5 and a 512GB NVME.

Core ULTRA 5 322 brings 6 cores and 6 threads, 12MB cache to the table, with a 2.5GHz base clock and speeds up to 4.4GHz — entry-level next-gen AI PC chip; smallest/cheapest Panther Lake configuration (2 P-cores + 4 Low-Power E-cores, no standard E-cores).

Rounding out the package is a 15.3" WUXGA (1920x1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core ULTRA 5 322 Performance: 6 cores, 6 threads, 12MB cache, boosting up to 4.4GHz.$$, $$Display: 15.3" WUXGA (1920x1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO 16" T210 TOPLOAD.$$],
  specs = $${"CPU": "Core ULTRA 5 322", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / LUNA GREY / LENOVO 16\" T210 TOPLOAD", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83UR007RDP", "Processor Cores": "6", "Processor Threads": "6", "Processor Speed": "2.5GHz, up to 4.4GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-15iph11-83ur007rdp';

UPDATE products SET
  description = $$LENOVO IDEAPAD 5 2 IN 1 14IAL10 14IAL10 83KR0047US is a 2-in-1 laptop built around a Core ULTRA 5 225U processor, paired with 8GB DDR5 ON BOARD and a 512GB NVME.

Core ULTRA 5 225U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 4.5GHz — efficiency-focused ultraportable chip for everyday productivity with modest integrated graphics.

Rounding out the package is a 14" WUXGA (1920x1200)X360 TOUCHSCREEN display with touch input — it runs Windows 11, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core ULTRA 5 225U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 4.5GHz.$$, $$Display: 14" WUXGA (1920x1200)X360 TOUCHSCREEN.$$, $$8GB DDR5 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$360° Convertible Hinge: folds flat into tablet mode for note-taking and presentations.$$],
  specs = $${"CPU": "Core ULTRA 5 225U", "RAM": "8GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "14\" WUXGA (1920x1200)X360 TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / LUNA GREY", "Brand": "Lenovo", "Product Type": "2-in-1 Laptop", "Model": "83KR0047US", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-5-2-in-1-14ial10-14ial10-83kr0047us';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 15ABR8 82XM00LMUS is a laptop built around a AMD Ryzen 7 5825U processor and AMD Radeon Vega 8 (8 compute units, Vega architecture) integrated graphics, paired with 16GB DDR4 ON BOARD and a 512GB NVME.

AMD Ryzen 7 5825U brings 8 cores and 16 threads, 16MB cache to the table, with a 2GHz base clock and speeds up to 4.5GHz — older-generation but still capable 8-core ultraportable chip for everyday productivity.

Graphics are handled by AMD Radeon Vega 8 (8 compute units, Vega architecture) integrated graphics.

Rounding out the package is a 15.6"FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in ARCTIC GREY.$$,
  key_features = ARRAY[$$AMD Ryzen 7 5825U Performance: 8 cores, 16 threads, 16MB cache, boosting up to 4.5GHz.$$, $$Integrated Graphics: AMD Radeon Vega 8 (8 compute units, Vega architecture) integrated graphics.$$, $$Display: 15.6"FHD TOUCHSCREEN.$$, $$16GB DDR4 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 7 5825U", "RAM": "16GB DDR4 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\"FHD TOUCHSCREEN", "VGA": "AMD RADEON", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ARCTIC GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "82XM00LMUS", "Processor Cores": "8", "Processor Threads": "16", "Processor Speed": "2GHz, up to 4.5GHz", "Processor Cache": "16MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-15abr8-82xm00lmus';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 15IRH10 83K100C1DP is a laptop built around a Core I5-13420H processor, paired with 16GB DDR5 and a 512GB NVME.

Core I5-13420H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.1GHz base clock and speeds up to 4.6GHz — mainstream H-series performance-laptop chip.

Rounding out the package is a 15.3" WUXGA (1920x1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I5-13420H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.3" WUXGA (1920x1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I5-13420H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / LUNA GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83K100C1DP", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.1GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-15irh10-83k100c1dp';

UPDATE products SET
  description = $$LENOVO IP1 15IRU7 83B40001US is a laptop built around a Core I5-1334U processor, paired with 16GB DDR4 and a 512GB NVME.

Core I5-1334U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.3GHz base clock and speeds up to 4.6GHz — mainstream thin-and-light productivity chip.

Rounding out the package is a 15.6"FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in ABYSS BLUE.$$,
  key_features = ARRAY[$$Core I5-1334U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.6"FHD TOUCHSCREEN.$$, $$16GB DDR4 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I5-1334U", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\"FHD TOUCHSCREEN", "VGA": "INTEL IRIS XE", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ABYSS BLUE", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83B40001US", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.3GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ip1-15iru7-83b40001us';

UPDATE products SET
  description = $$LENOVO V15 G5 IRL 83GW006AEQ is a laptop built around a Core I5-13420H processor, paired with 8GB DDR5 (2 SLOTS) and a 512GB NVME.

Core I5-13420H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.1GHz base clock and speeds up to 4.6GHz — mainstream H-series performance-laptop chip.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BUSINESS BLACK.$$,
  key_features = ARRAY[$$Core I5-13420H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR5 (2 SLOTS) Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes TOPLOADER, LAN.$$],
  specs = $${"CPU": "Core I5-13420H", "RAM": "8GB DDR5 (2 SLOTS)", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK/TOPLOADER/LAN", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83GW006AEQ", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.1GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v15-g5-irl-83gw006aeq';

UPDATE products SET
  description = $$LENOVO V15 G5 IRL 83HF00E6IG is a laptop built around a Core I5-13420H processor, paired with 8GB DDR5 (2 SLOTS) and a 512GB NVME.

Core I5-13420H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.1GHz base clock and speeds up to 4.6GHz — mainstream H-series performance-laptop chip.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I5-13420H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR5 (2 SLOTS) Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I5-13420H", "RAM": "8GB DDR5 (2 SLOTS)", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83HF00E6IG", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.1GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v15-g5-irl-83hf00e6ig';

UPDATE products SET
  description = $$LENOVO V15 G5 IRL 83GW006XUE is a laptop built around a Core I5-13420H processor, paired with 8GB DDR5 (2 SLOTS) and a 512GB NVME.

Core I5-13420H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.1GHz base clock and speeds up to 4.6GHz — mainstream H-series performance-laptop chip.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BUSINESS BLACK.$$,
  key_features = ARRAY[$$Core I5-13420H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR5 (2 SLOTS) Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LAN.$$],
  specs = $${"CPU": "Core I5-13420H", "RAM": "8GB DDR5 (2 SLOTS)", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK/LAN", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83GW006XUE", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.1GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v15-g5-irl-83gw006xue';

UPDATE products SET
  description = $$LENOVO V15 G5 IRL 83GW006XGP is a laptop built around a Core I5-13420H processor, paired with 8GB DDR5 (2 SLOTS) and a 512GB NVME.

Core I5-13420H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.1GHz base clock and speeds up to 4.6GHz — mainstream H-series performance-laptop chip.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BUSINESS BLACK.$$,
  key_features = ARRAY[$$Core I5-13420H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR5 (2 SLOTS) Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LAN.$$],
  specs = $${"CPU": "Core I5-13420H", "RAM": "8GB DDR5 (2 SLOTS)", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK/LAN", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83GW006XGP", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.1GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v15-g5-irl-83gw006xgp';

UPDATE products SET
  description = $$LENOVO IP1 15IRU7 83B40008US is a laptop built around a Core I5-1335U processor, paired with 16GB DDR4 and a 256GB NVME.

Core I5-1335U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.3GHz base clock and speeds up to 4.6GHz — mainstream thin-and-light productivity chip, near-identical to the 1334U with a slightly different vPro/graphics config.

Rounding out the package is a 15.6"FHD display — it runs Windows 11, finished in CLOUD GREY.$$,
  key_features = ARRAY[$$Core I5-1335U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.6"FHD.$$, $$16GB DDR4 Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I5-1335U", "RAM": "16GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\"FHD", "VGA": "INTEL IRIS XE", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "CLOUD GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83B40008US", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.3GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ip1-15iru7-83b40008us';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 15IRH10 83K100E9AX is a laptop built around a Core I5-13420H processor, paired with 8GB DDR5 and a 512GB NVME.

Core I5-13420H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.1GHz base clock and speeds up to 4.6GHz — mainstream H-series performance-laptop chip.

Rounding out the package is a 15.3" WUXGA (1920x1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in LUNA GREY.$$,
  key_features = ARRAY[$$Core I5-13420H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.3" WUXGA (1920x1200).$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I5-13420H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200)", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83K100E9AX", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.1GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-15irh10-83k100e9ax';

UPDATE products SET
  description = $$LENOVO IP1 15AMN7 82VG00WXUS is a laptop built around a AMD Ryzen 5 7520U processor and AMD Radeon 610M, paired with 8GB DDR5 ON BOARD and a 256GB NVME.

AMD Ryzen 5 7520U brings 4 cores and 8 threads, 4MB cache to the table, with a 2.8GHz base clock and speeds up to 4.3GHz — entry-level ultrabook/Chromebook-class chip for basic browsing and office work.

AMD Radeon 610M (2 compute units, RDNA 2) handles graphics duties on-chip — basic/entry-level integrated graphics for everyday productivity, not intended for gaming.

Rounding out the package is a 15.6"FHD display — it runs Windows 11, finished in ABYSS BLUE.$$,
  key_features = ARRAY[$$AMD Ryzen 5 7520U Performance: 4 cores, 8 threads, 4MB cache, boosting up to 4.3GHz.$$, $$AMD Radeon 610M Graphics: Basic/entry-level integrated graphics for everyday productivity, not intended for gaming.$$, $$Display: 15.6"FHD.$$, $$8GB DDR5 ON BOARD Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 5 7520U", "RAM": "8GB DDR5 ON BOARD", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\"FHD", "VGA": "AMD Radeon 610M", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ABYSS BLUE", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "82VG00WXUS", "Processor Cores": "4", "Processor Threads": "8", "Processor Speed": "2.8GHz, up to 4.3GHz", "Processor Cache": "4MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ip1-15amn7-82vg00wxus';

UPDATE products SET
  description = $$LENOVO V15 G5 IRL 83GW0076UE is a laptop built around a Core I3-1315U processor, paired with 8GB DDR5 and a 256GB NVME.

Core I3-1315U brings 6 cores (2 performance + 4 efficiency) and 8 threads, 10MB cache to the table, with a 1.2GHz base clock and speeds up to 4.5GHz — entry-level ultrabook chip for everyday productivity and browsing.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BUSINESS BLACK.$$,
  key_features = ARRAY[$$Core I3-1315U Performance: 6 cores, 8 threads, 10MB cache, boosting up to 4.5GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR5 Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LAN.$$],
  specs = $${"CPU": "Core I3-1315U", "RAM": "8GB DDR5", "Storage": "256GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK / LAN", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83GW0076UE", "Processor Cores": "6 (2P+4E)", "Processor Threads": "8", "Processor Speed": "1.2GHz, up to 4.5GHz", "Processor Cache": "10MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v15-g5-irl-83gw0076ue';

UPDATE products SET
  description = $$LENOVO V15 G5 IRL 83GW0076GP is a laptop built around a Core I3-1315U processor, paired with 8GB DDR5 and a 256GB NVME.

Core I3-1315U brings 6 cores (2 performance + 4 efficiency) and 8 threads, 10MB cache to the table, with a 1.2GHz base clock and speeds up to 4.5GHz — entry-level ultrabook chip for everyday productivity and browsing.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BUSINESS BLACK.$$,
  key_features = ARRAY[$$Core I3-1315U Performance: 6 cores, 8 threads, 10MB cache, boosting up to 4.5GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR5 Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LAN.$$],
  specs = $${"CPU": "Core I3-1315U", "RAM": "8GB DDR5", "Storage": "256GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK / LAN", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "83GW0076GP", "Processor Cores": "6 (2P+4E)", "Processor Threads": "8", "Processor Speed": "1.2GHz, up to 4.5GHz", "Processor Cache": "10MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-v15-g5-irl-83gw0076gp';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 14IRU8 82X60062IN is a laptop built around a Core I3-1315U processor, paired with 8GB DDR5 ON BOARD and a 512GB NVME.

Core I3-1315U brings 6 cores (2 performance + 4 efficiency) and 8 threads, 10MB cache to the table, with a 1.2GHz base clock and speeds up to 4.5GHz — entry-level ultrabook chip for everyday productivity and browsing.

Rounding out the package is a 14" FHD display — it runs Windows 11, finished in ARCTIC GREY.$$,
  key_features = ARRAY[$$Core I3-1315U Performance: 6 cores, 8 threads, 10MB cache, boosting up to 4.5GHz.$$, $$Display: 14" FHD.$$, $$8GB DDR5 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core I3-1315U", "RAM": "8GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11 + OFFICE 2024", "Color": "INTEL / ARCTIC GREY", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "82X60062IN", "Processor Cores": "6 (2P+4E)", "Processor Threads": "8", "Processor Speed": "1.2GHz, up to 4.5GHz", "Processor Cache": "10MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-14iru8-82x60062in';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 15IRU8 82X700DFDP is a laptop built around a Core I3-1315U processor, paired with 8GB DDR5 ON BOARD and a 512GB NVME.

Core I3-1315U brings 6 cores (2 performance + 4 efficiency) and 8 threads, 10MB cache to the table, with a 1.2GHz base clock and speeds up to 4.5GHz — entry-level ultrabook chip for everyday productivity and browsing.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ARCTIC GREY.$$,
  key_features = ARRAY[$$Core I3-1315U Performance: 6 cores, 8 threads, 10MB cache, boosting up to 4.5GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR5 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASUAL 15.6" TOPLOADER.$$],
  specs = $${"CPU": "Core I3-1315U", "RAM": "8GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / ARCTIC GREY/ LENOVO CASUAL 15.6\" TOPLOADER", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "82X700DFDP", "Processor Cores": "6 (2P+4E)", "Processor Threads": "8", "Processor Speed": "1.2GHz, up to 4.5GHz", "Processor Cache": "10MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-15iru8-82x700dfdp';

UPDATE products SET
  description = $$LENOVO IDEAPAD SLIM 3 15IAN8 82XB00G3DP is a laptop built around a INTEL N100 4 CORES processor, paired with 8GB DDR5 ON BOARD and a 256GB NVME.

INTEL N100 4 CORES brings 4 cores and 4 threads, 6MB cache to the table, with a 0.8GHz base clock and speeds up to 3.4GHz — ultra-budget fanless laptop/mini-PC chip for the lightest browsing/office workloads.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ABYSS BLUE.$$,
  key_features = ARRAY[$$INTEL N100 4 CORES Performance: 4 cores, 4 threads, 6MB cache, boosting up to 3.4GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR5 ON BOARD Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASUAL 15.6" TOPLOADER.$$],
  specs = $${"CPU": "INTEL N100 4 CORES", "RAM": "8GB DDR5 ON BOARD", "Storage": "256GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / ABYSS BLUE / LENOVO CASUAL 15.6\" TOPLOADER", "Brand": "Lenovo", "Product Type": "Laptop", "Model": "82XB00G3DP", "Processor Cores": "4", "Processor Threads": "4", "Processor Speed": "0.8GHz, up to 3.4GHz", "Processor Cache": "6MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-ideapad-slim-3-15ian8-82xb00g3dp';

UPDATE products SET
  description = $$DELL LDB04250-7137BLU- PUS is a 2-in-1 laptop built around a CORE ULTRA 7 256V processor and Intel Arc 140V, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 7 256V brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — premium efficiency-first ultraportable chip with on-package LPDDR5X memory and class-leading battery life; 16GB memory variant.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 14"FHD+ TOUCHSCREEN X360 display with touch input — it runs Windows 11, finished in ICE BLUE.$$,
  key_features = ARRAY[$$CORE ULTRA 7 256V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 14"FHD+ TOUCHSCREEN X360.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$360° Convertible Hinge: folds flat into tablet mode for note-taking and presentations.$$, $$Bundled Extras: includes USB HUB.$$],
  specs = $${"CPU": "CORE ULTRA 7 256V", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\"FHD+ TOUCHSCREEN X360", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ICE BLUE / USB HUB", "Brand": "Dell", "Product Type": "2-in-1 Laptop", "Model": "LDB04250-7137BLU", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'dell-ldb04250-7137blu-pus';

UPDATE products SET
  description = $$DELL INSPIRON I5640-7609BLU-PUS is a laptop built around a INTEL CORE 7 SERIES 1 150U processor, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

INTEL CORE 7 SERIES 1 150U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.8GHz base clock and speeds up to 5.4GHz — upper-mid ultraportable chip for productivity laptops.

Rounding out the package is a 16"FHD+ TOUCHSCREEN display with touch input — it runs Windows 11, finished in ICE BLUE.$$,
  key_features = ARRAY[$$INTEL CORE 7 SERIES 1 150U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5.4GHz.$$, $$Display: 16"FHD+ TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "INTEL CORE 7 SERIES 1 150U", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\"FHD+ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / ICE BLUE", "Brand": "Dell", "Product Type": "Laptop", "Model": "I5640-7609BLU-PUS", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.8GHz, up to 5.4GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'dell-inspiron-i5640-7609blu-pus';

UPDATE products SET
  description = $$DELL PLUS LD15260-7140BLK-PUS is a laptop built around a CORE ULTRA 7 255U processor, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 7 255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 15.6"FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 15.6"FHD TOUCHSCREEN.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 255U", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "15.6\"FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / BLACK", "Brand": "Dell", "Product Type": "Laptop", "Model": "LD15260-7140BLK-PUS", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'dell-plus-ld15260-7140blk-pus';

UPDATE products SET
  description = $$DELL INSPIRON I7440-5647BLU-PUS is a 2-in-1 laptop built around a CORE 5 120U processor, paired with 16GB DDR5 ON BOARD and a 512GB NVME.

CORE 5 120U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.4GHz base clock and speeds up to 5GHz — mainstream thin-and-light ultrabook chip, essentially a renamed Core i5-1340U-class part without 'Ultra' branding.

Rounding out the package is a 14" 2K X360 TOUCHSCREEN display with touch input — it runs Windows 11, finished in ICE BLUE.$$,
  key_features = ARRAY[$$CORE 5 120U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5GHz.$$, $$Display: 14" 2K X360 TOUCHSCREEN.$$, $$16GB DDR5 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$360° Convertible Hinge: folds flat into tablet mode for note-taking and presentations.$$],
  specs = $${"CPU": "CORE 5 120U", "RAM": "16GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "14\" 2K X360 TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / ICE BLUE", "Brand": "Dell", "Product Type": "2-in-1 Laptop", "Model": "I7440-5647BLU-PUS", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.4GHz, up to 5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'dell-inspiron-i7440-5647blu-pus';

UPDATE products SET
  description = $$ASUS VIVOBOOK S16 S5606CA-SB92 is a laptop built around a CORE ULTRA 9 285H processor, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 9 285H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.4GHz — flagship Core Ultra H-series chip for high-performance thin gaming/creator laptops.

Rounding out the package is a 16" WQXGA+ 3K (2880 x 1800) OLED 120HZ display — it runs Windows 11, finished in MIST BLUE.$$,
  key_features = ARRAY[$$CORE ULTRA 9 285H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.4GHz.$$, $$Display: 16" WQXGA+ 3K (2880 x 1800) OLED 120HZ.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 9 285H", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WQXGA+ 3K (2880 x 1800) OLED 120HZ", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL ARC / MIST BLUE", "Brand": "Asus", "Product Type": "Laptop", "Model": "S5606CA-SB92", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.4GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-vivobook-s16-s5606ca-sb92';

UPDATE products SET
  description = $$ASUS VIVOBOOK FLIP 14 TP3407SA-DS74T is a 2-in-1 laptop built around a CORE ULTRA 7 256V processor, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 7 256V brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — premium efficiency-first ultraportable chip with on-package LPDDR5X memory and class-leading battery life; 16GB memory variant.

Rounding out the package is a 14" WUXGA OLED X360 TOUCHSCREEN display with touch input — it runs Windows 11, finished in GRAY.$$,
  key_features = ARRAY[$$CORE ULTRA 7 256V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Display: 14" WUXGA OLED X360 TOUCHSCREEN.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$360° Convertible Hinge: folds flat into tablet mode for note-taking and presentations.$$],
  specs = $${"CPU": "CORE ULTRA 7 256V", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\" WUXGA OLED X360 TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL ARC / GRAY", "Brand": "Asus", "Product Type": "2-in-1 Laptop", "Model": "TP3407SA-DS74T", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-vivobook-flip-14-tp3407sa-ds74t';

UPDATE products SET
  description = $$ASUS VIVOBOOK F1605VA-BS74 is a laptop built around a CORE I7-13620H processor, paired with 16GB DDR4 ON BOARD and a 512GB NVME.

CORE I7-13620H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.4GHz base clock and speeds up to 4.9GHz — performance H-series chip for mainstream gaming/creator laptops.

Rounding out the package is a 16" FHD display — it runs Windows 11, finished in COOL SILVER.$$,
  key_features = ARRAY[$$CORE I7-13620H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 4.9GHz.$$, $$Display: 16" FHD.$$, $$16GB DDR4 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE I7-13620H", "RAM": "16GB DDR4 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "16\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / COOL SILVER", "Brand": "Asus", "Product Type": "Laptop", "Model": "F1605VA-BS74", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.4GHz, up to 4.9GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-vivobook-f1605va-bs74';

UPDATE products SET
  description = $$ASUS VIVOBOOK X1404VA-I712512 is a laptop built around a CORE I7-1355U processor, paired with 12GB DDR4 and a 512GB NVME.

CORE I7-1355U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.7GHz base clock and speeds up to 5GHz — upper-tier ultraportable productivity chip with the fastest single-core boost in the U-series stack.

Rounding out the package is a 14" FHD display — it runs Windows 11, finished in QUIET BLUE.$$,
  key_features = ARRAY[$$CORE I7-1355U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5GHz.$$, $$Display: 14" FHD.$$, $$12GB DDR4 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE I7-1355U", "RAM": "12GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / QUIET BLUE", "Brand": "Asus", "Product Type": "Laptop", "Model": "X1404VA-I712512", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.7GHz, up to 5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-vivobook-x1404va-i712512';

UPDATE products SET
  description = $$ASUS VIVOBOOK 14 X1404VAP-V14.C58256 is a laptop built around a CORE 5 120U processor, paired with 8GB DDR4 and a 256GB NVME.

CORE 5 120U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.4GHz base clock and speeds up to 5GHz — mainstream thin-and-light ultrabook chip, essentially a renamed Core i5-1340U-class part without 'Ultra' branding.

Rounding out the package is a 14" FHD display — it runs Windows 11, finished in QUIET BLUE.$$,
  key_features = ARRAY[$$CORE 5 120U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5GHz.$$, $$Display: 14" FHD.$$, $$8GB DDR4 Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE 5 120U", "RAM": "8GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / QUIET BLUE", "Brand": "Asus", "Product Type": "Laptop", "Model": "C58256", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.4GHz, up to 5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-vivobook-14-x1404vap-v14-c58256';

UPDATE products SET
  description = $$HP OMNIBOOK 7 FLIP 16-AU0773CL is a 2-in-1 laptop built around a Core Ultra 7 258V processor and Intel Arc 140V, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

Core Ultra 7 258V brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — premium efficiency-first ultraportable chip, identical CPU config to 256V but paired with 32GB on-package memory.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 16" FHD TOUCHSCREEN X360 display with touch input — it runs Windows 11, finished in GLACIER SILVER.$$,
  key_features = ARRAY[$$Core Ultra 7 258V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 16" FHD TOUCHSCREEN X360.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$360° Convertible Hinge: folds flat into tablet mode for note-taking and presentations.$$],
  specs = $${"CPU": "Core Ultra 7 258V", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" FHD TOUCHSCREEN X360", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "GLACIER SILVER", "Brand": "HP", "Product Type": "2-in-1 Laptop", "Model": "AU0773CL", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-omnibook-7-flip-16-au0773cl';

UPDATE products SET
  description = $$HP OMNIBOOK 7 16-AZ0595CL is a laptop built around a Core 9 270H processor, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

Core 9 270H brings 14 cores (6 performance + 8 efficiency) and 20 threads, 24MB cache to the table, with a 2.7GHz base clock and speeds up to 5.8GHz — highest-tier non-'Ultra' H-series chip, near-flagship gaming/creator performance without the Ultra branding/NPU emphasis.

Rounding out the package is a 16" 2K OLED 120HZ TOUCHSCREEN display with touch input — it runs Windows 11, finished in GLACIER SILVER.$$,
  key_features = ARRAY[$$Core 9 270H Performance: 14 cores, 20 threads, 24MB cache, boosting up to 5.8GHz.$$, $$Display: 16" 2K OLED 120HZ TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core 9 270H", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K OLED 120HZ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / GLACIER SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "AZ0595CL", "Processor Cores": "14 (6P+8E)", "Processor Threads": "20", "Processor Speed": "2.7GHz, up to 5.8GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-omnibook-7-16-az0595cl';

UPDATE products SET
  description = $$HP OMNIBOOK X NGAI 17-DD0047NR is a laptop built around a Core Ultra 7 256V processor and Intel Arc 140V, paired with 16GB DDR5 ON BOARD and a 512GB NVME.

Core Ultra 7 256V brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — premium efficiency-first ultraportable chip with on-package LPDDR5X memory and class-leading battery life; 16GB memory variant.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 17" FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in GLACIER SILVER.$$,
  key_features = ARRAY[$$Core Ultra 7 256V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 17" FHD TOUCHSCREEN.$$, $$16GB DDR5 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core Ultra 7 256V", "RAM": "16GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "17\" FHD TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "GLACIER SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "DD0047NR", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-omnibook-x-ngai-17-dd0047nr';

UPDATE products SET
  description = $$HP OMNIBOOK 5 16-AG1075CL is a laptop built around a AMD RYZEN AI 7 350 processor and AMD Radeon 860M, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

AMD RYZEN AI 7 350 brings 8 cores (4 performance + 4 efficiency) and 16 threads, 16MB cache to the table, with a 2GHz base clock and speeds up to 5GHz — mainstream AI PC laptop chip (Copilot+ eligible) balancing efficiency and performance with a capable NPU.

AMD Radeon 860M (8 compute units, RDNA 3.5) handles graphics duties on-chip — mainstream integrated GPU for Ryzen AI 300-series thin-and-lights — efficient, good for everyday use and light gaming, though with fewer compute units than the older 780M it leans on RDNA 3.5 efficiency gains rather than raw core count.

Rounding out the package is a 16" 2K TOUCHSCREEN display with touch input — it runs Windows 11, finished in GLACIER SILVER.$$,
  key_features = ARRAY[$$AMD RYZEN AI 7 350 Performance: 8 cores, 16 threads, 16MB cache, boosting up to 5GHz.$$, $$AMD Radeon 860M Graphics: Mainstream integrated GPU for Ryzen AI 300-series thin-and-lights — efficient, good for everyday use and light gaming, though with fewer compute units than the older 780M it leans on RDNA 3.5 efficiency gains rather than raw core count.$$, $$Display: 16" 2K TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD RYZEN AI 7 350", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K TOUCHSCREEN", "VGA": "AMD RADEON 860M", "OS": "WIN 11", "Color": "INTEL / GLACIER SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "AG1075CL", "Processor Cores": "8 (4P+4E)", "Processor Threads": "16", "Processor Speed": "2GHz, up to 5GHz", "Processor Cache": "16MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-omnibook-5-16-ag1075cl';

UPDATE products SET
  description = $$HP OMNIBOOK 5 16-AF1017WM is a laptop built around a CORE ULTRA 7 255U processor, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 7 255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 16"FHD+ TOUCHSCREEN display with touch input — it runs Windows 11, finished in GLACIER SILVER.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 16"FHD+ TOUCHSCREEN.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 255U", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\"FHD+ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / GLACIER SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "AF1017WM", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-omnibook-5-16-af1017wm';

UPDATE products SET
  description = $$HP OMNIBOOK 5 16-AG1175CL is a laptop built around a AMD RYZEN AI 7 350 processor and AMD Radeon 860M, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

AMD RYZEN AI 7 350 brings 8 cores (4 performance + 4 efficiency) and 16 threads, 16MB cache to the table, with a 2GHz base clock and speeds up to 5GHz — mainstream AI PC laptop chip (Copilot+ eligible) balancing efficiency and performance with a capable NPU.

AMD Radeon 860M (8 compute units, RDNA 3.5) handles graphics duties on-chip — mainstream integrated GPU for Ryzen AI 300-series thin-and-lights — efficient, good for everyday use and light gaming, though with fewer compute units than the older 780M it leans on RDNA 3.5 efficiency gains rather than raw core count.

Rounding out the package is a 16" 2K TOUCHSCREEN display with touch input — it runs Windows 11, finished in GLACIER SILVER.$$,
  key_features = ARRAY[$$AMD RYZEN AI 7 350 Performance: 8 cores, 16 threads, 16MB cache, boosting up to 5GHz.$$, $$AMD Radeon 860M Graphics: Mainstream integrated GPU for Ryzen AI 300-series thin-and-lights — efficient, good for everyday use and light gaming, though with fewer compute units than the older 780M it leans on RDNA 3.5 efficiency gains rather than raw core count.$$, $$Display: 16" 2K TOUCHSCREEN.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD RYZEN AI 7 350", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K TOUCHSCREEN", "VGA": "AMD RADEON 860M", "OS": "WIN 11", "Color": "INTEL / GLACIER SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "AG1175CL", "Processor Cores": "8 (4P+4E)", "Processor Threads": "16", "Processor Speed": "2GHz, up to 5GHz", "Processor Cache": "16MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-omnibook-5-16-ag1175cl';

UPDATE products SET
  description = $$HP OMNIBOOK 5 16-AF1055CL is a laptop built around a CORE ULTRA 5 225U processor, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 5 225U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 4.5GHz — efficiency-focused ultraportable chip for everyday productivity with modest integrated graphics.

Rounding out the package is a 16" 2K TOUCHSCREEN display with touch input — it runs Windows 11, finished in INTEL.$$,
  key_features = ARRAY[$$CORE ULTRA 5 225U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 4.5GHz.$$, $$Display: 16" 2K TOUCHSCREEN.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes GLACIER SILVER.$$],
  specs = $${"CPU": "CORE ULTRA 5 225U", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K TOUCHSCREEN", "OS": "WIN 11", "Color": "INTEL / INTEL / GLACIER SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "AF1055CL", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-omnibook-5-16-af1055cl';

UPDATE products SET
  description = $$HP PROBOOK 4 G1I 16 AT7K5AV is a business laptop built around a Core Ultra 7-255U processor, paired with 16GB DDR5 and a 512GB NVME.

Core Ultra 7-255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 16" WUXGA display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in PIKE SILVER.$$,
  key_features = ARRAY[$$Core Ultra 7-255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 16" WUXGA.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core Ultra 7-255U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "16\" WUXGA", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / PIKE SILVER", "Brand": "HP", "Product Type": "Business Laptop", "Model": "AT7K5AV", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-probook-4-g1i-16-at7k5av';

UPDATE products SET
  description = $$HP 17-CN5085CL is a laptop built around a Core Ultra 7-255U processor, paired with 16GB DDR5 and a 1TB NVME.

Core Ultra 7-255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 17.3" HD+ TOUCHSCREEN display with touch input — it runs Windows 11, finished in BLUR.$$,
  key_features = ARRAY[$$Core Ultra 7-255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 17.3" HD+ TOUCHSCREEN.$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core Ultra 7-255U", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "17.3\" HD+ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / BLUR", "Brand": "HP", "Product Type": "Laptop", "Model": "CN5085CL", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-17-cn5085cl';

UPDATE products SET
  description = $$HP 15-FD0127DX is a laptop built around a CORE I7-1355U processor, paired with 16GB DDR4 and a 512GB NVME.

CORE I7-1355U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.7GHz base clock and speeds up to 5GHz — upper-tier ultraportable productivity chip with the fastest single-core boost in the U-series stack.

Rounding out the package is a 15.6" FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in NATURAL SILVER.$$,
  key_features = ARRAY[$$CORE I7-1355U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5GHz.$$, $$Display: 15.6" FHD TOUCHSCREEN.$$, $$16GB DDR4 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE I7-1355U", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD TOUCHSCREEN", "VGA": "INTEL IRIS XE", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "NATURAL SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "FD0127DX", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.7GHz, up to 5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-15-fd0127dx';

UPDATE products SET
  description = $$HP 15-FD1899NR is a laptop built around a Core 7-150U processor, paired with 16GB DDR4 and a 512GB NVME.

Core 7-150U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.8GHz base clock and speeds up to 5.4GHz — upper-mid ultraportable chip for productivity laptops, sits just below the Core Ultra 7 155U in Intel's parallel non-AI lineup.

Rounding out the package is a 15.6" FHD display — it runs Windows 11, finished in SILVER.$$,
  key_features = ARRAY[$$Core 7-150U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5.4GHz.$$, $$Display: 15.6" FHD.$$, $$16GB DDR4 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Core 7-150U", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "FD1899NR", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.8GHz, up to 5.4GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-15-fd1899nr';

UPDATE products SET
  description = $$HP 15-FD0215DX is a laptop built around a CORE I5-1334U processor, paired with 16GB DDR4 and a 512GB NVME.

CORE I5-1334U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.3GHz base clock and speeds up to 4.6GHz — mainstream thin-and-light productivity chip.

Rounding out the package is a 15.6" FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in NATURAL SILVER.$$,
  key_features = ARRAY[$$CORE I5-1334U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 4.6GHz.$$, $$Display: 15.6" FHD TOUCHSCREEN.$$, $$16GB DDR4 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE I5-1334U", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / NATURAL SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "FD0215DX", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.3GHz, up to 4.6GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-15-fd0215dx';

UPDATE products SET
  description = $$HP 17-CP2025DX is a laptop built around a AMD RYZEN 5 7520U processor and AMD Radeon 610M, paired with 8GB DDR5 ON BOARD and a 512GB NVME.

AMD RYZEN 5 7520U brings 4 cores and 8 threads, 4MB cache to the table, with a 2.8GHz base clock and speeds up to 4.3GHz — entry-level ultrabook/Chromebook-class chip for basic browsing and office work.

AMD Radeon 610M (2 compute units, RDNA 2) handles graphics duties on-chip — basic/entry-level integrated graphics for everyday productivity, not intended for gaming.

Rounding out the package is a 17.3" FHD display — it runs Windows 11, finished in NATURAL SILVER.$$,
  key_features = ARRAY[$$AMD RYZEN 5 7520U Performance: 4 cores, 8 threads, 4MB cache, boosting up to 4.3GHz.$$, $$AMD Radeon 610M Graphics: Basic/entry-level integrated graphics for everyday productivity, not intended for gaming.$$, $$Display: 17.3" FHD.$$, $$8GB DDR5 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD RYZEN 5 7520U", "RAM": "8GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "17.3\" FHD", "VGA": "AMD RADEON", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "NATURAL SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "CP2025DX", "Processor Cores": "4", "Processor Threads": "8", "Processor Speed": "2.8GHz, up to 4.3GHz", "Processor Cache": "4MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-17-cp2025dx';

UPDATE products SET
  description = $$HP 250R G9 B39ZCAT is a laptop built around a Core 5 120U processor, paired with 8GB DDR4 and a 512GB NVME.

Core 5 120U brings 10 cores (2 performance + 8 efficiency) and 12 threads, 12MB cache to the table, with a 1.4GHz base clock and speeds up to 5GHz — mainstream thin-and-light ultrabook chip, essentially a renamed Core i5-1340U-class part without 'Ultra' branding.

Rounding out the package is a 15.6" FHD display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in Dark ash silver.$$,
  key_features = ARRAY[$$Core 5 120U Performance: 10 cores, 12 threads, 12MB cache, boosting up to 5GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR4 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LAN.$$],
  specs = $${"CPU": "Core 5 120U", "RAM": "8GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / Dark ash silver / LAN", "Brand": "HP", "Product Type": "Laptop", "Model": "B39ZCAT", "Processor Cores": "10 (2P+8E)", "Processor Threads": "12", "Processor Speed": "1.4GHz, up to 5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-250r-g9-b39zcat';

UPDATE products SET
  description = $$HP 14-EP2035CL is a laptop built around a CORE 3-N355 processor, paired with 16GB DDR4 and a 512GB NVME.

CORE 3-N355 brings 8 cores and 8 threads, 6MB cache to the table, with a 1.2GHz base clock and speeds up to 3.9GHz — entry-level fanless/low-cost laptop and Chromebook chip for light browsing and office tasks.

Rounding out the package is a 14" FHD display — it runs Windows 11, finished in NATURAL SILVER.$$,
  key_features = ARRAY[$$CORE 3-N355 Performance: 8 cores, 8 threads, 6MB cache, boosting up to 3.9GHz.$$, $$Display: 14" FHD.$$, $$16GB DDR4 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE 3-N355", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / NATURAL SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "EP2035CL", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "1.2GHz, up to 3.9GHz", "Processor Cache": "6MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-14-ep2035cl';

UPDATE products SET
  description = $$HP 15-FD0130WM is a laptop built around a CORE I3-N305 processor, paired with 8GB DDR4 and a 256GB NVME.

CORE I3-N305 brings 8 cores and 8 threads, 6MB cache to the table, with a 1.8GHz base clock and speeds up to 3.8GHz — low-cost fanless/entry laptop and Chromebook chip, predecessor to the Core 3-N355.

Rounding out the package is a 15.6" FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in MOONLIGHT BLUE.$$,
  key_features = ARRAY[$$CORE I3-N305 Performance: 8 cores, 8 threads, 6MB cache, boosting up to 3.8GHz.$$, $$Display: 15.6" FHD TOUCHSCREEN.$$, $$8GB DDR4 Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE I3-N305", "RAM": "8GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / MOONLIGHT BLUE", "Brand": "HP", "Product Type": "Laptop", "Model": "FD0130WM", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "1.8GHz, up to 3.8GHz", "Processor Cache": "6MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-15-fd0130wm';

UPDATE products SET
  description = $$HP 15-FD0153DX is a laptop built around a CORE I3-1315U processor, paired with 8GB DDR4 and a 256GB NVME.

CORE I3-1315U brings 6 cores (2 performance + 4 efficiency) and 8 threads, 10MB cache to the table, with a 1.2GHz base clock and speeds up to 4.5GHz — entry-level ultrabook chip for everyday productivity and browsing.

Rounding out the package is a 15.6" (1366 x 768) TOUCHSCREEN display with touch input — it runs Windows 11, finished in NATURAL SILVER.$$,
  key_features = ARRAY[$$CORE I3-1315U Performance: 6 cores, 8 threads, 10MB cache, boosting up to 4.5GHz.$$, $$Display: 15.6" (1366 x 768) TOUCHSCREEN.$$, $$8GB DDR4 Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE I3-1315U", "RAM": "8GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\" (1366 x 768) TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / NATURAL SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "FD0153DX", "Processor Cores": "6 (2P+4E)", "Processor Threads": "8", "Processor Speed": "1.2GHz, up to 4.5GHz", "Processor Cache": "10MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-15-fd0153dx';

UPDATE products SET
  description = $$HP 15-FD0133WM is a laptop built around a CORE I3-N305 processor, paired with 8GB DDR4 and a 256GB NVME.

CORE I3-N305 brings 8 cores and 8 threads, 6MB cache to the table, with a 1.8GHz base clock and speeds up to 3.8GHz — low-cost fanless/entry laptop and Chromebook chip, predecessor to the Core 3-N355.

Rounding out the package is a 15.6" FHD display — it runs Windows 11, finished in NATURAL SILVER.$$,
  key_features = ARRAY[$$CORE I3-N305 Performance: 8 cores, 8 threads, 6MB cache, boosting up to 3.8GHz.$$, $$Display: 15.6" FHD.$$, $$8GB DDR4 Memory + 256GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE I3-N305", "RAM": "8GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / NATURAL SILVER", "Brand": "HP", "Product Type": "Laptop", "Model": "FD0133WM", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "1.8GHz, up to 3.8GHz", "Processor Cache": "6MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-15-fd0133wm';

UPDATE products SET
  description = $$ACER ASPIRE 14 AI A14-52MT-94H5 is a laptop built around a CORE ULTRA 9 288V processor and Intel Arc 140V, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 9 288V brings 8 cores and 8 threads, 12MB cache to the table, with speeds up to 5.1GHz — flagship ultraportable/efficiency chip, fastest of the Lunar Lake V-series with 32GB on-package memory.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 14" FHD TOUCHSCREEN display with touch input — it runs Windows 11, finished in IRON.$$,
  key_features = ARRAY[$$CORE ULTRA 9 288V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 5.1GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 14" FHD TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 9 288V", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\" FHD TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "IRON", "Brand": "Acer", "Product Type": "Laptop", "Model": "52MT-94H5", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "up to 5.1GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'acer-aspire-14-ai-a14-52mt-94h5';

UPDATE products SET
  description = $$ACER ASPIRE 14 AI A14-52M-72FH is a laptop built around a CORE ULTRA 7 256V processor and Intel Arc 140V, paired with 16GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 7 256V brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — premium efficiency-first ultraportable chip with on-package LPDDR5X memory and class-leading battery life; 16GB memory variant.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 14" FHD display — it runs Windows 11, finished in IRON.$$,
  key_features = ARRAY[$$CORE ULTRA 7 256V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 14" FHD.$$, $$16GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 256V", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\" FHD", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "IRON", "Brand": "Acer", "Product Type": "Laptop", "Model": "72FH", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'acer-aspire-14-ai-a14-52m-72fh';

UPDATE products SET
  description = $$MICROSOFT SURFACE LAPTOP ZHI-00001 is a laptop built around a Snapdragon X Elite X1E-80-100 12-core processor, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

Snapdragon X Elite X1E-80-100 12-core brings 12 cores and 12 threads, 42MB cache to the table, with a 3.4GHz base clock and speeds up to 4GHz — flagship Windows-on-Arm chip for premium Copilot+ laptops, competing with Apple M-series and top x86 ultraportables on efficiency and NPU performance.

Rounding out the package is a 15" PIXELSENSE (2496 x 1664) TOUCHSCREEN 120HZ display with touch input — it runs Windows 11 Home, finished in BLACK.$$,
  key_features = ARRAY[$$Snapdragon X Elite X1E-80-100 12-core Performance: 12 cores, 12 threads, 42MB cache, boosting up to 4GHz.$$, $$Display: 15" PIXELSENSE (2496 x 1664) TOUCHSCREEN 120HZ.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "Snapdragon X Elite ; X1E-80-100 12-core", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "15\" PIXELSENSE (2496 x 1664) TOUCHSCREEN 120HZ", "Warranty": "1 YEAR", "OS": "WIN 11 HOME", "Color": "SNAPDRAGON QUALCOM ADRENO / BLACK", "Brand": "Microsoft", "Product Type": "Laptop", "Model": "00001", "Processor Cores": "12", "Processor Threads": "12", "Processor Speed": "3.4GHz, up to 4GHz", "Processor Cache": "42MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'microsoft-surface-laptop-zhi-00001';

UPDATE products SET
  description = $$THINKPAD X1 GEN 10 AURA EDITION 2 IN 1 is a business laptop built around a CORE ULTRA 7 255U processor, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 7 255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 14" WUXGA (1920 x 1200) TOUCHSCREEN X360 display with touch input — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in GRAY.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 14" WUXGA (1920 x 1200) TOUCHSCREEN X360.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$360° Convertible Hinge: folds flat into tablet mode for note-taking and presentations.$$, $$Bundled Extras: includes LENOVO YOGA PEN.$$],
  specs = $${"CPU": "CORE ULTRA 7 255U", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200) TOUCHSCREEN X360", "Warranty": "3 YEARS", "OS": "DOS", "Color": "INTEL / GRAY/LENOVO YOGA PEN", "Brand": "Lenovo", "Product Type": "2-in-1 Business Laptop", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-x1-gen-10-aura-edition-2-in-1';

UPDATE products SET
  description = $$THINKPAD X9-15 GEN 1 AURA EDITION 21Q6006RUS is a business laptop built around a CORE ULTRA 7 258V processor and Intel Arc 140V, paired with 32GB DDR5 ON BOARD and a 512GB NVME.

CORE ULTRA 7 258V brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — premium efficiency-first ultraportable chip, identical CPU config to 256V but paired with 32GB on-package memory.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 15.3" 2.8K (2880x1800) OLED TOUCHSCREEN display with touch input — it runs Windows 11 Pro, finished in GREY.$$,
  key_features = ARRAY[$$CORE ULTRA 7 258V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 15.3" 2.8K (2880x1800) OLED TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 258V", "RAM": "32GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "15.3\" 2.8K (2880x1800) OLED TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11 PRO", "Color": "GREY", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21Q6006RUS", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-x9-15-gen-1-aura-edition-21q6006rus';

UPDATE products SET
  description = $$THINKPAD X9-14 GEN 1 AURA EDITION 21QA0036US is a business laptop built around a CORE ULTRA 7 268V VPRO processor and Intel Arc 140V, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 7 268V VPRO brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 5GHz — business/enterprise ultraportable chip with vPro manageability/security features layered on the Lunar Lake platform; slightly higher boost than the 258V.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 14" 2.8K (2880x1800) OLED TOUCHSCREEN display with touch input — it runs Windows 11 Pro, finished in GREY.$$,
  key_features = ARRAY[$$CORE ULTRA 7 268V VPRO Performance: 8 cores, 8 threads, 12MB cache, boosting up to 5GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 14" 2.8K (2880x1800) OLED TOUCHSCREEN.$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 268V VPRO", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" 2.8K (2880x1800) OLED TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11 PRO", "Color": "GREY", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21QA0036US", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-x9-14-gen-1-aura-edition-21qa0036us';

UPDATE products SET
  description = $$THINKPAD T14S G6 is a business laptop built around a CORE ULTRA 7 255U processor, paired with 32GB DDR5 and a 1TB NVME.

CORE ULTRA 7 255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 255U", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "3 YEARS", "OS": "DOS", "Color": "INTEL / BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "T14S", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-t14s-g6';

UPDATE products SET
  description = $$THINKPAD T14 G6 is a business laptop built around a CORE ULTRA 7 265H processor, paired with 32GB DDR5 and a 1TB NVME.

CORE ULTRA 7 265H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.3GHz — upper-tier Core Ultra H-series chip for performance laptops, just below the Ultra 9 285H.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 265H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.3GHz.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 265H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "3 YEARS", "OS": "DOS", "Color": "INTEL / BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.3GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-t14-g6';

UPDATE products SET
  description = $$THINKPAD T14 G6 21QG00APED is a business laptop built around a CORE ULTRA 7 258V processor and Intel Arc 140V, paired with 32GB DDR5 ON BOARD and a 1TB NVME.

CORE ULTRA 7 258V brings 8 cores and 8 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — premium efficiency-first ultraportable chip, identical CPU config to 256V but paired with 32GB on-package memory.

Intel Arc 140V (Xe2 (Battlemage-derived)) handles graphics duties on-chip — mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 258V Performance: 8 cores, 8 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Intel Arc 140V Graphics: Mid-tier integrated GPU for Lunar Lake ultraportables — strong efficiency and solid 1080p gaming/creator performance for a thin-and-light chip.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$32GB DDR5 ON BOARD Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 258V", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN/AR/BL", "Screen": "14\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140V", "Warranty": "3 YEARS", "OS": "DOS", "Color": "BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21QG00APED", "Processor Cores": "8", "Processor Threads": "8", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-t14-g6-21qg00aped';

UPDATE products SET
  description = $$THINKPAD T14 G6 is a business laptop built around a CORE ULTRA 7 255U processor, paired with 32GB DDR5 and a 1TB NVME.

CORE ULTRA 7 255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 255U", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "3 YEARS", "OS": "DOS", "Color": "INTEL / BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-t14-g6-2';

UPDATE products SET
  description = $$THINKPAD E16 GEN 3 is a business laptop built around a CORE ULTRA 7 255H processor and Intel Arc 140T GPU, paired with 32GB DDR5 and a 1TB NVME.

CORE ULTRA 7 255H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.1GHz — upper-mid Core Ultra H-series chip for mainstream performance/gaming laptops.

Intel Arc 140T GPU (Xe2 ("Xe-LPG+", second-gen Xe-LPG)) handles graphics duties on-chip — mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.

Rounding out the package is a 16" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.1GHz.$$, $$Intel Arc 140T GPU Graphics: Mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.$$, $$Display: 16" WUXGA (1920 x 1200).$$, $$32GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 255H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140T GPU", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.1GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e16-gen-3';

UPDATE products SET
  description = $$THINKPAD T14 GEN 6 21QDS3SL00 is a business laptop built around a CORE ULTRA 5 225U processor, paired with 16GB DDR5 and a 512GB NVME.

CORE ULTRA 5 225U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 4.5GHz — efficiency-focused ultraportable chip for everyday productivity with modest integrated graphics.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 5 225U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 4.5GHz.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 5 225U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21QDS3SL00", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-t14-gen-6-21qds3sl00';

UPDATE products SET
  description = $$THINKPAD L14 GEN 6 21S6003PUS is a business laptop built around a CORE ULTRA 7 255U processor, paired with 16GB DDR5 and a 512GB NVME.

CORE ULTRA 7 255U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 5.2GHz — efficiency-focused ultraportable chip with the highest single-core boost in the 200U stack.

Rounding out the package is a 14" WUXGA (1920 x 1200) TOUCHSCREEN display with touch input — it runs Windows 11 Home, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 5.2GHz.$$, $$Display: 14" WUXGA (1920 x 1200) TOUCHSCREEN.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 7 255U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200) TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11 HOME", "Color": "INTEL / BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21S6003PUS", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 5.2GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-l14-gen-6-21s6003pus';

UPDATE products SET
  description = $$THINKPAD E16 GEN 3 is a business laptop built around a CORE ULTRA 7 255H processor and Intel Arc 140T GPU, paired with 16GB DDR5 and a 512GB NVME.

CORE ULTRA 7 255H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.1GHz — upper-mid Core Ultra H-series chip for mainstream performance/gaming laptops.

Intel Arc 140T GPU (Xe2 ("Xe-LPG+", second-gen Xe-LPG)) handles graphics duties on-chip — mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.

Rounding out the package is a 16" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ENBL.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.1GHz.$$, $$Intel Arc 140T GPU Graphics: Mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.$$, $$Display: 16" WUXGA (1920 x 1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes BLACK.$$],
  specs = $${"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Screen": "16\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140T GPU", "Warranty": "1 YEAR", "OS": "DOS", "Color": "ENBL / BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.1GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e16-gen-3-2';

UPDATE products SET
  description = $$THINKPAD E14 GEN 7 21SX0070ED is a business laptop built around a CORE ULTRA 7 255H processor and Intel Arc 140T GPU, paired with 16GB DDR5 and a 1TB NVME.

CORE ULTRA 7 255H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.1GHz — upper-mid Core Ultra H-series chip for mainstream performance/gaming laptops.

Intel Arc 140T GPU (Xe2 ("Xe-LPG+", second-gen Xe-LPG)) handles graphics duties on-chip — mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.1GHz.$$, $$Intel Arc 140T GPU Graphics: Mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$16GB DDR5 Memory + 1TB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASE.$$],
  specs = $${"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR/BL", "Screen": "14\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140T GPU", "Warranty": "2 YEARS", "OS": "DOS", "Color": "BLACK/LENOVO CASE", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21SX0070ED", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.1GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e14-gen-7-21sx0070ed';

UPDATE products SET
  description = $$THINKPAD E14 GEN 7 21SX001TGQ is a business laptop built around a CORE ULTRA 7 255H processor and Intel Arc 140T GPU, paired with 16GB DDR5 and a 512GB NVME.

CORE ULTRA 7 255H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.1GHz — upper-mid Core Ultra H-series chip for mainstream performance/gaming laptops.

Intel Arc 140T GPU (Xe2 ("Xe-LPG+", second-gen Xe-LPG)) handles graphics duties on-chip — mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.1GHz.$$, $$Intel Arc 140T GPU Graphics: Mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASE.$$],
  specs = $${"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140T GPU", "Warranty": "1YEAR", "OS": "DOS", "Color": "BLACK/LENOVO CASE", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21SX001TGQ", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.1GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e14-gen-7-21sx001tgq';

UPDATE products SET
  description = $$THINKPAD E14 GEN 7 21T90053ED is a business laptop built around a CORE 7 240H processor, paired with 16GB DDR5 and a 512GB NVME.

CORE 7 240H brings 10 cores (6 performance + 4 efficiency) and 16 threads, 24MB cache to the table, with a 2.5GHz base clock and speeds up to 5.2GHz — mainstream-performance H-series chip for gaming/creator laptops, Intel's non-'Ultra' Arrow Lake-H rebrand tier.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE 7 240H Performance: 10 cores, 16 threads, 24MB cache, boosting up to 5.2GHz.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASE.$$],
  specs = $${"CPU": "CORE 7 240H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/LENOVO CASE", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21T90053ED", "Processor Cores": "10 (6P+4E)", "Processor Threads": "16", "Processor Speed": "2.5GHz, up to 5.2GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e14-gen-7-21t90053ed';

UPDATE products SET
  description = $$THINKPAD E16 GEN 3 21ST0014ED is a business laptop built around a AMD Ryzen 7 250 processor and AMD Radeon 780M, paired with 16GB DDR5 and a 512GB NVME.

AMD Ryzen 7 250 brings 8 cores and 16 threads, 16MB cache to the table, with a 3.3GHz base clock and speeds up to 5.1GHz — mainstream 8-core thin-and-light laptop chip with integrated Radeon 780M graphics and a basic NPU.

AMD Radeon 780M (12 compute units, RDNA 3) handles graphics duties on-chip — high-performing integrated GPU for its era — capable of genuine 1080p light gaming, among the fastest integrated graphics before Strix Halo.

Rounding out the package is a 16" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$AMD Ryzen 7 250 Performance: 8 cores, 16 threads, 16MB cache, boosting up to 5.1GHz.$$, $$AMD Radeon 780M Graphics: High-performing integrated GPU for its era — capable of genuine 1080p light gaming, among the fastest integrated graphics before Strix Halo.$$, $$Display: 16" WUXGA (1920 x 1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "AMD Ryzen 7 250", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR/BL", "Screen": "16\" WUXGA (1920 x 1200)", "VGA": "AMD Radeon 780M", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21ST0014ED", "Processor Cores": "8", "Processor Threads": "16", "Processor Speed": "3.3GHz, up to 5.1GHz", "Processor Cache": "16MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e16-gen-3-21st0014ed';

UPDATE products SET
  description = $$THINKPAD E16 GEN 3 21TF005BED is a business laptop built around a CORE 5-210H processor, paired with 16GB DDR5 and a 512GB NVME.

CORE 5-210H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — mainstream H-series laptop chip for everyday performance notebooks, one tier below Core 7/9 240H-series.

Rounding out the package is a 16" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE 5-210H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Display: 16" WUXGA (1920 x 1200).$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASE.$$],
  specs = $${"CPU": "CORE 5-210H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR/BL", "Screen": "16\" WUXGA (1920 x 1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/LENOVO CASE", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21TF005BED", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e16-gen-3-21tf005bed';

UPDATE products SET
  description = $$THINKPAD E16 GEN 3 is a business laptop built around a CORE ULTRA 5 225H processor, paired with 8GB DDR5 and a 512GB NVME.

CORE ULTRA 5 225H brings 14 cores (4 performance + 8 efficiency) and 14 threads, 18MB cache to the table, with speeds up to 4.9GHz — mainstream Core Ultra H-series chip for AI-PC laptops, entry point of the 200H stack.

Rounding out the package is a 16" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 5 225H Performance: 14 cores, 14 threads, 18MB cache, boosting up to 4.9GHz.$$, $$Display: 16" WUXGA (1920 x 1200).$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 5 225H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "16\" WUXGA (1920 x 1200)", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Processor Cores": "14 (4P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.9GHz", "Processor Cache": "18MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e16-gen-3-3';

UPDATE products SET
  description = $$THINKPAD E14 GEN 7 is a business laptop built around a CORE ULTRA 5 225H processor, paired with 8GB DDR5 and a 512GB NVME.

CORE ULTRA 5 225H brings 14 cores (4 performance + 8 efficiency) and 14 threads, 18MB cache to the table, with speeds up to 4.9GHz — mainstream Core Ultra H-series chip for AI-PC laptops, entry point of the 200H stack.

Rounding out the package is a 14" WUXGA (1920 x 1200) display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in BLACK.$$,
  key_features = ARRAY[$$CORE ULTRA 5 225H Performance: 14 cores, 14 threads, 18MB cache, boosting up to 4.9GHz.$$, $$Display: 14" WUXGA (1920 x 1200).$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$],
  specs = $${"CPU": "CORE ULTRA 5 225H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BLACK", "Brand": "Lenovo", "Product Type": "Business Laptop", "Processor Cores": "14 (4P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.9GHz", "Processor Cache": "18MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkpad-e14-gen-7';

UPDATE products SET
  description = $$THINKBOOK 16 G8 IAL 21SK0030GP is a business laptop built around a CORE ULTRA 7 255H processor and Intel Arc 140T GPU, paired with 16GB DDR5 and a 512GB NVME.

CORE ULTRA 7 255H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.1GHz — upper-mid Core Ultra H-series chip for mainstream performance/gaming laptops.

Intel Arc 140T GPU (Xe2 ("Xe-LPG+", second-gen Xe-LPG)) handles graphics duties on-chip — mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.

Rounding out the package is a 16" WUXGA display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ARCTIC GREY.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.1GHz.$$, $$Intel Arc 140T GPU Graphics: Mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.$$, $$Display: 16" WUXGA.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASE.$$],
  specs = $${"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "16\" WUXGA", "VGA": "INTEL ARC 140T GPU", "Warranty": "1 YEAR", "OS": "DOS", "Color": "ARCTIC GREY/LENOVO CASE", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21SK0030GP", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.1GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkbook-16-g8-ial-21sk0030gp';

UPDATE products SET
  description = $$THINKBOOK 14 G8 IAL 21SJ0001GQ is a business laptop built around a CORE ULTRA 7 255H processor and Intel Arc 140T GPU, paired with 8GB DDR5 and a 512GB NVME.

CORE ULTRA 7 255H brings 16 cores (6 performance + 8 efficiency) and 16 threads, 24MB cache to the table, with speeds up to 5.1GHz — upper-mid Core Ultra H-series chip for mainstream performance/gaming laptops.

Intel Arc 140T GPU (Xe2 ("Xe-LPG+", second-gen Xe-LPG)) handles graphics duties on-chip — mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.

Rounding out the package is a 14" WUXGA display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ARCTIC GREY.$$,
  key_features = ARRAY[$$CORE ULTRA 7 255H Performance: 16 cores, 16 threads, 24MB cache, boosting up to 5.1GHz.$$, $$Intel Arc 140T GPU Graphics: Mid-range integrated GPU, modestly faster than Arc 140V thanks to higher clocks, used in higher-power H-class chips rather than ultraportables.$$, $$Display: 14" WUXGA.$$, $$8GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASE.$$],
  specs = $${"CPU": "CORE ULTRA 7 255H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA", "VGA": "INTEL ARC 140T GPU", "Warranty": "1 YEAR", "OS": "DOS", "Color": "ARCTIC GREY/LENOVO CASE", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21SJ0001GQ", "Processor Cores": "16 (6P+8E)", "Processor Threads": "16", "Processor Speed": "up to 5.1GHz", "Processor Cache": "24MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkbook-14-g8-ial-21sj0001gq';

UPDATE products SET
  description = $$THINKBOOK 16 G8 IAL 21SK0027GP is a business laptop built around a CORE ULTRA 5 225U processor, paired with 16GB DDR5 and a 512GB NVME.

CORE ULTRA 5 225U brings 12 cores (2 performance + 8 efficiency) and 14 threads, 12MB cache to the table, with speeds up to 4.5GHz — efficiency-focused ultraportable chip for everyday productivity with modest integrated graphics.

Rounding out the package is a 16" WUXGA display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ARCTIC GREY.$$,
  key_features = ARRAY[$$CORE ULTRA 5 225U Performance: 12 cores, 14 threads, 12MB cache, boosting up to 4.5GHz.$$, $$Display: 16" WUXGA.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes LENOVO CASE.$$],
  specs = $${"CPU": "CORE ULTRA 5 225U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "16\" WUXGA", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / ARCTIC GREY/LENOVO CASE", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21SK0027GP", "Processor Cores": "12 (2P+8E)", "Processor Threads": "14", "Processor Speed": "up to 4.5GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkbook-16-g8-ial-21sk0027gp';

UPDATE products SET
  description = $$THINKBOOK 16 G9 IRL 21US002XED is a business laptop built around a Core 5-210H processor, paired with 16GB DDR5 and a 512GB NVME.

Core 5-210H brings 8 cores (4 performance + 4 efficiency) and 12 threads, 12MB cache to the table, with a 2.2GHz base clock and speeds up to 4.8GHz — mainstream H-series laptop chip for everyday performance notebooks, one tier below Core 7/9 240H-series.

Rounding out the package is a 16" WUXGA display — it ships without a pre-installed OS (FreeDOS) — Windows can be installed on request, finished in ARCTIC GREY.$$,
  key_features = ARRAY[$$Core 5-210H Performance: 8 cores, 12 threads, 12MB cache, boosting up to 4.8GHz.$$, $$Display: 16" WUXGA.$$, $$16GB DDR5 Memory + 512GB NVME: smooth multitasking with fast boot and load times.$$, $$Bundled Extras: includes Topload Case.$$],
  specs = $${"RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "16\" WUXGA", "CPU": "Core 5-210H", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ARCTIC GREY/Topload Case", "Brand": "Lenovo", "Product Type": "Business Laptop", "Model": "21US002XED", "Processor Cores": "8 (4P+4E)", "Processor Threads": "12", "Processor Speed": "2.2GHz, up to 4.8GHz", "Processor Cache": "12MB"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 2-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-thinkbook-16-g9-irl-21us002xed';

UPDATE products SET
  description = $$Apple MacBook Pro 16" M5 MAX 48GB/2TB SSD — SPACE BLACK pairs the Apple M5 MAX 18-Core Chip with a 16" Liquid Retina XDR display, 48GB of unified memory and a 2TB SSD.

The Apple M5 MAX 18-Core Chip features an 18-core CPU (6 'super cores' + 12 performance-efficient cores) alongside a 40-core GPU and 16-Core Neural Accelerators. Apple's highest-end 2026 MacBook Pro / Mac Studio chip, over 4x the peak AI GPU compute of the previous (M4 Max) generation and up to 6x that of the original M1 Max.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 MAX 18-Core Chip: 18-core CPU (6 'super cores' + 12 performance-efficient cores), 40-core GPU, 16-Core Neural Accelerators.$$, $$Display: 16" 3456 x 2234 Liquid Retina XDR Screen.$$, $$2TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 MAX 18-Core Chip", "RAM": "48GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "40-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGEE4LL/A", "Processor Cores": "18 total (6 'super cores' + 12 performance-efficient cores)"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-16-m5-max-48gb-2tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 16" M5 MAX 36GB/2TB SSD — SPACE BLACK pairs the Apple M5 MAX 18-Core Chip with a 16" Liquid Retina XDR display, 36GB of unified memory and a 2TB SSD.

The Apple M5 MAX 18-Core Chip features an 18-core CPU (6 'super cores' + 12 performance-efficient cores) alongside a 32-core GPU and 16-Core Neural Accelerators. Apple's highest-end 2026 MacBook Pro / Mac Studio chip, over 4x the peak AI GPU compute of the previous (M4 Max) generation and up to 6x that of the original M1 Max.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 MAX 18-Core Chip: 18-core CPU (6 'super cores' + 12 performance-efficient cores), 32-core GPU, 16-Core Neural Accelerators.$$, $$Display: 16" 3456 x 2234 Liquid Retina XDR Screen.$$, $$2TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 MAX 18-Core Chip", "RAM": "36GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "32-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGED4LL/A", "Processor Cores": "18 total (6 'super cores' + 12 performance-efficient cores)"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-16-m5-max-36gb-2tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 MAX 36GB/2TB SSD — SPACE BLACK pairs the Apple M5 MAX 18-Core Chip with a 14" Liquid Retina XDR display, 36GB of unified memory and a 2TB SSD.

The Apple M5 MAX 18-Core Chip features an 18-core CPU (6 'super cores' + 12 performance-efficient cores) alongside a 32-core GPU and 16-Core Neural Accelerators. Apple's highest-end 2026 MacBook Pro / Mac Studio chip, over 4x the peak AI GPU compute of the previous (M4 Max) generation and up to 6x that of the original M1 Max.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 MAX 18-Core Chip: 18-core CPU (6 'super cores' + 12 performance-efficient cores), 32-core GPU, 16-Core Neural Accelerators.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$2TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 MAX 18-Core Chip", "RAM": "36GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "32-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGDU4LL/A", "Processor Cores": "18 total (6 'super cores' + 12 performance-efficient cores)"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-max-36gb-2tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 MAX 36GB/2TB SSD — SILVER pairs the Apple M5 MAX 18-Core Chip with a 14" Liquid Retina XDR display, 36GB of unified memory and a 2TB SSD.

The Apple M5 MAX 18-Core Chip features an 18-core CPU (6 'super cores' + 12 performance-efficient cores) alongside a 32-core GPU and 16-Core Neural Accelerators. Apple's highest-end 2026 MacBook Pro / Mac Studio chip, over 4x the peak AI GPU compute of the previous (M4 Max) generation and up to 6x that of the original M1 Max.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 MAX 18-Core Chip: 18-core CPU (6 'super cores' + 12 performance-efficient cores), 32-core GPU, 16-Core Neural Accelerators.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$2TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 MAX 18-Core Chip", "RAM": "36GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "32-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGDQ4LL/A", "Processor Cores": "18 total (6 'super cores' + 12 performance-efficient cores)"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-max-36gb-2tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Pro 16" M5 PRO 48GB/1TB SSD — SPACE BLACK pairs the Apple M5 PRO 18-Core Chip with a 16" Liquid Retina XDR display, 48GB of unified memory and a 1TB SSD.

The Apple M5 PRO 18-Core Chip features a 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU alongside a 20-core GPU and 16-Core Neural Accelerators with up to 307GB/s of memory bandwidth. Apple's upper-tier 2026 Mac chip using a new 'Fusion Architecture' (two dies combined into one SoC) for demanding pro creative and development workflows.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 PRO 18-Core Chip: 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU, 20-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 48GB with up to 307GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 16" 3456 x 2234 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 PRO 18-Core Chip", "RAM": "48GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "20-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGEC4LL/A", "Processor Cores": "18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship", "Memory Bandwidth": "307GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-16-m5-pro-48gb-1tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 16" M5 PRO 48GB/1TB SSD — SILVER pairs the Apple M5 PRO 18-Core Chip with a 16" Liquid Retina XDR display, 48GB of unified memory and a 1TB SSD.

The Apple M5 PRO 18-Core Chip features a 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU alongside a 20-core GPU and 16-Core Neural Accelerators with up to 307GB/s of memory bandwidth. Apple's upper-tier 2026 Mac chip using a new 'Fusion Architecture' (two dies combined into one SoC) for demanding pro creative and development workflows.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 PRO 18-Core Chip: 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU, 20-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 48GB with up to 307GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 16" 3456 x 2234 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 PRO 18-Core Chip", "RAM": "48GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "20-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGE64LL/A", "Processor Cores": "18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship", "Memory Bandwidth": "307GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-16-m5-pro-48gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Pro 16" M5 PRO 24GB/1TB SSD — SPACE BLACK pairs the Apple M5 PRO 18-Core Chip with a 16" Liquid Retina XDR display, 24GB of unified memory and a 1TB SSD.

The Apple M5 PRO 18-Core Chip features a 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU alongside a 20-core GPU and 16-Core Neural Accelerators with up to 307GB/s of memory bandwidth. Apple's upper-tier 2026 Mac chip using a new 'Fusion Architecture' (two dies combined into one SoC) for demanding pro creative and development workflows.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 PRO 18-Core Chip: 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU, 20-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 24GB with up to 307GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 16" 3456 x 2234 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 PRO 18-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "20-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGEA4LL/A", "Processor Cores": "18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship", "Memory Bandwidth": "307GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-16-m5-pro-24gb-1tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 PRO 24GB/2TB SSD — SPACE BLACK pairs the Apple M5 PRO 15-Core Chip with a 14" Liquid Retina XDR display, 24GB of unified memory and a 2TB SSD.

The Apple M5 PRO 15-Core Chip features a 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU alongside a 16-core GPU and 16-Core Neural Accelerators with up to 307GB/s of memory bandwidth. Apple's upper-tier 2026 Mac chip using a new 'Fusion Architecture' (two dies combined into one SoC) for demanding pro creative and development workflows.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 PRO 15-Core Chip: 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU, 16-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 24GB with up to 307GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$2TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 PRO 15-Core Chip", "RAM": "24GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "16-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MJLW4LL/A", "Processor Cores": "18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship", "Memory Bandwidth": "307GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-pro-24gb-2tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 PRO 24GB/1TB SSD — SILVER pairs the Apple M5 PRO 15-Core Chip with a 14" Liquid Retina XDR display, 24GB of unified memory and a 1TB SSD.

The Apple M5 PRO 15-Core Chip features a 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU alongside a 16-core GPU and 16-Core Neural Accelerators with up to 307GB/s of memory bandwidth. Apple's upper-tier 2026 Mac chip using a new 'Fusion Architecture' (two dies combined into one SoC) for demanding pro creative and development workflows.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 PRO 15-Core Chip: 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU, 16-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 24GB with up to 307GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 PRO 15-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "16-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGDN4LL/A", "Processor Cores": "18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship", "Memory Bandwidth": "307GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-pro-24gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 PRO 24GB/1TB SSD — SPACE BLACK pairs the Apple M5 PRO 15-Core Chip with a 14" Liquid Retina XDR display, 24GB of unified memory and a 1TB SSD.

The Apple M5 PRO 15-Core Chip features a 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU alongside a 16-core GPU and 16-Core Neural Accelerators with up to 307GB/s of memory bandwidth. Apple's upper-tier 2026 Mac chip using a new 'Fusion Architecture' (two dies combined into one SoC) for demanding pro creative and development workflows.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 PRO 15-Core Chip: 18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship CPU, 16-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 24GB with up to 307GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 PRO 15-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "16-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MGDR4LL/A", "Processor Cores": "18 total maximum (6 'super cores' + 12 performance-efficient cores); lower-binned configurations also ship", "Memory Bandwidth": "307GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-pro-24gb-1tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 32GB/1TB SSD — SPACE BLACK pairs the Apple M5 10-Core Chip with a 14" Liquid Retina XDR display, 32GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU and 16-Core Neural Accelerators with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 32GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "32GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MJ3D4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-32gb-1tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 32GB/1TB SSD — SILVER pairs the Apple M5 10-Core Chip with a 14" Liquid Retina XDR display, 32GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU and 16-Core Neural Accelerators with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 32GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "32GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MJ3E4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-32gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 24GB/1TB SSD — SILVER pairs the Apple M5 10-Core Chip with a 14" Liquid Retina XDR display, 24GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU and 16-Core Neural Accelerators with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 24GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MDE64LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-24gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 24GB/1TB SSD — SPACE BLACK pairs the Apple M5 10-Core Chip with a 14" Liquid Retina XDR display, 24GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU and 16-Core Neural Accelerators with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 24GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MDE34LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-24gb-1tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 16GB/1TB SSD — SPACE BLACK pairs the Apple M5 10-Core Chip with a 14" Liquid Retina XDR display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU and 16-Core Neural Accelerators with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Space Black, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MDE14LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-16gb-1tb-ssd-space-black';

UPDATE products SET
  description = $$Apple MacBook Pro 14" M5 16GB/1TB SSD — SILVER pairs the Apple M5 10-Core Chip with a 14" Liquid Retina XDR display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU and 16-Core Neural Accelerators with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU, 16-Core Neural Accelerators.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 14" 3024 x 1964 Liquid Retina XDR Screen.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Pro", "Model": "MDE54LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-pro-14-m5-16gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 24GB/1TB SSD — MIDNIGHT pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 24GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Midnight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 24GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVN4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-midnight';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 24GB/1TB SSD — SILVER pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 24GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 24GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVC4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 24GB/1TB SSD — STARLIGHT pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 24GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Starlight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 24GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "STARLIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVF4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-starlight';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 24GB/1TB SSD — SKYBLUE pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 24GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Skyblue, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 24GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVU4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-skyblue';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 16GB/1TB SSD — SKYBLUE pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Skyblue, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVT4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-skyblue';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 16GB/1TB SSD — SILVER pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVA4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 16GB/1TB SSD — MIDNIGHT pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Midnight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVK4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-midnight';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 24GB/1TB SSD — SILVER pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 24GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 24GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDH94LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-24gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 24GB/1TB SSD — MIDNIGHT pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 24GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Midnight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 24GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDHG4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-24gb-1tb-ssd-midnight';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 16GB/1TB SSD — MIDNIGHT pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Midnight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDHF4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-midnight';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 16GB/1TB SSD — SILVER pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDH84LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 16GB/1TB SSD — SKYBLUE pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Skyblue, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDHJ4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-skyblue';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 16GB/1TB SSD — STARLIGHT pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 16GB of unified memory and a 1TB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Starlight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$1TB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "STARLIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDHC4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-starlight';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 16GB/512GB SSD — STARLIGHT pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Starlight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "STARLIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVD4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-starlight';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 16GB/512GB SSD — SKYBLUE pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Skyblue, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVQ4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-skyblue';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 16GB/512GB SSD — SILVER pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDV94LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Air 15.3" M5 16GB/512GB SSD — MIDNIGHT pairs the Apple M5 10-Core Chip with a 15.3" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Midnight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 15.3" 2880x1864.$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDVH4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-midnight';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 16GB/512GB SSD — SKYBLUE pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 8-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Skyblue, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 8-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "8-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDHH4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-skyblue';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 16GB/512GB SSD — STARLIGHT pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 8-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Starlight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 8-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "8-CORE GPU", "OS": "MAC OS", "Color": "STARLIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDHA4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-starlight';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 16GB/512GB SSD — MIDNIGHT pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 8-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Midnight, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 8-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "8-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDHE4LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-midnight';

UPDATE products SET
  description = $$Apple MacBook Air 13.6" M5 16GB/512GB SSD — SILVER pairs the Apple M5 10-Core Chip with a 13.6" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M5 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 8-core GPU with up to 153GB/s of memory bandwidth. Apple's 2025 mainstream chip built for AI workloads — each of its 10 GPU cores adds a dedicated Neural Accelerator, delivering over 4x the peak GPU AI compute of M4.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M5 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 8-core GPU.$$, $$Fast Unified Memory: 16GB with up to 153GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: 13.6" 2560x1664.$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "8-CORE GPU", "OS": "MAC OS", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MDH74LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "153GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Air M4 16GB/512GB SSD — SILVER pairs the Apple M4 10-Core Chip with a None" Liquid Retina display, 16GB of unified memory and a 512GB SSD.

The Apple M4 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 120GB/s of memory bandwidth. Apple's 2024 mainstream Mac/iPad Pro chip, strong all-around performance for consumer and prosumer workloads.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M4 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 120GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: .$$, $$512GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M4 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "VGA": "10-CORE GPU", "OS": "MACOS WITH APPLE INTELLIGENCE", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MU9E3LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "120GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-m4-16gb-512gb-ssd-silver';

UPDATE products SET
  description = $$Apple MacBook Air M4 16GB/256GB SSD — SILVER pairs the Apple M4 10-Core Chip with a None" Liquid Retina display, 16GB of unified memory and a 256GB SSD.

The Apple M4 10-Core Chip features a 10-core CPU (4 performance + 6 efficiency) alongside a 10-core GPU with up to 120GB/s of memory bandwidth. Apple's 2024 mainstream Mac/iPad Pro chip, strong all-around performance for consumer and prosumer workloads.

Finished in Silver, it runs macOS with seamless Handoff, AirDrop and iCloud integration across your Apple devices.$$,
  key_features = ARRAY[$$Apple M4 10-Core Chip: 10-core CPU (4 performance + 6 efficiency), 10-core GPU.$$, $$Fast Unified Memory: 16GB with up to 120GB/s of memory bandwidth for smooth multitasking and creative workflows.$$, $$Display: .$$, $$256GB SSD Storage: fast app launches and quick file transfers.$$, $$macOS + Apple Ecosystem: Handoff, AirDrop, Universal Control and iCloud built in.$$],
  specs = $${"CPU": "Apple M4 10-Core Chip", "RAM": "16GB", "Storage": "256GB SSD", "VGA": "10-CORE GPU", "OS": "MACOS WITH APPLE INTELLIGENCE", "Color": "SILVER", "Brand": "Apple", "Product Type": "MacBook Air", "Model": "MU9D3LL/A", "Processor Cores": "10 total (4 performance + 6 efficiency)", "Memory Bandwidth": "120GB/s"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-macbook-air-m4-16gb-256gb-ssd-silver';
