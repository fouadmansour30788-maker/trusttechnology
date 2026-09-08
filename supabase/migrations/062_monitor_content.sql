-- Rich product-page content for the monitors/projector category. Unlike
-- laptops/desktops, these products shipped with an EMPTY specs object —
-- all specs here are newly built from verified manufacturer spec sheets
-- (LG/Samsung/ASUS/MSI/Optoma official pages) for each exact model.

UPDATE products SET
  description = $$22" SAMSUNG Monitor S3 100Hz D-Sub is a 22" IPS monitor with Full HD (1920 x 1080) resolution and a 100Hz refresh rate, 5ms (GTG) response time.

It offers 250 cd/m² (typical) brightness, a 1000:1 contrast ratio, 178°/178° viewing angles, with Eye Saver Mode and Flicker-Free.

Connectivity covers HDMI and D-Sub (VGA), with a stand that supports tilt.$$,
  key_features = ARRAY[$$IPS Panel: Full HD (1920 x 1080) at 100Hz, 5ms (GTG).$$, $$Picture Quality: 250 cd/m² (typical), 1000:1 contrast.$$, $$Connectivity: HDMI and D-Sub (VGA).$$, $$Eye Saver Mode.$$, $$Flicker-Free.$$],
  specs = $${"Brand": "Samsung", "Product Type": "Monitor", "Model": "LS22D300GAMXUE", "Screen Size": "22\"", "Panel Type": "IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "100Hz", "Response Time": "5ms (GTG)", "Brightness": "250 cd/m² (typical)", "Contrast Ratio": "1000:1", "Viewing Angle": "178°/178°", "Connectivity": "HDMI and D-Sub (VGA)", "VESA Mount": "No", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'samsung-22-samsung-monitor-s3-100hz-d-sub';

UPDATE products SET
  description = $$24" LG IPS Borderless 120Hz D-Sub is a 24" (23.8" viewable) IPS monitor with Full HD (1920 x 1080) resolution and a 120Hz refresh rate, 5ms GTG (1ms Motion Blur Reduction mode) response time.

It offers 250 nits (typical) brightness, 178°/178° viewing angles, with HDR10, sRGB 99% (typ.), 3-side virtually borderless design, Flicker Safe and Reader Mode.

Connectivity covers HDMI and D-Sub (VGA), with a stand that supports tilt.$$,
  key_features = ARRAY[$$IPS Panel: Full HD (1920 x 1080) at 120Hz, 5ms GTG (1ms Motion Blur Reduction mode).$$, $$Picture Quality: 250 nits (typical).$$, $$Connectivity: HDMI and D-Sub (VGA).$$, $$HDR10.$$, $$sRGB 99% (typ.).$$, $$3-side virtually borderless design.$$, $$Flicker Safe.$$, $$Reader Mode.$$],
  specs = $${"Brand": "LG", "Product Type": "Monitor", "Model": "24U411A-B", "Screen Size": "24\" (23.8\" viewable)", "Panel Type": "IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "120Hz", "Response Time": "5ms GTG (1ms Motion Blur Reduction mode)", "Brightness": "250 nits (typical)", "Viewing Angle": "178°/178°", "Connectivity": "HDMI and D-Sub (VGA)", "VESA Mount": "No", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lg-24-lg-ips-borderless-120hz-d-sub';

UPDATE products SET
  description = $$24" ASUS IPS Monitor 120Hz 1ms is a 24" (23.8" viewable) IPS monitor with Full HD (1920 x 1080) resolution and a 120Hz refresh rate, 1ms (MPRT) response time.

It offers 178° viewing angles, with Adaptive-Sync, sRGB 99%, Frameless design, TÜV-certified Flicker-Free and Low Blue Light.

Connectivity covers HDMI and D-Sub (VGA), with a stand that supports tilt, and is VESA-mountable for wall or arm mounts.$$,
  key_features = ARRAY[$$IPS Panel: Full HD (1920 x 1080) at 120Hz, 1ms (MPRT).$$, $$Connectivity: HDMI and D-Sub (VGA).$$, $$Adaptive-Sync.$$, $$sRGB 99%.$$, $$Frameless design.$$, $$TÜV-certified Flicker-Free.$$, $$Low Blue Light.$$, $$VESA Mount Compatible: mount on an arm or wall bracket to free up desk space.$$],
  specs = $${"Brand": "ASUS", "Product Type": "Monitor", "Model": "VA249HG", "Screen Size": "24\" (23.8\" viewable)", "Panel Type": "IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "120Hz", "Response Time": "1ms (MPRT)", "Viewing Angle": "178°", "Connectivity": "HDMI and D-Sub (VGA)", "VESA Mount": "Yes", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'asus-24-asus-ips-monitor-120hz-1ms';

UPDATE products SET
  description = $$24" MSI IPS Monitor PIVOT MP245PG 100Hz 1ms Multimedia DP is a 24" (23.8" viewable) IPS business monitor with Full HD (1920 x 1080) resolution and a 100Hz refresh rate, 1ms (MPRT) / 4ms (GTG) response time.

It offers 300 cd/m² brightness, 178°/178° viewing angles, with Adaptive-Sync, MSI EyesErgo (anti-flicker, less blue light) and Built-in speakers.

Connectivity covers HDMI and DisplayPort, with a stand that supports tilt, swivel, pivot and height adjustment, and is VESA-mountable for wall or arm mounts.$$,
  key_features = ARRAY[$$IPS Panel: Full HD (1920 x 1080) at 100Hz, 1ms (MPRT) / 4ms (GTG).$$, $$Picture Quality: 300 cd/m².$$, $$Connectivity: HDMI and DisplayPort.$$, $$Adaptive-Sync.$$, $$MSI EyesErgo (anti-flicker, less blue light).$$, $$Built-in speakers.$$, $$VESA Mount Compatible: mount on an arm or wall bracket to free up desk space.$$],
  specs = $${"Brand": "MSI", "Product Type": "Business Monitor", "Model": "PRO MP245PG", "Screen Size": "24\" (23.8\" viewable)", "Panel Type": "IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "100Hz", "Response Time": "1ms (MPRT) / 4ms (GTG)", "Brightness": "300 cd/m²", "Viewing Angle": "178°/178°", "Connectivity": "HDMI and DisplayPort", "VESA Mount": "Yes", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'msi-24-msi-ips-monitor-pivot-mp245pg-100hz-1ms-multimedia-dp';

UPDATE products SET
  description = $$24" MSI IPS Monitor PIVOT MP245PG E2 144Hz 1ms Multimedia DP is a 24" (23.8" viewable) IPS business monitor with Full HD (1920 x 1080) resolution and a 144Hz refresh rate, 1ms (MPRT) response time.

It offers 178°/178° viewing angles, with AMD FreeSync, HDR support, MSI EyesErgo (anti-flicker, less blue light) and Built-in speakers.

Connectivity covers HDMI, DisplayPort and D-Sub (VGA), with a stand that supports tilt, swivel, pivot and height adjustment, and is VESA-mountable for wall or arm mounts.$$,
  key_features = ARRAY[$$IPS Panel: Full HD (1920 x 1080) at 144Hz, 1ms (MPRT).$$, $$Connectivity: HDMI, DisplayPort and D-Sub (VGA).$$, $$AMD FreeSync.$$, $$HDR support.$$, $$MSI EyesErgo (anti-flicker, less blue light).$$, $$Built-in speakers.$$, $$VESA Mount Compatible: mount on an arm or wall bracket to free up desk space.$$],
  specs = $${"Brand": "MSI", "Product Type": "Business Monitor", "Model": "PRO MP245PG E14", "Screen Size": "24\" (23.8\" viewable)", "Panel Type": "IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "144Hz", "Response Time": "1ms (MPRT)", "Viewing Angle": "178°/178°", "Connectivity": "HDMI, DisplayPort and D-Sub (VGA)", "VESA Mount": "Yes", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'msi-24-msi-ips-monitor-pivot-mp245pg-e2-144hz-1ms-multimedia-dp';

UPDATE products SET
  description = $$25" MSI IPS Gaming Monitor G255PF E2 180Hz 1ms Multimedia 2*HDMI is a 25" (24.5" viewable) Rapid IPS gaming monitor with Full HD (1920 x 1080) resolution and a 180Hz refresh rate, 1ms (GtG) response time.

It offers a 1000:1 contrast ratio, 178° viewing angles, with Adaptive-Sync (FreeSync), sRGB 99%, 16.7 million colors, Low Blue Light and Flicker-free.

Connectivity covers 2x HDMI 2.0b and DisplayPort 1.2a, with a stand that supports tilt, swivel, pivot and height adjustment, and is VESA-mountable for wall or arm mounts.$$,
  key_features = ARRAY[$$Rapid IPS Panel: Full HD (1920 x 1080) at 180Hz, 1ms (GtG).$$, $$Picture Quality: 1000:1 contrast.$$, $$Connectivity: 2x HDMI 2.0b and DisplayPort 1.2a.$$, $$Adaptive-Sync (FreeSync).$$, $$sRGB 99%.$$, $$16.7 million colors.$$, $$Low Blue Light.$$, $$Flicker-free.$$, $$VESA Mount Compatible: mount on an arm or wall bracket to free up desk space.$$],
  specs = $${"Brand": "MSI", "Product Type": "Gaming Monitor", "Model": "G255PF E2", "Screen Size": "25\" (24.5\" viewable)", "Panel Type": "Rapid IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "180Hz", "Response Time": "1ms (GtG)", "Contrast Ratio": "1000:1", "Viewing Angle": "178°", "Connectivity": "2x HDMI 2.0b and DisplayPort 1.2a", "VESA Mount": "Yes", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'msi-25-msi-ips-gaming-monitor-g255pf-e2-180hz-1ms-multimedia-2-hdmi';

UPDATE products SET
  description = $$25" MSI IPS Gaming Monitor 255XF AI Vision 300Hz 0.5ms 2*HDMI is a 25" (24.5" viewable) Rapid IPS gaming monitor with Full HD (1920 x 1080) resolution and a 300Hz refresh rate, 0.5ms (GtG) response time.

It offers 178° viewing angles, with AMD FreeSync Premium, HDR Ready, AI Vision (dark-scene detail enhancement), Smart Crosshair, 120% sRGB, 1.07 billion colors and Less Blue Light / Anti-Flicker.

Connectivity covers 2x HDMI 2.0b and DisplayPort 1.4a, with a stand that supports tilt, and is VESA-mountable for wall or arm mounts.$$,
  key_features = ARRAY[$$Rapid IPS Panel: Full HD (1920 x 1080) at 300Hz, 0.5ms (GtG).$$, $$Connectivity: 2x HDMI 2.0b and DisplayPort 1.4a.$$, $$AMD FreeSync Premium.$$, $$HDR Ready.$$, $$AI Vision (dark-scene detail enhancement).$$, $$Smart Crosshair.$$, $$120% sRGB, 1.07 billion colors.$$, $$Less Blue Light / Anti-Flicker.$$, $$VESA Mount Compatible: mount on an arm or wall bracket to free up desk space.$$],
  specs = $${"Brand": "MSI", "Product Type": "Gaming Monitor", "Model": "MAG 255XF", "Screen Size": "25\" (24.5\" viewable)", "Panel Type": "Rapid IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "300Hz", "Response Time": "0.5ms (GtG)", "Viewing Angle": "178°", "Connectivity": "2x HDMI 2.0b and DisplayPort 1.4a", "VESA Mount": "Yes", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'msi-25-msi-ips-gaming-monitor-255xf-ai-vision-300hz-0-5ms-2-hdmi';

UPDATE products SET
  description = $$27" Samsung Monitor S3 100Hz D-Sub is a 27" IPS monitor with Full HD (1920 x 1080) resolution and a 100Hz refresh rate, 5ms (GTG) response time.

It offers 250 cd/m² (typical) brightness, a 1000:1 contrast ratio, 178°/178° viewing angles, with Eye Saver Mode and Flicker-Free.

Connectivity covers HDMI and D-Sub (VGA), with a stand that supports tilt.$$,
  key_features = ARRAY[$$IPS Panel: Full HD (1920 x 1080) at 100Hz, 5ms (GTG).$$, $$Picture Quality: 250 cd/m² (typical), 1000:1 contrast.$$, $$Connectivity: HDMI and D-Sub (VGA).$$, $$Eye Saver Mode.$$, $$Flicker-Free.$$],
  specs = $${"Brand": "Samsung", "Product Type": "Monitor", "Model": "LS27D300GAMXUE", "Screen Size": "27\"", "Panel Type": "IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "100Hz", "Response Time": "5ms (GTG)", "Brightness": "250 cd/m² (typical)", "Contrast Ratio": "1000:1", "Viewing Angle": "178°/178°", "Connectivity": "HDMI and D-Sub (VGA)", "VESA Mount": "No", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'samsung-27-samsung-monitor-s3-100hz-d-sub';

UPDATE products SET
  description = $$27" Samsung Curved Monitor S3 100Hz D-Sub is a 27" VA monitor with Full HD (1920 x 1080) resolution and a 100Hz refresh rate, curved to a 1800R radius, 4ms (GTG) response time.

It offers 250 cd/m² (typical) brightness, a 3000:1 contrast ratio, 178°/178° viewing angles, with Game Mode, Eye Saver Mode, Flicker-Free and Narrow border design.

Connectivity covers HDMI and D-Sub (VGA), with a stand that supports tilt.$$,
  key_features = ARRAY[$$VA Panel: Full HD (1920 x 1080) at 100Hz, 4ms (GTG).$$, $$1800R Curve: a wraparound field of view for gaming and media.$$, $$Picture Quality: 250 cd/m² (typical), 3000:1 contrast.$$, $$Connectivity: HDMI and D-Sub (VGA).$$, $$Game Mode.$$, $$Eye Saver Mode.$$, $$Flicker-Free.$$, $$Narrow border design.$$],
  specs = $${"Brand": "Samsung", "Product Type": "Curved Monitor", "Model": "LS27D362GAMXUE", "Screen Size": "27\"", "Panel Type": "VA", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "100Hz", "Response Time": "4ms (GTG)", "Brightness": "250 cd/m² (typical)", "Contrast Ratio": "3000:1", "Viewing Angle": "178°/178°", "Curvature": "1800R", "Connectivity": "HDMI and D-Sub (VGA)", "VESA Mount": "No", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'samsung-27-samsung-curved-monitor-s3-100hz-d-sub';

UPDATE products SET
  description = $$27" LG IPS Borderless 120Hz D-Sub is a 27" IPS monitor with Full HD (1920 x 1080) resolution and a 120Hz refresh rate, 5ms GTG (1ms Motion Blur Reduction mode) response time.

It offers 250 nits (typical) brightness, a 1500:1 contrast ratio, 178°/178° viewing angles, with HDR10, sRGB 99% (typ.), Dynamic Action Sync (low input lag), 3-side virtually borderless design, Flicker Safe and Reader Mode.

Connectivity covers HDMI and D-Sub (VGA), with a stand that supports tilt.$$,
  key_features = ARRAY[$$IPS Panel: Full HD (1920 x 1080) at 120Hz, 5ms GTG (1ms Motion Blur Reduction mode).$$, $$Picture Quality: 250 nits (typical), 1500:1 contrast.$$, $$Connectivity: HDMI and D-Sub (VGA).$$, $$HDR10.$$, $$sRGB 99% (typ.).$$, $$Dynamic Action Sync (low input lag).$$, $$3-side virtually borderless design.$$, $$Flicker Safe.$$, $$Reader Mode.$$],
  specs = $${"Brand": "LG", "Product Type": "Monitor", "Model": "27U411A-B", "Screen Size": "27\"", "Panel Type": "IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "120Hz", "Response Time": "5ms GTG (1ms Motion Blur Reduction mode)", "Brightness": "250 nits (typical)", "Contrast Ratio": "1500:1", "Viewing Angle": "178°/178°", "Connectivity": "HDMI and D-Sub (VGA)", "VESA Mount": "No", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lg-27-lg-ips-borderless-120hz-d-sub';

UPDATE products SET
  description = $$27" MSI IPS Gaming FHD 144Hz 1ms Multimedia USB-C is a 27" IPS business monitor with Full HD (1920 x 1080) resolution and a 144Hz refresh rate, 1ms response time.

It offers 300 nits brightness, a 1500:1 contrast ratio, 178°/178° viewing angles, with AMD FreeSync, HDR Ready, 4-side slim bezel, Built-in 2W speakers and Less Blue Light / Anti-Flicker / Anti-Glare.

Connectivity covers HDMI 2.0 and USB-C (DisplayPort Alt Mode + 15W power delivery), with a stand that supports tilt, and is VESA-mountable for wall or arm mounts.$$,
  key_features = ARRAY[$$IPS Panel: Full HD (1920 x 1080) at 144Hz, 1ms.$$, $$Picture Quality: 300 nits, 1500:1 contrast.$$, $$Connectivity: HDMI 2.0 and USB-C (DisplayPort Alt Mode + 15W power delivery).$$, $$AMD FreeSync.$$, $$HDR Ready.$$, $$4-side slim bezel.$$, $$Built-in 2W speakers.$$, $$Less Blue Light / Anti-Flicker / Anti-Glare.$$, $$VESA Mount Compatible: mount on an arm or wall bracket to free up desk space.$$],
  specs = $${"Brand": "MSI", "Product Type": "Business Monitor", "Model": "PRO MP272 E14C", "Screen Size": "27\"", "Panel Type": "IPS", "Resolution": "Full HD (1920 x 1080)", "Refresh Rate": "144Hz", "Response Time": "1ms", "Brightness": "300 nits", "Contrast Ratio": "1500:1", "Viewing Angle": "178°/178°", "Connectivity": "HDMI 2.0 and USB-C (DisplayPort Alt Mode + 15W power delivery)", "VESA Mount": "Yes", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'msi-27-msi-ips-gaming-fhd-144hz-1ms-multimedia-usb-c';

UPDATE products SET
  description = $$27" MSI Curved Gaming WQHD 180Hz 0.5ms 2*HDMI is a 27" Rapid VA gaming monitor with WQHD (2560 x 1440) resolution and a 180Hz refresh rate, curved to a 1500R radius, 0.5ms (GtG) response time.

It offers 250 nits brightness, 178° viewing angles, with HDR Ready, AMD FreeSync / Adaptive Sync and Less Blue Light.

Connectivity covers HDMI and DisplayPort, with a stand that supports tilt, and is VESA-mountable for wall or arm mounts.$$,
  key_features = ARRAY[$$Rapid VA Panel: WQHD (2560 x 1440) at 180Hz, 0.5ms (GtG).$$, $$1500R Curve: a wraparound field of view for gaming and media.$$, $$Picture Quality: 250 nits.$$, $$Connectivity: HDMI and DisplayPort.$$, $$HDR Ready.$$, $$AMD FreeSync / Adaptive Sync.$$, $$Less Blue Light.$$, $$VESA Mount Compatible: mount on an arm or wall bracket to free up desk space.$$],
  specs = $${"Brand": "MSI", "Product Type": "Curved Gaming Monitor", "Model": "MAG 275CQF E18", "Screen Size": "27\"", "Panel Type": "Rapid VA", "Resolution": "WQHD (2560 x 1440)", "Refresh Rate": "180Hz", "Response Time": "0.5ms (GtG)", "Brightness": "250 nits", "Viewing Angle": "178°", "Curvature": "1500R", "Connectivity": "HDMI and DisplayPort", "VESA Mount": "Yes", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'msi-27-msi-curved-gaming-wqhd-180hz-0-5ms-2-hdmi';

UPDATE products SET
  description = $$32" LG UltraGear 2K QHD CURVED Gaming 180Hz is a 32" (31.5" viewable) VA gaming monitor with QHD (2560 x 1440) resolution and a 180Hz refresh rate, curved to a 1000R radius, 1ms (GtG) response time.

It supports HDR10, sRGB 99%, AMD FreeSync / VESA AdaptiveSync, Black Stabilizer, Dynamic Action Sync, Crosshair overlay, FPS counter and 3-side borderless design.

Connectivity covers 2x HDMI and DisplayPort, with a stand that supports tilt.$$,
  key_features = ARRAY[$$VA Panel: QHD (2560 x 1440) at 180Hz, 1ms (GtG).$$, $$1000R Curve: a wraparound field of view for gaming and media.$$, $$Connectivity: 2x HDMI and DisplayPort.$$, $$HDR10.$$, $$sRGB 99%.$$, $$AMD FreeSync / VESA AdaptiveSync.$$, $$Black Stabilizer.$$, $$Dynamic Action Sync.$$, $$Crosshair overlay.$$, $$FPS counter.$$, $$3-side borderless design.$$],
  specs = $${"Brand": "LG", "Product Type": "Curved Gaming Monitor", "Model": "32GS60QC-B", "Screen Size": "32\" (31.5\" viewable)", "Panel Type": "VA", "Resolution": "QHD (2560 x 1440)", "Refresh Rate": "180Hz", "Response Time": "1ms (GtG)", "Curvature": "1000R", "Connectivity": "2x HDMI and DisplayPort", "VESA Mount": "No", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz';

UPDATE products SET
  description = $$Optoma X400LVe is a bright XGA business and classroom projector built for presentations in rooms with ambient light, delivering 4000 ANSI lumens and a 25,000:1 contrast ratio on a 1024 x 768 (XGA) DLP panel.

A 1.94–2.16:1 throw ratio and 1.1x zoom give some flexibility in room setup, while an Eco+ mode lamp life rated up to 15,000 hours keeps running costs down over years of daily use.

A single HDMI input covers modern laptops, and a built-in 10W speaker means presentations and videos play through the room without a separate sound system.$$,
  key_features = ARRAY[$$4000 ANSI Lumens: bright enough for classrooms and meeting rooms without dimming the lights.$$, $$25,000:1 Contrast Ratio: crisp text and clear detail in slides, documents and video.$$, $$XGA (1024 x 768) DLP Panel: sharp, reliable image quality for presentations.$$, $$Up to 15,000-Hour Lamp Life (Eco+ Mode): years of use before a replacement lamp is needed.$$, $$Built-in 10W Speaker: presentations and video play without extra speakers.$$],
  specs = $${"Brand": "Optoma", "Product Type": "Projector", "Model": "X400LVE", "Brightness": "4000 ANSI Lumens", "Contrast Ratio": "25,000:1", "Resolution": "XGA (1024 x 768)", "Display Technology": "DLP", "Throw Ratio": "1.94–2.16:1 (1.1x zoom)", "Lamp Life": "Up to 15,000 hours (Eco+ mode)", "Connectivity": "HDMI", "Audio": "Built-in 10W speaker", "Warranty": "1 YEAR"}$$::jsonb,
  warranty_info = $$Backed by Trust Technology's official 1-year warranty against manufacturing defects. Every unit we sell is 100% genuine, with free local diagnosis at our shop in Tripoli — a covered fault is repaired or the unit replaced, refunded if neither is possible. See our full warranty policy for exclusions and how to make a claim.$$
WHERE slug = 'optoma-projector-4000-lumns-xga';
