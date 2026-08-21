/**
 * Spec keys hidden from customer-facing displays (product cards, detail
 * page). Every product carries the same Warranty/OS/Color/Language values,
 * so showing them crowded out the specs that actually differentiate one
 * product from another. Still stored on the product and editable in admin —
 * this only affects what shoppers see.
 */
export const SPEC_HIDDEN = new Set(['Warranty', 'OS', 'Color', 'Colour', 'Language'])
