-- SQLite formatter corpus. Format each marked case independently.
-- Exclusive cases exercise SQLite-specific grammar. Invalid cases contain deliberate syntax errors.

-- zea-case: select/scalar
-- zea-expect: ["SELECT 1;"]
  select 1;

-- zea-case: select/leading-commas
-- zea-expect: ["SELECT 1 AS a", "    ,2 AS b;"]
select 1 as a, 2 as b;

-- zea-case: select/where-order
-- zea-expect: ["SELECT id", "    ,name", "FROM logs", "WHERE id = 1", "ORDER BY name;"]
select id,name from logs where id=1 order by name;

-- zea-case: select/quoted-identifiers
select "Order", [Group], `Value` from "odd names" as "t 1";

-- zea-case: select/blob-and-hex
select x'001fFF' as packet, 0x2a as integer_hex, typeof(x'00') as storage_class;

-- zea-case: select/unicode-text
select 'Tiếng Việt' as greeting, 'it''s SQLite' as escaped, 'line
break' as multiline;

-- zea-case: select/boolean-and-null
select true as yes, false as no, null as unknown, null is null as same_value;

-- zea-case: select/unary-and-operators
select - 4 as negative, ~7 as inverted, (24 >> 2) | (1 << 3) as bits, 27 % 5 as remainder;

-- zea-case: select/case-and-coalesce
select case when paid = 1 then coalesce(total, 0) when paid is null then -1 else 0 end as net from sales;

-- zea-case: select/parameter-styles
select ?1 as positional, :city as colon_name, @zone as at_name, $region as dollar_name;

-- zea-case: select/concat-and-pattern
select id,name || '_backup' as saved_name from logs where name glob '[A-Z]*' and name not like '%!_%' escape '!';

-- zea-case: select/reversed-like
select name from logs where 'log' is not null and lower(name) like 'log%';

-- zea-case: select/ordering-nulls
select id,deleted_at from logs order by deleted_at desc nulls last, id asc limit 12 offset 3;

-- zea-case: select/comma-limit
select id from logs order by id limit 3, 12;

-- zea-case: select/values-table
values (1, 'one'), (2, 'two'), (3, 'three');

-- zea-case: select/json-extraction
select '{"a":[1,2]}' -> '$.a' as array_json, '{"a":9}' ->> '$.a' as direct_value;

-- zea-case: select/dates-and-affinity
select date('2025-01-31','start of month','+1 month'), unixepoch('2025-01-01'), cast('017' as numeric);

-- zea-case: select/collation
select distinct name collate nocase from logs order by name collate rtrim;

-- zea-case: join/inner
select l.id,t.name from logs l join tags t on t.id=l.tag_id and t.name <> '' where l.id > 3;

-- zea-case: join/with-using
select l.id,t.name from logs l left outer join tags t using(id) order by l.id;

-- zea-case: join/natural
select l.id,l.name from logs l natural left join tags t;

-- zea-case: join/cross-table-function
select l.id,j.key,j.value from logs l cross join json_each(l.payload) j;

-- zea-case: join/derived-table
select l.id,f.n from logs l left join (select tag_id,count(*) as n from logs group by tag_id) f on f.tag_id=l.tag_id;

-- zea-case: join/three-way
select l.id,t.name,s.total from logs l inner join tags t on t.id=l.tag_id left join sales s on s.customer_id=t.id;

-- zea-case: join/right
select t.id,l.name from logs l right outer join tags t on l.tag_id=t.id;

-- zea-case: join/full
select coalesce(l.id,t.id) from logs l full outer join tags t on l.id=t.id;

-- zea-case: join/parenthesized-source
select l.id,t.name from (logs l inner join tags t on l.tag_id=t.id) where l.id > 1;

-- zea-case: join/without-index
select id,name from logs not indexed where id > 20;

-- zea-case: query/scalar-subqueries
select l.id,(select max(s.total) from sales s where s.customer_id=l.id) as top_sale from logs l;

-- zea-case: query/exists
select id from tags t where exists(select 1 from logs l where l.tag_id=t.id) and not exists(select 1 from sales s where s.customer_id=t.id);

-- zea-case: query/tuple-membership
select l.id from logs l where (l.tag_id,l.id) in (select customer_id,id from sales);

-- zea-case: query/compound
select id as value from tags union all select customer_id from sales union select tag_id from logs order by value;

-- zea-case: query/set-filters
select id from tags intersect select tag_id from logs except select customer_id from sales;

-- zea-case: query/group-having
select tag_id,count(*) as events,max(id) as last_id from logs group by tag_id having count(*) > 1 order by events desc;

