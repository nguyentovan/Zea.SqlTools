-- Zea formatter corpus for the athena dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/unnest-with-ordinality
select reading, position from unnest(array[4, 8, 15]) with ordinality as t (reading, position);

-- zea-case: query/array-lambda
select transform(array[1, 2, 3], n -> n * 2) as doubled;

-- zea-case: ddl/ctas-parquet
create table orders_parquet with (format = 'PARQUET') as select id, amount from orders;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
