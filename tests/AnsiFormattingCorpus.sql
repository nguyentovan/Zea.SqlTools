-- Zea formatter corpus for the ansi dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/standard-pagination
select id from orders order by id offset 5 rows fetch next 10 rows only;

-- zea-case: query/standard-date
select id from orders where ordered_at >= date '2025-01-01';

-- zea-case: query/recursive-cte
with recursive sequence (n) as (select 1 union all select n + 1 from sequence where n < 5) select n from sequence;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