-- zea-case: query/aggregate-filter
select count(*) filter(where paid=1) as paid, sum(total) filter(where paid=0) as pending from sales;

-- zea-case: query/aggregate-order-distinct
select group_concat(name, '/' order by id desc) as names, count(distinct tag_id) as distinct_tags from logs;

-- zea-case: query/json-group
select tag_id,json_group_array(json_object('id',id,'name',name)) as payload from logs group by tag_id;

-- zea-case: query/window-row-number
select id,row_number() over(partition by tag_id order by id desc) as rn from logs;

-- zea-case: query/window-rows-frame
select id,sum(total) over(partition by customer_id order by id rows between 2 preceding and current row) as rolling from sales;

-- zea-case: query/window-named
select id,lag(total,1,0) over previous as prev, lead(total) over previous as next from sales window previous as (partition by customer_id order by id);

-- zea-case: query/window-range-frame
select id,max(total) over(order by id range between unbounded preceding and 2 following) from sales;

-- zea-case: query/window-exclude
select id,sum(total) over(order by customer_id groups between 1 preceding and current row exclude ties) from sales;

-- zea-case: cte/single
with active as (select id,name from logs where deleted_at is null) select id from active order by name;

-- zea-case: cte/chained
with filtered as (select id,tag_id from logs where tag_id is not null), ranked as (select id,row_number() over(partition by tag_id order by id) as rn from filtered) select id from ranked where rn=1;

-- zea-case: cte/column-name-list
with bounds(lo,hi) as (values(1,20)) select id from logs,bounds where id between lo and hi;

-- zea-case: cte/recursive-counter
with recursive seq(n) as (values(1) union all select n+1 from seq where n < 8) select n,n*n as square from seq;

-- zea-case: cte/recursive-graph
with recursive path(id,trail,depth) as (
  select id,printf('/%d/',id),0 from nodes where parent_id is null
  union all
  select n.id,p.trail || n.id || '/',p.depth+1
  from path p join nodes n on n.parent_id=p.id
  where p.depth < 6 and instr(p.trail,printf('/%d/',n.id))=0
)
select id,trail,depth from path order by trail;

-- zea-case: cte/materialized
with filtered as materialized (select id from logs where deleted_at is null) select count(*) from filtered;

-- zea-case: cte/not-materialized
with base as not materialized (select id,tag_id from logs) select * from base where tag_id=3;

-- zea-case: cte/recursive-dates
with recursive calendar(day) as (
  values('2025-01-01')
  union all
  select date(day,'+1 day') from calendar where day<'2025-01-07'
)
select day from calendar;

-- zea-case: ddl/create-simple
create table profiles(id integer primary key,name text not null, email text unique);

-- zea-case: ddl/autoincrement-affinity
create table sequence_log(id integer primary key autoincrement,stamp text default current_timestamp,amount numeric(12,2));

-- zea-case: ddl/generated-columns
create table order_lines(unit_price real not null, qty integer not null check(qty > 0), net real generated always as (unit_price*qty) stored, label text as (printf('%d',qty)) virtual);

-- zea-case: ddl/table-constraint
create table codebook(kind text not null, code text not null, label text, constraint pk_cb primary key(kind,code), constraint ck_len check(length(code)>0));

-- zea-case: ddl/references-and-deferral
create table children(id integer primary key,parent_id integer, foreign key(parent_id) references nodes(id) on delete cascade on update set null deferrable initially deferred);

-- zea-case: ddl/default-expression
create table audit_log(id integer primary key, raw blob default x'00', stamp text default (strftime('%Y-%m-%dT%H:%M:%S','now')));

-- zea-case: ddl/temporary-table-as
create temp table tmp_logs as select id,name from logs where id < 10;

-- zea-case: ddl/strict
create table sensor_rows(id integer primary key, temperature real, payload blob) strict;

-- zea-case: ddl/unique-conflict-clause
create table local_aliases(tag text primary key on conflict rollback, label text not null on conflict fail, unique(label) on conflict ignore);

-- zea-case: ddl/create-view
create view if not exists elevated_sales(customer_id, gross) as select customer_id,sum(total) from sales group by customer_id having sum(total)>50;

-- zea-case: ddl/drop-view
drop view if exists recent_sales;

-- zea-case: ddl/expression-index
create index if not exists ix_logs_email on logs(lower(name) collate nocase);

-- zea-case: ddl/partial-index
create unique index active_log_name on logs(name collate nocase) where deleted_at is null;

-- zea-case: ddl/drop-index
drop index if exists ix_obsolete;

-- zea-case: ddl/rename-table
alter table logs rename to archive_logs;

