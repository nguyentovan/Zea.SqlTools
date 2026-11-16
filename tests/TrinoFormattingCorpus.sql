-- Zea formatter corpus for the trino dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/unnest-with-ordinality
select reading, position from unnest(array[4, 8, 15]) with ordinality as t (reading, position);

-- zea-case: query/lambda-filter
select filter(array[2, 3, 4], n -> n % 2 = 0) as even_numbers;

-- zea-case: ddl/ctas-table-properties
create table hive.sales.orders_parquet with (format = 'PARQUET') as select id, amount from hive.sales.orders;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
