-- Zea formatter corpus for the databricks dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/delta-time-travel
select id from main.sales.orders version as of 12;

-- zea-case: ddl/delta-options
create table main.sales.orders (id bigint, amount decimal(12, 2)) using delta tblproperties ('delta.appendOnly' = 'true');

-- zea-case: ddl/describe-detail
describe detail main.sales.orders;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
