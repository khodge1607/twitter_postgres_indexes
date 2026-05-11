SET maintenance_work_mem = '16GB';
SET max_parallel_maintenance_workers = 79;
SET max_parallel_workers = 80;

CREATE INDEX ON tweets(id_tweets, lang); --for query 3
CREATE INDEX ON tweets USING gin(to_tsvector('english', text)); --for query4
CREATE INDEX ON tweet_tags(tag, id_tweets); --for query 1, 2

CREATE INDEX ON tweets(id_tweets);
CREATE INDEX ON tweet_tags(id_tweets);
