-- PostgreSQL formatter corpus for Zea.
-- Feed each zea-case independently to the CLI with --dialect postgres.
-- Objects referenced by a case are illustrative. Never execute this corpus against a database.
-- The exclusive group contains PostgreSQL forms outside the other major dialects in this suite.

-- zea-case: select/arithmetic
-- zea-expect: ["SELECT 2 + 3 * 4;"]
select 2+3*4;

-- zea-case: select/constant-boolean
-- zea-expect: ["SELECT TRUE;"]
select true;

-- zea-case: select/bare-projection
-- zea-expect: ["SELECT item_id","FROM items;"]
select item_id from items;

-- zea-case: select/distinct-projection
select distinct category, brand from inventory where retired_at is null;

-- zea-case: select/quoted-identifiers
select "Product ID" as "Item", "Display Name" from sales."Catalog Items";

-- zea-case: select/order-nulls
select sku, backordered_at from inventory order by backordered_at desc nulls last, sku asc;

-- zea-case: select/limit-offset
select event_id,payload from events order by event_id limit 25 offset 50;

-- zea-case: select/fetch-with-ties
select competitor_id,score from standings order by score desc fetch first 3 rows with ties;

-- zea-case: select/first-row-by-key
select distinct on (team_id) team_id, member_id, started_at from roster order by team_id,started_at desc;

-- zea-case: select/multicolumn-aliased-values
select source.item_id,source.label from (values (10,'pen'),(20,'card')) as source(item_id,label);

-- zea-case: select/function-ordinality
select n.value,n.ordinality from unnest(array[11,13,17]) with ordinality as n(value, ordinality);

-- zea-case: select/row-lock
select id from jobs where status = 'ready' order by priority desc for update skip locked;

-- zea-case: joins/inner-composite
select o.id, i.amount from orders o inner join items i on o.id=i.order_id and o.revision=i.revision;

-- zea-case: joins/left-with-filter
select a.id,e.title from accounts a left join events e on e.account_id=a.id and e.active where a.enabled;

-- zea-case: joins/full-using
select account_id,n.entered,o.closed from new_accounts as n full outer join old_accounts as o using (account_id);

-- zea-case: joins/right-join
select f.flight_id,c.airport_code from flights f right outer join airports c on c.airport_code=f.arrival_code;

-- zea-case: joins/natural-key
select region_id,region_name from regions natural join active_regions;

-- zea-case: joins/cross-lateral
select d.id, x.tag from documents d cross join lateral unnest(d.tags) as x(tag);

-- zea-case: joins/lateral-top-row
select a.id, last_event.created_at from accounts a left join lateral (select created_at from events e where e.account_id=a.id order by created_at desc limit 1) last_event on true;

-- zea-case: joins/derived-aggregate
select p.id,s.revenue from products p join (select product_id,sum(amount) as revenue from sale_lines group by product_id) s on s.product_id=p.id;

-- zea-case: joins/parenthesized
select o.id,d.name from orders o left join (customers c inner join districts d on d.id=c.district_id) on c.id=o.customer_id;

-- zea-case: predicates/between-and-membership
select id from offers where percent_off between 5 and 35 and category in ('books','games');

-- zea-case: predicates/correlated-not-exists
select c.id from customers c where not exists (select 1 from invoices i where i.customer_id=c.id and i.paid_at is null);

-- zea-case: predicates/is-distinct-from
select a.id,a.price,b.price from published a join staging b using (id) where a.price is distinct from b.price;

-- zea-case: predicates/mixed-logical-precedence
select id from users where active and (admin or (last_seen is not null and age_days <= 30)) and not banned;

-- zea-case: predicates/case-insensitive-pattern
select title from articles where title ilike 'post\_%' escape '\';

-- zea-case: predicates/regex
select handle from identities where handle ~ '^[a-z][a-z0-9]+$' and handle !~* '^test';

-- zea-case: predicates/any-array
select account_id from subscribers where account_id = any (array[4,9,16]);

