-- Zea formatter corpus for the exasol dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/connect-by
select employee_id, level from employees start with manager_id is null connect by prior employee_id = manager_id;

-- zea-case: query/prefer
select id, amount from orders preferring high amount;

-- zea-case: ddl/distribute-by
create table daily_orders (id decimal(18, 0), ordered_on date, distribute by id);

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
