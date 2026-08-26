UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkcenter-m70t-gen-5-12u60046gp.webp',
  '/products/lenovo-thinkcenter-m70t-gen-5-angle1.jpg',
  '/products/lenovo-thinkcenter-m70t-gen-5-angle2.jpg'
] WHERE slug = 'lenovo-thinkcenter-m70t-gen-5-12u60046gp';

-- Neo 50t Gen 5 family (3 SKUs, same Black tower chassis)
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-thinkcenter-neo-50t-angle1.png', '/products/lenovo-thinkcenter-neo-50t-angle2.png']
WHERE slug IN ('lenovo-thinkcenter-neo-50t-13bd001wex', 'lenovo-thinkcenter-neo-50t-13bd002wex', 'lenovo-thinkcenter-neo-50t-gen-5-12ud00c2gp');

UPDATE products SET images = ARRAY[
  '/products/lenovo-tiny-thinkcenter-m80q-gen-4-12eas2kn00.webp',
  '/products/lenovo-tiny-thinkcenter-m80q-gen-4-angle1.jpg',
  '/products/lenovo-tiny-thinkcenter-m80q-gen-4-angle2.jpg'
] WHERE slug = 'lenovo-tiny-thinkcenter-m80q-gen-4-12eas2kn00';

-- AiO Neo 50a-24 family (2 SKUs, same Luna Grey chassis)
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-thinkcentre-aio-neo-50a-24-front.png', '/products/lenovo-thinkcentre-aio-neo-50a-24-angle.png']
WHERE slug IN ('lenovo-thinkcentre-aio-neo-50a-24-g6-13qg0016ex', 'lenovo-thinkcentre-aio-neo-50a-24-g5-12sc00anex');
