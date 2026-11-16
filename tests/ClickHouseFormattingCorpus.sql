-- Zea formatter corpus for the clickhouse dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/final-prewhere
select id, amount from orders final prewhere id > 100 where amount > 0;

-- zea-case: query/limit-by
select id, customer_id from orders order by amount desc limit 2 by customer_id;

-- zea-case: ddl/merge-tree
create table daily_orders (id UInt64, ordered_on Date) engine = MergeTree() partition by toYYYYMM(ordered_on) order by (ordered_on, id);

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
