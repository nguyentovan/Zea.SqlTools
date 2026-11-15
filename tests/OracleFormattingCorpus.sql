-- Oracle SQL and PL/SQL formatting corpus for Zea.
-- Format each zea-case independently with --dialect oracle, without running SQL.
-- invalid/ marks intentionally malformed input. exclusive/ marks Oracle syntax
-- expected to be rejected by the SQL Server, PostgreSQL, MySQL and SQLite dialects.
-- zea-expect lists the expected output lines for selected layout checks.

-- zea-case: select/dual-constant
-- zea-expect: ["SELECT 1","FROM dual;"]
select 1 from dual;

-- zea-case: select/projection-and-filter
-- zea-expect: ["SELECT id","    ,name","FROM customers","WHERE id = 1;"]
SELECT id,name FROM customers WHERE id=1;

-- zea-case: select/quoted-identifiers
select "Order ID",c."Status","Gross Total" as "Total" from "Sales Orders" c;

-- zea-case: select/distinct-projection
select distinct department_id, job_id from employees;

-- zea-case: select/order-null-placement
select id,last_name,hire_date from employees order by hire_date desc nulls last,last_name asc nulls first;

-- zea-case: select/row-limiting
select id,created_at from orders order by created_at desc offset 20 rows fetch next 10 rows only;

-- zea-case: select/fetch-percentage
select id,total from orders order by total desc fetch first 15 percent rows with ties;

-- zea-case: select/rownum-stopkey
select * from (select id,customer_name from customers order by created_at desc) where rownum<=5;

-- zea-case: select/rowid-and-lock
select rowid,department_id from departments where department_id=:id for update of department_id nowait;

-- zea-case: select/table-collection-binding
select column_value from table(sys.odcinumberlist(1,3,5));

-- zea-case: literals/typed-datetime
select date '2024-02-29',timestamp '2024-02-29 13:14:15.123456',interval '2-03' year to month,interval '1 02:03:04.05' day to second from dual;

-- zea-case: literals/number-exponents
select +.5,-0.25,1.2e-3,6.02E+23,123456789012345678901234567890 from dual;

-- zea-case: literals/national-character
select N'cà phê' label,'It''s SQL' escaped_literal,unistr('\00E9') accent from dual;

-- zea-case: literals/bind-variables
select id,name from customers where id=:customer_id and tenant_id=:tenant_id;

-- zea-case: literals/case-sensitive-storage
select rawtohex(hextoraw('ABCD00EE')) as encoded,empty_clob(),empty_blob() from dual;

-- zea-case: expressions/comparison-and-conjunction
-- zea-expect: ["SELECT id","FROM employees","WHERE status = 'A'","    AND amount >= 10;"]
SELECT id FROM employees WHERE status='A' AND amount>=10;

-- zea-case: expressions/arithmetic-parentheses
-- zea-expect: ["SELECT (1 + 2) * 3 result","FROM dual;"]
SELECT (1+2)*3 result FROM dual;

-- zea-case: expressions/simple-and-searched-case
select case status when 'N' then 'New' else 'Other' end status_label,case when total>=1000 and tax>0 then total-tax else 0 end net from orders;

-- zea-case: expressions/null-coercion
select nvl(commission_pct,0),nvl2(commission_pct,'paid','unpaid'),coalesce(phone,mobile,'unknown'),nullif(credit,0) from customers;

-- zea-case: expressions/decode-and-concat
select decode(status,'S','shipped','P','pending','other') as label,first_name||' '||last_name full_name from customers;

-- zea-case: expressions/regex-and-like
select regexp_replace(phone,'[^[:digit:]]','') from customers where regexp_like(email,'[.]org$','i') or email like '%\_%' escape '\';

-- zea-case: expressions/implicit-conversion
select to_char(order_date,'YYYY-MM-DD HH24:MI:SS'),to_number('1,250.50','9,999.99'),cast(total as number(12,2)) from orders;

-- zea-case: expressions/extract-and-date-arithmetic
select extract(year from hire_date),add_months(hire_date,3),trunc(hire_date,'MM'),sysdate-7 from employees;

-- zea-case: expressions/tuple-and-in
select id from ledger where (region_id,currency) in ((1,'USD'),(2,'EUR')) and fiscal_year between 2021 and 2025;

-- zea-case: joins/left-join
-- zea-expect: ["SELECT a.id","FROM accounts a","LEFT JOIN customers c ON c.id = a.customer_id;"]
SELECT a.id FROM accounts a LEFT JOIN customers c ON c.id=a.customer_id;

