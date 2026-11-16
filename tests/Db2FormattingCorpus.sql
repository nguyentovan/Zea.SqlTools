-- Zea formatter corpus for the db2 dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/fetch-first
select id from orders order by id fetch first 10 rows only;

-- zea-case: query/uncommitted-read
select id from orders where id = 7 with ur;

-- zea-case: query/values-row
values (current date, current timestamp);

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
