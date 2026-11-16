-- Zea formatter corpus for the duckdb dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/from-first
from orders select id where id > 7;

-- zea-case: query/wildcard-exclude-rename
select * exclude (internal_id) rename (customer_name as name) from orders;

-- zea-case: query/asof-join
select t.symbol, q.price from trades t asof left join quotes q on t.symbol = q.symbol and t.traded_at >= q.quoted_at;

-- zea-case: query/list-comprehension
select [n * 2 for n in [1, 2, 3] if n > 1] as doubled;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
