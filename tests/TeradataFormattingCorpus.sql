-- Zea formatter corpus for the teradata dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/qualify
select id from orders qualify row_number() over (partition by customer_id order by id desc) = 1;

-- zea-case: query/locking-for-access
locking row for access sel id from orders where id = 7;

-- zea-case: ddl/volatile-table
create multiset volatile table session_orders (id integer) primary index (id) on commit preserve rows;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
