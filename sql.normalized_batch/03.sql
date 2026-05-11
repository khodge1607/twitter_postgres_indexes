/*
 * Calculates the languages that use the hashtag #coronavirus
 */
Set enable_seqscan = off;
SELECT
    lang,
    count(DISTINCT id_tweets) as count
FROM tweet_tags
JOIN tweets USING (id_tweets)
WHERE tag='#coronavirus'
GROUP BY lang
ORDER BY count DESC,lang;
SET enable_seqscan = on;

--index = CREATE INDEX ON tweets (id_tweets, lang)
-- CREATE INDEX on tweet_tags (tag, id_tweets)?
