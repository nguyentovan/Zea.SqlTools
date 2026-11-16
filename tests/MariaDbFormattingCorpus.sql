-- Zea formatter corpus for the mariadb dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/system-time
select id from order_history for system_time as of timestamp '2025-01-01 00:00:00';

-- zea-case: dml/insert-returning
insert into orders (id, amount) values (7, 12.50) returning id;

-- zea-case: ddl/sequence
create sequence order_ids start with 1000 increment by 5;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