-- zea-case: predicates/all-subquery
select subtotal from invoices where subtotal >= all (select subtotal from invoices where voided);

-- zea-case: predicates/row-comparison
select job_id from jobs where (scheduled_at,job_id) > (timestamp '2025-01-02 03:00:00',900);

-- zea-case: predicates/overlapping-dates
select start_date,end_date from bookings where (start_date,end_date) overlaps (date '2025-05-06',date '2025-05-17');

-- zea-case: predicates/truth-tests
select id from filters where enabled is not false and tested is unknown;

-- zea-case: aggregates/group-having
select category,count(*) as total from inventory group by category having count(*) >= 3 order by total desc;

-- zea-case: aggregates/filtered-count
select team_id,count(*) filter (where accepted) as accepted_count,count(*) as proposed from offers group by team_id;

-- zea-case: aggregates/ordered-string-aggregation
select city,string_agg(contact_name,', ' order by contact_name) from contacts group by city;

-- zea-case: aggregates/percentile
select site_id,percentile_cont(0.95) within group (order by latency_ms) from requests group by site_id;

-- zea-case: aggregates/ordered-array
select parent_id,array_agg(child_id order by position,child_id) from edges group by parent_id;

-- zea-case: aggregates/rollup
select department,team,sum(cost) from payroll group by rollup (department,team);

-- zea-case: aggregates/grouping-sets
select department,city,grouping(department,city),sum(cost) from payroll group by grouping sets ((department),(city),());

-- zea-case: aggregates/running-window
select event_date,amount,sum(amount) over (partition by account_id order by event_date rows between unbounded preceding and current row) as running from ledger;

-- zea-case: aggregates/named-window
select score,row_number() over ranked,lag(score,2,0) over ranked from standings window ranked as (partition by season order by score desc);

-- zea-case: aggregates/window-exclusion
select id,sum(value) over (order by group_id groups between 1 preceding and 1 following exclude group) from samples;

-- zea-case: set-cte-case/union-all
select country,code from domestic union all select country,code from international order by country,code;

-- zea-case: set-cte-case/nested-intersect
(select id from enabled except select id from blocked) intersect select id from registered;

-- zea-case: set-cte-case/double-cte
with expenses as (select team_id,sum(total) as spent from invoices group by team_id), planned as (select team_id,budget from plans) select p.team_id,p.budget-e.spent from planned p join expenses e using (team_id);

-- zea-case: set-cte-case/recursive-tree
with recursive lineage(id,parent_id,depth) as (select id,parent_id,0 from nodes where parent_id is null union all select n.id,n.parent_id,l.depth+1 from nodes n join lineage l on l.id=n.parent_id) select id,depth from lineage order by depth,id;

-- zea-case: set-cte-case/cte-materialization
with chosen as materialized (select id from work_items where active), attrs as not materialized (select item_id,color from work_item_attributes) select c.id,a.color from chosen c join attrs a on a.item_id=c.id;

-- zea-case: set-cte-case/simple-case
select case priority when 1 then 'critical' when 2 then 'high' else 'normal' end from tickets;

-- zea-case: set-cte-case/nested-case
select case when payable is null then case when estimate is null then 0 else estimate end when payable < 0 then abs(payable) else payable end as amount from bills;

-- zea-case: set-cte-case/cte-delete-returning
with expired as (delete from tokens where expires_at < current_timestamp returning token_id,customer_id) select customer_id,count(*) from expired group by customer_id;

-- zea-case: literals/date-and-interval
select date '2024-02-29',timestamp '2024-02-29 23:59:00',interval '1 day 2 hours';

-- zea-case: literals/time-zone
select created_at at time zone 'UTC', time with time zone '00:02:03+04:00' from journal;

-- zea-case: literals/numeric-scales
select 7e-3,-12.75, cast('44.125' as numeric(12,3)),cast(20 as double precision);