-- zea-case: ddl/rename-column
alter table sales rename column paid to is_paid;

-- zea-case: ddl/add-column
alter table logs add column label text not null default 'untagged';

-- zea-case: ddl/drop-column
alter table logs drop column payload;

-- zea-case: ddl/drop-table
drop table if exists temp.old_cache;

-- zea-case: dml/insert-values
-- zea-expect: ["INSERT INTO tags (", "    id", "    ,name", "    )", "VALUES (", "    1", "    ,'first'", "    );"]
insert into tags(id,name) values(1,'first');

-- zea-case: dml/insert-multiple
insert into tags(id,name) values (11,'blue'),(12,'green'),(13,'red');

-- zea-case: dml/default-values
insert into logs default values;

-- zea-case: dml/insert-from-select
insert into archived(id,name) select id,name from logs where deleted_at is not null order by id;

-- zea-case: dml/upsert-update
insert into tags(id,name) values(1,'one') on conflict(id) do update set name=excluded.name where tags.name <> excluded.name;

-- zea-case: dml/upsert-nothing
insert into tags(id,name) values(1,'ignored') on conflict(id) do nothing;

-- zea-case: dml/upsert-multiple-targets
insert into uniques(id,code,label) values(1,'a','x') on conflict(id) do update set label=excluded.label on conflict(code) do nothing;

-- zea-case: dml/insert-returning
insert into tags(id,name) values(1,'new') returning id, name as label;

-- zea-case: dml/update-where
-- zea-expect: ["UPDATE tags", "SET name = 'next'", "WHERE id = 1;"]
update tags set name='next' where id=1;

-- zea-case: dml/update-tuple
update logs set (tag_id,name)=(3,'retagged') where id=1;

-- zea-case: dml/update-from
update logs as l set name=t.name from tags as t where l.tag_id=t.id and l.name is null;

-- zea-case: dml/update-returning
update sales set paid=1,total=round(total,2) where paid=0 returning id,total;

-- zea-case: dml/update-from-cte
with expired as (select id from logs where deleted_at < '2024-01-01') update logs set name='archived' where id in (select id from expired);

-- zea-case: dml/delete-subquery
delete from logs where tag_id not in (select id from tags);

-- zea-case: dml/delete-returning
delete from sales where total=0 returning id,customer_id;

-- zea-case: dml/delete-cte
with retired as (select tag_id from logs where deleted_at < '2020-01-01') delete from tags where id in (select tag_id from retired);

-- zea-case: dml/replace
replace into tags(id,name) values(3,'replaced');

-- zea-case: transaction/deferred
begin deferred transaction; select id from tags; commit;

-- zea-case: transaction/immediate
begin immediate; update tags set name='pending' where id=7; rollback;

-- zea-case: transaction/exclusive
begin exclusive transaction; delete from tags where id<0; end transaction;

-- zea-case: transaction/savepoint
savepoint import_tags; insert into tags(id,name) values(10,'pending'); release savepoint import_tags;

-- zea-case: transaction/rollback-to
savepoint cleanup; delete from tags where id=5; rollback transaction to savepoint cleanup; release cleanup;

-- zea-case: transaction/nested-savepoints
savepoint outer_tx;
update tags set name='outer' where id=1;
savepoint inner_tx;
update tags set name='inner' where id=2;
rollback to inner_tx;
release inner_tx;
release outer_tx;

-- zea-case: procedural/after-insert
create trigger if not exists log_created after insert on logs
begin
  insert into archived(id,name) values(new.id,new.name);
end;

-- zea-case: procedural/after-update-when
create trigger log_changed after update of name on logs for each row when old.name is not new.name
begin
  insert into archived(id,name) values(old.id,old.name);
  update tags set name=new.name where id=new.tag_id;
end;

-- zea-case: procedural/before-delete
create temp trigger cleanup_sale before delete on sales for each row
begin
  delete from archived where id=old.id;
end;

-- zea-case: procedural/instead-of
create trigger recent_sales_remove instead of delete on recent_sales
begin
  delete from sales where id=old.id;
end;

-- zea-case: procedural/drop-trigger
drop trigger if exists log_created;

-- zea-case: procedural/script-with-trigger
create table stack_items(id integer primary key, value text);
create table stack_dim(n integer not null);
create trigger stack_items_count after insert on stack_items
begin
  update stack_dim set n=n+1;
end;
insert into stack_dim values(0);
insert into stack_items values(1,'top');

-- zea-case: comments/inline-block
select /* calculated */ id -- stable identifier
,name from logs /* active only */ where deleted_at is null;

-- zea-case: comments/trailing-no-semicolon
select name from tags -- keep this comment

