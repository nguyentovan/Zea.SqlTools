-- Zea formatter corpus for the redshift dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/qualify
select o.id from orders o qualify row_number() over (partition by o.customer_id order by o.id desc) = 1;

-- zea-case: ddl/distribution-and-sort
create table daily_orders (id bigint, ordered_on date) diststyle key distkey (id) compound sortkey (ordered_on, id);

-- zea-case: query/unload
unload ('select id from orders') to 's3://example-bucket/orders/' iam_role default format as parquet;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
