-- Zea formatter corpus for the greenplum dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: ddl/distributed-by
create table daily_orders (id bigint, ordered_on date) distributed by (id);

-- zea-case: ddl/distributed-randomly
create table daily_totals as select ordered_on, sum(amount) as total from orders group by ordered_on distributed randomly;

-- zea-case: ddl/readable-external-table
create readable external table staging_orders (id bigint, ordered_on date) location ('gpfdist://example.org:8080/orders.csv') format 'CSV' (header);

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
