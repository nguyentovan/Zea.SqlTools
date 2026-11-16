-- Zea formatter corpus for the sparksql dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/lateral-view
select event_id, tag from events lateral view outer explode(tags) exploded as tag;

-- zea-case: query/distribution
select id, customer_id from orders distribute by customer_id sort by id desc;

-- zea-case: ddl/using-parquet
create table daily_orders (id bigint, amount decimal(12, 2), dt date) using parquet partitioned by (dt);

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
