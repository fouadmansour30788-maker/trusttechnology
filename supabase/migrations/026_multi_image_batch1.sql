-- First batch of multi-image galleries, sourced from Ayoub Computers'
-- (and, where an exact SKU match wasn't available there, other real
-- retailer/manufacturer) official product photography -- same chassis
-- family, verified real, no watermarks. Existing primary photo kept as
-- the first image in each array.
UPDATE products SET images = ARRAY[
  '/products/asus-rog-strix-scar-edition-18-g835lx-s9113.jpg',
  '/products/asus-rog-strix-scar-edition-18-g835lx-s9113-top.png',
  '/products/asus-rog-strix-scar-edition-18-g835lx-s9113-rear.png'
] WHERE slug = 'asus-rog-strix-scar-edition-18-g835lx-s9113';

UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkpad-t14-g6.jpg',
  '/products/lenovo-thinkpad-t14-g6-angle.jpg',
  '/products/lenovo-thinkpad-t14-g6-top.jpg'
] WHERE slug = 'lenovo-thinkpad-t14-g6';

UPDATE products SET images = ARRAY[
  '/products/lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz.webp',
  '/products/lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz-angle.png',
  '/products/lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz-ports.png'
] WHERE slug = 'lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz';

UPDATE products SET images = ARRAY[
  '/products/lenovo-tiny-thinkcenter-neo-50q-13b9004uex.webp',
  '/products/lenovo-tiny-thinkcenter-neo-50q-13b9004uex-angle.jpg',
  '/products/lenovo-tiny-thinkcenter-neo-50q-13b9004uex-front.jpg'
] WHERE slug = 'lenovo-tiny-thinkcenter-neo-50q-13b9004uex';

UPDATE products SET images = ARRAY[
  '/products/canon-clj-mf657cdw-toner-canon-067-bk-c-m-y.jpg',
  '/products/canon-clj-mf657cdw-front.png'
] WHERE slug = 'canon-clj-mf657cdw-toner-canon-067-bk-c-m-y';