-- zea-case: comments/quotes-hide-comment-markers
select '-- not an inline comment' as a, '/* still just text */' as b, '😀' as c;

-- zea-case: comments/compound-leading
-- Gather identifiers before choosing the ordering.
select id from logs
/* combine both data sets */
union all
select id from tags
-- stable output order
order by id;

-- zea-case: comments/empty-blocks-and-line
select/**/id from tags -- names can be null
where name is not null /* but keep this note */;

-- zea-case: comments/trigger-body
create trigger tags_audit after delete on tags
begin
-- Copy the deleted row.
insert into archived(id,name) values(old.id,old.name); /* write complete */
end;

-- zea-case: comments/multi-statement
/* first query */ select 1; -- end first
-- second query
select ';' as literal_semicolon; /* end second */

-- zea-case: exclusive/pragma-query
pragma main.table_xinfo('logs');

-- zea-case: exclusive/pragma-assignment
pragma foreign_keys = on;

-- zea-case: exclusive/attach-database
attach database ':memory:' as aux;

-- zea-case: exclusive/detach-database
attach database ':memory:' as scratch;
detach database scratch;

-- zea-case: exclusive/vacuum-into
vacuum main into ':memory:';

-- zea-case: exclusive/without-rowid-strict
create table composite_keys(a integer,b text,primary key(a,b)) without rowid, strict;

-- zea-case: exclusive/insert-or-ignore
insert or ignore into tags(id,name) values(1,'already indexed');

-- zea-case: exclusive/update-or-fail
update or fail tags set name='unique' where id=1;

-- zea-case: exclusive/virtual-table-fts5
create virtual table articles using fts5(title, body, tokenize='unicode61');

-- zea-case: exclusive/indexed-by
select id,name from logs indexed by ix_logs_tag where tag_id=4;

-- zea-case: exclusive/explain-query-plan
explain query plan select id from logs where tag_id=3;

-- zea-case: exclusive/trigger-raise
create trigger no_empty_tag before insert on tags when new.name=''
begin
  select raise(abort,'tag name required');
end;

-- zea-case: stress/nested-condition
select id from logs where ((id between 1 and 10 and (name is not null or tag_id in (1,3,5))) or ((id > 20 and id < 100) and (not (tag_id is null and deleted_at is null)))) and (coalesce(name,'') not like 'ignore%' or id=50);

-- zea-case: stress/batch
create table pipeline(id integer primary key,payload text);
begin immediate;
insert into pipeline values(1,'{"n":2}'),(2,'{"n":5}'),(3,'{"n":8}');
savepoint increment;
update pipeline set payload=json_set(payload,'$.n',json_extract(payload,'$.n')+1) where id>1;
release increment;
commit;
select id,json_extract(payload,'$.n') as n from pipeline order by n;

-- zea-case: stress/two-recursive-terms
with recursive powers(n,p,q) as (values(0,1,1) union all select n+1,p*2,q*3 from powers where n<12), totals as (select n,p+q as total from powers) select n,total,sum(total) over(order by n rows between unbounded preceding and current row) as aggregate from totals;

-- zea-case: stress/wide-projection
select id,name,tag_id,payload,deleted_at,length(name) as name_size,upper(name) as upper_name,lower(name) as lower_name,trim(name) as trimmed_name,substr(name,1,4) as prefix,instr(name,'x') as x_at,coalesce(tag_id,0) as normalized_tag,quote(name) as quoted_name,typeof(payload) as payload_type,hex(payload) as payload_hex,json_valid(payload) as valid_payload from logs order by id;

-- zea-case: stress/bulk-values
insert into tags(id,name) values
(1,'one'),(2,'two'),(3,'three'),(4,'four'),(5,'five'),(6,'six'),
(7,'seven'),(8,'eight'),(9,'nine'),(10,'ten'),(11,'eleven'),(12,'twelve'),
(13,'thirteen'),(14,'fourteen'),(15,'fifteen'),(16,'sixteen'),(17,'seventeen'),(18,'eighteen'),
(19,'nineteen'),(20,'twenty'),(21,'twenty-one'),(22,'twenty-two'),(23,'twenty-three'),(24,'twenty-four'),
(25,'twenty-five'),(26,'twenty-six'),(27,'twenty-seven'),(28,'twenty-eight'),(29,'twenty-nine'),(30,'thirty');

-- zea-case: invalid/missing-select-expression
select from logs;

-- zea-case: invalid/unclosed-string
select 'SQLite;