-- zea-case: literals/quoted-string
-- zea-expect: ["SELECT 'can''t';"]
select 'can''t';

-- zea-case: literals/escape-string
select E'one\ntwo\t\'' as escaped, 'plain\backslash' as plain;

-- zea-case: literals/bit-and-hex
select B'001101' & B'111000', X'1F';

-- zea-case: literals/array-slice
select (array[10,20,30,40])[2:3] as inner_slice;

-- zea-case: literals/row-constructor
select row(8,'open',true) as composite;

-- zea-case: literals/cast-and-json
select payload::jsonb -> 'labels' ->> 0 from records where payload is not null;

-- zea-case: literals/parameterized-prepared-select
prepare ordered_notes (bigint,text) as select id from notes where thread_id=$1 and body like $2 order by id;

-- zea-case: dml/insert-values
insert into cities (id,name,active) values (11,'Hue',true),(12,'Da Nang',false);

-- zea-case: dml/insert-from-select
insert into daily_totals (sales_day,total) select cast(ordered_at as date),sum(total) from orders where ordered_at >= date '2025-10-01' group by cast(ordered_at as date);

-- zea-case: dml/insert-default-values
insert into audit_events default values returning id,recorded_at;

-- zea-case: dml/conflict-do-nothing
insert into subscriptions (account_id,channel_id) values (9,17) on conflict (account_id,channel_id) do nothing;

-- zea-case: dml/conflict-update-predicate
insert into counters as c (key,count) values ('sent',1) on conflict (key) do update set count=c.count+excluded.count where c.count < 100 returning count;

-- zea-case: dml/update-from
update seats s set reserved_by=b.account_id,reserved_at=current_timestamp from bookings b where b.seat_id=s.id and not b.cancelled returning s.id,s.reserved_at;

-- zea-case: dml/update-multiple-columns
update event_series set (starts_at,ends_at) = (timestamp '2025-06-01 14:00',timestamp '2025-06-01 15:00') where series_id=12;

-- zea-case: dml/delete-using
delete from job_log l using retired_jobs r where l.job_id=r.id and l.created_at < r.retired_at returning l.job_id;

-- zea-case: dml/delete-returning
delete from messages where thread_id in (select id from threads where archived_at is not null) returning id,thread_id;

-- zea-case: dml/merge
merge into destination as d using incoming as i on d.key=i.key when matched and i.obsolete then delete when matched then update set amount=i.amount when not matched then insert (key,amount) values (i.key,i.amount);

-- zea-case: dml/transaction-savepoint
begin;
update accounts set enabled=false where id=90;
savepoint after_update;
delete from authorizations where account_id=90;
rollback to savepoint after_update;
commit;

-- zea-case: dml/truncate-restart
truncate table event_queue,session_log restart identity cascade;

-- zea-case: ddl/identity-and-check
create table products (id bigint generated always as identity primary key,sku text not null unique,unit_price numeric(12,2) not null check (unit_price >= 0),created_at timestamptz not null default current_timestamp);

-- zea-case: ddl/composite-foreign-key
create table screen_access (team_id bigint not null, screen_id bigint not null, category_id integer not null, primary key (team_id,screen_id), foreign key (team_id,category_id) references screen_categories (team_id,id) on delete cascade);

-- zea-case: ddl/alter-column
alter table inventory add column reserved integer not null default 0, alter column sku set not null;

-- zea-case: ddl/check-not-valid
alter table shipment add constraint nonnegative_weight check (weight >= 0) not valid;

-- zea-case: ddl/temporary-table
create temporary table selected_ids (id bigint primary key) on commit drop;

-- zea-case: ddl/partial-expression-index
create unique index active_users_lower_email on users (lower(email)) where disabled_at is null;

-- zea-case: ddl/index-include
create index outbound_account_idx on outbound (account_id, sent_at desc) include (message_id,status);

-- zea-case: ddl/view-check-option
create or replace view approved_people as select id,email from people where approved with local check option;

