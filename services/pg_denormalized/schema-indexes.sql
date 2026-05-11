SET maintenance_work_mem = '16GB';          
SET max_parallel_maintenance_workers = 79;   
SET max_parallel_workers = 80;              

CREATE INDEX ON tweets_jsonb
USING gin((data->'entities'->'hashtags') jsonb_path_ops);

CREATE INDEX ON tweets_jsonb
USING gin((data->'extended_tweet'->'entities'->'hashtags') jsonb_path_ops);

CREATE INDEX ON tweets_jsonb((data->>'lang'));

CREATE INDEX ON tweets_jsonb
USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));

CREATE INDEX idx_jsonb_id ON tweets_jsonb((data->>'id'));
