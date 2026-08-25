-- Lenovo batch 1: chassis-grouped. Each family shares one real photo
-- pair sourced from Ayoub Computers (or a verified exact-SKU match
-- elsewhere), reused across every SKU variant in that family since
-- they're the identical physical unit -- only CPU/RAM/region differs,
-- not the industrial design.

-- V15 G5 IRL family (8 SKUs)
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-v15-g5-irl-front.png', '/products/lenovo-v15-g5-irl-rear.png']
WHERE slug IN (
  'lenovo-v15-g5-irl-83hfa08gus', 'lenovo-v15-g5-irl-83hf00emig', 'lenovo-v15-g5-irl-83gw006aeq',
  'lenovo-v15-g5-irl-83hf00e6ig', 'lenovo-v15-g5-irl-83gw006xue', 'lenovo-v15-g5-irl-83gw006xgp',
  'lenovo-v15-g5-irl-83gw0076ue', 'lenovo-v15-g5-irl-83gw0076gp'
);

-- ThinkPad E16 Gen 3 family (5 SKUs)
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-thinkpad-e16-gen-3-front.png', '/products/lenovo-thinkpad-e16-gen-3-angle.png']
WHERE slug IN (
  'lenovo-thinkpad-e16-gen-3', 'lenovo-thinkpad-e16-gen-3-2', 'lenovo-thinkpad-e16-gen-3-21st0014ed',
  'lenovo-thinkpad-e16-gen-3-21tf005bed', 'lenovo-thinkpad-e16-gen-3-3'
);

-- ThinkPad E14 Gen 7 family (4 SKUs)
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-thinkpad-e14-gen-7-front.png', '/products/lenovo-thinkpad-e14-gen-7-angle.png']
WHERE slug IN (
  'lenovo-thinkpad-e14-gen-7-21sx0070ed', 'lenovo-thinkpad-e14-gen-7-21sx001tgq',
  'lenovo-thinkpad-e14-gen-7-21t90053ed', 'lenovo-thinkpad-e14-gen-7'
);

-- IdeaPad Slim 3 15IRH10 family (3 SKUs)
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-ideapad-slim-3-15irh10-front.png', '/products/lenovo-ideapad-slim-3-15irh10-closed.png']
WHERE slug IN (
  'lenovo-ideapad-slim-3-15irh10-83k100e7dp', 'lenovo-ideapad-slim-3-15irh10-83k100c1dp',
  'lenovo-ideapad-slim-3-15irh10-83k100e9ax'
);

-- ThinkCentre Neo 50q Tiny family (2 remaining SKUs, reusing the
-- 13B9004UEX photos added in migration 026)
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-tiny-thinkcenter-neo-50q-13b9004uex-angle.jpg', '/products/lenovo-tiny-thinkcenter-neo-50q-13b9004uex-front.jpg']
WHERE slug IN (
  'lenovo-tiny-thinkcenter-neo-50q-13hr000pex', 'lenovo-tiny-thinkcenter-neo-50q-13b9004sex'
);