-- zea-case: ddl/materialized-view
create materialized view recent_sales as select customer_id,sum(total) as revenue from invoices group by customer_id with no data;

-- zea-case: ddl/sequence
create sequence invoice_sequence as bigint increment by 5 minvalue 100 start with 100 cache 25 no cycle;

-- zea-case: ddl/partition-parent
create table measures (location_id int, captured_on date not null, reading real) partition by range (captured_on);

-- zea-case: ddl/partition-child
create table measures_2025 partition of measures for values from ('2025-01-01') to ('2026-01-01');

-- zea-case: ddl/domain
create domain positive_quantity as integer check (value > 0);

-- zea-case: ddl/table-like
create table staged_documents (like documents including defaults including constraints);

-- zea-case: ddl/grant-column-update
grant select, update (description) on table public.tasks to operator_role;

-- zea-case: comments/comment-between-tokens
select account_id /* stable ID */,email from accounts where id /* chosen */ = 42;

-- zea-case: comments/inline-and-trailing
select id, -- comment after comma
status from records -- source table
where archived_at is null; -- done

-- zea-case: comments/nested-block
select /* outer /* inner */ continued */ 11;

-- zea-case: comments/literal-shaped-as-comment
select 'NOT -- a comment' as one, '/* still literal */' as two; /* real comment */

-- zea-case: comments/island-between-statements
select 1;
-- the marker below intentionally separates the two statements
/* note: SELECT 'body'; */
select 2;

-- zea-case: comments/eof-line-comment
select name from teams; -- preserve this indented note

-- zea-case: advanced/jsonb-expand
select doc.id,p.key,p.value from documents doc cross join lateral jsonb_each_text(doc.payload) p where p.key like 'owner%';

-- zea-case: advanced/grouped-range
select id from reservations where period && daterange(date '2025-04-10',date '2025-04-17','[)');

-- zea-case: advanced/text-search
select article_id, ts_rank(vector, plainto_tsquery('english', 'data engine')) as rank from articles where vector @@ plainto_tsquery('english','data engine') order by rank desc;

-- zea-case: advanced/tablesample
select event_id,user_id from events tablesample system (2.5) repeatable (19) where user_id > 5;

-- zea-case: advanced/update-array
update recipes set ingredients=array_append(ingredients,'lemon') where id=55 and not ('lemon' = any (ingredients));

-- zea-case: advanced/xml-construction
select xmlelement(name entry, xmlattributes(event_id as id), title) from events;

-- zea-case: advanced/array-subquery
select d.id,array(select a.slug from article a where a.directory_id=d.id order by a.slug) from directories d;

-- zea-case: advanced/collate
select name from users where name is not null order by name collate "C";

-- zea-case: procedural/sql-function
create function plus_one(val integer) returns integer language sql immutable as $sql$ select val + 1; $sql$;

-- zea-case: procedural/anonymous-block
do $body$
declare
    total integer := 2;
begin
    total := total + 3;
    if total > 3 then
        raise notice 'total: %', total;
    end if;
end;
$body$ language plpgsql;

-- zea-case: procedural/set-returning-function
create function labels(prefix text) returns table(id bigint, caption text) language sql stable as $fn$
select label_id, prefix || description from item_labels order by label_id;
$fn$;

-- zea-case: procedural/function-with-exception
create function parse_score(raw text) returns integer language plpgsql as $func$
begin
    return raw::integer;
exception when invalid_text_representation then
    return null;
end;
$func$;

-- zea-case: procedural/call-procedure
call process_monthly_snapshot(date '2025-01-01', true);

-- zea-case: procedural/execute-prepared
execute ordered_notes (900,'%router%');

-- zea-case: procedural/close-cursor
close report_cursor;

