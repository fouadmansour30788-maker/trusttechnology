-- Staff price correction for competitor listings (e.g. the scraped price
-- reflects a different bundle/quantity, or a scraping glitch). When set,
-- every comparison uses this instead of the raw scraped price. The sync job
-- never writes this column, so it survives future syncs untouched.
alter table competitor_prices add column if not exists price_override numeric;
