-- Zea formatter corpus for the starrocks dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/cte
with recent_orders as (select id, customer_id from orders where ordered_on >= date '2025-01-01') select customer_id, count(*) as n from recent_orders group by customer_id;

-- zea-case: ddl/primary-key-distribution
create table daily_orders (id bigint not null, ordered_on date) primary key (id) distributed by hash(id) buckets 8 properties ('replication_num' = '1');

-- zea-case: dml/insert-overwrite
insert overwrite daily_orders partition (p202501) with label daily_import select id, ordered_on from staging_orders;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