-- zea-case: stress/nested-correlated-ranks
with eligible as (select u.id from users u where u.active and exists (select 1 from teams t where t.id=u.team_id and exists (select 1 from open_regions r where r.id=t.region_id))),
ranked as (select e.id,e.payload,row_number() over (partition by e.user_id order by e.created_at desc,e.id desc) as rnk from events e join eligible u on u.id=e.user_id)
select q.id,q.payload from (select id,payload from ranked where rnk=1 union all select id,payload from legacy_events where migrated) q order by q.id limit 200;

-- zea-case: stress/nested-case-and-array
select s.id,case when coalesce(s.score,0)=0 then s.old_score
                 when exists (select 1 from sanctions c where c.subject_id=s.id and c.reason = any (array['a','b','c'])) then 0
                 else s.score + coalesce((select max(delta) from bonus where member_id=s.id),0)
            end as adjusted_score
from (select id,score,old_score from members where last_seen > current_date - interval '10 days') s
order by adjusted_score desc nulls last;

-- zea-case: stress/data-modification-pipeline
with removed as (delete from pending_orders where placed_on < current_date - 30 returning id,order_total),
audit as (insert into order_archive (id,total) select id,order_total from removed returning id)
select id from audit where id in (select id from removed where order_total > 100);

-- zea-case: stress/recursive-path-with-array
with recursive crawl(id,path,depth) as (
    select id,array[id],1 from hierarchy where parent_id is null
    union all
    select child.id,parent.path || child.id,parent.depth+1 from hierarchy child join crawl parent on child.parent_id=parent.id
    where not child.id = any (parent.path) and parent.depth < 12
) select id,depth,cardinality(path) as path_length from crawl order by path;

-- zea-case: stress/nested-cte-dispatch
with regional as (select region_id,max(total) as top_total from billing group by region_id),
rated as (select bill_id,region_id,dense_rank() over (partition by region_id order by total desc) as rank_no from billing)
select r.region_id,d.bill_id,r.top_total
from regional r join lateral (select bill_id from rated b where b.region_id=r.region_id and b.rank_no=1 order by bill_id) d on true
where exists (select 1 from permitted_regions p where p.id=r.region_id)
order by r.region_id,d.bill_id;

-- zea-case: exclusive/copy-query-to-stdout
copy (select sku,description from products order by sku) to stdout with (format csv, header true, delimiter ';');

-- zea-case: exclusive/row-security-policy
create policy owned_records on records for select to member_role using (owner_name = current_user);

-- zea-case: exclusive/analyze-vacuum-options
vacuum (analyze, verbose) shipping_events;

-- zea-case: exclusive/transaction-notification
listen dispatch_updates;
notify dispatch_updates, 'ready';
unlisten dispatch_updates;

-- zea-case: exclusive/explain-with-buffers
explain (analyze, buffers, format json) select category,count(*) from inventory group by category;

-- zea-case: exclusive/locking-target-row
select q.id from queue_items q where picked_up_at is null order by q.id for no key update of q skip locked;

-- zea-case: exclusive/jsonb-gin-operator-class
create index events_payload_search on events using gin (payload jsonb_path_ops);

-- zea-case: exclusive/plpgsql-anonymous-raise
do $workflow$ begin perform set_config('application_name', 'format probe', true); raise notice 'workflow complete'; end; $workflow$;

-- zea-case: exclusive/postgres-enum-type
create type support_priority as enum ('low','normal','critical');

-- zea-case: exclusive/policy-enablement
alter table project_tasks enable row level security;

-- zea-case: exclusive/refresh-concurrently
refresh materialized view concurrently recent_sales;

