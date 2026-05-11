SELECT
    tag,
    count(*) as count
FROM (
    SELECT DISTINCT
        data->'id' AS id_tweets,
        '#' || (hashtag->>'text') AS tag
    FROM tweets_jsonb,
        jsonb_array_elements(
            CASE
                WHEN data->'extended_tweet'->'entities'->'hashtags' IS NOT NULL
                THEN data->'extended_tweet'->'entities'->'hashtags'
                ELSE data->'entities'->'hashtags'
            END
        ) AS hashtag
    WHERE data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
       OR data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
) t
WHERE tag LIKE '#%'
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;
