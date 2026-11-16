-- Zea formatter corpus for the bigquery dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/star-except-replace
select * except (internal_id) replace (upper(city) as city) from `demo.sales.orders`;

-- zea-case: query/unnest-with-offset
select item, position from unnest([10, 20]) as item with offset as position;

-- zea-case: query/qualify
select id from orders qualify row_number() over (partition by customer_id order by id desc) = 1;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
