-- Microsoft Surface Laptop ZHI-00001 (Black, exact SKU match)
UPDATE products SET images = ARRAY['/products/microsoft-surface-laptop-zhi-00001.webp', '/products/microsoft-surface-laptop-zhi-00001-top.jpg', '/products/microsoft-surface-laptop-zhi-00001-rear.jpg']
WHERE slug = 'microsoft-surface-laptop-zhi-00001';

-- Samsung 22" S3 monitor (chassis-family match, no exact SKU in catalog)
UPDATE products SET images = ARRAY['/products/samsung-22-samsung-monitor-s3-100hz-d-sub.png', '/products/samsung-22-samsung-monitor-s3-100hz-d-sub-front.jpg']
WHERE slug = 'samsung-22-samsung-monitor-s3-100hz-d-sub';

-- LG 24" IPS Borderless 24U411A-B (exact model match)
UPDATE products SET images = ARRAY['/products/lg-24-lg-ips-borderless-120hz-d-sub.webp', '/products/lg-24-lg-ips-borderless-120hz-d-sub-front.jpg']
WHERE slug = 'lg-24-lg-ips-borderless-120hz-d-sub';

-- MSI 24" PIVOT MP245PG (exact model match, official MSI CDN)
UPDATE products SET images = ARRAY['/products/msi-24-msi-ips-monitor-pivot-mp245pg-100hz-1ms-multimedia-dp.webp', '/products/msi-24-msi-ips-monitor-pivot-mp245pg-100hz-1ms-multimedia-dp-side.jpg', '/products/msi-24-msi-ips-monitor-pivot-mp245pg-100hz-1ms-multimedia-dp-angle.png']
WHERE slug = 'msi-24-msi-ips-monitor-pivot-mp245pg-100hz-1ms-multimedia-dp';

-- MSI 24" PIVOT MP245PG E2 (exact match via Ayoub Computers CDN)
UPDATE products SET images = ARRAY['/products/msi-24-msi-ips-monitor-pivot-mp245pg-e2-144hz-1ms-multimedia-dp.webp', '/products/msi-24-msi-ips-monitor-pivot-mp245pg-e2-144hz-1ms-multimedia-dp-rear.jpg']
WHERE slug = 'msi-24-msi-ips-monitor-pivot-mp245pg-e2-144hz-1ms-multimedia-dp';

-- MSI 25" G255PF E2 (exact model match, official MSI CDN)
UPDATE products SET images = ARRAY['/products/msi-25-msi-ips-gaming-monitor-g255pf-e2-180hz-1ms-multimedia-2-hdmi.webp', '/products/msi-25-msi-ips-gaming-monitor-g255pf-e2-180hz-1ms-multimedia-2-hdmi-dual.png']
WHERE slug = 'msi-25-msi-ips-gaming-monitor-g255pf-e2-180hz-1ms-multimedia-2-hdmi';

-- Samsung 27" S3 monitor (chassis-family match)
UPDATE products SET images = ARRAY['/products/samsung-27-samsung-monitor-s3-100hz-d-sub.webp', '/products/samsung-27-samsung-monitor-s3-100hz-d-sub-front.jpg']
WHERE slug = 'samsung-27-samsung-monitor-s3-100hz-d-sub';

-- Samsung 27" Curved S3 monitor (chassis-family match)
UPDATE products SET images = ARRAY['/products/samsung-27-samsung-curved-monitor-s3-100hz-d-sub.webp', '/products/samsung-27-samsung-curved-monitor-s3-100hz-d-sub-front.jpg']
WHERE slug = 'samsung-27-samsung-curved-monitor-s3-100hz-d-sub';

-- LG 27" IPS Borderless 27U411A-B (exact model match, official LG CDN)
UPDATE products SET images = ARRAY['/products/lg-27-lg-ips-borderless-120hz-d-sub.webp', '/products/lg-27-lg-ips-borderless-120hz-d-sub-front.jpg', '/products/lg-27-lg-ips-borderless-120hz-d-sub-angle.jpg']
WHERE slug = 'lg-27-lg-ips-borderless-120hz-d-sub';

-- MSI 27" Gaming USB-C (chassis-family match, PRO MP27x series)
UPDATE products SET images = ARRAY['/products/msi-27-msi-ips-gaming-fhd-144hz-1ms-multimedia-usb-c.webp', '/products/msi-27-msi-ips-gaming-fhd-144hz-1ms-multimedia-usb-c-front.png']
WHERE slug = 'msi-27-msi-ips-gaming-fhd-144hz-1ms-multimedia-usb-c';

-- MSI 27" Curved Gaming WQHD (chassis-family match, MSI curved gaming line)
UPDATE products SET images = ARRAY['/products/msi-27-msi-curved-gaming-wqhd-180hz-0-5ms-2-hdmi.webp', '/products/msi-27-msi-curved-gaming-wqhd-180hz-0-5ms-2-hdmi-front.jpg']
WHERE slug = 'msi-27-msi-curved-gaming-wqhd-180hz-0-5ms-2-hdmi';

-- Optoma Projector X400LVE (exact model match)
UPDATE products SET images = ARRAY['/products/optoma-projector-4000-lumns-xga.webp', '/products/optoma-projector-4000-lumns-xga-front.jpg']
WHERE slug = 'optoma-projector-4000-lumns-xga';