-- zea-case: joins/three-table-join
select o.id,c.name,l.quantity from orders o inner join customers c on c.id=o.customer_id left outer join order_lines l on l.order_id=o.id and l.quantity>0;

-- zea-case: joins/using-columns
select customer_id,order_id from orders join invoices using(customer_id,order_id);

-- zea-case: joins/natural-full-outer
select * from current_rates natural full outer join archived_rates;

-- zea-case: joins/cross-and-self
select e.last_name,m.last_name,b.band_name from employees e left join employees m on m.employee_id=e.manager_id cross join salary_bands b;

-- zea-case: joins/outer-apply
select d.department_id,e.employee_id from departments d outer apply (select employee_id from employees where department_id=d.department_id fetch first 1 row only) e;

-- zea-case: joins/partitioned-outer
select s.product_id,d.sales_day,s.quantity from calendar_days d left outer join daily_sales s partition by (s.product_id) on (d.sales_day=s.sales_day);

-- zea-case: grouping/basic-aggregates
-- zea-expect: ["SELECT id","    ,COUNT(*)","FROM orders","GROUP BY id","ORDER BY id;"]
SELECT id,COUNT(*) FROM orders GROUP BY id ORDER BY id;

-- zea-case: grouping/having
select customer_id,count(*) order_count,sum(total) total from orders group by customer_id having sum(total)>1000 and count(*)>=3;

-- zea-case: grouping/rollup
select department_id,job_id,sum(salary),grouping(department_id) from employees group by rollup(department_id,job_id);

-- zea-case: grouping/cube-and-grouping-sets
select region,channel,product,sum(net) from sales group by grouping sets(cube(region,channel),(product),());

-- zea-case: grouping/listagg-distinct-overflow
select department_id,listagg(distinct job_id,',' on overflow truncate '...' with count) within group (order by job_id) as jobs from employees group by department_id;

-- zea-case: grouping/keep-dense-rank
select department_id,max(salary) keep (dense_rank last order by hire_date) as most_recent_salary from employees group by department_id;

-- zea-case: grouping/pivot
select * from (select department_id,job_id,salary from employees) pivot (sum(salary) total for job_id in ('DEV' as developer,'MGR' as manager));

-- zea-case: grouping/unpivot
select customer_id,quarter,amount from quarterly_sales unpivot include nulls (amount for quarter in (q1 as 'Q1',q2 as 'Q2',q3 as 'Q3',q4 as 'Q4'));

-- zea-case: analytics/rolling-window
select account_id,booked_at,amount,sum(amount) over(partition by account_id order by booked_at rows between 2 preceding and current row) rolling_sum from transactions;

-- zea-case: analytics/ranking-functions
select employee_id,dense_rank() over(partition by department_id order by salary desc) pay_rank,row_number() over(order by hire_date nulls last,employee_id) hire_order from employees;

-- zea-case: analytics/range-interval-bound
select customer_id,created_at,sum(total) over(partition by customer_id order by created_at range between interval '7' day preceding and current row) weekly_total from orders;

-- zea-case: analytics/first-value-ignore-nulls
select customer_id,first_value(phone ignore nulls) over(partition by customer_id order by updated_at desc rows between unbounded preceding and unbounded following) most_recent_phone from customer_history;

-- zea-case: analytics/lag-with-default
select vendor_id,amount,lag(amount,1,0) over(partition by vendor_id order by issued_at) previous_amount from bills;

-- zea-case: analytics/percentile-and-cume-dist
select department_id,percentile_cont(0.5) within group(order by salary) over(partition by department_id) median_salary,cume_dist() over(order by salary) pay_cdf from employees;

-- zea-case: subquery/scalar-correlated
select o.id,(select max(p.amount) from payments p where p.order_id=o.id) largest_payment from orders o;

-- zea-case: subquery/exists-and-not-exists
select c.id from customers c where exists(select 1 from orders o where o.customer_id=c.id) and not exists(select 1 from accounts a where a.customer_id=c.id and a.closed_at is null);

-- zea-case: subquery/comparison-all
select employee_id from employees where salary>all(select salary from employees where job_id='INTERN');

-- zea-case: subquery/inline-view
select grouped.customer_id,grouped.revenue from (select customer_id,sum(total) revenue from orders group by customer_id) grouped where grouped.revenue>100;

