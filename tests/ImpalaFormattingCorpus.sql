-- Zea formatter corpus for the impala dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: ddl/compute-incremental-stats
compute incremental stats daily_orders partition (dt = '2025-01-01');

-- zea-case: ddl/parquet-partitioned
create table daily_orders (id bigint, amount decimal(12, 2)) partitioned by (dt string) stored as parquet;

-- zea-case: ddl/invalidate-metadata
invalidate metadata daily_orders;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
