-- Zea formatter corpus for the snowflake dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/wildcard-exclude-rename
select * exclude (internal_id) rename (customer_name as name) from orders;

-- zea-case: query/qualify
select id from orders qualify row_number() over (partition by customer_id order by id desc) = 1;

-- zea-case: query/lateral-flatten
select e.id, f.value from events e, lateral flatten(input => e.payload:items) f;

-- zea-case: ddl/warehouse
create warehouse analytics_wh with warehouse_size = 'XSMALL' auto_suspend = 60 initially_suspended = true;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