-- zea-case: subquery/lateral-inline-view
select c.id,top_orders.id from customers c,lateral(select o.id from orders o where o.customer_id=c.id order by o.total desc fetch first 2 rows only) top_orders;

-- zea-case: cte/two-dependent-ctes
with active_accounts as (select id,customer_id from accounts where closed_at is null), totals as (select a.customer_id,sum(t.amount) total from active_accounts a join transactions t on t.account_id=a.id group by a.customer_id) select customer_id,total from totals order by total desc;

-- zea-case: cte/recursive-subquery-factoring
with department_tree(id,parent_id,depth) as (select department_id,parent_department_id,1 from departments where parent_department_id is null union all select d.department_id,d.parent_department_id,t.depth+1 from departments d join department_tree t on d.parent_department_id=t.id) select * from department_tree;

-- zea-case: cte/recursive-search-and-cycle
with hierarchy(id,parent_id) as (
    select id,parent_id from categories where parent_id is null
    union all
    select c.id,c.parent_id from categories c join hierarchy h on c.parent_id=h.id
) search depth first by id set traversal_order
  cycle id set is_cycle to 'Y' default 'N'
select id,parent_id,is_cycle from hierarchy order by traversal_order;

-- zea-case: sets/union-and-intersect
select customer_id from orders union all select customer_id from archived_orders intersect select id from customers;

-- zea-case: sets/minus
select id,status from live_customers minus select id,status from archived_customers;

-- zea-case: sets/parenthesized-set-operands
(select id from current_orders union all select id from archived_orders) minus select order_id from returned_orders;

-- zea-case: hierarchy/filter-and-root
select employee_id,connect_by_root last_name root_manager,level depth from employees where status='A' start with manager_id is null connect by prior employee_id=manager_id;

-- zea-case: hierarchy/nocycle-depth
select id,parent_id,level,connect_by_iscycle as has_cycle from categories start with id=1 connect by nocycle prior id=parent_id and level<=8;

-- zea-case: hierarchy/leaf-and-sibling-sort
select level,employee_id,connect_by_isleaf is_leaf from employees start with employee_id=:root connect by prior employee_id=manager_id order siblings by last_name,employee_id;

-- zea-case: hierarchy/generated-calendar
select date '2024-01-01' + level - 1 calendar_day from dual connect by level<=366;

-- zea-case: exclusive/hierarchical-path
select sys_connect_by_path(name,'/') from categories start with parent_id is null connect by prior id=parent_id;

-- zea-case: exclusive/legacy-oracle-outer-join
select a.id,b.name from accounts a,customers b where a.customer_id=b.id(+);

-- zea-case: exclusive/alternative-quoted-literal
select q'[It's Oracle's "quoted" value.]' as phrase from dual;

-- zea-case: select/remote-database-link
select employee_id from hr.employees@regional_link where employee_id=:id;

-- zea-case: exclusive/flashback-timestamp
select order_id,total from orders as of timestamp (systimestamp - interval '5' minute);

-- zea-case: exclusive/multitable-insert-first
insert first when total>1000 then into large_orders values(order_id,total)
when total>0 then into small_orders values(order_id,total)
else into rejected_orders values(order_id,total)
select order_id,total from order_staging;

-- zea-case: exclusive/synonym-with-remote-target
create or replace synonym salaries_public for hr.salaries@regional_link;

-- zea-case: exclusive/plsql-anchored-variable
declare
    v_name employees.last_name%type;
begin
    select last_name into v_name from employees where employee_id=100;
    dbms_output.put_line(v_name);
end;
/

-- zea-case: exclusive/plsql-package-spec
create or replace package payroll_tools as
    procedure add_bonus(p_employee_id in number,p_amount in number);
    function total_bonus(p_employee_id in number) return number;
end payroll_tools;
/

-- zea-case: exclusive/plsql-row-trigger
create or replace trigger account_audit_trg
before update of balance on accounts for each row
begin
    :new.last_updated_at:=systimestamp;
end;
/

-- zea-case: dml/insert-values
insert into departments(department_id,department_name) values(department_seq.nextval,'Research');

-- zea-case: dml/insert-select
insert into archived_orders(id,customer_id,total) select id,customer_id,total from orders where closed_at<date '2023-01-01';

-- zea-case: dml/insert-returning-binds
insert into orders(id,customer_id,total) values(order_seq.nextval,:customer_id,0) returning id,total into :new_id,:initial_total;

