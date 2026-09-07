-- Canon Pixma MG2541S (chassis-family match, region suffix variant)
UPDATE products SET images = ARRAY['/products/canon-pixma-mg2541s-ink-445bk-446-clr.webp', '/products/canon-pixma-mg2541s-front.jpg']
WHERE slug = 'canon-pixma-mg2541s-ink-445bk-446-clr';

-- Canon Pixma G3410 ink tank (exact match)
UPDATE products SET images = ARRAY['/products/canon-pixma-g3410-ink-tank-ink-gi-490-bk-c-m-y.jpg', '/products/canon-pixma-g3410-front.png']
WHERE slug = 'canon-pixma-g3410-ink-tank-ink-gi-490-bk-c-m-y';

-- Canon LBP6030 (exact match, same chassis for both duplicate catalog rows)
UPDATE products SET images = ARRAY['/products/canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a.webp', '/products/canon-lbp6030-front.jpg']
WHERE slug = 'canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a';

UPDATE products SET images = ARRAY['/products/canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a-2.webp', '/products/canon-lbp6030-front.jpg']
WHERE slug = 'canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a-2';

-- Canon imageCLASS LBP236dw (exact match)
UPDATE products SET images = ARRAY['/products/canon-lj-lbp236dw-toner-canon-057.webp', '/products/canon-lbp236dw-front.jpg']
WHERE slug = 'canon-lj-lbp236dw-toner-canon-057';

-- Canon imageCLASS MF3010 (exact match)
UPDATE products SET images = ARRAY['/products/canon-mfp-mf3010-toner-canon-725-or-hp-ce285a.jpg', '/products/canon-mfp-mf3010-front.jpg']
WHERE slug = 'canon-mfp-mf3010-toner-canon-725-or-hp-ce285a';

-- Canon imageCLASS MF275dw (exact match)
UPDATE products SET images = ARRAY['/products/canon-mfp-mf275dw-toner-canon-071.webp', '/products/canon-mfp-mf275dw-front.jpg']
WHERE slug = 'canon-mfp-mf275dw-toner-canon-071';

-- Canon imageCLASS LBP646Cdw (exact match)
UPDATE products SET images = ARRAY['/products/canon-clj-lbp646cdw-toner-canon-075-bk-c-m-y.webp', '/products/canon-clj-lbp646cdw-front.jpg']
WHERE slug = 'canon-clj-lbp646cdw-toner-canon-075-bk-c-m-y';

-- Canon CanoScan LiDE 300 (exact match)
UPDATE products SET images = ARRAY['/products/canon-scanner-lide-300.webp', '/products/canon-scanner-lide-300-front.jpg']
WHERE slug = 'canon-scanner-lide-300';

-- Canon CanoScan LiDE 400 (exact match)
UPDATE products SET images = ARRAY['/products/canon-scanner-lide-400.webp', '/products/canon-scanner-lide-400-front.jpg']
WHERE slug = 'canon-scanner-lide-400';
