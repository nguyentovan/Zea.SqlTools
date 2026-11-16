-- Zea formatter corpus for the materialize dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: ddl/materialized-view-in-cluster
create materialized view daily_totals in cluster analytics as select ordered_on, sum(amount) as total from orders group by ordered_on;

-- zea-case: ddl/default-index-in-cluster
create default index in cluster analytics on orders;

-- zea-case: ddl/show-materialized-views
show materialized views from reporting.sales in cluster analytics;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