-- zea-case: dml/multitable-insert-all
insert all
into order_audit(order_id,kind) values(id,'created')
into order_archive(id,customer_id) values(id,customer_id)
select id,customer_id from recent_orders;

-- zea-case: dml/update-tuple-subquery
update orders o set (total,tax)=(select sum(l.net),sum(l.tax) from order_lines l where l.order_id=o.id) where o.closed_at is null;

-- zea-case: dml/update-returning-bind
update accounts set balance=balance+25 where account_id=:id returning balance into :current_balance;

-- zea-case: dml/delete-correlated
delete from invoices i where not exists (select 1 from orders o where o.id=i.order_id);

-- zea-case: dml/delete-returning-multiple
delete from temp_events where expires_at<sysdate returning event_id,expires_at into :removed_id,:removed_expiry;

-- zea-case: dml/merge-with-conditional-actions
merge into inventory i using (select sku,sum(quantity) added from receipts group by sku) r on (i.sku=r.sku)
when matched then update set i.quantity=i.quantity+r.added where r.added>0 delete where i.quantity=0
when not matched then insert(sku,quantity) values(r.sku,r.added) where r.added>0;

-- zea-case: dml/merge-insert-only
merge into customer_tags c using (select :customer_id customer_id,:tag tag from dual) x on(c.customer_id=x.customer_id and c.tag=x.tag)
when not matched then insert(customer_id,tag) values(x.customer_id,x.tag);

-- zea-case: ddl/table-datatypes
create table documents (id number(12),name varchar2(120 char) not null,name_utf nchar(20),created_at timestamp(6) with local time zone,body clob,checksum raw(32),migration_hint varchar2(255 byte));

-- zea-case: ddl/keys-checks-and-identity
create table customer_cards (id number generated by default as identity primary key, customer_id number not null, balance number(12,2) default 0, closed_at date, constraint card_balance_ck check(balance>=0), constraint card_customer_fk foreign key(customer_id) references customers(id) on delete cascade);

-- zea-case: ddl/virtual-column
create table inventory_value (sku varchar2(32) primary key,quantity number,unit_price number(10,2),stock_value generated always as (quantity*unit_price) virtual);

-- zea-case: ddl/global-temporary-table
create global temporary table session_work(id number primary key,notes varchar2(4000)) on commit preserve rows;

-- zea-case: ddl/range-partitioned-table
create table sales_archive(sale_id number,sale_date date,net number) partition by range(sale_date) (
partition sales_2023 values less than (date '2024-01-01'),
partition sales_2024 values less than (date '2025-01-01'),
partition sales_future values less than (maxvalue)
);

-- zea-case: ddl/index-function-bitmap
create bitmap index customers_status_ix on customers(status);
create unique index customers_lower_email_ix on customers(lower(email));

-- zea-case: ddl/sequence
create sequence invoice_seq start with 12000 increment by 5 minvalue 1 maxvalue 999999999 cache 20 nocycle;

-- zea-case: ddl/alter-columns-and-constraint
alter table customers add (region_code varchar2(5),comment_text varchar2(4000));
alter table customers modify (email varchar2(300) not null);
alter table customers add constraint customer_email_uk unique(email);

-- zea-case: ddl/view-with-check-option
create or replace view open_orders (order_id,customer_id,total) as
select id,customer_id,total from orders where closed_at is null
with check option constraint open_orders_check;

-- zea-case: ddl/materialized-view
create materialized view department_totals build immediate refresh complete on demand as
select department_id,count(*) employee_count,sum(salary) payroll from employees group by department_id;

-- zea-case: ddl/comment-and-column
comment on table orders is 'Order header';
comment on column orders.total is 'Includes approved tax';

-- zea-case: ddl/truncate-and-drop
truncate table staging_orders drop storage;
drop table old_orders cascade constraints purge;

-- zea-case: ddl/object-type
create type address_t as object (line1 varchar2(100),city varchar2(80),postcode varchar2(20));
/

-- zea-case: ddl/nested-table-type
create or replace type item_ids_t as table of number;
/

-- zea-case: session/grants-and-role
grant select,update on orders to reporting_user with grant option;
revoke update on orders from reporting_user;

-- zea-case: session/savepoint-and-rollback
savepoint before_import;
update accounts set status='A' where arrived_at>=date '2024-01-01';
rollback to savepoint before_import;
commit;

-- zea-case: session/alter-session
alter session set current_schema=REPORTING;
alter session set nls_date_format='YYYY-MM-DD';

