-- Zea formatter corpus for the flink dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT id","FROM orders","WHERE id = 7;"]
select id from orders where id=7;

-- zea-case: query/tumble-window
select window_start, window_end, count(*) as n from table(tumble(table orders, descriptor(event_time), interval '5' minute)) group by window_start, window_end;

-- zea-case: query/temporal-join
select o.id, r.rate from orders o join rates for system_time as of o.event_time as r on o.currency = r.currency;

-- zea-case: ddl/watermark
create table orders (id bigint, event_time timestamp(3), watermark for event_time as event_time - interval '5' second) with ('connector' = 'datagen');

-- zea-case: invalid/unclosed-parenthesis
select id from orders where (id = 7;
