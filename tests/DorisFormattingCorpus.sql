-- Zea formatter corpus for the doris dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: dml/insert-with-label
insert into daily_orders with label daily_import (id, ordered_on) values (7, '2025-01-01');

-- zea-case: ddl/duplicate-key
create table daily_orders (id bigint, ordered_on date) duplicate key (id) distributed by hash(id) buckets 4 properties ('replication_num' = '1');

-- zea-case: ddl/drop-table-force
drop table if exists stage_orders force;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