-- zea-case: session/explain-plan
explain plan set statement_id='billing_preview' for select id,total from invoices where status='P';

-- zea-case: documents/xmlconstructors
select xmlelement("Customer",xmlattributes(c.id as "id"),xmlforest(c.name as "Name",c.email as "Email")) customer_xml from customers c;

-- zea-case: documents/xmltable
select p.id,p.price from products d cross join xmltable('/product' passing d.xml_data columns id number path '@id',price number path 'price') p;

-- zea-case: documents/json-value-and-exists
select id,json_value(payload,'$.customer.name' returning varchar2(120) null on error) customer_name from events where json_exists(payload,'$.customer.id');

-- zea-case: documents/json-object
select json_object('id' value id,'label' value name absent on null returning clob) from customers;

-- zea-case: documents/json-table
select o.id,j.line_no,j.sku,j.quantity from orders o cross join json_table(o.payload,'$.lines[*]' columns (line_no for ordinality,sku varchar2(30) path '$.sku',quantity number path '$.quantity')) j;

-- zea-case: advanced/match-recognize
select * from stock_prices match_recognize(
  partition by ticker order by traded_at
  measures first(rise.price) as first_price,last(rise.price) as last_price
  one row per match after match skip past last row
  pattern (rise+)
  define rise as rise.price>prev(rise.price)
);

-- zea-case: advanced/model-forecast
select product,month_num,units from monthly_sales
model partition by(product) dimension by(month_num) measures(units)
rules (units[13]=units[12]+units[11]);

-- zea-case: advanced/index-and-parallel-hint
select /*+ INDEX(o orders_status_ix) PARALLEL(o 2) */ o.id,o.total from orders o where o.status='NEW';

-- zea-case: advanced/table-sample
select account_id from accounts sample block(10) seed(42);

-- zea-case: advanced/flashback-version-range
select versions_startscn,versions_operation,order_id from orders versions between scn minvalue and maxvalue where order_id=100;

-- zea-case: plsql/anonymous-null
begin null; end;
/

-- zea-case: plsql/declare-constants-and-defaults
declare
    c_rate constant number(8,4):=0.145;
    v_total number default 0;
begin
    v_total:=100*c_rate;
    dbms_output.put_line(v_total);
end;
/

-- zea-case: plsql/nested-block-with-exceptions
declare
    v_name varchar2(100);
begin
    begin
        select last_name into v_name from employees where employee_id=:emp_id;
    exception
        when no_data_found then v_name:='unknown';
        when too_many_rows then raise;
    end;
    dbms_output.put_line(v_name);
exception
    when others then raise_application_error(-20001,sqlerrm);
end;
/

-- zea-case: plsql/if-elsif-else
declare
    v_total number:=120;
begin
    if v_total>100 then
        dbms_output.put_line('large');
    elsif v_total>10 then
        dbms_output.put_line('normal');
    else
        dbms_output.put_line('small');
    end if;
end;
/

-- zea-case: plsql/case-statement
begin
    case :status
        when 'A' then dbms_output.put_line('active');
        when 'S' then dbms_output.put_line('suspended');
        else dbms_output.put_line('unknown');
    end case;
end;
/

-- zea-case: plsql/for-loop-cursor
begin
    for r in (select id,amount from orders where status='OPEN') loop
        dbms_output.put_line(r.id||': '||r.amount);
    end loop;
end;
/

-- zea-case: plsql/while-exit-continue
declare
    v_idx pls_integer:=0;
begin
    while v_idx<10 loop
        v_idx:=v_idx+1;
        continue when mod(v_idx,2)=0;
        exit when v_idx>=9;
        dbms_output.put_line(v_idx);
    end loop;
end;
/

-- zea-case: plsql/cursor-open-fetch-close
declare
    cursor employee_cur(p_dept number) is select employee_id,last_name from employees where department_id=p_dept;
    employee_rec employee_cur%rowtype;
begin
    open employee_cur(20);
    loop
        fetch employee_cur into employee_rec;
        exit when employee_cur%notfound;
        dbms_output.put_line(employee_rec.last_name);
    end loop;
    close employee_cur;
end;
/

-- zea-case: plsql/bulk-collect-and-forall
declare
    type order_id_list is table of orders.id%type;
    v_ids order_id_list;
begin
    select id bulk collect into v_ids from orders where status='EXPIRED';
    forall idx in indices of v_ids save exceptions
        delete from orders where id=v_ids(idx);
end;
/

-- zea-case: plsql/dynamic-sql
declare
    v_total number;
