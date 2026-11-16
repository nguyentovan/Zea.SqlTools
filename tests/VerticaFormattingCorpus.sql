-- Zea formatter corpus for the vertica dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/limit-over
select id, customer_id from orders limit 2 over (partition by customer_id order by amount desc);

-- zea-case: ddl/segmented-projection
create projection orders_by_id as select id, customer_id from orders order by id segmented by hash(id) all nodes;

-- zea-case: dml/copy-from-stdin
copy orders (id, customer_id) from stdin delimiter ',' abort on error;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