-- zea-case: invalid/unclosed-parentheses
select (1 + (2 * 3);

-- zea-case: invalid/empty-update-assignment
update tags set name= where id=1;

-- zea-case: invalid/trigger-without-end
create trigger incomplete after insert on tags begin select 1;

-- zea-case: invalid/truncated-cte
with example as (select 1) only;

-- zea-case: invalid/trailing-insert-comma
insert into tags(id,name) values(1,'one'),;

-- zea-case: invalid/truncated-window-frame
select sum(total) over(order by id rows between current row and) from sales;

-- zea-case: comments/multiline-indented
-- zea-expect: ["/* Report ;", "   Second line -- literal.", "   Last line. */", "SELECT 1;"]
/* Report ;
   Second line -- literal.
   Last line. */
select 1;

-- zea-case: invalid/nested-block-comments
/* Outer ;
   /* Inner ; */
   Outer again. */
select 1;

-- zea-case: select/implicit-column-used-in-subquery
-- zea-expect: ["SELECT v.\"1+2\"", "FROM (", "        SELECT 1+2", "        ) AS v;"]
SELECT v."1+2" FROM (SELECT 1+2) AS v;

-- zea-case: select/implicit-column-with-inline-comment
-- zea-expect: ["SELECT v.\"1+ /* unit */ 2\"", "FROM (", "        SELECT 1+ /* unit */ 2", "        ) AS v;"]
select v."1+ /* unit */ 2" from (select 1+ /* unit */ 2) as v;

-- zea-case: select/implicit-and-aliased-result-columns
-- zea-expect: ["SELECT 1+2", "    ,4 + 5 AS named_sum;"]
select 1+2,4+5 as named_sum;

-- zea-case: dml/returning-implicit-result-name
-- zea-expect: ["UPDATE tags", "SET name = 'next'", "WHERE id = 1", "RETURNING id+2", "    ,id + 3 AS named_id;"]
update tags set name='next' where id=1 returning id+2,id+3 as named_id;

-- zea-case: select/implicit-column-with-trailing-comment
-- zea-expect: ["SELECT v.\"1+2    /* tail */\"", "FROM (", "        SELECT 1+2    /* tail */", "        ) AS v;"]
SELECT v."1+2    /* tail */" FROM (SELECT 1+2    /* tail */) AS v;

-- zea-case: select/implicit-column-at-eof-comment
-- zea-expect: ["SELECT 1+2     -- tail"]
select 1+2     -- tail

-- zea-case: comments/noformat-with-implicit-column
-- zea-expect: ["SELECT 1+/*[noformat]*/2,4+5 AS named /*[/noformat]*/;"]
SELECT 1+/*[noformat]*/2,4+5 AS named /*[/noformat]*/;

-- zea-case: ddl/declared-type-metadata
-- zea-expect: ["CREATE TABLE type_metadata (", "    amount numeric(12,2)", "    ,weight DOUBLE     PRECISION", "    );", "", "PRAGMA table_xinfo ('type_metadata');"]
create table type_metadata(amount numeric(12,2), weight DOUBLE     PRECISION);
pragma table_xinfo('type_metadata');

-- zea-case: ddl/default-expression-metadata
-- zea-expect: ["CREATE TABLE default_metadata (", "    id integer DEFAULT -  5", "    ,label text DEFAULT (printf('%d',2+3))", "    );", "", "INSERT INTO default_metadata DEFAULT VALUES;", "", "SELECT id", "    ,label", "FROM default_metadata;", "", "PRAGMA table_xinfo ('default_metadata');"]
create table default_metadata(id integer default -  5, label text default (printf('%d',2+3)));
insert into default_metadata default values;
select id,label from default_metadata;
pragma table_xinfo('default_metadata');

-- zea-case: ddl/add-column-metadata
-- zea-expect: ["CREATE TABLE altered_metadata (id integer);", "", "ALTER TABLE altered_metadata ADD COLUMN fee numeric( 12,2 ) DEFAULT +  4;", "", "PRAGMA table_xinfo ('altered_metadata');"]
create table altered_metadata(id integer);
alter table altered_metadata add column fee numeric( 12,2 ) default +  4;
pragma table_xinfo('altered_metadata');

-- zea-case: ddl/declared-type-suffix-metadata
-- zea-expect: ["CREATE TABLE suffix_metadata (", "    a double    precision /* affinity */ (10)", "    ,b unsigned   big int(2,5)", "    );", "", "ALTER TABLE suffix_metadata ADD COLUMN c double  precision(7,2);", "", "PRAGMA table_xinfo ('suffix_metadata');"]
create table suffix_metadata(a double    precision /* affinity */ (10), b unsigned   big int(2,5));
alter table suffix_metadata add column c double  precision(7,2);
pragma table_xinfo('suffix_metadata');