begin
    execute immediate 'select sum(total) from orders where customer_id = :id'
        into v_total using :customer_id;
    dbms_output.put_line(v_total);
end;
/

-- zea-case: plsql/object-method-call
declare
    v_obj json_object_t:=json_object_t.parse('{"id":7}');
begin
    dbms_output.put_line(v_obj.get_number('id'));
end;
/

-- zea-case: plsql/persistent-procedure
create or replace procedure archive_orders(p_cutoff in date,p_archived out number) authid definer as
begin
    insert into archived_orders(id,total) select id,total from orders where closed_at<p_cutoff;
    p_archived:=sql%rowcount;
    delete from orders where closed_at<p_cutoff;
end archive_orders;
/

-- zea-case: plsql/persistent-function
create or replace function tax_amount(p_total in number,p_rate in number default 0.1)
return number authid current_user deterministic is
begin
    return round(p_total*p_rate,2);
end tax_amount;
/

-- zea-case: plsql/package-body
create or replace package body issue_tracker as
    g_pending number:=0;

    procedure bump_pending(p_count in number) is
    begin
        g_pending:=g_pending+p_count;
    end bump_pending;

    function pending_count return number is
    begin
        return g_pending;
    end pending_count;
end issue_tracker;
/

-- zea-case: plsql/labeled-loop
begin
    <<row_loop>>
    for row_index in reverse 1..3 loop
        exit row_loop when row_index=2;
        dbms_output.put_line(row_index);
    end loop row_loop;
end;
/

-- zea-case: plsql/record-and-associative-array
declare
    type order_info is record (id number,total number);
    type order_map is table of order_info index by pls_integer;
    v_rows order_map;
begin
    v_rows(1).id:=100;
    v_rows(1).total:=25;
end;
/

-- zea-case: comments/leading-and-inline
-- Report for finance.
select id, /* stable display order */ amount -- gross
from orders
where total>0; -- end of report

-- zea-case: comments/clause-boundaries
select
  e.employee_id -- identity
  , e.last_name /* display label */
from employees e /* employee data */
where e.department_id=:department_id
-- Sort for screen display.
order by e.last_name;

-- zea-case: comments/markers-inside-string
select '-- zea-case: not-a-marker', '/* not a comment */',q'{A; B; C}' from dual;

-- zea-case: comments/multiline-comments
/* Report description.
   Keep the comment's newlines. */
select customer_id,case when credit<0 then 'Debit' else 'Credit' end /* bucket */ from accounts;

-- zea-case: comments/comment-before-block-end
begin
    dbms_output.put_line('ready'); -- inline
    -- Completed.
end;
/

-- zea-case: batch/ddl-with-sequence-and-insert
create sequence accounts_seq start with 1 nocache;
create table imported_accounts(id number primary key,name varchar2(100));
insert into imported_accounts(id,name) values(accounts_seq.nextval,'Main');
select id,name from imported_accounts;

-- zea-case: batch/sql-and-plsql
declare
    v_flag number:=1;
begin
    if v_flag=1 then dbms_output.put_line('initialized'); end if;
end;
/
select sysdate as snapshot_at from dual;

-- zea-case: invalid/unclosed-parenthesis
select id from orders where total in (1,2,3;

-- zea-case: invalid/unclosed-string
select 'unclosed from dual;

-- zea-case: invalid/incomplete-connect-by
select id from categories start with parent_id is null connect by prior;

-- zea-case: invalid/unclosed-q-quote
select q'[It's missing its closing delimiter' from dual;

-- zea-case: invalid/missing-plsql-end
declare
    v_total number := 0;
begin
    v_total := 1;
/

-- zea-case: invalid/malformed-merge
merge into accounts a using staging s on (a.id=s.id) when matched then insert values(s.id);

-- zea-case: invalid/incomplete-returning
insert into orders(id,total) values(1,0) returning id into;

-- zea-case: invalid/trailing-broken-ddl
create table broken_table (id number constraint primary key)

-- zea-case: invalid/unterminated-block-comment
select id from accounts /* no comment end

-- zea-case: comments/multiline-indented
-- zea-expect: ["/* Report ;", "   Second line -- literal.", "   Last line. */", "SELECT 1", "FROM dual;"]
/* Report ;
   Second line -- literal.
   Last line. */
select 1 from dual;

-- zea-case: invalid/nested-block-comments
/* Outer ;
   /* Inner ; */
   Outer again. */
select 1 from dual;
