-- Zea formatter corpus for the hive dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/lateral-view
select user_id, tag from events lateral view explode(tags) items as tag;

-- zea-case: ddl/external-partitioned
create external table daily_orders (id bigint, amount decimal(12, 2)) partitioned by (dt string) stored as parquet location 's3://example-bucket/orders/';

-- zea-case: dml/insert-overwrite-partition
insert overwrite table daily_orders partition (dt = '2025-01-01') select id, amount from staging_orders;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
