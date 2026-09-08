-- Rich product-page content for peripherals (headphones, mice, backpacks,
-- sleeve, charger, keyboard combo), sourced from official Apple/Lenovo/
-- Targus spec pages for each exact model.

UPDATE products SET
  description = $$Apple AirPods Max 2 bring Apple's H2 chip to a premium over-ear design, pairing a 40mm Apple-designed dynamic driver with Active Noise Cancellation that Apple rates as 1.5x more effective than the original AirPods Max.

Nine microphones do the work: six outward-facing mics measure ambient noise, two inward-facing mics check what you're actually hearing, and a dedicated array handles voice pickup for calls — all while Adaptive Transparency and spatial audio with dynamic head tracking stay available at a tap.

Battery life runs up to 20 hours with ANC and spatial audio both switched on, and a 5-minute USB-C quick charge adds about 1.5 hours of listening — a full charge takes roughly 2 hours.$$,
  key_features = ARRAY[$$H2 Chip + Active Noise Cancellation: 1.5x more effective ANC than the original AirPods Max.$$, $$40mm Apple-Designed Dynamic Driver: rich, detailed sound across the full frequency range.$$, $$Up to 20 Hours Battery Life: with Active Noise Cancellation and spatial audio enabled.$$, $$USB-C Charging: a 5-minute charge adds about 1.5 hours of listening.$$, $$Spatial Audio with Dynamic Head Tracking: immersive sound for movies and music.$$, $$Nine Microphones: 8 for Active Noise Cancellation, 3 dedicated to clear voice calls.$$],
  specs = $${"Brand": "Apple", "Product Type": "Over-Ear Headphones", "Chip": "Apple H2", "Driver": "40mm Apple-designed dynamic driver", "Battery Life": "Up to 20 hours (ANC + Spatial Audio on)", "Charging": "USB-C (5-min charge ≈ 1.5 hours playback)", "Microphones": "9 total (8 for ANC, 3 for voice)", "Noise Cancellation": "Active Noise Cancellation + Adaptive Transparency", "Color": "Black"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-airpods-max-2-over-ear-wireless-up-to-20-hours-with-active-noise-cancellat';

UPDATE products SET
  description = $$Apple Magic Mouse (Black Multi-Touch Surface) is Apple's wireless, rechargeable mouse with a seamless glass Multi-Touch surface that reads swipes and gestures across its entire top — no physical buttons or scroll wheel needed.

It connects wirelessly to Mac over Bluetooth and pairs and charges through USB-C, with the included woven USB-C Charge Cable. The built-in rechargeable battery lasts about a month or more between charges.

Finished in black to match Apple's current Mac lineup, it's a compact, low-profile mouse built for everyday Mac use.$$,
  key_features = ARRAY[$$Multi-Touch Surface: swipe to switch pages, scroll and navigate — no scroll wheel or extra buttons.$$, $$USB-C Rechargeable: pairs and charges over USB-C with the included woven cable.$$, $$About a Month of Battery Life: per charge under typical use.$$, $$Wireless Bluetooth Connection: pairs directly with Mac.$$],
  specs = $${"Brand": "Apple", "Product Type": "Wireless Mouse", "Surface": "Multi-Touch (glass)", "Connectivity": "Bluetooth (pairing/charging via USB-C)", "Battery": "Built-in rechargeable, ~1 month per charge", "Color": "Black"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-magic-mouse-multi-touch-surface-usb-c-charge-cable';

UPDATE products SET
  description = $$Apple Magic Mouse (White Multi-Touch Surface) is Apple's wireless, rechargeable mouse with a seamless glass Multi-Touch surface that reads swipes and gestures across its entire top — no physical buttons or scroll wheel needed.

It connects wirelessly to Mac over Bluetooth and pairs and charges through USB-C, with the included woven USB-C Charge Cable. The built-in rechargeable battery lasts about a month or more between charges.

Finished in white to match Apple's current Mac lineup, it's a compact, low-profile mouse built for everyday Mac use.$$,
  key_features = ARRAY[$$Multi-Touch Surface: swipe to switch pages, scroll and navigate — no scroll wheel or extra buttons.$$, $$USB-C Rechargeable: pairs and charges over USB-C with the included woven cable.$$, $$About a Month of Battery Life: per charge under typical use.$$, $$Wireless Bluetooth Connection: pairs directly with Mac.$$],
  specs = $${"Brand": "Apple", "Product Type": "Wireless Mouse", "Surface": "Multi-Touch (glass)", "Connectivity": "Bluetooth (pairing/charging via USB-C)", "Battery": "Built-in rechargeable, ~1 month per charge", "Color": "White"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'apple-magic-mouse-multi-touch-surface-usb-c-charge-cable-2';

UPDATE products SET
  description = $$Lenovo Legion 15.6" Recon Gaming Backpack is a purpose-built carry for gaming laptops up to 15.6", with a dedicated cushioned laptop compartment separate from the large main storage area.

Water-resistant fabric and a thick, sturdy base protect against everyday knocks and weather, while dedicated pockets keep chargers, a mouse and other gaming gear organized instead of loose in the main compartment.

Breathable back padding and an adjustable shoulder strap keep it comfortable over a full day of carrying, at a manageable 910g empty weight.$$,
  key_features = ARRAY[$$Fits 15.6" Gaming Laptops: dedicated, cushioned laptop compartment separate from the main storage.$$, $$Water-Resistant Fabric: everyday protection against rain and spills.$$, $$Dedicated Gear Pockets: organized storage for a charger, mouse and accessories.$$, $$Breathable Back Padding: comfortable over long carries.$$, $$Lightweight: 910g empty.$$],
  specs = $${"Brand": "Lenovo", "Product Type": "Laptop Backpack", "Laptop Compatibility": "Up to 15.6\"", "Weight": "910g", "Dimensions": "495 x 295 x 160 mm", "Material": "Water-resistant fabric"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-legion-15-6-recon-gaming-backpack';

UPDATE products SET
  description = $$Lenovo Legion Active Gaming Backpack is an 18.5L carry built from recycled PET materials, with a padded main compartment sized for a 16" notebook and a separate padded back compartment that fits up to a 17" laptop.

A front pocket keeps small essentials within easy reach, a side pocket holds a water bottle, and a trolley strap lets it clip onto rolling luggage for travel. The extra-durable coated base and back panel add water-repellent toughness for daily gaming-gear hauling.

A well-padded backrest and adjustable, padded shoulder straps keep it comfortable at its 1.15kg starting weight.$$,
  key_features = ARRAY[$$18.5L Capacity: fits a 16" notebook plus a separate 17" laptop compartment.$$, $$Made from Recycled PET: sustainable materials, extra-durable coated base and back.$$, $$Trolley Strap: clips onto rolling luggage for travel.$$, $$Water Bottle Pocket + Front Access Pocket: quick-reach storage for essentials.$$, $$Padded Backrest and Straps: comfortable for daily carrying.$$],
  specs = $${"Brand": "Lenovo", "Product Type": "Laptop Backpack", "Laptop Compatibility": "Up to 17\"", "Capacity": "18.5L", "Weight": "1150g", "Dimensions": "310 x 190 x 460 mm", "Material": "Recycled PET, water-repellent coating"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-legion-active-gaming-backpack';

UPDATE products SET
  description = $$Targus Classic 15.6" Backpack (CN600) is a straightforward, durable daily-carry with a removable, fully-cushioned laptop compartment that fits 15.4–16" notebooks and a security fastener to keep it in place.

A 20-litre main compartment, a front zippered pocket, two side mesh pockets and an internal divider for documents give it enough organization for a full workday's gear, all wrapped in hard-wearing nylon.

Adjustable padded shoulder straps, a padded back panel and a top grab handle round out a backpack built to be used every day, not just for travel.$$,
  key_features = ARRAY[$$Removable Padded Laptop Compartment: fits 15.4–16" laptops with a security fastener.$$, $$20L Main Compartment: room for a full day's work gear.$$, $$Multiple Organized Pockets: front zippered pocket, two side mesh pockets, internal document divider.$$, $$Hard-Wearing Nylon Construction: built for daily use.$$, $$Limited Lifetime Warranty from Targus.$$],
  specs = $${"Brand": "Targus", "Product Type": "Laptop Backpack", "Laptop Compatibility": "15.4–16\"", "Capacity": "20L", "Weight": "0.88kg", "Dimensions": "31 x 17.5 x 47 cm", "Material": "Nylon"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-cn600gl-70-targus-backpack-15-6-cn600-classic-black';

UPDATE products SET
  description = $$Lenovo 15.6-Inch Laptop Urban Sleeve Case is a slim, protective sleeve for 15.6" laptops (and MacBook Air/Pro), made from durable, water-resistant polyester with a protective rubber bumper on each corner.

Inside, multiple padded compartments separate the laptop from a charger and other accessories, with a cushioned zipper lining to guard against scratches. A sturdy carrying handle makes it easy to grab and go on its own, or slide into a larger bag.

At just 0.63 lbs, it adds virtually no weight to a daily commute.$$,
  key_features = ARRAY[$$Fits 15.6" Laptops: also compatible with 13"/14" MacBook Air and Pro models.$$, $$Water-Resistant Polyester: everyday protection against rain and spills.$$, $$Reinforced Corner Bumpers: extra protection against drops and knocks.$$, $$Multiple Padded Compartments: separate storage for a charger and accessories.$$, $$Lightweight: just 0.63 lbs.$$],
  specs = $${"Brand": "Lenovo", "Product Type": "Laptop Sleeve", "Laptop Compatibility": "15.6\" (fits 13\"/14\"/15.6\" devices)", "Weight": "0.63 lbs", "External Dimensions": "15.7 x 10.8 x 1.2 in", "Material": "Water-resistant polyester", "Color": "Charcoal Gray"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-15-6-inch-laptop-urban-sleeve-case';

UPDATE products SET
  description = $$Lenovo 65W Standard AC Adapter delivers 65W of charging power through USB-C (20V/3.25A), enough to charge and run most USB-C-enabled ThinkPad and other Lenovo notebooks, fitted here with a UK plug.

Built-in Smart Voltage technology automatically adjusts output to match the connected device, while a smart clip protects against overheating, overcurrent, overvoltage and short circuits.

A compact, lightweight 108 x 46 x 28.5mm shell makes it easy to pack as a spare or travel charger.$$,
  key_features = ARRAY[$$65W USB-C Output: 20V/3.25A — enough for most USB-C-charging Lenovo laptops.$$, $$Smart Voltage Technology: automatically adjusts output to the connected device.$$, $$Built-In Protection: guards against overheating, overcurrent, overvoltage and short circuits.$$, $$Compact and Lightweight: 108 x 46 x 28.5mm, easy to travel with.$$, $$UK Plug Fitted.$$],
  specs = $${"Brand": "Lenovo", "Product Type": "Laptop Charger", "Power Output": "65W (20V, 3.25A)", "Connector": "USB Type-C", "Plug Type": "UK", "Dimensions": "108 x 46 x 28.5 mm", "Input": "100–240V, 1.5A, 50–60Hz"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-65w-standard-ac-adapter-usb-type-c-uk-plug';

UPDATE products SET
  description = $$Lenovo 510 Wireless Combo pairs a full-size island-style keyboard with an ambidextrous optical mouse, both connecting through a single 2.4GHz Nano USB receiver — no separate dongles or Bluetooth pairing to fuss with.

The keyboard adds dedicated media keys (volume, mute, play/pause, forward/back), Caps Lock and Num Lock indicators, and a water-resistant casing that shrugs off the occasional spill. The 1200 DPI optical mouse is comfortable in either hand.

Both run on standard AA batteries — 2 for the keyboard, 1 for the mouse, which is rated for up to 12 months per charge.$$,
  key_features = ARRAY[$$Single Nano USB Receiver: connects both keyboard and mouse over 2.4GHz — no pairing required.$$, $$Media Keys: dedicated volume, mute, play/pause and track controls.$$, $$Water-Resistant Keyboard Casing: shrugs off everyday spills.$$, $$1200 DPI Ambidextrous Mouse: comfortable for left- or right-handed use, up to 12 months battery life.$$, $$Runs on Standard AA Batteries: 2 for the keyboard, 1 for the mouse.$$],
  specs = $${"Brand": "Lenovo", "Product Type": "Keyboard & Mouse Combo", "Connectivity": "2.4GHz wireless (single Nano USB receiver)", "Mouse Sensor": "1200 DPI optical", "Mouse Battery Life": "Up to 12 months", "Keyboard Power": "2x AA battery", "Mouse Power": "1x AA battery"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-510-wireless-combo-keyboard-and-mouse';

UPDATE products SET
  description = $$Lenovo 150 Wireless Mouse is a compact, ambidextrous mouse with a 1000 DPI LED optical sensor and reliable 2.4GHz wireless range of up to 10 meters via its USB-A nano receiver — no software or drivers needed.

Its 3-button layout with a clickable scroll wheel covers everyday navigation, and the left/right buttons are rated for 3,000,000 clicks for long-term durability.

Powered by a single AA battery (included), it works out of the box with Windows, macOS, ChromeOS and Linux.$$,
  key_features = ARRAY[$$1000 DPI Optical Sensor: smooth, accurate everyday tracking.$$, $$2.4GHz Wireless, up to 10m Range: via a plug-and-play USB-A nano receiver.$$, $$Ambidextrous Design: comfortable for left- or right-handed use.$$, $$3,000,000-Click Rated Buttons: built for long-term daily use.$$, $$Plug-and-Play: no software or drivers needed, works across Windows, macOS, ChromeOS and Linux.$$],
  specs = $${"Brand": "Lenovo", "Product Type": "Wireless Mouse", "Sensor": "1000 DPI LED optical", "Connectivity": "2.4GHz wireless (USB-A nano receiver)", "Range": "Up to 10m", "Buttons": "3-button + scroll wheel", "Power": "1x AA battery (included)"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 3-month warranty against manufacturing defects (the standard coverage for accessories). Every item we sell is 100% genuine, with free local diagnosis at our shop in Tripoli. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lenovo-150-wireless-mouse-with-battery';
