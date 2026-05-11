/*
 * Count the number of English tweets containing the word "coronavirus"
 */
SELECT
    count(*)
FROM tweets
WHERE to_tsvector('english',text)@@to_tsquery('english','coronavirus')
  AND lang='en'
;

--index practice CREATE INDEX ON tweets using gin(to_tsvector(text))
-- because bitmap scan, O(n) would explect bitmap scan to be 3x as long?