-- zea-case: exclusive/special-string-and-array-slice
select ($tag$teal'"\--$tag$::text), (array[1,2,3,4])[2:3];

-- zea-case: exclusive/nested-postgres-limit
with orders(customer_id,amount,status) as (
    values (1,120,'paid'),(1,80,'new'),(2,90,'paid'),(2,140,'paid'),(3,60,'paid')
), summary as (
    select customer_id,sum(amount) filter (where status='paid') as paid_total
    from orders
    group by customer_id
)
select r.customer_id,r.paid_total::numeric(10,2) as paid_total,r.customer_rank
from (
    select s.*,dense_rank() over(order by s.paid_total desc) as customer_rank
    from summary s
    where exists (
        select 1 from orders o
        where o.customer_id=s.customer_id
          and o.amount>(select avg(x.amount) from orders x where x.status='paid')
    )
) r
where r.customer_rank<=3
order by r.customer_rank,r.customer_id
limit 5;

-- zea-case: invalid/unterminated-string
select 'unterminated;

-- zea-case: invalid/unclosed-cte
with active as (select id from product select id from active;

-- zea-case: invalid/malformed-merge
merge into target t using changes c on t.id = c.id when matched then update set;

-- zea-case: invalid/missing-assignment-expression
update events set status= where id=7;

-- zea-case: invalid/unmatched-lateral-join
select * from records r join lateral (select 2) q on ;

-- zea-case: invalid/incomplete-case
select case when enabled then from products;

-- zea-case: invalid/empty-returning
delete from products where id=99 returning ;

-- zea-case: invalid/unfinished-index-expression
create index bad_item_idx on items (lower(name);

-- zea-case: invalid/unclosed-dollar-quote
do $routine$ begin raise notice 'x'; end;

-- zea-case: invalid/incomplete-array-constructor
select array[1,2, from data_values;

-- zea-case: comments/multiline-indented
-- zea-expect: ["/* Report ;", "   Second line -- literal.", "   Last line. */", "SELECT 1;"]
/* Report ;
   Second line -- literal.
   Last line. */
select 1;

-- zea-case: comments/multiline-nested
-- zea-expect: ["/* Outer ;", "   /* Inner ; */", "   Outer again. */", "SELECT 1;"]
/* Outer ;
   /* Inner ; */
   Outer again. */
select 1;

-- zea-case: comments/lateral-with-mixed-comments
-- zea-expect: ["-- Lấy đơn đã thanh toán gần nhất của mỗi khách hàng đang hoạt động.", "/* LEFT JOIN LATERAL giữ cả khách hàng chưa có đơn.", "   Dấu ; và từ khóa LIMIT trong comment chỉ là văn bản. */", "SELECT c.customer_id", "    ,c.name", "    ,x.order_id", "    ,/* Làm tròn số tiền đến hai chữ số thập phân. */", "    x.total::NUMERIC(12, 2) AS paid_total", "FROM customers c", "LEFT JOIN LATERAL (", "        -- Truy vấn con dùng customer_id của dòng bên ngoài.", "        SELECT o.order_id", "            ,o.total", "        FROM orders o", "        WHERE o.customer_id = c.customer_id", "            AND o.status = 'paid'", "        ORDER BY o.created_at DESC", "            ,o.order_id DESC", "        LIMIT 1 -- Chỉ lấy đơn đầu tiên sau khi sắp xếp.", "        ) x ON TRUE", "WHERE c.is_active IS TRUE", "ORDER BY c.customer_id;-- Sắp xếp kết quả cuối."]
-- Lấy đơn đã thanh toán gần nhất của mỗi khách hàng đang hoạt động.
/* LEFT JOIN LATERAL giữ cả khách hàng chưa có đơn.
   Dấu ; và từ khóa LIMIT trong comment chỉ là văn bản. */
select c.customer_id,c.name,
x.order_id, /* Làm tròn số tiền đến hai chữ số thập phân. */
x.total::numeric(12,2) as paid_total
from customers c
left join lateral (
    -- Truy vấn con dùng customer_id của dòng bên ngoài.
    select o.order_id,o.total from orders o
    where o.customer_id=c.customer_id and o.status='paid'
    order by o.created_at desc,o.order_id desc
    limit 1 -- Chỉ lấy đơn đầu tiên sau khi sắp xếp.
) x on true
where c.is_active is true
order by c.customer_id; -- Sắp xếp kết quả cuối.
