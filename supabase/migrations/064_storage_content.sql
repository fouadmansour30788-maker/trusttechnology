-- Rich product-page content for the storage category (external hard
-- drives, power banks, HP pen/mouse). Note this category's slugs are
-- all prefixed 'seagate-' from a supplier import quirk even though half
-- the products are Voltra/Techsmarter/Anker/HP -- content correctly
-- reflects each item's real brand, sourced from official spec sheets.

UPDATE products SET
  description = $$Seagate One Touch Hub 20TB is a desktop external hard drive built for large media libraries and backups, spinning at 7200 RPM with front-facing USB-C and USB 3.0 ports so you can plug in other devices to charge, even while the computer is off.

AES-256 hardware encryption protects your data at the drive level, and every unit includes 2 years of Seagate Rescue Data Recovery Services for peace of mind against accidental data loss.

Formatted exFAT out of the box, it works with both Windows and Mac without reformatting, and comes with a 4-month Adobe Creative Cloud Photography plan plus a year of Mylio Photos+ included.$$,
  key_features = ARRAY[$$20TB Capacity at 7200 RPM: fast, high-capacity storage for large libraries and backups.$$, $$Front-Facing USB-C + USB 3.0 Hub: charge other devices even while your computer is off.$$, $$AES-256 Hardware Encryption: drive-level protection for your data.$$, $$2 Years of Rescue Data Recovery Services: included data-recovery coverage.$$, $$Windows + Mac Compatible: formatted exFAT out of the box, no reformatting needed.$$, $$Bundled Software: 4-month Adobe Creative Cloud Photography plan + 1-year Mylio Photos+.$$],
  specs = $${"Brand": "Seagate", "Product Type": "Desktop External Hard Drive", "Model": "One Touch Hub", "Capacity": "20TB", "Interface": "USB-C / USB 3.0", "Spin Speed": "7200 RPM", "Encryption": "AES-256 hardware encryption", "Format": "exFAT (Windows + Mac compatible)", "Included Services": "2 years Rescue Data Recovery Services"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-one-touch-hub-20tb-external-hard-drive';

UPDATE products SET
  description = $$Seagate One Touch Hub 16TB is a desktop external hard drive built for large media libraries and backups, spinning at 7200 RPM with front-facing USB-C and USB 3.0 ports so you can plug in other devices to charge, even while the computer is off.

AES-256 hardware encryption protects your data at the drive level, and every unit includes 2 years of Seagate Rescue Data Recovery Services for peace of mind against accidental data loss.

Formatted exFAT out of the box, it works with both Windows and Mac without reformatting, and comes with a 4-month Adobe Creative Cloud Photography plan plus a year of Mylio Photos+ included.$$,
  key_features = ARRAY[$$16TB Capacity at 7200 RPM: fast, high-capacity storage for large libraries and backups.$$, $$Front-Facing USB-C + USB 3.0 Hub: charge other devices even while your computer is off.$$, $$AES-256 Hardware Encryption: drive-level protection for your data.$$, $$2 Years of Rescue Data Recovery Services: included data-recovery coverage.$$, $$Windows + Mac Compatible: formatted exFAT out of the box, no reformatting needed.$$, $$Bundled Software: 4-month Adobe Creative Cloud Photography plan + 1-year Mylio Photos+.$$],
  specs = $${"Brand": "Seagate", "Product Type": "Desktop External Hard Drive", "Model": "One Touch Hub", "Capacity": "16TB", "Interface": "USB-C / USB 3.0", "Spin Speed": "7200 RPM", "Encryption": "AES-256 hardware encryption", "Format": "exFAT (Windows + Mac compatible)", "Included Services": "2 years Rescue Data Recovery Services"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-one-touch-hub-16tb-external-hard-drive';

UPDATE products SET
  description = $$Seagate One Touch Hub 12TB is a desktop external hard drive built for large media libraries and backups, spinning at 7200 RPM with front-facing USB-C and USB 3.0 ports so you can plug in other devices to charge, even while the computer is off.

AES-256 hardware encryption protects your data at the drive level, and every unit includes 2 years of Seagate Rescue Data Recovery Services for peace of mind against accidental data loss.

Formatted exFAT out of the box, it works with both Windows and Mac without reformatting, and comes with a 4-month Adobe Creative Cloud Photography plan plus a year of Mylio Photos+ included.$$,
  key_features = ARRAY[$$12TB Capacity at 7200 RPM: fast, high-capacity storage for large libraries and backups.$$, $$Front-Facing USB-C + USB 3.0 Hub: charge other devices even while your computer is off.$$, $$AES-256 Hardware Encryption: drive-level protection for your data.$$, $$2 Years of Rescue Data Recovery Services: included data-recovery coverage.$$, $$Windows + Mac Compatible: formatted exFAT out of the box, no reformatting needed.$$, $$Bundled Software: 4-month Adobe Creative Cloud Photography plan + 1-year Mylio Photos+.$$],
  specs = $${"Brand": "Seagate", "Product Type": "Desktop External Hard Drive", "Model": "One Touch Hub", "Capacity": "12TB", "Interface": "USB-C / USB 3.0", "Spin Speed": "7200 RPM", "Encryption": "AES-256 hardware encryption", "Format": "exFAT (Windows + Mac compatible)", "Included Services": "2 years Rescue Data Recovery Services"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-one-touch-hub-12tb-external-hard-drive';

UPDATE products SET
  description = $$Seagate One Touch Hub 8TB is a desktop external hard drive built for large media libraries and backups, spinning at 7200 RPM with front-facing USB-C and USB 3.0 ports so you can plug in other devices to charge, even while the computer is off.

AES-256 hardware encryption protects your data at the drive level, and every unit includes 2 years of Seagate Rescue Data Recovery Services for peace of mind against accidental data loss.

Formatted exFAT out of the box, it works with both Windows and Mac without reformatting, and comes with a 4-month Adobe Creative Cloud Photography plan plus a year of Mylio Photos+ included.$$,
  key_features = ARRAY[$$8TB Capacity at 7200 RPM: fast, high-capacity storage for large libraries and backups.$$, $$Front-Facing USB-C + USB 3.0 Hub: charge other devices even while your computer is off.$$, $$AES-256 Hardware Encryption: drive-level protection for your data.$$, $$2 Years of Rescue Data Recovery Services: included data-recovery coverage.$$, $$Windows + Mac Compatible: formatted exFAT out of the box, no reformatting needed.$$, $$Bundled Software: 4-month Adobe Creative Cloud Photography plan + 1-year Mylio Photos+.$$],
  specs = $${"Brand": "Seagate", "Product Type": "Desktop External Hard Drive", "Model": "One Touch Hub", "Capacity": "8TB", "Interface": "USB-C / USB 3.0", "Spin Speed": "7200 RPM", "Encryption": "AES-256 hardware encryption", "Format": "exFAT (Windows + Mac compatible)", "Included Services": "2 years Rescue Data Recovery Services"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-one-touch-hub-8tb-external-hard-drive';

UPDATE products SET
  description = $$Seagate Expansion Portable 4TB is a compact, bus-powered external hard drive for backing up photos, videos and documents on the go — no separate power adapter needed, it draws power directly from the USB cable.

USB 3.0 connectivity (backward-compatible with USB 2.0) delivers fast transfer speeds for large files, and it works right out of the box with Windows, macOS and ChromeOS with no software to install.

A light, pocketable design makes it easy to carry a full backup of a laptop's drive wherever you go.$$,
  key_features = ARRAY[$$4TB Capacity: plenty of room for photo, video and document backups.$$, $$USB 3.0 (USB 2.0 Compatible): fast transfer speeds for large files.$$, $$Bus-Powered: no separate power adapter, powered directly from the USB cable.$$, $$Plug-and-Play: works with Windows, macOS and ChromeOS with no software required.$$, $$Compact and Portable: lightweight design that's easy to carry.$$],
  specs = $${"Brand": "Seagate", "Product Type": "Portable External Hard Drive", "Model": "Expansion Portable", "Capacity": "4TB", "Interface": "USB 3.0 (USB 2.0 compatible)", "Power": "Bus-powered (via USB)", "Compatibility": "Windows, macOS, ChromeOS"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-4tb-expansion-portable-usb-3-0-external-hard-drive';

UPDATE products SET
  description = $$Seagate Expansion Portable 2TB is a compact, bus-powered external hard drive for backing up photos, videos and documents on the go — no separate power adapter needed, it draws power directly from the USB cable.

USB 3.0 connectivity (backward-compatible with USB 2.0) delivers fast transfer speeds for large files, and it works right out of the box with Windows, macOS and ChromeOS with no software to install.

A light, pocketable design makes it easy to carry a full backup of a laptop's drive wherever you go.$$,
  key_features = ARRAY[$$2TB Capacity: plenty of room for photo, video and document backups.$$, $$USB 3.0 (USB 2.0 Compatible): fast transfer speeds for large files.$$, $$Bus-Powered: no separate power adapter, powered directly from the USB cable.$$, $$Plug-and-Play: works with Windows, macOS and ChromeOS with no software required.$$, $$Compact and Portable: lightweight design that's easy to carry.$$],
  specs = $${"Brand": "Seagate", "Product Type": "Portable External Hard Drive", "Model": "Expansion Portable", "Capacity": "2TB", "Interface": "USB 3.0 (USB 2.0 compatible)", "Power": "Bus-powered (via USB)", "Compatibility": "Windows, macOS, ChromeOS"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-2tb-expansion-portable-usb-3-0-external-hard-drive';

UPDATE products SET
  description = $$Voltra 96000mAh Power Bank (FPB96K-C60) is a high-capacity LiFePO4 power station rated at 307Wh, built to charge laptops, tablets and phones repeatedly rather than topping up a single phone — Voltra rates it for about 5 full charges of a 13" MacBook or 3+ charges of a 15" MacBook.

Output covers three 5V USB ports, a 12V car cigarette-lighter socket (up to 10A) and a 60W USB-C Power Delivery port, so laptops, camping gear and phones can all draw power at once. Four LED indicators show the remaining charge at a glance.

Built-in short-circuit, overcharge, total-discharge and overload protection keep it safe for daily use, and a mains charging adapter is included in the box.$$,
  key_features = ARRAY[$$96,000mAh / 307Wh LiFePO4 Battery: enough for multiple laptop charges, not just a phone top-up.$$, $$60W USB-C Power Delivery: fast-charges laptops and other PD devices.$$, $$3x USB Ports + 12V Car Socket: charge multiple devices at once.$$, $$~5 Full 13" MacBook Charges (or 3+ on a 15"): rated by Voltra for high-capacity laptop charging.$$, $$Built-In Safety Protections: short-circuit, overcharge, over-discharge and overload protection.$$, $$LED Charge Indicators + Included Mains Adapter.$$],
  specs = $${"Brand": "Voltra", "Product Type": "Power Bank", "Model": "FPB96K-C60", "Capacity": "96,000mAh (307Wh)", "Battery Chemistry": "LiFePO4", "Output": "60W USB-C PD, 3x USB-A, 12V car socket (10A)", "Weight": "3.5kg"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-96000-mah';

UPDATE products SET
  description = $$Techsmarter 30000mAh Power Bank is a rugged, IP66 waterproof and dustproof portable charger built for outdoor use, tested to survive a 3-foot drop and rated to charge a phone up to 13 times, an iPad around 4 times, or a MacBook twice.

A 45W USB-C Power Delivery port handles fast charging for laptops and tablets, alongside USB and USB-C ports for phones, and it supports pass-through charging so it can recharge itself while powering a device at the same time. The power bank itself recharges in under 4 hours from a 45W PD charger.

A built-in LED flashlight with four modes (high, low, strobe and SOS), rated for up to 120 hours of use, makes it a practical companion for camping, travel and power outages.$$,
  key_features = ARRAY[$$30,000mAh Capacity: up to 13 phone charges, 4 iPad charges or 2 MacBook charges.$$, $$45W USB-C Power Delivery: fast charging for laptops and tablets.$$, $$IP66 Waterproof, Dustproof and Drop-Tested: built for outdoor and rugged use.$$, $$Pass-Through Charging: recharges itself while powering a connected device.$$, $$Built-In LED Flashlight: 4 modes (high, low, strobe, SOS), up to 120 hours runtime.$$, $$Includes a carabiner clip for attaching to a bag.$$],
  specs = $${"Brand": "Techsmarter", "Product Type": "Power Bank", "Capacity": "30,000mAh", "Output": "45W USB-C Power Delivery + USB-A", "Water/Dust Rating": "IP66", "Extra Features": "Built-in LED flashlight (4 modes)"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-30000-mah';

UPDATE products SET
  description = $$Anker 24000mAh Power Bank (Anker 737 / PowerCore 24K) is a high-output charger built around two USB-C ports and one USB-A port, delivering up to 140W total so it can fast-charge a laptop, phone and tablet all at the same time.

A real-time digital display shows output/input wattage and estimated recharge time at a glance, backed by Anker's GaN-powered charging, PowerIQ 4.0 and ActiveShield 2.0 for intelligent temperature monitoring and device protection.

It's fast both ways: the power bank itself recharges to 70% in about 30 minutes, and it can take a 16" MacBook Pro from empty to 50% in around 40 minutes.$$,
  key_features = ARRAY[$$24,000mAh Capacity, 140W Total Output: fast-charges a laptop, phone and tablet simultaneously.$$, $$2x USB-C + 1x USB-A Ports: PD 3.1 support up to 140W on a single USB-C port.$$, $$Real-Time Digital Display: shows live output/input power and estimated recharge time.$$, $$GaN-Powered Charging + ActiveShield 2.0: efficient, temperature-monitored fast charging.$$, $$Recharges to 70% in ~30 Minutes: fast turnaround between uses.$$, $$Charges a 16" MacBook Pro to 50% in ~40 Minutes.$$],
  specs = $${"Brand": "Anker", "Product Type": "Power Bank", "Model": "Anker 737 (PowerCore 24K)", "Capacity": "24,000mAh", "Output": "Up to 140W (2x USB-C, 1x USB-A)", "Weight": "~22 oz (623g)", "Dimensions": "6.1 x 2.1 x 1.9 in"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'seagate-24000-mah';

UPDATE products SET
  description = $$HP Rechargeable MPP 2.0 Tilt Pen (3J122AA) is a precision stylus for HP touchscreens that support MPP 2.0, with 4096 levels of pressure sensitivity and tilt recognition for natural, low-latency writing and drawing.

It activates with just 9 grams of pressure and includes two programmable buttons via the HP Pen Control app, so shortcuts for erasing, right-click or app-specific actions are always a click away.

USB-C rechargeable, it runs for up to 30 days on a charge and blinks to let you know when it's running low — no batteries to replace, and it ships with two spare pen tips and a USB-C charging cable.$$,
  key_features = ARRAY[$$MPP 2.0 Technology: 4096 pressure levels with tilt recognition for natural writing and drawing.$$, $$9g Activation Force: precise, low-latency pen-point accuracy.$$, $$2 Programmable Buttons: customizable shortcuts via the HP Pen Control app.$$, $$Up to 30 Days Battery Life: USB-C rechargeable, no batteries to replace.$$, $$Includes 2 Spare Tips + USB-C Charging Cable.$$],
  specs = $${"Brand": "HP", "Product Type": "Digital Pen", "Model": "3J122AA", "Technology": "MPP 2.0", "Pressure Sensitivity": "4096 levels", "Activation Force": "9g", "Battery": "USB-C rechargeable, up to 30 days", "Compatibility": "Select MPP 2.0-enabled HP touchscreens (e.g. Spectre, Envy x360)"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-3j122aa-pen-rechargeable-type-c';

UPDATE products SET
  description = $$HP 410 Slim Silver Bluetooth Mouse pairs directly over Bluetooth 5 — no USB dongle to lose — with a slim, matte-finish shell that works comfortably in either hand.

A 1200 DPI sensor tracks smoothly on most surfaces, and a single AA battery keeps it running for up to 12 months, so it's ready for everyday work without frequent battery swaps.

Broad compatibility covers Windows 10+, macOS 10.15+, iPadOS 13.4+ and Chrome OS 68+, making it a reliable everyday mouse across most modern setups.$$,
  key_features = ARRAY[$$Bluetooth 5 Connectivity: pairs directly, no USB dongle required.$$, $$1200 DPI Sensor: smooth tracking for everyday use.$$, $$Up to 12 Months Battery Life: runs on a single AA battery.$$, $$Ambidextrous Slim Design: comfortable for either hand.$$, $$Broad OS Compatibility: Windows, macOS, iPadOS and Chrome OS.$$],
  specs = $${"Brand": "HP", "Product Type": "Wireless Mouse", "Model": "410 Slim (Silver)", "Connectivity": "Bluetooth 5", "Sensor": "1200 DPI", "Power": "1x AA battery (up to 12 months)", "Compatibility": "Windows 10+, macOS 10.15+, iPadOS 13.4+, Chrome OS 68+"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'hp-410-slim-silver-bluetooth-mouse';
