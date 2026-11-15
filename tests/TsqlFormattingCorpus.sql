-- T-SQL formatter comparison corpus for Zea and Right Way.
-- Feed the body of each zea-case independently to both formatters.
-- Test data for formatting only. Includes large batches and invalid SQL.

-- zea-case: select/01-01
select 2;

-- zea-case: select/01-02
  select 3;

-- zea-case: select/01-03
select 4;

-- zea-case: select/01-04
  select 5;

-- zea-case: select/01-05
select 6;

-- zea-case: select/01-06
  select 7;

-- zea-case: select/01-07
select 8;

-- zea-case: select/01-08
  select 9;

-- zea-case: select/01-09
select 10;

-- zea-case: select/01-10
  select 11;

-- zea-case: select/02-01
SELECT 3 as one, 11 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-02
  SELECT 4 as one, 14 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-03
SELECT 5 as one, 17 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-04
  SELECT 6 as one, 20 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-05
SELECT 7 as one, 23 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-06
  SELECT 8 as one, 26 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-07
SELECT 9 as one, 29 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-08
  SELECT 10 as one, 32 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-09
SELECT 11 as one, 35 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/02-10
  SELECT 12 as one, 38 AS [select], NULL as [empty], 'abc' as label;

-- zea-case: select/03-01
select a.id,a.name,a.amount from dbo.accounts a where a.id=1;

-- zea-case: select/03-02
  select a.id,a.name,a.amount
  from dbo.accounts a
 where a.id=2;

-- zea-case: select/03-03
select a.id,a.name,a.amount from dbo.accounts a where a.id=3;

-- zea-case: select/03-04
  select a.id,a.name,a.amount
  from dbo.accounts a
 where a.id=4;

-- zea-case: select/03-05
select a.id,a.name,a.amount from dbo.accounts a where a.id=5;

-- zea-case: select/03-06
  select a.id,a.name,a.amount
  from dbo.accounts a
 where a.id=6;

-- zea-case: select/03-07
select a.id,a.name,a.amount from dbo.accounts a where a.id=7;

-- zea-case: select/03-08
  select a.id,a.name,a.amount
  from dbo.accounts a
 where a.id=8;

-- zea-case: select/03-09
select a.id,a.name,a.amount from dbo.accounts a where a.id=9;

-- zea-case: select/03-10
  select a.id,a.name,a.amount
  from dbo.accounts a
 where a.id=10;

-- zea-case: select/04-01
-- zea-expect: ["SELECT DISTINCT TOP (2) a.category", "FROM dbo.accounts AS a", "ORDER BY a.category;"]
select distinct top (2) a.category from dbo.accounts as a order by a.category;

-- zea-case: select/04-02
  select distinct top (3) a.category
  from dbo.accounts as a order by a.category;

-- zea-case: select/04-03
select distinct top (4) a.category from dbo.accounts as a order by a.category;

-- zea-case: select/04-04
  select distinct top (5) a.category
  from dbo.accounts as a order by a.category;

-- zea-case: select/04-05
select distinct top (6) a.category from dbo.accounts as a order by a.category;

-- zea-case: select/04-06
  select distinct top (7) a.category
  from dbo.accounts as a order by a.category;

-- zea-case: select/04-07
select distinct top (8) a.category from dbo.accounts as a order by a.category;

-- zea-case: select/04-08
  select distinct top (9) a.category
  from dbo.accounts as a order by a.category;

-- zea-case: select/04-09
select distinct top (10) a.category from dbo.accounts as a order by a.category;

-- zea-case: select/04-10
  select distinct top (11) a.category
  from dbo.accounts as a order by a.category;

-- zea-case: select/05-01
select top 3 percent with ties id, amount from dbo.accounts order by amount desc;

-- zea-case: select/05-02
  select top 4 percent with ties id, amount
  from dbo.accounts order by amount desc;

-- zea-case: select/05-03
select top 5 percent with ties id, amount from dbo.accounts order by amount desc;

-- zea-case: select/05-04
  select top 6 percent with ties id, amount
  from dbo.accounts order by amount desc;

-- zea-case: select/05-05
select top 7 percent with ties id, amount from dbo.accounts order by amount desc;

-- zea-case: select/05-06
  select top 8 percent with ties id, amount
  from dbo.accounts order by amount desc;

-- zea-case: select/05-07
select top 9 percent with ties id, amount from dbo.accounts order by amount desc;

-- zea-case: select/05-08
  select top 10 percent with ties id, amount
  from dbo.accounts order by amount desc;

-- zea-case: select/05-09
select top 11 percent with ties id, amount from dbo.accounts order by amount desc;

-- zea-case: select/05-10
  select top 12 percent with ties id, amount
  from dbo.accounts order by amount desc;

-- zea-case: select/06-01
select a.id, (a.amount+1)*5 as adjusted, -1 as negative, ~5 as flipped from dbo.accounts a;

-- zea-case: select/06-02
  select a.id, (a.amount+2)*8 as adjusted, -2 as negative, ~8 as flipped
  from dbo.accounts a;

-- zea-case: select/06-03
select a.id, (a.amount+3)*11 as adjusted, -3 as negative, ~11 as flipped from dbo.accounts a;

-- zea-case: select/06-04
  select a.id, (a.amount+4)*14 as adjusted, -4 as negative, ~14 as flipped
  from dbo.accounts a;

-- zea-case: select/06-05
select a.id, (a.amount+5)*17 as adjusted, -5 as negative, ~17 as flipped from dbo.accounts a;

-- zea-case: select/06-06
  select a.id, (a.amount+6)*20 as adjusted, -6 as negative, ~20 as flipped
  from dbo.accounts a;

-- zea-case: select/06-07
select a.id, (a.amount+7)*23 as adjusted, -7 as negative, ~23 as flipped from dbo.accounts a;

-- zea-case: select/06-08
  select a.id, (a.amount+8)*26 as adjusted, -8 as negative, ~26 as flipped
  from dbo.accounts a;

-- zea-case: select/06-09
select a.id, (a.amount+9)*29 as adjusted, -9 as negative, ~29 as flipped from dbo.accounts a;

-- zea-case: select/06-10
  select a.id, (a.amount+10)*32 as adjusted, -10 as negative, ~32 as flipped
  from dbo.accounts a;

-- zea-case: select/07-01
-- zea-expect: ["SELECT [weird]]name]", "    ,[space name]", "    ,\"QuotedName\"", "FROM [Odd Schema].[Odd Table]", "WHERE id = 2;"]
select [weird]]name], [space name], "QuotedName" from [Odd Schema].[Odd Table] where id=2;

-- zea-case: select/07-02
  select [weird]]name], [space name], "QuotedName"
  from [Odd Schema].[Odd Table]
 where id=3;

-- zea-case: select/07-03
select [weird]]name], [space name], "QuotedName" from [Odd Schema].[Odd Table] where id=4;

-- zea-case: select/07-04
  select [weird]]name], [space name], "QuotedName"
  from [Odd Schema].[Odd Table]
 where id=5;

-- zea-case: select/07-05
select [weird]]name], [space name], "QuotedName" from [Odd Schema].[Odd Table] where id=6;

-- zea-case: select/07-06
  select [weird]]name], [space name], "QuotedName"
  from [Odd Schema].[Odd Table]
 where id=7;

-- zea-case: select/07-07
select [weird]]name], [space name], "QuotedName" from [Odd Schema].[Odd Table] where id=8;

-- zea-case: select/07-08
  select [weird]]name], [space name], "QuotedName"
  from [Odd Schema].[Odd Table]
 where id=9;

-- zea-case: select/07-09
select [weird]]name], [space name], "QuotedName" from [Odd Schema].[Odd Table] where id=10;

-- zea-case: select/07-10
  select [weird]]name], [space name], "QuotedName"
  from [Odd Schema].[Odd Table]
 where id=11;

-- zea-case: select/08-01
select a.id into #picked_3 from dbo.accounts a where a.amount>11;

-- zea-case: select/08-02
  select a.id into #picked_4
  from dbo.accounts a
 where a.amount>14;

-- zea-case: select/08-03
select a.id into #picked_5 from dbo.accounts a where a.amount>17;

-- zea-case: select/08-04
  select a.id into #picked_6
  from dbo.accounts a
 where a.amount>20;

-- zea-case: select/08-05
select a.id into #picked_7 from dbo.accounts a where a.amount>23;

-- zea-case: select/08-06
  select a.id into #picked_8
  from dbo.accounts a
 where a.amount>26;

-- zea-case: select/08-07
select a.id into #picked_9 from dbo.accounts a where a.amount>29;

-- zea-case: select/08-08
  select a.id into #picked_10
  from dbo.accounts a
 where a.amount>32;

-- zea-case: select/08-09
select a.id into #picked_11 from dbo.accounts a where a.amount>35;

-- zea-case: select/08-10
  select a.id into #picked_12
  from dbo.accounts a
 where a.amount>38;

-- zea-case: select/09-01
-- zea-expect: ["SELECT id", "FROM dbo.accounts", "ORDER BY id OFFSET 1 ROWS", "", "FETCH NEXT 5 ROWS ONLY;"]
select id from dbo.accounts order by id offset 1 rows fetch next 5 rows only;

-- zea-case: select/09-02
  select id
  from dbo.accounts order by id offset 2 rows fetch next 8 rows only;

-- zea-case: select/09-03
select id from dbo.accounts order by id offset 3 rows fetch next 11 rows only;

-- zea-case: select/09-04
  select id
  from dbo.accounts order by id offset 4 rows fetch next 14 rows only;

-- zea-case: select/09-05
select id from dbo.accounts order by id offset 5 rows fetch next 17 rows only;

-- zea-case: select/09-06
  select id
  from dbo.accounts order by id offset 6 rows fetch next 20 rows only;

-- zea-case: select/09-07
select id from dbo.accounts order by id offset 7 rows fetch next 23 rows only;

-- zea-case: select/09-08
  select id
  from dbo.accounts order by id offset 8 rows fetch next 26 rows only;

-- zea-case: select/09-09
select id from dbo.accounts order by id offset 9 rows fetch next 29 rows only;

-- zea-case: select/09-10
  select id
  from dbo.accounts order by id offset 10 rows fetch next 32 rows only;

-- zea-case: select/10-01
select id, score from dbo.accounts order by score desc, id asc;

-- zea-case: select/10-02
  select id, score
  from dbo.accounts order by score desc, id asc;

-- zea-case: literals/01-01
-- zea-expect: ["SELECT N'Hà Nội 2; -- Việt Nam'", "    ,'O''Brien'", "    ,N'東京'", "    ,N'🧪'", "    ,'';"]
select N'Hà Nội 2; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-02
  select N'Hà Nội 3; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-03
select N'Hà Nội 4; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-04
  select N'Hà Nội 5; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-05
select N'Hà Nội 6; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-06
  select N'Hà Nội 7; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-07
select N'Hà Nội 8; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-08
  select N'Hà Nội 9; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-09
select N'Hà Nội 10; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/01-10
  select N'Hà Nội 11; -- Việt Nam', 'O''Brien', N'東京', N'🧪', '';

-- zea-case: literals/02-01
select 0xABCD, 0x0f, 3e-2, .125, 11.005, $12.30;

-- zea-case: literals/02-02
  select 0xABCD, 0x0f, 4e-2, .125, 14.005, $12.30;

-- zea-case: literals/02-03
select 0xABCD, 0x0f, 5e-2, .125, 17.005, $12.30;

-- zea-case: literals/02-04
  select 0xABCD, 0x0f, 6e-2, .125, 20.005, $12.30;

-- zea-case: literals/02-05
select 0xABCD, 0x0f, 7e-2, .125, 23.005, $12.30;

-- zea-case: literals/02-06
  select 0xABCD, 0x0f, 8e-2, .125, 26.005, $12.30;

-- zea-case: literals/02-07
select 0xABCD, 0x0f, 9e-2, .125, 29.005, $12.30;

-- zea-case: literals/02-08
  select 0xABCD, 0x0f, 10e-2, .125, 32.005, $12.30;

-- zea-case: literals/02-09
select 0xABCD, 0x0f, 11e-2, .125, 35.005, $12.30;

-- zea-case: literals/02-10
  select 0xABCD, 0x0f, 12e-2, .125, 38.005, $12.30;

-- zea-case: literals/03-01
select cast('1' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-02
  select cast('2' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-03
select cast('3' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-04
  select cast('4' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-05
select cast('5' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-06
  select cast('6' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-07
select cast('7' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-08
  select cast('8' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-09
select cast('9' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/03-10
  select cast('10' as decimal(9,2)), convert(date, '20250102', 112), try_cast('x' as int);

-- zea-case: literals/04-01
select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('2');

-- zea-case: literals/04-02
  select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('3');

-- zea-case: literals/04-03
select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('4');

-- zea-case: literals/04-04
  select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('5');

-- zea-case: literals/04-05
select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('6');

-- zea-case: literals/04-06
  select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('7');

-- zea-case: literals/04-07
select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('8');

-- zea-case: literals/04-08
  select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('9');

-- zea-case: literals/04-09
select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('10');

-- zea-case: literals/04-10
  select concat('/* no comment */', CHAR(10), 'a; -- literal'), quotename('11');

-- zea-case: literals/05-01
select N'first line 3
second line ,() ; -- still a literal', '11';

-- zea-case: literals/05-02
  select N'first line 4
second line ,() ; -- still a literal', '14';

-- zea-case: literals/05-03
select N'first line 5
second line ,() ; -- still a literal', '17';

-- zea-case: literals/05-04
  select N'first line 6
second line ,() ; -- still a literal', '20';

-- zea-case: literals/05-05
select N'first line 7
second line ,() ; -- still a literal', '23';

-- zea-case: literals/05-06
  select N'first line 8
second line ,() ; -- still a literal', '26';

-- zea-case: literals/05-07
select N'first line 9
second line ,() ; -- still a literal', '29';

-- zea-case: literals/05-08
  select N'first line 10
second line ,() ; -- still a literal', '32';

-- zea-case: literals/05-09
select N'first line 11
second line ,() ; -- still a literal', '35';

-- zea-case: literals/05-10
  select N'first line 12
second line ,() ; -- still a literal', '38';

-- zea-case: comments/01-01
-- leading 2
select a,8 as b /* block comment */ from dbo.a;
-- trailing

-- zea-case: comments/01-02
  -- leading 3
select a,11 as b /* block comment */
  from dbo.a;
-- trailing

-- zea-case: comments/01-03
-- leading 4
select a,14 as b /* block comment */ from dbo.a;
-- trailing

-- zea-case: comments/01-04
  -- leading 5
select a,17 as b /* block comment */
  from dbo.a;
-- trailing

-- zea-case: comments/01-05
-- leading 6
select a,20 as b /* block comment */ from dbo.a;
-- trailing

-- zea-case: comments/01-06
  -- leading 7
select a,23 as b /* block comment */
  from dbo.a;
-- trailing

-- zea-case: comments/01-07
-- leading 8
select a,26 as b /* block comment */ from dbo.a;
-- trailing

-- zea-case: comments/01-08
  -- leading 9
select a,29 as b /* block comment */
  from dbo.a;
-- trailing

-- zea-case: comments/01-09
-- leading 10
select a,32 as b /* block comment */ from dbo.a;
-- trailing

-- zea-case: comments/01-10
  -- leading 11
select a,35 as b /* block comment */
  from dbo.a;
-- trailing

-- zea-case: comments/02-01
select 3 -- comma belongs on the next line
, 11 /*after item*/ from dbo.a;

-- zea-case: comments/02-02
  select 4 -- comma belongs on the next line
, 14 /*after item*/
  from dbo.a;

-- zea-case: comments/02-03
select 5 -- comma belongs on the next line
, 17 /*after item*/ from dbo.a;

-- zea-case: comments/02-04
  select 6 -- comma belongs on the next line
, 20 /*after item*/
  from dbo.a;

-- zea-case: comments/02-05
select 7 -- comma belongs on the next line
, 23 /*after item*/ from dbo.a;

-- zea-case: comments/02-06
  select 8 -- comma belongs on the next line
, 26 /*after item*/
  from dbo.a;

-- zea-case: comments/02-07
select 9 -- comma belongs on the next line
, 29 /*after item*/ from dbo.a;

-- zea-case: comments/02-08
  select 10 -- comma belongs on the next line
, 32 /*after item*/
  from dbo.a;

-- zea-case: comments/02-09
select 11 -- comma belongs on the next line
, 35 /*after item*/ from dbo.a;

-- zea-case: comments/02-10
  select 12 -- comma belongs on the next line
, 38 /*after item*/
  from dbo.a;

-- zea-case: comments/03-01
select 1 /* outer /* nested */ outer */, 5;

-- zea-case: comments/03-02
  select 2 /* outer /* nested */ outer */, 8;

-- zea-case: comments/03-03
select 3 /* outer /* nested */ outer */, 11;

-- zea-case: comments/03-04
  select 4 /* outer /* nested */ outer */, 14;

-- zea-case: comments/03-05
select 5 /* outer /* nested */ outer */, 17;

-- zea-case: comments/03-06
  select 6 /* outer /* nested */ outer */, 20;

-- zea-case: comments/03-07
select 7 /* outer /* nested */ outer */, 23;

-- zea-case: comments/03-08
  select 8 /* outer /* nested */ outer */, 26;

-- zea-case: comments/03-09
select 9 /* outer /* nested */ outer */, 29;

-- zea-case: comments/03-10
  select 10 /* outer /* nested */ outer */, 32;

-- zea-case: comments/04-01
-- zea-expect: ["SELECT a.id", "FROM dbo.a a", "LEFT JOIN /* 2 */ dbo.b b ON a.id = b.id;"]
select a.id from dbo.a a left outer /* 2 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-02
  select a.id
  from dbo.a a left outer /* 3 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-03
select a.id from dbo.a a left outer /* 4 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-04
  select a.id
  from dbo.a a left outer /* 5 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-05
select a.id from dbo.a a left outer /* 6 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-06
  select a.id
  from dbo.a a left outer /* 7 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-07
select a.id from dbo.a a left outer /* 8 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-08
  select a.id
  from dbo.a a left outer /* 9 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-09
select a.id from dbo.a a left outer /* 10 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/04-10
  select a.id
  from dbo.a a left outer /* 11 */ join dbo.b b on a.id=b.id;

-- zea-case: comments/05-01
select /* [NOFORMAT] */ 3+  11 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-02
  select /* [NOFORMAT] */ 4+  14 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-03
select /* [NOFORMAT] */ 5+  17 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-04
  select /* [NOFORMAT] */ 6+  20 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-05
select /* [NOFORMAT] */ 7+  23 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-06
  select /* [NOFORMAT] */ 8+  26 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-07
select /* [NOFORMAT] */ 9+  29 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-08
  select /* [NOFORMAT] */ 10+  32 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-09
select /* [NOFORMAT] */ 11+  35 /* [/NOFORMAT] */ as n;

-- zea-case: comments/05-10
  select /* [NOFORMAT] */ 12+  38 /* [/NOFORMAT] */ as n;

-- zea-case: comments/06-01
select /* [MINIFY] */ 1 + 5 /* [/MINIFY] */ as n;

-- zea-case: comments/06-02
  select /* [MINIFY] */ 2 + 8 /* [/MINIFY] */ as n;

-- zea-case: comments/06-03
select /* [MINIFY] */ 3 + 11 /* [/MINIFY] */ as n;

-- zea-case: comments/06-04
  select /* [MINIFY] */ 4 + 14 /* [/MINIFY] */ as n;

-- zea-case: comments/06-05
select /* [MINIFY] */ 5 + 17 /* [/MINIFY] */ as n;

-- zea-case: comments/06-06
  select /* [MINIFY] */ 6 + 20 /* [/MINIFY] */ as n;

-- zea-case: comments/06-07
select /* [MINIFY] */ 7 + 23 /* [/MINIFY] */ as n;

-- zea-case: comments/06-08
  select /* [MINIFY] */ 8 + 26 /* [/MINIFY] */ as n;

-- zea-case: comments/06-09
select /* [MINIFY] */ 9 + 29 /* [/MINIFY] */ as n;

-- zea-case: comments/06-10
  select /* [MINIFY] */ 10 + 32 /* [/MINIFY] */ as n;

-- zea-case: predicates/01-01
select id from dbo.a where x between 2 and 8 and y not between 8 and 17 or z is null;

-- zea-case: predicates/01-02
  select id
  from dbo.a
 where x between 3 and 11 and y not between 11 and 20 or z is null;

-- zea-case: predicates/01-03
select id from dbo.a where x between 4 and 14 and y not between 14 and 23 or z is null;

-- zea-case: predicates/01-04
  select id
  from dbo.a
 where x between 5 and 17 and y not between 17 and 26 or z is null;

-- zea-case: predicates/01-05
select id from dbo.a where x between 6 and 20 and y not between 20 and 29 or z is null;

-- zea-case: predicates/01-06
  select id
  from dbo.a
 where x between 7 and 23 and y not between 23 and 32 or z is null;

-- zea-case: predicates/01-07
select id from dbo.a where x between 8 and 26 and y not between 26 and 35 or z is null;

-- zea-case: predicates/01-08
  select id
  from dbo.a
 where x between 9 and 29 and y not between 29 and 38 or z is null;

-- zea-case: predicates/01-09
select id from dbo.a where x between 10 and 32 and y not between 32 and 41 or z is null;

-- zea-case: predicates/01-10
  select id
  from dbo.a
 where x between 11 and 35 and y not between 35 and 44 or z is null;

-- zea-case: predicates/02-01
select id from dbo.a where x not in (3,11,20) and y in (select id from dbo.b);

-- zea-case: predicates/02-02
  select id
  from dbo.a
 where x not in (4,14,23) and y in (select id
  from dbo.b);

-- zea-case: predicates/02-03
select id from dbo.a where x not in (5,17,26) and y in (select id from dbo.b);

-- zea-case: predicates/02-04
  select id
  from dbo.a
 where x not in (6,20,29) and y in (select id
  from dbo.b);

-- zea-case: predicates/02-05
select id from dbo.a where x not in (7,23,32) and y in (select id from dbo.b);

-- zea-case: predicates/02-06
  select id
  from dbo.a
 where x not in (8,26,35) and y in (select id
  from dbo.b);

-- zea-case: predicates/02-07
select id from dbo.a where x not in (9,29,38) and y in (select id from dbo.b);

-- zea-case: predicates/02-08
  select id
  from dbo.a
 where x not in (10,32,41) and y in (select id
  from dbo.b);

-- zea-case: predicates/02-09
select id from dbo.a where x not in (11,35,44) and y in (select id from dbo.b);

-- zea-case: predicates/02-10
  select id
  from dbo.a
 where x not in (12,38,47) and y in (select id
  from dbo.b);

-- zea-case: predicates/03-01
-- zea-expect: ["SELECT id", "FROM dbo.a", "WHERE EXISTS (", "        SELECT 1", "        FROM dbo.b", "        WHERE a.id = b.id", "            AND b.code = 1", "        );"]
select id from dbo.a where exists (select 1 from dbo.b where a.id=b.id and b.code=1);

-- zea-case: predicates/03-02
  select id
  from dbo.a
 where exists (select 1
  from dbo.b
 where a.id=b.id and b.code=2);

-- zea-case: predicates/03-03
select id from dbo.a where exists (select 1 from dbo.b where a.id=b.id and b.code=3);

-- zea-case: predicates/03-04
  select id
  from dbo.a
 where exists (select 1
  from dbo.b
 where a.id=b.id and b.code=4);

-- zea-case: predicates/03-05
select id from dbo.a where exists (select 1 from dbo.b where a.id=b.id and b.code=5);

-- zea-case: predicates/03-06
  select id
  from dbo.a
 where exists (select 1
  from dbo.b
 where a.id=b.id and b.code=6);

-- zea-case: predicates/03-07
select id from dbo.a where exists (select 1 from dbo.b where a.id=b.id and b.code=7);

-- zea-case: predicates/03-08
  select id
  from dbo.a
 where exists (select 1
  from dbo.b
 where a.id=b.id and b.code=8);

-- zea-case: predicates/03-09
select id from dbo.a where exists (select 1 from dbo.b where a.id=b.id and b.code=9);

-- zea-case: predicates/03-10
  select id
  from dbo.a
 where exists (select 1
  from dbo.b
 where a.id=b.id and b.code=10);

-- zea-case: predicates/04-01
select id from dbo.a where name like N'A[_]%' escape N'!' and (a=2 or b<>8);

-- zea-case: predicates/04-02
  select id
  from dbo.a
 where name like N'A[_]%' escape N'!' and (a=3 or b<>11);

-- zea-case: predicates/04-03
select id from dbo.a where name like N'A[_]%' escape N'!' and (a=4 or b<>14);

-- zea-case: predicates/04-04
  select id
  from dbo.a
 where name like N'A[_]%' escape N'!' and (a=5 or b<>17);

-- zea-case: predicates/04-05
select id from dbo.a where name like N'A[_]%' escape N'!' and (a=6 or b<>20);

-- zea-case: predicates/04-06
  select id
  from dbo.a
 where name like N'A[_]%' escape N'!' and (a=7 or b<>23);

-- zea-case: predicates/04-07
select id from dbo.a where name like N'A[_]%' escape N'!' and (a=8 or b<>26);

-- zea-case: predicates/04-08
  select id
  from dbo.a
 where name like N'A[_]%' escape N'!' and (a=9 or b<>29);

-- zea-case: predicates/04-09
select id from dbo.a where name like N'A[_]%' escape N'!' and (a=10 or b<>32);

-- zea-case: predicates/04-10
  select id
  from dbo.a
 where name like N'A[_]%' escape N'!' and (a=11 or b<>35);

-- zea-case: predicates/05-01
select id from dbo.a where amount >= 3 and amount < 20 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-02
  select id
  from dbo.a
 where amount >= 4 and amount < 23 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-03
select id from dbo.a where amount >= 5 and amount < 26 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-04
  select id
  from dbo.a
 where amount >= 6 and amount < 29 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-05
select id from dbo.a where amount >= 7 and amount < 32 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-06
  select id
  from dbo.a
 where amount >= 8 and amount < 35 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-07
select id from dbo.a where amount >= 9 and amount < 38 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-08
  select id
  from dbo.a
 where amount >= 10 and amount < 41 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-09
select id from dbo.a where amount >= 11 and amount < 44 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/05-10
  select id
  from dbo.a
 where amount >= 12 and amount < 47 and name collate Latin1_General_CI_AS = N'x';

-- zea-case: predicates/06-01
select id from dbo.a where x > all (select y from dbo.b where y<14) or x = some (select z from dbo.c);

-- zea-case: predicates/06-02
  select id
  from dbo.a
 where x > all (select y
  from dbo.b
 where y<17) or x = some (select z
  from dbo.c);

-- zea-case: predicates/06-03
select id from dbo.a where x > all (select y from dbo.b where y<20) or x = some (select z from dbo.c);

-- zea-case: predicates/06-04
  select id
  from dbo.a
 where x > all (select y
  from dbo.b
 where y<23) or x = some (select z
  from dbo.c);

-- zea-case: predicates/06-05
select id from dbo.a where x > all (select y from dbo.b where y<26) or x = some (select z from dbo.c);

-- zea-case: predicates/06-06
  select id
  from dbo.a
 where x > all (select y
  from dbo.b
 where y<29) or x = some (select z
  from dbo.c);

-- zea-case: predicates/06-07
select id from dbo.a where x > all (select y from dbo.b where y<32) or x = some (select z from dbo.c);

-- zea-case: predicates/06-08
  select id
  from dbo.a
 where x > all (select y
  from dbo.b
 where y<35) or x = some (select z
  from dbo.c);

-- zea-case: predicates/06-09
select id from dbo.a where x > all (select y from dbo.b where y<38) or x = some (select z from dbo.c);

-- zea-case: predicates/06-10
  select id
  from dbo.a
 where x > all (select y
  from dbo.b
 where y<41) or x = some (select z
  from dbo.c);

-- zea-case: joins/01-01
select a.id,b.title from dbo.a a join dbo.b b on a.id=b.id and b.flag=2;

-- zea-case: joins/01-02
  select a.id,b.title
  from dbo.a a join dbo.b b on a.id=b.id and b.flag=3;

-- zea-case: joins/01-03
select a.id,b.title from dbo.a a join dbo.b b on a.id=b.id and b.flag=4;

-- zea-case: joins/01-04
  select a.id,b.title
  from dbo.a a join dbo.b b on a.id=b.id and b.flag=5;

-- zea-case: joins/01-05
select a.id,b.title from dbo.a a join dbo.b b on a.id=b.id and b.flag=6;

-- zea-case: joins/01-06
  select a.id,b.title
  from dbo.a a join dbo.b b on a.id=b.id and b.flag=7;

-- zea-case: joins/01-07
select a.id,b.title from dbo.a a join dbo.b b on a.id=b.id and b.flag=8;

-- zea-case: joins/01-08
  select a.id,b.title
  from dbo.a a join dbo.b b on a.id=b.id and b.flag=9;

-- zea-case: joins/01-09
select a.id,b.title from dbo.a a join dbo.b b on a.id=b.id and b.flag=10;

-- zea-case: joins/01-10
  select a.id,b.title
  from dbo.a a join dbo.b b on a.id=b.id and b.flag=11;

-- zea-case: joins/02-01
select a.id from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=3;

-- zea-case: joins/02-02
  select a.id
  from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=4;

-- zea-case: joins/02-03
select a.id from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=5;

-- zea-case: joins/02-04
  select a.id
  from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=6;

-- zea-case: joins/02-05
select a.id from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=7;

-- zea-case: joins/02-06
  select a.id
  from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=8;

-- zea-case: joins/02-07
select a.id from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=9;

-- zea-case: joins/02-08
  select a.id
  from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=10;

-- zea-case: joins/02-09
select a.id from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=11;

-- zea-case: joins/02-10
  select a.id
  from dbo.a a left outer join dbo.b b on a.id=b.id right outer join dbo.c c on a.id=c.id and c.k=12;

-- zea-case: joins/03-01
select a.id,b.id from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>1;

-- zea-case: joins/03-02
  select a.id,b.id
  from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>2;

-- zea-case: joins/03-03
select a.id,b.id from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>3;

-- zea-case: joins/03-04
  select a.id,b.id
  from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>4;

-- zea-case: joins/03-05
select a.id,b.id from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>5;

-- zea-case: joins/03-06
  select a.id,b.id
  from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>6;

-- zea-case: joins/03-07
select a.id,b.id from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>7;

-- zea-case: joins/03-08
  select a.id,b.id
  from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>8;

-- zea-case: joins/03-09
select a.id,b.id from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>9;

-- zea-case: joins/03-10
  select a.id,b.id
  from dbo.a a full outer join dbo.b b on a.id=b.id and b.rank>10;

-- zea-case: joins/04-01
select * from dbo.a cross join dbo.b where a.id=2;

-- zea-case: joins/04-02
  select *
  from dbo.a cross join dbo.b
 where a.id=3;

-- zea-case: joins/04-03
select * from dbo.a cross join dbo.b where a.id=4;

-- zea-case: joins/04-04
  select *
  from dbo.a cross join dbo.b
 where a.id=5;

-- zea-case: joins/04-05
select * from dbo.a cross join dbo.b where a.id=6;

-- zea-case: joins/04-06
  select *
  from dbo.a cross join dbo.b
 where a.id=7;

-- zea-case: joins/04-07
select * from dbo.a cross join dbo.b where a.id=8;

-- zea-case: joins/04-08
  select *
  from dbo.a cross join dbo.b
 where a.id=9;

-- zea-case: joins/04-09
select * from dbo.a cross join dbo.b where a.id=10;

-- zea-case: joins/04-10
  select *
  from dbo.a cross join dbo.b
 where a.id=11;

-- zea-case: joins/05-01
-- zea-expect: ["SELECT a.id", "    ,q.y", "FROM dbo.a a", "OUTER APPLY (", "    SELECT TOP (3) b.y", "    FROM dbo.b b", "    WHERE b.aid = a.id", "    ORDER BY b.y DESC", "    ) q;"]
select a.id,q.y from dbo.a a outer apply (select top (3) b.y from dbo.b b where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-02
  select a.id,q.y
  from dbo.a a outer apply (select top (4) b.y
  from dbo.b b
 where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-03
select a.id,q.y from dbo.a a outer apply (select top (5) b.y from dbo.b b where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-04
  select a.id,q.y
  from dbo.a a outer apply (select top (6) b.y
  from dbo.b b
 where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-05
select a.id,q.y from dbo.a a outer apply (select top (7) b.y from dbo.b b where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-06
  select a.id,q.y
  from dbo.a a outer apply (select top (8) b.y
  from dbo.b b
 where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-07
select a.id,q.y from dbo.a a outer apply (select top (9) b.y from dbo.b b where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-08
  select a.id,q.y
  from dbo.a a outer apply (select top (10) b.y
  from dbo.b b
 where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-09
select a.id,q.y from dbo.a a outer apply (select top (11) b.y from dbo.b b where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/05-10
  select a.id,q.y
  from dbo.a a outer apply (select top (12) b.y
  from dbo.b b
 where b.aid=a.id order by b.y desc) q;

-- zea-case: joins/06-01
select a.id,q.n from dbo.a a cross apply (values(a.id+1)) as q(n);

-- zea-case: joins/06-02
  select a.id,q.n
  from dbo.a a cross apply (values(a.id+2)) as q(n);

-- zea-case: joins/06-03
select a.id,q.n from dbo.a a cross apply (values(a.id+3)) as q(n);

-- zea-case: joins/06-04
  select a.id,q.n
  from dbo.a a cross apply (values(a.id+4)) as q(n);

-- zea-case: joins/06-05
select a.id,q.n from dbo.a a cross apply (values(a.id+5)) as q(n);

-- zea-case: joins/06-06
  select a.id,q.n
  from dbo.a a cross apply (values(a.id+6)) as q(n);

-- zea-case: joins/06-07
select a.id,q.n from dbo.a a cross apply (values(a.id+7)) as q(n);

-- zea-case: joins/06-08
  select a.id,q.n
  from dbo.a a cross apply (values(a.id+8)) as q(n);

-- zea-case: joins/06-09
select a.id,q.n from dbo.a a cross apply (values(a.id+9)) as q(n);

-- zea-case: joins/06-10
  select a.id,q.n
  from dbo.a a cross apply (values(a.id+10)) as q(n);

-- zea-case: joins/07-01
-- zea-expect: ["SELECT a.id", "FROM dbo.a a", "INNER HASH JOIN dbo.b b ON a.id = b.id", "OPTION (MAXDOP 2);"]
select a.id from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 2);

-- zea-case: joins/07-02
  select a.id
  from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 3);

-- zea-case: joins/07-03
select a.id from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 4);

-- zea-case: joins/07-04
  select a.id
  from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 5);

-- zea-case: joins/07-05
select a.id from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 6);

-- zea-case: joins/07-06
  select a.id
  from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 7);

-- zea-case: joins/07-07
select a.id from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 8);

-- zea-case: joins/07-08
  select a.id
  from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 9);

-- zea-case: joins/07-09
select a.id from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 10);

-- zea-case: joins/07-10
  select a.id
  from dbo.a a inner hash join dbo.b b on a.id=b.id option (maxdop 11);

-- zea-case: joins/08-01
select a.id from dbo.a a, dbo.b b where a.id=b.id and b.id=3;

-- zea-case: joins/08-02
  select a.id
  from dbo.a a, dbo.b b
 where a.id=b.id and b.id=4;

-- zea-case: joins/08-03
select a.id from dbo.a a, dbo.b b where a.id=b.id and b.id=5;

-- zea-case: joins/08-04
  select a.id
  from dbo.a a, dbo.b b
 where a.id=b.id and b.id=6;

-- zea-case: joins/08-05
select a.id from dbo.a a, dbo.b b where a.id=b.id and b.id=7;

-- zea-case: joins/08-06
  select a.id
  from dbo.a a, dbo.b b
 where a.id=b.id and b.id=8;

-- zea-case: joins/08-07
select a.id from dbo.a a, dbo.b b where a.id=b.id and b.id=9;

-- zea-case: joins/08-08
  select a.id
  from dbo.a a, dbo.b b
 where a.id=b.id and b.id=10;

-- zea-case: joins/08-09
select a.id from dbo.a a, dbo.b b where a.id=b.id and b.id=11;

-- zea-case: joins/08-10
  select a.id
  from dbo.a a, dbo.b b
 where a.id=b.id and b.id=12;

-- zea-case: aggregates/01-01
select grp,count(*),sum(amount),avg(amount) from dbo.sales group by grp having sum(amount)>2;

-- zea-case: aggregates/01-02
  select grp,count(*),sum(amount),avg(amount)
  from dbo.sales group by grp having sum(amount)>3;

-- zea-case: aggregates/01-03
select grp,count(*),sum(amount),avg(amount) from dbo.sales group by grp having sum(amount)>4;

-- zea-case: aggregates/01-04
  select grp,count(*),sum(amount),avg(amount)
  from dbo.sales group by grp having sum(amount)>5;

-- zea-case: aggregates/01-05
select grp,count(*),sum(amount),avg(amount) from dbo.sales group by grp having sum(amount)>6;

-- zea-case: aggregates/01-06
  select grp,count(*),sum(amount),avg(amount)
  from dbo.sales group by grp having sum(amount)>7;

-- zea-case: aggregates/01-07
select grp,count(*),sum(amount),avg(amount) from dbo.sales group by grp having sum(amount)>8;

-- zea-case: aggregates/01-08
  select grp,count(*),sum(amount),avg(amount)
  from dbo.sales group by grp having sum(amount)>9;

-- zea-case: aggregates/01-09
select grp,count(*),sum(amount),avg(amount) from dbo.sales group by grp having sum(amount)>10;

-- zea-case: aggregates/01-10
  select grp,count(*),sum(amount),avg(amount)
  from dbo.sales group by grp having sum(amount)>11;

-- zea-case: aggregates/02-01
select region,product,sum(amount) from dbo.sales group by rollup(region,product) having count(*)>3;

-- zea-case: aggregates/02-02
  select region,product,sum(amount)
  from dbo.sales group by rollup(region,product) having count(*)>4;

-- zea-case: aggregates/02-03
select region,product,sum(amount) from dbo.sales group by rollup(region,product) having count(*)>5;

-- zea-case: aggregates/02-04
  select region,product,sum(amount)
  from dbo.sales group by rollup(region,product) having count(*)>6;

-- zea-case: aggregates/02-05
select region,product,sum(amount) from dbo.sales group by rollup(region,product) having count(*)>7;

-- zea-case: aggregates/02-06
  select region,product,sum(amount)
  from dbo.sales group by rollup(region,product) having count(*)>8;

-- zea-case: aggregates/02-07
select region,product,sum(amount) from dbo.sales group by rollup(region,product) having count(*)>9;

-- zea-case: aggregates/02-08
  select region,product,sum(amount)
  from dbo.sales group by rollup(region,product) having count(*)>10;

-- zea-case: aggregates/02-09
select region,product,sum(amount) from dbo.sales group by rollup(region,product) having count(*)>11;

-- zea-case: aggregates/02-10
  select region,product,sum(amount)
  from dbo.sales group by rollup(region,product) having count(*)>12;

-- zea-case: aggregates/03-01
-- zea-expect: ["SELECT region", "    ,product", "    ,SUM(amount)", "FROM dbo.sales", "GROUP BY GROUPING sets((", "            region", "            ,product", "            ), (region), ())", "HAVING SUM(amount) > 1;"]
select region,product,sum(amount) from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>1;

-- zea-case: aggregates/03-02
  select region,product,sum(amount)
  from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>2;

-- zea-case: aggregates/03-03
select region,product,sum(amount) from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>3;

-- zea-case: aggregates/03-04
  select region,product,sum(amount)
  from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>4;

-- zea-case: aggregates/03-05
select region,product,sum(amount) from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>5;

-- zea-case: aggregates/03-06
  select region,product,sum(amount)
  from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>6;

-- zea-case: aggregates/03-07
select region,product,sum(amount) from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>7;

-- zea-case: aggregates/03-08
  select region,product,sum(amount)
  from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>8;

-- zea-case: aggregates/03-09
select region,product,sum(amount) from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>9;

-- zea-case: aggregates/03-10
  select region,product,sum(amount)
  from dbo.sales group by grouping sets((region,product),(region),()) having sum(amount)>10;

-- zea-case: aggregates/04-01
-- zea-expect: ["SELECT id", "    ,SUM(amount) OVER (", "        PARTITION BY grp ORDER BY id ROWS BETWEEN 2 preceding", "                AND CURRENT row", "        ) AS running", "FROM dbo.sales;"]
select id, sum(amount) over(partition by grp order by id rows between 2 preceding and current row) as running from dbo.sales;

-- zea-case: aggregates/04-02
  select id, sum(amount) over(partition by grp order by id rows between 3 preceding and current row) as running
  from dbo.sales;

-- zea-case: aggregates/04-03
select id, sum(amount) over(partition by grp order by id rows between 4 preceding and current row) as running from dbo.sales;

-- zea-case: aggregates/04-04
  select id, sum(amount) over(partition by grp order by id rows between 5 preceding and current row) as running
  from dbo.sales;

-- zea-case: aggregates/04-05
select id, sum(amount) over(partition by grp order by id rows between 6 preceding and current row) as running from dbo.sales;

-- zea-case: aggregates/04-06
  select id, sum(amount) over(partition by grp order by id rows between 7 preceding and current row) as running
  from dbo.sales;

-- zea-case: aggregates/04-07
select id, sum(amount) over(partition by grp order by id rows between 8 preceding and current row) as running from dbo.sales;

-- zea-case: aggregates/04-08
  select id, sum(amount) over(partition by grp order by id rows between 9 preceding and current row) as running
  from dbo.sales;

-- zea-case: aggregates/04-09
select id, sum(amount) over(partition by grp order by id rows between 10 preceding and current row) as running from dbo.sales;

-- zea-case: aggregates/04-10
  select id, sum(amount) over(partition by grp order by id rows between 11 preceding and current row) as running
  from dbo.sales;

-- zea-case: aggregates/05-01
select id,row_number() over(partition by grp order by amount desc,id), lag(amount,3,0) over (order by id) from dbo.sales;

-- zea-case: aggregates/05-02
  select id,row_number() over(partition by grp order by amount desc,id), lag(amount,4,0) over (order by id)
  from dbo.sales;

-- zea-case: aggregates/05-03
select id,row_number() over(partition by grp order by amount desc,id), lag(amount,5,0) over (order by id) from dbo.sales;

-- zea-case: aggregates/05-04
  select id,row_number() over(partition by grp order by amount desc,id), lag(amount,6,0) over (order by id)
  from dbo.sales;

-- zea-case: aggregates/05-05
select id,row_number() over(partition by grp order by amount desc,id), lag(amount,7,0) over (order by id) from dbo.sales;

-- zea-case: aggregates/05-06
  select id,row_number() over(partition by grp order by amount desc,id), lag(amount,8,0) over (order by id)
  from dbo.sales;

-- zea-case: aggregates/05-07
select id,row_number() over(partition by grp order by amount desc,id), lag(amount,9,0) over (order by id) from dbo.sales;

-- zea-case: aggregates/05-08
  select id,row_number() over(partition by grp order by amount desc,id), lag(amount,10,0) over (order by id)
  from dbo.sales;

-- zea-case: aggregates/05-09
select id,row_number() over(partition by grp order by amount desc,id), lag(amount,11,0) over (order by id) from dbo.sales;

-- zea-case: aggregates/05-10
  select id,row_number() over(partition by grp order by amount desc,id), lag(amount,12,0) over (order by id)
  from dbo.sales;

-- zea-case: aggregates/06-01
select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name) from dbo.a where id>1 group by grp;

-- zea-case: aggregates/06-02
  select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name)
  from dbo.a
 where id>2 group by grp;

-- zea-case: aggregates/06-03
select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name) from dbo.a where id>3 group by grp;

-- zea-case: aggregates/06-04
  select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name)
  from dbo.a
 where id>4 group by grp;

-- zea-case: aggregates/06-05
select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name) from dbo.a where id>5 group by grp;

-- zea-case: aggregates/06-06
  select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name)
  from dbo.a
 where id>6 group by grp;

-- zea-case: aggregates/06-07
select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name) from dbo.a where id>7 group by grp;

-- zea-case: aggregates/06-08
  select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name)
  from dbo.a
 where id>8 group by grp;

-- zea-case: aggregates/06-09
select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name) from dbo.a where id>9 group by grp;

-- zea-case: aggregates/06-10
  select grp, string_agg(cast(name as nvarchar(max)),N',') within group(order by name)
  from dbo.a
 where id>10 group by grp;

-- zea-case: set_cte_case/01-01
select id from dbo.a where id>2 union all select id from dbo.b intersect select id from dbo.c except select id from dbo.d;

-- zea-case: set_cte_case/01-02
  select id
  from dbo.a
 where id>3 union all select id
  from dbo.b intersect select id
  from dbo.c except select id
  from dbo.d;

-- zea-case: set_cte_case/01-03
select id from dbo.a where id>4 union all select id from dbo.b intersect select id from dbo.c except select id from dbo.d;

-- zea-case: set_cte_case/01-04
  select id
  from dbo.a
 where id>5 union all select id
  from dbo.b intersect select id
  from dbo.c except select id
  from dbo.d;

-- zea-case: set_cte_case/01-05
select id from dbo.a where id>6 union all select id from dbo.b intersect select id from dbo.c except select id from dbo.d;

-- zea-case: set_cte_case/01-06
  select id
  from dbo.a
 where id>7 union all select id
  from dbo.b intersect select id
  from dbo.c except select id
  from dbo.d;

-- zea-case: set_cte_case/01-07
select id from dbo.a where id>8 union all select id from dbo.b intersect select id from dbo.c except select id from dbo.d;

-- zea-case: set_cte_case/01-08
  select id
  from dbo.a
 where id>9 union all select id
  from dbo.b intersect select id
  from dbo.c except select id
  from dbo.d;

-- zea-case: set_cte_case/01-09
select id from dbo.a where id>10 union all select id from dbo.b intersect select id from dbo.c except select id from dbo.d;

-- zea-case: set_cte_case/01-10
  select id
  from dbo.a
 where id>11 union all select id
  from dbo.b intersect select id
  from dbo.c except select id
  from dbo.d;

-- zea-case: set_cte_case/02-01
;with x as (select id,amount from dbo.a where id>3), y as (select id,sum(amount) s from x group by id) select y.id,y.s from y;

-- zea-case: set_cte_case/02-02
  ;with x as (select id,amount
  from dbo.a
 where id>4), y as (select id,sum(amount) s
  from x group by id) select y.id,y.s
  from y;

-- zea-case: set_cte_case/02-03
;with x as (select id,amount from dbo.a where id>5), y as (select id,sum(amount) s from x group by id) select y.id,y.s from y;

-- zea-case: set_cte_case/02-04
  ;with x as (select id,amount
  from dbo.a
 where id>6), y as (select id,sum(amount) s
  from x group by id) select y.id,y.s
  from y;

-- zea-case: set_cte_case/02-05
;with x as (select id,amount from dbo.a where id>7), y as (select id,sum(amount) s from x group by id) select y.id,y.s from y;

-- zea-case: set_cte_case/02-06
  ;with x as (select id,amount
  from dbo.a
 where id>8), y as (select id,sum(amount) s
  from x group by id) select y.id,y.s
  from y;

-- zea-case: set_cte_case/02-07
;with x as (select id,amount from dbo.a where id>9), y as (select id,sum(amount) s from x group by id) select y.id,y.s from y;

-- zea-case: set_cte_case/02-08
  ;with x as (select id,amount
  from dbo.a
 where id>10), y as (select id,sum(amount) s
  from x group by id) select y.id,y.s
  from y;

-- zea-case: set_cte_case/02-09
;with x as (select id,amount from dbo.a where id>11), y as (select id,sum(amount) s from x group by id) select y.id,y.s from y;

-- zea-case: set_cte_case/02-10
  ;with x as (select id,amount
  from dbo.a
 where id>12), y as (select id,sum(amount) s
  from x group by id) select y.id,y.s
  from y;

-- zea-case: set_cte_case/03-01
-- zea-expect: [";", "", "WITH nums (n)", "AS (", "    SELECT 1", "    ", "    UNION ALL", "    ", "    SELECT n + 1", "    FROM nums", "    WHERE n < 14", "    )", "SELECT n", "FROM nums", "OPTION (MAXRECURSION 100);"]
;with nums(n) as (select 1 union all select n+1 from nums where n<14) select n from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-02
  ;with nums(n) as (select 2 union all select n+1
  from nums
 where n<17) select n
  from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-03
;with nums(n) as (select 3 union all select n+1 from nums where n<20) select n from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-04
  ;with nums(n) as (select 4 union all select n+1
  from nums
 where n<23) select n
  from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-05
;with nums(n) as (select 5 union all select n+1 from nums where n<26) select n from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-06
  ;with nums(n) as (select 6 union all select n+1
  from nums
 where n<29) select n
  from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-07
;with nums(n) as (select 7 union all select n+1 from nums where n<32) select n from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-08
  ;with nums(n) as (select 8 union all select n+1
  from nums
 where n<35) select n
  from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-09
;with nums(n) as (select 9 union all select n+1 from nums where n<38) select n from nums option(maxrecursion 100);

-- zea-case: set_cte_case/03-10
  ;with nums(n) as (select 10 union all select n+1
  from nums
 where n<41) select n
  from nums option(maxrecursion 100);

-- zea-case: set_cte_case/04-01
select case status when 2 then 'open' when 8 then 'held' else 'closed' end as label, id from dbo.a;

-- zea-case: set_cte_case/04-02
  select case status when 3 then 'open' when 11 then 'held' else 'closed' end as label, id
  from dbo.a;

-- zea-case: set_cte_case/04-03
select case status when 4 then 'open' when 14 then 'held' else 'closed' end as label, id from dbo.a;

-- zea-case: set_cte_case/04-04
  select case status when 5 then 'open' when 17 then 'held' else 'closed' end as label, id
  from dbo.a;

-- zea-case: set_cte_case/04-05
select case status when 6 then 'open' when 20 then 'held' else 'closed' end as label, id from dbo.a;

-- zea-case: set_cte_case/04-06
  select case status when 7 then 'open' when 23 then 'held' else 'closed' end as label, id
  from dbo.a;

-- zea-case: set_cte_case/04-07
select case status when 8 then 'open' when 26 then 'held' else 'closed' end as label, id from dbo.a;

-- zea-case: set_cte_case/04-08
  select case status when 9 then 'open' when 29 then 'held' else 'closed' end as label, id
  from dbo.a;

-- zea-case: set_cte_case/04-09
select case status when 10 then 'open' when 32 then 'held' else 'closed' end as label, id from dbo.a;

-- zea-case: set_cte_case/04-10
  select case status when 11 then 'open' when 35 then 'held' else 'closed' end as label, id
  from dbo.a;

-- zea-case: set_cte_case/05-01
select case when x>3 then case when x>11 then 'high' else 'mid' end else 'low' end from dbo.a;

-- zea-case: set_cte_case/05-02
  select case when x>4 then case when x>14 then 'high' else 'mid' end else 'low' end
  from dbo.a;

-- zea-case: set_cte_case/05-03
select case when x>5 then case when x>17 then 'high' else 'mid' end else 'low' end from dbo.a;

-- zea-case: set_cte_case/05-04
  select case when x>6 then case when x>20 then 'high' else 'mid' end else 'low' end
  from dbo.a;

-- zea-case: set_cte_case/05-05
select case when x>7 then case when x>23 then 'high' else 'mid' end else 'low' end from dbo.a;

-- zea-case: set_cte_case/05-06
  select case when x>8 then case when x>26 then 'high' else 'mid' end else 'low' end
  from dbo.a;

-- zea-case: set_cte_case/05-07
select case when x>9 then case when x>29 then 'high' else 'mid' end else 'low' end from dbo.a;

-- zea-case: set_cte_case/05-08
  select case when x>10 then case when x>32 then 'high' else 'mid' end else 'low' end
  from dbo.a;

-- zea-case: set_cte_case/05-09
select case when x>11 then case when x>35 then 'high' else 'mid' end else 'low' end from dbo.a;

-- zea-case: set_cte_case/05-10
  select case when x>12 then case when x>38 then 'high' else 'mid' end else 'low' end
  from dbo.a;

-- zea-case: set_cte_case/06-01
select d.id, coalesce(d.val, 1) n from (select id, sum(amount) val from dbo.a group by id) as d where d.val>5;

-- zea-case: set_cte_case/06-02
  select d.id, coalesce(d.val, 2) n
  from (select id, sum(amount) val
  from dbo.a group by id) as d
 where d.val>8;

-- zea-case: set_cte_case/06-03
select d.id, coalesce(d.val, 3) n from (select id, sum(amount) val from dbo.a group by id) as d where d.val>11;

-- zea-case: set_cte_case/06-04
  select d.id, coalesce(d.val, 4) n
  from (select id, sum(amount) val
  from dbo.a group by id) as d
 where d.val>14;

-- zea-case: set_cte_case/06-05
select d.id, coalesce(d.val, 5) n from (select id, sum(amount) val from dbo.a group by id) as d where d.val>17;

-- zea-case: set_cte_case/06-06
  select d.id, coalesce(d.val, 6) n
  from (select id, sum(amount) val
  from dbo.a group by id) as d
 where d.val>20;

-- zea-case: set_cte_case/06-07
select d.id, coalesce(d.val, 7) n from (select id, sum(amount) val from dbo.a group by id) as d where d.val>23;

-- zea-case: set_cte_case/06-08
  select d.id, coalesce(d.val, 8) n
  from (select id, sum(amount) val
  from dbo.a group by id) as d
 where d.val>26;

-- zea-case: set_cte_case/06-09
select d.id, coalesce(d.val, 9) n from (select id, sum(amount) val from dbo.a group by id) as d where d.val>29;

-- zea-case: set_cte_case/06-10
  select d.id, coalesce(d.val, 10) n
  from (select id, sum(amount) val
  from dbo.a group by id) as d
 where d.val>32;

-- zea-case: dml/01-01
insert into dbo.a (id,name,amount) values (2,N'A',8),(17,N'B',NULL);

-- zea-case: dml/01-02
  insert into dbo.a (id,name,amount) values (3,N'A',11),(20,N'B',NULL);

-- zea-case: dml/01-03
insert into dbo.a (id,name,amount) values (4,N'A',14),(23,N'B',NULL);

-- zea-case: dml/01-04
  insert into dbo.a (id,name,amount) values (5,N'A',17),(26,N'B',NULL);

-- zea-case: dml/01-05
insert into dbo.a (id,name,amount) values (6,N'A',20),(29,N'B',NULL);

-- zea-case: dml/01-06
  insert into dbo.a (id,name,amount) values (7,N'A',23),(32,N'B',NULL);

-- zea-case: dml/01-07
insert into dbo.a (id,name,amount) values (8,N'A',26),(35,N'B',NULL);

-- zea-case: dml/01-08
  insert into dbo.a (id,name,amount) values (9,N'A',29),(38,N'B',NULL);

-- zea-case: dml/01-09
insert into dbo.a (id,name,amount) values (10,N'A',32),(41,N'B',NULL);

-- zea-case: dml/01-10
  insert into dbo.a (id,name,amount) values (11,N'A',35),(44,N'B',NULL);

-- zea-case: dml/02-01
insert dbo.b(id,k) output inserted.id select a.id,a.k from dbo.a a where a.id>3;

-- zea-case: dml/02-02
  insert dbo.b(id,k) output inserted.id select a.id,a.k
  from dbo.a a
 where a.id>4;

-- zea-case: dml/02-03
insert dbo.b(id,k) output inserted.id select a.id,a.k from dbo.a a where a.id>5;

-- zea-case: dml/02-04
  insert dbo.b(id,k) output inserted.id select a.id,a.k
  from dbo.a a
 where a.id>6;

-- zea-case: dml/02-05
insert dbo.b(id,k) output inserted.id select a.id,a.k from dbo.a a where a.id>7;

-- zea-case: dml/02-06
  insert dbo.b(id,k) output inserted.id select a.id,a.k
  from dbo.a a
 where a.id>8;

-- zea-case: dml/02-07
insert dbo.b(id,k) output inserted.id select a.id,a.k from dbo.a a where a.id>9;

-- zea-case: dml/02-08
  insert dbo.b(id,k) output inserted.id select a.id,a.k
  from dbo.a a
 where a.id>10;

-- zea-case: dml/02-09
insert dbo.b(id,k) output inserted.id select a.id,a.k from dbo.a a where a.id>11;

-- zea-case: dml/02-10
  insert dbo.b(id,k) output inserted.id select a.id,a.k
  from dbo.a a
 where a.id>12;

-- zea-case: dml/03-01
-- zea-expect: ["UPDATE a", "SET amount = amount + 1", "    ,k = 5", "OUTPUT inserted.id", "    ,deleted.amount", "FROM dbo.a a", "INNER JOIN dbo.b b ON a.id = b.id", "WHERE b.flag = 1;"]
update a set amount=amount+1, k=5 output inserted.id, deleted.amount from dbo.a a join dbo.b b on a.id=b.id where b.flag=1;

-- zea-case: dml/03-02
  update a set amount=amount+2, k=8 output inserted.id, deleted.amount
  from dbo.a a join dbo.b b on a.id=b.id
 where b.flag=1;

-- zea-case: dml/03-03
update a set amount=amount+3, k=11 output inserted.id, deleted.amount from dbo.a a join dbo.b b on a.id=b.id where b.flag=1;

-- zea-case: dml/03-04
  update a set amount=amount+4, k=14 output inserted.id, deleted.amount
  from dbo.a a join dbo.b b on a.id=b.id
 where b.flag=1;

-- zea-case: dml/03-05
update a set amount=amount+5, k=17 output inserted.id, deleted.amount from dbo.a a join dbo.b b on a.id=b.id where b.flag=1;

-- zea-case: dml/03-06
  update a set amount=amount+6, k=20 output inserted.id, deleted.amount
  from dbo.a a join dbo.b b on a.id=b.id
 where b.flag=1;

-- zea-case: dml/03-07
update a set amount=amount+7, k=23 output inserted.id, deleted.amount from dbo.a a join dbo.b b on a.id=b.id where b.flag=1;

-- zea-case: dml/03-08
  update a set amount=amount+8, k=26 output inserted.id, deleted.amount
  from dbo.a a join dbo.b b on a.id=b.id
 where b.flag=1;

-- zea-case: dml/03-09
update a set amount=amount+9, k=29 output inserted.id, deleted.amount from dbo.a a join dbo.b b on a.id=b.id where b.flag=1;

-- zea-case: dml/03-10
  update a set amount=amount+10, k=32 output inserted.id, deleted.amount
  from dbo.a a join dbo.b b on a.id=b.id
 where b.flag=1;

-- zea-case: dml/04-01
delete a output deleted.id from dbo.a a join dbo.b b on b.id=a.id where a.id<2;

-- zea-case: dml/04-02
  delete a output deleted.id
  from dbo.a a join dbo.b b on b.id=a.id
 where a.id<3;

-- zea-case: dml/04-03
delete a output deleted.id from dbo.a a join dbo.b b on b.id=a.id where a.id<4;

-- zea-case: dml/04-04
  delete a output deleted.id
  from dbo.a a join dbo.b b on b.id=a.id
 where a.id<5;

-- zea-case: dml/04-05
delete a output deleted.id from dbo.a a join dbo.b b on b.id=a.id where a.id<6;

-- zea-case: dml/04-06
  delete a output deleted.id
  from dbo.a a join dbo.b b on b.id=a.id
 where a.id<7;

-- zea-case: dml/04-07
delete a output deleted.id from dbo.a a join dbo.b b on b.id=a.id where a.id<8;

-- zea-case: dml/04-08
  delete a output deleted.id
  from dbo.a a join dbo.b b on b.id=a.id
 where a.id<9;

-- zea-case: dml/04-09
delete a output deleted.id from dbo.a a join dbo.b b on b.id=a.id where a.id<10;

-- zea-case: dml/04-10
  delete a output deleted.id
  from dbo.a a join dbo.b b on b.id=a.id
 where a.id<11;

-- zea-case: dml/05-01
-- zea-expect: ["MERGE dbo.target AS t", "USING dbo.source AS s", "    ON t.id = s.id", "WHEN MATCHED", "    AND s.flag = 3", "    THEN", "        UPDATE", "        SET t.name = s.name", "WHEN NOT MATCHED", "    THEN", "        INSERT (", "            id", "            ,name", "            )", "        VALUES (", "            s.id", "            ,s.name", "            )", "OUTPUT $ACTION", "    ,inserted.id;"]
merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=3 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-02
  merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=4 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-03
merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=5 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-04
  merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=6 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-05
merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=7 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-06
  merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=8 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-07
merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=9 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-08
  merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=10 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-09
merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=11 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/05-10
  merge dbo.target as t using dbo.source as s on t.id=s.id when matched and s.flag=12 then update set t.name=s.name when not matched then insert(id,name) values(s.id,s.name) output $action, inserted.id;

-- zea-case: dml/06-01
with t as (select top (1) id from dbo.queue order by id) delete from t;

-- zea-case: dml/06-02
  with t as (select top (2) id
  from dbo.queue order by id) delete
  from t;

-- zea-case: dml/06-03
with t as (select top (3) id from dbo.queue order by id) delete from t;

-- zea-case: dml/06-04
  with t as (select top (4) id
  from dbo.queue order by id) delete
  from t;

-- zea-case: dml/06-05
with t as (select top (5) id from dbo.queue order by id) delete from t;

-- zea-case: dml/06-06
  with t as (select top (6) id
  from dbo.queue order by id) delete
  from t;

-- zea-case: dml/06-07
with t as (select top (7) id from dbo.queue order by id) delete from t;

-- zea-case: dml/06-08
  with t as (select top (8) id
  from dbo.queue order by id) delete
  from t;

-- zea-case: dml/06-09
with t as (select top (9) id from dbo.queue order by id) delete from t;

-- zea-case: dml/06-10
  with t as (select top (10) id
  from dbo.queue order by id) delete
  from t;

-- zea-case: ddl/01-01
-- zea-expect: ["CREATE TABLE dbo.T_2 (", "    id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY", "    ,label NVARCHAR(200) NULL", "    ,amount DECIMAL(12, 2) DEFAULT(8)", "    ,CHECK (amount >= 0)", "    );"]
create table dbo.T_2(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (8), check(amount>=0));

-- zea-case: ddl/01-02
  create table dbo.T_3(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (11), check(amount>=0));

-- zea-case: ddl/01-03
create table dbo.T_4(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (14), check(amount>=0));

-- zea-case: ddl/01-04
  create table dbo.T_5(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (17), check(amount>=0));

-- zea-case: ddl/01-05
create table dbo.T_6(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (20), check(amount>=0));

-- zea-case: ddl/01-06
  create table dbo.T_7(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (23), check(amount>=0));

-- zea-case: ddl/01-07
create table dbo.T_8(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (26), check(amount>=0));

-- zea-case: ddl/01-08
  create table dbo.T_9(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (29), check(amount>=0));

-- zea-case: ddl/01-09
create table dbo.T_10(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (32), check(amount>=0));

-- zea-case: ddl/01-10
  create table dbo.T_11(id int identity(1,1) not null primary key, label nvarchar(200) null, amount decimal(12,2) default (35), check(amount>=0));

-- zea-case: ddl/02-01
alter table dbo.T_3 add constraint FK_3 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-02
  alter table dbo.T_4 add constraint FK_4 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-03
alter table dbo.T_5 add constraint FK_5 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-04
  alter table dbo.T_6 add constraint FK_6 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-05
alter table dbo.T_7 add constraint FK_7 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-06
  alter table dbo.T_8 add constraint FK_8 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-07
alter table dbo.T_9 add constraint FK_9 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-08
  alter table dbo.T_10 add constraint FK_10 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-09
alter table dbo.T_11 add constraint FK_11 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/02-10
  alter table dbo.T_12 add constraint FK_12 foreign key(customer_id) references dbo.customers(id) on delete cascade;

-- zea-case: ddl/03-01
create unique nonclustered index IX_1 on dbo.a (grp asc,id desc) include (amount,name) where active=1 with (fillfactor=90);

-- zea-case: ddl/03-02
  create unique nonclustered index IX_2 on dbo.a (grp asc,id desc) include (amount,name)
 where active=1 with (fillfactor=90);

-- zea-case: ddl/03-03
create unique nonclustered index IX_3 on dbo.a (grp asc,id desc) include (amount,name) where active=1 with (fillfactor=90);

-- zea-case: ddl/03-04
  create unique nonclustered index IX_4 on dbo.a (grp asc,id desc) include (amount,name)
 where active=1 with (fillfactor=90);

-- zea-case: ddl/03-05
create unique nonclustered index IX_5 on dbo.a (grp asc,id desc) include (amount,name) where active=1 with (fillfactor=90);

-- zea-case: ddl/03-06
  create unique nonclustered index IX_6 on dbo.a (grp asc,id desc) include (amount,name)
 where active=1 with (fillfactor=90);

-- zea-case: ddl/03-07
create unique nonclustered index IX_7 on dbo.a (grp asc,id desc) include (amount,name) where active=1 with (fillfactor=90);

-- zea-case: ddl/03-08
  create unique nonclustered index IX_8 on dbo.a (grp asc,id desc) include (amount,name)
 where active=1 with (fillfactor=90);

-- zea-case: ddl/03-09
create unique nonclustered index IX_9 on dbo.a (grp asc,id desc) include (amount,name) where active=1 with (fillfactor=90);

-- zea-case: ddl/03-10
  create unique nonclustered index IX_10 on dbo.a (grp asc,id desc) include (amount,name)
 where active=1 with (fillfactor=90);

-- zea-case: ddl/04-01
drop table if exists dbo.T_2;
truncate table dbo.Other_2;

-- zea-case: ddl/04-02
  drop table if exists dbo.T_3;
truncate table dbo.Other_3;

-- zea-case: ddl/04-03
drop table if exists dbo.T_4;
truncate table dbo.Other_4;

-- zea-case: ddl/04-04
  drop table if exists dbo.T_5;
truncate table dbo.Other_5;

-- zea-case: ddl/04-05
drop table if exists dbo.T_6;
truncate table dbo.Other_6;

-- zea-case: ddl/04-06
  drop table if exists dbo.T_7;
truncate table dbo.Other_7;

-- zea-case: ddl/04-07
drop table if exists dbo.T_8;
truncate table dbo.Other_8;

-- zea-case: ddl/04-08
  drop table if exists dbo.T_9;
truncate table dbo.Other_9;

-- zea-case: ddl/04-09
drop table if exists dbo.T_10;
truncate table dbo.Other_10;

-- zea-case: ddl/04-10
  drop table if exists dbo.T_11;
truncate table dbo.Other_11;

-- zea-case: ddl/05-01
create view dbo.V_3 as select id,amount from dbo.a where id>11;
GO

-- zea-case: ddl/05-02
  create view dbo.V_4 as select id,amount
  from dbo.a
 where id>14;
GO

-- zea-case: ddl/05-03
create view dbo.V_5 as select id,amount from dbo.a where id>17;
GO

-- zea-case: ddl/05-04
  create view dbo.V_6 as select id,amount
  from dbo.a
 where id>20;
GO

-- zea-case: ddl/05-05
create view dbo.V_7 as select id,amount from dbo.a where id>23;
GO

-- zea-case: ddl/05-06
  create view dbo.V_8 as select id,amount
  from dbo.a
 where id>26;
GO

-- zea-case: ddl/05-07
create view dbo.V_9 as select id,amount from dbo.a where id>29;
GO

-- zea-case: ddl/05-08
  create view dbo.V_10 as select id,amount
  from dbo.a
 where id>32;
GO

-- zea-case: ddl/05-09
create view dbo.V_11 as select id,amount from dbo.a where id>35;
GO

-- zea-case: ddl/05-10
  create view dbo.V_12 as select id,amount
  from dbo.a
 where id>38;
GO

-- zea-case: ddl/06-01
create or alter function dbo.F_1(@x int) returns int as begin return @x+5; end;
GO

-- zea-case: ddl/06-02
  create or alter function dbo.F_2(@x int) returns int as begin return @x+8; end;
GO

-- zea-case: ddl/06-03
create or alter function dbo.F_3(@x int) returns int as begin return @x+11; end;
GO

-- zea-case: ddl/06-04
  create or alter function dbo.F_4(@x int) returns int as begin return @x+14; end;
GO

-- zea-case: ddl/06-05
create or alter function dbo.F_5(@x int) returns int as begin return @x+17; end;
GO

-- zea-case: ddl/06-06
  create or alter function dbo.F_6(@x int) returns int as begin return @x+20; end;
GO

-- zea-case: ddl/06-07
create or alter function dbo.F_7(@x int) returns int as begin return @x+23; end;
GO

-- zea-case: ddl/06-08
  create or alter function dbo.F_8(@x int) returns int as begin return @x+26; end;
GO

-- zea-case: ddl/06-09
create or alter function dbo.F_9(@x int) returns int as begin return @x+29; end;
GO

-- zea-case: ddl/06-10
  create or alter function dbo.F_10(@x int) returns int as begin return @x+32; end;
GO

-- zea-case: procedural/01-01
declare @i int=2, @j int=8; set @i += @j; select @i, @j;

-- zea-case: procedural/01-02
  declare @i int=3, @j int=11; set @i += @j; select @i, @j;

-- zea-case: procedural/01-03
declare @i int=4, @j int=14; set @i += @j; select @i, @j;

-- zea-case: procedural/01-04
  declare @i int=5, @j int=17; set @i += @j; select @i, @j;

-- zea-case: procedural/01-05
declare @i int=6, @j int=20; set @i += @j; select @i, @j;

-- zea-case: procedural/01-06
  declare @i int=7, @j int=23; set @i += @j; select @i, @j;

-- zea-case: procedural/01-07
declare @i int=8, @j int=26; set @i += @j; select @i, @j;

-- zea-case: procedural/01-08
  declare @i int=9, @j int=29; set @i += @j; select @i, @j;

-- zea-case: procedural/01-09
declare @i int=10, @j int=32; set @i += @j; select @i, @j;

-- zea-case: procedural/01-10
  declare @i int=11, @j int=35; set @i += @j; select @i, @j;

-- zea-case: procedural/02-01
-- zea-expect: ["IF 3 = 11", "    SELECT 1;", "ELSE IF 3 < 20", "BEGIN", "    SELECT 3;", "END", "ELSE", "    SELECT 0;"]
if 3=11 select 1; else if 3<20 begin select 3; end else select 0;

-- zea-case: procedural/02-02
  if 4=14 select 1; else if 4<23 begin select 4; end else select 0;

-- zea-case: procedural/02-03
if 5=17 select 1; else if 5<26 begin select 5; end else select 0;

-- zea-case: procedural/02-04
  if 6=20 select 1; else if 6<29 begin select 6; end else select 0;

-- zea-case: procedural/02-05
if 7=23 select 1; else if 7<32 begin select 7; end else select 0;

-- zea-case: procedural/02-06
  if 8=26 select 1; else if 8<35 begin select 8; end else select 0;

-- zea-case: procedural/02-07
if 9=29 select 1; else if 9<38 begin select 9; end else select 0;

-- zea-case: procedural/02-08
  if 10=32 select 1; else if 10<41 begin select 10; end else select 0;

-- zea-case: procedural/02-09
if 11=35 select 1; else if 11<44 begin select 11; end else select 0;

-- zea-case: procedural/02-10
  if 12=38 select 1; else if 12<47 begin select 12; end else select 0;

-- zea-case: procedural/03-01
declare @i int=0; while @i<1 begin set @i+=1; if @i=5 break; continue; end;

-- zea-case: procedural/03-02
  declare @i int=0; while @i<2 begin set @i+=1; if @i=8 break; continue; end;

-- zea-case: procedural/03-03
declare @i int=0; while @i<3 begin set @i+=1; if @i=11 break; continue; end;

-- zea-case: procedural/03-04
  declare @i int=0; while @i<4 begin set @i+=1; if @i=14 break; continue; end;

-- zea-case: procedural/03-05
declare @i int=0; while @i<5 begin set @i+=1; if @i=17 break; continue; end;

-- zea-case: procedural/03-06
  declare @i int=0; while @i<6 begin set @i+=1; if @i=20 break; continue; end;

-- zea-case: procedural/03-07
declare @i int=0; while @i<7 begin set @i+=1; if @i=23 break; continue; end;

-- zea-case: procedural/03-08
  declare @i int=0; while @i<8 begin set @i+=1; if @i=26 break; continue; end;

-- zea-case: procedural/03-09
declare @i int=0; while @i<9 begin set @i+=1; if @i=29 break; continue; end;

-- zea-case: procedural/03-10
  declare @i int=0; while @i<10 begin set @i+=1; if @i=32 break; continue; end;

-- zea-case: procedural/04-01
begin try select 2/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-02
  begin try select 3/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-03
begin try select 4/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-04
  begin try select 5/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-05
begin try select 6/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-06
  begin try select 7/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-07
begin try select 8/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-08
  begin try select 9/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-09
begin try select 10/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/04-10
  begin try select 11/0; end try begin catch select error_number(),error_message(); throw; end catch;

-- zea-case: procedural/05-01
begin transaction; save transaction sp_3; if @@trancount>0 rollback transaction sp_3; commit transaction;

-- zea-case: procedural/05-02
  begin transaction; save transaction sp_4; if @@trancount>0 rollback transaction sp_4; commit transaction;

-- zea-case: procedural/05-03
begin transaction; save transaction sp_5; if @@trancount>0 rollback transaction sp_5; commit transaction;

-- zea-case: procedural/05-04
  begin transaction; save transaction sp_6; if @@trancount>0 rollback transaction sp_6; commit transaction;

-- zea-case: procedural/05-05
begin transaction; save transaction sp_7; if @@trancount>0 rollback transaction sp_7; commit transaction;

-- zea-case: procedural/05-06
  begin transaction; save transaction sp_8; if @@trancount>0 rollback transaction sp_8; commit transaction;

-- zea-case: procedural/05-07
begin transaction; save transaction sp_9; if @@trancount>0 rollback transaction sp_9; commit transaction;

-- zea-case: procedural/05-08
  begin transaction; save transaction sp_10; if @@trancount>0 rollback transaction sp_10; commit transaction;

-- zea-case: procedural/05-09
begin transaction; save transaction sp_11; if @@trancount>0 rollback transaction sp_11; commit transaction;

-- zea-case: procedural/05-10
  begin transaction; save transaction sp_12; if @@trancount>0 rollback transaction sp_12; commit transaction;

-- zea-case: procedural/06-01
create or alter procedure dbo.P_1 @x int = 5, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-02
  create or alter procedure dbo.P_2 @x int = 8, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-03
create or alter procedure dbo.P_3 @x int = 11, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-04
  create or alter procedure dbo.P_4 @x int = 14, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-05
create or alter procedure dbo.P_5 @x int = 17, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-06
  create or alter procedure dbo.P_6 @x int = 20, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-07
create or alter procedure dbo.P_7 @x int = 23, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-08
  create or alter procedure dbo.P_8 @x int = 26, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-09
create or alter procedure dbo.P_9 @x int = 29, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/06-10
  create or alter procedure dbo.P_10 @x int = 32, @msg nvarchar(100) output as begin set nocount on; set @msg = N'ok'; select @x; end;
GO

-- zea-case: procedural/07-01
exec dbo.P_2 @x=8, @msg=@message output;

-- zea-case: procedural/07-02
  exec dbo.P_3 @x=11, @msg=@message output;

-- zea-case: procedural/07-03
exec dbo.P_4 @x=14, @msg=@message output;

-- zea-case: procedural/07-04
  exec dbo.P_5 @x=17, @msg=@message output;

-- zea-case: procedural/07-05
exec dbo.P_6 @x=20, @msg=@message output;

-- zea-case: procedural/07-06
  exec dbo.P_7 @x=23, @msg=@message output;

-- zea-case: procedural/07-07
exec dbo.P_8 @x=26, @msg=@message output;

-- zea-case: procedural/07-08
  exec dbo.P_9 @x=29, @msg=@message output;

-- zea-case: procedural/07-09
exec dbo.P_10 @x=32, @msg=@message output;

-- zea-case: procedural/07-10
  exec dbo.P_11 @x=35, @msg=@message output;

-- zea-case: procedural/08-01
declare c cursor local fast_forward for select id from dbo.a where id>3; open c; fetch next from c into @id; close c; deallocate c;

-- zea-case: procedural/08-02
  declare c cursor local fast_forward for select id
  from dbo.a
 where id>4; open c; fetch next
  from c into @id; close c; deallocate c;

-- zea-case: procedural/08-03
declare c cursor local fast_forward for select id from dbo.a where id>5; open c; fetch next from c into @id; close c; deallocate c;

-- zea-case: procedural/08-04
  declare c cursor local fast_forward for select id
  from dbo.a
 where id>6; open c; fetch next
  from c into @id; close c; deallocate c;

-- zea-case: procedural/08-05
declare c cursor local fast_forward for select id from dbo.a where id>7; open c; fetch next from c into @id; close c; deallocate c;

-- zea-case: procedural/08-06
  declare c cursor local fast_forward for select id
  from dbo.a
 where id>8; open c; fetch next
  from c into @id; close c; deallocate c;

-- zea-case: procedural/08-07
declare c cursor local fast_forward for select id from dbo.a where id>9; open c; fetch next from c into @id; close c; deallocate c;

-- zea-case: procedural/08-08
  declare c cursor local fast_forward for select id
  from dbo.a
 where id>10; open c; fetch next
  from c into @id; close c; deallocate c;

-- zea-case: procedural/08-09
declare c cursor local fast_forward for select id from dbo.a where id>11; open c; fetch next from c into @id; close c; deallocate c;

-- zea-case: procedural/08-10
  declare c cursor local fast_forward for select id
  from dbo.a
 where id>12; open c; fetch next
  from c into @id; close c; deallocate c;

-- zea-case: procedural/09-01
raiserror(N'case 1: %d',16,1,5) with nowait;

-- zea-case: procedural/09-02
  raiserror(N'case 2: %d',16,1,8) with nowait;

-- zea-case: procedural/09-03
raiserror(N'case 3: %d',16,1,11) with nowait;

-- zea-case: procedural/09-04
  raiserror(N'case 4: %d',16,1,14) with nowait;

-- zea-case: procedural/09-05
raiserror(N'case 5: %d',16,1,17) with nowait;

-- zea-case: procedural/09-06
  raiserror(N'case 6: %d',16,1,20) with nowait;

-- zea-case: procedural/09-07
raiserror(N'case 7: %d',16,1,23) with nowait;

-- zea-case: procedural/09-08
  raiserror(N'case 8: %d',16,1,26) with nowait;

-- zea-case: procedural/09-09
raiserror(N'case 9: %d',16,1,29) with nowait;

-- zea-case: procedural/09-10
  raiserror(N'case 10: %d',16,1,32) with nowait;

-- zea-case: procedural/10-01
exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=2;

-- zea-case: procedural/10-02
  exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=3;

-- zea-case: procedural/10-03
exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=4;

-- zea-case: procedural/10-04
  exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=5;

-- zea-case: procedural/10-05
exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=6;

-- zea-case: procedural/10-06
  exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=7;

-- zea-case: procedural/10-07
exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=8;

-- zea-case: procedural/10-08
  exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=9;

-- zea-case: procedural/10-09
exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=10;

-- zea-case: procedural/10-10
  exec sys.sp_executesql N'select @i as id, N''hello'' as label;', N'@i int', @i=11;

-- zea-case: advanced/01-01
select [A],[B] from (select bucket,qty from dbo.events where id>2) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-02
  select [A],[B]
  from (select bucket,qty
  from dbo.events
 where id>3) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-03
select [A],[B] from (select bucket,qty from dbo.events where id>4) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-04
  select [A],[B]
  from (select bucket,qty
  from dbo.events
 where id>5) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-05
select [A],[B] from (select bucket,qty from dbo.events where id>6) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-06
  select [A],[B]
  from (select bucket,qty
  from dbo.events
 where id>7) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-07
select [A],[B] from (select bucket,qty from dbo.events where id>8) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-08
  select [A],[B]
  from (select bucket,qty
  from dbo.events
 where id>9) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-09
select [A],[B] from (select bucket,qty from dbo.events where id>10) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/01-10
  select [A],[B]
  from (select bucket,qty
  from dbo.events
 where id>11) e pivot(sum(qty) for bucket in ([A],[B])) p;

-- zea-case: advanced/02-01
select x.id,t.tag from dbo.items x unpivot (val for tag in (a,b,c)) t where t.id>3;

-- zea-case: advanced/02-02
  select x.id,t.tag
  from dbo.items x unpivot (val for tag in (a,b,c)) t
 where t.id>4;

-- zea-case: advanced/02-03
select x.id,t.tag from dbo.items x unpivot (val for tag in (a,b,c)) t where t.id>5;

-- zea-case: advanced/02-04
  select x.id,t.tag
  from dbo.items x unpivot (val for tag in (a,b,c)) t
 where t.id>6;

-- zea-case: advanced/02-05
select x.id,t.tag from dbo.items x unpivot (val for tag in (a,b,c)) t where t.id>7;

-- zea-case: advanced/02-06
  select x.id,t.tag
  from dbo.items x unpivot (val for tag in (a,b,c)) t
 where t.id>8;

-- zea-case: advanced/02-07
select x.id,t.tag from dbo.items x unpivot (val for tag in (a,b,c)) t where t.id>9;

-- zea-case: advanced/02-08
  select x.id,t.tag
  from dbo.items x unpivot (val for tag in (a,b,c)) t
 where t.id>10;

-- zea-case: advanced/02-09
select x.id,t.tag from dbo.items x unpivot (val for tag in (a,b,c)) t where t.id>11;

-- zea-case: advanced/02-10
  select x.id,t.tag
  from dbo.items x unpivot (val for tag in (a,b,c)) t
 where t.id>12;

-- zea-case: advanced/03-01
-- zea-expect: ["SELECT a.id", "    ,j.code", "FROM dbo.a a", "CROSS APPLY OPENJSON(a.payload) WITH (code NVARCHAR(30) '$.code') AS j", "WHERE a.id > 1;"]
select a.id,j.code from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j where a.id>1;

-- zea-case: advanced/03-02
  select a.id,j.code
  from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j
 where a.id>2;

-- zea-case: advanced/03-03
select a.id,j.code from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j where a.id>3;

-- zea-case: advanced/03-04
  select a.id,j.code
  from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j
 where a.id>4;

-- zea-case: advanced/03-05
select a.id,j.code from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j where a.id>5;

-- zea-case: advanced/03-06
  select a.id,j.code
  from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j
 where a.id>6;

-- zea-case: advanced/03-07
select a.id,j.code from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j where a.id>7;

-- zea-case: advanced/03-08
  select a.id,j.code
  from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j
 where a.id>8;

-- zea-case: advanced/03-09
select a.id,j.code from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j where a.id>9;

-- zea-case: advanced/03-10
  select a.id,j.code
  from dbo.a a cross apply openjson(a.payload) with(code nvarchar(30) '$.code') as j
 where a.id>10;

-- zea-case: advanced/04-01
select id,json_value(payload,'$.x') as x from dbo.a where id>2 for json path, include_null_values;

-- zea-case: advanced/04-02
  select id,json_value(payload,'$.x') as x
  from dbo.a
 where id>3 for json path, include_null_values;

-- zea-case: advanced/04-03
select id,json_value(payload,'$.x') as x from dbo.a where id>4 for json path, include_null_values;

-- zea-case: advanced/04-04
  select id,json_value(payload,'$.x') as x
  from dbo.a
 where id>5 for json path, include_null_values;

-- zea-case: advanced/04-05
select id,json_value(payload,'$.x') as x from dbo.a where id>6 for json path, include_null_values;

-- zea-case: advanced/04-06
  select id,json_value(payload,'$.x') as x
  from dbo.a
 where id>7 for json path, include_null_values;

-- zea-case: advanced/04-07
select id,json_value(payload,'$.x') as x from dbo.a where id>8 for json path, include_null_values;

-- zea-case: advanced/04-08
  select id,json_value(payload,'$.x') as x
  from dbo.a
 where id>9 for json path, include_null_values;

-- zea-case: advanced/04-09
select id,json_value(payload,'$.x') as x from dbo.a where id>10 for json path, include_null_values;

-- zea-case: advanced/04-10
  select id,json_value(payload,'$.x') as x
  from dbo.a
 where id>11 for json path, include_null_values;

-- zea-case: advanced/05-01
-- zea-expect: ["WITH xmlnamespaces (DEFAULT 'urn:sample')", "SELECT id", "FROM dbo.a", "WHERE id > 3", "FOR XML path('item')", "    ,root('root')", "    ,type;"]
with xmlnamespaces(default 'urn:sample') select id from dbo.a where id>3 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-02
  with xmlnamespaces(default 'urn:sample') select id
  from dbo.a
 where id>4 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-03
with xmlnamespaces(default 'urn:sample') select id from dbo.a where id>5 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-04
  with xmlnamespaces(default 'urn:sample') select id
  from dbo.a
 where id>6 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-05
with xmlnamespaces(default 'urn:sample') select id from dbo.a where id>7 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-06
  with xmlnamespaces(default 'urn:sample') select id
  from dbo.a
 where id>8 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-07
with xmlnamespaces(default 'urn:sample') select id from dbo.a where id>9 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-08
  with xmlnamespaces(default 'urn:sample') select id
  from dbo.a
 where id>10 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-09
with xmlnamespaces(default 'urn:sample') select id from dbo.a where id>11 for xml path('item'),root('root'),type;

-- zea-case: advanced/05-10
  with xmlnamespaces(default 'urn:sample') select id
  from dbo.a
 where id>12 for xml path('item'),root('root'),type;

-- zea-case: advanced/06-01
select * from dbo.history for system_time as of '2025-01-02T03:04:05' where id=1;

-- zea-case: advanced/06-02
  select *
  from dbo.history for system_time as of '2025-01-02T03:04:05'
 where id=2;

-- zea-case: advanced/06-03
select * from dbo.history for system_time as of '2025-01-02T03:04:05' where id=3;

-- zea-case: advanced/06-04
  select *
  from dbo.history for system_time as of '2025-01-02T03:04:05'
 where id=4;

-- zea-case: advanced/06-05
select * from dbo.history for system_time as of '2025-01-02T03:04:05' where id=5;

-- zea-case: advanced/06-06
  select *
  from dbo.history for system_time as of '2025-01-02T03:04:05'
 where id=6;

-- zea-case: advanced/06-07
select * from dbo.history for system_time as of '2025-01-02T03:04:05' where id=7;

-- zea-case: advanced/06-08
  select *
  from dbo.history for system_time as of '2025-01-02T03:04:05'
 where id=8;

-- zea-case: advanced/06-09
select * from dbo.history for system_time as of '2025-01-02T03:04:05' where id=9;

-- zea-case: advanced/06-10
  select *
  from dbo.history for system_time as of '2025-01-02T03:04:05'
 where id=10;

-- zea-case: advanced/07-01
select id from dbo.a with (nolock, index(IX_A)) where id>2 option(recompile, optimize for unknown);

-- zea-case: advanced/07-02
  select id
  from dbo.a with (nolock, index(IX_A))
 where id>3 option(recompile, optimize for unknown);

-- zea-case: advanced/07-03
select id from dbo.a with (nolock, index(IX_A)) where id>4 option(recompile, optimize for unknown);

-- zea-case: advanced/07-04
  select id
  from dbo.a with (nolock, index(IX_A))
 where id>5 option(recompile, optimize for unknown);

-- zea-case: advanced/07-05
select id from dbo.a with (nolock, index(IX_A)) where id>6 option(recompile, optimize for unknown);

-- zea-case: advanced/07-06
  select id
  from dbo.a with (nolock, index(IX_A))
 where id>7 option(recompile, optimize for unknown);

-- zea-case: advanced/07-07
select id from dbo.a with (nolock, index(IX_A)) where id>8 option(recompile, optimize for unknown);

-- zea-case: advanced/07-08
  select id
  from dbo.a with (nolock, index(IX_A))
 where id>9 option(recompile, optimize for unknown);

-- zea-case: advanced/07-09
select id from dbo.a with (nolock, index(IX_A)) where id>10 option(recompile, optimize for unknown);

-- zea-case: advanced/07-10
  select id
  from dbo.a with (nolock, index(IX_A))
 where id>11 option(recompile, optimize for unknown);

-- zea-case: advanced/08-01
create trigger dbo.tr_3 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id from inserted; end;
GO

-- zea-case: advanced/08-02
  create trigger dbo.tr_4 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id
  from inserted; end;
GO

-- zea-case: advanced/08-03
create trigger dbo.tr_5 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id from inserted; end;
GO

-- zea-case: advanced/08-04
  create trigger dbo.tr_6 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id
  from inserted; end;
GO

-- zea-case: advanced/08-05
create trigger dbo.tr_7 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id from inserted; end;
GO

-- zea-case: advanced/08-06
  create trigger dbo.tr_8 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id
  from inserted; end;
GO

-- zea-case: advanced/08-07
create trigger dbo.tr_9 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id from inserted; end;
GO

-- zea-case: advanced/08-08
  create trigger dbo.tr_10 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id
  from inserted; end;
GO

-- zea-case: advanced/08-09
create trigger dbo.tr_11 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id from inserted; end;
GO

-- zea-case: advanced/08-10
  create trigger dbo.tr_12 on dbo.a after insert,update as begin set nocount on; insert dbo.audit(id) select id
  from inserted; end;
GO

-- zea-case: advanced/09-01
grant select,update on object::dbo.a to [Report Users]; deny delete on dbo.a to [Report Users];

-- zea-case: advanced/09-02
  grant select,update on object::dbo.a to [Report Users]; deny delete on dbo.a to [Report Users];

-- zea-case: advanced/10-01
select 2;
GO 2
select 8;
GO
select 17;

-- zea-case: advanced/10-02
  select 3;
GO 2
select 11;
GO
select 20;

-- zea-case: advanced/10-03
select 4;
GO 2
select 14;
GO
select 23;

-- zea-case: advanced/10-04
  select 5;
GO 2
select 17;
GO
select 26;

-- zea-case: advanced/10-05
select 6;
GO 2
select 20;
GO
select 29;

-- zea-case: advanced/10-06
  select 7;
GO 2
select 23;
GO
select 32;

-- zea-case: advanced/10-07
select 8;
GO 2
select 26;
GO
select 35;

-- zea-case: advanced/10-08
  select 9;
GO 2
select 29;
GO
select 38;

-- zea-case: advanced/10-09
select 10;
GO 2
select 32;
GO
select 41;

-- zea-case: advanced/10-10
  select 11;
GO 2
select 35;
GO
select 44;

-- zea-case: stress/wide-select-120
select 1 as c0001,2 as c0002,3 as c0003,4 as c0004,5 as c0005,6 as c0006,7 as c0007,8 as c0008,9 as c0009,10 as c0010,11 as c0011,12 as c0012,13 as c0013,14 as c0014,15 as c0015,16 as c0016,17 as c0017,18 as c0018,19 as c0019,20 as c0020,21 as c0021,22 as c0022,23 as c0023,24 as c0024,25 as c0025,26 as c0026,27 as c0027,28 as c0028,29 as c0029,30 as c0030,31 as c0031,32 as c0032,33 as c0033,34 as c0034,35 as c0035,36 as c0036,37 as c0037,38 as c0038,39 as c0039,40 as c0040,41 as c0041,42 as c0042,43 as c0043,44 as c0044,45 as c0045,46 as c0046,47 as c0047,48 as c0048,49 as c0049,50 as c0050,51 as c0051,52 as c0052,53 as c0053,54 as c0054,55 as c0055,56 as c0056,57 as c0057,58 as c0058,59 as c0059,60 as c0060,61 as c0061,62 as c0062,63 as c0063,64 as c0064,65 as c0065,66 as c0066,67 as c0067,68 as c0068,69 as c0069,70 as c0070,71 as c0071,72 as c0072,73 as c0073,74 as c0074,75 as c0075,76 as c0076,77 as c0077,78 as c0078,79 as c0079,80 as c0080,81 as c0081,82 as c0082,83 as c0083,84 as c0084,85 as c0085,86 as c0086,87 as c0087,88 as c0088,89 as c0089,90 as c0090,91 as c0091,92 as c0092,93 as c0093,94 as c0094,95 as c0095,96 as c0096,97 as c0097,98 as c0098,99 as c0099,100 as c0100,101 as c0101,102 as c0102,103 as c0103,104 as c0104,105 as c0105,106 as c0106,107 as c0107,108 as c0108,109 as c0109,110 as c0110,111 as c0111,112 as c0112,113 as c0113,114 as c0114,115 as c0115,116 as c0116,117 as c0117,118 as c0118,119 as c0119,120 as c0120;

-- zea-case: stress/wide-select-360
select 1 as c0001,2 as c0002,3 as c0003,4 as c0004,5 as c0005,6 as c0006,7 as c0007,8 as c0008,9 as c0009,10 as c0010,11 as c0011,12 as c0012,13 as c0013,14 as c0014,15 as c0015,16 as c0016,17 as c0017,18 as c0018,19 as c0019,20 as c0020,21 as c0021,22 as c0022,23 as c0023,24 as c0024,25 as c0025,26 as c0026,27 as c0027,28 as c0028,29 as c0029,30 as c0030,31 as c0031,32 as c0032,33 as c0033,34 as c0034,35 as c0035,36 as c0036,37 as c0037,38 as c0038,39 as c0039,40 as c0040,41 as c0041,42 as c0042,43 as c0043,44 as c0044,45 as c0045,46 as c0046,47 as c0047,48 as c0048,49 as c0049,50 as c0050,51 as c0051,52 as c0052,53 as c0053,54 as c0054,55 as c0055,56 as c0056,57 as c0057,58 as c0058,59 as c0059,60 as c0060,61 as c0061,62 as c0062,63 as c0063,64 as c0064,65 as c0065,66 as c0066,67 as c0067,68 as c0068,69 as c0069,70 as c0070,71 as c0071,72 as c0072,73 as c0073,74 as c0074,75 as c0075,76 as c0076,77 as c0077,78 as c0078,79 as c0079,80 as c0080,81 as c0081,82 as c0082,83 as c0083,84 as c0084,85 as c0085,86 as c0086,87 as c0087,88 as c0088,89 as c0089,90 as c0090,91 as c0091,92 as c0092,93 as c0093,94 as c0094,95 as c0095,96 as c0096,97 as c0097,98 as c0098,99 as c0099,100 as c0100,101 as c0101,102 as c0102,103 as c0103,104 as c0104,105 as c0105,106 as c0106,107 as c0107,108 as c0108,109 as c0109,110 as c0110,111 as c0111,112 as c0112,113 as c0113,114 as c0114,115 as c0115,116 as c0116,117 as c0117,118 as c0118,119 as c0119,120 as c0120,121 as c0121,122 as c0122,123 as c0123,124 as c0124,125 as c0125,126 as c0126,127 as c0127,128 as c0128,129 as c0129,130 as c0130,131 as c0131,132 as c0132,133 as c0133,134 as c0134,135 as c0135,136 as c0136,137 as c0137,138 as c0138,139 as c0139,140 as c0140,141 as c0141,142 as c0142,143 as c0143,144 as c0144,145 as c0145,146 as c0146,147 as c0147,148 as c0148,149 as c0149,150 as c0150,151 as c0151,152 as c0152,153 as c0153,154 as c0154,155 as c0155,156 as c0156,157 as c0157,158 as c0158,159 as c0159,160 as c0160,161 as c0161,162 as c0162,163 as c0163,164 as c0164,165 as c0165,166 as c0166,167 as c0167,168 as c0168,169 as c0169,170 as c0170,171 as c0171,172 as c0172,173 as c0173,174 as c0174,175 as c0175,176 as c0176,177 as c0177,178 as c0178,179 as c0179,180 as c0180,181 as c0181,182 as c0182,183 as c0183,184 as c0184,185 as c0185,186 as c0186,187 as c0187,188 as c0188,189 as c0189,190 as c0190,191 as c0191,192 as c0192,193 as c0193,194 as c0194,195 as c0195,196 as c0196,197 as c0197,198 as c0198,199 as c0199,200 as c0200,201 as c0201,202 as c0202,203 as c0203,204 as c0204,205 as c0205,206 as c0206,207 as c0207,208 as c0208,209 as c0209,210 as c0210,211 as c0211,212 as c0212,213 as c0213,214 as c0214,215 as c0215,216 as c0216,217 as c0217,218 as c0218,219 as c0219,220 as c0220,221 as c0221,222 as c0222,223 as c0223,224 as c0224,225 as c0225,226 as c0226,227 as c0227,228 as c0228,229 as c0229,230 as c0230,231 as c0231,232 as c0232,233 as c0233,234 as c0234,235 as c0235,236 as c0236,237 as c0237,238 as c0238,239 as c0239,240 as c0240,241 as c0241,242 as c0242,243 as c0243,244 as c0244,245 as c0245,246 as c0246,247 as c0247,248 as c0248,249 as c0249,250 as c0250,251 as c0251,252 as c0252,253 as c0253,254 as c0254,255 as c0255,256 as c0256,257 as c0257,258 as c0258,259 as c0259,260 as c0260,261 as c0261,262 as c0262,263 as c0263,264 as c0264,265 as c0265,266 as c0266,267 as c0267,268 as c0268,269 as c0269,270 as c0270,271 as c0271,272 as c0272,273 as c0273,274 as c0274,275 as c0275,276 as c0276,277 as c0277,278 as c0278,279 as c0279,280 as c0280,281 as c0281,282 as c0282,283 as c0283,284 as c0284,285 as c0285,286 as c0286,287 as c0287,288 as c0288,289 as c0289,290 as c0290,291 as c0291,292 as c0292,293 as c0293,294 as c0294,295 as c0295,296 as c0296,297 as c0297,298 as c0298,299 as c0299,300 as c0300,301 as c0301,302 as c0302,303 as c0303,304 as c0304,305 as c0305,306 as c0306,307 as c0307,308 as c0308,309 as c0309,310 as c0310,311 as c0311,312 as c0312,313 as c0313,314 as c0314,315 as c0315,316 as c0316,317 as c0317,318 as c0318,319 as c0319,320 as c0320,321 as c0321,322 as c0322,323 as c0323,324 as c0324,325 as c0325,326 as c0326,327 as c0327,328 as c0328,329 as c0329,330 as c0330,331 as c0331,332 as c0332,333 as c0333,334 as c0334,335 as c0335,336 as c0336,337 as c0337,338 as c0338,339 as c0339,340 as c0340,341 as c0341,342 as c0342,343 as c0343,344 as c0344,345 as c0345,346 as c0346,347 as c0347,348 as c0348,349 as c0349,350 as c0350,351 as c0351,352 as c0352,353 as c0353,354 as c0354,355 as c0355,356 as c0356,357 as c0357,358 as c0358,359 as c0359,360 as c0360;

-- zea-case: stress/wide-select-720
select 1 as c0001,2 as c0002,3 as c0003,4 as c0004,5 as c0005,6 as c0006,7 as c0007,8 as c0008,9 as c0009,10 as c0010,11 as c0011,12 as c0012,13 as c0013,14 as c0014,15 as c0015,16 as c0016,17 as c0017,18 as c0018,19 as c0019,20 as c0020,21 as c0021,22 as c0022,23 as c0023,24 as c0024,25 as c0025,26 as c0026,27 as c0027,28 as c0028,29 as c0029,30 as c0030,31 as c0031,32 as c0032,33 as c0033,34 as c0034,35 as c0035,36 as c0036,37 as c0037,38 as c0038,39 as c0039,40 as c0040,41 as c0041,42 as c0042,43 as c0043,44 as c0044,45 as c0045,46 as c0046,47 as c0047,48 as c0048,49 as c0049,50 as c0050,51 as c0051,52 as c0052,53 as c0053,54 as c0054,55 as c0055,56 as c0056,57 as c0057,58 as c0058,59 as c0059,60 as c0060,61 as c0061,62 as c0062,63 as c0063,64 as c0064,65 as c0065,66 as c0066,67 as c0067,68 as c0068,69 as c0069,70 as c0070,71 as c0071,72 as c0072,73 as c0073,74 as c0074,75 as c0075,76 as c0076,77 as c0077,78 as c0078,79 as c0079,80 as c0080,81 as c0081,82 as c0082,83 as c0083,84 as c0084,85 as c0085,86 as c0086,87 as c0087,88 as c0088,89 as c0089,90 as c0090,91 as c0091,92 as c0092,93 as c0093,94 as c0094,95 as c0095,96 as c0096,97 as c0097,98 as c0098,99 as c0099,100 as c0100,101 as c0101,102 as c0102,103 as c0103,104 as c0104,105 as c0105,106 as c0106,107 as c0107,108 as c0108,109 as c0109,110 as c0110,111 as c0111,112 as c0112,113 as c0113,114 as c0114,115 as c0115,116 as c0116,117 as c0117,118 as c0118,119 as c0119,120 as c0120,121 as c0121,122 as c0122,123 as c0123,124 as c0124,125 as c0125,126 as c0126,127 as c0127,128 as c0128,129 as c0129,130 as c0130,131 as c0131,132 as c0132,133 as c0133,134 as c0134,135 as c0135,136 as c0136,137 as c0137,138 as c0138,139 as c0139,140 as c0140,141 as c0141,142 as c0142,143 as c0143,144 as c0144,145 as c0145,146 as c0146,147 as c0147,148 as c0148,149 as c0149,150 as c0150,151 as c0151,152 as c0152,153 as c0153,154 as c0154,155 as c0155,156 as c0156,157 as c0157,158 as c0158,159 as c0159,160 as c0160,161 as c0161,162 as c0162,163 as c0163,164 as c0164,165 as c0165,166 as c0166,167 as c0167,168 as c0168,169 as c0169,170 as c0170,171 as c0171,172 as c0172,173 as c0173,174 as c0174,175 as c0175,176 as c0176,177 as c0177,178 as c0178,179 as c0179,180 as c0180,181 as c0181,182 as c0182,183 as c0183,184 as c0184,185 as c0185,186 as c0186,187 as c0187,188 as c0188,189 as c0189,190 as c0190,191 as c0191,192 as c0192,193 as c0193,194 as c0194,195 as c0195,196 as c0196,197 as c0197,198 as c0198,199 as c0199,200 as c0200,201 as c0201,202 as c0202,203 as c0203,204 as c0204,205 as c0205,206 as c0206,207 as c0207,208 as c0208,209 as c0209,210 as c0210,211 as c0211,212 as c0212,213 as c0213,214 as c0214,215 as c0215,216 as c0216,217 as c0217,218 as c0218,219 as c0219,220 as c0220,221 as c0221,222 as c0222,223 as c0223,224 as c0224,225 as c0225,226 as c0226,227 as c0227,228 as c0228,229 as c0229,230 as c0230,231 as c0231,232 as c0232,233 as c0233,234 as c0234,235 as c0235,236 as c0236,237 as c0237,238 as c0238,239 as c0239,240 as c0240,241 as c0241,242 as c0242,243 as c0243,244 as c0244,245 as c0245,246 as c0246,247 as c0247,248 as c0248,249 as c0249,250 as c0250,251 as c0251,252 as c0252,253 as c0253,254 as c0254,255 as c0255,256 as c0256,257 as c0257,258 as c0258,259 as c0259,260 as c0260,261 as c0261,262 as c0262,263 as c0263,264 as c0264,265 as c0265,266 as c0266,267 as c0267,268 as c0268,269 as c0269,270 as c0270,271 as c0271,272 as c0272,273 as c0273,274 as c0274,275 as c0275,276 as c0276,277 as c0277,278 as c0278,279 as c0279,280 as c0280,281 as c0281,282 as c0282,283 as c0283,284 as c0284,285 as c0285,286 as c0286,287 as c0287,288 as c0288,289 as c0289,290 as c0290,291 as c0291,292 as c0292,293 as c0293,294 as c0294,295 as c0295,296 as c0296,297 as c0297,298 as c0298,299 as c0299,300 as c0300,301 as c0301,302 as c0302,303 as c0303,304 as c0304,305 as c0305,306 as c0306,307 as c0307,308 as c0308,309 as c0309,310 as c0310,311 as c0311,312 as c0312,313 as c0313,314 as c0314,315 as c0315,316 as c0316,317 as c0317,318 as c0318,319 as c0319,320 as c0320,321 as c0321,322 as c0322,323 as c0323,324 as c0324,325 as c0325,326 as c0326,327 as c0327,328 as c0328,329 as c0329,330 as c0330,331 as c0331,332 as c0332,333 as c0333,334 as c0334,335 as c0335,336 as c0336,337 as c0337,338 as c0338,339 as c0339,340 as c0340,341 as c0341,342 as c0342,343 as c0343,344 as c0344,345 as c0345,346 as c0346,347 as c0347,348 as c0348,349 as c0349,350 as c0350,351 as c0351,352 as c0352,353 as c0353,354 as c0354,355 as c0355,356 as c0356,357 as c0357,358 as c0358,359 as c0359,360 as c0360,361 as c0361,362 as c0362,363 as c0363,364 as c0364,365 as c0365,366 as c0366,367 as c0367,368 as c0368,369 as c0369,370 as c0370,371 as c0371,372 as c0372,373 as c0373,374 as c0374,375 as c0375,376 as c0376,377 as c0377,378 as c0378,379 as c0379,380 as c0380,381 as c0381,382 as c0382,383 as c0383,384 as c0384,385 as c0385,386 as c0386,387 as c0387,388 as c0388,389 as c0389,390 as c0390,391 as c0391,392 as c0392,393 as c0393,394 as c0394,395 as c0395,396 as c0396,397 as c0397,398 as c0398,399 as c0399,400 as c0400,401 as c0401,402 as c0402,403 as c0403,404 as c0404,405 as c0405,406 as c0406,407 as c0407,408 as c0408,409 as c0409,410 as c0410,411 as c0411,412 as c0412,413 as c0413,414 as c0414,415 as c0415,416 as c0416,417 as c0417,418 as c0418,419 as c0419,420 as c0420,421 as c0421,422 as c0422,423 as c0423,424 as c0424,425 as c0425,426 as c0426,427 as c0427,428 as c0428,429 as c0429,430 as c0430,431 as c0431,432 as c0432,433 as c0433,434 as c0434,435 as c0435,436 as c0436,437 as c0437,438 as c0438,439 as c0439,440 as c0440,441 as c0441,442 as c0442,443 as c0443,444 as c0444,445 as c0445,446 as c0446,447 as c0447,448 as c0448,449 as c0449,450 as c0450,451 as c0451,452 as c0452,453 as c0453,454 as c0454,455 as c0455,456 as c0456,457 as c0457,458 as c0458,459 as c0459,460 as c0460,461 as c0461,462 as c0462,463 as c0463,464 as c0464,465 as c0465,466 as c0466,467 as c0467,468 as c0468,469 as c0469,470 as c0470,471 as c0471,472 as c0472,473 as c0473,474 as c0474,475 as c0475,476 as c0476,477 as c0477,478 as c0478,479 as c0479,480 as c0480,481 as c0481,482 as c0482,483 as c0483,484 as c0484,485 as c0485,486 as c0486,487 as c0487,488 as c0488,489 as c0489,490 as c0490,491 as c0491,492 as c0492,493 as c0493,494 as c0494,495 as c0495,496 as c0496,497 as c0497,498 as c0498,499 as c0499,500 as c0500,501 as c0501,502 as c0502,503 as c0503,504 as c0504,505 as c0505,506 as c0506,507 as c0507,508 as c0508,509 as c0509,510 as c0510,511 as c0511,512 as c0512,513 as c0513,514 as c0514,515 as c0515,516 as c0516,517 as c0517,518 as c0518,519 as c0519,520 as c0520,521 as c0521,522 as c0522,523 as c0523,524 as c0524,525 as c0525,526 as c0526,527 as c0527,528 as c0528,529 as c0529,530 as c0530,531 as c0531,532 as c0532,533 as c0533,534 as c0534,535 as c0535,536 as c0536,537 as c0537,538 as c0538,539 as c0539,540 as c0540,541 as c0541,542 as c0542,543 as c0543,544 as c0544,545 as c0545,546 as c0546,547 as c0547,548 as c0548,549 as c0549,550 as c0550,551 as c0551,552 as c0552,553 as c0553,554 as c0554,555 as c0555,556 as c0556,557 as c0557,558 as c0558,559 as c0559,560 as c0560,561 as c0561,562 as c0562,563 as c0563,564 as c0564,565 as c0565,566 as c0566,567 as c0567,568 as c0568,569 as c0569,570 as c0570,571 as c0571,572 as c0572,573 as c0573,574 as c0574,575 as c0575,576 as c0576,577 as c0577,578 as c0578,579 as c0579,580 as c0580,581 as c0581,582 as c0582,583 as c0583,584 as c0584,585 as c0585,586 as c0586,587 as c0587,588 as c0588,589 as c0589,590 as c0590,591 as c0591,592 as c0592,593 as c0593,594 as c0594,595 as c0595,596 as c0596,597 as c0597,598 as c0598,599 as c0599,600 as c0600,601 as c0601,602 as c0602,603 as c0603,604 as c0604,605 as c0605,606 as c0606,607 as c0607,608 as c0608,609 as c0609,610 as c0610,611 as c0611,612 as c0612,613 as c0613,614 as c0614,615 as c0615,616 as c0616,617 as c0617,618 as c0618,619 as c0619,620 as c0620,621 as c0621,622 as c0622,623 as c0623,624 as c0624,625 as c0625,626 as c0626,627 as c0627,628 as c0628,629 as c0629,630 as c0630,631 as c0631,632 as c0632,633 as c0633,634 as c0634,635 as c0635,636 as c0636,637 as c0637,638 as c0638,639 as c0639,640 as c0640,641 as c0641,642 as c0642,643 as c0643,644 as c0644,645 as c0645,646 as c0646,647 as c0647,648 as c0648,649 as c0649,650 as c0650,651 as c0651,652 as c0652,653 as c0653,654 as c0654,655 as c0655,656 as c0656,657 as c0657,658 as c0658,659 as c0659,660 as c0660,661 as c0661,662 as c0662,663 as c0663,664 as c0664,665 as c0665,666 as c0666,667 as c0667,668 as c0668,669 as c0669,670 as c0670,671 as c0671,672 as c0672,673 as c0673,674 as c0674,675 as c0675,676 as c0676,677 as c0677,678 as c0678,679 as c0679,680 as c0680,681 as c0681,682 as c0682,683 as c0683,684 as c0684,685 as c0685,686 as c0686,687 as c0687,688 as c0688,689 as c0689,690 as c0690,691 as c0691,692 as c0692,693 as c0693,694 as c0694,695 as c0695,696 as c0696,697 as c0697,698 as c0698,699 as c0699,700 as c0700,701 as c0701,702 as c0702,703 as c0703,704 as c0704,705 as c0705,706 as c0706,707 as c0707,708 as c0708,709 as c0709,710 as c0710,711 as c0711,712 as c0712,713 as c0713,714 as c0714,715 as c0715,716 as c0716,717 as c0717,718 as c0718,719 as c0719,720 as c0720;

-- zea-case: stress/values-60
insert into #test_rows(id,n,payload) values
(1,7,N'row 1 - α,β; -- sample'),
(2,14,N'row 2 - α,β; -- sample'),
(3,21,N'row 3 - α,β; -- sample'),
(4,28,N'row 4 - α,β; -- sample'),
(5,35,N'row 5 - α,β; -- sample'),
(6,42,N'row 6 - α,β; -- sample'),
(7,49,N'row 7 - α,β; -- sample'),
(8,56,N'row 8 - α,β; -- sample'),
(9,63,N'row 9 - α,β; -- sample'),
(10,70,N'row 10 - α,β; -- sample'),
(11,77,N'row 11 - α,β; -- sample'),
(12,84,N'row 12 - α,β; -- sample'),
(13,91,N'row 13 - α,β; -- sample'),
(14,98,N'row 14 - α,β; -- sample'),
(15,105,N'row 15 - α,β; -- sample'),
(16,112,N'row 16 - α,β; -- sample'),
(17,119,N'row 17 - α,β; -- sample'),
(18,126,N'row 18 - α,β; -- sample'),
(19,133,N'row 19 - α,β; -- sample'),
(20,140,N'row 20 - α,β; -- sample'),
(21,147,N'row 21 - α,β; -- sample'),
(22,154,N'row 22 - α,β; -- sample'),
(23,161,N'row 23 - α,β; -- sample'),
(24,168,N'row 24 - α,β; -- sample'),
(25,175,N'row 25 - α,β; -- sample'),
(26,182,N'row 26 - α,β; -- sample'),
(27,189,N'row 27 - α,β; -- sample'),
(28,196,N'row 28 - α,β; -- sample'),
(29,203,N'row 29 - α,β; -- sample'),
(30,210,N'row 30 - α,β; -- sample'),
(31,217,N'row 31 - α,β; -- sample'),
(32,224,N'row 32 - α,β; -- sample'),
(33,231,N'row 33 - α,β; -- sample'),
(34,238,N'row 34 - α,β; -- sample'),
(35,245,N'row 35 - α,β; -- sample'),
(36,252,N'row 36 - α,β; -- sample'),
(37,259,N'row 37 - α,β; -- sample'),
(38,266,N'row 38 - α,β; -- sample'),
(39,273,N'row 39 - α,β; -- sample'),
(40,280,N'row 40 - α,β; -- sample'),
(41,287,N'row 41 - α,β; -- sample'),
(42,294,N'row 42 - α,β; -- sample'),
(43,301,N'row 43 - α,β; -- sample'),
(44,308,N'row 44 - α,β; -- sample'),
(45,315,N'row 45 - α,β; -- sample'),
(46,322,N'row 46 - α,β; -- sample'),
(47,329,N'row 47 - α,β; -- sample'),
(48,336,N'row 48 - α,β; -- sample'),
(49,343,N'row 49 - α,β; -- sample'),
(50,350,N'row 50 - α,β; -- sample'),
(51,357,N'row 51 - α,β; -- sample'),
(52,364,N'row 52 - α,β; -- sample'),
(53,371,N'row 53 - α,β; -- sample'),
(54,378,N'row 54 - α,β; -- sample'),
(55,385,N'row 55 - α,β; -- sample'),
(56,392,N'row 56 - α,β; -- sample'),
(57,399,N'row 57 - α,β; -- sample'),
(58,406,N'row 58 - α,β; -- sample'),
(59,413,N'row 59 - α,β; -- sample'),
(60,420,N'row 60 - α,β; -- sample');

-- zea-case: stress/values-180
insert into #test_rows(id,n,payload) values
(1,7,N'row 1 - α,β; -- sample'),
(2,14,N'row 2 - α,β; -- sample'),
(3,21,N'row 3 - α,β; -- sample'),
(4,28,N'row 4 - α,β; -- sample'),
(5,35,N'row 5 - α,β; -- sample'),
(6,42,N'row 6 - α,β; -- sample'),
(7,49,N'row 7 - α,β; -- sample'),
(8,56,N'row 8 - α,β; -- sample'),
(9,63,N'row 9 - α,β; -- sample'),
(10,70,N'row 10 - α,β; -- sample'),
(11,77,N'row 11 - α,β; -- sample'),
(12,84,N'row 12 - α,β; -- sample'),
(13,91,N'row 13 - α,β; -- sample'),
(14,98,N'row 14 - α,β; -- sample'),
(15,105,N'row 15 - α,β; -- sample'),
(16,112,N'row 16 - α,β; -- sample'),
(17,119,N'row 17 - α,β; -- sample'),
(18,126,N'row 18 - α,β; -- sample'),
(19,133,N'row 19 - α,β; -- sample'),
(20,140,N'row 20 - α,β; -- sample'),
(21,147,N'row 21 - α,β; -- sample'),
(22,154,N'row 22 - α,β; -- sample'),
(23,161,N'row 23 - α,β; -- sample'),
(24,168,N'row 24 - α,β; -- sample'),
(25,175,N'row 25 - α,β; -- sample'),
(26,182,N'row 26 - α,β; -- sample'),
(27,189,N'row 27 - α,β; -- sample'),
(28,196,N'row 28 - α,β; -- sample'),
(29,203,N'row 29 - α,β; -- sample'),
(30,210,N'row 30 - α,β; -- sample'),
(31,217,N'row 31 - α,β; -- sample'),
(32,224,N'row 32 - α,β; -- sample'),
(33,231,N'row 33 - α,β; -- sample'),
(34,238,N'row 34 - α,β; -- sample'),
(35,245,N'row 35 - α,β; -- sample'),
(36,252,N'row 36 - α,β; -- sample'),
(37,259,N'row 37 - α,β; -- sample'),
(38,266,N'row 38 - α,β; -- sample'),
(39,273,N'row 39 - α,β; -- sample'),
(40,280,N'row 40 - α,β; -- sample'),
(41,287,N'row 41 - α,β; -- sample'),
(42,294,N'row 42 - α,β; -- sample'),
(43,301,N'row 43 - α,β; -- sample'),
(44,308,N'row 44 - α,β; -- sample'),
(45,315,N'row 45 - α,β; -- sample'),
(46,322,N'row 46 - α,β; -- sample'),
(47,329,N'row 47 - α,β; -- sample'),
(48,336,N'row 48 - α,β; -- sample'),
(49,343,N'row 49 - α,β; -- sample'),
(50,350,N'row 50 - α,β; -- sample'),
(51,357,N'row 51 - α,β; -- sample'),
(52,364,N'row 52 - α,β; -- sample'),
(53,371,N'row 53 - α,β; -- sample'),
(54,378,N'row 54 - α,β; -- sample'),
(55,385,N'row 55 - α,β; -- sample'),
(56,392,N'row 56 - α,β; -- sample'),
(57,399,N'row 57 - α,β; -- sample'),
(58,406,N'row 58 - α,β; -- sample'),
(59,413,N'row 59 - α,β; -- sample'),
(60,420,N'row 60 - α,β; -- sample'),
(61,427,N'row 61 - α,β; -- sample'),
(62,434,N'row 62 - α,β; -- sample'),
(63,441,N'row 63 - α,β; -- sample'),
(64,448,N'row 64 - α,β; -- sample'),
(65,455,N'row 65 - α,β; -- sample'),
(66,462,N'row 66 - α,β; -- sample'),
(67,469,N'row 67 - α,β; -- sample'),
(68,476,N'row 68 - α,β; -- sample'),
(69,483,N'row 69 - α,β; -- sample'),
(70,490,N'row 70 - α,β; -- sample'),
(71,497,N'row 71 - α,β; -- sample'),
(72,504,N'row 72 - α,β; -- sample'),
(73,511,N'row 73 - α,β; -- sample'),
(74,518,N'row 74 - α,β; -- sample'),
(75,525,N'row 75 - α,β; -- sample'),
(76,532,N'row 76 - α,β; -- sample'),
(77,539,N'row 77 - α,β; -- sample'),
(78,546,N'row 78 - α,β; -- sample'),
(79,553,N'row 79 - α,β; -- sample'),
(80,560,N'row 80 - α,β; -- sample'),
(81,567,N'row 81 - α,β; -- sample'),
(82,574,N'row 82 - α,β; -- sample'),
(83,581,N'row 83 - α,β; -- sample'),
(84,588,N'row 84 - α,β; -- sample'),
(85,595,N'row 85 - α,β; -- sample'),
(86,602,N'row 86 - α,β; -- sample'),
(87,609,N'row 87 - α,β; -- sample'),
(88,616,N'row 88 - α,β; -- sample'),
(89,623,N'row 89 - α,β; -- sample'),
(90,630,N'row 90 - α,β; -- sample'),
(91,637,N'row 91 - α,β; -- sample'),
(92,644,N'row 92 - α,β; -- sample'),
(93,651,N'row 93 - α,β; -- sample'),
(94,658,N'row 94 - α,β; -- sample'),
(95,665,N'row 95 - α,β; -- sample'),
(96,672,N'row 96 - α,β; -- sample'),
(97,679,N'row 97 - α,β; -- sample'),
(98,686,N'row 98 - α,β; -- sample'),
(99,693,N'row 99 - α,β; -- sample'),
(100,700,N'row 100 - α,β; -- sample'),
(101,707,N'row 101 - α,β; -- sample'),
(102,714,N'row 102 - α,β; -- sample'),
(103,721,N'row 103 - α,β; -- sample'),
(104,728,N'row 104 - α,β; -- sample'),
(105,735,N'row 105 - α,β; -- sample'),
(106,742,N'row 106 - α,β; -- sample'),
(107,749,N'row 107 - α,β; -- sample'),
(108,756,N'row 108 - α,β; -- sample'),
(109,763,N'row 109 - α,β; -- sample'),
(110,770,N'row 110 - α,β; -- sample'),
(111,777,N'row 111 - α,β; -- sample'),
(112,784,N'row 112 - α,β; -- sample'),
(113,791,N'row 113 - α,β; -- sample'),
(114,798,N'row 114 - α,β; -- sample'),
(115,805,N'row 115 - α,β; -- sample'),
(116,812,N'row 116 - α,β; -- sample'),
(117,819,N'row 117 - α,β; -- sample'),
(118,826,N'row 118 - α,β; -- sample'),
(119,833,N'row 119 - α,β; -- sample'),
(120,840,N'row 120 - α,β; -- sample'),
(121,847,N'row 121 - α,β; -- sample'),
(122,854,N'row 122 - α,β; -- sample'),
(123,861,N'row 123 - α,β; -- sample'),
(124,868,N'row 124 - α,β; -- sample'),
(125,875,N'row 125 - α,β; -- sample'),
(126,882,N'row 126 - α,β; -- sample'),
(127,889,N'row 127 - α,β; -- sample'),
(128,896,N'row 128 - α,β; -- sample'),
(129,903,N'row 129 - α,β; -- sample'),
(130,910,N'row 130 - α,β; -- sample'),
(131,917,N'row 131 - α,β; -- sample'),
(132,924,N'row 132 - α,β; -- sample'),
(133,931,N'row 133 - α,β; -- sample'),
(134,938,N'row 134 - α,β; -- sample'),
(135,945,N'row 135 - α,β; -- sample'),
(136,952,N'row 136 - α,β; -- sample'),
(137,959,N'row 137 - α,β; -- sample'),
(138,966,N'row 138 - α,β; -- sample'),
(139,973,N'row 139 - α,β; -- sample'),
(140,980,N'row 140 - α,β; -- sample'),
(141,987,N'row 141 - α,β; -- sample'),
(142,994,N'row 142 - α,β; -- sample'),
(143,1001,N'row 143 - α,β; -- sample'),
(144,1008,N'row 144 - α,β; -- sample'),
(145,1015,N'row 145 - α,β; -- sample'),
(146,1022,N'row 146 - α,β; -- sample'),
(147,1029,N'row 147 - α,β; -- sample'),
(148,1036,N'row 148 - α,β; -- sample'),
(149,1043,N'row 149 - α,β; -- sample'),
(150,1050,N'row 150 - α,β; -- sample'),
(151,1057,N'row 151 - α,β; -- sample'),
(152,1064,N'row 152 - α,β; -- sample'),
(153,1071,N'row 153 - α,β; -- sample'),
(154,1078,N'row 154 - α,β; -- sample'),
(155,1085,N'row 155 - α,β; -- sample'),
(156,1092,N'row 156 - α,β; -- sample'),
(157,1099,N'row 157 - α,β; -- sample'),
(158,1106,N'row 158 - α,β; -- sample'),
(159,1113,N'row 159 - α,β; -- sample'),
(160,1120,N'row 160 - α,β; -- sample'),
(161,1127,N'row 161 - α,β; -- sample'),
(162,1134,N'row 162 - α,β; -- sample'),
(163,1141,N'row 163 - α,β; -- sample'),
(164,1148,N'row 164 - α,β; -- sample'),
(165,1155,N'row 165 - α,β; -- sample'),
(166,1162,N'row 166 - α,β; -- sample'),
(167,1169,N'row 167 - α,β; -- sample'),
(168,1176,N'row 168 - α,β; -- sample'),
(169,1183,N'row 169 - α,β; -- sample'),
(170,1190,N'row 170 - α,β; -- sample'),
(171,1197,N'row 171 - α,β; -- sample'),
(172,1204,N'row 172 - α,β; -- sample'),
(173,1211,N'row 173 - α,β; -- sample'),
(174,1218,N'row 174 - α,β; -- sample'),
(175,1225,N'row 175 - α,β; -- sample'),
(176,1232,N'row 176 - α,β; -- sample'),
(177,1239,N'row 177 - α,β; -- sample'),
(178,1246,N'row 178 - α,β; -- sample'),
(179,1253,N'row 179 - α,β; -- sample'),
(180,1260,N'row 180 - α,β; -- sample');

-- zea-case: stress/values-400
insert into #test_rows(id,n,payload) values
(1,7,N'row 1 - α,β; -- sample'),
(2,14,N'row 2 - α,β; -- sample'),
(3,21,N'row 3 - α,β; -- sample'),
(4,28,N'row 4 - α,β; -- sample'),
(5,35,N'row 5 - α,β; -- sample'),
(6,42,N'row 6 - α,β; -- sample'),
(7,49,N'row 7 - α,β; -- sample'),
(8,56,N'row 8 - α,β; -- sample'),
(9,63,N'row 9 - α,β; -- sample'),
(10,70,N'row 10 - α,β; -- sample'),
(11,77,N'row 11 - α,β; -- sample'),
(12,84,N'row 12 - α,β; -- sample'),
(13,91,N'row 13 - α,β; -- sample'),
(14,98,N'row 14 - α,β; -- sample'),
(15,105,N'row 15 - α,β; -- sample'),
(16,112,N'row 16 - α,β; -- sample'),
(17,119,N'row 17 - α,β; -- sample'),
(18,126,N'row 18 - α,β; -- sample'),
(19,133,N'row 19 - α,β; -- sample'),
(20,140,N'row 20 - α,β; -- sample'),
(21,147,N'row 21 - α,β; -- sample'),
(22,154,N'row 22 - α,β; -- sample'),
(23,161,N'row 23 - α,β; -- sample'),
(24,168,N'row 24 - α,β; -- sample'),
(25,175,N'row 25 - α,β; -- sample'),
(26,182,N'row 26 - α,β; -- sample'),
(27,189,N'row 27 - α,β; -- sample'),
(28,196,N'row 28 - α,β; -- sample'),
(29,203,N'row 29 - α,β; -- sample'),
(30,210,N'row 30 - α,β; -- sample'),
(31,217,N'row 31 - α,β; -- sample'),
(32,224,N'row 32 - α,β; -- sample'),
(33,231,N'row 33 - α,β; -- sample'),
(34,238,N'row 34 - α,β; -- sample'),
(35,245,N'row 35 - α,β; -- sample'),
(36,252,N'row 36 - α,β; -- sample'),
(37,259,N'row 37 - α,β; -- sample'),
(38,266,N'row 38 - α,β; -- sample'),
(39,273,N'row 39 - α,β; -- sample'),
(40,280,N'row 40 - α,β; -- sample'),
(41,287,N'row 41 - α,β; -- sample'),
(42,294,N'row 42 - α,β; -- sample'),
(43,301,N'row 43 - α,β; -- sample'),
(44,308,N'row 44 - α,β; -- sample'),
(45,315,N'row 45 - α,β; -- sample'),
(46,322,N'row 46 - α,β; -- sample'),
(47,329,N'row 47 - α,β; -- sample'),
(48,336,N'row 48 - α,β; -- sample'),
(49,343,N'row 49 - α,β; -- sample'),
(50,350,N'row 50 - α,β; -- sample'),
(51,357,N'row 51 - α,β; -- sample'),
(52,364,N'row 52 - α,β; -- sample'),
(53,371,N'row 53 - α,β; -- sample'),
(54,378,N'row 54 - α,β; -- sample'),
(55,385,N'row 55 - α,β; -- sample'),
(56,392,N'row 56 - α,β; -- sample'),
(57,399,N'row 57 - α,β; -- sample'),
(58,406,N'row 58 - α,β; -- sample'),
(59,413,N'row 59 - α,β; -- sample'),
(60,420,N'row 60 - α,β; -- sample'),
(61,427,N'row 61 - α,β; -- sample'),
(62,434,N'row 62 - α,β; -- sample'),
(63,441,N'row 63 - α,β; -- sample'),
(64,448,N'row 64 - α,β; -- sample'),
(65,455,N'row 65 - α,β; -- sample'),
(66,462,N'row 66 - α,β; -- sample'),
(67,469,N'row 67 - α,β; -- sample'),
(68,476,N'row 68 - α,β; -- sample'),
(69,483,N'row 69 - α,β; -- sample'),
(70,490,N'row 70 - α,β; -- sample'),
(71,497,N'row 71 - α,β; -- sample'),
(72,504,N'row 72 - α,β; -- sample'),
(73,511,N'row 73 - α,β; -- sample'),
(74,518,N'row 74 - α,β; -- sample'),
(75,525,N'row 75 - α,β; -- sample'),
(76,532,N'row 76 - α,β; -- sample'),
(77,539,N'row 77 - α,β; -- sample'),
(78,546,N'row 78 - α,β; -- sample'),
(79,553,N'row 79 - α,β; -- sample'),
(80,560,N'row 80 - α,β; -- sample'),
(81,567,N'row 81 - α,β; -- sample'),
(82,574,N'row 82 - α,β; -- sample'),
(83,581,N'row 83 - α,β; -- sample'),
(84,588,N'row 84 - α,β; -- sample'),
(85,595,N'row 85 - α,β; -- sample'),
(86,602,N'row 86 - α,β; -- sample'),
(87,609,N'row 87 - α,β; -- sample'),
(88,616,N'row 88 - α,β; -- sample'),
(89,623,N'row 89 - α,β; -- sample'),
(90,630,N'row 90 - α,β; -- sample'),
(91,637,N'row 91 - α,β; -- sample'),
(92,644,N'row 92 - α,β; -- sample'),
(93,651,N'row 93 - α,β; -- sample'),
(94,658,N'row 94 - α,β; -- sample'),
(95,665,N'row 95 - α,β; -- sample'),
(96,672,N'row 96 - α,β; -- sample'),
(97,679,N'row 97 - α,β; -- sample'),
(98,686,N'row 98 - α,β; -- sample'),
(99,693,N'row 99 - α,β; -- sample'),
(100,700,N'row 100 - α,β; -- sample'),
(101,707,N'row 101 - α,β; -- sample'),
(102,714,N'row 102 - α,β; -- sample'),
(103,721,N'row 103 - α,β; -- sample'),
(104,728,N'row 104 - α,β; -- sample'),
(105,735,N'row 105 - α,β; -- sample'),
(106,742,N'row 106 - α,β; -- sample'),
(107,749,N'row 107 - α,β; -- sample'),
(108,756,N'row 108 - α,β; -- sample'),
(109,763,N'row 109 - α,β; -- sample'),
(110,770,N'row 110 - α,β; -- sample'),
(111,777,N'row 111 - α,β; -- sample'),
(112,784,N'row 112 - α,β; -- sample'),
(113,791,N'row 113 - α,β; -- sample'),
(114,798,N'row 114 - α,β; -- sample'),
(115,805,N'row 115 - α,β; -- sample'),
(116,812,N'row 116 - α,β; -- sample'),
(117,819,N'row 117 - α,β; -- sample'),
(118,826,N'row 118 - α,β; -- sample'),
(119,833,N'row 119 - α,β; -- sample'),
(120,840,N'row 120 - α,β; -- sample'),
(121,847,N'row 121 - α,β; -- sample'),
(122,854,N'row 122 - α,β; -- sample'),
(123,861,N'row 123 - α,β; -- sample'),
(124,868,N'row 124 - α,β; -- sample'),
(125,875,N'row 125 - α,β; -- sample'),
(126,882,N'row 126 - α,β; -- sample'),
(127,889,N'row 127 - α,β; -- sample'),
(128,896,N'row 128 - α,β; -- sample'),
(129,903,N'row 129 - α,β; -- sample'),
(130,910,N'row 130 - α,β; -- sample'),
(131,917,N'row 131 - α,β; -- sample'),
(132,924,N'row 132 - α,β; -- sample'),
(133,931,N'row 133 - α,β; -- sample'),
(134,938,N'row 134 - α,β; -- sample'),
(135,945,N'row 135 - α,β; -- sample'),
(136,952,N'row 136 - α,β; -- sample'),
(137,959,N'row 137 - α,β; -- sample'),
(138,966,N'row 138 - α,β; -- sample'),
(139,973,N'row 139 - α,β; -- sample'),
(140,980,N'row 140 - α,β; -- sample'),
(141,987,N'row 141 - α,β; -- sample'),
(142,994,N'row 142 - α,β; -- sample'),
(143,1001,N'row 143 - α,β; -- sample'),
(144,1008,N'row 144 - α,β; -- sample'),
(145,1015,N'row 145 - α,β; -- sample'),
(146,1022,N'row 146 - α,β; -- sample'),
(147,1029,N'row 147 - α,β; -- sample'),
(148,1036,N'row 148 - α,β; -- sample'),
(149,1043,N'row 149 - α,β; -- sample'),
(150,1050,N'row 150 - α,β; -- sample'),
(151,1057,N'row 151 - α,β; -- sample'),
(152,1064,N'row 152 - α,β; -- sample'),
(153,1071,N'row 153 - α,β; -- sample'),
(154,1078,N'row 154 - α,β; -- sample'),
(155,1085,N'row 155 - α,β; -- sample'),
(156,1092,N'row 156 - α,β; -- sample'),
(157,1099,N'row 157 - α,β; -- sample'),
(158,1106,N'row 158 - α,β; -- sample'),
(159,1113,N'row 159 - α,β; -- sample'),
(160,1120,N'row 160 - α,β; -- sample'),
(161,1127,N'row 161 - α,β; -- sample'),
(162,1134,N'row 162 - α,β; -- sample'),
(163,1141,N'row 163 - α,β; -- sample'),
(164,1148,N'row 164 - α,β; -- sample'),
(165,1155,N'row 165 - α,β; -- sample'),
(166,1162,N'row 166 - α,β; -- sample'),
(167,1169,N'row 167 - α,β; -- sample'),
(168,1176,N'row 168 - α,β; -- sample'),
(169,1183,N'row 169 - α,β; -- sample'),
(170,1190,N'row 170 - α,β; -- sample'),
(171,1197,N'row 171 - α,β; -- sample'),
(172,1204,N'row 172 - α,β; -- sample'),
(173,1211,N'row 173 - α,β; -- sample'),
(174,1218,N'row 174 - α,β; -- sample'),
(175,1225,N'row 175 - α,β; -- sample'),
(176,1232,N'row 176 - α,β; -- sample'),
(177,1239,N'row 177 - α,β; -- sample'),
(178,1246,N'row 178 - α,β; -- sample'),
(179,1253,N'row 179 - α,β; -- sample'),
(180,1260,N'row 180 - α,β; -- sample'),
(181,1267,N'row 181 - α,β; -- sample'),
(182,1274,N'row 182 - α,β; -- sample'),
(183,1281,N'row 183 - α,β; -- sample'),
(184,1288,N'row 184 - α,β; -- sample'),
(185,1295,N'row 185 - α,β; -- sample'),
(186,1302,N'row 186 - α,β; -- sample'),
(187,1309,N'row 187 - α,β; -- sample'),
(188,1316,N'row 188 - α,β; -- sample'),
(189,1323,N'row 189 - α,β; -- sample'),
(190,1330,N'row 190 - α,β; -- sample'),
(191,1337,N'row 191 - α,β; -- sample'),
(192,1344,N'row 192 - α,β; -- sample'),
(193,1351,N'row 193 - α,β; -- sample'),
(194,1358,N'row 194 - α,β; -- sample'),
(195,1365,N'row 195 - α,β; -- sample'),
(196,1372,N'row 196 - α,β; -- sample'),
(197,1379,N'row 197 - α,β; -- sample'),
(198,1386,N'row 198 - α,β; -- sample'),
(199,1393,N'row 199 - α,β; -- sample'),
(200,1400,N'row 200 - α,β; -- sample'),
(201,1407,N'row 201 - α,β; -- sample'),
(202,1414,N'row 202 - α,β; -- sample'),
(203,1421,N'row 203 - α,β; -- sample'),
(204,1428,N'row 204 - α,β; -- sample'),
(205,1435,N'row 205 - α,β; -- sample'),
(206,1442,N'row 206 - α,β; -- sample'),
(207,1449,N'row 207 - α,β; -- sample'),
(208,1456,N'row 208 - α,β; -- sample'),
(209,1463,N'row 209 - α,β; -- sample'),
(210,1470,N'row 210 - α,β; -- sample'),
(211,1477,N'row 211 - α,β; -- sample'),
(212,1484,N'row 212 - α,β; -- sample'),
(213,1491,N'row 213 - α,β; -- sample'),
(214,1498,N'row 214 - α,β; -- sample'),
(215,1505,N'row 215 - α,β; -- sample'),
(216,1512,N'row 216 - α,β; -- sample'),
(217,1519,N'row 217 - α,β; -- sample'),
(218,1526,N'row 218 - α,β; -- sample'),
(219,1533,N'row 219 - α,β; -- sample'),
(220,1540,N'row 220 - α,β; -- sample'),
(221,1547,N'row 221 - α,β; -- sample'),
(222,1554,N'row 222 - α,β; -- sample'),
(223,1561,N'row 223 - α,β; -- sample'),
(224,1568,N'row 224 - α,β; -- sample'),
(225,1575,N'row 225 - α,β; -- sample'),
(226,1582,N'row 226 - α,β; -- sample'),
(227,1589,N'row 227 - α,β; -- sample'),
(228,1596,N'row 228 - α,β; -- sample'),
(229,1603,N'row 229 - α,β; -- sample'),
(230,1610,N'row 230 - α,β; -- sample'),
(231,1617,N'row 231 - α,β; -- sample'),
(232,1624,N'row 232 - α,β; -- sample'),
(233,1631,N'row 233 - α,β; -- sample'),
(234,1638,N'row 234 - α,β; -- sample'),
(235,1645,N'row 235 - α,β; -- sample'),
(236,1652,N'row 236 - α,β; -- sample'),
(237,1659,N'row 237 - α,β; -- sample'),
(238,1666,N'row 238 - α,β; -- sample'),
(239,1673,N'row 239 - α,β; -- sample'),
(240,1680,N'row 240 - α,β; -- sample'),
(241,1687,N'row 241 - α,β; -- sample'),
(242,1694,N'row 242 - α,β; -- sample'),
(243,1701,N'row 243 - α,β; -- sample'),
(244,1708,N'row 244 - α,β; -- sample'),
(245,1715,N'row 245 - α,β; -- sample'),
(246,1722,N'row 246 - α,β; -- sample'),
(247,1729,N'row 247 - α,β; -- sample'),
(248,1736,N'row 248 - α,β; -- sample'),
(249,1743,N'row 249 - α,β; -- sample'),
(250,1750,N'row 250 - α,β; -- sample'),
(251,1757,N'row 251 - α,β; -- sample'),
(252,1764,N'row 252 - α,β; -- sample'),
(253,1771,N'row 253 - α,β; -- sample'),
(254,1778,N'row 254 - α,β; -- sample'),
(255,1785,N'row 255 - α,β; -- sample'),
(256,1792,N'row 256 - α,β; -- sample'),
(257,1799,N'row 257 - α,β; -- sample'),
(258,1806,N'row 258 - α,β; -- sample'),
(259,1813,N'row 259 - α,β; -- sample'),
(260,1820,N'row 260 - α,β; -- sample'),
(261,1827,N'row 261 - α,β; -- sample'),
(262,1834,N'row 262 - α,β; -- sample'),
(263,1841,N'row 263 - α,β; -- sample'),
(264,1848,N'row 264 - α,β; -- sample'),
(265,1855,N'row 265 - α,β; -- sample'),
(266,1862,N'row 266 - α,β; -- sample'),
(267,1869,N'row 267 - α,β; -- sample'),
(268,1876,N'row 268 - α,β; -- sample'),
(269,1883,N'row 269 - α,β; -- sample'),
(270,1890,N'row 270 - α,β; -- sample'),
(271,1897,N'row 271 - α,β; -- sample'),
(272,1904,N'row 272 - α,β; -- sample'),
(273,1911,N'row 273 - α,β; -- sample'),
(274,1918,N'row 274 - α,β; -- sample'),
(275,1925,N'row 275 - α,β; -- sample'),
(276,1932,N'row 276 - α,β; -- sample'),
(277,1939,N'row 277 - α,β; -- sample'),
(278,1946,N'row 278 - α,β; -- sample'),
(279,1953,N'row 279 - α,β; -- sample'),
(280,1960,N'row 280 - α,β; -- sample'),
(281,1967,N'row 281 - α,β; -- sample'),
(282,1974,N'row 282 - α,β; -- sample'),
(283,1981,N'row 283 - α,β; -- sample'),
(284,1988,N'row 284 - α,β; -- sample'),
(285,1995,N'row 285 - α,β; -- sample'),
(286,2002,N'row 286 - α,β; -- sample'),
(287,2009,N'row 287 - α,β; -- sample'),
(288,2016,N'row 288 - α,β; -- sample'),
(289,2023,N'row 289 - α,β; -- sample'),
(290,2030,N'row 290 - α,β; -- sample'),
(291,2037,N'row 291 - α,β; -- sample'),
(292,2044,N'row 292 - α,β; -- sample'),
(293,2051,N'row 293 - α,β; -- sample'),
(294,2058,N'row 294 - α,β; -- sample'),
(295,2065,N'row 295 - α,β; -- sample'),
(296,2072,N'row 296 - α,β; -- sample'),
(297,2079,N'row 297 - α,β; -- sample'),
(298,2086,N'row 298 - α,β; -- sample'),
(299,2093,N'row 299 - α,β; -- sample'),
(300,2100,N'row 300 - α,β; -- sample'),
(301,2107,N'row 301 - α,β; -- sample'),
(302,2114,N'row 302 - α,β; -- sample'),
(303,2121,N'row 303 - α,β; -- sample'),
(304,2128,N'row 304 - α,β; -- sample'),
(305,2135,N'row 305 - α,β; -- sample'),
(306,2142,N'row 306 - α,β; -- sample'),
(307,2149,N'row 307 - α,β; -- sample'),
(308,2156,N'row 308 - α,β; -- sample'),
(309,2163,N'row 309 - α,β; -- sample'),
(310,2170,N'row 310 - α,β; -- sample'),
(311,2177,N'row 311 - α,β; -- sample'),
(312,2184,N'row 312 - α,β; -- sample'),
(313,2191,N'row 313 - α,β; -- sample'),
(314,2198,N'row 314 - α,β; -- sample'),
(315,2205,N'row 315 - α,β; -- sample'),
(316,2212,N'row 316 - α,β; -- sample'),
(317,2219,N'row 317 - α,β; -- sample'),
(318,2226,N'row 318 - α,β; -- sample'),
(319,2233,N'row 319 - α,β; -- sample'),
(320,2240,N'row 320 - α,β; -- sample'),
(321,2247,N'row 321 - α,β; -- sample'),
(322,2254,N'row 322 - α,β; -- sample'),
(323,2261,N'row 323 - α,β; -- sample'),
(324,2268,N'row 324 - α,β; -- sample'),
(325,2275,N'row 325 - α,β; -- sample'),
(326,2282,N'row 326 - α,β; -- sample'),
(327,2289,N'row 327 - α,β; -- sample'),
(328,2296,N'row 328 - α,β; -- sample'),
(329,2303,N'row 329 - α,β; -- sample'),
(330,2310,N'row 330 - α,β; -- sample'),
(331,2317,N'row 331 - α,β; -- sample'),
(332,2324,N'row 332 - α,β; -- sample'),
(333,2331,N'row 333 - α,β; -- sample'),
(334,2338,N'row 334 - α,β; -- sample'),
(335,2345,N'row 335 - α,β; -- sample'),
(336,2352,N'row 336 - α,β; -- sample'),
(337,2359,N'row 337 - α,β; -- sample'),
(338,2366,N'row 338 - α,β; -- sample'),
(339,2373,N'row 339 - α,β; -- sample'),
(340,2380,N'row 340 - α,β; -- sample'),
(341,2387,N'row 341 - α,β; -- sample'),
(342,2394,N'row 342 - α,β; -- sample'),
(343,2401,N'row 343 - α,β; -- sample'),
(344,2408,N'row 344 - α,β; -- sample'),
(345,2415,N'row 345 - α,β; -- sample'),
(346,2422,N'row 346 - α,β; -- sample'),
(347,2429,N'row 347 - α,β; -- sample'),
(348,2436,N'row 348 - α,β; -- sample'),
(349,2443,N'row 349 - α,β; -- sample'),
(350,2450,N'row 350 - α,β; -- sample'),
(351,2457,N'row 351 - α,β; -- sample'),
(352,2464,N'row 352 - α,β; -- sample'),
(353,2471,N'row 353 - α,β; -- sample'),
(354,2478,N'row 354 - α,β; -- sample'),
(355,2485,N'row 355 - α,β; -- sample'),
(356,2492,N'row 356 - α,β; -- sample'),
(357,2499,N'row 357 - α,β; -- sample'),
(358,2506,N'row 358 - α,β; -- sample'),
(359,2513,N'row 359 - α,β; -- sample'),
(360,2520,N'row 360 - α,β; -- sample'),
(361,2527,N'row 361 - α,β; -- sample'),
(362,2534,N'row 362 - α,β; -- sample'),
(363,2541,N'row 363 - α,β; -- sample'),
(364,2548,N'row 364 - α,β; -- sample'),
(365,2555,N'row 365 - α,β; -- sample'),
(366,2562,N'row 366 - α,β; -- sample'),
(367,2569,N'row 367 - α,β; -- sample'),
(368,2576,N'row 368 - α,β; -- sample'),
(369,2583,N'row 369 - α,β; -- sample'),
(370,2590,N'row 370 - α,β; -- sample'),
(371,2597,N'row 371 - α,β; -- sample'),
(372,2604,N'row 372 - α,β; -- sample'),
(373,2611,N'row 373 - α,β; -- sample'),
(374,2618,N'row 374 - α,β; -- sample'),
(375,2625,N'row 375 - α,β; -- sample'),
(376,2632,N'row 376 - α,β; -- sample'),
(377,2639,N'row 377 - α,β; -- sample'),
(378,2646,N'row 378 - α,β; -- sample'),
(379,2653,N'row 379 - α,β; -- sample'),
(380,2660,N'row 380 - α,β; -- sample'),
(381,2667,N'row 381 - α,β; -- sample'),
(382,2674,N'row 382 - α,β; -- sample'),
(383,2681,N'row 383 - α,β; -- sample'),
(384,2688,N'row 384 - α,β; -- sample'),
(385,2695,N'row 385 - α,β; -- sample'),
(386,2702,N'row 386 - α,β; -- sample'),
(387,2709,N'row 387 - α,β; -- sample'),
(388,2716,N'row 388 - α,β; -- sample'),
(389,2723,N'row 389 - α,β; -- sample'),
(390,2730,N'row 390 - α,β; -- sample'),
(391,2737,N'row 391 - α,β; -- sample'),
(392,2744,N'row 392 - α,β; -- sample'),
(393,2751,N'row 393 - α,β; -- sample'),
(394,2758,N'row 394 - α,β; -- sample'),
(395,2765,N'row 395 - α,β; -- sample'),
(396,2772,N'row 396 - α,β; -- sample'),
(397,2779,N'row 397 - α,β; -- sample'),
(398,2786,N'row 398 - α,β; -- sample'),
(399,2793,N'row 399 - α,β; -- sample'),
(400,2800,N'row 400 - α,β; -- sample');

-- zea-case: stress/nesting-5
select t5.id from (select t4.id from (select t3.id from (select t2.id from (select t1.id from (select id from dbo.base_rows where id>0) t1 where t1.id<>-1) t2 where t2.id<>-2) t3 where t3.id<>-3) t4 where t4.id<>-4) t5 where t5.id<>-5;

-- zea-case: stress/nesting-12
select t12.id from (select t11.id from (select t10.id from (select t9.id from (select t8.id from (select t7.id from (select t6.id from (select t5.id from (select t4.id from (select t3.id from (select t2.id from (select t1.id from (select id from dbo.base_rows where id>0) t1 where t1.id<>-1) t2 where t2.id<>-2) t3 where t3.id<>-3) t4 where t4.id<>-4) t5 where t5.id<>-5) t6 where t6.id<>-6) t7 where t7.id<>-7) t8 where t8.id<>-8) t9 where t9.id<>-9) t10 where t10.id<>-10) t11 where t11.id<>-11) t12 where t12.id<>-12;

-- zea-case: stress/nesting-24
select t24.id from (select t23.id from (select t22.id from (select t21.id from (select t20.id from (select t19.id from (select t18.id from (select t17.id from (select t16.id from (select t15.id from (select t14.id from (select t13.id from (select t12.id from (select t11.id from (select t10.id from (select t9.id from (select t8.id from (select t7.id from (select t6.id from (select t5.id from (select t4.id from (select t3.id from (select t2.id from (select t1.id from (select id from dbo.base_rows where id>0) t1 where t1.id<>-1) t2 where t2.id<>-2) t3 where t3.id<>-3) t4 where t4.id<>-4) t5 where t5.id<>-5) t6 where t6.id<>-6) t7 where t7.id<>-7) t8 where t8.id<>-8) t9 where t9.id<>-9) t10 where t10.id<>-10) t11 where t11.id<>-11) t12 where t12.id<>-12) t13 where t13.id<>-13) t14 where t14.id<>-14) t15 where t15.id<>-15) t16 where t16.id<>-16) t17 where t17.id<>-17) t18 where t18.id<>-18) t19 where t19.id<>-19) t20 where t20.id<>-20) t21 where t21.id<>-21) t22 where t22.id<>-22) t23 where t23.id<>-23) t24 where t24.id<>-24;

-- zea-case: stress/script-150-statements
select 1 as n, (1*3) as score, N'payload 00001 - kiểm thử dấu phẩy; -- Unicode' as payload where (1 between 1 and 150) and 1+1>1;
select 2 as n, (2*3) as score, N'payload 00002 - kiểm thử dấu phẩy; -- Unicode' as payload where (2 between 1 and 150) and 2+1>2;
select 3 as n, (3*3) as score, N'payload 00003 - kiểm thử dấu phẩy; -- Unicode' as payload where (3 between 1 and 150) and 3+1>3;
select 4 as n, (4*3) as score, N'payload 00004 - kiểm thử dấu phẩy; -- Unicode' as payload where (4 between 1 and 150) and 4+1>4;
select 5 as n, (5*3) as score, N'payload 00005 - kiểm thử dấu phẩy; -- Unicode' as payload where (5 between 1 and 150) and 5+1>5;
select 6 as n, (6*3) as score, N'payload 00006 - kiểm thử dấu phẩy; -- Unicode' as payload where (6 between 1 and 150) and 6+1>6;
select 7 as n, (7*3) as score, N'payload 00007 - kiểm thử dấu phẩy; -- Unicode' as payload where (7 between 1 and 150) and 7+1>7;
select 8 as n, (8*3) as score, N'payload 00008 - kiểm thử dấu phẩy; -- Unicode' as payload where (8 between 1 and 150) and 8+1>8;
select 9 as n, (9*3) as score, N'payload 00009 - kiểm thử dấu phẩy; -- Unicode' as payload where (9 between 1 and 150) and 9+1>9;
select 10 as n, (10*3) as score, N'payload 00010 - kiểm thử dấu phẩy; -- Unicode' as payload where (10 between 1 and 150) and 10+1>10;
select 11 as n, (11*3) as score, N'payload 00011 - kiểm thử dấu phẩy; -- Unicode' as payload where (11 between 1 and 150) and 11+1>11;
select 12 as n, (12*3) as score, N'payload 00012 - kiểm thử dấu phẩy; -- Unicode' as payload where (12 between 1 and 150) and 12+1>12;
select 13 as n, (13*3) as score, N'payload 00013 - kiểm thử dấu phẩy; -- Unicode' as payload where (13 between 1 and 150) and 13+1>13;
select 14 as n, (14*3) as score, N'payload 00014 - kiểm thử dấu phẩy; -- Unicode' as payload where (14 between 1 and 150) and 14+1>14;
select 15 as n, (15*3) as score, N'payload 00015 - kiểm thử dấu phẩy; -- Unicode' as payload where (15 between 1 and 150) and 15+1>15;
select 16 as n, (16*3) as score, N'payload 00016 - kiểm thử dấu phẩy; -- Unicode' as payload where (16 between 1 and 150) and 16+1>16;
select 17 as n, (17*3) as score, N'payload 00017 - kiểm thử dấu phẩy; -- Unicode' as payload where (17 between 1 and 150) and 17+1>17;
select 18 as n, (18*3) as score, N'payload 00018 - kiểm thử dấu phẩy; -- Unicode' as payload where (18 between 1 and 150) and 18+1>18;
select 19 as n, (19*3) as score, N'payload 00019 - kiểm thử dấu phẩy; -- Unicode' as payload where (19 between 1 and 150) and 19+1>19;
select 20 as n, (20*3) as score, N'payload 00020 - kiểm thử dấu phẩy; -- Unicode' as payload where (20 between 1 and 150) and 20+1>20;
select 21 as n, (21*3) as score, N'payload 00021 - kiểm thử dấu phẩy; -- Unicode' as payload where (21 between 1 and 150) and 21+1>21;
select 22 as n, (22*3) as score, N'payload 00022 - kiểm thử dấu phẩy; -- Unicode' as payload where (22 between 1 and 150) and 22+1>22;
select 23 as n, (23*3) as score, N'payload 00023 - kiểm thử dấu phẩy; -- Unicode' as payload where (23 between 1 and 150) and 23+1>23;
select 24 as n, (24*3) as score, N'payload 00024 - kiểm thử dấu phẩy; -- Unicode' as payload where (24 between 1 and 150) and 24+1>24;
select 25 as n, (25*3) as score, N'payload 00025 - kiểm thử dấu phẩy; -- Unicode' as payload where (25 between 1 and 150) and 25+1>25;
select 26 as n, (26*3) as score, N'payload 00026 - kiểm thử dấu phẩy; -- Unicode' as payload where (26 between 1 and 150) and 26+1>26;
select 27 as n, (27*3) as score, N'payload 00027 - kiểm thử dấu phẩy; -- Unicode' as payload where (27 between 1 and 150) and 27+1>27;
select 28 as n, (28*3) as score, N'payload 00028 - kiểm thử dấu phẩy; -- Unicode' as payload where (28 between 1 and 150) and 28+1>28;
select 29 as n, (29*3) as score, N'payload 00029 - kiểm thử dấu phẩy; -- Unicode' as payload where (29 between 1 and 150) and 29+1>29;
select 30 as n, (30*3) as score, N'payload 00030 - kiểm thử dấu phẩy; -- Unicode' as payload where (30 between 1 and 150) and 30+1>30;
select 31 as n, (31*3) as score, N'payload 00031 - kiểm thử dấu phẩy; -- Unicode' as payload where (31 between 1 and 150) and 31+1>31;
select 32 as n, (32*3) as score, N'payload 00032 - kiểm thử dấu phẩy; -- Unicode' as payload where (32 between 1 and 150) and 32+1>32;
select 33 as n, (33*3) as score, N'payload 00033 - kiểm thử dấu phẩy; -- Unicode' as payload where (33 between 1 and 150) and 33+1>33;
select 34 as n, (34*3) as score, N'payload 00034 - kiểm thử dấu phẩy; -- Unicode' as payload where (34 between 1 and 150) and 34+1>34;
select 35 as n, (35*3) as score, N'payload 00035 - kiểm thử dấu phẩy; -- Unicode' as payload where (35 between 1 and 150) and 35+1>35;
select 36 as n, (36*3) as score, N'payload 00036 - kiểm thử dấu phẩy; -- Unicode' as payload where (36 between 1 and 150) and 36+1>36;
select 37 as n, (37*3) as score, N'payload 00037 - kiểm thử dấu phẩy; -- Unicode' as payload where (37 between 1 and 150) and 37+1>37;
select 38 as n, (38*3) as score, N'payload 00038 - kiểm thử dấu phẩy; -- Unicode' as payload where (38 between 1 and 150) and 38+1>38;
select 39 as n, (39*3) as score, N'payload 00039 - kiểm thử dấu phẩy; -- Unicode' as payload where (39 between 1 and 150) and 39+1>39;
select 40 as n, (40*3) as score, N'payload 00040 - kiểm thử dấu phẩy; -- Unicode' as payload where (40 between 1 and 150) and 40+1>40;
select 41 as n, (41*3) as score, N'payload 00041 - kiểm thử dấu phẩy; -- Unicode' as payload where (41 between 1 and 150) and 41+1>41;
select 42 as n, (42*3) as score, N'payload 00042 - kiểm thử dấu phẩy; -- Unicode' as payload where (42 between 1 and 150) and 42+1>42;
select 43 as n, (43*3) as score, N'payload 00043 - kiểm thử dấu phẩy; -- Unicode' as payload where (43 between 1 and 150) and 43+1>43;
select 44 as n, (44*3) as score, N'payload 00044 - kiểm thử dấu phẩy; -- Unicode' as payload where (44 between 1 and 150) and 44+1>44;
select 45 as n, (45*3) as score, N'payload 00045 - kiểm thử dấu phẩy; -- Unicode' as payload where (45 between 1 and 150) and 45+1>45;
select 46 as n, (46*3) as score, N'payload 00046 - kiểm thử dấu phẩy; -- Unicode' as payload where (46 between 1 and 150) and 46+1>46;
select 47 as n, (47*3) as score, N'payload 00047 - kiểm thử dấu phẩy; -- Unicode' as payload where (47 between 1 and 150) and 47+1>47;
select 48 as n, (48*3) as score, N'payload 00048 - kiểm thử dấu phẩy; -- Unicode' as payload where (48 between 1 and 150) and 48+1>48;
select 49 as n, (49*3) as score, N'payload 00049 - kiểm thử dấu phẩy; -- Unicode' as payload where (49 between 1 and 150) and 49+1>49;
select 50 as n, (50*3) as score, N'payload 00050 - kiểm thử dấu phẩy; -- Unicode' as payload where (50 between 1 and 150) and 50+1>50;
select 51 as n, (51*3) as score, N'payload 00051 - kiểm thử dấu phẩy; -- Unicode' as payload where (51 between 1 and 150) and 51+1>51;
select 52 as n, (52*3) as score, N'payload 00052 - kiểm thử dấu phẩy; -- Unicode' as payload where (52 between 1 and 150) and 52+1>52;
select 53 as n, (53*3) as score, N'payload 00053 - kiểm thử dấu phẩy; -- Unicode' as payload where (53 between 1 and 150) and 53+1>53;
select 54 as n, (54*3) as score, N'payload 00054 - kiểm thử dấu phẩy; -- Unicode' as payload where (54 between 1 and 150) and 54+1>54;
select 55 as n, (55*3) as score, N'payload 00055 - kiểm thử dấu phẩy; -- Unicode' as payload where (55 between 1 and 150) and 55+1>55;
select 56 as n, (56*3) as score, N'payload 00056 - kiểm thử dấu phẩy; -- Unicode' as payload where (56 between 1 and 150) and 56+1>56;
select 57 as n, (57*3) as score, N'payload 00057 - kiểm thử dấu phẩy; -- Unicode' as payload where (57 between 1 and 150) and 57+1>57;
select 58 as n, (58*3) as score, N'payload 00058 - kiểm thử dấu phẩy; -- Unicode' as payload where (58 between 1 and 150) and 58+1>58;
select 59 as n, (59*3) as score, N'payload 00059 - kiểm thử dấu phẩy; -- Unicode' as payload where (59 between 1 and 150) and 59+1>59;
select 60 as n, (60*3) as score, N'payload 00060 - kiểm thử dấu phẩy; -- Unicode' as payload where (60 between 1 and 150) and 60+1>60;
select 61 as n, (61*3) as score, N'payload 00061 - kiểm thử dấu phẩy; -- Unicode' as payload where (61 between 1 and 150) and 61+1>61;
select 62 as n, (62*3) as score, N'payload 00062 - kiểm thử dấu phẩy; -- Unicode' as payload where (62 between 1 and 150) and 62+1>62;
select 63 as n, (63*3) as score, N'payload 00063 - kiểm thử dấu phẩy; -- Unicode' as payload where (63 between 1 and 150) and 63+1>63;
select 64 as n, (64*3) as score, N'payload 00064 - kiểm thử dấu phẩy; -- Unicode' as payload where (64 between 1 and 150) and 64+1>64;
select 65 as n, (65*3) as score, N'payload 00065 - kiểm thử dấu phẩy; -- Unicode' as payload where (65 between 1 and 150) and 65+1>65;
select 66 as n, (66*3) as score, N'payload 00066 - kiểm thử dấu phẩy; -- Unicode' as payload where (66 between 1 and 150) and 66+1>66;
select 67 as n, (67*3) as score, N'payload 00067 - kiểm thử dấu phẩy; -- Unicode' as payload where (67 between 1 and 150) and 67+1>67;
select 68 as n, (68*3) as score, N'payload 00068 - kiểm thử dấu phẩy; -- Unicode' as payload where (68 between 1 and 150) and 68+1>68;
select 69 as n, (69*3) as score, N'payload 00069 - kiểm thử dấu phẩy; -- Unicode' as payload where (69 between 1 and 150) and 69+1>69;
select 70 as n, (70*3) as score, N'payload 00070 - kiểm thử dấu phẩy; -- Unicode' as payload where (70 between 1 and 150) and 70+1>70;
select 71 as n, (71*3) as score, N'payload 00071 - kiểm thử dấu phẩy; -- Unicode' as payload where (71 between 1 and 150) and 71+1>71;
select 72 as n, (72*3) as score, N'payload 00072 - kiểm thử dấu phẩy; -- Unicode' as payload where (72 between 1 and 150) and 72+1>72;
select 73 as n, (73*3) as score, N'payload 00073 - kiểm thử dấu phẩy; -- Unicode' as payload where (73 between 1 and 150) and 73+1>73;
select 74 as n, (74*3) as score, N'payload 00074 - kiểm thử dấu phẩy; -- Unicode' as payload where (74 between 1 and 150) and 74+1>74;
select 75 as n, (75*3) as score, N'payload 00075 - kiểm thử dấu phẩy; -- Unicode' as payload where (75 between 1 and 150) and 75+1>75;
select 76 as n, (76*3) as score, N'payload 00076 - kiểm thử dấu phẩy; -- Unicode' as payload where (76 between 1 and 150) and 76+1>76;
select 77 as n, (77*3) as score, N'payload 00077 - kiểm thử dấu phẩy; -- Unicode' as payload where (77 between 1 and 150) and 77+1>77;
select 78 as n, (78*3) as score, N'payload 00078 - kiểm thử dấu phẩy; -- Unicode' as payload where (78 between 1 and 150) and 78+1>78;
select 79 as n, (79*3) as score, N'payload 00079 - kiểm thử dấu phẩy; -- Unicode' as payload where (79 between 1 and 150) and 79+1>79;
select 80 as n, (80*3) as score, N'payload 00080 - kiểm thử dấu phẩy; -- Unicode' as payload where (80 between 1 and 150) and 80+1>80;
select 81 as n, (81*3) as score, N'payload 00081 - kiểm thử dấu phẩy; -- Unicode' as payload where (81 between 1 and 150) and 81+1>81;
select 82 as n, (82*3) as score, N'payload 00082 - kiểm thử dấu phẩy; -- Unicode' as payload where (82 between 1 and 150) and 82+1>82;
select 83 as n, (83*3) as score, N'payload 00083 - kiểm thử dấu phẩy; -- Unicode' as payload where (83 between 1 and 150) and 83+1>83;
select 84 as n, (84*3) as score, N'payload 00084 - kiểm thử dấu phẩy; -- Unicode' as payload where (84 between 1 and 150) and 84+1>84;
select 85 as n, (85*3) as score, N'payload 00085 - kiểm thử dấu phẩy; -- Unicode' as payload where (85 between 1 and 150) and 85+1>85;
select 86 as n, (86*3) as score, N'payload 00086 - kiểm thử dấu phẩy; -- Unicode' as payload where (86 between 1 and 150) and 86+1>86;
select 87 as n, (87*3) as score, N'payload 00087 - kiểm thử dấu phẩy; -- Unicode' as payload where (87 between 1 and 150) and 87+1>87;
select 88 as n, (88*3) as score, N'payload 00088 - kiểm thử dấu phẩy; -- Unicode' as payload where (88 between 1 and 150) and 88+1>88;
select 89 as n, (89*3) as score, N'payload 00089 - kiểm thử dấu phẩy; -- Unicode' as payload where (89 between 1 and 150) and 89+1>89;
select 90 as n, (90*3) as score, N'payload 00090 - kiểm thử dấu phẩy; -- Unicode' as payload where (90 between 1 and 150) and 90+1>90;
select 91 as n, (91*3) as score, N'payload 00091 - kiểm thử dấu phẩy; -- Unicode' as payload where (91 between 1 and 150) and 91+1>91;
select 92 as n, (92*3) as score, N'payload 00092 - kiểm thử dấu phẩy; -- Unicode' as payload where (92 between 1 and 150) and 92+1>92;
select 93 as n, (93*3) as score, N'payload 00093 - kiểm thử dấu phẩy; -- Unicode' as payload where (93 between 1 and 150) and 93+1>93;
select 94 as n, (94*3) as score, N'payload 00094 - kiểm thử dấu phẩy; -- Unicode' as payload where (94 between 1 and 150) and 94+1>94;
select 95 as n, (95*3) as score, N'payload 00095 - kiểm thử dấu phẩy; -- Unicode' as payload where (95 between 1 and 150) and 95+1>95;
select 96 as n, (96*3) as score, N'payload 00096 - kiểm thử dấu phẩy; -- Unicode' as payload where (96 between 1 and 150) and 96+1>96;
select 97 as n, (97*3) as score, N'payload 00097 - kiểm thử dấu phẩy; -- Unicode' as payload where (97 between 1 and 150) and 97+1>97;
select 98 as n, (98*3) as score, N'payload 00098 - kiểm thử dấu phẩy; -- Unicode' as payload where (98 between 1 and 150) and 98+1>98;
select 99 as n, (99*3) as score, N'payload 00099 - kiểm thử dấu phẩy; -- Unicode' as payload where (99 between 1 and 150) and 99+1>99;
select 100 as n, (100*3) as score, N'payload 00100 - kiểm thử dấu phẩy; -- Unicode' as payload where (100 between 1 and 150) and 100+1>100;
select 101 as n, (101*3) as score, N'payload 00101 - kiểm thử dấu phẩy; -- Unicode' as payload where (101 between 1 and 150) and 101+1>101;
select 102 as n, (102*3) as score, N'payload 00102 - kiểm thử dấu phẩy; -- Unicode' as payload where (102 between 1 and 150) and 102+1>102;
select 103 as n, (103*3) as score, N'payload 00103 - kiểm thử dấu phẩy; -- Unicode' as payload where (103 between 1 and 150) and 103+1>103;
select 104 as n, (104*3) as score, N'payload 00104 - kiểm thử dấu phẩy; -- Unicode' as payload where (104 between 1 and 150) and 104+1>104;
select 105 as n, (105*3) as score, N'payload 00105 - kiểm thử dấu phẩy; -- Unicode' as payload where (105 between 1 and 150) and 105+1>105;
select 106 as n, (106*3) as score, N'payload 00106 - kiểm thử dấu phẩy; -- Unicode' as payload where (106 between 1 and 150) and 106+1>106;
select 107 as n, (107*3) as score, N'payload 00107 - kiểm thử dấu phẩy; -- Unicode' as payload where (107 between 1 and 150) and 107+1>107;
select 108 as n, (108*3) as score, N'payload 00108 - kiểm thử dấu phẩy; -- Unicode' as payload where (108 between 1 and 150) and 108+1>108;
select 109 as n, (109*3) as score, N'payload 00109 - kiểm thử dấu phẩy; -- Unicode' as payload where (109 between 1 and 150) and 109+1>109;
select 110 as n, (110*3) as score, N'payload 00110 - kiểm thử dấu phẩy; -- Unicode' as payload where (110 between 1 and 150) and 110+1>110;
select 111 as n, (111*3) as score, N'payload 00111 - kiểm thử dấu phẩy; -- Unicode' as payload where (111 between 1 and 150) and 111+1>111;
select 112 as n, (112*3) as score, N'payload 00112 - kiểm thử dấu phẩy; -- Unicode' as payload where (112 between 1 and 150) and 112+1>112;
select 113 as n, (113*3) as score, N'payload 00113 - kiểm thử dấu phẩy; -- Unicode' as payload where (113 between 1 and 150) and 113+1>113;
select 114 as n, (114*3) as score, N'payload 00114 - kiểm thử dấu phẩy; -- Unicode' as payload where (114 between 1 and 150) and 114+1>114;
select 115 as n, (115*3) as score, N'payload 00115 - kiểm thử dấu phẩy; -- Unicode' as payload where (115 between 1 and 150) and 115+1>115;
select 116 as n, (116*3) as score, N'payload 00116 - kiểm thử dấu phẩy; -- Unicode' as payload where (116 between 1 and 150) and 116+1>116;
select 117 as n, (117*3) as score, N'payload 00117 - kiểm thử dấu phẩy; -- Unicode' as payload where (117 between 1 and 150) and 117+1>117;
select 118 as n, (118*3) as score, N'payload 00118 - kiểm thử dấu phẩy; -- Unicode' as payload where (118 between 1 and 150) and 118+1>118;
select 119 as n, (119*3) as score, N'payload 00119 - kiểm thử dấu phẩy; -- Unicode' as payload where (119 between 1 and 150) and 119+1>119;
select 120 as n, (120*3) as score, N'payload 00120 - kiểm thử dấu phẩy; -- Unicode' as payload where (120 between 1 and 150) and 120+1>120;
select 121 as n, (121*3) as score, N'payload 00121 - kiểm thử dấu phẩy; -- Unicode' as payload where (121 between 1 and 150) and 121+1>121;
select 122 as n, (122*3) as score, N'payload 00122 - kiểm thử dấu phẩy; -- Unicode' as payload where (122 between 1 and 150) and 122+1>122;
select 123 as n, (123*3) as score, N'payload 00123 - kiểm thử dấu phẩy; -- Unicode' as payload where (123 between 1 and 150) and 123+1>123;
select 124 as n, (124*3) as score, N'payload 00124 - kiểm thử dấu phẩy; -- Unicode' as payload where (124 between 1 and 150) and 124+1>124;
select 125 as n, (125*3) as score, N'payload 00125 - kiểm thử dấu phẩy; -- Unicode' as payload where (125 between 1 and 150) and 125+1>125;
select 126 as n, (126*3) as score, N'payload 00126 - kiểm thử dấu phẩy; -- Unicode' as payload where (126 between 1 and 150) and 126+1>126;
select 127 as n, (127*3) as score, N'payload 00127 - kiểm thử dấu phẩy; -- Unicode' as payload where (127 between 1 and 150) and 127+1>127;
select 128 as n, (128*3) as score, N'payload 00128 - kiểm thử dấu phẩy; -- Unicode' as payload where (128 between 1 and 150) and 128+1>128;
select 129 as n, (129*3) as score, N'payload 00129 - kiểm thử dấu phẩy; -- Unicode' as payload where (129 between 1 and 150) and 129+1>129;
select 130 as n, (130*3) as score, N'payload 00130 - kiểm thử dấu phẩy; -- Unicode' as payload where (130 between 1 and 150) and 130+1>130;
select 131 as n, (131*3) as score, N'payload 00131 - kiểm thử dấu phẩy; -- Unicode' as payload where (131 between 1 and 150) and 131+1>131;
select 132 as n, (132*3) as score, N'payload 00132 - kiểm thử dấu phẩy; -- Unicode' as payload where (132 between 1 and 150) and 132+1>132;
select 133 as n, (133*3) as score, N'payload 00133 - kiểm thử dấu phẩy; -- Unicode' as payload where (133 between 1 and 150) and 133+1>133;
select 134 as n, (134*3) as score, N'payload 00134 - kiểm thử dấu phẩy; -- Unicode' as payload where (134 between 1 and 150) and 134+1>134;
select 135 as n, (135*3) as score, N'payload 00135 - kiểm thử dấu phẩy; -- Unicode' as payload where (135 between 1 and 150) and 135+1>135;
select 136 as n, (136*3) as score, N'payload 00136 - kiểm thử dấu phẩy; -- Unicode' as payload where (136 between 1 and 150) and 136+1>136;
select 137 as n, (137*3) as score, N'payload 00137 - kiểm thử dấu phẩy; -- Unicode' as payload where (137 between 1 and 150) and 137+1>137;
select 138 as n, (138*3) as score, N'payload 00138 - kiểm thử dấu phẩy; -- Unicode' as payload where (138 between 1 and 150) and 138+1>138;
select 139 as n, (139*3) as score, N'payload 00139 - kiểm thử dấu phẩy; -- Unicode' as payload where (139 between 1 and 150) and 139+1>139;
select 140 as n, (140*3) as score, N'payload 00140 - kiểm thử dấu phẩy; -- Unicode' as payload where (140 between 1 and 150) and 140+1>140;
select 141 as n, (141*3) as score, N'payload 00141 - kiểm thử dấu phẩy; -- Unicode' as payload where (141 between 1 and 150) and 141+1>141;
select 142 as n, (142*3) as score, N'payload 00142 - kiểm thử dấu phẩy; -- Unicode' as payload where (142 between 1 and 150) and 142+1>142;
select 143 as n, (143*3) as score, N'payload 00143 - kiểm thử dấu phẩy; -- Unicode' as payload where (143 between 1 and 150) and 143+1>143;
select 144 as n, (144*3) as score, N'payload 00144 - kiểm thử dấu phẩy; -- Unicode' as payload where (144 between 1 and 150) and 144+1>144;
select 145 as n, (145*3) as score, N'payload 00145 - kiểm thử dấu phẩy; -- Unicode' as payload where (145 between 1 and 150) and 145+1>145;
select 146 as n, (146*3) as score, N'payload 00146 - kiểm thử dấu phẩy; -- Unicode' as payload where (146 between 1 and 150) and 146+1>146;
select 147 as n, (147*3) as score, N'payload 00147 - kiểm thử dấu phẩy; -- Unicode' as payload where (147 between 1 and 150) and 147+1>147;
select 148 as n, (148*3) as score, N'payload 00148 - kiểm thử dấu phẩy; -- Unicode' as payload where (148 between 1 and 150) and 148+1>148;
select 149 as n, (149*3) as score, N'payload 00149 - kiểm thử dấu phẩy; -- Unicode' as payload where (149 between 1 and 150) and 149+1>149;
select 150 as n, (150*3) as score, N'payload 00150 - kiểm thử dấu phẩy; -- Unicode' as payload where (150 between 1 and 150) and 150+1>150;

-- zea-case: stress/script-600-statements
select 1 as n, (1*3) as score, N'payload 00001 - kiểm thử dấu phẩy; -- Unicode' as payload where (1 between 1 and 600) and 1+1>1;
select 2 as n, (2*3) as score, N'payload 00002 - kiểm thử dấu phẩy; -- Unicode' as payload where (2 between 1 and 600) and 2+1>2;
select 3 as n, (3*3) as score, N'payload 00003 - kiểm thử dấu phẩy; -- Unicode' as payload where (3 between 1 and 600) and 3+1>3;
select 4 as n, (4*3) as score, N'payload 00004 - kiểm thử dấu phẩy; -- Unicode' as payload where (4 between 1 and 600) and 4+1>4;
select 5 as n, (5*3) as score, N'payload 00005 - kiểm thử dấu phẩy; -- Unicode' as payload where (5 between 1 and 600) and 5+1>5;
select 6 as n, (6*3) as score, N'payload 00006 - kiểm thử dấu phẩy; -- Unicode' as payload where (6 between 1 and 600) and 6+1>6;
select 7 as n, (7*3) as score, N'payload 00007 - kiểm thử dấu phẩy; -- Unicode' as payload where (7 between 1 and 600) and 7+1>7;
select 8 as n, (8*3) as score, N'payload 00008 - kiểm thử dấu phẩy; -- Unicode' as payload where (8 between 1 and 600) and 8+1>8;
select 9 as n, (9*3) as score, N'payload 00009 - kiểm thử dấu phẩy; -- Unicode' as payload where (9 between 1 and 600) and 9+1>9;
select 10 as n, (10*3) as score, N'payload 00010 - kiểm thử dấu phẩy; -- Unicode' as payload where (10 between 1 and 600) and 10+1>10;
select 11 as n, (11*3) as score, N'payload 00011 - kiểm thử dấu phẩy; -- Unicode' as payload where (11 between 1 and 600) and 11+1>11;
select 12 as n, (12*3) as score, N'payload 00012 - kiểm thử dấu phẩy; -- Unicode' as payload where (12 between 1 and 600) and 12+1>12;
select 13 as n, (13*3) as score, N'payload 00013 - kiểm thử dấu phẩy; -- Unicode' as payload where (13 between 1 and 600) and 13+1>13;
select 14 as n, (14*3) as score, N'payload 00014 - kiểm thử dấu phẩy; -- Unicode' as payload where (14 between 1 and 600) and 14+1>14;
select 15 as n, (15*3) as score, N'payload 00015 - kiểm thử dấu phẩy; -- Unicode' as payload where (15 between 1 and 600) and 15+1>15;
select 16 as n, (16*3) as score, N'payload 00016 - kiểm thử dấu phẩy; -- Unicode' as payload where (16 between 1 and 600) and 16+1>16;
select 17 as n, (17*3) as score, N'payload 00017 - kiểm thử dấu phẩy; -- Unicode' as payload where (17 between 1 and 600) and 17+1>17;
select 18 as n, (18*3) as score, N'payload 00018 - kiểm thử dấu phẩy; -- Unicode' as payload where (18 between 1 and 600) and 18+1>18;
select 19 as n, (19*3) as score, N'payload 00019 - kiểm thử dấu phẩy; -- Unicode' as payload where (19 between 1 and 600) and 19+1>19;
select 20 as n, (20*3) as score, N'payload 00020 - kiểm thử dấu phẩy; -- Unicode' as payload where (20 between 1 and 600) and 20+1>20;
select 21 as n, (21*3) as score, N'payload 00021 - kiểm thử dấu phẩy; -- Unicode' as payload where (21 between 1 and 600) and 21+1>21;
select 22 as n, (22*3) as score, N'payload 00022 - kiểm thử dấu phẩy; -- Unicode' as payload where (22 between 1 and 600) and 22+1>22;
select 23 as n, (23*3) as score, N'payload 00023 - kiểm thử dấu phẩy; -- Unicode' as payload where (23 between 1 and 600) and 23+1>23;
select 24 as n, (24*3) as score, N'payload 00024 - kiểm thử dấu phẩy; -- Unicode' as payload where (24 between 1 and 600) and 24+1>24;
select 25 as n, (25*3) as score, N'payload 00025 - kiểm thử dấu phẩy; -- Unicode' as payload where (25 between 1 and 600) and 25+1>25;
select 26 as n, (26*3) as score, N'payload 00026 - kiểm thử dấu phẩy; -- Unicode' as payload where (26 between 1 and 600) and 26+1>26;
select 27 as n, (27*3) as score, N'payload 00027 - kiểm thử dấu phẩy; -- Unicode' as payload where (27 between 1 and 600) and 27+1>27;
select 28 as n, (28*3) as score, N'payload 00028 - kiểm thử dấu phẩy; -- Unicode' as payload where (28 between 1 and 600) and 28+1>28;
select 29 as n, (29*3) as score, N'payload 00029 - kiểm thử dấu phẩy; -- Unicode' as payload where (29 between 1 and 600) and 29+1>29;
select 30 as n, (30*3) as score, N'payload 00030 - kiểm thử dấu phẩy; -- Unicode' as payload where (30 between 1 and 600) and 30+1>30;
select 31 as n, (31*3) as score, N'payload 00031 - kiểm thử dấu phẩy; -- Unicode' as payload where (31 between 1 and 600) and 31+1>31;
select 32 as n, (32*3) as score, N'payload 00032 - kiểm thử dấu phẩy; -- Unicode' as payload where (32 between 1 and 600) and 32+1>32;
select 33 as n, (33*3) as score, N'payload 00033 - kiểm thử dấu phẩy; -- Unicode' as payload where (33 between 1 and 600) and 33+1>33;
select 34 as n, (34*3) as score, N'payload 00034 - kiểm thử dấu phẩy; -- Unicode' as payload where (34 between 1 and 600) and 34+1>34;
select 35 as n, (35*3) as score, N'payload 00035 - kiểm thử dấu phẩy; -- Unicode' as payload where (35 between 1 and 600) and 35+1>35;
select 36 as n, (36*3) as score, N'payload 00036 - kiểm thử dấu phẩy; -- Unicode' as payload where (36 between 1 and 600) and 36+1>36;
select 37 as n, (37*3) as score, N'payload 00037 - kiểm thử dấu phẩy; -- Unicode' as payload where (37 between 1 and 600) and 37+1>37;
select 38 as n, (38*3) as score, N'payload 00038 - kiểm thử dấu phẩy; -- Unicode' as payload where (38 between 1 and 600) and 38+1>38;
select 39 as n, (39*3) as score, N'payload 00039 - kiểm thử dấu phẩy; -- Unicode' as payload where (39 between 1 and 600) and 39+1>39;
select 40 as n, (40*3) as score, N'payload 00040 - kiểm thử dấu phẩy; -- Unicode' as payload where (40 between 1 and 600) and 40+1>40;
select 41 as n, (41*3) as score, N'payload 00041 - kiểm thử dấu phẩy; -- Unicode' as payload where (41 between 1 and 600) and 41+1>41;
select 42 as n, (42*3) as score, N'payload 00042 - kiểm thử dấu phẩy; -- Unicode' as payload where (42 between 1 and 600) and 42+1>42;
select 43 as n, (43*3) as score, N'payload 00043 - kiểm thử dấu phẩy; -- Unicode' as payload where (43 between 1 and 600) and 43+1>43;
select 44 as n, (44*3) as score, N'payload 00044 - kiểm thử dấu phẩy; -- Unicode' as payload where (44 between 1 and 600) and 44+1>44;
select 45 as n, (45*3) as score, N'payload 00045 - kiểm thử dấu phẩy; -- Unicode' as payload where (45 between 1 and 600) and 45+1>45;
select 46 as n, (46*3) as score, N'payload 00046 - kiểm thử dấu phẩy; -- Unicode' as payload where (46 between 1 and 600) and 46+1>46;
select 47 as n, (47*3) as score, N'payload 00047 - kiểm thử dấu phẩy; -- Unicode' as payload where (47 between 1 and 600) and 47+1>47;
select 48 as n, (48*3) as score, N'payload 00048 - kiểm thử dấu phẩy; -- Unicode' as payload where (48 between 1 and 600) and 48+1>48;
select 49 as n, (49*3) as score, N'payload 00049 - kiểm thử dấu phẩy; -- Unicode' as payload where (49 between 1 and 600) and 49+1>49;
select 50 as n, (50*3) as score, N'payload 00050 - kiểm thử dấu phẩy; -- Unicode' as payload where (50 between 1 and 600) and 50+1>50;
select 51 as n, (51*3) as score, N'payload 00051 - kiểm thử dấu phẩy; -- Unicode' as payload where (51 between 1 and 600) and 51+1>51;
select 52 as n, (52*3) as score, N'payload 00052 - kiểm thử dấu phẩy; -- Unicode' as payload where (52 between 1 and 600) and 52+1>52;
select 53 as n, (53*3) as score, N'payload 00053 - kiểm thử dấu phẩy; -- Unicode' as payload where (53 between 1 and 600) and 53+1>53;
select 54 as n, (54*3) as score, N'payload 00054 - kiểm thử dấu phẩy; -- Unicode' as payload where (54 between 1 and 600) and 54+1>54;
select 55 as n, (55*3) as score, N'payload 00055 - kiểm thử dấu phẩy; -- Unicode' as payload where (55 between 1 and 600) and 55+1>55;
select 56 as n, (56*3) as score, N'payload 00056 - kiểm thử dấu phẩy; -- Unicode' as payload where (56 between 1 and 600) and 56+1>56;
select 57 as n, (57*3) as score, N'payload 00057 - kiểm thử dấu phẩy; -- Unicode' as payload where (57 between 1 and 600) and 57+1>57;
select 58 as n, (58*3) as score, N'payload 00058 - kiểm thử dấu phẩy; -- Unicode' as payload where (58 between 1 and 600) and 58+1>58;
select 59 as n, (59*3) as score, N'payload 00059 - kiểm thử dấu phẩy; -- Unicode' as payload where (59 between 1 and 600) and 59+1>59;
select 60 as n, (60*3) as score, N'payload 00060 - kiểm thử dấu phẩy; -- Unicode' as payload where (60 between 1 and 600) and 60+1>60;
select 61 as n, (61*3) as score, N'payload 00061 - kiểm thử dấu phẩy; -- Unicode' as payload where (61 between 1 and 600) and 61+1>61;
select 62 as n, (62*3) as score, N'payload 00062 - kiểm thử dấu phẩy; -- Unicode' as payload where (62 between 1 and 600) and 62+1>62;
select 63 as n, (63*3) as score, N'payload 00063 - kiểm thử dấu phẩy; -- Unicode' as payload where (63 between 1 and 600) and 63+1>63;
select 64 as n, (64*3) as score, N'payload 00064 - kiểm thử dấu phẩy; -- Unicode' as payload where (64 between 1 and 600) and 64+1>64;
select 65 as n, (65*3) as score, N'payload 00065 - kiểm thử dấu phẩy; -- Unicode' as payload where (65 between 1 and 600) and 65+1>65;
select 66 as n, (66*3) as score, N'payload 00066 - kiểm thử dấu phẩy; -- Unicode' as payload where (66 between 1 and 600) and 66+1>66;
select 67 as n, (67*3) as score, N'payload 00067 - kiểm thử dấu phẩy; -- Unicode' as payload where (67 between 1 and 600) and 67+1>67;
select 68 as n, (68*3) as score, N'payload 00068 - kiểm thử dấu phẩy; -- Unicode' as payload where (68 between 1 and 600) and 68+1>68;
select 69 as n, (69*3) as score, N'payload 00069 - kiểm thử dấu phẩy; -- Unicode' as payload where (69 between 1 and 600) and 69+1>69;
select 70 as n, (70*3) as score, N'payload 00070 - kiểm thử dấu phẩy; -- Unicode' as payload where (70 between 1 and 600) and 70+1>70;
select 71 as n, (71*3) as score, N'payload 00071 - kiểm thử dấu phẩy; -- Unicode' as payload where (71 between 1 and 600) and 71+1>71;
select 72 as n, (72*3) as score, N'payload 00072 - kiểm thử dấu phẩy; -- Unicode' as payload where (72 between 1 and 600) and 72+1>72;
select 73 as n, (73*3) as score, N'payload 00073 - kiểm thử dấu phẩy; -- Unicode' as payload where (73 between 1 and 600) and 73+1>73;
select 74 as n, (74*3) as score, N'payload 00074 - kiểm thử dấu phẩy; -- Unicode' as payload where (74 between 1 and 600) and 74+1>74;
select 75 as n, (75*3) as score, N'payload 00075 - kiểm thử dấu phẩy; -- Unicode' as payload where (75 between 1 and 600) and 75+1>75;
select 76 as n, (76*3) as score, N'payload 00076 - kiểm thử dấu phẩy; -- Unicode' as payload where (76 between 1 and 600) and 76+1>76;
select 77 as n, (77*3) as score, N'payload 00077 - kiểm thử dấu phẩy; -- Unicode' as payload where (77 between 1 and 600) and 77+1>77;
select 78 as n, (78*3) as score, N'payload 00078 - kiểm thử dấu phẩy; -- Unicode' as payload where (78 between 1 and 600) and 78+1>78;
select 79 as n, (79*3) as score, N'payload 00079 - kiểm thử dấu phẩy; -- Unicode' as payload where (79 between 1 and 600) and 79+1>79;
select 80 as n, (80*3) as score, N'payload 00080 - kiểm thử dấu phẩy; -- Unicode' as payload where (80 between 1 and 600) and 80+1>80;
select 81 as n, (81*3) as score, N'payload 00081 - kiểm thử dấu phẩy; -- Unicode' as payload where (81 between 1 and 600) and 81+1>81;
select 82 as n, (82*3) as score, N'payload 00082 - kiểm thử dấu phẩy; -- Unicode' as payload where (82 between 1 and 600) and 82+1>82;
select 83 as n, (83*3) as score, N'payload 00083 - kiểm thử dấu phẩy; -- Unicode' as payload where (83 between 1 and 600) and 83+1>83;
select 84 as n, (84*3) as score, N'payload 00084 - kiểm thử dấu phẩy; -- Unicode' as payload where (84 between 1 and 600) and 84+1>84;
select 85 as n, (85*3) as score, N'payload 00085 - kiểm thử dấu phẩy; -- Unicode' as payload where (85 between 1 and 600) and 85+1>85;
select 86 as n, (86*3) as score, N'payload 00086 - kiểm thử dấu phẩy; -- Unicode' as payload where (86 between 1 and 600) and 86+1>86;
select 87 as n, (87*3) as score, N'payload 00087 - kiểm thử dấu phẩy; -- Unicode' as payload where (87 between 1 and 600) and 87+1>87;
select 88 as n, (88*3) as score, N'payload 00088 - kiểm thử dấu phẩy; -- Unicode' as payload where (88 between 1 and 600) and 88+1>88;
select 89 as n, (89*3) as score, N'payload 00089 - kiểm thử dấu phẩy; -- Unicode' as payload where (89 between 1 and 600) and 89+1>89;
select 90 as n, (90*3) as score, N'payload 00090 - kiểm thử dấu phẩy; -- Unicode' as payload where (90 between 1 and 600) and 90+1>90;
select 91 as n, (91*3) as score, N'payload 00091 - kiểm thử dấu phẩy; -- Unicode' as payload where (91 between 1 and 600) and 91+1>91;
select 92 as n, (92*3) as score, N'payload 00092 - kiểm thử dấu phẩy; -- Unicode' as payload where (92 between 1 and 600) and 92+1>92;
select 93 as n, (93*3) as score, N'payload 00093 - kiểm thử dấu phẩy; -- Unicode' as payload where (93 between 1 and 600) and 93+1>93;
select 94 as n, (94*3) as score, N'payload 00094 - kiểm thử dấu phẩy; -- Unicode' as payload where (94 between 1 and 600) and 94+1>94;
select 95 as n, (95*3) as score, N'payload 00095 - kiểm thử dấu phẩy; -- Unicode' as payload where (95 between 1 and 600) and 95+1>95;
select 96 as n, (96*3) as score, N'payload 00096 - kiểm thử dấu phẩy; -- Unicode' as payload where (96 between 1 and 600) and 96+1>96;
select 97 as n, (97*3) as score, N'payload 00097 - kiểm thử dấu phẩy; -- Unicode' as payload where (97 between 1 and 600) and 97+1>97;
select 98 as n, (98*3) as score, N'payload 00098 - kiểm thử dấu phẩy; -- Unicode' as payload where (98 between 1 and 600) and 98+1>98;
select 99 as n, (99*3) as score, N'payload 00099 - kiểm thử dấu phẩy; -- Unicode' as payload where (99 between 1 and 600) and 99+1>99;
select 100 as n, (100*3) as score, N'payload 00100 - kiểm thử dấu phẩy; -- Unicode' as payload where (100 between 1 and 600) and 100+1>100;
select 101 as n, (101*3) as score, N'payload 00101 - kiểm thử dấu phẩy; -- Unicode' as payload where (101 between 1 and 600) and 101+1>101;
select 102 as n, (102*3) as score, N'payload 00102 - kiểm thử dấu phẩy; -- Unicode' as payload where (102 between 1 and 600) and 102+1>102;
select 103 as n, (103*3) as score, N'payload 00103 - kiểm thử dấu phẩy; -- Unicode' as payload where (103 between 1 and 600) and 103+1>103;
select 104 as n, (104*3) as score, N'payload 00104 - kiểm thử dấu phẩy; -- Unicode' as payload where (104 between 1 and 600) and 104+1>104;
select 105 as n, (105*3) as score, N'payload 00105 - kiểm thử dấu phẩy; -- Unicode' as payload where (105 between 1 and 600) and 105+1>105;
select 106 as n, (106*3) as score, N'payload 00106 - kiểm thử dấu phẩy; -- Unicode' as payload where (106 between 1 and 600) and 106+1>106;
select 107 as n, (107*3) as score, N'payload 00107 - kiểm thử dấu phẩy; -- Unicode' as payload where (107 between 1 and 600) and 107+1>107;
select 108 as n, (108*3) as score, N'payload 00108 - kiểm thử dấu phẩy; -- Unicode' as payload where (108 between 1 and 600) and 108+1>108;
select 109 as n, (109*3) as score, N'payload 00109 - kiểm thử dấu phẩy; -- Unicode' as payload where (109 between 1 and 600) and 109+1>109;
select 110 as n, (110*3) as score, N'payload 00110 - kiểm thử dấu phẩy; -- Unicode' as payload where (110 between 1 and 600) and 110+1>110;
select 111 as n, (111*3) as score, N'payload 00111 - kiểm thử dấu phẩy; -- Unicode' as payload where (111 between 1 and 600) and 111+1>111;
select 112 as n, (112*3) as score, N'payload 00112 - kiểm thử dấu phẩy; -- Unicode' as payload where (112 between 1 and 600) and 112+1>112;
select 113 as n, (113*3) as score, N'payload 00113 - kiểm thử dấu phẩy; -- Unicode' as payload where (113 between 1 and 600) and 113+1>113;
select 114 as n, (114*3) as score, N'payload 00114 - kiểm thử dấu phẩy; -- Unicode' as payload where (114 between 1 and 600) and 114+1>114;
select 115 as n, (115*3) as score, N'payload 00115 - kiểm thử dấu phẩy; -- Unicode' as payload where (115 between 1 and 600) and 115+1>115;
select 116 as n, (116*3) as score, N'payload 00116 - kiểm thử dấu phẩy; -- Unicode' as payload where (116 between 1 and 600) and 116+1>116;
select 117 as n, (117*3) as score, N'payload 00117 - kiểm thử dấu phẩy; -- Unicode' as payload where (117 between 1 and 600) and 117+1>117;
select 118 as n, (118*3) as score, N'payload 00118 - kiểm thử dấu phẩy; -- Unicode' as payload where (118 between 1 and 600) and 118+1>118;
select 119 as n, (119*3) as score, N'payload 00119 - kiểm thử dấu phẩy; -- Unicode' as payload where (119 between 1 and 600) and 119+1>119;
select 120 as n, (120*3) as score, N'payload 00120 - kiểm thử dấu phẩy; -- Unicode' as payload where (120 between 1 and 600) and 120+1>120;
select 121 as n, (121*3) as score, N'payload 00121 - kiểm thử dấu phẩy; -- Unicode' as payload where (121 between 1 and 600) and 121+1>121;
select 122 as n, (122*3) as score, N'payload 00122 - kiểm thử dấu phẩy; -- Unicode' as payload where (122 between 1 and 600) and 122+1>122;
select 123 as n, (123*3) as score, N'payload 00123 - kiểm thử dấu phẩy; -- Unicode' as payload where (123 between 1 and 600) and 123+1>123;
select 124 as n, (124*3) as score, N'payload 00124 - kiểm thử dấu phẩy; -- Unicode' as payload where (124 between 1 and 600) and 124+1>124;
select 125 as n, (125*3) as score, N'payload 00125 - kiểm thử dấu phẩy; -- Unicode' as payload where (125 between 1 and 600) and 125+1>125;
select 126 as n, (126*3) as score, N'payload 00126 - kiểm thử dấu phẩy; -- Unicode' as payload where (126 between 1 and 600) and 126+1>126;
select 127 as n, (127*3) as score, N'payload 00127 - kiểm thử dấu phẩy; -- Unicode' as payload where (127 between 1 and 600) and 127+1>127;
select 128 as n, (128*3) as score, N'payload 00128 - kiểm thử dấu phẩy; -- Unicode' as payload where (128 between 1 and 600) and 128+1>128;
select 129 as n, (129*3) as score, N'payload 00129 - kiểm thử dấu phẩy; -- Unicode' as payload where (129 between 1 and 600) and 129+1>129;
select 130 as n, (130*3) as score, N'payload 00130 - kiểm thử dấu phẩy; -- Unicode' as payload where (130 between 1 and 600) and 130+1>130;
select 131 as n, (131*3) as score, N'payload 00131 - kiểm thử dấu phẩy; -- Unicode' as payload where (131 between 1 and 600) and 131+1>131;
select 132 as n, (132*3) as score, N'payload 00132 - kiểm thử dấu phẩy; -- Unicode' as payload where (132 between 1 and 600) and 132+1>132;
select 133 as n, (133*3) as score, N'payload 00133 - kiểm thử dấu phẩy; -- Unicode' as payload where (133 between 1 and 600) and 133+1>133;
select 134 as n, (134*3) as score, N'payload 00134 - kiểm thử dấu phẩy; -- Unicode' as payload where (134 between 1 and 600) and 134+1>134;
select 135 as n, (135*3) as score, N'payload 00135 - kiểm thử dấu phẩy; -- Unicode' as payload where (135 between 1 and 600) and 135+1>135;
select 136 as n, (136*3) as score, N'payload 00136 - kiểm thử dấu phẩy; -- Unicode' as payload where (136 between 1 and 600) and 136+1>136;
select 137 as n, (137*3) as score, N'payload 00137 - kiểm thử dấu phẩy; -- Unicode' as payload where (137 between 1 and 600) and 137+1>137;
select 138 as n, (138*3) as score, N'payload 00138 - kiểm thử dấu phẩy; -- Unicode' as payload where (138 between 1 and 600) and 138+1>138;
select 139 as n, (139*3) as score, N'payload 00139 - kiểm thử dấu phẩy; -- Unicode' as payload where (139 between 1 and 600) and 139+1>139;
select 140 as n, (140*3) as score, N'payload 00140 - kiểm thử dấu phẩy; -- Unicode' as payload where (140 between 1 and 600) and 140+1>140;
select 141 as n, (141*3) as score, N'payload 00141 - kiểm thử dấu phẩy; -- Unicode' as payload where (141 between 1 and 600) and 141+1>141;
select 142 as n, (142*3) as score, N'payload 00142 - kiểm thử dấu phẩy; -- Unicode' as payload where (142 between 1 and 600) and 142+1>142;
select 143 as n, (143*3) as score, N'payload 00143 - kiểm thử dấu phẩy; -- Unicode' as payload where (143 between 1 and 600) and 143+1>143;
select 144 as n, (144*3) as score, N'payload 00144 - kiểm thử dấu phẩy; -- Unicode' as payload where (144 between 1 and 600) and 144+1>144;
select 145 as n, (145*3) as score, N'payload 00145 - kiểm thử dấu phẩy; -- Unicode' as payload where (145 between 1 and 600) and 145+1>145;
select 146 as n, (146*3) as score, N'payload 00146 - kiểm thử dấu phẩy; -- Unicode' as payload where (146 between 1 and 600) and 146+1>146;
select 147 as n, (147*3) as score, N'payload 00147 - kiểm thử dấu phẩy; -- Unicode' as payload where (147 between 1 and 600) and 147+1>147;
select 148 as n, (148*3) as score, N'payload 00148 - kiểm thử dấu phẩy; -- Unicode' as payload where (148 between 1 and 600) and 148+1>148;
select 149 as n, (149*3) as score, N'payload 00149 - kiểm thử dấu phẩy; -- Unicode' as payload where (149 between 1 and 600) and 149+1>149;
select 150 as n, (150*3) as score, N'payload 00150 - kiểm thử dấu phẩy; -- Unicode' as payload where (150 between 1 and 600) and 150+1>150;
select 151 as n, (151*3) as score, N'payload 00151 - kiểm thử dấu phẩy; -- Unicode' as payload where (151 between 1 and 600) and 151+1>151;
select 152 as n, (152*3) as score, N'payload 00152 - kiểm thử dấu phẩy; -- Unicode' as payload where (152 between 1 and 600) and 152+1>152;
select 153 as n, (153*3) as score, N'payload 00153 - kiểm thử dấu phẩy; -- Unicode' as payload where (153 between 1 and 600) and 153+1>153;
select 154 as n, (154*3) as score, N'payload 00154 - kiểm thử dấu phẩy; -- Unicode' as payload where (154 between 1 and 600) and 154+1>154;
select 155 as n, (155*3) as score, N'payload 00155 - kiểm thử dấu phẩy; -- Unicode' as payload where (155 between 1 and 600) and 155+1>155;
select 156 as n, (156*3) as score, N'payload 00156 - kiểm thử dấu phẩy; -- Unicode' as payload where (156 between 1 and 600) and 156+1>156;
select 157 as n, (157*3) as score, N'payload 00157 - kiểm thử dấu phẩy; -- Unicode' as payload where (157 between 1 and 600) and 157+1>157;
select 158 as n, (158*3) as score, N'payload 00158 - kiểm thử dấu phẩy; -- Unicode' as payload where (158 between 1 and 600) and 158+1>158;
select 159 as n, (159*3) as score, N'payload 00159 - kiểm thử dấu phẩy; -- Unicode' as payload where (159 between 1 and 600) and 159+1>159;
select 160 as n, (160*3) as score, N'payload 00160 - kiểm thử dấu phẩy; -- Unicode' as payload where (160 between 1 and 600) and 160+1>160;
select 161 as n, (161*3) as score, N'payload 00161 - kiểm thử dấu phẩy; -- Unicode' as payload where (161 between 1 and 600) and 161+1>161;
select 162 as n, (162*3) as score, N'payload 00162 - kiểm thử dấu phẩy; -- Unicode' as payload where (162 between 1 and 600) and 162+1>162;
select 163 as n, (163*3) as score, N'payload 00163 - kiểm thử dấu phẩy; -- Unicode' as payload where (163 between 1 and 600) and 163+1>163;
select 164 as n, (164*3) as score, N'payload 00164 - kiểm thử dấu phẩy; -- Unicode' as payload where (164 between 1 and 600) and 164+1>164;
select 165 as n, (165*3) as score, N'payload 00165 - kiểm thử dấu phẩy; -- Unicode' as payload where (165 between 1 and 600) and 165+1>165;
select 166 as n, (166*3) as score, N'payload 00166 - kiểm thử dấu phẩy; -- Unicode' as payload where (166 between 1 and 600) and 166+1>166;
select 167 as n, (167*3) as score, N'payload 00167 - kiểm thử dấu phẩy; -- Unicode' as payload where (167 between 1 and 600) and 167+1>167;
select 168 as n, (168*3) as score, N'payload 00168 - kiểm thử dấu phẩy; -- Unicode' as payload where (168 between 1 and 600) and 168+1>168;
select 169 as n, (169*3) as score, N'payload 00169 - kiểm thử dấu phẩy; -- Unicode' as payload where (169 between 1 and 600) and 169+1>169;
select 170 as n, (170*3) as score, N'payload 00170 - kiểm thử dấu phẩy; -- Unicode' as payload where (170 between 1 and 600) and 170+1>170;
select 171 as n, (171*3) as score, N'payload 00171 - kiểm thử dấu phẩy; -- Unicode' as payload where (171 between 1 and 600) and 171+1>171;
select 172 as n, (172*3) as score, N'payload 00172 - kiểm thử dấu phẩy; -- Unicode' as payload where (172 between 1 and 600) and 172+1>172;
select 173 as n, (173*3) as score, N'payload 00173 - kiểm thử dấu phẩy; -- Unicode' as payload where (173 between 1 and 600) and 173+1>173;
select 174 as n, (174*3) as score, N'payload 00174 - kiểm thử dấu phẩy; -- Unicode' as payload where (174 between 1 and 600) and 174+1>174;
select 175 as n, (175*3) as score, N'payload 00175 - kiểm thử dấu phẩy; -- Unicode' as payload where (175 between 1 and 600) and 175+1>175;
select 176 as n, (176*3) as score, N'payload 00176 - kiểm thử dấu phẩy; -- Unicode' as payload where (176 between 1 and 600) and 176+1>176;
select 177 as n, (177*3) as score, N'payload 00177 - kiểm thử dấu phẩy; -- Unicode' as payload where (177 between 1 and 600) and 177+1>177;
select 178 as n, (178*3) as score, N'payload 00178 - kiểm thử dấu phẩy; -- Unicode' as payload where (178 between 1 and 600) and 178+1>178;
select 179 as n, (179*3) as score, N'payload 00179 - kiểm thử dấu phẩy; -- Unicode' as payload where (179 between 1 and 600) and 179+1>179;
select 180 as n, (180*3) as score, N'payload 00180 - kiểm thử dấu phẩy; -- Unicode' as payload where (180 between 1 and 600) and 180+1>180;
select 181 as n, (181*3) as score, N'payload 00181 - kiểm thử dấu phẩy; -- Unicode' as payload where (181 between 1 and 600) and 181+1>181;
select 182 as n, (182*3) as score, N'payload 00182 - kiểm thử dấu phẩy; -- Unicode' as payload where (182 between 1 and 600) and 182+1>182;
select 183 as n, (183*3) as score, N'payload 00183 - kiểm thử dấu phẩy; -- Unicode' as payload where (183 between 1 and 600) and 183+1>183;
select 184 as n, (184*3) as score, N'payload 00184 - kiểm thử dấu phẩy; -- Unicode' as payload where (184 between 1 and 600) and 184+1>184;
select 185 as n, (185*3) as score, N'payload 00185 - kiểm thử dấu phẩy; -- Unicode' as payload where (185 between 1 and 600) and 185+1>185;
select 186 as n, (186*3) as score, N'payload 00186 - kiểm thử dấu phẩy; -- Unicode' as payload where (186 between 1 and 600) and 186+1>186;
select 187 as n, (187*3) as score, N'payload 00187 - kiểm thử dấu phẩy; -- Unicode' as payload where (187 between 1 and 600) and 187+1>187;
select 188 as n, (188*3) as score, N'payload 00188 - kiểm thử dấu phẩy; -- Unicode' as payload where (188 between 1 and 600) and 188+1>188;
select 189 as n, (189*3) as score, N'payload 00189 - kiểm thử dấu phẩy; -- Unicode' as payload where (189 between 1 and 600) and 189+1>189;
select 190 as n, (190*3) as score, N'payload 00190 - kiểm thử dấu phẩy; -- Unicode' as payload where (190 between 1 and 600) and 190+1>190;
select 191 as n, (191*3) as score, N'payload 00191 - kiểm thử dấu phẩy; -- Unicode' as payload where (191 between 1 and 600) and 191+1>191;
select 192 as n, (192*3) as score, N'payload 00192 - kiểm thử dấu phẩy; -- Unicode' as payload where (192 between 1 and 600) and 192+1>192;
select 193 as n, (193*3) as score, N'payload 00193 - kiểm thử dấu phẩy; -- Unicode' as payload where (193 between 1 and 600) and 193+1>193;
select 194 as n, (194*3) as score, N'payload 00194 - kiểm thử dấu phẩy; -- Unicode' as payload where (194 between 1 and 600) and 194+1>194;
select 195 as n, (195*3) as score, N'payload 00195 - kiểm thử dấu phẩy; -- Unicode' as payload where (195 between 1 and 600) and 195+1>195;
select 196 as n, (196*3) as score, N'payload 00196 - kiểm thử dấu phẩy; -- Unicode' as payload where (196 between 1 and 600) and 196+1>196;
select 197 as n, (197*3) as score, N'payload 00197 - kiểm thử dấu phẩy; -- Unicode' as payload where (197 between 1 and 600) and 197+1>197;
select 198 as n, (198*3) as score, N'payload 00198 - kiểm thử dấu phẩy; -- Unicode' as payload where (198 between 1 and 600) and 198+1>198;
select 199 as n, (199*3) as score, N'payload 00199 - kiểm thử dấu phẩy; -- Unicode' as payload where (199 between 1 and 600) and 199+1>199;
select 200 as n, (200*3) as score, N'payload 00200 - kiểm thử dấu phẩy; -- Unicode' as payload where (200 between 1 and 600) and 200+1>200;
select 201 as n, (201*3) as score, N'payload 00201 - kiểm thử dấu phẩy; -- Unicode' as payload where (201 between 1 and 600) and 201+1>201;
select 202 as n, (202*3) as score, N'payload 00202 - kiểm thử dấu phẩy; -- Unicode' as payload where (202 between 1 and 600) and 202+1>202;
select 203 as n, (203*3) as score, N'payload 00203 - kiểm thử dấu phẩy; -- Unicode' as payload where (203 between 1 and 600) and 203+1>203;
select 204 as n, (204*3) as score, N'payload 00204 - kiểm thử dấu phẩy; -- Unicode' as payload where (204 between 1 and 600) and 204+1>204;
select 205 as n, (205*3) as score, N'payload 00205 - kiểm thử dấu phẩy; -- Unicode' as payload where (205 between 1 and 600) and 205+1>205;
select 206 as n, (206*3) as score, N'payload 00206 - kiểm thử dấu phẩy; -- Unicode' as payload where (206 between 1 and 600) and 206+1>206;
select 207 as n, (207*3) as score, N'payload 00207 - kiểm thử dấu phẩy; -- Unicode' as payload where (207 between 1 and 600) and 207+1>207;
select 208 as n, (208*3) as score, N'payload 00208 - kiểm thử dấu phẩy; -- Unicode' as payload where (208 between 1 and 600) and 208+1>208;
select 209 as n, (209*3) as score, N'payload 00209 - kiểm thử dấu phẩy; -- Unicode' as payload where (209 between 1 and 600) and 209+1>209;
select 210 as n, (210*3) as score, N'payload 00210 - kiểm thử dấu phẩy; -- Unicode' as payload where (210 between 1 and 600) and 210+1>210;
select 211 as n, (211*3) as score, N'payload 00211 - kiểm thử dấu phẩy; -- Unicode' as payload where (211 between 1 and 600) and 211+1>211;
select 212 as n, (212*3) as score, N'payload 00212 - kiểm thử dấu phẩy; -- Unicode' as payload where (212 between 1 and 600) and 212+1>212;
select 213 as n, (213*3) as score, N'payload 00213 - kiểm thử dấu phẩy; -- Unicode' as payload where (213 between 1 and 600) and 213+1>213;
select 214 as n, (214*3) as score, N'payload 00214 - kiểm thử dấu phẩy; -- Unicode' as payload where (214 between 1 and 600) and 214+1>214;
select 215 as n, (215*3) as score, N'payload 00215 - kiểm thử dấu phẩy; -- Unicode' as payload where (215 between 1 and 600) and 215+1>215;
select 216 as n, (216*3) as score, N'payload 00216 - kiểm thử dấu phẩy; -- Unicode' as payload where (216 between 1 and 600) and 216+1>216;
select 217 as n, (217*3) as score, N'payload 00217 - kiểm thử dấu phẩy; -- Unicode' as payload where (217 between 1 and 600) and 217+1>217;
select 218 as n, (218*3) as score, N'payload 00218 - kiểm thử dấu phẩy; -- Unicode' as payload where (218 between 1 and 600) and 218+1>218;
select 219 as n, (219*3) as score, N'payload 00219 - kiểm thử dấu phẩy; -- Unicode' as payload where (219 between 1 and 600) and 219+1>219;
select 220 as n, (220*3) as score, N'payload 00220 - kiểm thử dấu phẩy; -- Unicode' as payload where (220 between 1 and 600) and 220+1>220;
select 221 as n, (221*3) as score, N'payload 00221 - kiểm thử dấu phẩy; -- Unicode' as payload where (221 between 1 and 600) and 221+1>221;
select 222 as n, (222*3) as score, N'payload 00222 - kiểm thử dấu phẩy; -- Unicode' as payload where (222 between 1 and 600) and 222+1>222;
select 223 as n, (223*3) as score, N'payload 00223 - kiểm thử dấu phẩy; -- Unicode' as payload where (223 between 1 and 600) and 223+1>223;
select 224 as n, (224*3) as score, N'payload 00224 - kiểm thử dấu phẩy; -- Unicode' as payload where (224 between 1 and 600) and 224+1>224;
select 225 as n, (225*3) as score, N'payload 00225 - kiểm thử dấu phẩy; -- Unicode' as payload where (225 between 1 and 600) and 225+1>225;
select 226 as n, (226*3) as score, N'payload 00226 - kiểm thử dấu phẩy; -- Unicode' as payload where (226 between 1 and 600) and 226+1>226;
select 227 as n, (227*3) as score, N'payload 00227 - kiểm thử dấu phẩy; -- Unicode' as payload where (227 between 1 and 600) and 227+1>227;
select 228 as n, (228*3) as score, N'payload 00228 - kiểm thử dấu phẩy; -- Unicode' as payload where (228 between 1 and 600) and 228+1>228;
select 229 as n, (229*3) as score, N'payload 00229 - kiểm thử dấu phẩy; -- Unicode' as payload where (229 between 1 and 600) and 229+1>229;
select 230 as n, (230*3) as score, N'payload 00230 - kiểm thử dấu phẩy; -- Unicode' as payload where (230 between 1 and 600) and 230+1>230;
select 231 as n, (231*3) as score, N'payload 00231 - kiểm thử dấu phẩy; -- Unicode' as payload where (231 between 1 and 600) and 231+1>231;
select 232 as n, (232*3) as score, N'payload 00232 - kiểm thử dấu phẩy; -- Unicode' as payload where (232 between 1 and 600) and 232+1>232;
select 233 as n, (233*3) as score, N'payload 00233 - kiểm thử dấu phẩy; -- Unicode' as payload where (233 between 1 and 600) and 233+1>233;
select 234 as n, (234*3) as score, N'payload 00234 - kiểm thử dấu phẩy; -- Unicode' as payload where (234 between 1 and 600) and 234+1>234;
select 235 as n, (235*3) as score, N'payload 00235 - kiểm thử dấu phẩy; -- Unicode' as payload where (235 between 1 and 600) and 235+1>235;
select 236 as n, (236*3) as score, N'payload 00236 - kiểm thử dấu phẩy; -- Unicode' as payload where (236 between 1 and 600) and 236+1>236;
select 237 as n, (237*3) as score, N'payload 00237 - kiểm thử dấu phẩy; -- Unicode' as payload where (237 between 1 and 600) and 237+1>237;
select 238 as n, (238*3) as score, N'payload 00238 - kiểm thử dấu phẩy; -- Unicode' as payload where (238 between 1 and 600) and 238+1>238;
select 239 as n, (239*3) as score, N'payload 00239 - kiểm thử dấu phẩy; -- Unicode' as payload where (239 between 1 and 600) and 239+1>239;
select 240 as n, (240*3) as score, N'payload 00240 - kiểm thử dấu phẩy; -- Unicode' as payload where (240 between 1 and 600) and 240+1>240;
select 241 as n, (241*3) as score, N'payload 00241 - kiểm thử dấu phẩy; -- Unicode' as payload where (241 between 1 and 600) and 241+1>241;
select 242 as n, (242*3) as score, N'payload 00242 - kiểm thử dấu phẩy; -- Unicode' as payload where (242 between 1 and 600) and 242+1>242;
select 243 as n, (243*3) as score, N'payload 00243 - kiểm thử dấu phẩy; -- Unicode' as payload where (243 between 1 and 600) and 243+1>243;
select 244 as n, (244*3) as score, N'payload 00244 - kiểm thử dấu phẩy; -- Unicode' as payload where (244 between 1 and 600) and 244+1>244;
select 245 as n, (245*3) as score, N'payload 00245 - kiểm thử dấu phẩy; -- Unicode' as payload where (245 between 1 and 600) and 245+1>245;
select 246 as n, (246*3) as score, N'payload 00246 - kiểm thử dấu phẩy; -- Unicode' as payload where (246 between 1 and 600) and 246+1>246;
select 247 as n, (247*3) as score, N'payload 00247 - kiểm thử dấu phẩy; -- Unicode' as payload where (247 between 1 and 600) and 247+1>247;
select 248 as n, (248*3) as score, N'payload 00248 - kiểm thử dấu phẩy; -- Unicode' as payload where (248 between 1 and 600) and 248+1>248;
select 249 as n, (249*3) as score, N'payload 00249 - kiểm thử dấu phẩy; -- Unicode' as payload where (249 between 1 and 600) and 249+1>249;
select 250 as n, (250*3) as score, N'payload 00250 - kiểm thử dấu phẩy; -- Unicode' as payload where (250 between 1 and 600) and 250+1>250;
select 251 as n, (251*3) as score, N'payload 00251 - kiểm thử dấu phẩy; -- Unicode' as payload where (251 between 1 and 600) and 251+1>251;
select 252 as n, (252*3) as score, N'payload 00252 - kiểm thử dấu phẩy; -- Unicode' as payload where (252 between 1 and 600) and 252+1>252;
select 253 as n, (253*3) as score, N'payload 00253 - kiểm thử dấu phẩy; -- Unicode' as payload where (253 between 1 and 600) and 253+1>253;
select 254 as n, (254*3) as score, N'payload 00254 - kiểm thử dấu phẩy; -- Unicode' as payload where (254 between 1 and 600) and 254+1>254;
select 255 as n, (255*3) as score, N'payload 00255 - kiểm thử dấu phẩy; -- Unicode' as payload where (255 between 1 and 600) and 255+1>255;
select 256 as n, (256*3) as score, N'payload 00256 - kiểm thử dấu phẩy; -- Unicode' as payload where (256 between 1 and 600) and 256+1>256;
select 257 as n, (257*3) as score, N'payload 00257 - kiểm thử dấu phẩy; -- Unicode' as payload where (257 between 1 and 600) and 257+1>257;
select 258 as n, (258*3) as score, N'payload 00258 - kiểm thử dấu phẩy; -- Unicode' as payload where (258 between 1 and 600) and 258+1>258;
select 259 as n, (259*3) as score, N'payload 00259 - kiểm thử dấu phẩy; -- Unicode' as payload where (259 between 1 and 600) and 259+1>259;
select 260 as n, (260*3) as score, N'payload 00260 - kiểm thử dấu phẩy; -- Unicode' as payload where (260 between 1 and 600) and 260+1>260;
select 261 as n, (261*3) as score, N'payload 00261 - kiểm thử dấu phẩy; -- Unicode' as payload where (261 between 1 and 600) and 261+1>261;
select 262 as n, (262*3) as score, N'payload 00262 - kiểm thử dấu phẩy; -- Unicode' as payload where (262 between 1 and 600) and 262+1>262;
select 263 as n, (263*3) as score, N'payload 00263 - kiểm thử dấu phẩy; -- Unicode' as payload where (263 between 1 and 600) and 263+1>263;
select 264 as n, (264*3) as score, N'payload 00264 - kiểm thử dấu phẩy; -- Unicode' as payload where (264 between 1 and 600) and 264+1>264;
select 265 as n, (265*3) as score, N'payload 00265 - kiểm thử dấu phẩy; -- Unicode' as payload where (265 between 1 and 600) and 265+1>265;
select 266 as n, (266*3) as score, N'payload 00266 - kiểm thử dấu phẩy; -- Unicode' as payload where (266 between 1 and 600) and 266+1>266;
select 267 as n, (267*3) as score, N'payload 00267 - kiểm thử dấu phẩy; -- Unicode' as payload where (267 between 1 and 600) and 267+1>267;
select 268 as n, (268*3) as score, N'payload 00268 - kiểm thử dấu phẩy; -- Unicode' as payload where (268 between 1 and 600) and 268+1>268;
select 269 as n, (269*3) as score, N'payload 00269 - kiểm thử dấu phẩy; -- Unicode' as payload where (269 between 1 and 600) and 269+1>269;
select 270 as n, (270*3) as score, N'payload 00270 - kiểm thử dấu phẩy; -- Unicode' as payload where (270 between 1 and 600) and 270+1>270;
select 271 as n, (271*3) as score, N'payload 00271 - kiểm thử dấu phẩy; -- Unicode' as payload where (271 between 1 and 600) and 271+1>271;
select 272 as n, (272*3) as score, N'payload 00272 - kiểm thử dấu phẩy; -- Unicode' as payload where (272 between 1 and 600) and 272+1>272;
select 273 as n, (273*3) as score, N'payload 00273 - kiểm thử dấu phẩy; -- Unicode' as payload where (273 between 1 and 600) and 273+1>273;
select 274 as n, (274*3) as score, N'payload 00274 - kiểm thử dấu phẩy; -- Unicode' as payload where (274 between 1 and 600) and 274+1>274;
select 275 as n, (275*3) as score, N'payload 00275 - kiểm thử dấu phẩy; -- Unicode' as payload where (275 between 1 and 600) and 275+1>275;
select 276 as n, (276*3) as score, N'payload 00276 - kiểm thử dấu phẩy; -- Unicode' as payload where (276 between 1 and 600) and 276+1>276;
select 277 as n, (277*3) as score, N'payload 00277 - kiểm thử dấu phẩy; -- Unicode' as payload where (277 between 1 and 600) and 277+1>277;
select 278 as n, (278*3) as score, N'payload 00278 - kiểm thử dấu phẩy; -- Unicode' as payload where (278 between 1 and 600) and 278+1>278;
select 279 as n, (279*3) as score, N'payload 00279 - kiểm thử dấu phẩy; -- Unicode' as payload where (279 between 1 and 600) and 279+1>279;
select 280 as n, (280*3) as score, N'payload 00280 - kiểm thử dấu phẩy; -- Unicode' as payload where (280 between 1 and 600) and 280+1>280;
select 281 as n, (281*3) as score, N'payload 00281 - kiểm thử dấu phẩy; -- Unicode' as payload where (281 between 1 and 600) and 281+1>281;
select 282 as n, (282*3) as score, N'payload 00282 - kiểm thử dấu phẩy; -- Unicode' as payload where (282 between 1 and 600) and 282+1>282;
select 283 as n, (283*3) as score, N'payload 00283 - kiểm thử dấu phẩy; -- Unicode' as payload where (283 between 1 and 600) and 283+1>283;
select 284 as n, (284*3) as score, N'payload 00284 - kiểm thử dấu phẩy; -- Unicode' as payload where (284 between 1 and 600) and 284+1>284;
select 285 as n, (285*3) as score, N'payload 00285 - kiểm thử dấu phẩy; -- Unicode' as payload where (285 between 1 and 600) and 285+1>285;
select 286 as n, (286*3) as score, N'payload 00286 - kiểm thử dấu phẩy; -- Unicode' as payload where (286 between 1 and 600) and 286+1>286;
select 287 as n, (287*3) as score, N'payload 00287 - kiểm thử dấu phẩy; -- Unicode' as payload where (287 between 1 and 600) and 287+1>287;
select 288 as n, (288*3) as score, N'payload 00288 - kiểm thử dấu phẩy; -- Unicode' as payload where (288 between 1 and 600) and 288+1>288;
select 289 as n, (289*3) as score, N'payload 00289 - kiểm thử dấu phẩy; -- Unicode' as payload where (289 between 1 and 600) and 289+1>289;
select 290 as n, (290*3) as score, N'payload 00290 - kiểm thử dấu phẩy; -- Unicode' as payload where (290 between 1 and 600) and 290+1>290;
select 291 as n, (291*3) as score, N'payload 00291 - kiểm thử dấu phẩy; -- Unicode' as payload where (291 between 1 and 600) and 291+1>291;
select 292 as n, (292*3) as score, N'payload 00292 - kiểm thử dấu phẩy; -- Unicode' as payload where (292 between 1 and 600) and 292+1>292;
select 293 as n, (293*3) as score, N'payload 00293 - kiểm thử dấu phẩy; -- Unicode' as payload where (293 between 1 and 600) and 293+1>293;
select 294 as n, (294*3) as score, N'payload 00294 - kiểm thử dấu phẩy; -- Unicode' as payload where (294 between 1 and 600) and 294+1>294;
select 295 as n, (295*3) as score, N'payload 00295 - kiểm thử dấu phẩy; -- Unicode' as payload where (295 between 1 and 600) and 295+1>295;
select 296 as n, (296*3) as score, N'payload 00296 - kiểm thử dấu phẩy; -- Unicode' as payload where (296 between 1 and 600) and 296+1>296;
select 297 as n, (297*3) as score, N'payload 00297 - kiểm thử dấu phẩy; -- Unicode' as payload where (297 between 1 and 600) and 297+1>297;
select 298 as n, (298*3) as score, N'payload 00298 - kiểm thử dấu phẩy; -- Unicode' as payload where (298 between 1 and 600) and 298+1>298;
select 299 as n, (299*3) as score, N'payload 00299 - kiểm thử dấu phẩy; -- Unicode' as payload where (299 between 1 and 600) and 299+1>299;
select 300 as n, (300*3) as score, N'payload 00300 - kiểm thử dấu phẩy; -- Unicode' as payload where (300 between 1 and 600) and 300+1>300;
select 301 as n, (301*3) as score, N'payload 00301 - kiểm thử dấu phẩy; -- Unicode' as payload where (301 between 1 and 600) and 301+1>301;
select 302 as n, (302*3) as score, N'payload 00302 - kiểm thử dấu phẩy; -- Unicode' as payload where (302 between 1 and 600) and 302+1>302;
select 303 as n, (303*3) as score, N'payload 00303 - kiểm thử dấu phẩy; -- Unicode' as payload where (303 between 1 and 600) and 303+1>303;
select 304 as n, (304*3) as score, N'payload 00304 - kiểm thử dấu phẩy; -- Unicode' as payload where (304 between 1 and 600) and 304+1>304;
select 305 as n, (305*3) as score, N'payload 00305 - kiểm thử dấu phẩy; -- Unicode' as payload where (305 between 1 and 600) and 305+1>305;
select 306 as n, (306*3) as score, N'payload 00306 - kiểm thử dấu phẩy; -- Unicode' as payload where (306 between 1 and 600) and 306+1>306;
select 307 as n, (307*3) as score, N'payload 00307 - kiểm thử dấu phẩy; -- Unicode' as payload where (307 between 1 and 600) and 307+1>307;
select 308 as n, (308*3) as score, N'payload 00308 - kiểm thử dấu phẩy; -- Unicode' as payload where (308 between 1 and 600) and 308+1>308;
select 309 as n, (309*3) as score, N'payload 00309 - kiểm thử dấu phẩy; -- Unicode' as payload where (309 between 1 and 600) and 309+1>309;
select 310 as n, (310*3) as score, N'payload 00310 - kiểm thử dấu phẩy; -- Unicode' as payload where (310 between 1 and 600) and 310+1>310;
select 311 as n, (311*3) as score, N'payload 00311 - kiểm thử dấu phẩy; -- Unicode' as payload where (311 between 1 and 600) and 311+1>311;
select 312 as n, (312*3) as score, N'payload 00312 - kiểm thử dấu phẩy; -- Unicode' as payload where (312 between 1 and 600) and 312+1>312;
select 313 as n, (313*3) as score, N'payload 00313 - kiểm thử dấu phẩy; -- Unicode' as payload where (313 between 1 and 600) and 313+1>313;
select 314 as n, (314*3) as score, N'payload 00314 - kiểm thử dấu phẩy; -- Unicode' as payload where (314 between 1 and 600) and 314+1>314;
select 315 as n, (315*3) as score, N'payload 00315 - kiểm thử dấu phẩy; -- Unicode' as payload where (315 between 1 and 600) and 315+1>315;
select 316 as n, (316*3) as score, N'payload 00316 - kiểm thử dấu phẩy; -- Unicode' as payload where (316 between 1 and 600) and 316+1>316;
select 317 as n, (317*3) as score, N'payload 00317 - kiểm thử dấu phẩy; -- Unicode' as payload where (317 between 1 and 600) and 317+1>317;
select 318 as n, (318*3) as score, N'payload 00318 - kiểm thử dấu phẩy; -- Unicode' as payload where (318 between 1 and 600) and 318+1>318;
select 319 as n, (319*3) as score, N'payload 00319 - kiểm thử dấu phẩy; -- Unicode' as payload where (319 between 1 and 600) and 319+1>319;
select 320 as n, (320*3) as score, N'payload 00320 - kiểm thử dấu phẩy; -- Unicode' as payload where (320 between 1 and 600) and 320+1>320;
select 321 as n, (321*3) as score, N'payload 00321 - kiểm thử dấu phẩy; -- Unicode' as payload where (321 between 1 and 600) and 321+1>321;
select 322 as n, (322*3) as score, N'payload 00322 - kiểm thử dấu phẩy; -- Unicode' as payload where (322 between 1 and 600) and 322+1>322;
select 323 as n, (323*3) as score, N'payload 00323 - kiểm thử dấu phẩy; -- Unicode' as payload where (323 between 1 and 600) and 323+1>323;
select 324 as n, (324*3) as score, N'payload 00324 - kiểm thử dấu phẩy; -- Unicode' as payload where (324 between 1 and 600) and 324+1>324;
select 325 as n, (325*3) as score, N'payload 00325 - kiểm thử dấu phẩy; -- Unicode' as payload where (325 between 1 and 600) and 325+1>325;
select 326 as n, (326*3) as score, N'payload 00326 - kiểm thử dấu phẩy; -- Unicode' as payload where (326 between 1 and 600) and 326+1>326;
select 327 as n, (327*3) as score, N'payload 00327 - kiểm thử dấu phẩy; -- Unicode' as payload where (327 between 1 and 600) and 327+1>327;
select 328 as n, (328*3) as score, N'payload 00328 - kiểm thử dấu phẩy; -- Unicode' as payload where (328 between 1 and 600) and 328+1>328;
select 329 as n, (329*3) as score, N'payload 00329 - kiểm thử dấu phẩy; -- Unicode' as payload where (329 between 1 and 600) and 329+1>329;
select 330 as n, (330*3) as score, N'payload 00330 - kiểm thử dấu phẩy; -- Unicode' as payload where (330 between 1 and 600) and 330+1>330;
select 331 as n, (331*3) as score, N'payload 00331 - kiểm thử dấu phẩy; -- Unicode' as payload where (331 between 1 and 600) and 331+1>331;
select 332 as n, (332*3) as score, N'payload 00332 - kiểm thử dấu phẩy; -- Unicode' as payload where (332 between 1 and 600) and 332+1>332;
select 333 as n, (333*3) as score, N'payload 00333 - kiểm thử dấu phẩy; -- Unicode' as payload where (333 between 1 and 600) and 333+1>333;
select 334 as n, (334*3) as score, N'payload 00334 - kiểm thử dấu phẩy; -- Unicode' as payload where (334 between 1 and 600) and 334+1>334;
select 335 as n, (335*3) as score, N'payload 00335 - kiểm thử dấu phẩy; -- Unicode' as payload where (335 between 1 and 600) and 335+1>335;
select 336 as n, (336*3) as score, N'payload 00336 - kiểm thử dấu phẩy; -- Unicode' as payload where (336 between 1 and 600) and 336+1>336;
select 337 as n, (337*3) as score, N'payload 00337 - kiểm thử dấu phẩy; -- Unicode' as payload where (337 between 1 and 600) and 337+1>337;
select 338 as n, (338*3) as score, N'payload 00338 - kiểm thử dấu phẩy; -- Unicode' as payload where (338 between 1 and 600) and 338+1>338;
select 339 as n, (339*3) as score, N'payload 00339 - kiểm thử dấu phẩy; -- Unicode' as payload where (339 between 1 and 600) and 339+1>339;
select 340 as n, (340*3) as score, N'payload 00340 - kiểm thử dấu phẩy; -- Unicode' as payload where (340 between 1 and 600) and 340+1>340;
select 341 as n, (341*3) as score, N'payload 00341 - kiểm thử dấu phẩy; -- Unicode' as payload where (341 between 1 and 600) and 341+1>341;
select 342 as n, (342*3) as score, N'payload 00342 - kiểm thử dấu phẩy; -- Unicode' as payload where (342 between 1 and 600) and 342+1>342;
select 343 as n, (343*3) as score, N'payload 00343 - kiểm thử dấu phẩy; -- Unicode' as payload where (343 between 1 and 600) and 343+1>343;
select 344 as n, (344*3) as score, N'payload 00344 - kiểm thử dấu phẩy; -- Unicode' as payload where (344 between 1 and 600) and 344+1>344;
select 345 as n, (345*3) as score, N'payload 00345 - kiểm thử dấu phẩy; -- Unicode' as payload where (345 between 1 and 600) and 345+1>345;
select 346 as n, (346*3) as score, N'payload 00346 - kiểm thử dấu phẩy; -- Unicode' as payload where (346 between 1 and 600) and 346+1>346;
select 347 as n, (347*3) as score, N'payload 00347 - kiểm thử dấu phẩy; -- Unicode' as payload where (347 between 1 and 600) and 347+1>347;
select 348 as n, (348*3) as score, N'payload 00348 - kiểm thử dấu phẩy; -- Unicode' as payload where (348 between 1 and 600) and 348+1>348;
select 349 as n, (349*3) as score, N'payload 00349 - kiểm thử dấu phẩy; -- Unicode' as payload where (349 between 1 and 600) and 349+1>349;
select 350 as n, (350*3) as score, N'payload 00350 - kiểm thử dấu phẩy; -- Unicode' as payload where (350 between 1 and 600) and 350+1>350;
select 351 as n, (351*3) as score, N'payload 00351 - kiểm thử dấu phẩy; -- Unicode' as payload where (351 between 1 and 600) and 351+1>351;
select 352 as n, (352*3) as score, N'payload 00352 - kiểm thử dấu phẩy; -- Unicode' as payload where (352 between 1 and 600) and 352+1>352;
select 353 as n, (353*3) as score, N'payload 00353 - kiểm thử dấu phẩy; -- Unicode' as payload where (353 between 1 and 600) and 353+1>353;
select 354 as n, (354*3) as score, N'payload 00354 - kiểm thử dấu phẩy; -- Unicode' as payload where (354 between 1 and 600) and 354+1>354;
select 355 as n, (355*3) as score, N'payload 00355 - kiểm thử dấu phẩy; -- Unicode' as payload where (355 between 1 and 600) and 355+1>355;
select 356 as n, (356*3) as score, N'payload 00356 - kiểm thử dấu phẩy; -- Unicode' as payload where (356 between 1 and 600) and 356+1>356;
select 357 as n, (357*3) as score, N'payload 00357 - kiểm thử dấu phẩy; -- Unicode' as payload where (357 between 1 and 600) and 357+1>357;
select 358 as n, (358*3) as score, N'payload 00358 - kiểm thử dấu phẩy; -- Unicode' as payload where (358 between 1 and 600) and 358+1>358;
select 359 as n, (359*3) as score, N'payload 00359 - kiểm thử dấu phẩy; -- Unicode' as payload where (359 between 1 and 600) and 359+1>359;
select 360 as n, (360*3) as score, N'payload 00360 - kiểm thử dấu phẩy; -- Unicode' as payload where (360 between 1 and 600) and 360+1>360;
select 361 as n, (361*3) as score, N'payload 00361 - kiểm thử dấu phẩy; -- Unicode' as payload where (361 between 1 and 600) and 361+1>361;
select 362 as n, (362*3) as score, N'payload 00362 - kiểm thử dấu phẩy; -- Unicode' as payload where (362 between 1 and 600) and 362+1>362;
select 363 as n, (363*3) as score, N'payload 00363 - kiểm thử dấu phẩy; -- Unicode' as payload where (363 between 1 and 600) and 363+1>363;
select 364 as n, (364*3) as score, N'payload 00364 - kiểm thử dấu phẩy; -- Unicode' as payload where (364 between 1 and 600) and 364+1>364;
select 365 as n, (365*3) as score, N'payload 00365 - kiểm thử dấu phẩy; -- Unicode' as payload where (365 between 1 and 600) and 365+1>365;
select 366 as n, (366*3) as score, N'payload 00366 - kiểm thử dấu phẩy; -- Unicode' as payload where (366 between 1 and 600) and 366+1>366;
select 367 as n, (367*3) as score, N'payload 00367 - kiểm thử dấu phẩy; -- Unicode' as payload where (367 between 1 and 600) and 367+1>367;
select 368 as n, (368*3) as score, N'payload 00368 - kiểm thử dấu phẩy; -- Unicode' as payload where (368 between 1 and 600) and 368+1>368;
select 369 as n, (369*3) as score, N'payload 00369 - kiểm thử dấu phẩy; -- Unicode' as payload where (369 between 1 and 600) and 369+1>369;
select 370 as n, (370*3) as score, N'payload 00370 - kiểm thử dấu phẩy; -- Unicode' as payload where (370 between 1 and 600) and 370+1>370;
select 371 as n, (371*3) as score, N'payload 00371 - kiểm thử dấu phẩy; -- Unicode' as payload where (371 between 1 and 600) and 371+1>371;
select 372 as n, (372*3) as score, N'payload 00372 - kiểm thử dấu phẩy; -- Unicode' as payload where (372 between 1 and 600) and 372+1>372;
select 373 as n, (373*3) as score, N'payload 00373 - kiểm thử dấu phẩy; -- Unicode' as payload where (373 between 1 and 600) and 373+1>373;
select 374 as n, (374*3) as score, N'payload 00374 - kiểm thử dấu phẩy; -- Unicode' as payload where (374 between 1 and 600) and 374+1>374;
select 375 as n, (375*3) as score, N'payload 00375 - kiểm thử dấu phẩy; -- Unicode' as payload where (375 between 1 and 600) and 375+1>375;
select 376 as n, (376*3) as score, N'payload 00376 - kiểm thử dấu phẩy; -- Unicode' as payload where (376 between 1 and 600) and 376+1>376;
select 377 as n, (377*3) as score, N'payload 00377 - kiểm thử dấu phẩy; -- Unicode' as payload where (377 between 1 and 600) and 377+1>377;
select 378 as n, (378*3) as score, N'payload 00378 - kiểm thử dấu phẩy; -- Unicode' as payload where (378 between 1 and 600) and 378+1>378;
select 379 as n, (379*3) as score, N'payload 00379 - kiểm thử dấu phẩy; -- Unicode' as payload where (379 between 1 and 600) and 379+1>379;
select 380 as n, (380*3) as score, N'payload 00380 - kiểm thử dấu phẩy; -- Unicode' as payload where (380 between 1 and 600) and 380+1>380;
select 381 as n, (381*3) as score, N'payload 00381 - kiểm thử dấu phẩy; -- Unicode' as payload where (381 between 1 and 600) and 381+1>381;
select 382 as n, (382*3) as score, N'payload 00382 - kiểm thử dấu phẩy; -- Unicode' as payload where (382 between 1 and 600) and 382+1>382;
select 383 as n, (383*3) as score, N'payload 00383 - kiểm thử dấu phẩy; -- Unicode' as payload where (383 between 1 and 600) and 383+1>383;
select 384 as n, (384*3) as score, N'payload 00384 - kiểm thử dấu phẩy; -- Unicode' as payload where (384 between 1 and 600) and 384+1>384;
select 385 as n, (385*3) as score, N'payload 00385 - kiểm thử dấu phẩy; -- Unicode' as payload where (385 between 1 and 600) and 385+1>385;
select 386 as n, (386*3) as score, N'payload 00386 - kiểm thử dấu phẩy; -- Unicode' as payload where (386 between 1 and 600) and 386+1>386;
select 387 as n, (387*3) as score, N'payload 00387 - kiểm thử dấu phẩy; -- Unicode' as payload where (387 between 1 and 600) and 387+1>387;
select 388 as n, (388*3) as score, N'payload 00388 - kiểm thử dấu phẩy; -- Unicode' as payload where (388 between 1 and 600) and 388+1>388;
select 389 as n, (389*3) as score, N'payload 00389 - kiểm thử dấu phẩy; -- Unicode' as payload where (389 between 1 and 600) and 389+1>389;
select 390 as n, (390*3) as score, N'payload 00390 - kiểm thử dấu phẩy; -- Unicode' as payload where (390 between 1 and 600) and 390+1>390;
select 391 as n, (391*3) as score, N'payload 00391 - kiểm thử dấu phẩy; -- Unicode' as payload where (391 between 1 and 600) and 391+1>391;
select 392 as n, (392*3) as score, N'payload 00392 - kiểm thử dấu phẩy; -- Unicode' as payload where (392 between 1 and 600) and 392+1>392;
select 393 as n, (393*3) as score, N'payload 00393 - kiểm thử dấu phẩy; -- Unicode' as payload where (393 between 1 and 600) and 393+1>393;
select 394 as n, (394*3) as score, N'payload 00394 - kiểm thử dấu phẩy; -- Unicode' as payload where (394 between 1 and 600) and 394+1>394;
select 395 as n, (395*3) as score, N'payload 00395 - kiểm thử dấu phẩy; -- Unicode' as payload where (395 between 1 and 600) and 395+1>395;
select 396 as n, (396*3) as score, N'payload 00396 - kiểm thử dấu phẩy; -- Unicode' as payload where (396 between 1 and 600) and 396+1>396;
select 397 as n, (397*3) as score, N'payload 00397 - kiểm thử dấu phẩy; -- Unicode' as payload where (397 between 1 and 600) and 397+1>397;
select 398 as n, (398*3) as score, N'payload 00398 - kiểm thử dấu phẩy; -- Unicode' as payload where (398 between 1 and 600) and 398+1>398;
select 399 as n, (399*3) as score, N'payload 00399 - kiểm thử dấu phẩy; -- Unicode' as payload where (399 between 1 and 600) and 399+1>399;
select 400 as n, (400*3) as score, N'payload 00400 - kiểm thử dấu phẩy; -- Unicode' as payload where (400 between 1 and 600) and 400+1>400;
select 401 as n, (401*3) as score, N'payload 00401 - kiểm thử dấu phẩy; -- Unicode' as payload where (401 between 1 and 600) and 401+1>401;
select 402 as n, (402*3) as score, N'payload 00402 - kiểm thử dấu phẩy; -- Unicode' as payload where (402 between 1 and 600) and 402+1>402;
select 403 as n, (403*3) as score, N'payload 00403 - kiểm thử dấu phẩy; -- Unicode' as payload where (403 between 1 and 600) and 403+1>403;
select 404 as n, (404*3) as score, N'payload 00404 - kiểm thử dấu phẩy; -- Unicode' as payload where (404 between 1 and 600) and 404+1>404;
select 405 as n, (405*3) as score, N'payload 00405 - kiểm thử dấu phẩy; -- Unicode' as payload where (405 between 1 and 600) and 405+1>405;
select 406 as n, (406*3) as score, N'payload 00406 - kiểm thử dấu phẩy; -- Unicode' as payload where (406 between 1 and 600) and 406+1>406;
select 407 as n, (407*3) as score, N'payload 00407 - kiểm thử dấu phẩy; -- Unicode' as payload where (407 between 1 and 600) and 407+1>407;
select 408 as n, (408*3) as score, N'payload 00408 - kiểm thử dấu phẩy; -- Unicode' as payload where (408 between 1 and 600) and 408+1>408;
select 409 as n, (409*3) as score, N'payload 00409 - kiểm thử dấu phẩy; -- Unicode' as payload where (409 between 1 and 600) and 409+1>409;
select 410 as n, (410*3) as score, N'payload 00410 - kiểm thử dấu phẩy; -- Unicode' as payload where (410 between 1 and 600) and 410+1>410;
select 411 as n, (411*3) as score, N'payload 00411 - kiểm thử dấu phẩy; -- Unicode' as payload where (411 between 1 and 600) and 411+1>411;
select 412 as n, (412*3) as score, N'payload 00412 - kiểm thử dấu phẩy; -- Unicode' as payload where (412 between 1 and 600) and 412+1>412;
select 413 as n, (413*3) as score, N'payload 00413 - kiểm thử dấu phẩy; -- Unicode' as payload where (413 between 1 and 600) and 413+1>413;
select 414 as n, (414*3) as score, N'payload 00414 - kiểm thử dấu phẩy; -- Unicode' as payload where (414 between 1 and 600) and 414+1>414;
select 415 as n, (415*3) as score, N'payload 00415 - kiểm thử dấu phẩy; -- Unicode' as payload where (415 between 1 and 600) and 415+1>415;
select 416 as n, (416*3) as score, N'payload 00416 - kiểm thử dấu phẩy; -- Unicode' as payload where (416 between 1 and 600) and 416+1>416;
select 417 as n, (417*3) as score, N'payload 00417 - kiểm thử dấu phẩy; -- Unicode' as payload where (417 between 1 and 600) and 417+1>417;
select 418 as n, (418*3) as score, N'payload 00418 - kiểm thử dấu phẩy; -- Unicode' as payload where (418 between 1 and 600) and 418+1>418;
select 419 as n, (419*3) as score, N'payload 00419 - kiểm thử dấu phẩy; -- Unicode' as payload where (419 between 1 and 600) and 419+1>419;
select 420 as n, (420*3) as score, N'payload 00420 - kiểm thử dấu phẩy; -- Unicode' as payload where (420 between 1 and 600) and 420+1>420;
select 421 as n, (421*3) as score, N'payload 00421 - kiểm thử dấu phẩy; -- Unicode' as payload where (421 between 1 and 600) and 421+1>421;
select 422 as n, (422*3) as score, N'payload 00422 - kiểm thử dấu phẩy; -- Unicode' as payload where (422 between 1 and 600) and 422+1>422;
select 423 as n, (423*3) as score, N'payload 00423 - kiểm thử dấu phẩy; -- Unicode' as payload where (423 between 1 and 600) and 423+1>423;
select 424 as n, (424*3) as score, N'payload 00424 - kiểm thử dấu phẩy; -- Unicode' as payload where (424 between 1 and 600) and 424+1>424;
select 425 as n, (425*3) as score, N'payload 00425 - kiểm thử dấu phẩy; -- Unicode' as payload where (425 between 1 and 600) and 425+1>425;
select 426 as n, (426*3) as score, N'payload 00426 - kiểm thử dấu phẩy; -- Unicode' as payload where (426 between 1 and 600) and 426+1>426;
select 427 as n, (427*3) as score, N'payload 00427 - kiểm thử dấu phẩy; -- Unicode' as payload where (427 between 1 and 600) and 427+1>427;
select 428 as n, (428*3) as score, N'payload 00428 - kiểm thử dấu phẩy; -- Unicode' as payload where (428 between 1 and 600) and 428+1>428;
select 429 as n, (429*3) as score, N'payload 00429 - kiểm thử dấu phẩy; -- Unicode' as payload where (429 between 1 and 600) and 429+1>429;
select 430 as n, (430*3) as score, N'payload 00430 - kiểm thử dấu phẩy; -- Unicode' as payload where (430 between 1 and 600) and 430+1>430;
select 431 as n, (431*3) as score, N'payload 00431 - kiểm thử dấu phẩy; -- Unicode' as payload where (431 between 1 and 600) and 431+1>431;
select 432 as n, (432*3) as score, N'payload 00432 - kiểm thử dấu phẩy; -- Unicode' as payload where (432 between 1 and 600) and 432+1>432;
select 433 as n, (433*3) as score, N'payload 00433 - kiểm thử dấu phẩy; -- Unicode' as payload where (433 between 1 and 600) and 433+1>433;
select 434 as n, (434*3) as score, N'payload 00434 - kiểm thử dấu phẩy; -- Unicode' as payload where (434 between 1 and 600) and 434+1>434;
select 435 as n, (435*3) as score, N'payload 00435 - kiểm thử dấu phẩy; -- Unicode' as payload where (435 between 1 and 600) and 435+1>435;
select 436 as n, (436*3) as score, N'payload 00436 - kiểm thử dấu phẩy; -- Unicode' as payload where (436 between 1 and 600) and 436+1>436;
select 437 as n, (437*3) as score, N'payload 00437 - kiểm thử dấu phẩy; -- Unicode' as payload where (437 between 1 and 600) and 437+1>437;
select 438 as n, (438*3) as score, N'payload 00438 - kiểm thử dấu phẩy; -- Unicode' as payload where (438 between 1 and 600) and 438+1>438;
select 439 as n, (439*3) as score, N'payload 00439 - kiểm thử dấu phẩy; -- Unicode' as payload where (439 between 1 and 600) and 439+1>439;
select 440 as n, (440*3) as score, N'payload 00440 - kiểm thử dấu phẩy; -- Unicode' as payload where (440 between 1 and 600) and 440+1>440;
select 441 as n, (441*3) as score, N'payload 00441 - kiểm thử dấu phẩy; -- Unicode' as payload where (441 between 1 and 600) and 441+1>441;
select 442 as n, (442*3) as score, N'payload 00442 - kiểm thử dấu phẩy; -- Unicode' as payload where (442 between 1 and 600) and 442+1>442;
select 443 as n, (443*3) as score, N'payload 00443 - kiểm thử dấu phẩy; -- Unicode' as payload where (443 between 1 and 600) and 443+1>443;
select 444 as n, (444*3) as score, N'payload 00444 - kiểm thử dấu phẩy; -- Unicode' as payload where (444 between 1 and 600) and 444+1>444;
select 445 as n, (445*3) as score, N'payload 00445 - kiểm thử dấu phẩy; -- Unicode' as payload where (445 between 1 and 600) and 445+1>445;
select 446 as n, (446*3) as score, N'payload 00446 - kiểm thử dấu phẩy; -- Unicode' as payload where (446 between 1 and 600) and 446+1>446;
select 447 as n, (447*3) as score, N'payload 00447 - kiểm thử dấu phẩy; -- Unicode' as payload where (447 between 1 and 600) and 447+1>447;
select 448 as n, (448*3) as score, N'payload 00448 - kiểm thử dấu phẩy; -- Unicode' as payload where (448 between 1 and 600) and 448+1>448;
select 449 as n, (449*3) as score, N'payload 00449 - kiểm thử dấu phẩy; -- Unicode' as payload where (449 between 1 and 600) and 449+1>449;
select 450 as n, (450*3) as score, N'payload 00450 - kiểm thử dấu phẩy; -- Unicode' as payload where (450 between 1 and 600) and 450+1>450;
select 451 as n, (451*3) as score, N'payload 00451 - kiểm thử dấu phẩy; -- Unicode' as payload where (451 between 1 and 600) and 451+1>451;
select 452 as n, (452*3) as score, N'payload 00452 - kiểm thử dấu phẩy; -- Unicode' as payload where (452 between 1 and 600) and 452+1>452;
select 453 as n, (453*3) as score, N'payload 00453 - kiểm thử dấu phẩy; -- Unicode' as payload where (453 between 1 and 600) and 453+1>453;
select 454 as n, (454*3) as score, N'payload 00454 - kiểm thử dấu phẩy; -- Unicode' as payload where (454 between 1 and 600) and 454+1>454;
select 455 as n, (455*3) as score, N'payload 00455 - kiểm thử dấu phẩy; -- Unicode' as payload where (455 between 1 and 600) and 455+1>455;
select 456 as n, (456*3) as score, N'payload 00456 - kiểm thử dấu phẩy; -- Unicode' as payload where (456 between 1 and 600) and 456+1>456;
select 457 as n, (457*3) as score, N'payload 00457 - kiểm thử dấu phẩy; -- Unicode' as payload where (457 between 1 and 600) and 457+1>457;
select 458 as n, (458*3) as score, N'payload 00458 - kiểm thử dấu phẩy; -- Unicode' as payload where (458 between 1 and 600) and 458+1>458;
select 459 as n, (459*3) as score, N'payload 00459 - kiểm thử dấu phẩy; -- Unicode' as payload where (459 between 1 and 600) and 459+1>459;
select 460 as n, (460*3) as score, N'payload 00460 - kiểm thử dấu phẩy; -- Unicode' as payload where (460 between 1 and 600) and 460+1>460;
select 461 as n, (461*3) as score, N'payload 00461 - kiểm thử dấu phẩy; -- Unicode' as payload where (461 between 1 and 600) and 461+1>461;
select 462 as n, (462*3) as score, N'payload 00462 - kiểm thử dấu phẩy; -- Unicode' as payload where (462 between 1 and 600) and 462+1>462;
select 463 as n, (463*3) as score, N'payload 00463 - kiểm thử dấu phẩy; -- Unicode' as payload where (463 between 1 and 600) and 463+1>463;
select 464 as n, (464*3) as score, N'payload 00464 - kiểm thử dấu phẩy; -- Unicode' as payload where (464 between 1 and 600) and 464+1>464;
select 465 as n, (465*3) as score, N'payload 00465 - kiểm thử dấu phẩy; -- Unicode' as payload where (465 between 1 and 600) and 465+1>465;
select 466 as n, (466*3) as score, N'payload 00466 - kiểm thử dấu phẩy; -- Unicode' as payload where (466 between 1 and 600) and 466+1>466;
select 467 as n, (467*3) as score, N'payload 00467 - kiểm thử dấu phẩy; -- Unicode' as payload where (467 between 1 and 600) and 467+1>467;
select 468 as n, (468*3) as score, N'payload 00468 - kiểm thử dấu phẩy; -- Unicode' as payload where (468 between 1 and 600) and 468+1>468;
select 469 as n, (469*3) as score, N'payload 00469 - kiểm thử dấu phẩy; -- Unicode' as payload where (469 between 1 and 600) and 469+1>469;
select 470 as n, (470*3) as score, N'payload 00470 - kiểm thử dấu phẩy; -- Unicode' as payload where (470 between 1 and 600) and 470+1>470;
select 471 as n, (471*3) as score, N'payload 00471 - kiểm thử dấu phẩy; -- Unicode' as payload where (471 between 1 and 600) and 471+1>471;
select 472 as n, (472*3) as score, N'payload 00472 - kiểm thử dấu phẩy; -- Unicode' as payload where (472 between 1 and 600) and 472+1>472;
select 473 as n, (473*3) as score, N'payload 00473 - kiểm thử dấu phẩy; -- Unicode' as payload where (473 between 1 and 600) and 473+1>473;
select 474 as n, (474*3) as score, N'payload 00474 - kiểm thử dấu phẩy; -- Unicode' as payload where (474 between 1 and 600) and 474+1>474;
select 475 as n, (475*3) as score, N'payload 00475 - kiểm thử dấu phẩy; -- Unicode' as payload where (475 between 1 and 600) and 475+1>475;
select 476 as n, (476*3) as score, N'payload 00476 - kiểm thử dấu phẩy; -- Unicode' as payload where (476 between 1 and 600) and 476+1>476;
select 477 as n, (477*3) as score, N'payload 00477 - kiểm thử dấu phẩy; -- Unicode' as payload where (477 between 1 and 600) and 477+1>477;
select 478 as n, (478*3) as score, N'payload 00478 - kiểm thử dấu phẩy; -- Unicode' as payload where (478 between 1 and 600) and 478+1>478;
select 479 as n, (479*3) as score, N'payload 00479 - kiểm thử dấu phẩy; -- Unicode' as payload where (479 between 1 and 600) and 479+1>479;
select 480 as n, (480*3) as score, N'payload 00480 - kiểm thử dấu phẩy; -- Unicode' as payload where (480 between 1 and 600) and 480+1>480;
select 481 as n, (481*3) as score, N'payload 00481 - kiểm thử dấu phẩy; -- Unicode' as payload where (481 between 1 and 600) and 481+1>481;
select 482 as n, (482*3) as score, N'payload 00482 - kiểm thử dấu phẩy; -- Unicode' as payload where (482 between 1 and 600) and 482+1>482;
select 483 as n, (483*3) as score, N'payload 00483 - kiểm thử dấu phẩy; -- Unicode' as payload where (483 between 1 and 600) and 483+1>483;
select 484 as n, (484*3) as score, N'payload 00484 - kiểm thử dấu phẩy; -- Unicode' as payload where (484 between 1 and 600) and 484+1>484;
select 485 as n, (485*3) as score, N'payload 00485 - kiểm thử dấu phẩy; -- Unicode' as payload where (485 between 1 and 600) and 485+1>485;
select 486 as n, (486*3) as score, N'payload 00486 - kiểm thử dấu phẩy; -- Unicode' as payload where (486 between 1 and 600) and 486+1>486;
select 487 as n, (487*3) as score, N'payload 00487 - kiểm thử dấu phẩy; -- Unicode' as payload where (487 between 1 and 600) and 487+1>487;
select 488 as n, (488*3) as score, N'payload 00488 - kiểm thử dấu phẩy; -- Unicode' as payload where (488 between 1 and 600) and 488+1>488;
select 489 as n, (489*3) as score, N'payload 00489 - kiểm thử dấu phẩy; -- Unicode' as payload where (489 between 1 and 600) and 489+1>489;
select 490 as n, (490*3) as score, N'payload 00490 - kiểm thử dấu phẩy; -- Unicode' as payload where (490 between 1 and 600) and 490+1>490;
select 491 as n, (491*3) as score, N'payload 00491 - kiểm thử dấu phẩy; -- Unicode' as payload where (491 between 1 and 600) and 491+1>491;
select 492 as n, (492*3) as score, N'payload 00492 - kiểm thử dấu phẩy; -- Unicode' as payload where (492 between 1 and 600) and 492+1>492;
select 493 as n, (493*3) as score, N'payload 00493 - kiểm thử dấu phẩy; -- Unicode' as payload where (493 between 1 and 600) and 493+1>493;
select 494 as n, (494*3) as score, N'payload 00494 - kiểm thử dấu phẩy; -- Unicode' as payload where (494 between 1 and 600) and 494+1>494;
select 495 as n, (495*3) as score, N'payload 00495 - kiểm thử dấu phẩy; -- Unicode' as payload where (495 between 1 and 600) and 495+1>495;
select 496 as n, (496*3) as score, N'payload 00496 - kiểm thử dấu phẩy; -- Unicode' as payload where (496 between 1 and 600) and 496+1>496;
select 497 as n, (497*3) as score, N'payload 00497 - kiểm thử dấu phẩy; -- Unicode' as payload where (497 between 1 and 600) and 497+1>497;
select 498 as n, (498*3) as score, N'payload 00498 - kiểm thử dấu phẩy; -- Unicode' as payload where (498 between 1 and 600) and 498+1>498;
select 499 as n, (499*3) as score, N'payload 00499 - kiểm thử dấu phẩy; -- Unicode' as payload where (499 between 1 and 600) and 499+1>499;
select 500 as n, (500*3) as score, N'payload 00500 - kiểm thử dấu phẩy; -- Unicode' as payload where (500 between 1 and 600) and 500+1>500;
select 501 as n, (501*3) as score, N'payload 00501 - kiểm thử dấu phẩy; -- Unicode' as payload where (501 between 1 and 600) and 501+1>501;
select 502 as n, (502*3) as score, N'payload 00502 - kiểm thử dấu phẩy; -- Unicode' as payload where (502 between 1 and 600) and 502+1>502;
select 503 as n, (503*3) as score, N'payload 00503 - kiểm thử dấu phẩy; -- Unicode' as payload where (503 between 1 and 600) and 503+1>503;
select 504 as n, (504*3) as score, N'payload 00504 - kiểm thử dấu phẩy; -- Unicode' as payload where (504 between 1 and 600) and 504+1>504;
select 505 as n, (505*3) as score, N'payload 00505 - kiểm thử dấu phẩy; -- Unicode' as payload where (505 between 1 and 600) and 505+1>505;
select 506 as n, (506*3) as score, N'payload 00506 - kiểm thử dấu phẩy; -- Unicode' as payload where (506 between 1 and 600) and 506+1>506;
select 507 as n, (507*3) as score, N'payload 00507 - kiểm thử dấu phẩy; -- Unicode' as payload where (507 between 1 and 600) and 507+1>507;
select 508 as n, (508*3) as score, N'payload 00508 - kiểm thử dấu phẩy; -- Unicode' as payload where (508 between 1 and 600) and 508+1>508;
select 509 as n, (509*3) as score, N'payload 00509 - kiểm thử dấu phẩy; -- Unicode' as payload where (509 between 1 and 600) and 509+1>509;
select 510 as n, (510*3) as score, N'payload 00510 - kiểm thử dấu phẩy; -- Unicode' as payload where (510 between 1 and 600) and 510+1>510;
select 511 as n, (511*3) as score, N'payload 00511 - kiểm thử dấu phẩy; -- Unicode' as payload where (511 between 1 and 600) and 511+1>511;
select 512 as n, (512*3) as score, N'payload 00512 - kiểm thử dấu phẩy; -- Unicode' as payload where (512 between 1 and 600) and 512+1>512;
select 513 as n, (513*3) as score, N'payload 00513 - kiểm thử dấu phẩy; -- Unicode' as payload where (513 between 1 and 600) and 513+1>513;
select 514 as n, (514*3) as score, N'payload 00514 - kiểm thử dấu phẩy; -- Unicode' as payload where (514 between 1 and 600) and 514+1>514;
select 515 as n, (515*3) as score, N'payload 00515 - kiểm thử dấu phẩy; -- Unicode' as payload where (515 between 1 and 600) and 515+1>515;
select 516 as n, (516*3) as score, N'payload 00516 - kiểm thử dấu phẩy; -- Unicode' as payload where (516 between 1 and 600) and 516+1>516;
select 517 as n, (517*3) as score, N'payload 00517 - kiểm thử dấu phẩy; -- Unicode' as payload where (517 between 1 and 600) and 517+1>517;
select 518 as n, (518*3) as score, N'payload 00518 - kiểm thử dấu phẩy; -- Unicode' as payload where (518 between 1 and 600) and 518+1>518;
select 519 as n, (519*3) as score, N'payload 00519 - kiểm thử dấu phẩy; -- Unicode' as payload where (519 between 1 and 600) and 519+1>519;
select 520 as n, (520*3) as score, N'payload 00520 - kiểm thử dấu phẩy; -- Unicode' as payload where (520 between 1 and 600) and 520+1>520;
select 521 as n, (521*3) as score, N'payload 00521 - kiểm thử dấu phẩy; -- Unicode' as payload where (521 between 1 and 600) and 521+1>521;
select 522 as n, (522*3) as score, N'payload 00522 - kiểm thử dấu phẩy; -- Unicode' as payload where (522 between 1 and 600) and 522+1>522;
select 523 as n, (523*3) as score, N'payload 00523 - kiểm thử dấu phẩy; -- Unicode' as payload where (523 between 1 and 600) and 523+1>523;
select 524 as n, (524*3) as score, N'payload 00524 - kiểm thử dấu phẩy; -- Unicode' as payload where (524 between 1 and 600) and 524+1>524;
select 525 as n, (525*3) as score, N'payload 00525 - kiểm thử dấu phẩy; -- Unicode' as payload where (525 between 1 and 600) and 525+1>525;
select 526 as n, (526*3) as score, N'payload 00526 - kiểm thử dấu phẩy; -- Unicode' as payload where (526 between 1 and 600) and 526+1>526;
select 527 as n, (527*3) as score, N'payload 00527 - kiểm thử dấu phẩy; -- Unicode' as payload where (527 between 1 and 600) and 527+1>527;
select 528 as n, (528*3) as score, N'payload 00528 - kiểm thử dấu phẩy; -- Unicode' as payload where (528 between 1 and 600) and 528+1>528;
select 529 as n, (529*3) as score, N'payload 00529 - kiểm thử dấu phẩy; -- Unicode' as payload where (529 between 1 and 600) and 529+1>529;
select 530 as n, (530*3) as score, N'payload 00530 - kiểm thử dấu phẩy; -- Unicode' as payload where (530 between 1 and 600) and 530+1>530;
select 531 as n, (531*3) as score, N'payload 00531 - kiểm thử dấu phẩy; -- Unicode' as payload where (531 between 1 and 600) and 531+1>531;
select 532 as n, (532*3) as score, N'payload 00532 - kiểm thử dấu phẩy; -- Unicode' as payload where (532 between 1 and 600) and 532+1>532;
select 533 as n, (533*3) as score, N'payload 00533 - kiểm thử dấu phẩy; -- Unicode' as payload where (533 between 1 and 600) and 533+1>533;
select 534 as n, (534*3) as score, N'payload 00534 - kiểm thử dấu phẩy; -- Unicode' as payload where (534 between 1 and 600) and 534+1>534;
select 535 as n, (535*3) as score, N'payload 00535 - kiểm thử dấu phẩy; -- Unicode' as payload where (535 between 1 and 600) and 535+1>535;
select 536 as n, (536*3) as score, N'payload 00536 - kiểm thử dấu phẩy; -- Unicode' as payload where (536 between 1 and 600) and 536+1>536;
select 537 as n, (537*3) as score, N'payload 00537 - kiểm thử dấu phẩy; -- Unicode' as payload where (537 between 1 and 600) and 537+1>537;
select 538 as n, (538*3) as score, N'payload 00538 - kiểm thử dấu phẩy; -- Unicode' as payload where (538 between 1 and 600) and 538+1>538;
select 539 as n, (539*3) as score, N'payload 00539 - kiểm thử dấu phẩy; -- Unicode' as payload where (539 between 1 and 600) and 539+1>539;
select 540 as n, (540*3) as score, N'payload 00540 - kiểm thử dấu phẩy; -- Unicode' as payload where (540 between 1 and 600) and 540+1>540;
select 541 as n, (541*3) as score, N'payload 00541 - kiểm thử dấu phẩy; -- Unicode' as payload where (541 between 1 and 600) and 541+1>541;
select 542 as n, (542*3) as score, N'payload 00542 - kiểm thử dấu phẩy; -- Unicode' as payload where (542 between 1 and 600) and 542+1>542;
select 543 as n, (543*3) as score, N'payload 00543 - kiểm thử dấu phẩy; -- Unicode' as payload where (543 between 1 and 600) and 543+1>543;
select 544 as n, (544*3) as score, N'payload 00544 - kiểm thử dấu phẩy; -- Unicode' as payload where (544 between 1 and 600) and 544+1>544;
select 545 as n, (545*3) as score, N'payload 00545 - kiểm thử dấu phẩy; -- Unicode' as payload where (545 between 1 and 600) and 545+1>545;
select 546 as n, (546*3) as score, N'payload 00546 - kiểm thử dấu phẩy; -- Unicode' as payload where (546 between 1 and 600) and 546+1>546;
select 547 as n, (547*3) as score, N'payload 00547 - kiểm thử dấu phẩy; -- Unicode' as payload where (547 between 1 and 600) and 547+1>547;
select 548 as n, (548*3) as score, N'payload 00548 - kiểm thử dấu phẩy; -- Unicode' as payload where (548 between 1 and 600) and 548+1>548;
select 549 as n, (549*3) as score, N'payload 00549 - kiểm thử dấu phẩy; -- Unicode' as payload where (549 between 1 and 600) and 549+1>549;
select 550 as n, (550*3) as score, N'payload 00550 - kiểm thử dấu phẩy; -- Unicode' as payload where (550 between 1 and 600) and 550+1>550;
select 551 as n, (551*3) as score, N'payload 00551 - kiểm thử dấu phẩy; -- Unicode' as payload where (551 between 1 and 600) and 551+1>551;
select 552 as n, (552*3) as score, N'payload 00552 - kiểm thử dấu phẩy; -- Unicode' as payload where (552 between 1 and 600) and 552+1>552;
select 553 as n, (553*3) as score, N'payload 00553 - kiểm thử dấu phẩy; -- Unicode' as payload where (553 between 1 and 600) and 553+1>553;
select 554 as n, (554*3) as score, N'payload 00554 - kiểm thử dấu phẩy; -- Unicode' as payload where (554 between 1 and 600) and 554+1>554;
select 555 as n, (555*3) as score, N'payload 00555 - kiểm thử dấu phẩy; -- Unicode' as payload where (555 between 1 and 600) and 555+1>555;
select 556 as n, (556*3) as score, N'payload 00556 - kiểm thử dấu phẩy; -- Unicode' as payload where (556 between 1 and 600) and 556+1>556;
select 557 as n, (557*3) as score, N'payload 00557 - kiểm thử dấu phẩy; -- Unicode' as payload where (557 between 1 and 600) and 557+1>557;
select 558 as n, (558*3) as score, N'payload 00558 - kiểm thử dấu phẩy; -- Unicode' as payload where (558 between 1 and 600) and 558+1>558;
select 559 as n, (559*3) as score, N'payload 00559 - kiểm thử dấu phẩy; -- Unicode' as payload where (559 between 1 and 600) and 559+1>559;
select 560 as n, (560*3) as score, N'payload 00560 - kiểm thử dấu phẩy; -- Unicode' as payload where (560 between 1 and 600) and 560+1>560;
select 561 as n, (561*3) as score, N'payload 00561 - kiểm thử dấu phẩy; -- Unicode' as payload where (561 between 1 and 600) and 561+1>561;
select 562 as n, (562*3) as score, N'payload 00562 - kiểm thử dấu phẩy; -- Unicode' as payload where (562 between 1 and 600) and 562+1>562;
select 563 as n, (563*3) as score, N'payload 00563 - kiểm thử dấu phẩy; -- Unicode' as payload where (563 between 1 and 600) and 563+1>563;
select 564 as n, (564*3) as score, N'payload 00564 - kiểm thử dấu phẩy; -- Unicode' as payload where (564 between 1 and 600) and 564+1>564;
select 565 as n, (565*3) as score, N'payload 00565 - kiểm thử dấu phẩy; -- Unicode' as payload where (565 between 1 and 600) and 565+1>565;
select 566 as n, (566*3) as score, N'payload 00566 - kiểm thử dấu phẩy; -- Unicode' as payload where (566 between 1 and 600) and 566+1>566;
select 567 as n, (567*3) as score, N'payload 00567 - kiểm thử dấu phẩy; -- Unicode' as payload where (567 between 1 and 600) and 567+1>567;
select 568 as n, (568*3) as score, N'payload 00568 - kiểm thử dấu phẩy; -- Unicode' as payload where (568 between 1 and 600) and 568+1>568;
select 569 as n, (569*3) as score, N'payload 00569 - kiểm thử dấu phẩy; -- Unicode' as payload where (569 between 1 and 600) and 569+1>569;
select 570 as n, (570*3) as score, N'payload 00570 - kiểm thử dấu phẩy; -- Unicode' as payload where (570 between 1 and 600) and 570+1>570;
select 571 as n, (571*3) as score, N'payload 00571 - kiểm thử dấu phẩy; -- Unicode' as payload where (571 between 1 and 600) and 571+1>571;
select 572 as n, (572*3) as score, N'payload 00572 - kiểm thử dấu phẩy; -- Unicode' as payload where (572 between 1 and 600) and 572+1>572;
select 573 as n, (573*3) as score, N'payload 00573 - kiểm thử dấu phẩy; -- Unicode' as payload where (573 between 1 and 600) and 573+1>573;
select 574 as n, (574*3) as score, N'payload 00574 - kiểm thử dấu phẩy; -- Unicode' as payload where (574 between 1 and 600) and 574+1>574;
select 575 as n, (575*3) as score, N'payload 00575 - kiểm thử dấu phẩy; -- Unicode' as payload where (575 between 1 and 600) and 575+1>575;
select 576 as n, (576*3) as score, N'payload 00576 - kiểm thử dấu phẩy; -- Unicode' as payload where (576 between 1 and 600) and 576+1>576;
select 577 as n, (577*3) as score, N'payload 00577 - kiểm thử dấu phẩy; -- Unicode' as payload where (577 between 1 and 600) and 577+1>577;
select 578 as n, (578*3) as score, N'payload 00578 - kiểm thử dấu phẩy; -- Unicode' as payload where (578 between 1 and 600) and 578+1>578;
select 579 as n, (579*3) as score, N'payload 00579 - kiểm thử dấu phẩy; -- Unicode' as payload where (579 between 1 and 600) and 579+1>579;
select 580 as n, (580*3) as score, N'payload 00580 - kiểm thử dấu phẩy; -- Unicode' as payload where (580 between 1 and 600) and 580+1>580;
select 581 as n, (581*3) as score, N'payload 00581 - kiểm thử dấu phẩy; -- Unicode' as payload where (581 between 1 and 600) and 581+1>581;
select 582 as n, (582*3) as score, N'payload 00582 - kiểm thử dấu phẩy; -- Unicode' as payload where (582 between 1 and 600) and 582+1>582;
select 583 as n, (583*3) as score, N'payload 00583 - kiểm thử dấu phẩy; -- Unicode' as payload where (583 between 1 and 600) and 583+1>583;
select 584 as n, (584*3) as score, N'payload 00584 - kiểm thử dấu phẩy; -- Unicode' as payload where (584 between 1 and 600) and 584+1>584;
select 585 as n, (585*3) as score, N'payload 00585 - kiểm thử dấu phẩy; -- Unicode' as payload where (585 between 1 and 600) and 585+1>585;
select 586 as n, (586*3) as score, N'payload 00586 - kiểm thử dấu phẩy; -- Unicode' as payload where (586 between 1 and 600) and 586+1>586;
select 587 as n, (587*3) as score, N'payload 00587 - kiểm thử dấu phẩy; -- Unicode' as payload where (587 between 1 and 600) and 587+1>587;
select 588 as n, (588*3) as score, N'payload 00588 - kiểm thử dấu phẩy; -- Unicode' as payload where (588 between 1 and 600) and 588+1>588;
select 589 as n, (589*3) as score, N'payload 00589 - kiểm thử dấu phẩy; -- Unicode' as payload where (589 between 1 and 600) and 589+1>589;
select 590 as n, (590*3) as score, N'payload 00590 - kiểm thử dấu phẩy; -- Unicode' as payload where (590 between 1 and 600) and 590+1>590;
select 591 as n, (591*3) as score, N'payload 00591 - kiểm thử dấu phẩy; -- Unicode' as payload where (591 between 1 and 600) and 591+1>591;
select 592 as n, (592*3) as score, N'payload 00592 - kiểm thử dấu phẩy; -- Unicode' as payload where (592 between 1 and 600) and 592+1>592;
select 593 as n, (593*3) as score, N'payload 00593 - kiểm thử dấu phẩy; -- Unicode' as payload where (593 between 1 and 600) and 593+1>593;
select 594 as n, (594*3) as score, N'payload 00594 - kiểm thử dấu phẩy; -- Unicode' as payload where (594 between 1 and 600) and 594+1>594;
select 595 as n, (595*3) as score, N'payload 00595 - kiểm thử dấu phẩy; -- Unicode' as payload where (595 between 1 and 600) and 595+1>595;
select 596 as n, (596*3) as score, N'payload 00596 - kiểm thử dấu phẩy; -- Unicode' as payload where (596 between 1 and 600) and 596+1>596;
select 597 as n, (597*3) as score, N'payload 00597 - kiểm thử dấu phẩy; -- Unicode' as payload where (597 between 1 and 600) and 597+1>597;
select 598 as n, (598*3) as score, N'payload 00598 - kiểm thử dấu phẩy; -- Unicode' as payload where (598 between 1 and 600) and 598+1>598;
select 599 as n, (599*3) as score, N'payload 00599 - kiểm thử dấu phẩy; -- Unicode' as payload where (599 between 1 and 600) and 599+1>599;
select 600 as n, (600*3) as score, N'payload 00600 - kiểm thử dấu phẩy; -- Unicode' as payload where (600 between 1 and 600) and 600+1>600;

-- zea-case: stress/script-1500-statements
select 1 as n, (1*3) as score, N'payload 00001 - kiểm thử dấu phẩy; -- Unicode' as payload where (1 between 1 and 1500) and 1+1>1;
select 2 as n, (2*3) as score, N'payload 00002 - kiểm thử dấu phẩy; -- Unicode' as payload where (2 between 1 and 1500) and 2+1>2;
select 3 as n, (3*3) as score, N'payload 00003 - kiểm thử dấu phẩy; -- Unicode' as payload where (3 between 1 and 1500) and 3+1>3;
select 4 as n, (4*3) as score, N'payload 00004 - kiểm thử dấu phẩy; -- Unicode' as payload where (4 between 1 and 1500) and 4+1>4;
select 5 as n, (5*3) as score, N'payload 00005 - kiểm thử dấu phẩy; -- Unicode' as payload where (5 between 1 and 1500) and 5+1>5;
select 6 as n, (6*3) as score, N'payload 00006 - kiểm thử dấu phẩy; -- Unicode' as payload where (6 between 1 and 1500) and 6+1>6;
select 7 as n, (7*3) as score, N'payload 00007 - kiểm thử dấu phẩy; -- Unicode' as payload where (7 between 1 and 1500) and 7+1>7;
select 8 as n, (8*3) as score, N'payload 00008 - kiểm thử dấu phẩy; -- Unicode' as payload where (8 between 1 and 1500) and 8+1>8;
select 9 as n, (9*3) as score, N'payload 00009 - kiểm thử dấu phẩy; -- Unicode' as payload where (9 between 1 and 1500) and 9+1>9;
select 10 as n, (10*3) as score, N'payload 00010 - kiểm thử dấu phẩy; -- Unicode' as payload where (10 between 1 and 1500) and 10+1>10;
select 11 as n, (11*3) as score, N'payload 00011 - kiểm thử dấu phẩy; -- Unicode' as payload where (11 between 1 and 1500) and 11+1>11;
select 12 as n, (12*3) as score, N'payload 00012 - kiểm thử dấu phẩy; -- Unicode' as payload where (12 between 1 and 1500) and 12+1>12;
select 13 as n, (13*3) as score, N'payload 00013 - kiểm thử dấu phẩy; -- Unicode' as payload where (13 between 1 and 1500) and 13+1>13;
select 14 as n, (14*3) as score, N'payload 00014 - kiểm thử dấu phẩy; -- Unicode' as payload where (14 between 1 and 1500) and 14+1>14;
select 15 as n, (15*3) as score, N'payload 00015 - kiểm thử dấu phẩy; -- Unicode' as payload where (15 between 1 and 1500) and 15+1>15;
select 16 as n, (16*3) as score, N'payload 00016 - kiểm thử dấu phẩy; -- Unicode' as payload where (16 between 1 and 1500) and 16+1>16;
select 17 as n, (17*3) as score, N'payload 00017 - kiểm thử dấu phẩy; -- Unicode' as payload where (17 between 1 and 1500) and 17+1>17;
select 18 as n, (18*3) as score, N'payload 00018 - kiểm thử dấu phẩy; -- Unicode' as payload where (18 between 1 and 1500) and 18+1>18;
select 19 as n, (19*3) as score, N'payload 00019 - kiểm thử dấu phẩy; -- Unicode' as payload where (19 between 1 and 1500) and 19+1>19;
select 20 as n, (20*3) as score, N'payload 00020 - kiểm thử dấu phẩy; -- Unicode' as payload where (20 between 1 and 1500) and 20+1>20;
select 21 as n, (21*3) as score, N'payload 00021 - kiểm thử dấu phẩy; -- Unicode' as payload where (21 between 1 and 1500) and 21+1>21;
select 22 as n, (22*3) as score, N'payload 00022 - kiểm thử dấu phẩy; -- Unicode' as payload where (22 between 1 and 1500) and 22+1>22;
select 23 as n, (23*3) as score, N'payload 00023 - kiểm thử dấu phẩy; -- Unicode' as payload where (23 between 1 and 1500) and 23+1>23;
select 24 as n, (24*3) as score, N'payload 00024 - kiểm thử dấu phẩy; -- Unicode' as payload where (24 between 1 and 1500) and 24+1>24;
select 25 as n, (25*3) as score, N'payload 00025 - kiểm thử dấu phẩy; -- Unicode' as payload where (25 between 1 and 1500) and 25+1>25;
select 26 as n, (26*3) as score, N'payload 00026 - kiểm thử dấu phẩy; -- Unicode' as payload where (26 between 1 and 1500) and 26+1>26;
select 27 as n, (27*3) as score, N'payload 00027 - kiểm thử dấu phẩy; -- Unicode' as payload where (27 between 1 and 1500) and 27+1>27;
select 28 as n, (28*3) as score, N'payload 00028 - kiểm thử dấu phẩy; -- Unicode' as payload where (28 between 1 and 1500) and 28+1>28;
select 29 as n, (29*3) as score, N'payload 00029 - kiểm thử dấu phẩy; -- Unicode' as payload where (29 between 1 and 1500) and 29+1>29;
select 30 as n, (30*3) as score, N'payload 00030 - kiểm thử dấu phẩy; -- Unicode' as payload where (30 between 1 and 1500) and 30+1>30;
select 31 as n, (31*3) as score, N'payload 00031 - kiểm thử dấu phẩy; -- Unicode' as payload where (31 between 1 and 1500) and 31+1>31;
select 32 as n, (32*3) as score, N'payload 00032 - kiểm thử dấu phẩy; -- Unicode' as payload where (32 between 1 and 1500) and 32+1>32;
select 33 as n, (33*3) as score, N'payload 00033 - kiểm thử dấu phẩy; -- Unicode' as payload where (33 between 1 and 1500) and 33+1>33;
select 34 as n, (34*3) as score, N'payload 00034 - kiểm thử dấu phẩy; -- Unicode' as payload where (34 between 1 and 1500) and 34+1>34;
select 35 as n, (35*3) as score, N'payload 00035 - kiểm thử dấu phẩy; -- Unicode' as payload where (35 between 1 and 1500) and 35+1>35;
select 36 as n, (36*3) as score, N'payload 00036 - kiểm thử dấu phẩy; -- Unicode' as payload where (36 between 1 and 1500) and 36+1>36;
select 37 as n, (37*3) as score, N'payload 00037 - kiểm thử dấu phẩy; -- Unicode' as payload where (37 between 1 and 1500) and 37+1>37;
select 38 as n, (38*3) as score, N'payload 00038 - kiểm thử dấu phẩy; -- Unicode' as payload where (38 between 1 and 1500) and 38+1>38;
select 39 as n, (39*3) as score, N'payload 00039 - kiểm thử dấu phẩy; -- Unicode' as payload where (39 between 1 and 1500) and 39+1>39;
select 40 as n, (40*3) as score, N'payload 00040 - kiểm thử dấu phẩy; -- Unicode' as payload where (40 between 1 and 1500) and 40+1>40;
select 41 as n, (41*3) as score, N'payload 00041 - kiểm thử dấu phẩy; -- Unicode' as payload where (41 between 1 and 1500) and 41+1>41;
select 42 as n, (42*3) as score, N'payload 00042 - kiểm thử dấu phẩy; -- Unicode' as payload where (42 between 1 and 1500) and 42+1>42;
select 43 as n, (43*3) as score, N'payload 00043 - kiểm thử dấu phẩy; -- Unicode' as payload where (43 between 1 and 1500) and 43+1>43;
select 44 as n, (44*3) as score, N'payload 00044 - kiểm thử dấu phẩy; -- Unicode' as payload where (44 between 1 and 1500) and 44+1>44;
select 45 as n, (45*3) as score, N'payload 00045 - kiểm thử dấu phẩy; -- Unicode' as payload where (45 between 1 and 1500) and 45+1>45;
select 46 as n, (46*3) as score, N'payload 00046 - kiểm thử dấu phẩy; -- Unicode' as payload where (46 between 1 and 1500) and 46+1>46;
select 47 as n, (47*3) as score, N'payload 00047 - kiểm thử dấu phẩy; -- Unicode' as payload where (47 between 1 and 1500) and 47+1>47;
select 48 as n, (48*3) as score, N'payload 00048 - kiểm thử dấu phẩy; -- Unicode' as payload where (48 between 1 and 1500) and 48+1>48;
select 49 as n, (49*3) as score, N'payload 00049 - kiểm thử dấu phẩy; -- Unicode' as payload where (49 between 1 and 1500) and 49+1>49;
select 50 as n, (50*3) as score, N'payload 00050 - kiểm thử dấu phẩy; -- Unicode' as payload where (50 between 1 and 1500) and 50+1>50;
select 51 as n, (51*3) as score, N'payload 00051 - kiểm thử dấu phẩy; -- Unicode' as payload where (51 between 1 and 1500) and 51+1>51;
select 52 as n, (52*3) as score, N'payload 00052 - kiểm thử dấu phẩy; -- Unicode' as payload where (52 between 1 and 1500) and 52+1>52;
select 53 as n, (53*3) as score, N'payload 00053 - kiểm thử dấu phẩy; -- Unicode' as payload where (53 between 1 and 1500) and 53+1>53;
select 54 as n, (54*3) as score, N'payload 00054 - kiểm thử dấu phẩy; -- Unicode' as payload where (54 between 1 and 1500) and 54+1>54;
select 55 as n, (55*3) as score, N'payload 00055 - kiểm thử dấu phẩy; -- Unicode' as payload where (55 between 1 and 1500) and 55+1>55;
select 56 as n, (56*3) as score, N'payload 00056 - kiểm thử dấu phẩy; -- Unicode' as payload where (56 between 1 and 1500) and 56+1>56;
select 57 as n, (57*3) as score, N'payload 00057 - kiểm thử dấu phẩy; -- Unicode' as payload where (57 between 1 and 1500) and 57+1>57;
select 58 as n, (58*3) as score, N'payload 00058 - kiểm thử dấu phẩy; -- Unicode' as payload where (58 between 1 and 1500) and 58+1>58;
select 59 as n, (59*3) as score, N'payload 00059 - kiểm thử dấu phẩy; -- Unicode' as payload where (59 between 1 and 1500) and 59+1>59;
select 60 as n, (60*3) as score, N'payload 00060 - kiểm thử dấu phẩy; -- Unicode' as payload where (60 between 1 and 1500) and 60+1>60;
select 61 as n, (61*3) as score, N'payload 00061 - kiểm thử dấu phẩy; -- Unicode' as payload where (61 between 1 and 1500) and 61+1>61;
select 62 as n, (62*3) as score, N'payload 00062 - kiểm thử dấu phẩy; -- Unicode' as payload where (62 between 1 and 1500) and 62+1>62;
select 63 as n, (63*3) as score, N'payload 00063 - kiểm thử dấu phẩy; -- Unicode' as payload where (63 between 1 and 1500) and 63+1>63;
select 64 as n, (64*3) as score, N'payload 00064 - kiểm thử dấu phẩy; -- Unicode' as payload where (64 between 1 and 1500) and 64+1>64;
select 65 as n, (65*3) as score, N'payload 00065 - kiểm thử dấu phẩy; -- Unicode' as payload where (65 between 1 and 1500) and 65+1>65;
select 66 as n, (66*3) as score, N'payload 00066 - kiểm thử dấu phẩy; -- Unicode' as payload where (66 between 1 and 1500) and 66+1>66;
select 67 as n, (67*3) as score, N'payload 00067 - kiểm thử dấu phẩy; -- Unicode' as payload where (67 between 1 and 1500) and 67+1>67;
select 68 as n, (68*3) as score, N'payload 00068 - kiểm thử dấu phẩy; -- Unicode' as payload where (68 between 1 and 1500) and 68+1>68;
select 69 as n, (69*3) as score, N'payload 00069 - kiểm thử dấu phẩy; -- Unicode' as payload where (69 between 1 and 1500) and 69+1>69;
select 70 as n, (70*3) as score, N'payload 00070 - kiểm thử dấu phẩy; -- Unicode' as payload where (70 between 1 and 1500) and 70+1>70;
select 71 as n, (71*3) as score, N'payload 00071 - kiểm thử dấu phẩy; -- Unicode' as payload where (71 between 1 and 1500) and 71+1>71;
select 72 as n, (72*3) as score, N'payload 00072 - kiểm thử dấu phẩy; -- Unicode' as payload where (72 between 1 and 1500) and 72+1>72;
select 73 as n, (73*3) as score, N'payload 00073 - kiểm thử dấu phẩy; -- Unicode' as payload where (73 between 1 and 1500) and 73+1>73;
select 74 as n, (74*3) as score, N'payload 00074 - kiểm thử dấu phẩy; -- Unicode' as payload where (74 between 1 and 1500) and 74+1>74;
select 75 as n, (75*3) as score, N'payload 00075 - kiểm thử dấu phẩy; -- Unicode' as payload where (75 between 1 and 1500) and 75+1>75;
select 76 as n, (76*3) as score, N'payload 00076 - kiểm thử dấu phẩy; -- Unicode' as payload where (76 between 1 and 1500) and 76+1>76;
select 77 as n, (77*3) as score, N'payload 00077 - kiểm thử dấu phẩy; -- Unicode' as payload where (77 between 1 and 1500) and 77+1>77;
select 78 as n, (78*3) as score, N'payload 00078 - kiểm thử dấu phẩy; -- Unicode' as payload where (78 between 1 and 1500) and 78+1>78;
select 79 as n, (79*3) as score, N'payload 00079 - kiểm thử dấu phẩy; -- Unicode' as payload where (79 between 1 and 1500) and 79+1>79;
select 80 as n, (80*3) as score, N'payload 00080 - kiểm thử dấu phẩy; -- Unicode' as payload where (80 between 1 and 1500) and 80+1>80;
select 81 as n, (81*3) as score, N'payload 00081 - kiểm thử dấu phẩy; -- Unicode' as payload where (81 between 1 and 1500) and 81+1>81;
select 82 as n, (82*3) as score, N'payload 00082 - kiểm thử dấu phẩy; -- Unicode' as payload where (82 between 1 and 1500) and 82+1>82;
select 83 as n, (83*3) as score, N'payload 00083 - kiểm thử dấu phẩy; -- Unicode' as payload where (83 between 1 and 1500) and 83+1>83;
select 84 as n, (84*3) as score, N'payload 00084 - kiểm thử dấu phẩy; -- Unicode' as payload where (84 between 1 and 1500) and 84+1>84;
select 85 as n, (85*3) as score, N'payload 00085 - kiểm thử dấu phẩy; -- Unicode' as payload where (85 between 1 and 1500) and 85+1>85;
select 86 as n, (86*3) as score, N'payload 00086 - kiểm thử dấu phẩy; -- Unicode' as payload where (86 between 1 and 1500) and 86+1>86;
select 87 as n, (87*3) as score, N'payload 00087 - kiểm thử dấu phẩy; -- Unicode' as payload where (87 between 1 and 1500) and 87+1>87;
select 88 as n, (88*3) as score, N'payload 00088 - kiểm thử dấu phẩy; -- Unicode' as payload where (88 between 1 and 1500) and 88+1>88;
select 89 as n, (89*3) as score, N'payload 00089 - kiểm thử dấu phẩy; -- Unicode' as payload where (89 between 1 and 1500) and 89+1>89;
select 90 as n, (90*3) as score, N'payload 00090 - kiểm thử dấu phẩy; -- Unicode' as payload where (90 between 1 and 1500) and 90+1>90;
select 91 as n, (91*3) as score, N'payload 00091 - kiểm thử dấu phẩy; -- Unicode' as payload where (91 between 1 and 1500) and 91+1>91;
select 92 as n, (92*3) as score, N'payload 00092 - kiểm thử dấu phẩy; -- Unicode' as payload where (92 between 1 and 1500) and 92+1>92;
select 93 as n, (93*3) as score, N'payload 00093 - kiểm thử dấu phẩy; -- Unicode' as payload where (93 between 1 and 1500) and 93+1>93;
select 94 as n, (94*3) as score, N'payload 00094 - kiểm thử dấu phẩy; -- Unicode' as payload where (94 between 1 and 1500) and 94+1>94;
select 95 as n, (95*3) as score, N'payload 00095 - kiểm thử dấu phẩy; -- Unicode' as payload where (95 between 1 and 1500) and 95+1>95;
select 96 as n, (96*3) as score, N'payload 00096 - kiểm thử dấu phẩy; -- Unicode' as payload where (96 between 1 and 1500) and 96+1>96;
select 97 as n, (97*3) as score, N'payload 00097 - kiểm thử dấu phẩy; -- Unicode' as payload where (97 between 1 and 1500) and 97+1>97;
select 98 as n, (98*3) as score, N'payload 00098 - kiểm thử dấu phẩy; -- Unicode' as payload where (98 between 1 and 1500) and 98+1>98;
select 99 as n, (99*3) as score, N'payload 00099 - kiểm thử dấu phẩy; -- Unicode' as payload where (99 between 1 and 1500) and 99+1>99;
select 100 as n, (100*3) as score, N'payload 00100 - kiểm thử dấu phẩy; -- Unicode' as payload where (100 between 1 and 1500) and 100+1>100;
select 101 as n, (101*3) as score, N'payload 00101 - kiểm thử dấu phẩy; -- Unicode' as payload where (101 between 1 and 1500) and 101+1>101;
select 102 as n, (102*3) as score, N'payload 00102 - kiểm thử dấu phẩy; -- Unicode' as payload where (102 between 1 and 1500) and 102+1>102;
select 103 as n, (103*3) as score, N'payload 00103 - kiểm thử dấu phẩy; -- Unicode' as payload where (103 between 1 and 1500) and 103+1>103;
select 104 as n, (104*3) as score, N'payload 00104 - kiểm thử dấu phẩy; -- Unicode' as payload where (104 between 1 and 1500) and 104+1>104;
select 105 as n, (105*3) as score, N'payload 00105 - kiểm thử dấu phẩy; -- Unicode' as payload where (105 between 1 and 1500) and 105+1>105;
select 106 as n, (106*3) as score, N'payload 00106 - kiểm thử dấu phẩy; -- Unicode' as payload where (106 between 1 and 1500) and 106+1>106;
select 107 as n, (107*3) as score, N'payload 00107 - kiểm thử dấu phẩy; -- Unicode' as payload where (107 between 1 and 1500) and 107+1>107;
select 108 as n, (108*3) as score, N'payload 00108 - kiểm thử dấu phẩy; -- Unicode' as payload where (108 between 1 and 1500) and 108+1>108;
select 109 as n, (109*3) as score, N'payload 00109 - kiểm thử dấu phẩy; -- Unicode' as payload where (109 between 1 and 1500) and 109+1>109;
select 110 as n, (110*3) as score, N'payload 00110 - kiểm thử dấu phẩy; -- Unicode' as payload where (110 between 1 and 1500) and 110+1>110;
select 111 as n, (111*3) as score, N'payload 00111 - kiểm thử dấu phẩy; -- Unicode' as payload where (111 between 1 and 1500) and 111+1>111;
select 112 as n, (112*3) as score, N'payload 00112 - kiểm thử dấu phẩy; -- Unicode' as payload where (112 between 1 and 1500) and 112+1>112;
select 113 as n, (113*3) as score, N'payload 00113 - kiểm thử dấu phẩy; -- Unicode' as payload where (113 between 1 and 1500) and 113+1>113;
select 114 as n, (114*3) as score, N'payload 00114 - kiểm thử dấu phẩy; -- Unicode' as payload where (114 between 1 and 1500) and 114+1>114;
select 115 as n, (115*3) as score, N'payload 00115 - kiểm thử dấu phẩy; -- Unicode' as payload where (115 between 1 and 1500) and 115+1>115;
select 116 as n, (116*3) as score, N'payload 00116 - kiểm thử dấu phẩy; -- Unicode' as payload where (116 between 1 and 1500) and 116+1>116;
select 117 as n, (117*3) as score, N'payload 00117 - kiểm thử dấu phẩy; -- Unicode' as payload where (117 between 1 and 1500) and 117+1>117;
select 118 as n, (118*3) as score, N'payload 00118 - kiểm thử dấu phẩy; -- Unicode' as payload where (118 between 1 and 1500) and 118+1>118;
select 119 as n, (119*3) as score, N'payload 00119 - kiểm thử dấu phẩy; -- Unicode' as payload where (119 between 1 and 1500) and 119+1>119;
select 120 as n, (120*3) as score, N'payload 00120 - kiểm thử dấu phẩy; -- Unicode' as payload where (120 between 1 and 1500) and 120+1>120;
select 121 as n, (121*3) as score, N'payload 00121 - kiểm thử dấu phẩy; -- Unicode' as payload where (121 between 1 and 1500) and 121+1>121;
select 122 as n, (122*3) as score, N'payload 00122 - kiểm thử dấu phẩy; -- Unicode' as payload where (122 between 1 and 1500) and 122+1>122;
select 123 as n, (123*3) as score, N'payload 00123 - kiểm thử dấu phẩy; -- Unicode' as payload where (123 between 1 and 1500) and 123+1>123;
select 124 as n, (124*3) as score, N'payload 00124 - kiểm thử dấu phẩy; -- Unicode' as payload where (124 between 1 and 1500) and 124+1>124;
select 125 as n, (125*3) as score, N'payload 00125 - kiểm thử dấu phẩy; -- Unicode' as payload where (125 between 1 and 1500) and 125+1>125;
select 126 as n, (126*3) as score, N'payload 00126 - kiểm thử dấu phẩy; -- Unicode' as payload where (126 between 1 and 1500) and 126+1>126;
select 127 as n, (127*3) as score, N'payload 00127 - kiểm thử dấu phẩy; -- Unicode' as payload where (127 between 1 and 1500) and 127+1>127;
select 128 as n, (128*3) as score, N'payload 00128 - kiểm thử dấu phẩy; -- Unicode' as payload where (128 between 1 and 1500) and 128+1>128;
select 129 as n, (129*3) as score, N'payload 00129 - kiểm thử dấu phẩy; -- Unicode' as payload where (129 between 1 and 1500) and 129+1>129;
select 130 as n, (130*3) as score, N'payload 00130 - kiểm thử dấu phẩy; -- Unicode' as payload where (130 between 1 and 1500) and 130+1>130;
select 131 as n, (131*3) as score, N'payload 00131 - kiểm thử dấu phẩy; -- Unicode' as payload where (131 between 1 and 1500) and 131+1>131;
select 132 as n, (132*3) as score, N'payload 00132 - kiểm thử dấu phẩy; -- Unicode' as payload where (132 between 1 and 1500) and 132+1>132;
select 133 as n, (133*3) as score, N'payload 00133 - kiểm thử dấu phẩy; -- Unicode' as payload where (133 between 1 and 1500) and 133+1>133;
select 134 as n, (134*3) as score, N'payload 00134 - kiểm thử dấu phẩy; -- Unicode' as payload where (134 between 1 and 1500) and 134+1>134;
select 135 as n, (135*3) as score, N'payload 00135 - kiểm thử dấu phẩy; -- Unicode' as payload where (135 between 1 and 1500) and 135+1>135;
select 136 as n, (136*3) as score, N'payload 00136 - kiểm thử dấu phẩy; -- Unicode' as payload where (136 between 1 and 1500) and 136+1>136;
select 137 as n, (137*3) as score, N'payload 00137 - kiểm thử dấu phẩy; -- Unicode' as payload where (137 between 1 and 1500) and 137+1>137;
select 138 as n, (138*3) as score, N'payload 00138 - kiểm thử dấu phẩy; -- Unicode' as payload where (138 between 1 and 1500) and 138+1>138;
select 139 as n, (139*3) as score, N'payload 00139 - kiểm thử dấu phẩy; -- Unicode' as payload where (139 between 1 and 1500) and 139+1>139;
select 140 as n, (140*3) as score, N'payload 00140 - kiểm thử dấu phẩy; -- Unicode' as payload where (140 between 1 and 1500) and 140+1>140;
select 141 as n, (141*3) as score, N'payload 00141 - kiểm thử dấu phẩy; -- Unicode' as payload where (141 between 1 and 1500) and 141+1>141;
select 142 as n, (142*3) as score, N'payload 00142 - kiểm thử dấu phẩy; -- Unicode' as payload where (142 between 1 and 1500) and 142+1>142;
select 143 as n, (143*3) as score, N'payload 00143 - kiểm thử dấu phẩy; -- Unicode' as payload where (143 between 1 and 1500) and 143+1>143;
select 144 as n, (144*3) as score, N'payload 00144 - kiểm thử dấu phẩy; -- Unicode' as payload where (144 between 1 and 1500) and 144+1>144;
select 145 as n, (145*3) as score, N'payload 00145 - kiểm thử dấu phẩy; -- Unicode' as payload where (145 between 1 and 1500) and 145+1>145;
select 146 as n, (146*3) as score, N'payload 00146 - kiểm thử dấu phẩy; -- Unicode' as payload where (146 between 1 and 1500) and 146+1>146;
select 147 as n, (147*3) as score, N'payload 00147 - kiểm thử dấu phẩy; -- Unicode' as payload where (147 between 1 and 1500) and 147+1>147;
select 148 as n, (148*3) as score, N'payload 00148 - kiểm thử dấu phẩy; -- Unicode' as payload where (148 between 1 and 1500) and 148+1>148;
select 149 as n, (149*3) as score, N'payload 00149 - kiểm thử dấu phẩy; -- Unicode' as payload where (149 between 1 and 1500) and 149+1>149;
select 150 as n, (150*3) as score, N'payload 00150 - kiểm thử dấu phẩy; -- Unicode' as payload where (150 between 1 and 1500) and 150+1>150;
select 151 as n, (151*3) as score, N'payload 00151 - kiểm thử dấu phẩy; -- Unicode' as payload where (151 between 1 and 1500) and 151+1>151;
select 152 as n, (152*3) as score, N'payload 00152 - kiểm thử dấu phẩy; -- Unicode' as payload where (152 between 1 and 1500) and 152+1>152;
select 153 as n, (153*3) as score, N'payload 00153 - kiểm thử dấu phẩy; -- Unicode' as payload where (153 between 1 and 1500) and 153+1>153;
select 154 as n, (154*3) as score, N'payload 00154 - kiểm thử dấu phẩy; -- Unicode' as payload where (154 between 1 and 1500) and 154+1>154;
select 155 as n, (155*3) as score, N'payload 00155 - kiểm thử dấu phẩy; -- Unicode' as payload where (155 between 1 and 1500) and 155+1>155;
select 156 as n, (156*3) as score, N'payload 00156 - kiểm thử dấu phẩy; -- Unicode' as payload where (156 between 1 and 1500) and 156+1>156;
select 157 as n, (157*3) as score, N'payload 00157 - kiểm thử dấu phẩy; -- Unicode' as payload where (157 between 1 and 1500) and 157+1>157;
select 158 as n, (158*3) as score, N'payload 00158 - kiểm thử dấu phẩy; -- Unicode' as payload where (158 between 1 and 1500) and 158+1>158;
select 159 as n, (159*3) as score, N'payload 00159 - kiểm thử dấu phẩy; -- Unicode' as payload where (159 between 1 and 1500) and 159+1>159;
select 160 as n, (160*3) as score, N'payload 00160 - kiểm thử dấu phẩy; -- Unicode' as payload where (160 between 1 and 1500) and 160+1>160;
select 161 as n, (161*3) as score, N'payload 00161 - kiểm thử dấu phẩy; -- Unicode' as payload where (161 between 1 and 1500) and 161+1>161;
select 162 as n, (162*3) as score, N'payload 00162 - kiểm thử dấu phẩy; -- Unicode' as payload where (162 between 1 and 1500) and 162+1>162;
select 163 as n, (163*3) as score, N'payload 00163 - kiểm thử dấu phẩy; -- Unicode' as payload where (163 between 1 and 1500) and 163+1>163;
select 164 as n, (164*3) as score, N'payload 00164 - kiểm thử dấu phẩy; -- Unicode' as payload where (164 between 1 and 1500) and 164+1>164;
select 165 as n, (165*3) as score, N'payload 00165 - kiểm thử dấu phẩy; -- Unicode' as payload where (165 between 1 and 1500) and 165+1>165;
select 166 as n, (166*3) as score, N'payload 00166 - kiểm thử dấu phẩy; -- Unicode' as payload where (166 between 1 and 1500) and 166+1>166;
select 167 as n, (167*3) as score, N'payload 00167 - kiểm thử dấu phẩy; -- Unicode' as payload where (167 between 1 and 1500) and 167+1>167;
select 168 as n, (168*3) as score, N'payload 00168 - kiểm thử dấu phẩy; -- Unicode' as payload where (168 between 1 and 1500) and 168+1>168;
select 169 as n, (169*3) as score, N'payload 00169 - kiểm thử dấu phẩy; -- Unicode' as payload where (169 between 1 and 1500) and 169+1>169;
select 170 as n, (170*3) as score, N'payload 00170 - kiểm thử dấu phẩy; -- Unicode' as payload where (170 between 1 and 1500) and 170+1>170;
select 171 as n, (171*3) as score, N'payload 00171 - kiểm thử dấu phẩy; -- Unicode' as payload where (171 between 1 and 1500) and 171+1>171;
select 172 as n, (172*3) as score, N'payload 00172 - kiểm thử dấu phẩy; -- Unicode' as payload where (172 between 1 and 1500) and 172+1>172;
select 173 as n, (173*3) as score, N'payload 00173 - kiểm thử dấu phẩy; -- Unicode' as payload where (173 between 1 and 1500) and 173+1>173;
select 174 as n, (174*3) as score, N'payload 00174 - kiểm thử dấu phẩy; -- Unicode' as payload where (174 between 1 and 1500) and 174+1>174;
select 175 as n, (175*3) as score, N'payload 00175 - kiểm thử dấu phẩy; -- Unicode' as payload where (175 between 1 and 1500) and 175+1>175;
select 176 as n, (176*3) as score, N'payload 00176 - kiểm thử dấu phẩy; -- Unicode' as payload where (176 between 1 and 1500) and 176+1>176;
select 177 as n, (177*3) as score, N'payload 00177 - kiểm thử dấu phẩy; -- Unicode' as payload where (177 between 1 and 1500) and 177+1>177;
select 178 as n, (178*3) as score, N'payload 00178 - kiểm thử dấu phẩy; -- Unicode' as payload where (178 between 1 and 1500) and 178+1>178;
select 179 as n, (179*3) as score, N'payload 00179 - kiểm thử dấu phẩy; -- Unicode' as payload where (179 between 1 and 1500) and 179+1>179;
select 180 as n, (180*3) as score, N'payload 00180 - kiểm thử dấu phẩy; -- Unicode' as payload where (180 between 1 and 1500) and 180+1>180;
select 181 as n, (181*3) as score, N'payload 00181 - kiểm thử dấu phẩy; -- Unicode' as payload where (181 between 1 and 1500) and 181+1>181;
select 182 as n, (182*3) as score, N'payload 00182 - kiểm thử dấu phẩy; -- Unicode' as payload where (182 between 1 and 1500) and 182+1>182;
select 183 as n, (183*3) as score, N'payload 00183 - kiểm thử dấu phẩy; -- Unicode' as payload where (183 between 1 and 1500) and 183+1>183;
select 184 as n, (184*3) as score, N'payload 00184 - kiểm thử dấu phẩy; -- Unicode' as payload where (184 between 1 and 1500) and 184+1>184;
select 185 as n, (185*3) as score, N'payload 00185 - kiểm thử dấu phẩy; -- Unicode' as payload where (185 between 1 and 1500) and 185+1>185;
select 186 as n, (186*3) as score, N'payload 00186 - kiểm thử dấu phẩy; -- Unicode' as payload where (186 between 1 and 1500) and 186+1>186;
select 187 as n, (187*3) as score, N'payload 00187 - kiểm thử dấu phẩy; -- Unicode' as payload where (187 between 1 and 1500) and 187+1>187;
select 188 as n, (188*3) as score, N'payload 00188 - kiểm thử dấu phẩy; -- Unicode' as payload where (188 between 1 and 1500) and 188+1>188;
select 189 as n, (189*3) as score, N'payload 00189 - kiểm thử dấu phẩy; -- Unicode' as payload where (189 between 1 and 1500) and 189+1>189;
select 190 as n, (190*3) as score, N'payload 00190 - kiểm thử dấu phẩy; -- Unicode' as payload where (190 between 1 and 1500) and 190+1>190;
select 191 as n, (191*3) as score, N'payload 00191 - kiểm thử dấu phẩy; -- Unicode' as payload where (191 between 1 and 1500) and 191+1>191;
select 192 as n, (192*3) as score, N'payload 00192 - kiểm thử dấu phẩy; -- Unicode' as payload where (192 between 1 and 1500) and 192+1>192;
select 193 as n, (193*3) as score, N'payload 00193 - kiểm thử dấu phẩy; -- Unicode' as payload where (193 between 1 and 1500) and 193+1>193;
select 194 as n, (194*3) as score, N'payload 00194 - kiểm thử dấu phẩy; -- Unicode' as payload where (194 between 1 and 1500) and 194+1>194;
select 195 as n, (195*3) as score, N'payload 00195 - kiểm thử dấu phẩy; -- Unicode' as payload where (195 between 1 and 1500) and 195+1>195;
select 196 as n, (196*3) as score, N'payload 00196 - kiểm thử dấu phẩy; -- Unicode' as payload where (196 between 1 and 1500) and 196+1>196;
select 197 as n, (197*3) as score, N'payload 00197 - kiểm thử dấu phẩy; -- Unicode' as payload where (197 between 1 and 1500) and 197+1>197;
select 198 as n, (198*3) as score, N'payload 00198 - kiểm thử dấu phẩy; -- Unicode' as payload where (198 between 1 and 1500) and 198+1>198;
select 199 as n, (199*3) as score, N'payload 00199 - kiểm thử dấu phẩy; -- Unicode' as payload where (199 between 1 and 1500) and 199+1>199;
select 200 as n, (200*3) as score, N'payload 00200 - kiểm thử dấu phẩy; -- Unicode' as payload where (200 between 1 and 1500) and 200+1>200;
select 201 as n, (201*3) as score, N'payload 00201 - kiểm thử dấu phẩy; -- Unicode' as payload where (201 between 1 and 1500) and 201+1>201;
select 202 as n, (202*3) as score, N'payload 00202 - kiểm thử dấu phẩy; -- Unicode' as payload where (202 between 1 and 1500) and 202+1>202;
select 203 as n, (203*3) as score, N'payload 00203 - kiểm thử dấu phẩy; -- Unicode' as payload where (203 between 1 and 1500) and 203+1>203;
select 204 as n, (204*3) as score, N'payload 00204 - kiểm thử dấu phẩy; -- Unicode' as payload where (204 between 1 and 1500) and 204+1>204;
select 205 as n, (205*3) as score, N'payload 00205 - kiểm thử dấu phẩy; -- Unicode' as payload where (205 between 1 and 1500) and 205+1>205;
select 206 as n, (206*3) as score, N'payload 00206 - kiểm thử dấu phẩy; -- Unicode' as payload where (206 between 1 and 1500) and 206+1>206;
select 207 as n, (207*3) as score, N'payload 00207 - kiểm thử dấu phẩy; -- Unicode' as payload where (207 between 1 and 1500) and 207+1>207;
select 208 as n, (208*3) as score, N'payload 00208 - kiểm thử dấu phẩy; -- Unicode' as payload where (208 between 1 and 1500) and 208+1>208;
select 209 as n, (209*3) as score, N'payload 00209 - kiểm thử dấu phẩy; -- Unicode' as payload where (209 between 1 and 1500) and 209+1>209;
select 210 as n, (210*3) as score, N'payload 00210 - kiểm thử dấu phẩy; -- Unicode' as payload where (210 between 1 and 1500) and 210+1>210;
select 211 as n, (211*3) as score, N'payload 00211 - kiểm thử dấu phẩy; -- Unicode' as payload where (211 between 1 and 1500) and 211+1>211;
select 212 as n, (212*3) as score, N'payload 00212 - kiểm thử dấu phẩy; -- Unicode' as payload where (212 between 1 and 1500) and 212+1>212;
select 213 as n, (213*3) as score, N'payload 00213 - kiểm thử dấu phẩy; -- Unicode' as payload where (213 between 1 and 1500) and 213+1>213;
select 214 as n, (214*3) as score, N'payload 00214 - kiểm thử dấu phẩy; -- Unicode' as payload where (214 between 1 and 1500) and 214+1>214;
select 215 as n, (215*3) as score, N'payload 00215 - kiểm thử dấu phẩy; -- Unicode' as payload where (215 between 1 and 1500) and 215+1>215;
select 216 as n, (216*3) as score, N'payload 00216 - kiểm thử dấu phẩy; -- Unicode' as payload where (216 between 1 and 1500) and 216+1>216;
select 217 as n, (217*3) as score, N'payload 00217 - kiểm thử dấu phẩy; -- Unicode' as payload where (217 between 1 and 1500) and 217+1>217;
select 218 as n, (218*3) as score, N'payload 00218 - kiểm thử dấu phẩy; -- Unicode' as payload where (218 between 1 and 1500) and 218+1>218;
select 219 as n, (219*3) as score, N'payload 00219 - kiểm thử dấu phẩy; -- Unicode' as payload where (219 between 1 and 1500) and 219+1>219;
select 220 as n, (220*3) as score, N'payload 00220 - kiểm thử dấu phẩy; -- Unicode' as payload where (220 between 1 and 1500) and 220+1>220;
select 221 as n, (221*3) as score, N'payload 00221 - kiểm thử dấu phẩy; -- Unicode' as payload where (221 between 1 and 1500) and 221+1>221;
select 222 as n, (222*3) as score, N'payload 00222 - kiểm thử dấu phẩy; -- Unicode' as payload where (222 between 1 and 1500) and 222+1>222;
select 223 as n, (223*3) as score, N'payload 00223 - kiểm thử dấu phẩy; -- Unicode' as payload where (223 between 1 and 1500) and 223+1>223;
select 224 as n, (224*3) as score, N'payload 00224 - kiểm thử dấu phẩy; -- Unicode' as payload where (224 between 1 and 1500) and 224+1>224;
select 225 as n, (225*3) as score, N'payload 00225 - kiểm thử dấu phẩy; -- Unicode' as payload where (225 between 1 and 1500) and 225+1>225;
select 226 as n, (226*3) as score, N'payload 00226 - kiểm thử dấu phẩy; -- Unicode' as payload where (226 between 1 and 1500) and 226+1>226;
select 227 as n, (227*3) as score, N'payload 00227 - kiểm thử dấu phẩy; -- Unicode' as payload where (227 between 1 and 1500) and 227+1>227;
select 228 as n, (228*3) as score, N'payload 00228 - kiểm thử dấu phẩy; -- Unicode' as payload where (228 between 1 and 1500) and 228+1>228;
select 229 as n, (229*3) as score, N'payload 00229 - kiểm thử dấu phẩy; -- Unicode' as payload where (229 between 1 and 1500) and 229+1>229;
select 230 as n, (230*3) as score, N'payload 00230 - kiểm thử dấu phẩy; -- Unicode' as payload where (230 between 1 and 1500) and 230+1>230;
select 231 as n, (231*3) as score, N'payload 00231 - kiểm thử dấu phẩy; -- Unicode' as payload where (231 between 1 and 1500) and 231+1>231;
select 232 as n, (232*3) as score, N'payload 00232 - kiểm thử dấu phẩy; -- Unicode' as payload where (232 between 1 and 1500) and 232+1>232;
select 233 as n, (233*3) as score, N'payload 00233 - kiểm thử dấu phẩy; -- Unicode' as payload where (233 between 1 and 1500) and 233+1>233;
select 234 as n, (234*3) as score, N'payload 00234 - kiểm thử dấu phẩy; -- Unicode' as payload where (234 between 1 and 1500) and 234+1>234;
select 235 as n, (235*3) as score, N'payload 00235 - kiểm thử dấu phẩy; -- Unicode' as payload where (235 between 1 and 1500) and 235+1>235;
select 236 as n, (236*3) as score, N'payload 00236 - kiểm thử dấu phẩy; -- Unicode' as payload where (236 between 1 and 1500) and 236+1>236;
select 237 as n, (237*3) as score, N'payload 00237 - kiểm thử dấu phẩy; -- Unicode' as payload where (237 between 1 and 1500) and 237+1>237;
select 238 as n, (238*3) as score, N'payload 00238 - kiểm thử dấu phẩy; -- Unicode' as payload where (238 between 1 and 1500) and 238+1>238;
select 239 as n, (239*3) as score, N'payload 00239 - kiểm thử dấu phẩy; -- Unicode' as payload where (239 between 1 and 1500) and 239+1>239;
select 240 as n, (240*3) as score, N'payload 00240 - kiểm thử dấu phẩy; -- Unicode' as payload where (240 between 1 and 1500) and 240+1>240;
select 241 as n, (241*3) as score, N'payload 00241 - kiểm thử dấu phẩy; -- Unicode' as payload where (241 between 1 and 1500) and 241+1>241;
select 242 as n, (242*3) as score, N'payload 00242 - kiểm thử dấu phẩy; -- Unicode' as payload where (242 between 1 and 1500) and 242+1>242;
select 243 as n, (243*3) as score, N'payload 00243 - kiểm thử dấu phẩy; -- Unicode' as payload where (243 between 1 and 1500) and 243+1>243;
select 244 as n, (244*3) as score, N'payload 00244 - kiểm thử dấu phẩy; -- Unicode' as payload where (244 between 1 and 1500) and 244+1>244;
select 245 as n, (245*3) as score, N'payload 00245 - kiểm thử dấu phẩy; -- Unicode' as payload where (245 between 1 and 1500) and 245+1>245;
select 246 as n, (246*3) as score, N'payload 00246 - kiểm thử dấu phẩy; -- Unicode' as payload where (246 between 1 and 1500) and 246+1>246;
select 247 as n, (247*3) as score, N'payload 00247 - kiểm thử dấu phẩy; -- Unicode' as payload where (247 between 1 and 1500) and 247+1>247;
select 248 as n, (248*3) as score, N'payload 00248 - kiểm thử dấu phẩy; -- Unicode' as payload where (248 between 1 and 1500) and 248+1>248;
select 249 as n, (249*3) as score, N'payload 00249 - kiểm thử dấu phẩy; -- Unicode' as payload where (249 between 1 and 1500) and 249+1>249;
select 250 as n, (250*3) as score, N'payload 00250 - kiểm thử dấu phẩy; -- Unicode' as payload where (250 between 1 and 1500) and 250+1>250;
select 251 as n, (251*3) as score, N'payload 00251 - kiểm thử dấu phẩy; -- Unicode' as payload where (251 between 1 and 1500) and 251+1>251;
select 252 as n, (252*3) as score, N'payload 00252 - kiểm thử dấu phẩy; -- Unicode' as payload where (252 between 1 and 1500) and 252+1>252;
select 253 as n, (253*3) as score, N'payload 00253 - kiểm thử dấu phẩy; -- Unicode' as payload where (253 between 1 and 1500) and 253+1>253;
select 254 as n, (254*3) as score, N'payload 00254 - kiểm thử dấu phẩy; -- Unicode' as payload where (254 between 1 and 1500) and 254+1>254;
select 255 as n, (255*3) as score, N'payload 00255 - kiểm thử dấu phẩy; -- Unicode' as payload where (255 between 1 and 1500) and 255+1>255;
select 256 as n, (256*3) as score, N'payload 00256 - kiểm thử dấu phẩy; -- Unicode' as payload where (256 between 1 and 1500) and 256+1>256;
select 257 as n, (257*3) as score, N'payload 00257 - kiểm thử dấu phẩy; -- Unicode' as payload where (257 between 1 and 1500) and 257+1>257;
select 258 as n, (258*3) as score, N'payload 00258 - kiểm thử dấu phẩy; -- Unicode' as payload where (258 between 1 and 1500) and 258+1>258;
select 259 as n, (259*3) as score, N'payload 00259 - kiểm thử dấu phẩy; -- Unicode' as payload where (259 between 1 and 1500) and 259+1>259;
select 260 as n, (260*3) as score, N'payload 00260 - kiểm thử dấu phẩy; -- Unicode' as payload where (260 between 1 and 1500) and 260+1>260;
select 261 as n, (261*3) as score, N'payload 00261 - kiểm thử dấu phẩy; -- Unicode' as payload where (261 between 1 and 1500) and 261+1>261;
select 262 as n, (262*3) as score, N'payload 00262 - kiểm thử dấu phẩy; -- Unicode' as payload where (262 between 1 and 1500) and 262+1>262;
select 263 as n, (263*3) as score, N'payload 00263 - kiểm thử dấu phẩy; -- Unicode' as payload where (263 between 1 and 1500) and 263+1>263;
select 264 as n, (264*3) as score, N'payload 00264 - kiểm thử dấu phẩy; -- Unicode' as payload where (264 between 1 and 1500) and 264+1>264;
select 265 as n, (265*3) as score, N'payload 00265 - kiểm thử dấu phẩy; -- Unicode' as payload where (265 between 1 and 1500) and 265+1>265;
select 266 as n, (266*3) as score, N'payload 00266 - kiểm thử dấu phẩy; -- Unicode' as payload where (266 between 1 and 1500) and 266+1>266;
select 267 as n, (267*3) as score, N'payload 00267 - kiểm thử dấu phẩy; -- Unicode' as payload where (267 between 1 and 1500) and 267+1>267;
select 268 as n, (268*3) as score, N'payload 00268 - kiểm thử dấu phẩy; -- Unicode' as payload where (268 between 1 and 1500) and 268+1>268;
select 269 as n, (269*3) as score, N'payload 00269 - kiểm thử dấu phẩy; -- Unicode' as payload where (269 between 1 and 1500) and 269+1>269;
select 270 as n, (270*3) as score, N'payload 00270 - kiểm thử dấu phẩy; -- Unicode' as payload where (270 between 1 and 1500) and 270+1>270;
select 271 as n, (271*3) as score, N'payload 00271 - kiểm thử dấu phẩy; -- Unicode' as payload where (271 between 1 and 1500) and 271+1>271;
select 272 as n, (272*3) as score, N'payload 00272 - kiểm thử dấu phẩy; -- Unicode' as payload where (272 between 1 and 1500) and 272+1>272;
select 273 as n, (273*3) as score, N'payload 00273 - kiểm thử dấu phẩy; -- Unicode' as payload where (273 between 1 and 1500) and 273+1>273;
select 274 as n, (274*3) as score, N'payload 00274 - kiểm thử dấu phẩy; -- Unicode' as payload where (274 between 1 and 1500) and 274+1>274;
select 275 as n, (275*3) as score, N'payload 00275 - kiểm thử dấu phẩy; -- Unicode' as payload where (275 between 1 and 1500) and 275+1>275;
select 276 as n, (276*3) as score, N'payload 00276 - kiểm thử dấu phẩy; -- Unicode' as payload where (276 between 1 and 1500) and 276+1>276;
select 277 as n, (277*3) as score, N'payload 00277 - kiểm thử dấu phẩy; -- Unicode' as payload where (277 between 1 and 1500) and 277+1>277;
select 278 as n, (278*3) as score, N'payload 00278 - kiểm thử dấu phẩy; -- Unicode' as payload where (278 between 1 and 1500) and 278+1>278;
select 279 as n, (279*3) as score, N'payload 00279 - kiểm thử dấu phẩy; -- Unicode' as payload where (279 between 1 and 1500) and 279+1>279;
select 280 as n, (280*3) as score, N'payload 00280 - kiểm thử dấu phẩy; -- Unicode' as payload where (280 between 1 and 1500) and 280+1>280;
select 281 as n, (281*3) as score, N'payload 00281 - kiểm thử dấu phẩy; -- Unicode' as payload where (281 between 1 and 1500) and 281+1>281;
select 282 as n, (282*3) as score, N'payload 00282 - kiểm thử dấu phẩy; -- Unicode' as payload where (282 between 1 and 1500) and 282+1>282;
select 283 as n, (283*3) as score, N'payload 00283 - kiểm thử dấu phẩy; -- Unicode' as payload where (283 between 1 and 1500) and 283+1>283;
select 284 as n, (284*3) as score, N'payload 00284 - kiểm thử dấu phẩy; -- Unicode' as payload where (284 between 1 and 1500) and 284+1>284;
select 285 as n, (285*3) as score, N'payload 00285 - kiểm thử dấu phẩy; -- Unicode' as payload where (285 between 1 and 1500) and 285+1>285;
select 286 as n, (286*3) as score, N'payload 00286 - kiểm thử dấu phẩy; -- Unicode' as payload where (286 between 1 and 1500) and 286+1>286;
select 287 as n, (287*3) as score, N'payload 00287 - kiểm thử dấu phẩy; -- Unicode' as payload where (287 between 1 and 1500) and 287+1>287;
select 288 as n, (288*3) as score, N'payload 00288 - kiểm thử dấu phẩy; -- Unicode' as payload where (288 between 1 and 1500) and 288+1>288;
select 289 as n, (289*3) as score, N'payload 00289 - kiểm thử dấu phẩy; -- Unicode' as payload where (289 between 1 and 1500) and 289+1>289;
select 290 as n, (290*3) as score, N'payload 00290 - kiểm thử dấu phẩy; -- Unicode' as payload where (290 between 1 and 1500) and 290+1>290;
select 291 as n, (291*3) as score, N'payload 00291 - kiểm thử dấu phẩy; -- Unicode' as payload where (291 between 1 and 1500) and 291+1>291;
select 292 as n, (292*3) as score, N'payload 00292 - kiểm thử dấu phẩy; -- Unicode' as payload where (292 between 1 and 1500) and 292+1>292;
select 293 as n, (293*3) as score, N'payload 00293 - kiểm thử dấu phẩy; -- Unicode' as payload where (293 between 1 and 1500) and 293+1>293;
select 294 as n, (294*3) as score, N'payload 00294 - kiểm thử dấu phẩy; -- Unicode' as payload where (294 between 1 and 1500) and 294+1>294;
select 295 as n, (295*3) as score, N'payload 00295 - kiểm thử dấu phẩy; -- Unicode' as payload where (295 between 1 and 1500) and 295+1>295;
select 296 as n, (296*3) as score, N'payload 00296 - kiểm thử dấu phẩy; -- Unicode' as payload where (296 between 1 and 1500) and 296+1>296;
select 297 as n, (297*3) as score, N'payload 00297 - kiểm thử dấu phẩy; -- Unicode' as payload where (297 between 1 and 1500) and 297+1>297;
select 298 as n, (298*3) as score, N'payload 00298 - kiểm thử dấu phẩy; -- Unicode' as payload where (298 between 1 and 1500) and 298+1>298;
select 299 as n, (299*3) as score, N'payload 00299 - kiểm thử dấu phẩy; -- Unicode' as payload where (299 between 1 and 1500) and 299+1>299;
select 300 as n, (300*3) as score, N'payload 00300 - kiểm thử dấu phẩy; -- Unicode' as payload where (300 between 1 and 1500) and 300+1>300;
select 301 as n, (301*3) as score, N'payload 00301 - kiểm thử dấu phẩy; -- Unicode' as payload where (301 between 1 and 1500) and 301+1>301;
select 302 as n, (302*3) as score, N'payload 00302 - kiểm thử dấu phẩy; -- Unicode' as payload where (302 between 1 and 1500) and 302+1>302;
select 303 as n, (303*3) as score, N'payload 00303 - kiểm thử dấu phẩy; -- Unicode' as payload where (303 between 1 and 1500) and 303+1>303;
select 304 as n, (304*3) as score, N'payload 00304 - kiểm thử dấu phẩy; -- Unicode' as payload where (304 between 1 and 1500) and 304+1>304;
select 305 as n, (305*3) as score, N'payload 00305 - kiểm thử dấu phẩy; -- Unicode' as payload where (305 between 1 and 1500) and 305+1>305;
select 306 as n, (306*3) as score, N'payload 00306 - kiểm thử dấu phẩy; -- Unicode' as payload where (306 between 1 and 1500) and 306+1>306;
select 307 as n, (307*3) as score, N'payload 00307 - kiểm thử dấu phẩy; -- Unicode' as payload where (307 between 1 and 1500) and 307+1>307;
select 308 as n, (308*3) as score, N'payload 00308 - kiểm thử dấu phẩy; -- Unicode' as payload where (308 between 1 and 1500) and 308+1>308;
select 309 as n, (309*3) as score, N'payload 00309 - kiểm thử dấu phẩy; -- Unicode' as payload where (309 between 1 and 1500) and 309+1>309;
select 310 as n, (310*3) as score, N'payload 00310 - kiểm thử dấu phẩy; -- Unicode' as payload where (310 between 1 and 1500) and 310+1>310;
select 311 as n, (311*3) as score, N'payload 00311 - kiểm thử dấu phẩy; -- Unicode' as payload where (311 between 1 and 1500) and 311+1>311;
select 312 as n, (312*3) as score, N'payload 00312 - kiểm thử dấu phẩy; -- Unicode' as payload where (312 between 1 and 1500) and 312+1>312;
select 313 as n, (313*3) as score, N'payload 00313 - kiểm thử dấu phẩy; -- Unicode' as payload where (313 between 1 and 1500) and 313+1>313;
select 314 as n, (314*3) as score, N'payload 00314 - kiểm thử dấu phẩy; -- Unicode' as payload where (314 between 1 and 1500) and 314+1>314;
select 315 as n, (315*3) as score, N'payload 00315 - kiểm thử dấu phẩy; -- Unicode' as payload where (315 between 1 and 1500) and 315+1>315;
select 316 as n, (316*3) as score, N'payload 00316 - kiểm thử dấu phẩy; -- Unicode' as payload where (316 between 1 and 1500) and 316+1>316;
select 317 as n, (317*3) as score, N'payload 00317 - kiểm thử dấu phẩy; -- Unicode' as payload where (317 between 1 and 1500) and 317+1>317;
select 318 as n, (318*3) as score, N'payload 00318 - kiểm thử dấu phẩy; -- Unicode' as payload where (318 between 1 and 1500) and 318+1>318;
select 319 as n, (319*3) as score, N'payload 00319 - kiểm thử dấu phẩy; -- Unicode' as payload where (319 between 1 and 1500) and 319+1>319;
select 320 as n, (320*3) as score, N'payload 00320 - kiểm thử dấu phẩy; -- Unicode' as payload where (320 between 1 and 1500) and 320+1>320;
select 321 as n, (321*3) as score, N'payload 00321 - kiểm thử dấu phẩy; -- Unicode' as payload where (321 between 1 and 1500) and 321+1>321;
select 322 as n, (322*3) as score, N'payload 00322 - kiểm thử dấu phẩy; -- Unicode' as payload where (322 between 1 and 1500) and 322+1>322;
select 323 as n, (323*3) as score, N'payload 00323 - kiểm thử dấu phẩy; -- Unicode' as payload where (323 between 1 and 1500) and 323+1>323;
select 324 as n, (324*3) as score, N'payload 00324 - kiểm thử dấu phẩy; -- Unicode' as payload where (324 between 1 and 1500) and 324+1>324;
select 325 as n, (325*3) as score, N'payload 00325 - kiểm thử dấu phẩy; -- Unicode' as payload where (325 between 1 and 1500) and 325+1>325;
select 326 as n, (326*3) as score, N'payload 00326 - kiểm thử dấu phẩy; -- Unicode' as payload where (326 between 1 and 1500) and 326+1>326;
select 327 as n, (327*3) as score, N'payload 00327 - kiểm thử dấu phẩy; -- Unicode' as payload where (327 between 1 and 1500) and 327+1>327;
select 328 as n, (328*3) as score, N'payload 00328 - kiểm thử dấu phẩy; -- Unicode' as payload where (328 between 1 and 1500) and 328+1>328;
select 329 as n, (329*3) as score, N'payload 00329 - kiểm thử dấu phẩy; -- Unicode' as payload where (329 between 1 and 1500) and 329+1>329;
select 330 as n, (330*3) as score, N'payload 00330 - kiểm thử dấu phẩy; -- Unicode' as payload where (330 between 1 and 1500) and 330+1>330;
select 331 as n, (331*3) as score, N'payload 00331 - kiểm thử dấu phẩy; -- Unicode' as payload where (331 between 1 and 1500) and 331+1>331;
select 332 as n, (332*3) as score, N'payload 00332 - kiểm thử dấu phẩy; -- Unicode' as payload where (332 between 1 and 1500) and 332+1>332;
select 333 as n, (333*3) as score, N'payload 00333 - kiểm thử dấu phẩy; -- Unicode' as payload where (333 between 1 and 1500) and 333+1>333;
select 334 as n, (334*3) as score, N'payload 00334 - kiểm thử dấu phẩy; -- Unicode' as payload where (334 between 1 and 1500) and 334+1>334;
select 335 as n, (335*3) as score, N'payload 00335 - kiểm thử dấu phẩy; -- Unicode' as payload where (335 between 1 and 1500) and 335+1>335;
select 336 as n, (336*3) as score, N'payload 00336 - kiểm thử dấu phẩy; -- Unicode' as payload where (336 between 1 and 1500) and 336+1>336;
select 337 as n, (337*3) as score, N'payload 00337 - kiểm thử dấu phẩy; -- Unicode' as payload where (337 between 1 and 1500) and 337+1>337;
select 338 as n, (338*3) as score, N'payload 00338 - kiểm thử dấu phẩy; -- Unicode' as payload where (338 between 1 and 1500) and 338+1>338;
select 339 as n, (339*3) as score, N'payload 00339 - kiểm thử dấu phẩy; -- Unicode' as payload where (339 between 1 and 1500) and 339+1>339;
select 340 as n, (340*3) as score, N'payload 00340 - kiểm thử dấu phẩy; -- Unicode' as payload where (340 between 1 and 1500) and 340+1>340;
select 341 as n, (341*3) as score, N'payload 00341 - kiểm thử dấu phẩy; -- Unicode' as payload where (341 between 1 and 1500) and 341+1>341;
select 342 as n, (342*3) as score, N'payload 00342 - kiểm thử dấu phẩy; -- Unicode' as payload where (342 between 1 and 1500) and 342+1>342;
select 343 as n, (343*3) as score, N'payload 00343 - kiểm thử dấu phẩy; -- Unicode' as payload where (343 between 1 and 1500) and 343+1>343;
select 344 as n, (344*3) as score, N'payload 00344 - kiểm thử dấu phẩy; -- Unicode' as payload where (344 between 1 and 1500) and 344+1>344;
select 345 as n, (345*3) as score, N'payload 00345 - kiểm thử dấu phẩy; -- Unicode' as payload where (345 between 1 and 1500) and 345+1>345;
select 346 as n, (346*3) as score, N'payload 00346 - kiểm thử dấu phẩy; -- Unicode' as payload where (346 between 1 and 1500) and 346+1>346;
select 347 as n, (347*3) as score, N'payload 00347 - kiểm thử dấu phẩy; -- Unicode' as payload where (347 between 1 and 1500) and 347+1>347;
select 348 as n, (348*3) as score, N'payload 00348 - kiểm thử dấu phẩy; -- Unicode' as payload where (348 between 1 and 1500) and 348+1>348;
select 349 as n, (349*3) as score, N'payload 00349 - kiểm thử dấu phẩy; -- Unicode' as payload where (349 between 1 and 1500) and 349+1>349;
select 350 as n, (350*3) as score, N'payload 00350 - kiểm thử dấu phẩy; -- Unicode' as payload where (350 between 1 and 1500) and 350+1>350;
select 351 as n, (351*3) as score, N'payload 00351 - kiểm thử dấu phẩy; -- Unicode' as payload where (351 between 1 and 1500) and 351+1>351;
select 352 as n, (352*3) as score, N'payload 00352 - kiểm thử dấu phẩy; -- Unicode' as payload where (352 between 1 and 1500) and 352+1>352;
select 353 as n, (353*3) as score, N'payload 00353 - kiểm thử dấu phẩy; -- Unicode' as payload where (353 between 1 and 1500) and 353+1>353;
select 354 as n, (354*3) as score, N'payload 00354 - kiểm thử dấu phẩy; -- Unicode' as payload where (354 between 1 and 1500) and 354+1>354;
select 355 as n, (355*3) as score, N'payload 00355 - kiểm thử dấu phẩy; -- Unicode' as payload where (355 between 1 and 1500) and 355+1>355;
select 356 as n, (356*3) as score, N'payload 00356 - kiểm thử dấu phẩy; -- Unicode' as payload where (356 between 1 and 1500) and 356+1>356;
select 357 as n, (357*3) as score, N'payload 00357 - kiểm thử dấu phẩy; -- Unicode' as payload where (357 between 1 and 1500) and 357+1>357;
select 358 as n, (358*3) as score, N'payload 00358 - kiểm thử dấu phẩy; -- Unicode' as payload where (358 between 1 and 1500) and 358+1>358;
select 359 as n, (359*3) as score, N'payload 00359 - kiểm thử dấu phẩy; -- Unicode' as payload where (359 between 1 and 1500) and 359+1>359;
select 360 as n, (360*3) as score, N'payload 00360 - kiểm thử dấu phẩy; -- Unicode' as payload where (360 between 1 and 1500) and 360+1>360;
select 361 as n, (361*3) as score, N'payload 00361 - kiểm thử dấu phẩy; -- Unicode' as payload where (361 between 1 and 1500) and 361+1>361;
select 362 as n, (362*3) as score, N'payload 00362 - kiểm thử dấu phẩy; -- Unicode' as payload where (362 between 1 and 1500) and 362+1>362;
select 363 as n, (363*3) as score, N'payload 00363 - kiểm thử dấu phẩy; -- Unicode' as payload where (363 between 1 and 1500) and 363+1>363;
select 364 as n, (364*3) as score, N'payload 00364 - kiểm thử dấu phẩy; -- Unicode' as payload where (364 between 1 and 1500) and 364+1>364;
select 365 as n, (365*3) as score, N'payload 00365 - kiểm thử dấu phẩy; -- Unicode' as payload where (365 between 1 and 1500) and 365+1>365;
select 366 as n, (366*3) as score, N'payload 00366 - kiểm thử dấu phẩy; -- Unicode' as payload where (366 between 1 and 1500) and 366+1>366;
select 367 as n, (367*3) as score, N'payload 00367 - kiểm thử dấu phẩy; -- Unicode' as payload where (367 between 1 and 1500) and 367+1>367;
select 368 as n, (368*3) as score, N'payload 00368 - kiểm thử dấu phẩy; -- Unicode' as payload where (368 between 1 and 1500) and 368+1>368;
select 369 as n, (369*3) as score, N'payload 00369 - kiểm thử dấu phẩy; -- Unicode' as payload where (369 between 1 and 1500) and 369+1>369;
select 370 as n, (370*3) as score, N'payload 00370 - kiểm thử dấu phẩy; -- Unicode' as payload where (370 between 1 and 1500) and 370+1>370;
select 371 as n, (371*3) as score, N'payload 00371 - kiểm thử dấu phẩy; -- Unicode' as payload where (371 between 1 and 1500) and 371+1>371;
select 372 as n, (372*3) as score, N'payload 00372 - kiểm thử dấu phẩy; -- Unicode' as payload where (372 between 1 and 1500) and 372+1>372;
select 373 as n, (373*3) as score, N'payload 00373 - kiểm thử dấu phẩy; -- Unicode' as payload where (373 between 1 and 1500) and 373+1>373;
select 374 as n, (374*3) as score, N'payload 00374 - kiểm thử dấu phẩy; -- Unicode' as payload where (374 between 1 and 1500) and 374+1>374;
select 375 as n, (375*3) as score, N'payload 00375 - kiểm thử dấu phẩy; -- Unicode' as payload where (375 between 1 and 1500) and 375+1>375;
select 376 as n, (376*3) as score, N'payload 00376 - kiểm thử dấu phẩy; -- Unicode' as payload where (376 between 1 and 1500) and 376+1>376;
select 377 as n, (377*3) as score, N'payload 00377 - kiểm thử dấu phẩy; -- Unicode' as payload where (377 between 1 and 1500) and 377+1>377;
select 378 as n, (378*3) as score, N'payload 00378 - kiểm thử dấu phẩy; -- Unicode' as payload where (378 between 1 and 1500) and 378+1>378;
select 379 as n, (379*3) as score, N'payload 00379 - kiểm thử dấu phẩy; -- Unicode' as payload where (379 between 1 and 1500) and 379+1>379;
select 380 as n, (380*3) as score, N'payload 00380 - kiểm thử dấu phẩy; -- Unicode' as payload where (380 between 1 and 1500) and 380+1>380;
select 381 as n, (381*3) as score, N'payload 00381 - kiểm thử dấu phẩy; -- Unicode' as payload where (381 between 1 and 1500) and 381+1>381;
select 382 as n, (382*3) as score, N'payload 00382 - kiểm thử dấu phẩy; -- Unicode' as payload where (382 between 1 and 1500) and 382+1>382;
select 383 as n, (383*3) as score, N'payload 00383 - kiểm thử dấu phẩy; -- Unicode' as payload where (383 between 1 and 1500) and 383+1>383;
select 384 as n, (384*3) as score, N'payload 00384 - kiểm thử dấu phẩy; -- Unicode' as payload where (384 between 1 and 1500) and 384+1>384;
select 385 as n, (385*3) as score, N'payload 00385 - kiểm thử dấu phẩy; -- Unicode' as payload where (385 between 1 and 1500) and 385+1>385;
select 386 as n, (386*3) as score, N'payload 00386 - kiểm thử dấu phẩy; -- Unicode' as payload where (386 between 1 and 1500) and 386+1>386;
select 387 as n, (387*3) as score, N'payload 00387 - kiểm thử dấu phẩy; -- Unicode' as payload where (387 between 1 and 1500) and 387+1>387;
select 388 as n, (388*3) as score, N'payload 00388 - kiểm thử dấu phẩy; -- Unicode' as payload where (388 between 1 and 1500) and 388+1>388;
select 389 as n, (389*3) as score, N'payload 00389 - kiểm thử dấu phẩy; -- Unicode' as payload where (389 between 1 and 1500) and 389+1>389;
select 390 as n, (390*3) as score, N'payload 00390 - kiểm thử dấu phẩy; -- Unicode' as payload where (390 between 1 and 1500) and 390+1>390;
select 391 as n, (391*3) as score, N'payload 00391 - kiểm thử dấu phẩy; -- Unicode' as payload where (391 between 1 and 1500) and 391+1>391;
select 392 as n, (392*3) as score, N'payload 00392 - kiểm thử dấu phẩy; -- Unicode' as payload where (392 between 1 and 1500) and 392+1>392;
select 393 as n, (393*3) as score, N'payload 00393 - kiểm thử dấu phẩy; -- Unicode' as payload where (393 between 1 and 1500) and 393+1>393;
select 394 as n, (394*3) as score, N'payload 00394 - kiểm thử dấu phẩy; -- Unicode' as payload where (394 between 1 and 1500) and 394+1>394;
select 395 as n, (395*3) as score, N'payload 00395 - kiểm thử dấu phẩy; -- Unicode' as payload where (395 between 1 and 1500) and 395+1>395;
select 396 as n, (396*3) as score, N'payload 00396 - kiểm thử dấu phẩy; -- Unicode' as payload where (396 between 1 and 1500) and 396+1>396;
select 397 as n, (397*3) as score, N'payload 00397 - kiểm thử dấu phẩy; -- Unicode' as payload where (397 between 1 and 1500) and 397+1>397;
select 398 as n, (398*3) as score, N'payload 00398 - kiểm thử dấu phẩy; -- Unicode' as payload where (398 between 1 and 1500) and 398+1>398;
select 399 as n, (399*3) as score, N'payload 00399 - kiểm thử dấu phẩy; -- Unicode' as payload where (399 between 1 and 1500) and 399+1>399;
select 400 as n, (400*3) as score, N'payload 00400 - kiểm thử dấu phẩy; -- Unicode' as payload where (400 between 1 and 1500) and 400+1>400;
select 401 as n, (401*3) as score, N'payload 00401 - kiểm thử dấu phẩy; -- Unicode' as payload where (401 between 1 and 1500) and 401+1>401;
select 402 as n, (402*3) as score, N'payload 00402 - kiểm thử dấu phẩy; -- Unicode' as payload where (402 between 1 and 1500) and 402+1>402;
select 403 as n, (403*3) as score, N'payload 00403 - kiểm thử dấu phẩy; -- Unicode' as payload where (403 between 1 and 1500) and 403+1>403;
select 404 as n, (404*3) as score, N'payload 00404 - kiểm thử dấu phẩy; -- Unicode' as payload where (404 between 1 and 1500) and 404+1>404;
select 405 as n, (405*3) as score, N'payload 00405 - kiểm thử dấu phẩy; -- Unicode' as payload where (405 between 1 and 1500) and 405+1>405;
select 406 as n, (406*3) as score, N'payload 00406 - kiểm thử dấu phẩy; -- Unicode' as payload where (406 between 1 and 1500) and 406+1>406;
select 407 as n, (407*3) as score, N'payload 00407 - kiểm thử dấu phẩy; -- Unicode' as payload where (407 between 1 and 1500) and 407+1>407;
select 408 as n, (408*3) as score, N'payload 00408 - kiểm thử dấu phẩy; -- Unicode' as payload where (408 between 1 and 1500) and 408+1>408;
select 409 as n, (409*3) as score, N'payload 00409 - kiểm thử dấu phẩy; -- Unicode' as payload where (409 between 1 and 1500) and 409+1>409;
select 410 as n, (410*3) as score, N'payload 00410 - kiểm thử dấu phẩy; -- Unicode' as payload where (410 between 1 and 1500) and 410+1>410;
select 411 as n, (411*3) as score, N'payload 00411 - kiểm thử dấu phẩy; -- Unicode' as payload where (411 between 1 and 1500) and 411+1>411;
select 412 as n, (412*3) as score, N'payload 00412 - kiểm thử dấu phẩy; -- Unicode' as payload where (412 between 1 and 1500) and 412+1>412;
select 413 as n, (413*3) as score, N'payload 00413 - kiểm thử dấu phẩy; -- Unicode' as payload where (413 between 1 and 1500) and 413+1>413;
select 414 as n, (414*3) as score, N'payload 00414 - kiểm thử dấu phẩy; -- Unicode' as payload where (414 between 1 and 1500) and 414+1>414;
select 415 as n, (415*3) as score, N'payload 00415 - kiểm thử dấu phẩy; -- Unicode' as payload where (415 between 1 and 1500) and 415+1>415;
select 416 as n, (416*3) as score, N'payload 00416 - kiểm thử dấu phẩy; -- Unicode' as payload where (416 between 1 and 1500) and 416+1>416;
select 417 as n, (417*3) as score, N'payload 00417 - kiểm thử dấu phẩy; -- Unicode' as payload where (417 between 1 and 1500) and 417+1>417;
select 418 as n, (418*3) as score, N'payload 00418 - kiểm thử dấu phẩy; -- Unicode' as payload where (418 between 1 and 1500) and 418+1>418;
select 419 as n, (419*3) as score, N'payload 00419 - kiểm thử dấu phẩy; -- Unicode' as payload where (419 between 1 and 1500) and 419+1>419;
select 420 as n, (420*3) as score, N'payload 00420 - kiểm thử dấu phẩy; -- Unicode' as payload where (420 between 1 and 1500) and 420+1>420;
select 421 as n, (421*3) as score, N'payload 00421 - kiểm thử dấu phẩy; -- Unicode' as payload where (421 between 1 and 1500) and 421+1>421;
select 422 as n, (422*3) as score, N'payload 00422 - kiểm thử dấu phẩy; -- Unicode' as payload where (422 between 1 and 1500) and 422+1>422;
select 423 as n, (423*3) as score, N'payload 00423 - kiểm thử dấu phẩy; -- Unicode' as payload where (423 between 1 and 1500) and 423+1>423;
select 424 as n, (424*3) as score, N'payload 00424 - kiểm thử dấu phẩy; -- Unicode' as payload where (424 between 1 and 1500) and 424+1>424;
select 425 as n, (425*3) as score, N'payload 00425 - kiểm thử dấu phẩy; -- Unicode' as payload where (425 between 1 and 1500) and 425+1>425;
select 426 as n, (426*3) as score, N'payload 00426 - kiểm thử dấu phẩy; -- Unicode' as payload where (426 between 1 and 1500) and 426+1>426;
select 427 as n, (427*3) as score, N'payload 00427 - kiểm thử dấu phẩy; -- Unicode' as payload where (427 between 1 and 1500) and 427+1>427;
select 428 as n, (428*3) as score, N'payload 00428 - kiểm thử dấu phẩy; -- Unicode' as payload where (428 between 1 and 1500) and 428+1>428;
select 429 as n, (429*3) as score, N'payload 00429 - kiểm thử dấu phẩy; -- Unicode' as payload where (429 between 1 and 1500) and 429+1>429;
select 430 as n, (430*3) as score, N'payload 00430 - kiểm thử dấu phẩy; -- Unicode' as payload where (430 between 1 and 1500) and 430+1>430;
select 431 as n, (431*3) as score, N'payload 00431 - kiểm thử dấu phẩy; -- Unicode' as payload where (431 between 1 and 1500) and 431+1>431;
select 432 as n, (432*3) as score, N'payload 00432 - kiểm thử dấu phẩy; -- Unicode' as payload where (432 between 1 and 1500) and 432+1>432;
select 433 as n, (433*3) as score, N'payload 00433 - kiểm thử dấu phẩy; -- Unicode' as payload where (433 between 1 and 1500) and 433+1>433;
select 434 as n, (434*3) as score, N'payload 00434 - kiểm thử dấu phẩy; -- Unicode' as payload where (434 between 1 and 1500) and 434+1>434;
select 435 as n, (435*3) as score, N'payload 00435 - kiểm thử dấu phẩy; -- Unicode' as payload where (435 between 1 and 1500) and 435+1>435;
select 436 as n, (436*3) as score, N'payload 00436 - kiểm thử dấu phẩy; -- Unicode' as payload where (436 between 1 and 1500) and 436+1>436;
select 437 as n, (437*3) as score, N'payload 00437 - kiểm thử dấu phẩy; -- Unicode' as payload where (437 between 1 and 1500) and 437+1>437;
select 438 as n, (438*3) as score, N'payload 00438 - kiểm thử dấu phẩy; -- Unicode' as payload where (438 between 1 and 1500) and 438+1>438;
select 439 as n, (439*3) as score, N'payload 00439 - kiểm thử dấu phẩy; -- Unicode' as payload where (439 between 1 and 1500) and 439+1>439;
select 440 as n, (440*3) as score, N'payload 00440 - kiểm thử dấu phẩy; -- Unicode' as payload where (440 between 1 and 1500) and 440+1>440;
select 441 as n, (441*3) as score, N'payload 00441 - kiểm thử dấu phẩy; -- Unicode' as payload where (441 between 1 and 1500) and 441+1>441;
select 442 as n, (442*3) as score, N'payload 00442 - kiểm thử dấu phẩy; -- Unicode' as payload where (442 between 1 and 1500) and 442+1>442;
select 443 as n, (443*3) as score, N'payload 00443 - kiểm thử dấu phẩy; -- Unicode' as payload where (443 between 1 and 1500) and 443+1>443;
select 444 as n, (444*3) as score, N'payload 00444 - kiểm thử dấu phẩy; -- Unicode' as payload where (444 between 1 and 1500) and 444+1>444;
select 445 as n, (445*3) as score, N'payload 00445 - kiểm thử dấu phẩy; -- Unicode' as payload where (445 between 1 and 1500) and 445+1>445;
select 446 as n, (446*3) as score, N'payload 00446 - kiểm thử dấu phẩy; -- Unicode' as payload where (446 between 1 and 1500) and 446+1>446;
select 447 as n, (447*3) as score, N'payload 00447 - kiểm thử dấu phẩy; -- Unicode' as payload where (447 between 1 and 1500) and 447+1>447;
select 448 as n, (448*3) as score, N'payload 00448 - kiểm thử dấu phẩy; -- Unicode' as payload where (448 between 1 and 1500) and 448+1>448;
select 449 as n, (449*3) as score, N'payload 00449 - kiểm thử dấu phẩy; -- Unicode' as payload where (449 between 1 and 1500) and 449+1>449;
select 450 as n, (450*3) as score, N'payload 00450 - kiểm thử dấu phẩy; -- Unicode' as payload where (450 between 1 and 1500) and 450+1>450;
select 451 as n, (451*3) as score, N'payload 00451 - kiểm thử dấu phẩy; -- Unicode' as payload where (451 between 1 and 1500) and 451+1>451;
select 452 as n, (452*3) as score, N'payload 00452 - kiểm thử dấu phẩy; -- Unicode' as payload where (452 between 1 and 1500) and 452+1>452;
select 453 as n, (453*3) as score, N'payload 00453 - kiểm thử dấu phẩy; -- Unicode' as payload where (453 between 1 and 1500) and 453+1>453;
select 454 as n, (454*3) as score, N'payload 00454 - kiểm thử dấu phẩy; -- Unicode' as payload where (454 between 1 and 1500) and 454+1>454;
select 455 as n, (455*3) as score, N'payload 00455 - kiểm thử dấu phẩy; -- Unicode' as payload where (455 between 1 and 1500) and 455+1>455;
select 456 as n, (456*3) as score, N'payload 00456 - kiểm thử dấu phẩy; -- Unicode' as payload where (456 between 1 and 1500) and 456+1>456;
select 457 as n, (457*3) as score, N'payload 00457 - kiểm thử dấu phẩy; -- Unicode' as payload where (457 between 1 and 1500) and 457+1>457;
select 458 as n, (458*3) as score, N'payload 00458 - kiểm thử dấu phẩy; -- Unicode' as payload where (458 between 1 and 1500) and 458+1>458;
select 459 as n, (459*3) as score, N'payload 00459 - kiểm thử dấu phẩy; -- Unicode' as payload where (459 between 1 and 1500) and 459+1>459;
select 460 as n, (460*3) as score, N'payload 00460 - kiểm thử dấu phẩy; -- Unicode' as payload where (460 between 1 and 1500) and 460+1>460;
select 461 as n, (461*3) as score, N'payload 00461 - kiểm thử dấu phẩy; -- Unicode' as payload where (461 between 1 and 1500) and 461+1>461;
select 462 as n, (462*3) as score, N'payload 00462 - kiểm thử dấu phẩy; -- Unicode' as payload where (462 between 1 and 1500) and 462+1>462;
select 463 as n, (463*3) as score, N'payload 00463 - kiểm thử dấu phẩy; -- Unicode' as payload where (463 between 1 and 1500) and 463+1>463;
select 464 as n, (464*3) as score, N'payload 00464 - kiểm thử dấu phẩy; -- Unicode' as payload where (464 between 1 and 1500) and 464+1>464;
select 465 as n, (465*3) as score, N'payload 00465 - kiểm thử dấu phẩy; -- Unicode' as payload where (465 between 1 and 1500) and 465+1>465;
select 466 as n, (466*3) as score, N'payload 00466 - kiểm thử dấu phẩy; -- Unicode' as payload where (466 between 1 and 1500) and 466+1>466;
select 467 as n, (467*3) as score, N'payload 00467 - kiểm thử dấu phẩy; -- Unicode' as payload where (467 between 1 and 1500) and 467+1>467;
select 468 as n, (468*3) as score, N'payload 00468 - kiểm thử dấu phẩy; -- Unicode' as payload where (468 between 1 and 1500) and 468+1>468;
select 469 as n, (469*3) as score, N'payload 00469 - kiểm thử dấu phẩy; -- Unicode' as payload where (469 between 1 and 1500) and 469+1>469;
select 470 as n, (470*3) as score, N'payload 00470 - kiểm thử dấu phẩy; -- Unicode' as payload where (470 between 1 and 1500) and 470+1>470;
select 471 as n, (471*3) as score, N'payload 00471 - kiểm thử dấu phẩy; -- Unicode' as payload where (471 between 1 and 1500) and 471+1>471;
select 472 as n, (472*3) as score, N'payload 00472 - kiểm thử dấu phẩy; -- Unicode' as payload where (472 between 1 and 1500) and 472+1>472;
select 473 as n, (473*3) as score, N'payload 00473 - kiểm thử dấu phẩy; -- Unicode' as payload where (473 between 1 and 1500) and 473+1>473;
select 474 as n, (474*3) as score, N'payload 00474 - kiểm thử dấu phẩy; -- Unicode' as payload where (474 between 1 and 1500) and 474+1>474;
select 475 as n, (475*3) as score, N'payload 00475 - kiểm thử dấu phẩy; -- Unicode' as payload where (475 between 1 and 1500) and 475+1>475;
select 476 as n, (476*3) as score, N'payload 00476 - kiểm thử dấu phẩy; -- Unicode' as payload where (476 between 1 and 1500) and 476+1>476;
select 477 as n, (477*3) as score, N'payload 00477 - kiểm thử dấu phẩy; -- Unicode' as payload where (477 between 1 and 1500) and 477+1>477;
select 478 as n, (478*3) as score, N'payload 00478 - kiểm thử dấu phẩy; -- Unicode' as payload where (478 between 1 and 1500) and 478+1>478;
select 479 as n, (479*3) as score, N'payload 00479 - kiểm thử dấu phẩy; -- Unicode' as payload where (479 between 1 and 1500) and 479+1>479;
select 480 as n, (480*3) as score, N'payload 00480 - kiểm thử dấu phẩy; -- Unicode' as payload where (480 between 1 and 1500) and 480+1>480;
select 481 as n, (481*3) as score, N'payload 00481 - kiểm thử dấu phẩy; -- Unicode' as payload where (481 between 1 and 1500) and 481+1>481;
select 482 as n, (482*3) as score, N'payload 00482 - kiểm thử dấu phẩy; -- Unicode' as payload where (482 between 1 and 1500) and 482+1>482;
select 483 as n, (483*3) as score, N'payload 00483 - kiểm thử dấu phẩy; -- Unicode' as payload where (483 between 1 and 1500) and 483+1>483;
select 484 as n, (484*3) as score, N'payload 00484 - kiểm thử dấu phẩy; -- Unicode' as payload where (484 between 1 and 1500) and 484+1>484;
select 485 as n, (485*3) as score, N'payload 00485 - kiểm thử dấu phẩy; -- Unicode' as payload where (485 between 1 and 1500) and 485+1>485;
select 486 as n, (486*3) as score, N'payload 00486 - kiểm thử dấu phẩy; -- Unicode' as payload where (486 between 1 and 1500) and 486+1>486;
select 487 as n, (487*3) as score, N'payload 00487 - kiểm thử dấu phẩy; -- Unicode' as payload where (487 between 1 and 1500) and 487+1>487;
select 488 as n, (488*3) as score, N'payload 00488 - kiểm thử dấu phẩy; -- Unicode' as payload where (488 between 1 and 1500) and 488+1>488;
select 489 as n, (489*3) as score, N'payload 00489 - kiểm thử dấu phẩy; -- Unicode' as payload where (489 between 1 and 1500) and 489+1>489;
select 490 as n, (490*3) as score, N'payload 00490 - kiểm thử dấu phẩy; -- Unicode' as payload where (490 between 1 and 1500) and 490+1>490;
select 491 as n, (491*3) as score, N'payload 00491 - kiểm thử dấu phẩy; -- Unicode' as payload where (491 between 1 and 1500) and 491+1>491;
select 492 as n, (492*3) as score, N'payload 00492 - kiểm thử dấu phẩy; -- Unicode' as payload where (492 between 1 and 1500) and 492+1>492;
select 493 as n, (493*3) as score, N'payload 00493 - kiểm thử dấu phẩy; -- Unicode' as payload where (493 between 1 and 1500) and 493+1>493;
select 494 as n, (494*3) as score, N'payload 00494 - kiểm thử dấu phẩy; -- Unicode' as payload where (494 between 1 and 1500) and 494+1>494;
select 495 as n, (495*3) as score, N'payload 00495 - kiểm thử dấu phẩy; -- Unicode' as payload where (495 between 1 and 1500) and 495+1>495;
select 496 as n, (496*3) as score, N'payload 00496 - kiểm thử dấu phẩy; -- Unicode' as payload where (496 between 1 and 1500) and 496+1>496;
select 497 as n, (497*3) as score, N'payload 00497 - kiểm thử dấu phẩy; -- Unicode' as payload where (497 between 1 and 1500) and 497+1>497;
select 498 as n, (498*3) as score, N'payload 00498 - kiểm thử dấu phẩy; -- Unicode' as payload where (498 between 1 and 1500) and 498+1>498;
select 499 as n, (499*3) as score, N'payload 00499 - kiểm thử dấu phẩy; -- Unicode' as payload where (499 between 1 and 1500) and 499+1>499;
select 500 as n, (500*3) as score, N'payload 00500 - kiểm thử dấu phẩy; -- Unicode' as payload where (500 between 1 and 1500) and 500+1>500;
select 501 as n, (501*3) as score, N'payload 00501 - kiểm thử dấu phẩy; -- Unicode' as payload where (501 between 1 and 1500) and 501+1>501;
select 502 as n, (502*3) as score, N'payload 00502 - kiểm thử dấu phẩy; -- Unicode' as payload where (502 between 1 and 1500) and 502+1>502;
select 503 as n, (503*3) as score, N'payload 00503 - kiểm thử dấu phẩy; -- Unicode' as payload where (503 between 1 and 1500) and 503+1>503;
select 504 as n, (504*3) as score, N'payload 00504 - kiểm thử dấu phẩy; -- Unicode' as payload where (504 between 1 and 1500) and 504+1>504;
select 505 as n, (505*3) as score, N'payload 00505 - kiểm thử dấu phẩy; -- Unicode' as payload where (505 between 1 and 1500) and 505+1>505;
select 506 as n, (506*3) as score, N'payload 00506 - kiểm thử dấu phẩy; -- Unicode' as payload where (506 between 1 and 1500) and 506+1>506;
select 507 as n, (507*3) as score, N'payload 00507 - kiểm thử dấu phẩy; -- Unicode' as payload where (507 between 1 and 1500) and 507+1>507;
select 508 as n, (508*3) as score, N'payload 00508 - kiểm thử dấu phẩy; -- Unicode' as payload where (508 between 1 and 1500) and 508+1>508;
select 509 as n, (509*3) as score, N'payload 00509 - kiểm thử dấu phẩy; -- Unicode' as payload where (509 between 1 and 1500) and 509+1>509;
select 510 as n, (510*3) as score, N'payload 00510 - kiểm thử dấu phẩy; -- Unicode' as payload where (510 between 1 and 1500) and 510+1>510;
select 511 as n, (511*3) as score, N'payload 00511 - kiểm thử dấu phẩy; -- Unicode' as payload where (511 between 1 and 1500) and 511+1>511;
select 512 as n, (512*3) as score, N'payload 00512 - kiểm thử dấu phẩy; -- Unicode' as payload where (512 between 1 and 1500) and 512+1>512;
select 513 as n, (513*3) as score, N'payload 00513 - kiểm thử dấu phẩy; -- Unicode' as payload where (513 between 1 and 1500) and 513+1>513;
select 514 as n, (514*3) as score, N'payload 00514 - kiểm thử dấu phẩy; -- Unicode' as payload where (514 between 1 and 1500) and 514+1>514;
select 515 as n, (515*3) as score, N'payload 00515 - kiểm thử dấu phẩy; -- Unicode' as payload where (515 between 1 and 1500) and 515+1>515;
select 516 as n, (516*3) as score, N'payload 00516 - kiểm thử dấu phẩy; -- Unicode' as payload where (516 between 1 and 1500) and 516+1>516;
select 517 as n, (517*3) as score, N'payload 00517 - kiểm thử dấu phẩy; -- Unicode' as payload where (517 between 1 and 1500) and 517+1>517;
select 518 as n, (518*3) as score, N'payload 00518 - kiểm thử dấu phẩy; -- Unicode' as payload where (518 between 1 and 1500) and 518+1>518;
select 519 as n, (519*3) as score, N'payload 00519 - kiểm thử dấu phẩy; -- Unicode' as payload where (519 between 1 and 1500) and 519+1>519;
select 520 as n, (520*3) as score, N'payload 00520 - kiểm thử dấu phẩy; -- Unicode' as payload where (520 between 1 and 1500) and 520+1>520;
select 521 as n, (521*3) as score, N'payload 00521 - kiểm thử dấu phẩy; -- Unicode' as payload where (521 between 1 and 1500) and 521+1>521;
select 522 as n, (522*3) as score, N'payload 00522 - kiểm thử dấu phẩy; -- Unicode' as payload where (522 between 1 and 1500) and 522+1>522;
select 523 as n, (523*3) as score, N'payload 00523 - kiểm thử dấu phẩy; -- Unicode' as payload where (523 between 1 and 1500) and 523+1>523;
select 524 as n, (524*3) as score, N'payload 00524 - kiểm thử dấu phẩy; -- Unicode' as payload where (524 between 1 and 1500) and 524+1>524;
select 525 as n, (525*3) as score, N'payload 00525 - kiểm thử dấu phẩy; -- Unicode' as payload where (525 between 1 and 1500) and 525+1>525;
select 526 as n, (526*3) as score, N'payload 00526 - kiểm thử dấu phẩy; -- Unicode' as payload where (526 between 1 and 1500) and 526+1>526;
select 527 as n, (527*3) as score, N'payload 00527 - kiểm thử dấu phẩy; -- Unicode' as payload where (527 between 1 and 1500) and 527+1>527;
select 528 as n, (528*3) as score, N'payload 00528 - kiểm thử dấu phẩy; -- Unicode' as payload where (528 between 1 and 1500) and 528+1>528;
select 529 as n, (529*3) as score, N'payload 00529 - kiểm thử dấu phẩy; -- Unicode' as payload where (529 between 1 and 1500) and 529+1>529;
select 530 as n, (530*3) as score, N'payload 00530 - kiểm thử dấu phẩy; -- Unicode' as payload where (530 between 1 and 1500) and 530+1>530;
select 531 as n, (531*3) as score, N'payload 00531 - kiểm thử dấu phẩy; -- Unicode' as payload where (531 between 1 and 1500) and 531+1>531;
select 532 as n, (532*3) as score, N'payload 00532 - kiểm thử dấu phẩy; -- Unicode' as payload where (532 between 1 and 1500) and 532+1>532;
select 533 as n, (533*3) as score, N'payload 00533 - kiểm thử dấu phẩy; -- Unicode' as payload where (533 between 1 and 1500) and 533+1>533;
select 534 as n, (534*3) as score, N'payload 00534 - kiểm thử dấu phẩy; -- Unicode' as payload where (534 between 1 and 1500) and 534+1>534;
select 535 as n, (535*3) as score, N'payload 00535 - kiểm thử dấu phẩy; -- Unicode' as payload where (535 between 1 and 1500) and 535+1>535;
select 536 as n, (536*3) as score, N'payload 00536 - kiểm thử dấu phẩy; -- Unicode' as payload where (536 between 1 and 1500) and 536+1>536;
select 537 as n, (537*3) as score, N'payload 00537 - kiểm thử dấu phẩy; -- Unicode' as payload where (537 between 1 and 1500) and 537+1>537;
select 538 as n, (538*3) as score, N'payload 00538 - kiểm thử dấu phẩy; -- Unicode' as payload where (538 between 1 and 1500) and 538+1>538;
select 539 as n, (539*3) as score, N'payload 00539 - kiểm thử dấu phẩy; -- Unicode' as payload where (539 between 1 and 1500) and 539+1>539;
select 540 as n, (540*3) as score, N'payload 00540 - kiểm thử dấu phẩy; -- Unicode' as payload where (540 between 1 and 1500) and 540+1>540;
select 541 as n, (541*3) as score, N'payload 00541 - kiểm thử dấu phẩy; -- Unicode' as payload where (541 between 1 and 1500) and 541+1>541;
select 542 as n, (542*3) as score, N'payload 00542 - kiểm thử dấu phẩy; -- Unicode' as payload where (542 between 1 and 1500) and 542+1>542;
select 543 as n, (543*3) as score, N'payload 00543 - kiểm thử dấu phẩy; -- Unicode' as payload where (543 between 1 and 1500) and 543+1>543;
select 544 as n, (544*3) as score, N'payload 00544 - kiểm thử dấu phẩy; -- Unicode' as payload where (544 between 1 and 1500) and 544+1>544;
select 545 as n, (545*3) as score, N'payload 00545 - kiểm thử dấu phẩy; -- Unicode' as payload where (545 between 1 and 1500) and 545+1>545;
select 546 as n, (546*3) as score, N'payload 00546 - kiểm thử dấu phẩy; -- Unicode' as payload where (546 between 1 and 1500) and 546+1>546;
select 547 as n, (547*3) as score, N'payload 00547 - kiểm thử dấu phẩy; -- Unicode' as payload where (547 between 1 and 1500) and 547+1>547;
select 548 as n, (548*3) as score, N'payload 00548 - kiểm thử dấu phẩy; -- Unicode' as payload where (548 between 1 and 1500) and 548+1>548;
select 549 as n, (549*3) as score, N'payload 00549 - kiểm thử dấu phẩy; -- Unicode' as payload where (549 between 1 and 1500) and 549+1>549;
select 550 as n, (550*3) as score, N'payload 00550 - kiểm thử dấu phẩy; -- Unicode' as payload where (550 between 1 and 1500) and 550+1>550;
select 551 as n, (551*3) as score, N'payload 00551 - kiểm thử dấu phẩy; -- Unicode' as payload where (551 between 1 and 1500) and 551+1>551;
select 552 as n, (552*3) as score, N'payload 00552 - kiểm thử dấu phẩy; -- Unicode' as payload where (552 between 1 and 1500) and 552+1>552;
select 553 as n, (553*3) as score, N'payload 00553 - kiểm thử dấu phẩy; -- Unicode' as payload where (553 between 1 and 1500) and 553+1>553;
select 554 as n, (554*3) as score, N'payload 00554 - kiểm thử dấu phẩy; -- Unicode' as payload where (554 between 1 and 1500) and 554+1>554;
select 555 as n, (555*3) as score, N'payload 00555 - kiểm thử dấu phẩy; -- Unicode' as payload where (555 between 1 and 1500) and 555+1>555;
select 556 as n, (556*3) as score, N'payload 00556 - kiểm thử dấu phẩy; -- Unicode' as payload where (556 between 1 and 1500) and 556+1>556;
select 557 as n, (557*3) as score, N'payload 00557 - kiểm thử dấu phẩy; -- Unicode' as payload where (557 between 1 and 1500) and 557+1>557;
select 558 as n, (558*3) as score, N'payload 00558 - kiểm thử dấu phẩy; -- Unicode' as payload where (558 between 1 and 1500) and 558+1>558;
select 559 as n, (559*3) as score, N'payload 00559 - kiểm thử dấu phẩy; -- Unicode' as payload where (559 between 1 and 1500) and 559+1>559;
select 560 as n, (560*3) as score, N'payload 00560 - kiểm thử dấu phẩy; -- Unicode' as payload where (560 between 1 and 1500) and 560+1>560;
select 561 as n, (561*3) as score, N'payload 00561 - kiểm thử dấu phẩy; -- Unicode' as payload where (561 between 1 and 1500) and 561+1>561;
select 562 as n, (562*3) as score, N'payload 00562 - kiểm thử dấu phẩy; -- Unicode' as payload where (562 between 1 and 1500) and 562+1>562;
select 563 as n, (563*3) as score, N'payload 00563 - kiểm thử dấu phẩy; -- Unicode' as payload where (563 between 1 and 1500) and 563+1>563;
select 564 as n, (564*3) as score, N'payload 00564 - kiểm thử dấu phẩy; -- Unicode' as payload where (564 between 1 and 1500) and 564+1>564;
select 565 as n, (565*3) as score, N'payload 00565 - kiểm thử dấu phẩy; -- Unicode' as payload where (565 between 1 and 1500) and 565+1>565;
select 566 as n, (566*3) as score, N'payload 00566 - kiểm thử dấu phẩy; -- Unicode' as payload where (566 between 1 and 1500) and 566+1>566;
select 567 as n, (567*3) as score, N'payload 00567 - kiểm thử dấu phẩy; -- Unicode' as payload where (567 between 1 and 1500) and 567+1>567;
select 568 as n, (568*3) as score, N'payload 00568 - kiểm thử dấu phẩy; -- Unicode' as payload where (568 between 1 and 1500) and 568+1>568;
select 569 as n, (569*3) as score, N'payload 00569 - kiểm thử dấu phẩy; -- Unicode' as payload where (569 between 1 and 1500) and 569+1>569;
select 570 as n, (570*3) as score, N'payload 00570 - kiểm thử dấu phẩy; -- Unicode' as payload where (570 between 1 and 1500) and 570+1>570;
select 571 as n, (571*3) as score, N'payload 00571 - kiểm thử dấu phẩy; -- Unicode' as payload where (571 between 1 and 1500) and 571+1>571;
select 572 as n, (572*3) as score, N'payload 00572 - kiểm thử dấu phẩy; -- Unicode' as payload where (572 between 1 and 1500) and 572+1>572;
select 573 as n, (573*3) as score, N'payload 00573 - kiểm thử dấu phẩy; -- Unicode' as payload where (573 between 1 and 1500) and 573+1>573;
select 574 as n, (574*3) as score, N'payload 00574 - kiểm thử dấu phẩy; -- Unicode' as payload where (574 between 1 and 1500) and 574+1>574;
select 575 as n, (575*3) as score, N'payload 00575 - kiểm thử dấu phẩy; -- Unicode' as payload where (575 between 1 and 1500) and 575+1>575;
select 576 as n, (576*3) as score, N'payload 00576 - kiểm thử dấu phẩy; -- Unicode' as payload where (576 between 1 and 1500) and 576+1>576;
select 577 as n, (577*3) as score, N'payload 00577 - kiểm thử dấu phẩy; -- Unicode' as payload where (577 between 1 and 1500) and 577+1>577;
select 578 as n, (578*3) as score, N'payload 00578 - kiểm thử dấu phẩy; -- Unicode' as payload where (578 between 1 and 1500) and 578+1>578;
select 579 as n, (579*3) as score, N'payload 00579 - kiểm thử dấu phẩy; -- Unicode' as payload where (579 between 1 and 1500) and 579+1>579;
select 580 as n, (580*3) as score, N'payload 00580 - kiểm thử dấu phẩy; -- Unicode' as payload where (580 between 1 and 1500) and 580+1>580;
select 581 as n, (581*3) as score, N'payload 00581 - kiểm thử dấu phẩy; -- Unicode' as payload where (581 between 1 and 1500) and 581+1>581;
select 582 as n, (582*3) as score, N'payload 00582 - kiểm thử dấu phẩy; -- Unicode' as payload where (582 between 1 and 1500) and 582+1>582;
select 583 as n, (583*3) as score, N'payload 00583 - kiểm thử dấu phẩy; -- Unicode' as payload where (583 between 1 and 1500) and 583+1>583;
select 584 as n, (584*3) as score, N'payload 00584 - kiểm thử dấu phẩy; -- Unicode' as payload where (584 between 1 and 1500) and 584+1>584;
select 585 as n, (585*3) as score, N'payload 00585 - kiểm thử dấu phẩy; -- Unicode' as payload where (585 between 1 and 1500) and 585+1>585;
select 586 as n, (586*3) as score, N'payload 00586 - kiểm thử dấu phẩy; -- Unicode' as payload where (586 between 1 and 1500) and 586+1>586;
select 587 as n, (587*3) as score, N'payload 00587 - kiểm thử dấu phẩy; -- Unicode' as payload where (587 between 1 and 1500) and 587+1>587;
select 588 as n, (588*3) as score, N'payload 00588 - kiểm thử dấu phẩy; -- Unicode' as payload where (588 between 1 and 1500) and 588+1>588;
select 589 as n, (589*3) as score, N'payload 00589 - kiểm thử dấu phẩy; -- Unicode' as payload where (589 between 1 and 1500) and 589+1>589;
select 590 as n, (590*3) as score, N'payload 00590 - kiểm thử dấu phẩy; -- Unicode' as payload where (590 between 1 and 1500) and 590+1>590;
select 591 as n, (591*3) as score, N'payload 00591 - kiểm thử dấu phẩy; -- Unicode' as payload where (591 between 1 and 1500) and 591+1>591;
select 592 as n, (592*3) as score, N'payload 00592 - kiểm thử dấu phẩy; -- Unicode' as payload where (592 between 1 and 1500) and 592+1>592;
select 593 as n, (593*3) as score, N'payload 00593 - kiểm thử dấu phẩy; -- Unicode' as payload where (593 between 1 and 1500) and 593+1>593;
select 594 as n, (594*3) as score, N'payload 00594 - kiểm thử dấu phẩy; -- Unicode' as payload where (594 between 1 and 1500) and 594+1>594;
select 595 as n, (595*3) as score, N'payload 00595 - kiểm thử dấu phẩy; -- Unicode' as payload where (595 between 1 and 1500) and 595+1>595;
select 596 as n, (596*3) as score, N'payload 00596 - kiểm thử dấu phẩy; -- Unicode' as payload where (596 between 1 and 1500) and 596+1>596;
select 597 as n, (597*3) as score, N'payload 00597 - kiểm thử dấu phẩy; -- Unicode' as payload where (597 between 1 and 1500) and 597+1>597;
select 598 as n, (598*3) as score, N'payload 00598 - kiểm thử dấu phẩy; -- Unicode' as payload where (598 between 1 and 1500) and 598+1>598;
select 599 as n, (599*3) as score, N'payload 00599 - kiểm thử dấu phẩy; -- Unicode' as payload where (599 between 1 and 1500) and 599+1>599;
select 600 as n, (600*3) as score, N'payload 00600 - kiểm thử dấu phẩy; -- Unicode' as payload where (600 between 1 and 1500) and 600+1>600;
select 601 as n, (601*3) as score, N'payload 00601 - kiểm thử dấu phẩy; -- Unicode' as payload where (601 between 1 and 1500) and 601+1>601;
select 602 as n, (602*3) as score, N'payload 00602 - kiểm thử dấu phẩy; -- Unicode' as payload where (602 between 1 and 1500) and 602+1>602;
select 603 as n, (603*3) as score, N'payload 00603 - kiểm thử dấu phẩy; -- Unicode' as payload where (603 between 1 and 1500) and 603+1>603;
select 604 as n, (604*3) as score, N'payload 00604 - kiểm thử dấu phẩy; -- Unicode' as payload where (604 between 1 and 1500) and 604+1>604;
select 605 as n, (605*3) as score, N'payload 00605 - kiểm thử dấu phẩy; -- Unicode' as payload where (605 between 1 and 1500) and 605+1>605;
select 606 as n, (606*3) as score, N'payload 00606 - kiểm thử dấu phẩy; -- Unicode' as payload where (606 between 1 and 1500) and 606+1>606;
select 607 as n, (607*3) as score, N'payload 00607 - kiểm thử dấu phẩy; -- Unicode' as payload where (607 between 1 and 1500) and 607+1>607;
select 608 as n, (608*3) as score, N'payload 00608 - kiểm thử dấu phẩy; -- Unicode' as payload where (608 between 1 and 1500) and 608+1>608;
select 609 as n, (609*3) as score, N'payload 00609 - kiểm thử dấu phẩy; -- Unicode' as payload where (609 between 1 and 1500) and 609+1>609;
select 610 as n, (610*3) as score, N'payload 00610 - kiểm thử dấu phẩy; -- Unicode' as payload where (610 between 1 and 1500) and 610+1>610;
select 611 as n, (611*3) as score, N'payload 00611 - kiểm thử dấu phẩy; -- Unicode' as payload where (611 between 1 and 1500) and 611+1>611;
select 612 as n, (612*3) as score, N'payload 00612 - kiểm thử dấu phẩy; -- Unicode' as payload where (612 between 1 and 1500) and 612+1>612;
select 613 as n, (613*3) as score, N'payload 00613 - kiểm thử dấu phẩy; -- Unicode' as payload where (613 between 1 and 1500) and 613+1>613;
select 614 as n, (614*3) as score, N'payload 00614 - kiểm thử dấu phẩy; -- Unicode' as payload where (614 between 1 and 1500) and 614+1>614;
select 615 as n, (615*3) as score, N'payload 00615 - kiểm thử dấu phẩy; -- Unicode' as payload where (615 between 1 and 1500) and 615+1>615;
select 616 as n, (616*3) as score, N'payload 00616 - kiểm thử dấu phẩy; -- Unicode' as payload where (616 between 1 and 1500) and 616+1>616;
select 617 as n, (617*3) as score, N'payload 00617 - kiểm thử dấu phẩy; -- Unicode' as payload where (617 between 1 and 1500) and 617+1>617;
select 618 as n, (618*3) as score, N'payload 00618 - kiểm thử dấu phẩy; -- Unicode' as payload where (618 between 1 and 1500) and 618+1>618;
select 619 as n, (619*3) as score, N'payload 00619 - kiểm thử dấu phẩy; -- Unicode' as payload where (619 between 1 and 1500) and 619+1>619;
select 620 as n, (620*3) as score, N'payload 00620 - kiểm thử dấu phẩy; -- Unicode' as payload where (620 between 1 and 1500) and 620+1>620;
select 621 as n, (621*3) as score, N'payload 00621 - kiểm thử dấu phẩy; -- Unicode' as payload where (621 between 1 and 1500) and 621+1>621;
select 622 as n, (622*3) as score, N'payload 00622 - kiểm thử dấu phẩy; -- Unicode' as payload where (622 between 1 and 1500) and 622+1>622;
select 623 as n, (623*3) as score, N'payload 00623 - kiểm thử dấu phẩy; -- Unicode' as payload where (623 between 1 and 1500) and 623+1>623;
select 624 as n, (624*3) as score, N'payload 00624 - kiểm thử dấu phẩy; -- Unicode' as payload where (624 between 1 and 1500) and 624+1>624;
select 625 as n, (625*3) as score, N'payload 00625 - kiểm thử dấu phẩy; -- Unicode' as payload where (625 between 1 and 1500) and 625+1>625;
select 626 as n, (626*3) as score, N'payload 00626 - kiểm thử dấu phẩy; -- Unicode' as payload where (626 between 1 and 1500) and 626+1>626;
select 627 as n, (627*3) as score, N'payload 00627 - kiểm thử dấu phẩy; -- Unicode' as payload where (627 between 1 and 1500) and 627+1>627;
select 628 as n, (628*3) as score, N'payload 00628 - kiểm thử dấu phẩy; -- Unicode' as payload where (628 between 1 and 1500) and 628+1>628;
select 629 as n, (629*3) as score, N'payload 00629 - kiểm thử dấu phẩy; -- Unicode' as payload where (629 between 1 and 1500) and 629+1>629;
select 630 as n, (630*3) as score, N'payload 00630 - kiểm thử dấu phẩy; -- Unicode' as payload where (630 between 1 and 1500) and 630+1>630;
select 631 as n, (631*3) as score, N'payload 00631 - kiểm thử dấu phẩy; -- Unicode' as payload where (631 between 1 and 1500) and 631+1>631;
select 632 as n, (632*3) as score, N'payload 00632 - kiểm thử dấu phẩy; -- Unicode' as payload where (632 between 1 and 1500) and 632+1>632;
select 633 as n, (633*3) as score, N'payload 00633 - kiểm thử dấu phẩy; -- Unicode' as payload where (633 between 1 and 1500) and 633+1>633;
select 634 as n, (634*3) as score, N'payload 00634 - kiểm thử dấu phẩy; -- Unicode' as payload where (634 between 1 and 1500) and 634+1>634;
select 635 as n, (635*3) as score, N'payload 00635 - kiểm thử dấu phẩy; -- Unicode' as payload where (635 between 1 and 1500) and 635+1>635;
select 636 as n, (636*3) as score, N'payload 00636 - kiểm thử dấu phẩy; -- Unicode' as payload where (636 between 1 and 1500) and 636+1>636;
select 637 as n, (637*3) as score, N'payload 00637 - kiểm thử dấu phẩy; -- Unicode' as payload where (637 between 1 and 1500) and 637+1>637;
select 638 as n, (638*3) as score, N'payload 00638 - kiểm thử dấu phẩy; -- Unicode' as payload where (638 between 1 and 1500) and 638+1>638;
select 639 as n, (639*3) as score, N'payload 00639 - kiểm thử dấu phẩy; -- Unicode' as payload where (639 between 1 and 1500) and 639+1>639;
select 640 as n, (640*3) as score, N'payload 00640 - kiểm thử dấu phẩy; -- Unicode' as payload where (640 between 1 and 1500) and 640+1>640;
select 641 as n, (641*3) as score, N'payload 00641 - kiểm thử dấu phẩy; -- Unicode' as payload where (641 between 1 and 1500) and 641+1>641;
select 642 as n, (642*3) as score, N'payload 00642 - kiểm thử dấu phẩy; -- Unicode' as payload where (642 between 1 and 1500) and 642+1>642;
select 643 as n, (643*3) as score, N'payload 00643 - kiểm thử dấu phẩy; -- Unicode' as payload where (643 between 1 and 1500) and 643+1>643;
select 644 as n, (644*3) as score, N'payload 00644 - kiểm thử dấu phẩy; -- Unicode' as payload where (644 between 1 and 1500) and 644+1>644;
select 645 as n, (645*3) as score, N'payload 00645 - kiểm thử dấu phẩy; -- Unicode' as payload where (645 between 1 and 1500) and 645+1>645;
select 646 as n, (646*3) as score, N'payload 00646 - kiểm thử dấu phẩy; -- Unicode' as payload where (646 between 1 and 1500) and 646+1>646;
select 647 as n, (647*3) as score, N'payload 00647 - kiểm thử dấu phẩy; -- Unicode' as payload where (647 between 1 and 1500) and 647+1>647;
select 648 as n, (648*3) as score, N'payload 00648 - kiểm thử dấu phẩy; -- Unicode' as payload where (648 between 1 and 1500) and 648+1>648;
select 649 as n, (649*3) as score, N'payload 00649 - kiểm thử dấu phẩy; -- Unicode' as payload where (649 between 1 and 1500) and 649+1>649;
select 650 as n, (650*3) as score, N'payload 00650 - kiểm thử dấu phẩy; -- Unicode' as payload where (650 between 1 and 1500) and 650+1>650;
select 651 as n, (651*3) as score, N'payload 00651 - kiểm thử dấu phẩy; -- Unicode' as payload where (651 between 1 and 1500) and 651+1>651;
select 652 as n, (652*3) as score, N'payload 00652 - kiểm thử dấu phẩy; -- Unicode' as payload where (652 between 1 and 1500) and 652+1>652;
select 653 as n, (653*3) as score, N'payload 00653 - kiểm thử dấu phẩy; -- Unicode' as payload where (653 between 1 and 1500) and 653+1>653;
select 654 as n, (654*3) as score, N'payload 00654 - kiểm thử dấu phẩy; -- Unicode' as payload where (654 between 1 and 1500) and 654+1>654;
select 655 as n, (655*3) as score, N'payload 00655 - kiểm thử dấu phẩy; -- Unicode' as payload where (655 between 1 and 1500) and 655+1>655;
select 656 as n, (656*3) as score, N'payload 00656 - kiểm thử dấu phẩy; -- Unicode' as payload where (656 between 1 and 1500) and 656+1>656;
select 657 as n, (657*3) as score, N'payload 00657 - kiểm thử dấu phẩy; -- Unicode' as payload where (657 between 1 and 1500) and 657+1>657;
select 658 as n, (658*3) as score, N'payload 00658 - kiểm thử dấu phẩy; -- Unicode' as payload where (658 between 1 and 1500) and 658+1>658;
select 659 as n, (659*3) as score, N'payload 00659 - kiểm thử dấu phẩy; -- Unicode' as payload where (659 between 1 and 1500) and 659+1>659;
select 660 as n, (660*3) as score, N'payload 00660 - kiểm thử dấu phẩy; -- Unicode' as payload where (660 between 1 and 1500) and 660+1>660;
select 661 as n, (661*3) as score, N'payload 00661 - kiểm thử dấu phẩy; -- Unicode' as payload where (661 between 1 and 1500) and 661+1>661;
select 662 as n, (662*3) as score, N'payload 00662 - kiểm thử dấu phẩy; -- Unicode' as payload where (662 between 1 and 1500) and 662+1>662;
select 663 as n, (663*3) as score, N'payload 00663 - kiểm thử dấu phẩy; -- Unicode' as payload where (663 between 1 and 1500) and 663+1>663;
select 664 as n, (664*3) as score, N'payload 00664 - kiểm thử dấu phẩy; -- Unicode' as payload where (664 between 1 and 1500) and 664+1>664;
select 665 as n, (665*3) as score, N'payload 00665 - kiểm thử dấu phẩy; -- Unicode' as payload where (665 between 1 and 1500) and 665+1>665;
select 666 as n, (666*3) as score, N'payload 00666 - kiểm thử dấu phẩy; -- Unicode' as payload where (666 between 1 and 1500) and 666+1>666;
select 667 as n, (667*3) as score, N'payload 00667 - kiểm thử dấu phẩy; -- Unicode' as payload where (667 between 1 and 1500) and 667+1>667;
select 668 as n, (668*3) as score, N'payload 00668 - kiểm thử dấu phẩy; -- Unicode' as payload where (668 between 1 and 1500) and 668+1>668;
select 669 as n, (669*3) as score, N'payload 00669 - kiểm thử dấu phẩy; -- Unicode' as payload where (669 between 1 and 1500) and 669+1>669;
select 670 as n, (670*3) as score, N'payload 00670 - kiểm thử dấu phẩy; -- Unicode' as payload where (670 between 1 and 1500) and 670+1>670;
select 671 as n, (671*3) as score, N'payload 00671 - kiểm thử dấu phẩy; -- Unicode' as payload where (671 between 1 and 1500) and 671+1>671;
select 672 as n, (672*3) as score, N'payload 00672 - kiểm thử dấu phẩy; -- Unicode' as payload where (672 between 1 and 1500) and 672+1>672;
select 673 as n, (673*3) as score, N'payload 00673 - kiểm thử dấu phẩy; -- Unicode' as payload where (673 between 1 and 1500) and 673+1>673;
select 674 as n, (674*3) as score, N'payload 00674 - kiểm thử dấu phẩy; -- Unicode' as payload where (674 between 1 and 1500) and 674+1>674;
select 675 as n, (675*3) as score, N'payload 00675 - kiểm thử dấu phẩy; -- Unicode' as payload where (675 between 1 and 1500) and 675+1>675;
select 676 as n, (676*3) as score, N'payload 00676 - kiểm thử dấu phẩy; -- Unicode' as payload where (676 between 1 and 1500) and 676+1>676;
select 677 as n, (677*3) as score, N'payload 00677 - kiểm thử dấu phẩy; -- Unicode' as payload where (677 between 1 and 1500) and 677+1>677;
select 678 as n, (678*3) as score, N'payload 00678 - kiểm thử dấu phẩy; -- Unicode' as payload where (678 between 1 and 1500) and 678+1>678;
select 679 as n, (679*3) as score, N'payload 00679 - kiểm thử dấu phẩy; -- Unicode' as payload where (679 between 1 and 1500) and 679+1>679;
select 680 as n, (680*3) as score, N'payload 00680 - kiểm thử dấu phẩy; -- Unicode' as payload where (680 between 1 and 1500) and 680+1>680;
select 681 as n, (681*3) as score, N'payload 00681 - kiểm thử dấu phẩy; -- Unicode' as payload where (681 between 1 and 1500) and 681+1>681;
select 682 as n, (682*3) as score, N'payload 00682 - kiểm thử dấu phẩy; -- Unicode' as payload where (682 between 1 and 1500) and 682+1>682;
select 683 as n, (683*3) as score, N'payload 00683 - kiểm thử dấu phẩy; -- Unicode' as payload where (683 between 1 and 1500) and 683+1>683;
select 684 as n, (684*3) as score, N'payload 00684 - kiểm thử dấu phẩy; -- Unicode' as payload where (684 between 1 and 1500) and 684+1>684;
select 685 as n, (685*3) as score, N'payload 00685 - kiểm thử dấu phẩy; -- Unicode' as payload where (685 between 1 and 1500) and 685+1>685;
select 686 as n, (686*3) as score, N'payload 00686 - kiểm thử dấu phẩy; -- Unicode' as payload where (686 between 1 and 1500) and 686+1>686;
select 687 as n, (687*3) as score, N'payload 00687 - kiểm thử dấu phẩy; -- Unicode' as payload where (687 between 1 and 1500) and 687+1>687;
select 688 as n, (688*3) as score, N'payload 00688 - kiểm thử dấu phẩy; -- Unicode' as payload where (688 between 1 and 1500) and 688+1>688;
select 689 as n, (689*3) as score, N'payload 00689 - kiểm thử dấu phẩy; -- Unicode' as payload where (689 between 1 and 1500) and 689+1>689;
select 690 as n, (690*3) as score, N'payload 00690 - kiểm thử dấu phẩy; -- Unicode' as payload where (690 between 1 and 1500) and 690+1>690;
select 691 as n, (691*3) as score, N'payload 00691 - kiểm thử dấu phẩy; -- Unicode' as payload where (691 between 1 and 1500) and 691+1>691;
select 692 as n, (692*3) as score, N'payload 00692 - kiểm thử dấu phẩy; -- Unicode' as payload where (692 between 1 and 1500) and 692+1>692;
select 693 as n, (693*3) as score, N'payload 00693 - kiểm thử dấu phẩy; -- Unicode' as payload where (693 between 1 and 1500) and 693+1>693;
select 694 as n, (694*3) as score, N'payload 00694 - kiểm thử dấu phẩy; -- Unicode' as payload where (694 between 1 and 1500) and 694+1>694;
select 695 as n, (695*3) as score, N'payload 00695 - kiểm thử dấu phẩy; -- Unicode' as payload where (695 between 1 and 1500) and 695+1>695;
select 696 as n, (696*3) as score, N'payload 00696 - kiểm thử dấu phẩy; -- Unicode' as payload where (696 between 1 and 1500) and 696+1>696;
select 697 as n, (697*3) as score, N'payload 00697 - kiểm thử dấu phẩy; -- Unicode' as payload where (697 between 1 and 1500) and 697+1>697;
select 698 as n, (698*3) as score, N'payload 00698 - kiểm thử dấu phẩy; -- Unicode' as payload where (698 between 1 and 1500) and 698+1>698;
select 699 as n, (699*3) as score, N'payload 00699 - kiểm thử dấu phẩy; -- Unicode' as payload where (699 between 1 and 1500) and 699+1>699;
select 700 as n, (700*3) as score, N'payload 00700 - kiểm thử dấu phẩy; -- Unicode' as payload where (700 between 1 and 1500) and 700+1>700;
select 701 as n, (701*3) as score, N'payload 00701 - kiểm thử dấu phẩy; -- Unicode' as payload where (701 between 1 and 1500) and 701+1>701;
select 702 as n, (702*3) as score, N'payload 00702 - kiểm thử dấu phẩy; -- Unicode' as payload where (702 between 1 and 1500) and 702+1>702;
select 703 as n, (703*3) as score, N'payload 00703 - kiểm thử dấu phẩy; -- Unicode' as payload where (703 between 1 and 1500) and 703+1>703;
select 704 as n, (704*3) as score, N'payload 00704 - kiểm thử dấu phẩy; -- Unicode' as payload where (704 between 1 and 1500) and 704+1>704;
select 705 as n, (705*3) as score, N'payload 00705 - kiểm thử dấu phẩy; -- Unicode' as payload where (705 between 1 and 1500) and 705+1>705;
select 706 as n, (706*3) as score, N'payload 00706 - kiểm thử dấu phẩy; -- Unicode' as payload where (706 between 1 and 1500) and 706+1>706;
select 707 as n, (707*3) as score, N'payload 00707 - kiểm thử dấu phẩy; -- Unicode' as payload where (707 between 1 and 1500) and 707+1>707;
select 708 as n, (708*3) as score, N'payload 00708 - kiểm thử dấu phẩy; -- Unicode' as payload where (708 between 1 and 1500) and 708+1>708;
select 709 as n, (709*3) as score, N'payload 00709 - kiểm thử dấu phẩy; -- Unicode' as payload where (709 between 1 and 1500) and 709+1>709;
select 710 as n, (710*3) as score, N'payload 00710 - kiểm thử dấu phẩy; -- Unicode' as payload where (710 between 1 and 1500) and 710+1>710;
select 711 as n, (711*3) as score, N'payload 00711 - kiểm thử dấu phẩy; -- Unicode' as payload where (711 between 1 and 1500) and 711+1>711;
select 712 as n, (712*3) as score, N'payload 00712 - kiểm thử dấu phẩy; -- Unicode' as payload where (712 between 1 and 1500) and 712+1>712;
select 713 as n, (713*3) as score, N'payload 00713 - kiểm thử dấu phẩy; -- Unicode' as payload where (713 between 1 and 1500) and 713+1>713;
select 714 as n, (714*3) as score, N'payload 00714 - kiểm thử dấu phẩy; -- Unicode' as payload where (714 between 1 and 1500) and 714+1>714;
select 715 as n, (715*3) as score, N'payload 00715 - kiểm thử dấu phẩy; -- Unicode' as payload where (715 between 1 and 1500) and 715+1>715;
select 716 as n, (716*3) as score, N'payload 00716 - kiểm thử dấu phẩy; -- Unicode' as payload where (716 between 1 and 1500) and 716+1>716;
select 717 as n, (717*3) as score, N'payload 00717 - kiểm thử dấu phẩy; -- Unicode' as payload where (717 between 1 and 1500) and 717+1>717;
select 718 as n, (718*3) as score, N'payload 00718 - kiểm thử dấu phẩy; -- Unicode' as payload where (718 between 1 and 1500) and 718+1>718;
select 719 as n, (719*3) as score, N'payload 00719 - kiểm thử dấu phẩy; -- Unicode' as payload where (719 between 1 and 1500) and 719+1>719;
select 720 as n, (720*3) as score, N'payload 00720 - kiểm thử dấu phẩy; -- Unicode' as payload where (720 between 1 and 1500) and 720+1>720;
select 721 as n, (721*3) as score, N'payload 00721 - kiểm thử dấu phẩy; -- Unicode' as payload where (721 between 1 and 1500) and 721+1>721;
select 722 as n, (722*3) as score, N'payload 00722 - kiểm thử dấu phẩy; -- Unicode' as payload where (722 between 1 and 1500) and 722+1>722;
select 723 as n, (723*3) as score, N'payload 00723 - kiểm thử dấu phẩy; -- Unicode' as payload where (723 between 1 and 1500) and 723+1>723;
select 724 as n, (724*3) as score, N'payload 00724 - kiểm thử dấu phẩy; -- Unicode' as payload where (724 between 1 and 1500) and 724+1>724;
select 725 as n, (725*3) as score, N'payload 00725 - kiểm thử dấu phẩy; -- Unicode' as payload where (725 between 1 and 1500) and 725+1>725;
select 726 as n, (726*3) as score, N'payload 00726 - kiểm thử dấu phẩy; -- Unicode' as payload where (726 between 1 and 1500) and 726+1>726;
select 727 as n, (727*3) as score, N'payload 00727 - kiểm thử dấu phẩy; -- Unicode' as payload where (727 between 1 and 1500) and 727+1>727;
select 728 as n, (728*3) as score, N'payload 00728 - kiểm thử dấu phẩy; -- Unicode' as payload where (728 between 1 and 1500) and 728+1>728;
select 729 as n, (729*3) as score, N'payload 00729 - kiểm thử dấu phẩy; -- Unicode' as payload where (729 between 1 and 1500) and 729+1>729;
select 730 as n, (730*3) as score, N'payload 00730 - kiểm thử dấu phẩy; -- Unicode' as payload where (730 between 1 and 1500) and 730+1>730;
select 731 as n, (731*3) as score, N'payload 00731 - kiểm thử dấu phẩy; -- Unicode' as payload where (731 between 1 and 1500) and 731+1>731;
select 732 as n, (732*3) as score, N'payload 00732 - kiểm thử dấu phẩy; -- Unicode' as payload where (732 between 1 and 1500) and 732+1>732;
select 733 as n, (733*3) as score, N'payload 00733 - kiểm thử dấu phẩy; -- Unicode' as payload where (733 between 1 and 1500) and 733+1>733;
select 734 as n, (734*3) as score, N'payload 00734 - kiểm thử dấu phẩy; -- Unicode' as payload where (734 between 1 and 1500) and 734+1>734;
select 735 as n, (735*3) as score, N'payload 00735 - kiểm thử dấu phẩy; -- Unicode' as payload where (735 between 1 and 1500) and 735+1>735;
select 736 as n, (736*3) as score, N'payload 00736 - kiểm thử dấu phẩy; -- Unicode' as payload where (736 between 1 and 1500) and 736+1>736;
select 737 as n, (737*3) as score, N'payload 00737 - kiểm thử dấu phẩy; -- Unicode' as payload where (737 between 1 and 1500) and 737+1>737;
select 738 as n, (738*3) as score, N'payload 00738 - kiểm thử dấu phẩy; -- Unicode' as payload where (738 between 1 and 1500) and 738+1>738;
select 739 as n, (739*3) as score, N'payload 00739 - kiểm thử dấu phẩy; -- Unicode' as payload where (739 between 1 and 1500) and 739+1>739;
select 740 as n, (740*3) as score, N'payload 00740 - kiểm thử dấu phẩy; -- Unicode' as payload where (740 between 1 and 1500) and 740+1>740;
select 741 as n, (741*3) as score, N'payload 00741 - kiểm thử dấu phẩy; -- Unicode' as payload where (741 between 1 and 1500) and 741+1>741;
select 742 as n, (742*3) as score, N'payload 00742 - kiểm thử dấu phẩy; -- Unicode' as payload where (742 between 1 and 1500) and 742+1>742;
select 743 as n, (743*3) as score, N'payload 00743 - kiểm thử dấu phẩy; -- Unicode' as payload where (743 between 1 and 1500) and 743+1>743;
select 744 as n, (744*3) as score, N'payload 00744 - kiểm thử dấu phẩy; -- Unicode' as payload where (744 between 1 and 1500) and 744+1>744;
select 745 as n, (745*3) as score, N'payload 00745 - kiểm thử dấu phẩy; -- Unicode' as payload where (745 between 1 and 1500) and 745+1>745;
select 746 as n, (746*3) as score, N'payload 00746 - kiểm thử dấu phẩy; -- Unicode' as payload where (746 between 1 and 1500) and 746+1>746;
select 747 as n, (747*3) as score, N'payload 00747 - kiểm thử dấu phẩy; -- Unicode' as payload where (747 between 1 and 1500) and 747+1>747;
select 748 as n, (748*3) as score, N'payload 00748 - kiểm thử dấu phẩy; -- Unicode' as payload where (748 between 1 and 1500) and 748+1>748;
select 749 as n, (749*3) as score, N'payload 00749 - kiểm thử dấu phẩy; -- Unicode' as payload where (749 between 1 and 1500) and 749+1>749;
select 750 as n, (750*3) as score, N'payload 00750 - kiểm thử dấu phẩy; -- Unicode' as payload where (750 between 1 and 1500) and 750+1>750;
select 751 as n, (751*3) as score, N'payload 00751 - kiểm thử dấu phẩy; -- Unicode' as payload where (751 between 1 and 1500) and 751+1>751;
select 752 as n, (752*3) as score, N'payload 00752 - kiểm thử dấu phẩy; -- Unicode' as payload where (752 between 1 and 1500) and 752+1>752;
select 753 as n, (753*3) as score, N'payload 00753 - kiểm thử dấu phẩy; -- Unicode' as payload where (753 between 1 and 1500) and 753+1>753;
select 754 as n, (754*3) as score, N'payload 00754 - kiểm thử dấu phẩy; -- Unicode' as payload where (754 between 1 and 1500) and 754+1>754;
select 755 as n, (755*3) as score, N'payload 00755 - kiểm thử dấu phẩy; -- Unicode' as payload where (755 between 1 and 1500) and 755+1>755;
select 756 as n, (756*3) as score, N'payload 00756 - kiểm thử dấu phẩy; -- Unicode' as payload where (756 between 1 and 1500) and 756+1>756;
select 757 as n, (757*3) as score, N'payload 00757 - kiểm thử dấu phẩy; -- Unicode' as payload where (757 between 1 and 1500) and 757+1>757;
select 758 as n, (758*3) as score, N'payload 00758 - kiểm thử dấu phẩy; -- Unicode' as payload where (758 between 1 and 1500) and 758+1>758;
select 759 as n, (759*3) as score, N'payload 00759 - kiểm thử dấu phẩy; -- Unicode' as payload where (759 between 1 and 1500) and 759+1>759;
select 760 as n, (760*3) as score, N'payload 00760 - kiểm thử dấu phẩy; -- Unicode' as payload where (760 between 1 and 1500) and 760+1>760;
select 761 as n, (761*3) as score, N'payload 00761 - kiểm thử dấu phẩy; -- Unicode' as payload where (761 between 1 and 1500) and 761+1>761;
select 762 as n, (762*3) as score, N'payload 00762 - kiểm thử dấu phẩy; -- Unicode' as payload where (762 between 1 and 1500) and 762+1>762;
select 763 as n, (763*3) as score, N'payload 00763 - kiểm thử dấu phẩy; -- Unicode' as payload where (763 between 1 and 1500) and 763+1>763;
select 764 as n, (764*3) as score, N'payload 00764 - kiểm thử dấu phẩy; -- Unicode' as payload where (764 between 1 and 1500) and 764+1>764;
select 765 as n, (765*3) as score, N'payload 00765 - kiểm thử dấu phẩy; -- Unicode' as payload where (765 between 1 and 1500) and 765+1>765;
select 766 as n, (766*3) as score, N'payload 00766 - kiểm thử dấu phẩy; -- Unicode' as payload where (766 between 1 and 1500) and 766+1>766;
select 767 as n, (767*3) as score, N'payload 00767 - kiểm thử dấu phẩy; -- Unicode' as payload where (767 between 1 and 1500) and 767+1>767;
select 768 as n, (768*3) as score, N'payload 00768 - kiểm thử dấu phẩy; -- Unicode' as payload where (768 between 1 and 1500) and 768+1>768;
select 769 as n, (769*3) as score, N'payload 00769 - kiểm thử dấu phẩy; -- Unicode' as payload where (769 between 1 and 1500) and 769+1>769;
select 770 as n, (770*3) as score, N'payload 00770 - kiểm thử dấu phẩy; -- Unicode' as payload where (770 between 1 and 1500) and 770+1>770;
select 771 as n, (771*3) as score, N'payload 00771 - kiểm thử dấu phẩy; -- Unicode' as payload where (771 between 1 and 1500) and 771+1>771;
select 772 as n, (772*3) as score, N'payload 00772 - kiểm thử dấu phẩy; -- Unicode' as payload where (772 between 1 and 1500) and 772+1>772;
select 773 as n, (773*3) as score, N'payload 00773 - kiểm thử dấu phẩy; -- Unicode' as payload where (773 between 1 and 1500) and 773+1>773;
select 774 as n, (774*3) as score, N'payload 00774 - kiểm thử dấu phẩy; -- Unicode' as payload where (774 between 1 and 1500) and 774+1>774;
select 775 as n, (775*3) as score, N'payload 00775 - kiểm thử dấu phẩy; -- Unicode' as payload where (775 between 1 and 1500) and 775+1>775;
select 776 as n, (776*3) as score, N'payload 00776 - kiểm thử dấu phẩy; -- Unicode' as payload where (776 between 1 and 1500) and 776+1>776;
select 777 as n, (777*3) as score, N'payload 00777 - kiểm thử dấu phẩy; -- Unicode' as payload where (777 between 1 and 1500) and 777+1>777;
select 778 as n, (778*3) as score, N'payload 00778 - kiểm thử dấu phẩy; -- Unicode' as payload where (778 between 1 and 1500) and 778+1>778;
select 779 as n, (779*3) as score, N'payload 00779 - kiểm thử dấu phẩy; -- Unicode' as payload where (779 between 1 and 1500) and 779+1>779;
select 780 as n, (780*3) as score, N'payload 00780 - kiểm thử dấu phẩy; -- Unicode' as payload where (780 between 1 and 1500) and 780+1>780;
select 781 as n, (781*3) as score, N'payload 00781 - kiểm thử dấu phẩy; -- Unicode' as payload where (781 between 1 and 1500) and 781+1>781;
select 782 as n, (782*3) as score, N'payload 00782 - kiểm thử dấu phẩy; -- Unicode' as payload where (782 between 1 and 1500) and 782+1>782;
select 783 as n, (783*3) as score, N'payload 00783 - kiểm thử dấu phẩy; -- Unicode' as payload where (783 between 1 and 1500) and 783+1>783;
select 784 as n, (784*3) as score, N'payload 00784 - kiểm thử dấu phẩy; -- Unicode' as payload where (784 between 1 and 1500) and 784+1>784;
select 785 as n, (785*3) as score, N'payload 00785 - kiểm thử dấu phẩy; -- Unicode' as payload where (785 between 1 and 1500) and 785+1>785;
select 786 as n, (786*3) as score, N'payload 00786 - kiểm thử dấu phẩy; -- Unicode' as payload where (786 between 1 and 1500) and 786+1>786;
select 787 as n, (787*3) as score, N'payload 00787 - kiểm thử dấu phẩy; -- Unicode' as payload where (787 between 1 and 1500) and 787+1>787;
select 788 as n, (788*3) as score, N'payload 00788 - kiểm thử dấu phẩy; -- Unicode' as payload where (788 between 1 and 1500) and 788+1>788;
select 789 as n, (789*3) as score, N'payload 00789 - kiểm thử dấu phẩy; -- Unicode' as payload where (789 between 1 and 1500) and 789+1>789;
select 790 as n, (790*3) as score, N'payload 00790 - kiểm thử dấu phẩy; -- Unicode' as payload where (790 between 1 and 1500) and 790+1>790;
select 791 as n, (791*3) as score, N'payload 00791 - kiểm thử dấu phẩy; -- Unicode' as payload where (791 between 1 and 1500) and 791+1>791;
select 792 as n, (792*3) as score, N'payload 00792 - kiểm thử dấu phẩy; -- Unicode' as payload where (792 between 1 and 1500) and 792+1>792;
select 793 as n, (793*3) as score, N'payload 00793 - kiểm thử dấu phẩy; -- Unicode' as payload where (793 between 1 and 1500) and 793+1>793;
select 794 as n, (794*3) as score, N'payload 00794 - kiểm thử dấu phẩy; -- Unicode' as payload where (794 between 1 and 1500) and 794+1>794;
select 795 as n, (795*3) as score, N'payload 00795 - kiểm thử dấu phẩy; -- Unicode' as payload where (795 between 1 and 1500) and 795+1>795;
select 796 as n, (796*3) as score, N'payload 00796 - kiểm thử dấu phẩy; -- Unicode' as payload where (796 between 1 and 1500) and 796+1>796;
select 797 as n, (797*3) as score, N'payload 00797 - kiểm thử dấu phẩy; -- Unicode' as payload where (797 between 1 and 1500) and 797+1>797;
select 798 as n, (798*3) as score, N'payload 00798 - kiểm thử dấu phẩy; -- Unicode' as payload where (798 between 1 and 1500) and 798+1>798;
select 799 as n, (799*3) as score, N'payload 00799 - kiểm thử dấu phẩy; -- Unicode' as payload where (799 between 1 and 1500) and 799+1>799;
select 800 as n, (800*3) as score, N'payload 00800 - kiểm thử dấu phẩy; -- Unicode' as payload where (800 between 1 and 1500) and 800+1>800;
select 801 as n, (801*3) as score, N'payload 00801 - kiểm thử dấu phẩy; -- Unicode' as payload where (801 between 1 and 1500) and 801+1>801;
select 802 as n, (802*3) as score, N'payload 00802 - kiểm thử dấu phẩy; -- Unicode' as payload where (802 between 1 and 1500) and 802+1>802;
select 803 as n, (803*3) as score, N'payload 00803 - kiểm thử dấu phẩy; -- Unicode' as payload where (803 between 1 and 1500) and 803+1>803;
select 804 as n, (804*3) as score, N'payload 00804 - kiểm thử dấu phẩy; -- Unicode' as payload where (804 between 1 and 1500) and 804+1>804;
select 805 as n, (805*3) as score, N'payload 00805 - kiểm thử dấu phẩy; -- Unicode' as payload where (805 between 1 and 1500) and 805+1>805;
select 806 as n, (806*3) as score, N'payload 00806 - kiểm thử dấu phẩy; -- Unicode' as payload where (806 between 1 and 1500) and 806+1>806;
select 807 as n, (807*3) as score, N'payload 00807 - kiểm thử dấu phẩy; -- Unicode' as payload where (807 between 1 and 1500) and 807+1>807;
select 808 as n, (808*3) as score, N'payload 00808 - kiểm thử dấu phẩy; -- Unicode' as payload where (808 between 1 and 1500) and 808+1>808;
select 809 as n, (809*3) as score, N'payload 00809 - kiểm thử dấu phẩy; -- Unicode' as payload where (809 between 1 and 1500) and 809+1>809;
select 810 as n, (810*3) as score, N'payload 00810 - kiểm thử dấu phẩy; -- Unicode' as payload where (810 between 1 and 1500) and 810+1>810;
select 811 as n, (811*3) as score, N'payload 00811 - kiểm thử dấu phẩy; -- Unicode' as payload where (811 between 1 and 1500) and 811+1>811;
select 812 as n, (812*3) as score, N'payload 00812 - kiểm thử dấu phẩy; -- Unicode' as payload where (812 between 1 and 1500) and 812+1>812;
select 813 as n, (813*3) as score, N'payload 00813 - kiểm thử dấu phẩy; -- Unicode' as payload where (813 between 1 and 1500) and 813+1>813;
select 814 as n, (814*3) as score, N'payload 00814 - kiểm thử dấu phẩy; -- Unicode' as payload where (814 between 1 and 1500) and 814+1>814;
select 815 as n, (815*3) as score, N'payload 00815 - kiểm thử dấu phẩy; -- Unicode' as payload where (815 between 1 and 1500) and 815+1>815;
select 816 as n, (816*3) as score, N'payload 00816 - kiểm thử dấu phẩy; -- Unicode' as payload where (816 between 1 and 1500) and 816+1>816;
select 817 as n, (817*3) as score, N'payload 00817 - kiểm thử dấu phẩy; -- Unicode' as payload where (817 between 1 and 1500) and 817+1>817;
select 818 as n, (818*3) as score, N'payload 00818 - kiểm thử dấu phẩy; -- Unicode' as payload where (818 between 1 and 1500) and 818+1>818;
select 819 as n, (819*3) as score, N'payload 00819 - kiểm thử dấu phẩy; -- Unicode' as payload where (819 between 1 and 1500) and 819+1>819;
select 820 as n, (820*3) as score, N'payload 00820 - kiểm thử dấu phẩy; -- Unicode' as payload where (820 between 1 and 1500) and 820+1>820;
select 821 as n, (821*3) as score, N'payload 00821 - kiểm thử dấu phẩy; -- Unicode' as payload where (821 between 1 and 1500) and 821+1>821;
select 822 as n, (822*3) as score, N'payload 00822 - kiểm thử dấu phẩy; -- Unicode' as payload where (822 between 1 and 1500) and 822+1>822;
select 823 as n, (823*3) as score, N'payload 00823 - kiểm thử dấu phẩy; -- Unicode' as payload where (823 between 1 and 1500) and 823+1>823;
select 824 as n, (824*3) as score, N'payload 00824 - kiểm thử dấu phẩy; -- Unicode' as payload where (824 between 1 and 1500) and 824+1>824;
select 825 as n, (825*3) as score, N'payload 00825 - kiểm thử dấu phẩy; -- Unicode' as payload where (825 between 1 and 1500) and 825+1>825;
select 826 as n, (826*3) as score, N'payload 00826 - kiểm thử dấu phẩy; -- Unicode' as payload where (826 between 1 and 1500) and 826+1>826;
select 827 as n, (827*3) as score, N'payload 00827 - kiểm thử dấu phẩy; -- Unicode' as payload where (827 between 1 and 1500) and 827+1>827;
select 828 as n, (828*3) as score, N'payload 00828 - kiểm thử dấu phẩy; -- Unicode' as payload where (828 between 1 and 1500) and 828+1>828;
select 829 as n, (829*3) as score, N'payload 00829 - kiểm thử dấu phẩy; -- Unicode' as payload where (829 between 1 and 1500) and 829+1>829;
select 830 as n, (830*3) as score, N'payload 00830 - kiểm thử dấu phẩy; -- Unicode' as payload where (830 between 1 and 1500) and 830+1>830;
select 831 as n, (831*3) as score, N'payload 00831 - kiểm thử dấu phẩy; -- Unicode' as payload where (831 between 1 and 1500) and 831+1>831;
select 832 as n, (832*3) as score, N'payload 00832 - kiểm thử dấu phẩy; -- Unicode' as payload where (832 between 1 and 1500) and 832+1>832;
select 833 as n, (833*3) as score, N'payload 00833 - kiểm thử dấu phẩy; -- Unicode' as payload where (833 between 1 and 1500) and 833+1>833;
select 834 as n, (834*3) as score, N'payload 00834 - kiểm thử dấu phẩy; -- Unicode' as payload where (834 between 1 and 1500) and 834+1>834;
select 835 as n, (835*3) as score, N'payload 00835 - kiểm thử dấu phẩy; -- Unicode' as payload where (835 between 1 and 1500) and 835+1>835;
select 836 as n, (836*3) as score, N'payload 00836 - kiểm thử dấu phẩy; -- Unicode' as payload where (836 between 1 and 1500) and 836+1>836;
select 837 as n, (837*3) as score, N'payload 00837 - kiểm thử dấu phẩy; -- Unicode' as payload where (837 between 1 and 1500) and 837+1>837;
select 838 as n, (838*3) as score, N'payload 00838 - kiểm thử dấu phẩy; -- Unicode' as payload where (838 between 1 and 1500) and 838+1>838;
select 839 as n, (839*3) as score, N'payload 00839 - kiểm thử dấu phẩy; -- Unicode' as payload where (839 between 1 and 1500) and 839+1>839;
select 840 as n, (840*3) as score, N'payload 00840 - kiểm thử dấu phẩy; -- Unicode' as payload where (840 between 1 and 1500) and 840+1>840;
select 841 as n, (841*3) as score, N'payload 00841 - kiểm thử dấu phẩy; -- Unicode' as payload where (841 between 1 and 1500) and 841+1>841;
select 842 as n, (842*3) as score, N'payload 00842 - kiểm thử dấu phẩy; -- Unicode' as payload where (842 between 1 and 1500) and 842+1>842;
select 843 as n, (843*3) as score, N'payload 00843 - kiểm thử dấu phẩy; -- Unicode' as payload where (843 between 1 and 1500) and 843+1>843;
select 844 as n, (844*3) as score, N'payload 00844 - kiểm thử dấu phẩy; -- Unicode' as payload where (844 between 1 and 1500) and 844+1>844;
select 845 as n, (845*3) as score, N'payload 00845 - kiểm thử dấu phẩy; -- Unicode' as payload where (845 between 1 and 1500) and 845+1>845;
select 846 as n, (846*3) as score, N'payload 00846 - kiểm thử dấu phẩy; -- Unicode' as payload where (846 between 1 and 1500) and 846+1>846;
select 847 as n, (847*3) as score, N'payload 00847 - kiểm thử dấu phẩy; -- Unicode' as payload where (847 between 1 and 1500) and 847+1>847;
select 848 as n, (848*3) as score, N'payload 00848 - kiểm thử dấu phẩy; -- Unicode' as payload where (848 between 1 and 1500) and 848+1>848;
select 849 as n, (849*3) as score, N'payload 00849 - kiểm thử dấu phẩy; -- Unicode' as payload where (849 between 1 and 1500) and 849+1>849;
select 850 as n, (850*3) as score, N'payload 00850 - kiểm thử dấu phẩy; -- Unicode' as payload where (850 between 1 and 1500) and 850+1>850;
select 851 as n, (851*3) as score, N'payload 00851 - kiểm thử dấu phẩy; -- Unicode' as payload where (851 between 1 and 1500) and 851+1>851;
select 852 as n, (852*3) as score, N'payload 00852 - kiểm thử dấu phẩy; -- Unicode' as payload where (852 between 1 and 1500) and 852+1>852;
select 853 as n, (853*3) as score, N'payload 00853 - kiểm thử dấu phẩy; -- Unicode' as payload where (853 between 1 and 1500) and 853+1>853;
select 854 as n, (854*3) as score, N'payload 00854 - kiểm thử dấu phẩy; -- Unicode' as payload where (854 between 1 and 1500) and 854+1>854;
select 855 as n, (855*3) as score, N'payload 00855 - kiểm thử dấu phẩy; -- Unicode' as payload where (855 between 1 and 1500) and 855+1>855;
select 856 as n, (856*3) as score, N'payload 00856 - kiểm thử dấu phẩy; -- Unicode' as payload where (856 between 1 and 1500) and 856+1>856;
select 857 as n, (857*3) as score, N'payload 00857 - kiểm thử dấu phẩy; -- Unicode' as payload where (857 between 1 and 1500) and 857+1>857;
select 858 as n, (858*3) as score, N'payload 00858 - kiểm thử dấu phẩy; -- Unicode' as payload where (858 between 1 and 1500) and 858+1>858;
select 859 as n, (859*3) as score, N'payload 00859 - kiểm thử dấu phẩy; -- Unicode' as payload where (859 between 1 and 1500) and 859+1>859;
select 860 as n, (860*3) as score, N'payload 00860 - kiểm thử dấu phẩy; -- Unicode' as payload where (860 between 1 and 1500) and 860+1>860;
select 861 as n, (861*3) as score, N'payload 00861 - kiểm thử dấu phẩy; -- Unicode' as payload where (861 between 1 and 1500) and 861+1>861;
select 862 as n, (862*3) as score, N'payload 00862 - kiểm thử dấu phẩy; -- Unicode' as payload where (862 between 1 and 1500) and 862+1>862;
select 863 as n, (863*3) as score, N'payload 00863 - kiểm thử dấu phẩy; -- Unicode' as payload where (863 between 1 and 1500) and 863+1>863;
select 864 as n, (864*3) as score, N'payload 00864 - kiểm thử dấu phẩy; -- Unicode' as payload where (864 between 1 and 1500) and 864+1>864;
select 865 as n, (865*3) as score, N'payload 00865 - kiểm thử dấu phẩy; -- Unicode' as payload where (865 between 1 and 1500) and 865+1>865;
select 866 as n, (866*3) as score, N'payload 00866 - kiểm thử dấu phẩy; -- Unicode' as payload where (866 between 1 and 1500) and 866+1>866;
select 867 as n, (867*3) as score, N'payload 00867 - kiểm thử dấu phẩy; -- Unicode' as payload where (867 between 1 and 1500) and 867+1>867;
select 868 as n, (868*3) as score, N'payload 00868 - kiểm thử dấu phẩy; -- Unicode' as payload where (868 between 1 and 1500) and 868+1>868;
select 869 as n, (869*3) as score, N'payload 00869 - kiểm thử dấu phẩy; -- Unicode' as payload where (869 between 1 and 1500) and 869+1>869;
select 870 as n, (870*3) as score, N'payload 00870 - kiểm thử dấu phẩy; -- Unicode' as payload where (870 between 1 and 1500) and 870+1>870;
select 871 as n, (871*3) as score, N'payload 00871 - kiểm thử dấu phẩy; -- Unicode' as payload where (871 between 1 and 1500) and 871+1>871;
select 872 as n, (872*3) as score, N'payload 00872 - kiểm thử dấu phẩy; -- Unicode' as payload where (872 between 1 and 1500) and 872+1>872;
select 873 as n, (873*3) as score, N'payload 00873 - kiểm thử dấu phẩy; -- Unicode' as payload where (873 between 1 and 1500) and 873+1>873;
select 874 as n, (874*3) as score, N'payload 00874 - kiểm thử dấu phẩy; -- Unicode' as payload where (874 between 1 and 1500) and 874+1>874;
select 875 as n, (875*3) as score, N'payload 00875 - kiểm thử dấu phẩy; -- Unicode' as payload where (875 between 1 and 1500) and 875+1>875;
select 876 as n, (876*3) as score, N'payload 00876 - kiểm thử dấu phẩy; -- Unicode' as payload where (876 between 1 and 1500) and 876+1>876;
select 877 as n, (877*3) as score, N'payload 00877 - kiểm thử dấu phẩy; -- Unicode' as payload where (877 between 1 and 1500) and 877+1>877;
select 878 as n, (878*3) as score, N'payload 00878 - kiểm thử dấu phẩy; -- Unicode' as payload where (878 between 1 and 1500) and 878+1>878;
select 879 as n, (879*3) as score, N'payload 00879 - kiểm thử dấu phẩy; -- Unicode' as payload where (879 between 1 and 1500) and 879+1>879;
select 880 as n, (880*3) as score, N'payload 00880 - kiểm thử dấu phẩy; -- Unicode' as payload where (880 between 1 and 1500) and 880+1>880;
select 881 as n, (881*3) as score, N'payload 00881 - kiểm thử dấu phẩy; -- Unicode' as payload where (881 between 1 and 1500) and 881+1>881;
select 882 as n, (882*3) as score, N'payload 00882 - kiểm thử dấu phẩy; -- Unicode' as payload where (882 between 1 and 1500) and 882+1>882;
select 883 as n, (883*3) as score, N'payload 00883 - kiểm thử dấu phẩy; -- Unicode' as payload where (883 between 1 and 1500) and 883+1>883;
select 884 as n, (884*3) as score, N'payload 00884 - kiểm thử dấu phẩy; -- Unicode' as payload where (884 between 1 and 1500) and 884+1>884;
select 885 as n, (885*3) as score, N'payload 00885 - kiểm thử dấu phẩy; -- Unicode' as payload where (885 between 1 and 1500) and 885+1>885;
select 886 as n, (886*3) as score, N'payload 00886 - kiểm thử dấu phẩy; -- Unicode' as payload where (886 between 1 and 1500) and 886+1>886;
select 887 as n, (887*3) as score, N'payload 00887 - kiểm thử dấu phẩy; -- Unicode' as payload where (887 between 1 and 1500) and 887+1>887;
select 888 as n, (888*3) as score, N'payload 00888 - kiểm thử dấu phẩy; -- Unicode' as payload where (888 between 1 and 1500) and 888+1>888;
select 889 as n, (889*3) as score, N'payload 00889 - kiểm thử dấu phẩy; -- Unicode' as payload where (889 between 1 and 1500) and 889+1>889;
select 890 as n, (890*3) as score, N'payload 00890 - kiểm thử dấu phẩy; -- Unicode' as payload where (890 between 1 and 1500) and 890+1>890;
select 891 as n, (891*3) as score, N'payload 00891 - kiểm thử dấu phẩy; -- Unicode' as payload where (891 between 1 and 1500) and 891+1>891;
select 892 as n, (892*3) as score, N'payload 00892 - kiểm thử dấu phẩy; -- Unicode' as payload where (892 between 1 and 1500) and 892+1>892;
select 893 as n, (893*3) as score, N'payload 00893 - kiểm thử dấu phẩy; -- Unicode' as payload where (893 between 1 and 1500) and 893+1>893;
select 894 as n, (894*3) as score, N'payload 00894 - kiểm thử dấu phẩy; -- Unicode' as payload where (894 between 1 and 1500) and 894+1>894;
select 895 as n, (895*3) as score, N'payload 00895 - kiểm thử dấu phẩy; -- Unicode' as payload where (895 between 1 and 1500) and 895+1>895;
select 896 as n, (896*3) as score, N'payload 00896 - kiểm thử dấu phẩy; -- Unicode' as payload where (896 between 1 and 1500) and 896+1>896;
select 897 as n, (897*3) as score, N'payload 00897 - kiểm thử dấu phẩy; -- Unicode' as payload where (897 between 1 and 1500) and 897+1>897;
select 898 as n, (898*3) as score, N'payload 00898 - kiểm thử dấu phẩy; -- Unicode' as payload where (898 between 1 and 1500) and 898+1>898;
select 899 as n, (899*3) as score, N'payload 00899 - kiểm thử dấu phẩy; -- Unicode' as payload where (899 between 1 and 1500) and 899+1>899;
select 900 as n, (900*3) as score, N'payload 00900 - kiểm thử dấu phẩy; -- Unicode' as payload where (900 between 1 and 1500) and 900+1>900;
select 901 as n, (901*3) as score, N'payload 00901 - kiểm thử dấu phẩy; -- Unicode' as payload where (901 between 1 and 1500) and 901+1>901;
select 902 as n, (902*3) as score, N'payload 00902 - kiểm thử dấu phẩy; -- Unicode' as payload where (902 between 1 and 1500) and 902+1>902;
select 903 as n, (903*3) as score, N'payload 00903 - kiểm thử dấu phẩy; -- Unicode' as payload where (903 between 1 and 1500) and 903+1>903;
select 904 as n, (904*3) as score, N'payload 00904 - kiểm thử dấu phẩy; -- Unicode' as payload where (904 between 1 and 1500) and 904+1>904;
select 905 as n, (905*3) as score, N'payload 00905 - kiểm thử dấu phẩy; -- Unicode' as payload where (905 between 1 and 1500) and 905+1>905;
select 906 as n, (906*3) as score, N'payload 00906 - kiểm thử dấu phẩy; -- Unicode' as payload where (906 between 1 and 1500) and 906+1>906;
select 907 as n, (907*3) as score, N'payload 00907 - kiểm thử dấu phẩy; -- Unicode' as payload where (907 between 1 and 1500) and 907+1>907;
select 908 as n, (908*3) as score, N'payload 00908 - kiểm thử dấu phẩy; -- Unicode' as payload where (908 between 1 and 1500) and 908+1>908;
select 909 as n, (909*3) as score, N'payload 00909 - kiểm thử dấu phẩy; -- Unicode' as payload where (909 between 1 and 1500) and 909+1>909;
select 910 as n, (910*3) as score, N'payload 00910 - kiểm thử dấu phẩy; -- Unicode' as payload where (910 between 1 and 1500) and 910+1>910;
select 911 as n, (911*3) as score, N'payload 00911 - kiểm thử dấu phẩy; -- Unicode' as payload where (911 between 1 and 1500) and 911+1>911;
select 912 as n, (912*3) as score, N'payload 00912 - kiểm thử dấu phẩy; -- Unicode' as payload where (912 between 1 and 1500) and 912+1>912;
select 913 as n, (913*3) as score, N'payload 00913 - kiểm thử dấu phẩy; -- Unicode' as payload where (913 between 1 and 1500) and 913+1>913;
select 914 as n, (914*3) as score, N'payload 00914 - kiểm thử dấu phẩy; -- Unicode' as payload where (914 between 1 and 1500) and 914+1>914;
select 915 as n, (915*3) as score, N'payload 00915 - kiểm thử dấu phẩy; -- Unicode' as payload where (915 between 1 and 1500) and 915+1>915;
select 916 as n, (916*3) as score, N'payload 00916 - kiểm thử dấu phẩy; -- Unicode' as payload where (916 between 1 and 1500) and 916+1>916;
select 917 as n, (917*3) as score, N'payload 00917 - kiểm thử dấu phẩy; -- Unicode' as payload where (917 between 1 and 1500) and 917+1>917;
select 918 as n, (918*3) as score, N'payload 00918 - kiểm thử dấu phẩy; -- Unicode' as payload where (918 between 1 and 1500) and 918+1>918;
select 919 as n, (919*3) as score, N'payload 00919 - kiểm thử dấu phẩy; -- Unicode' as payload where (919 between 1 and 1500) and 919+1>919;
select 920 as n, (920*3) as score, N'payload 00920 - kiểm thử dấu phẩy; -- Unicode' as payload where (920 between 1 and 1500) and 920+1>920;
select 921 as n, (921*3) as score, N'payload 00921 - kiểm thử dấu phẩy; -- Unicode' as payload where (921 between 1 and 1500) and 921+1>921;
select 922 as n, (922*3) as score, N'payload 00922 - kiểm thử dấu phẩy; -- Unicode' as payload where (922 between 1 and 1500) and 922+1>922;
select 923 as n, (923*3) as score, N'payload 00923 - kiểm thử dấu phẩy; -- Unicode' as payload where (923 between 1 and 1500) and 923+1>923;
select 924 as n, (924*3) as score, N'payload 00924 - kiểm thử dấu phẩy; -- Unicode' as payload where (924 between 1 and 1500) and 924+1>924;
select 925 as n, (925*3) as score, N'payload 00925 - kiểm thử dấu phẩy; -- Unicode' as payload where (925 between 1 and 1500) and 925+1>925;
select 926 as n, (926*3) as score, N'payload 00926 - kiểm thử dấu phẩy; -- Unicode' as payload where (926 between 1 and 1500) and 926+1>926;
select 927 as n, (927*3) as score, N'payload 00927 - kiểm thử dấu phẩy; -- Unicode' as payload where (927 between 1 and 1500) and 927+1>927;
select 928 as n, (928*3) as score, N'payload 00928 - kiểm thử dấu phẩy; -- Unicode' as payload where (928 between 1 and 1500) and 928+1>928;
select 929 as n, (929*3) as score, N'payload 00929 - kiểm thử dấu phẩy; -- Unicode' as payload where (929 between 1 and 1500) and 929+1>929;
select 930 as n, (930*3) as score, N'payload 00930 - kiểm thử dấu phẩy; -- Unicode' as payload where (930 between 1 and 1500) and 930+1>930;
select 931 as n, (931*3) as score, N'payload 00931 - kiểm thử dấu phẩy; -- Unicode' as payload where (931 between 1 and 1500) and 931+1>931;
select 932 as n, (932*3) as score, N'payload 00932 - kiểm thử dấu phẩy; -- Unicode' as payload where (932 between 1 and 1500) and 932+1>932;
select 933 as n, (933*3) as score, N'payload 00933 - kiểm thử dấu phẩy; -- Unicode' as payload where (933 between 1 and 1500) and 933+1>933;
select 934 as n, (934*3) as score, N'payload 00934 - kiểm thử dấu phẩy; -- Unicode' as payload where (934 between 1 and 1500) and 934+1>934;
select 935 as n, (935*3) as score, N'payload 00935 - kiểm thử dấu phẩy; -- Unicode' as payload where (935 between 1 and 1500) and 935+1>935;
select 936 as n, (936*3) as score, N'payload 00936 - kiểm thử dấu phẩy; -- Unicode' as payload where (936 between 1 and 1500) and 936+1>936;
select 937 as n, (937*3) as score, N'payload 00937 - kiểm thử dấu phẩy; -- Unicode' as payload where (937 between 1 and 1500) and 937+1>937;
select 938 as n, (938*3) as score, N'payload 00938 - kiểm thử dấu phẩy; -- Unicode' as payload where (938 between 1 and 1500) and 938+1>938;
select 939 as n, (939*3) as score, N'payload 00939 - kiểm thử dấu phẩy; -- Unicode' as payload where (939 between 1 and 1500) and 939+1>939;
select 940 as n, (940*3) as score, N'payload 00940 - kiểm thử dấu phẩy; -- Unicode' as payload where (940 between 1 and 1500) and 940+1>940;
select 941 as n, (941*3) as score, N'payload 00941 - kiểm thử dấu phẩy; -- Unicode' as payload where (941 between 1 and 1500) and 941+1>941;
select 942 as n, (942*3) as score, N'payload 00942 - kiểm thử dấu phẩy; -- Unicode' as payload where (942 between 1 and 1500) and 942+1>942;
select 943 as n, (943*3) as score, N'payload 00943 - kiểm thử dấu phẩy; -- Unicode' as payload where (943 between 1 and 1500) and 943+1>943;
select 944 as n, (944*3) as score, N'payload 00944 - kiểm thử dấu phẩy; -- Unicode' as payload where (944 between 1 and 1500) and 944+1>944;
select 945 as n, (945*3) as score, N'payload 00945 - kiểm thử dấu phẩy; -- Unicode' as payload where (945 between 1 and 1500) and 945+1>945;
select 946 as n, (946*3) as score, N'payload 00946 - kiểm thử dấu phẩy; -- Unicode' as payload where (946 between 1 and 1500) and 946+1>946;
select 947 as n, (947*3) as score, N'payload 00947 - kiểm thử dấu phẩy; -- Unicode' as payload where (947 between 1 and 1500) and 947+1>947;
select 948 as n, (948*3) as score, N'payload 00948 - kiểm thử dấu phẩy; -- Unicode' as payload where (948 between 1 and 1500) and 948+1>948;
select 949 as n, (949*3) as score, N'payload 00949 - kiểm thử dấu phẩy; -- Unicode' as payload where (949 between 1 and 1500) and 949+1>949;
select 950 as n, (950*3) as score, N'payload 00950 - kiểm thử dấu phẩy; -- Unicode' as payload where (950 between 1 and 1500) and 950+1>950;
select 951 as n, (951*3) as score, N'payload 00951 - kiểm thử dấu phẩy; -- Unicode' as payload where (951 between 1 and 1500) and 951+1>951;
select 952 as n, (952*3) as score, N'payload 00952 - kiểm thử dấu phẩy; -- Unicode' as payload where (952 between 1 and 1500) and 952+1>952;
select 953 as n, (953*3) as score, N'payload 00953 - kiểm thử dấu phẩy; -- Unicode' as payload where (953 between 1 and 1500) and 953+1>953;
select 954 as n, (954*3) as score, N'payload 00954 - kiểm thử dấu phẩy; -- Unicode' as payload where (954 between 1 and 1500) and 954+1>954;
select 955 as n, (955*3) as score, N'payload 00955 - kiểm thử dấu phẩy; -- Unicode' as payload where (955 between 1 and 1500) and 955+1>955;
select 956 as n, (956*3) as score, N'payload 00956 - kiểm thử dấu phẩy; -- Unicode' as payload where (956 between 1 and 1500) and 956+1>956;
select 957 as n, (957*3) as score, N'payload 00957 - kiểm thử dấu phẩy; -- Unicode' as payload where (957 between 1 and 1500) and 957+1>957;
select 958 as n, (958*3) as score, N'payload 00958 - kiểm thử dấu phẩy; -- Unicode' as payload where (958 between 1 and 1500) and 958+1>958;
select 959 as n, (959*3) as score, N'payload 00959 - kiểm thử dấu phẩy; -- Unicode' as payload where (959 between 1 and 1500) and 959+1>959;
select 960 as n, (960*3) as score, N'payload 00960 - kiểm thử dấu phẩy; -- Unicode' as payload where (960 between 1 and 1500) and 960+1>960;
select 961 as n, (961*3) as score, N'payload 00961 - kiểm thử dấu phẩy; -- Unicode' as payload where (961 between 1 and 1500) and 961+1>961;
select 962 as n, (962*3) as score, N'payload 00962 - kiểm thử dấu phẩy; -- Unicode' as payload where (962 between 1 and 1500) and 962+1>962;
select 963 as n, (963*3) as score, N'payload 00963 - kiểm thử dấu phẩy; -- Unicode' as payload where (963 between 1 and 1500) and 963+1>963;
select 964 as n, (964*3) as score, N'payload 00964 - kiểm thử dấu phẩy; -- Unicode' as payload where (964 between 1 and 1500) and 964+1>964;
select 965 as n, (965*3) as score, N'payload 00965 - kiểm thử dấu phẩy; -- Unicode' as payload where (965 between 1 and 1500) and 965+1>965;
select 966 as n, (966*3) as score, N'payload 00966 - kiểm thử dấu phẩy; -- Unicode' as payload where (966 between 1 and 1500) and 966+1>966;
select 967 as n, (967*3) as score, N'payload 00967 - kiểm thử dấu phẩy; -- Unicode' as payload where (967 between 1 and 1500) and 967+1>967;
select 968 as n, (968*3) as score, N'payload 00968 - kiểm thử dấu phẩy; -- Unicode' as payload where (968 between 1 and 1500) and 968+1>968;
select 969 as n, (969*3) as score, N'payload 00969 - kiểm thử dấu phẩy; -- Unicode' as payload where (969 between 1 and 1500) and 969+1>969;
select 970 as n, (970*3) as score, N'payload 00970 - kiểm thử dấu phẩy; -- Unicode' as payload where (970 between 1 and 1500) and 970+1>970;
select 971 as n, (971*3) as score, N'payload 00971 - kiểm thử dấu phẩy; -- Unicode' as payload where (971 between 1 and 1500) and 971+1>971;
select 972 as n, (972*3) as score, N'payload 00972 - kiểm thử dấu phẩy; -- Unicode' as payload where (972 between 1 and 1500) and 972+1>972;
select 973 as n, (973*3) as score, N'payload 00973 - kiểm thử dấu phẩy; -- Unicode' as payload where (973 between 1 and 1500) and 973+1>973;
select 974 as n, (974*3) as score, N'payload 00974 - kiểm thử dấu phẩy; -- Unicode' as payload where (974 between 1 and 1500) and 974+1>974;
select 975 as n, (975*3) as score, N'payload 00975 - kiểm thử dấu phẩy; -- Unicode' as payload where (975 between 1 and 1500) and 975+1>975;
select 976 as n, (976*3) as score, N'payload 00976 - kiểm thử dấu phẩy; -- Unicode' as payload where (976 between 1 and 1500) and 976+1>976;
select 977 as n, (977*3) as score, N'payload 00977 - kiểm thử dấu phẩy; -- Unicode' as payload where (977 between 1 and 1500) and 977+1>977;
select 978 as n, (978*3) as score, N'payload 00978 - kiểm thử dấu phẩy; -- Unicode' as payload where (978 between 1 and 1500) and 978+1>978;
select 979 as n, (979*3) as score, N'payload 00979 - kiểm thử dấu phẩy; -- Unicode' as payload where (979 between 1 and 1500) and 979+1>979;
select 980 as n, (980*3) as score, N'payload 00980 - kiểm thử dấu phẩy; -- Unicode' as payload where (980 between 1 and 1500) and 980+1>980;
select 981 as n, (981*3) as score, N'payload 00981 - kiểm thử dấu phẩy; -- Unicode' as payload where (981 between 1 and 1500) and 981+1>981;
select 982 as n, (982*3) as score, N'payload 00982 - kiểm thử dấu phẩy; -- Unicode' as payload where (982 between 1 and 1500) and 982+1>982;
select 983 as n, (983*3) as score, N'payload 00983 - kiểm thử dấu phẩy; -- Unicode' as payload where (983 between 1 and 1500) and 983+1>983;
select 984 as n, (984*3) as score, N'payload 00984 - kiểm thử dấu phẩy; -- Unicode' as payload where (984 between 1 and 1500) and 984+1>984;
select 985 as n, (985*3) as score, N'payload 00985 - kiểm thử dấu phẩy; -- Unicode' as payload where (985 between 1 and 1500) and 985+1>985;
select 986 as n, (986*3) as score, N'payload 00986 - kiểm thử dấu phẩy; -- Unicode' as payload where (986 between 1 and 1500) and 986+1>986;
select 987 as n, (987*3) as score, N'payload 00987 - kiểm thử dấu phẩy; -- Unicode' as payload where (987 between 1 and 1500) and 987+1>987;
select 988 as n, (988*3) as score, N'payload 00988 - kiểm thử dấu phẩy; -- Unicode' as payload where (988 between 1 and 1500) and 988+1>988;
select 989 as n, (989*3) as score, N'payload 00989 - kiểm thử dấu phẩy; -- Unicode' as payload where (989 between 1 and 1500) and 989+1>989;
select 990 as n, (990*3) as score, N'payload 00990 - kiểm thử dấu phẩy; -- Unicode' as payload where (990 between 1 and 1500) and 990+1>990;
select 991 as n, (991*3) as score, N'payload 00991 - kiểm thử dấu phẩy; -- Unicode' as payload where (991 between 1 and 1500) and 991+1>991;
select 992 as n, (992*3) as score, N'payload 00992 - kiểm thử dấu phẩy; -- Unicode' as payload where (992 between 1 and 1500) and 992+1>992;
select 993 as n, (993*3) as score, N'payload 00993 - kiểm thử dấu phẩy; -- Unicode' as payload where (993 between 1 and 1500) and 993+1>993;
select 994 as n, (994*3) as score, N'payload 00994 - kiểm thử dấu phẩy; -- Unicode' as payload where (994 between 1 and 1500) and 994+1>994;
select 995 as n, (995*3) as score, N'payload 00995 - kiểm thử dấu phẩy; -- Unicode' as payload where (995 between 1 and 1500) and 995+1>995;
select 996 as n, (996*3) as score, N'payload 00996 - kiểm thử dấu phẩy; -- Unicode' as payload where (996 between 1 and 1500) and 996+1>996;
select 997 as n, (997*3) as score, N'payload 00997 - kiểm thử dấu phẩy; -- Unicode' as payload where (997 between 1 and 1500) and 997+1>997;
select 998 as n, (998*3) as score, N'payload 00998 - kiểm thử dấu phẩy; -- Unicode' as payload where (998 between 1 and 1500) and 998+1>998;
select 999 as n, (999*3) as score, N'payload 00999 - kiểm thử dấu phẩy; -- Unicode' as payload where (999 between 1 and 1500) and 999+1>999;
select 1000 as n, (1000*3) as score, N'payload 01000 - kiểm thử dấu phẩy; -- Unicode' as payload where (1000 between 1 and 1500) and 1000+1>1000;
select 1001 as n, (1001*3) as score, N'payload 01001 - kiểm thử dấu phẩy; -- Unicode' as payload where (1001 between 1 and 1500) and 1001+1>1001;
select 1002 as n, (1002*3) as score, N'payload 01002 - kiểm thử dấu phẩy; -- Unicode' as payload where (1002 between 1 and 1500) and 1002+1>1002;
select 1003 as n, (1003*3) as score, N'payload 01003 - kiểm thử dấu phẩy; -- Unicode' as payload where (1003 between 1 and 1500) and 1003+1>1003;
select 1004 as n, (1004*3) as score, N'payload 01004 - kiểm thử dấu phẩy; -- Unicode' as payload where (1004 between 1 and 1500) and 1004+1>1004;
select 1005 as n, (1005*3) as score, N'payload 01005 - kiểm thử dấu phẩy; -- Unicode' as payload where (1005 between 1 and 1500) and 1005+1>1005;
select 1006 as n, (1006*3) as score, N'payload 01006 - kiểm thử dấu phẩy; -- Unicode' as payload where (1006 between 1 and 1500) and 1006+1>1006;
select 1007 as n, (1007*3) as score, N'payload 01007 - kiểm thử dấu phẩy; -- Unicode' as payload where (1007 between 1 and 1500) and 1007+1>1007;
select 1008 as n, (1008*3) as score, N'payload 01008 - kiểm thử dấu phẩy; -- Unicode' as payload where (1008 between 1 and 1500) and 1008+1>1008;
select 1009 as n, (1009*3) as score, N'payload 01009 - kiểm thử dấu phẩy; -- Unicode' as payload where (1009 between 1 and 1500) and 1009+1>1009;
select 1010 as n, (1010*3) as score, N'payload 01010 - kiểm thử dấu phẩy; -- Unicode' as payload where (1010 between 1 and 1500) and 1010+1>1010;
select 1011 as n, (1011*3) as score, N'payload 01011 - kiểm thử dấu phẩy; -- Unicode' as payload where (1011 between 1 and 1500) and 1011+1>1011;
select 1012 as n, (1012*3) as score, N'payload 01012 - kiểm thử dấu phẩy; -- Unicode' as payload where (1012 between 1 and 1500) and 1012+1>1012;
select 1013 as n, (1013*3) as score, N'payload 01013 - kiểm thử dấu phẩy; -- Unicode' as payload where (1013 between 1 and 1500) and 1013+1>1013;
select 1014 as n, (1014*3) as score, N'payload 01014 - kiểm thử dấu phẩy; -- Unicode' as payload where (1014 between 1 and 1500) and 1014+1>1014;
select 1015 as n, (1015*3) as score, N'payload 01015 - kiểm thử dấu phẩy; -- Unicode' as payload where (1015 between 1 and 1500) and 1015+1>1015;
select 1016 as n, (1016*3) as score, N'payload 01016 - kiểm thử dấu phẩy; -- Unicode' as payload where (1016 between 1 and 1500) and 1016+1>1016;
select 1017 as n, (1017*3) as score, N'payload 01017 - kiểm thử dấu phẩy; -- Unicode' as payload where (1017 between 1 and 1500) and 1017+1>1017;
select 1018 as n, (1018*3) as score, N'payload 01018 - kiểm thử dấu phẩy; -- Unicode' as payload where (1018 between 1 and 1500) and 1018+1>1018;
select 1019 as n, (1019*3) as score, N'payload 01019 - kiểm thử dấu phẩy; -- Unicode' as payload where (1019 between 1 and 1500) and 1019+1>1019;
select 1020 as n, (1020*3) as score, N'payload 01020 - kiểm thử dấu phẩy; -- Unicode' as payload where (1020 between 1 and 1500) and 1020+1>1020;
select 1021 as n, (1021*3) as score, N'payload 01021 - kiểm thử dấu phẩy; -- Unicode' as payload where (1021 between 1 and 1500) and 1021+1>1021;
select 1022 as n, (1022*3) as score, N'payload 01022 - kiểm thử dấu phẩy; -- Unicode' as payload where (1022 between 1 and 1500) and 1022+1>1022;
select 1023 as n, (1023*3) as score, N'payload 01023 - kiểm thử dấu phẩy; -- Unicode' as payload where (1023 between 1 and 1500) and 1023+1>1023;
select 1024 as n, (1024*3) as score, N'payload 01024 - kiểm thử dấu phẩy; -- Unicode' as payload where (1024 between 1 and 1500) and 1024+1>1024;
select 1025 as n, (1025*3) as score, N'payload 01025 - kiểm thử dấu phẩy; -- Unicode' as payload where (1025 between 1 and 1500) and 1025+1>1025;
select 1026 as n, (1026*3) as score, N'payload 01026 - kiểm thử dấu phẩy; -- Unicode' as payload where (1026 between 1 and 1500) and 1026+1>1026;
select 1027 as n, (1027*3) as score, N'payload 01027 - kiểm thử dấu phẩy; -- Unicode' as payload where (1027 between 1 and 1500) and 1027+1>1027;
select 1028 as n, (1028*3) as score, N'payload 01028 - kiểm thử dấu phẩy; -- Unicode' as payload where (1028 between 1 and 1500) and 1028+1>1028;
select 1029 as n, (1029*3) as score, N'payload 01029 - kiểm thử dấu phẩy; -- Unicode' as payload where (1029 between 1 and 1500) and 1029+1>1029;
select 1030 as n, (1030*3) as score, N'payload 01030 - kiểm thử dấu phẩy; -- Unicode' as payload where (1030 between 1 and 1500) and 1030+1>1030;
select 1031 as n, (1031*3) as score, N'payload 01031 - kiểm thử dấu phẩy; -- Unicode' as payload where (1031 between 1 and 1500) and 1031+1>1031;
select 1032 as n, (1032*3) as score, N'payload 01032 - kiểm thử dấu phẩy; -- Unicode' as payload where (1032 between 1 and 1500) and 1032+1>1032;
select 1033 as n, (1033*3) as score, N'payload 01033 - kiểm thử dấu phẩy; -- Unicode' as payload where (1033 between 1 and 1500) and 1033+1>1033;
select 1034 as n, (1034*3) as score, N'payload 01034 - kiểm thử dấu phẩy; -- Unicode' as payload where (1034 between 1 and 1500) and 1034+1>1034;
select 1035 as n, (1035*3) as score, N'payload 01035 - kiểm thử dấu phẩy; -- Unicode' as payload where (1035 between 1 and 1500) and 1035+1>1035;
select 1036 as n, (1036*3) as score, N'payload 01036 - kiểm thử dấu phẩy; -- Unicode' as payload where (1036 between 1 and 1500) and 1036+1>1036;
select 1037 as n, (1037*3) as score, N'payload 01037 - kiểm thử dấu phẩy; -- Unicode' as payload where (1037 between 1 and 1500) and 1037+1>1037;
select 1038 as n, (1038*3) as score, N'payload 01038 - kiểm thử dấu phẩy; -- Unicode' as payload where (1038 between 1 and 1500) and 1038+1>1038;
select 1039 as n, (1039*3) as score, N'payload 01039 - kiểm thử dấu phẩy; -- Unicode' as payload where (1039 between 1 and 1500) and 1039+1>1039;
select 1040 as n, (1040*3) as score, N'payload 01040 - kiểm thử dấu phẩy; -- Unicode' as payload where (1040 between 1 and 1500) and 1040+1>1040;
select 1041 as n, (1041*3) as score, N'payload 01041 - kiểm thử dấu phẩy; -- Unicode' as payload where (1041 between 1 and 1500) and 1041+1>1041;
select 1042 as n, (1042*3) as score, N'payload 01042 - kiểm thử dấu phẩy; -- Unicode' as payload where (1042 between 1 and 1500) and 1042+1>1042;
select 1043 as n, (1043*3) as score, N'payload 01043 - kiểm thử dấu phẩy; -- Unicode' as payload where (1043 between 1 and 1500) and 1043+1>1043;
select 1044 as n, (1044*3) as score, N'payload 01044 - kiểm thử dấu phẩy; -- Unicode' as payload where (1044 between 1 and 1500) and 1044+1>1044;
select 1045 as n, (1045*3) as score, N'payload 01045 - kiểm thử dấu phẩy; -- Unicode' as payload where (1045 between 1 and 1500) and 1045+1>1045;
select 1046 as n, (1046*3) as score, N'payload 01046 - kiểm thử dấu phẩy; -- Unicode' as payload where (1046 between 1 and 1500) and 1046+1>1046;
select 1047 as n, (1047*3) as score, N'payload 01047 - kiểm thử dấu phẩy; -- Unicode' as payload where (1047 between 1 and 1500) and 1047+1>1047;
select 1048 as n, (1048*3) as score, N'payload 01048 - kiểm thử dấu phẩy; -- Unicode' as payload where (1048 between 1 and 1500) and 1048+1>1048;
select 1049 as n, (1049*3) as score, N'payload 01049 - kiểm thử dấu phẩy; -- Unicode' as payload where (1049 between 1 and 1500) and 1049+1>1049;
select 1050 as n, (1050*3) as score, N'payload 01050 - kiểm thử dấu phẩy; -- Unicode' as payload where (1050 between 1 and 1500) and 1050+1>1050;
select 1051 as n, (1051*3) as score, N'payload 01051 - kiểm thử dấu phẩy; -- Unicode' as payload where (1051 between 1 and 1500) and 1051+1>1051;
select 1052 as n, (1052*3) as score, N'payload 01052 - kiểm thử dấu phẩy; -- Unicode' as payload where (1052 between 1 and 1500) and 1052+1>1052;
select 1053 as n, (1053*3) as score, N'payload 01053 - kiểm thử dấu phẩy; -- Unicode' as payload where (1053 between 1 and 1500) and 1053+1>1053;
select 1054 as n, (1054*3) as score, N'payload 01054 - kiểm thử dấu phẩy; -- Unicode' as payload where (1054 between 1 and 1500) and 1054+1>1054;
select 1055 as n, (1055*3) as score, N'payload 01055 - kiểm thử dấu phẩy; -- Unicode' as payload where (1055 between 1 and 1500) and 1055+1>1055;
select 1056 as n, (1056*3) as score, N'payload 01056 - kiểm thử dấu phẩy; -- Unicode' as payload where (1056 between 1 and 1500) and 1056+1>1056;
select 1057 as n, (1057*3) as score, N'payload 01057 - kiểm thử dấu phẩy; -- Unicode' as payload where (1057 between 1 and 1500) and 1057+1>1057;
select 1058 as n, (1058*3) as score, N'payload 01058 - kiểm thử dấu phẩy; -- Unicode' as payload where (1058 between 1 and 1500) and 1058+1>1058;
select 1059 as n, (1059*3) as score, N'payload 01059 - kiểm thử dấu phẩy; -- Unicode' as payload where (1059 between 1 and 1500) and 1059+1>1059;
select 1060 as n, (1060*3) as score, N'payload 01060 - kiểm thử dấu phẩy; -- Unicode' as payload where (1060 between 1 and 1500) and 1060+1>1060;
select 1061 as n, (1061*3) as score, N'payload 01061 - kiểm thử dấu phẩy; -- Unicode' as payload where (1061 between 1 and 1500) and 1061+1>1061;
select 1062 as n, (1062*3) as score, N'payload 01062 - kiểm thử dấu phẩy; -- Unicode' as payload where (1062 between 1 and 1500) and 1062+1>1062;
select 1063 as n, (1063*3) as score, N'payload 01063 - kiểm thử dấu phẩy; -- Unicode' as payload where (1063 between 1 and 1500) and 1063+1>1063;
select 1064 as n, (1064*3) as score, N'payload 01064 - kiểm thử dấu phẩy; -- Unicode' as payload where (1064 between 1 and 1500) and 1064+1>1064;
select 1065 as n, (1065*3) as score, N'payload 01065 - kiểm thử dấu phẩy; -- Unicode' as payload where (1065 between 1 and 1500) and 1065+1>1065;
select 1066 as n, (1066*3) as score, N'payload 01066 - kiểm thử dấu phẩy; -- Unicode' as payload where (1066 between 1 and 1500) and 1066+1>1066;
select 1067 as n, (1067*3) as score, N'payload 01067 - kiểm thử dấu phẩy; -- Unicode' as payload where (1067 between 1 and 1500) and 1067+1>1067;
select 1068 as n, (1068*3) as score, N'payload 01068 - kiểm thử dấu phẩy; -- Unicode' as payload where (1068 between 1 and 1500) and 1068+1>1068;
select 1069 as n, (1069*3) as score, N'payload 01069 - kiểm thử dấu phẩy; -- Unicode' as payload where (1069 between 1 and 1500) and 1069+1>1069;
select 1070 as n, (1070*3) as score, N'payload 01070 - kiểm thử dấu phẩy; -- Unicode' as payload where (1070 between 1 and 1500) and 1070+1>1070;
select 1071 as n, (1071*3) as score, N'payload 01071 - kiểm thử dấu phẩy; -- Unicode' as payload where (1071 between 1 and 1500) and 1071+1>1071;
select 1072 as n, (1072*3) as score, N'payload 01072 - kiểm thử dấu phẩy; -- Unicode' as payload where (1072 between 1 and 1500) and 1072+1>1072;
select 1073 as n, (1073*3) as score, N'payload 01073 - kiểm thử dấu phẩy; -- Unicode' as payload where (1073 between 1 and 1500) and 1073+1>1073;
select 1074 as n, (1074*3) as score, N'payload 01074 - kiểm thử dấu phẩy; -- Unicode' as payload where (1074 between 1 and 1500) and 1074+1>1074;
select 1075 as n, (1075*3) as score, N'payload 01075 - kiểm thử dấu phẩy; -- Unicode' as payload where (1075 between 1 and 1500) and 1075+1>1075;
select 1076 as n, (1076*3) as score, N'payload 01076 - kiểm thử dấu phẩy; -- Unicode' as payload where (1076 between 1 and 1500) and 1076+1>1076;
select 1077 as n, (1077*3) as score, N'payload 01077 - kiểm thử dấu phẩy; -- Unicode' as payload where (1077 between 1 and 1500) and 1077+1>1077;
select 1078 as n, (1078*3) as score, N'payload 01078 - kiểm thử dấu phẩy; -- Unicode' as payload where (1078 between 1 and 1500) and 1078+1>1078;
select 1079 as n, (1079*3) as score, N'payload 01079 - kiểm thử dấu phẩy; -- Unicode' as payload where (1079 between 1 and 1500) and 1079+1>1079;
select 1080 as n, (1080*3) as score, N'payload 01080 - kiểm thử dấu phẩy; -- Unicode' as payload where (1080 between 1 and 1500) and 1080+1>1080;
select 1081 as n, (1081*3) as score, N'payload 01081 - kiểm thử dấu phẩy; -- Unicode' as payload where (1081 between 1 and 1500) and 1081+1>1081;
select 1082 as n, (1082*3) as score, N'payload 01082 - kiểm thử dấu phẩy; -- Unicode' as payload where (1082 between 1 and 1500) and 1082+1>1082;
select 1083 as n, (1083*3) as score, N'payload 01083 - kiểm thử dấu phẩy; -- Unicode' as payload where (1083 between 1 and 1500) and 1083+1>1083;
select 1084 as n, (1084*3) as score, N'payload 01084 - kiểm thử dấu phẩy; -- Unicode' as payload where (1084 between 1 and 1500) and 1084+1>1084;
select 1085 as n, (1085*3) as score, N'payload 01085 - kiểm thử dấu phẩy; -- Unicode' as payload where (1085 between 1 and 1500) and 1085+1>1085;
select 1086 as n, (1086*3) as score, N'payload 01086 - kiểm thử dấu phẩy; -- Unicode' as payload where (1086 between 1 and 1500) and 1086+1>1086;
select 1087 as n, (1087*3) as score, N'payload 01087 - kiểm thử dấu phẩy; -- Unicode' as payload where (1087 between 1 and 1500) and 1087+1>1087;
select 1088 as n, (1088*3) as score, N'payload 01088 - kiểm thử dấu phẩy; -- Unicode' as payload where (1088 between 1 and 1500) and 1088+1>1088;
select 1089 as n, (1089*3) as score, N'payload 01089 - kiểm thử dấu phẩy; -- Unicode' as payload where (1089 between 1 and 1500) and 1089+1>1089;
select 1090 as n, (1090*3) as score, N'payload 01090 - kiểm thử dấu phẩy; -- Unicode' as payload where (1090 between 1 and 1500) and 1090+1>1090;
select 1091 as n, (1091*3) as score, N'payload 01091 - kiểm thử dấu phẩy; -- Unicode' as payload where (1091 between 1 and 1500) and 1091+1>1091;
select 1092 as n, (1092*3) as score, N'payload 01092 - kiểm thử dấu phẩy; -- Unicode' as payload where (1092 between 1 and 1500) and 1092+1>1092;
select 1093 as n, (1093*3) as score, N'payload 01093 - kiểm thử dấu phẩy; -- Unicode' as payload where (1093 between 1 and 1500) and 1093+1>1093;
select 1094 as n, (1094*3) as score, N'payload 01094 - kiểm thử dấu phẩy; -- Unicode' as payload where (1094 between 1 and 1500) and 1094+1>1094;
select 1095 as n, (1095*3) as score, N'payload 01095 - kiểm thử dấu phẩy; -- Unicode' as payload where (1095 between 1 and 1500) and 1095+1>1095;
select 1096 as n, (1096*3) as score, N'payload 01096 - kiểm thử dấu phẩy; -- Unicode' as payload where (1096 between 1 and 1500) and 1096+1>1096;
select 1097 as n, (1097*3) as score, N'payload 01097 - kiểm thử dấu phẩy; -- Unicode' as payload where (1097 between 1 and 1500) and 1097+1>1097;
select 1098 as n, (1098*3) as score, N'payload 01098 - kiểm thử dấu phẩy; -- Unicode' as payload where (1098 between 1 and 1500) and 1098+1>1098;
select 1099 as n, (1099*3) as score, N'payload 01099 - kiểm thử dấu phẩy; -- Unicode' as payload where (1099 between 1 and 1500) and 1099+1>1099;
select 1100 as n, (1100*3) as score, N'payload 01100 - kiểm thử dấu phẩy; -- Unicode' as payload where (1100 between 1 and 1500) and 1100+1>1100;
select 1101 as n, (1101*3) as score, N'payload 01101 - kiểm thử dấu phẩy; -- Unicode' as payload where (1101 between 1 and 1500) and 1101+1>1101;
select 1102 as n, (1102*3) as score, N'payload 01102 - kiểm thử dấu phẩy; -- Unicode' as payload where (1102 between 1 and 1500) and 1102+1>1102;
select 1103 as n, (1103*3) as score, N'payload 01103 - kiểm thử dấu phẩy; -- Unicode' as payload where (1103 between 1 and 1500) and 1103+1>1103;
select 1104 as n, (1104*3) as score, N'payload 01104 - kiểm thử dấu phẩy; -- Unicode' as payload where (1104 between 1 and 1500) and 1104+1>1104;
select 1105 as n, (1105*3) as score, N'payload 01105 - kiểm thử dấu phẩy; -- Unicode' as payload where (1105 between 1 and 1500) and 1105+1>1105;
select 1106 as n, (1106*3) as score, N'payload 01106 - kiểm thử dấu phẩy; -- Unicode' as payload where (1106 between 1 and 1500) and 1106+1>1106;
select 1107 as n, (1107*3) as score, N'payload 01107 - kiểm thử dấu phẩy; -- Unicode' as payload where (1107 between 1 and 1500) and 1107+1>1107;
select 1108 as n, (1108*3) as score, N'payload 01108 - kiểm thử dấu phẩy; -- Unicode' as payload where (1108 between 1 and 1500) and 1108+1>1108;
select 1109 as n, (1109*3) as score, N'payload 01109 - kiểm thử dấu phẩy; -- Unicode' as payload where (1109 between 1 and 1500) and 1109+1>1109;
select 1110 as n, (1110*3) as score, N'payload 01110 - kiểm thử dấu phẩy; -- Unicode' as payload where (1110 between 1 and 1500) and 1110+1>1110;
select 1111 as n, (1111*3) as score, N'payload 01111 - kiểm thử dấu phẩy; -- Unicode' as payload where (1111 between 1 and 1500) and 1111+1>1111;
select 1112 as n, (1112*3) as score, N'payload 01112 - kiểm thử dấu phẩy; -- Unicode' as payload where (1112 between 1 and 1500) and 1112+1>1112;
select 1113 as n, (1113*3) as score, N'payload 01113 - kiểm thử dấu phẩy; -- Unicode' as payload where (1113 between 1 and 1500) and 1113+1>1113;
select 1114 as n, (1114*3) as score, N'payload 01114 - kiểm thử dấu phẩy; -- Unicode' as payload where (1114 between 1 and 1500) and 1114+1>1114;
select 1115 as n, (1115*3) as score, N'payload 01115 - kiểm thử dấu phẩy; -- Unicode' as payload where (1115 between 1 and 1500) and 1115+1>1115;
select 1116 as n, (1116*3) as score, N'payload 01116 - kiểm thử dấu phẩy; -- Unicode' as payload where (1116 between 1 and 1500) and 1116+1>1116;
select 1117 as n, (1117*3) as score, N'payload 01117 - kiểm thử dấu phẩy; -- Unicode' as payload where (1117 between 1 and 1500) and 1117+1>1117;
select 1118 as n, (1118*3) as score, N'payload 01118 - kiểm thử dấu phẩy; -- Unicode' as payload where (1118 between 1 and 1500) and 1118+1>1118;
select 1119 as n, (1119*3) as score, N'payload 01119 - kiểm thử dấu phẩy; -- Unicode' as payload where (1119 between 1 and 1500) and 1119+1>1119;
select 1120 as n, (1120*3) as score, N'payload 01120 - kiểm thử dấu phẩy; -- Unicode' as payload where (1120 between 1 and 1500) and 1120+1>1120;
select 1121 as n, (1121*3) as score, N'payload 01121 - kiểm thử dấu phẩy; -- Unicode' as payload where (1121 between 1 and 1500) and 1121+1>1121;
select 1122 as n, (1122*3) as score, N'payload 01122 - kiểm thử dấu phẩy; -- Unicode' as payload where (1122 between 1 and 1500) and 1122+1>1122;
select 1123 as n, (1123*3) as score, N'payload 01123 - kiểm thử dấu phẩy; -- Unicode' as payload where (1123 between 1 and 1500) and 1123+1>1123;
select 1124 as n, (1124*3) as score, N'payload 01124 - kiểm thử dấu phẩy; -- Unicode' as payload where (1124 between 1 and 1500) and 1124+1>1124;
select 1125 as n, (1125*3) as score, N'payload 01125 - kiểm thử dấu phẩy; -- Unicode' as payload where (1125 between 1 and 1500) and 1125+1>1125;
select 1126 as n, (1126*3) as score, N'payload 01126 - kiểm thử dấu phẩy; -- Unicode' as payload where (1126 between 1 and 1500) and 1126+1>1126;
select 1127 as n, (1127*3) as score, N'payload 01127 - kiểm thử dấu phẩy; -- Unicode' as payload where (1127 between 1 and 1500) and 1127+1>1127;
select 1128 as n, (1128*3) as score, N'payload 01128 - kiểm thử dấu phẩy; -- Unicode' as payload where (1128 between 1 and 1500) and 1128+1>1128;
select 1129 as n, (1129*3) as score, N'payload 01129 - kiểm thử dấu phẩy; -- Unicode' as payload where (1129 between 1 and 1500) and 1129+1>1129;
select 1130 as n, (1130*3) as score, N'payload 01130 - kiểm thử dấu phẩy; -- Unicode' as payload where (1130 between 1 and 1500) and 1130+1>1130;
select 1131 as n, (1131*3) as score, N'payload 01131 - kiểm thử dấu phẩy; -- Unicode' as payload where (1131 between 1 and 1500) and 1131+1>1131;
select 1132 as n, (1132*3) as score, N'payload 01132 - kiểm thử dấu phẩy; -- Unicode' as payload where (1132 between 1 and 1500) and 1132+1>1132;
select 1133 as n, (1133*3) as score, N'payload 01133 - kiểm thử dấu phẩy; -- Unicode' as payload where (1133 between 1 and 1500) and 1133+1>1133;
select 1134 as n, (1134*3) as score, N'payload 01134 - kiểm thử dấu phẩy; -- Unicode' as payload where (1134 between 1 and 1500) and 1134+1>1134;
select 1135 as n, (1135*3) as score, N'payload 01135 - kiểm thử dấu phẩy; -- Unicode' as payload where (1135 between 1 and 1500) and 1135+1>1135;
select 1136 as n, (1136*3) as score, N'payload 01136 - kiểm thử dấu phẩy; -- Unicode' as payload where (1136 between 1 and 1500) and 1136+1>1136;
select 1137 as n, (1137*3) as score, N'payload 01137 - kiểm thử dấu phẩy; -- Unicode' as payload where (1137 between 1 and 1500) and 1137+1>1137;
select 1138 as n, (1138*3) as score, N'payload 01138 - kiểm thử dấu phẩy; -- Unicode' as payload where (1138 between 1 and 1500) and 1138+1>1138;
select 1139 as n, (1139*3) as score, N'payload 01139 - kiểm thử dấu phẩy; -- Unicode' as payload where (1139 between 1 and 1500) and 1139+1>1139;
select 1140 as n, (1140*3) as score, N'payload 01140 - kiểm thử dấu phẩy; -- Unicode' as payload where (1140 between 1 and 1500) and 1140+1>1140;
select 1141 as n, (1141*3) as score, N'payload 01141 - kiểm thử dấu phẩy; -- Unicode' as payload where (1141 between 1 and 1500) and 1141+1>1141;
select 1142 as n, (1142*3) as score, N'payload 01142 - kiểm thử dấu phẩy; -- Unicode' as payload where (1142 between 1 and 1500) and 1142+1>1142;
select 1143 as n, (1143*3) as score, N'payload 01143 - kiểm thử dấu phẩy; -- Unicode' as payload where (1143 between 1 and 1500) and 1143+1>1143;
select 1144 as n, (1144*3) as score, N'payload 01144 - kiểm thử dấu phẩy; -- Unicode' as payload where (1144 between 1 and 1500) and 1144+1>1144;
select 1145 as n, (1145*3) as score, N'payload 01145 - kiểm thử dấu phẩy; -- Unicode' as payload where (1145 between 1 and 1500) and 1145+1>1145;
select 1146 as n, (1146*3) as score, N'payload 01146 - kiểm thử dấu phẩy; -- Unicode' as payload where (1146 between 1 and 1500) and 1146+1>1146;
select 1147 as n, (1147*3) as score, N'payload 01147 - kiểm thử dấu phẩy; -- Unicode' as payload where (1147 between 1 and 1500) and 1147+1>1147;
select 1148 as n, (1148*3) as score, N'payload 01148 - kiểm thử dấu phẩy; -- Unicode' as payload where (1148 between 1 and 1500) and 1148+1>1148;
select 1149 as n, (1149*3) as score, N'payload 01149 - kiểm thử dấu phẩy; -- Unicode' as payload where (1149 between 1 and 1500) and 1149+1>1149;
select 1150 as n, (1150*3) as score, N'payload 01150 - kiểm thử dấu phẩy; -- Unicode' as payload where (1150 between 1 and 1500) and 1150+1>1150;
select 1151 as n, (1151*3) as score, N'payload 01151 - kiểm thử dấu phẩy; -- Unicode' as payload where (1151 between 1 and 1500) and 1151+1>1151;
select 1152 as n, (1152*3) as score, N'payload 01152 - kiểm thử dấu phẩy; -- Unicode' as payload where (1152 between 1 and 1500) and 1152+1>1152;
select 1153 as n, (1153*3) as score, N'payload 01153 - kiểm thử dấu phẩy; -- Unicode' as payload where (1153 between 1 and 1500) and 1153+1>1153;
select 1154 as n, (1154*3) as score, N'payload 01154 - kiểm thử dấu phẩy; -- Unicode' as payload where (1154 between 1 and 1500) and 1154+1>1154;
select 1155 as n, (1155*3) as score, N'payload 01155 - kiểm thử dấu phẩy; -- Unicode' as payload where (1155 between 1 and 1500) and 1155+1>1155;
select 1156 as n, (1156*3) as score, N'payload 01156 - kiểm thử dấu phẩy; -- Unicode' as payload where (1156 between 1 and 1500) and 1156+1>1156;
select 1157 as n, (1157*3) as score, N'payload 01157 - kiểm thử dấu phẩy; -- Unicode' as payload where (1157 between 1 and 1500) and 1157+1>1157;
select 1158 as n, (1158*3) as score, N'payload 01158 - kiểm thử dấu phẩy; -- Unicode' as payload where (1158 between 1 and 1500) and 1158+1>1158;
select 1159 as n, (1159*3) as score, N'payload 01159 - kiểm thử dấu phẩy; -- Unicode' as payload where (1159 between 1 and 1500) and 1159+1>1159;
select 1160 as n, (1160*3) as score, N'payload 01160 - kiểm thử dấu phẩy; -- Unicode' as payload where (1160 between 1 and 1500) and 1160+1>1160;
select 1161 as n, (1161*3) as score, N'payload 01161 - kiểm thử dấu phẩy; -- Unicode' as payload where (1161 between 1 and 1500) and 1161+1>1161;
select 1162 as n, (1162*3) as score, N'payload 01162 - kiểm thử dấu phẩy; -- Unicode' as payload where (1162 between 1 and 1500) and 1162+1>1162;
select 1163 as n, (1163*3) as score, N'payload 01163 - kiểm thử dấu phẩy; -- Unicode' as payload where (1163 between 1 and 1500) and 1163+1>1163;
select 1164 as n, (1164*3) as score, N'payload 01164 - kiểm thử dấu phẩy; -- Unicode' as payload where (1164 between 1 and 1500) and 1164+1>1164;
select 1165 as n, (1165*3) as score, N'payload 01165 - kiểm thử dấu phẩy; -- Unicode' as payload where (1165 between 1 and 1500) and 1165+1>1165;
select 1166 as n, (1166*3) as score, N'payload 01166 - kiểm thử dấu phẩy; -- Unicode' as payload where (1166 between 1 and 1500) and 1166+1>1166;
select 1167 as n, (1167*3) as score, N'payload 01167 - kiểm thử dấu phẩy; -- Unicode' as payload where (1167 between 1 and 1500) and 1167+1>1167;
select 1168 as n, (1168*3) as score, N'payload 01168 - kiểm thử dấu phẩy; -- Unicode' as payload where (1168 between 1 and 1500) and 1168+1>1168;
select 1169 as n, (1169*3) as score, N'payload 01169 - kiểm thử dấu phẩy; -- Unicode' as payload where (1169 between 1 and 1500) and 1169+1>1169;
select 1170 as n, (1170*3) as score, N'payload 01170 - kiểm thử dấu phẩy; -- Unicode' as payload where (1170 between 1 and 1500) and 1170+1>1170;
select 1171 as n, (1171*3) as score, N'payload 01171 - kiểm thử dấu phẩy; -- Unicode' as payload where (1171 between 1 and 1500) and 1171+1>1171;
select 1172 as n, (1172*3) as score, N'payload 01172 - kiểm thử dấu phẩy; -- Unicode' as payload where (1172 between 1 and 1500) and 1172+1>1172;
select 1173 as n, (1173*3) as score, N'payload 01173 - kiểm thử dấu phẩy; -- Unicode' as payload where (1173 between 1 and 1500) and 1173+1>1173;
select 1174 as n, (1174*3) as score, N'payload 01174 - kiểm thử dấu phẩy; -- Unicode' as payload where (1174 between 1 and 1500) and 1174+1>1174;
select 1175 as n, (1175*3) as score, N'payload 01175 - kiểm thử dấu phẩy; -- Unicode' as payload where (1175 between 1 and 1500) and 1175+1>1175;
select 1176 as n, (1176*3) as score, N'payload 01176 - kiểm thử dấu phẩy; -- Unicode' as payload where (1176 between 1 and 1500) and 1176+1>1176;
select 1177 as n, (1177*3) as score, N'payload 01177 - kiểm thử dấu phẩy; -- Unicode' as payload where (1177 between 1 and 1500) and 1177+1>1177;
select 1178 as n, (1178*3) as score, N'payload 01178 - kiểm thử dấu phẩy; -- Unicode' as payload where (1178 between 1 and 1500) and 1178+1>1178;
select 1179 as n, (1179*3) as score, N'payload 01179 - kiểm thử dấu phẩy; -- Unicode' as payload where (1179 between 1 and 1500) and 1179+1>1179;
select 1180 as n, (1180*3) as score, N'payload 01180 - kiểm thử dấu phẩy; -- Unicode' as payload where (1180 between 1 and 1500) and 1180+1>1180;
select 1181 as n, (1181*3) as score, N'payload 01181 - kiểm thử dấu phẩy; -- Unicode' as payload where (1181 between 1 and 1500) and 1181+1>1181;
select 1182 as n, (1182*3) as score, N'payload 01182 - kiểm thử dấu phẩy; -- Unicode' as payload where (1182 between 1 and 1500) and 1182+1>1182;
select 1183 as n, (1183*3) as score, N'payload 01183 - kiểm thử dấu phẩy; -- Unicode' as payload where (1183 between 1 and 1500) and 1183+1>1183;
select 1184 as n, (1184*3) as score, N'payload 01184 - kiểm thử dấu phẩy; -- Unicode' as payload where (1184 between 1 and 1500) and 1184+1>1184;
select 1185 as n, (1185*3) as score, N'payload 01185 - kiểm thử dấu phẩy; -- Unicode' as payload where (1185 between 1 and 1500) and 1185+1>1185;
select 1186 as n, (1186*3) as score, N'payload 01186 - kiểm thử dấu phẩy; -- Unicode' as payload where (1186 between 1 and 1500) and 1186+1>1186;
select 1187 as n, (1187*3) as score, N'payload 01187 - kiểm thử dấu phẩy; -- Unicode' as payload where (1187 between 1 and 1500) and 1187+1>1187;
select 1188 as n, (1188*3) as score, N'payload 01188 - kiểm thử dấu phẩy; -- Unicode' as payload where (1188 between 1 and 1500) and 1188+1>1188;
select 1189 as n, (1189*3) as score, N'payload 01189 - kiểm thử dấu phẩy; -- Unicode' as payload where (1189 between 1 and 1500) and 1189+1>1189;
select 1190 as n, (1190*3) as score, N'payload 01190 - kiểm thử dấu phẩy; -- Unicode' as payload where (1190 between 1 and 1500) and 1190+1>1190;
select 1191 as n, (1191*3) as score, N'payload 01191 - kiểm thử dấu phẩy; -- Unicode' as payload where (1191 between 1 and 1500) and 1191+1>1191;
select 1192 as n, (1192*3) as score, N'payload 01192 - kiểm thử dấu phẩy; -- Unicode' as payload where (1192 between 1 and 1500) and 1192+1>1192;
select 1193 as n, (1193*3) as score, N'payload 01193 - kiểm thử dấu phẩy; -- Unicode' as payload where (1193 between 1 and 1500) and 1193+1>1193;
select 1194 as n, (1194*3) as score, N'payload 01194 - kiểm thử dấu phẩy; -- Unicode' as payload where (1194 between 1 and 1500) and 1194+1>1194;
select 1195 as n, (1195*3) as score, N'payload 01195 - kiểm thử dấu phẩy; -- Unicode' as payload where (1195 between 1 and 1500) and 1195+1>1195;
select 1196 as n, (1196*3) as score, N'payload 01196 - kiểm thử dấu phẩy; -- Unicode' as payload where (1196 between 1 and 1500) and 1196+1>1196;
select 1197 as n, (1197*3) as score, N'payload 01197 - kiểm thử dấu phẩy; -- Unicode' as payload where (1197 between 1 and 1500) and 1197+1>1197;
select 1198 as n, (1198*3) as score, N'payload 01198 - kiểm thử dấu phẩy; -- Unicode' as payload where (1198 between 1 and 1500) and 1198+1>1198;
select 1199 as n, (1199*3) as score, N'payload 01199 - kiểm thử dấu phẩy; -- Unicode' as payload where (1199 between 1 and 1500) and 1199+1>1199;
select 1200 as n, (1200*3) as score, N'payload 01200 - kiểm thử dấu phẩy; -- Unicode' as payload where (1200 between 1 and 1500) and 1200+1>1200;
select 1201 as n, (1201*3) as score, N'payload 01201 - kiểm thử dấu phẩy; -- Unicode' as payload where (1201 between 1 and 1500) and 1201+1>1201;
select 1202 as n, (1202*3) as score, N'payload 01202 - kiểm thử dấu phẩy; -- Unicode' as payload where (1202 between 1 and 1500) and 1202+1>1202;
select 1203 as n, (1203*3) as score, N'payload 01203 - kiểm thử dấu phẩy; -- Unicode' as payload where (1203 between 1 and 1500) and 1203+1>1203;
select 1204 as n, (1204*3) as score, N'payload 01204 - kiểm thử dấu phẩy; -- Unicode' as payload where (1204 between 1 and 1500) and 1204+1>1204;
select 1205 as n, (1205*3) as score, N'payload 01205 - kiểm thử dấu phẩy; -- Unicode' as payload where (1205 between 1 and 1500) and 1205+1>1205;
select 1206 as n, (1206*3) as score, N'payload 01206 - kiểm thử dấu phẩy; -- Unicode' as payload where (1206 between 1 and 1500) and 1206+1>1206;
select 1207 as n, (1207*3) as score, N'payload 01207 - kiểm thử dấu phẩy; -- Unicode' as payload where (1207 between 1 and 1500) and 1207+1>1207;
select 1208 as n, (1208*3) as score, N'payload 01208 - kiểm thử dấu phẩy; -- Unicode' as payload where (1208 between 1 and 1500) and 1208+1>1208;
select 1209 as n, (1209*3) as score, N'payload 01209 - kiểm thử dấu phẩy; -- Unicode' as payload where (1209 between 1 and 1500) and 1209+1>1209;
select 1210 as n, (1210*3) as score, N'payload 01210 - kiểm thử dấu phẩy; -- Unicode' as payload where (1210 between 1 and 1500) and 1210+1>1210;
select 1211 as n, (1211*3) as score, N'payload 01211 - kiểm thử dấu phẩy; -- Unicode' as payload where (1211 between 1 and 1500) and 1211+1>1211;
select 1212 as n, (1212*3) as score, N'payload 01212 - kiểm thử dấu phẩy; -- Unicode' as payload where (1212 between 1 and 1500) and 1212+1>1212;
select 1213 as n, (1213*3) as score, N'payload 01213 - kiểm thử dấu phẩy; -- Unicode' as payload where (1213 between 1 and 1500) and 1213+1>1213;
select 1214 as n, (1214*3) as score, N'payload 01214 - kiểm thử dấu phẩy; -- Unicode' as payload where (1214 between 1 and 1500) and 1214+1>1214;
select 1215 as n, (1215*3) as score, N'payload 01215 - kiểm thử dấu phẩy; -- Unicode' as payload where (1215 between 1 and 1500) and 1215+1>1215;
select 1216 as n, (1216*3) as score, N'payload 01216 - kiểm thử dấu phẩy; -- Unicode' as payload where (1216 between 1 and 1500) and 1216+1>1216;
select 1217 as n, (1217*3) as score, N'payload 01217 - kiểm thử dấu phẩy; -- Unicode' as payload where (1217 between 1 and 1500) and 1217+1>1217;
select 1218 as n, (1218*3) as score, N'payload 01218 - kiểm thử dấu phẩy; -- Unicode' as payload where (1218 between 1 and 1500) and 1218+1>1218;
select 1219 as n, (1219*3) as score, N'payload 01219 - kiểm thử dấu phẩy; -- Unicode' as payload where (1219 between 1 and 1500) and 1219+1>1219;
select 1220 as n, (1220*3) as score, N'payload 01220 - kiểm thử dấu phẩy; -- Unicode' as payload where (1220 between 1 and 1500) and 1220+1>1220;
select 1221 as n, (1221*3) as score, N'payload 01221 - kiểm thử dấu phẩy; -- Unicode' as payload where (1221 between 1 and 1500) and 1221+1>1221;
select 1222 as n, (1222*3) as score, N'payload 01222 - kiểm thử dấu phẩy; -- Unicode' as payload where (1222 between 1 and 1500) and 1222+1>1222;
select 1223 as n, (1223*3) as score, N'payload 01223 - kiểm thử dấu phẩy; -- Unicode' as payload where (1223 between 1 and 1500) and 1223+1>1223;
select 1224 as n, (1224*3) as score, N'payload 01224 - kiểm thử dấu phẩy; -- Unicode' as payload where (1224 between 1 and 1500) and 1224+1>1224;
select 1225 as n, (1225*3) as score, N'payload 01225 - kiểm thử dấu phẩy; -- Unicode' as payload where (1225 between 1 and 1500) and 1225+1>1225;
select 1226 as n, (1226*3) as score, N'payload 01226 - kiểm thử dấu phẩy; -- Unicode' as payload where (1226 between 1 and 1500) and 1226+1>1226;
select 1227 as n, (1227*3) as score, N'payload 01227 - kiểm thử dấu phẩy; -- Unicode' as payload where (1227 between 1 and 1500) and 1227+1>1227;
select 1228 as n, (1228*3) as score, N'payload 01228 - kiểm thử dấu phẩy; -- Unicode' as payload where (1228 between 1 and 1500) and 1228+1>1228;
select 1229 as n, (1229*3) as score, N'payload 01229 - kiểm thử dấu phẩy; -- Unicode' as payload where (1229 between 1 and 1500) and 1229+1>1229;
select 1230 as n, (1230*3) as score, N'payload 01230 - kiểm thử dấu phẩy; -- Unicode' as payload where (1230 between 1 and 1500) and 1230+1>1230;
select 1231 as n, (1231*3) as score, N'payload 01231 - kiểm thử dấu phẩy; -- Unicode' as payload where (1231 between 1 and 1500) and 1231+1>1231;
select 1232 as n, (1232*3) as score, N'payload 01232 - kiểm thử dấu phẩy; -- Unicode' as payload where (1232 between 1 and 1500) and 1232+1>1232;
select 1233 as n, (1233*3) as score, N'payload 01233 - kiểm thử dấu phẩy; -- Unicode' as payload where (1233 between 1 and 1500) and 1233+1>1233;
select 1234 as n, (1234*3) as score, N'payload 01234 - kiểm thử dấu phẩy; -- Unicode' as payload where (1234 between 1 and 1500) and 1234+1>1234;
select 1235 as n, (1235*3) as score, N'payload 01235 - kiểm thử dấu phẩy; -- Unicode' as payload where (1235 between 1 and 1500) and 1235+1>1235;
select 1236 as n, (1236*3) as score, N'payload 01236 - kiểm thử dấu phẩy; -- Unicode' as payload where (1236 between 1 and 1500) and 1236+1>1236;
select 1237 as n, (1237*3) as score, N'payload 01237 - kiểm thử dấu phẩy; -- Unicode' as payload where (1237 between 1 and 1500) and 1237+1>1237;
select 1238 as n, (1238*3) as score, N'payload 01238 - kiểm thử dấu phẩy; -- Unicode' as payload where (1238 between 1 and 1500) and 1238+1>1238;
select 1239 as n, (1239*3) as score, N'payload 01239 - kiểm thử dấu phẩy; -- Unicode' as payload where (1239 between 1 and 1500) and 1239+1>1239;
select 1240 as n, (1240*3) as score, N'payload 01240 - kiểm thử dấu phẩy; -- Unicode' as payload where (1240 between 1 and 1500) and 1240+1>1240;
select 1241 as n, (1241*3) as score, N'payload 01241 - kiểm thử dấu phẩy; -- Unicode' as payload where (1241 between 1 and 1500) and 1241+1>1241;
select 1242 as n, (1242*3) as score, N'payload 01242 - kiểm thử dấu phẩy; -- Unicode' as payload where (1242 between 1 and 1500) and 1242+1>1242;
select 1243 as n, (1243*3) as score, N'payload 01243 - kiểm thử dấu phẩy; -- Unicode' as payload where (1243 between 1 and 1500) and 1243+1>1243;
select 1244 as n, (1244*3) as score, N'payload 01244 - kiểm thử dấu phẩy; -- Unicode' as payload where (1244 between 1 and 1500) and 1244+1>1244;
select 1245 as n, (1245*3) as score, N'payload 01245 - kiểm thử dấu phẩy; -- Unicode' as payload where (1245 between 1 and 1500) and 1245+1>1245;
select 1246 as n, (1246*3) as score, N'payload 01246 - kiểm thử dấu phẩy; -- Unicode' as payload where (1246 between 1 and 1500) and 1246+1>1246;
select 1247 as n, (1247*3) as score, N'payload 01247 - kiểm thử dấu phẩy; -- Unicode' as payload where (1247 between 1 and 1500) and 1247+1>1247;
select 1248 as n, (1248*3) as score, N'payload 01248 - kiểm thử dấu phẩy; -- Unicode' as payload where (1248 between 1 and 1500) and 1248+1>1248;
select 1249 as n, (1249*3) as score, N'payload 01249 - kiểm thử dấu phẩy; -- Unicode' as payload where (1249 between 1 and 1500) and 1249+1>1249;
select 1250 as n, (1250*3) as score, N'payload 01250 - kiểm thử dấu phẩy; -- Unicode' as payload where (1250 between 1 and 1500) and 1250+1>1250;
select 1251 as n, (1251*3) as score, N'payload 01251 - kiểm thử dấu phẩy; -- Unicode' as payload where (1251 between 1 and 1500) and 1251+1>1251;
select 1252 as n, (1252*3) as score, N'payload 01252 - kiểm thử dấu phẩy; -- Unicode' as payload where (1252 between 1 and 1500) and 1252+1>1252;
select 1253 as n, (1253*3) as score, N'payload 01253 - kiểm thử dấu phẩy; -- Unicode' as payload where (1253 between 1 and 1500) and 1253+1>1253;
select 1254 as n, (1254*3) as score, N'payload 01254 - kiểm thử dấu phẩy; -- Unicode' as payload where (1254 between 1 and 1500) and 1254+1>1254;
select 1255 as n, (1255*3) as score, N'payload 01255 - kiểm thử dấu phẩy; -- Unicode' as payload where (1255 between 1 and 1500) and 1255+1>1255;
select 1256 as n, (1256*3) as score, N'payload 01256 - kiểm thử dấu phẩy; -- Unicode' as payload where (1256 between 1 and 1500) and 1256+1>1256;
select 1257 as n, (1257*3) as score, N'payload 01257 - kiểm thử dấu phẩy; -- Unicode' as payload where (1257 between 1 and 1500) and 1257+1>1257;
select 1258 as n, (1258*3) as score, N'payload 01258 - kiểm thử dấu phẩy; -- Unicode' as payload where (1258 between 1 and 1500) and 1258+1>1258;
select 1259 as n, (1259*3) as score, N'payload 01259 - kiểm thử dấu phẩy; -- Unicode' as payload where (1259 between 1 and 1500) and 1259+1>1259;
select 1260 as n, (1260*3) as score, N'payload 01260 - kiểm thử dấu phẩy; -- Unicode' as payload where (1260 between 1 and 1500) and 1260+1>1260;
select 1261 as n, (1261*3) as score, N'payload 01261 - kiểm thử dấu phẩy; -- Unicode' as payload where (1261 between 1 and 1500) and 1261+1>1261;
select 1262 as n, (1262*3) as score, N'payload 01262 - kiểm thử dấu phẩy; -- Unicode' as payload where (1262 between 1 and 1500) and 1262+1>1262;
select 1263 as n, (1263*3) as score, N'payload 01263 - kiểm thử dấu phẩy; -- Unicode' as payload where (1263 between 1 and 1500) and 1263+1>1263;
select 1264 as n, (1264*3) as score, N'payload 01264 - kiểm thử dấu phẩy; -- Unicode' as payload where (1264 between 1 and 1500) and 1264+1>1264;
select 1265 as n, (1265*3) as score, N'payload 01265 - kiểm thử dấu phẩy; -- Unicode' as payload where (1265 between 1 and 1500) and 1265+1>1265;
select 1266 as n, (1266*3) as score, N'payload 01266 - kiểm thử dấu phẩy; -- Unicode' as payload where (1266 between 1 and 1500) and 1266+1>1266;
select 1267 as n, (1267*3) as score, N'payload 01267 - kiểm thử dấu phẩy; -- Unicode' as payload where (1267 between 1 and 1500) and 1267+1>1267;
select 1268 as n, (1268*3) as score, N'payload 01268 - kiểm thử dấu phẩy; -- Unicode' as payload where (1268 between 1 and 1500) and 1268+1>1268;
select 1269 as n, (1269*3) as score, N'payload 01269 - kiểm thử dấu phẩy; -- Unicode' as payload where (1269 between 1 and 1500) and 1269+1>1269;
select 1270 as n, (1270*3) as score, N'payload 01270 - kiểm thử dấu phẩy; -- Unicode' as payload where (1270 between 1 and 1500) and 1270+1>1270;
select 1271 as n, (1271*3) as score, N'payload 01271 - kiểm thử dấu phẩy; -- Unicode' as payload where (1271 between 1 and 1500) and 1271+1>1271;
select 1272 as n, (1272*3) as score, N'payload 01272 - kiểm thử dấu phẩy; -- Unicode' as payload where (1272 between 1 and 1500) and 1272+1>1272;
select 1273 as n, (1273*3) as score, N'payload 01273 - kiểm thử dấu phẩy; -- Unicode' as payload where (1273 between 1 and 1500) and 1273+1>1273;
select 1274 as n, (1274*3) as score, N'payload 01274 - kiểm thử dấu phẩy; -- Unicode' as payload where (1274 between 1 and 1500) and 1274+1>1274;
select 1275 as n, (1275*3) as score, N'payload 01275 - kiểm thử dấu phẩy; -- Unicode' as payload where (1275 between 1 and 1500) and 1275+1>1275;
select 1276 as n, (1276*3) as score, N'payload 01276 - kiểm thử dấu phẩy; -- Unicode' as payload where (1276 between 1 and 1500) and 1276+1>1276;
select 1277 as n, (1277*3) as score, N'payload 01277 - kiểm thử dấu phẩy; -- Unicode' as payload where (1277 between 1 and 1500) and 1277+1>1277;
select 1278 as n, (1278*3) as score, N'payload 01278 - kiểm thử dấu phẩy; -- Unicode' as payload where (1278 between 1 and 1500) and 1278+1>1278;
select 1279 as n, (1279*3) as score, N'payload 01279 - kiểm thử dấu phẩy; -- Unicode' as payload where (1279 between 1 and 1500) and 1279+1>1279;
select 1280 as n, (1280*3) as score, N'payload 01280 - kiểm thử dấu phẩy; -- Unicode' as payload where (1280 between 1 and 1500) and 1280+1>1280;
select 1281 as n, (1281*3) as score, N'payload 01281 - kiểm thử dấu phẩy; -- Unicode' as payload where (1281 between 1 and 1500) and 1281+1>1281;
select 1282 as n, (1282*3) as score, N'payload 01282 - kiểm thử dấu phẩy; -- Unicode' as payload where (1282 between 1 and 1500) and 1282+1>1282;
select 1283 as n, (1283*3) as score, N'payload 01283 - kiểm thử dấu phẩy; -- Unicode' as payload where (1283 between 1 and 1500) and 1283+1>1283;
select 1284 as n, (1284*3) as score, N'payload 01284 - kiểm thử dấu phẩy; -- Unicode' as payload where (1284 between 1 and 1500) and 1284+1>1284;
select 1285 as n, (1285*3) as score, N'payload 01285 - kiểm thử dấu phẩy; -- Unicode' as payload where (1285 between 1 and 1500) and 1285+1>1285;
select 1286 as n, (1286*3) as score, N'payload 01286 - kiểm thử dấu phẩy; -- Unicode' as payload where (1286 between 1 and 1500) and 1286+1>1286;
select 1287 as n, (1287*3) as score, N'payload 01287 - kiểm thử dấu phẩy; -- Unicode' as payload where (1287 between 1 and 1500) and 1287+1>1287;
select 1288 as n, (1288*3) as score, N'payload 01288 - kiểm thử dấu phẩy; -- Unicode' as payload where (1288 between 1 and 1500) and 1288+1>1288;
select 1289 as n, (1289*3) as score, N'payload 01289 - kiểm thử dấu phẩy; -- Unicode' as payload where (1289 between 1 and 1500) and 1289+1>1289;
select 1290 as n, (1290*3) as score, N'payload 01290 - kiểm thử dấu phẩy; -- Unicode' as payload where (1290 between 1 and 1500) and 1290+1>1290;
select 1291 as n, (1291*3) as score, N'payload 01291 - kiểm thử dấu phẩy; -- Unicode' as payload where (1291 between 1 and 1500) and 1291+1>1291;
select 1292 as n, (1292*3) as score, N'payload 01292 - kiểm thử dấu phẩy; -- Unicode' as payload where (1292 between 1 and 1500) and 1292+1>1292;
select 1293 as n, (1293*3) as score, N'payload 01293 - kiểm thử dấu phẩy; -- Unicode' as payload where (1293 between 1 and 1500) and 1293+1>1293;
select 1294 as n, (1294*3) as score, N'payload 01294 - kiểm thử dấu phẩy; -- Unicode' as payload where (1294 between 1 and 1500) and 1294+1>1294;
select 1295 as n, (1295*3) as score, N'payload 01295 - kiểm thử dấu phẩy; -- Unicode' as payload where (1295 between 1 and 1500) and 1295+1>1295;
select 1296 as n, (1296*3) as score, N'payload 01296 - kiểm thử dấu phẩy; -- Unicode' as payload where (1296 between 1 and 1500) and 1296+1>1296;
select 1297 as n, (1297*3) as score, N'payload 01297 - kiểm thử dấu phẩy; -- Unicode' as payload where (1297 between 1 and 1500) and 1297+1>1297;
select 1298 as n, (1298*3) as score, N'payload 01298 - kiểm thử dấu phẩy; -- Unicode' as payload where (1298 between 1 and 1500) and 1298+1>1298;
select 1299 as n, (1299*3) as score, N'payload 01299 - kiểm thử dấu phẩy; -- Unicode' as payload where (1299 between 1 and 1500) and 1299+1>1299;
select 1300 as n, (1300*3) as score, N'payload 01300 - kiểm thử dấu phẩy; -- Unicode' as payload where (1300 between 1 and 1500) and 1300+1>1300;
select 1301 as n, (1301*3) as score, N'payload 01301 - kiểm thử dấu phẩy; -- Unicode' as payload where (1301 between 1 and 1500) and 1301+1>1301;
select 1302 as n, (1302*3) as score, N'payload 01302 - kiểm thử dấu phẩy; -- Unicode' as payload where (1302 between 1 and 1500) and 1302+1>1302;
select 1303 as n, (1303*3) as score, N'payload 01303 - kiểm thử dấu phẩy; -- Unicode' as payload where (1303 between 1 and 1500) and 1303+1>1303;
select 1304 as n, (1304*3) as score, N'payload 01304 - kiểm thử dấu phẩy; -- Unicode' as payload where (1304 between 1 and 1500) and 1304+1>1304;
select 1305 as n, (1305*3) as score, N'payload 01305 - kiểm thử dấu phẩy; -- Unicode' as payload where (1305 between 1 and 1500) and 1305+1>1305;
select 1306 as n, (1306*3) as score, N'payload 01306 - kiểm thử dấu phẩy; -- Unicode' as payload where (1306 between 1 and 1500) and 1306+1>1306;
select 1307 as n, (1307*3) as score, N'payload 01307 - kiểm thử dấu phẩy; -- Unicode' as payload where (1307 between 1 and 1500) and 1307+1>1307;
select 1308 as n, (1308*3) as score, N'payload 01308 - kiểm thử dấu phẩy; -- Unicode' as payload where (1308 between 1 and 1500) and 1308+1>1308;
select 1309 as n, (1309*3) as score, N'payload 01309 - kiểm thử dấu phẩy; -- Unicode' as payload where (1309 between 1 and 1500) and 1309+1>1309;
select 1310 as n, (1310*3) as score, N'payload 01310 - kiểm thử dấu phẩy; -- Unicode' as payload where (1310 between 1 and 1500) and 1310+1>1310;
select 1311 as n, (1311*3) as score, N'payload 01311 - kiểm thử dấu phẩy; -- Unicode' as payload where (1311 between 1 and 1500) and 1311+1>1311;
select 1312 as n, (1312*3) as score, N'payload 01312 - kiểm thử dấu phẩy; -- Unicode' as payload where (1312 between 1 and 1500) and 1312+1>1312;
select 1313 as n, (1313*3) as score, N'payload 01313 - kiểm thử dấu phẩy; -- Unicode' as payload where (1313 between 1 and 1500) and 1313+1>1313;
select 1314 as n, (1314*3) as score, N'payload 01314 - kiểm thử dấu phẩy; -- Unicode' as payload where (1314 between 1 and 1500) and 1314+1>1314;
select 1315 as n, (1315*3) as score, N'payload 01315 - kiểm thử dấu phẩy; -- Unicode' as payload where (1315 between 1 and 1500) and 1315+1>1315;
select 1316 as n, (1316*3) as score, N'payload 01316 - kiểm thử dấu phẩy; -- Unicode' as payload where (1316 between 1 and 1500) and 1316+1>1316;
select 1317 as n, (1317*3) as score, N'payload 01317 - kiểm thử dấu phẩy; -- Unicode' as payload where (1317 between 1 and 1500) and 1317+1>1317;
select 1318 as n, (1318*3) as score, N'payload 01318 - kiểm thử dấu phẩy; -- Unicode' as payload where (1318 between 1 and 1500) and 1318+1>1318;
select 1319 as n, (1319*3) as score, N'payload 01319 - kiểm thử dấu phẩy; -- Unicode' as payload where (1319 between 1 and 1500) and 1319+1>1319;
select 1320 as n, (1320*3) as score, N'payload 01320 - kiểm thử dấu phẩy; -- Unicode' as payload where (1320 between 1 and 1500) and 1320+1>1320;
select 1321 as n, (1321*3) as score, N'payload 01321 - kiểm thử dấu phẩy; -- Unicode' as payload where (1321 between 1 and 1500) and 1321+1>1321;
select 1322 as n, (1322*3) as score, N'payload 01322 - kiểm thử dấu phẩy; -- Unicode' as payload where (1322 between 1 and 1500) and 1322+1>1322;
select 1323 as n, (1323*3) as score, N'payload 01323 - kiểm thử dấu phẩy; -- Unicode' as payload where (1323 between 1 and 1500) and 1323+1>1323;
select 1324 as n, (1324*3) as score, N'payload 01324 - kiểm thử dấu phẩy; -- Unicode' as payload where (1324 between 1 and 1500) and 1324+1>1324;
select 1325 as n, (1325*3) as score, N'payload 01325 - kiểm thử dấu phẩy; -- Unicode' as payload where (1325 between 1 and 1500) and 1325+1>1325;
select 1326 as n, (1326*3) as score, N'payload 01326 - kiểm thử dấu phẩy; -- Unicode' as payload where (1326 between 1 and 1500) and 1326+1>1326;
select 1327 as n, (1327*3) as score, N'payload 01327 - kiểm thử dấu phẩy; -- Unicode' as payload where (1327 between 1 and 1500) and 1327+1>1327;
select 1328 as n, (1328*3) as score, N'payload 01328 - kiểm thử dấu phẩy; -- Unicode' as payload where (1328 between 1 and 1500) and 1328+1>1328;
select 1329 as n, (1329*3) as score, N'payload 01329 - kiểm thử dấu phẩy; -- Unicode' as payload where (1329 between 1 and 1500) and 1329+1>1329;
select 1330 as n, (1330*3) as score, N'payload 01330 - kiểm thử dấu phẩy; -- Unicode' as payload where (1330 between 1 and 1500) and 1330+1>1330;
select 1331 as n, (1331*3) as score, N'payload 01331 - kiểm thử dấu phẩy; -- Unicode' as payload where (1331 between 1 and 1500) and 1331+1>1331;
select 1332 as n, (1332*3) as score, N'payload 01332 - kiểm thử dấu phẩy; -- Unicode' as payload where (1332 between 1 and 1500) and 1332+1>1332;
select 1333 as n, (1333*3) as score, N'payload 01333 - kiểm thử dấu phẩy; -- Unicode' as payload where (1333 between 1 and 1500) and 1333+1>1333;
select 1334 as n, (1334*3) as score, N'payload 01334 - kiểm thử dấu phẩy; -- Unicode' as payload where (1334 between 1 and 1500) and 1334+1>1334;
select 1335 as n, (1335*3) as score, N'payload 01335 - kiểm thử dấu phẩy; -- Unicode' as payload where (1335 between 1 and 1500) and 1335+1>1335;
select 1336 as n, (1336*3) as score, N'payload 01336 - kiểm thử dấu phẩy; -- Unicode' as payload where (1336 between 1 and 1500) and 1336+1>1336;
select 1337 as n, (1337*3) as score, N'payload 01337 - kiểm thử dấu phẩy; -- Unicode' as payload where (1337 between 1 and 1500) and 1337+1>1337;
select 1338 as n, (1338*3) as score, N'payload 01338 - kiểm thử dấu phẩy; -- Unicode' as payload where (1338 between 1 and 1500) and 1338+1>1338;
select 1339 as n, (1339*3) as score, N'payload 01339 - kiểm thử dấu phẩy; -- Unicode' as payload where (1339 between 1 and 1500) and 1339+1>1339;
select 1340 as n, (1340*3) as score, N'payload 01340 - kiểm thử dấu phẩy; -- Unicode' as payload where (1340 between 1 and 1500) and 1340+1>1340;
select 1341 as n, (1341*3) as score, N'payload 01341 - kiểm thử dấu phẩy; -- Unicode' as payload where (1341 between 1 and 1500) and 1341+1>1341;
select 1342 as n, (1342*3) as score, N'payload 01342 - kiểm thử dấu phẩy; -- Unicode' as payload where (1342 between 1 and 1500) and 1342+1>1342;
select 1343 as n, (1343*3) as score, N'payload 01343 - kiểm thử dấu phẩy; -- Unicode' as payload where (1343 between 1 and 1500) and 1343+1>1343;
select 1344 as n, (1344*3) as score, N'payload 01344 - kiểm thử dấu phẩy; -- Unicode' as payload where (1344 between 1 and 1500) and 1344+1>1344;
select 1345 as n, (1345*3) as score, N'payload 01345 - kiểm thử dấu phẩy; -- Unicode' as payload where (1345 between 1 and 1500) and 1345+1>1345;
select 1346 as n, (1346*3) as score, N'payload 01346 - kiểm thử dấu phẩy; -- Unicode' as payload where (1346 between 1 and 1500) and 1346+1>1346;
select 1347 as n, (1347*3) as score, N'payload 01347 - kiểm thử dấu phẩy; -- Unicode' as payload where (1347 between 1 and 1500) and 1347+1>1347;
select 1348 as n, (1348*3) as score, N'payload 01348 - kiểm thử dấu phẩy; -- Unicode' as payload where (1348 between 1 and 1500) and 1348+1>1348;
select 1349 as n, (1349*3) as score, N'payload 01349 - kiểm thử dấu phẩy; -- Unicode' as payload where (1349 between 1 and 1500) and 1349+1>1349;
select 1350 as n, (1350*3) as score, N'payload 01350 - kiểm thử dấu phẩy; -- Unicode' as payload where (1350 between 1 and 1500) and 1350+1>1350;
select 1351 as n, (1351*3) as score, N'payload 01351 - kiểm thử dấu phẩy; -- Unicode' as payload where (1351 between 1 and 1500) and 1351+1>1351;
select 1352 as n, (1352*3) as score, N'payload 01352 - kiểm thử dấu phẩy; -- Unicode' as payload where (1352 between 1 and 1500) and 1352+1>1352;
select 1353 as n, (1353*3) as score, N'payload 01353 - kiểm thử dấu phẩy; -- Unicode' as payload where (1353 between 1 and 1500) and 1353+1>1353;
select 1354 as n, (1354*3) as score, N'payload 01354 - kiểm thử dấu phẩy; -- Unicode' as payload where (1354 between 1 and 1500) and 1354+1>1354;
select 1355 as n, (1355*3) as score, N'payload 01355 - kiểm thử dấu phẩy; -- Unicode' as payload where (1355 between 1 and 1500) and 1355+1>1355;
select 1356 as n, (1356*3) as score, N'payload 01356 - kiểm thử dấu phẩy; -- Unicode' as payload where (1356 between 1 and 1500) and 1356+1>1356;
select 1357 as n, (1357*3) as score, N'payload 01357 - kiểm thử dấu phẩy; -- Unicode' as payload where (1357 between 1 and 1500) and 1357+1>1357;
select 1358 as n, (1358*3) as score, N'payload 01358 - kiểm thử dấu phẩy; -- Unicode' as payload where (1358 between 1 and 1500) and 1358+1>1358;
select 1359 as n, (1359*3) as score, N'payload 01359 - kiểm thử dấu phẩy; -- Unicode' as payload where (1359 between 1 and 1500) and 1359+1>1359;
select 1360 as n, (1360*3) as score, N'payload 01360 - kiểm thử dấu phẩy; -- Unicode' as payload where (1360 between 1 and 1500) and 1360+1>1360;
select 1361 as n, (1361*3) as score, N'payload 01361 - kiểm thử dấu phẩy; -- Unicode' as payload where (1361 between 1 and 1500) and 1361+1>1361;
select 1362 as n, (1362*3) as score, N'payload 01362 - kiểm thử dấu phẩy; -- Unicode' as payload where (1362 between 1 and 1500) and 1362+1>1362;
select 1363 as n, (1363*3) as score, N'payload 01363 - kiểm thử dấu phẩy; -- Unicode' as payload where (1363 between 1 and 1500) and 1363+1>1363;
select 1364 as n, (1364*3) as score, N'payload 01364 - kiểm thử dấu phẩy; -- Unicode' as payload where (1364 between 1 and 1500) and 1364+1>1364;
select 1365 as n, (1365*3) as score, N'payload 01365 - kiểm thử dấu phẩy; -- Unicode' as payload where (1365 between 1 and 1500) and 1365+1>1365;
select 1366 as n, (1366*3) as score, N'payload 01366 - kiểm thử dấu phẩy; -- Unicode' as payload where (1366 between 1 and 1500) and 1366+1>1366;
select 1367 as n, (1367*3) as score, N'payload 01367 - kiểm thử dấu phẩy; -- Unicode' as payload where (1367 between 1 and 1500) and 1367+1>1367;
select 1368 as n, (1368*3) as score, N'payload 01368 - kiểm thử dấu phẩy; -- Unicode' as payload where (1368 between 1 and 1500) and 1368+1>1368;
select 1369 as n, (1369*3) as score, N'payload 01369 - kiểm thử dấu phẩy; -- Unicode' as payload where (1369 between 1 and 1500) and 1369+1>1369;
select 1370 as n, (1370*3) as score, N'payload 01370 - kiểm thử dấu phẩy; -- Unicode' as payload where (1370 between 1 and 1500) and 1370+1>1370;
select 1371 as n, (1371*3) as score, N'payload 01371 - kiểm thử dấu phẩy; -- Unicode' as payload where (1371 between 1 and 1500) and 1371+1>1371;
select 1372 as n, (1372*3) as score, N'payload 01372 - kiểm thử dấu phẩy; -- Unicode' as payload where (1372 between 1 and 1500) and 1372+1>1372;
select 1373 as n, (1373*3) as score, N'payload 01373 - kiểm thử dấu phẩy; -- Unicode' as payload where (1373 between 1 and 1500) and 1373+1>1373;
select 1374 as n, (1374*3) as score, N'payload 01374 - kiểm thử dấu phẩy; -- Unicode' as payload where (1374 between 1 and 1500) and 1374+1>1374;
select 1375 as n, (1375*3) as score, N'payload 01375 - kiểm thử dấu phẩy; -- Unicode' as payload where (1375 between 1 and 1500) and 1375+1>1375;
select 1376 as n, (1376*3) as score, N'payload 01376 - kiểm thử dấu phẩy; -- Unicode' as payload where (1376 between 1 and 1500) and 1376+1>1376;
select 1377 as n, (1377*3) as score, N'payload 01377 - kiểm thử dấu phẩy; -- Unicode' as payload where (1377 between 1 and 1500) and 1377+1>1377;
select 1378 as n, (1378*3) as score, N'payload 01378 - kiểm thử dấu phẩy; -- Unicode' as payload where (1378 between 1 and 1500) and 1378+1>1378;
select 1379 as n, (1379*3) as score, N'payload 01379 - kiểm thử dấu phẩy; -- Unicode' as payload where (1379 between 1 and 1500) and 1379+1>1379;
select 1380 as n, (1380*3) as score, N'payload 01380 - kiểm thử dấu phẩy; -- Unicode' as payload where (1380 between 1 and 1500) and 1380+1>1380;
select 1381 as n, (1381*3) as score, N'payload 01381 - kiểm thử dấu phẩy; -- Unicode' as payload where (1381 between 1 and 1500) and 1381+1>1381;
select 1382 as n, (1382*3) as score, N'payload 01382 - kiểm thử dấu phẩy; -- Unicode' as payload where (1382 between 1 and 1500) and 1382+1>1382;
select 1383 as n, (1383*3) as score, N'payload 01383 - kiểm thử dấu phẩy; -- Unicode' as payload where (1383 between 1 and 1500) and 1383+1>1383;
select 1384 as n, (1384*3) as score, N'payload 01384 - kiểm thử dấu phẩy; -- Unicode' as payload where (1384 between 1 and 1500) and 1384+1>1384;
select 1385 as n, (1385*3) as score, N'payload 01385 - kiểm thử dấu phẩy; -- Unicode' as payload where (1385 between 1 and 1500) and 1385+1>1385;
select 1386 as n, (1386*3) as score, N'payload 01386 - kiểm thử dấu phẩy; -- Unicode' as payload where (1386 between 1 and 1500) and 1386+1>1386;
select 1387 as n, (1387*3) as score, N'payload 01387 - kiểm thử dấu phẩy; -- Unicode' as payload where (1387 between 1 and 1500) and 1387+1>1387;
select 1388 as n, (1388*3) as score, N'payload 01388 - kiểm thử dấu phẩy; -- Unicode' as payload where (1388 between 1 and 1500) and 1388+1>1388;
select 1389 as n, (1389*3) as score, N'payload 01389 - kiểm thử dấu phẩy; -- Unicode' as payload where (1389 between 1 and 1500) and 1389+1>1389;
select 1390 as n, (1390*3) as score, N'payload 01390 - kiểm thử dấu phẩy; -- Unicode' as payload where (1390 between 1 and 1500) and 1390+1>1390;
select 1391 as n, (1391*3) as score, N'payload 01391 - kiểm thử dấu phẩy; -- Unicode' as payload where (1391 between 1 and 1500) and 1391+1>1391;
select 1392 as n, (1392*3) as score, N'payload 01392 - kiểm thử dấu phẩy; -- Unicode' as payload where (1392 between 1 and 1500) and 1392+1>1392;
select 1393 as n, (1393*3) as score, N'payload 01393 - kiểm thử dấu phẩy; -- Unicode' as payload where (1393 between 1 and 1500) and 1393+1>1393;
select 1394 as n, (1394*3) as score, N'payload 01394 - kiểm thử dấu phẩy; -- Unicode' as payload where (1394 between 1 and 1500) and 1394+1>1394;
select 1395 as n, (1395*3) as score, N'payload 01395 - kiểm thử dấu phẩy; -- Unicode' as payload where (1395 between 1 and 1500) and 1395+1>1395;
select 1396 as n, (1396*3) as score, N'payload 01396 - kiểm thử dấu phẩy; -- Unicode' as payload where (1396 between 1 and 1500) and 1396+1>1396;
select 1397 as n, (1397*3) as score, N'payload 01397 - kiểm thử dấu phẩy; -- Unicode' as payload where (1397 between 1 and 1500) and 1397+1>1397;
select 1398 as n, (1398*3) as score, N'payload 01398 - kiểm thử dấu phẩy; -- Unicode' as payload where (1398 between 1 and 1500) and 1398+1>1398;
select 1399 as n, (1399*3) as score, N'payload 01399 - kiểm thử dấu phẩy; -- Unicode' as payload where (1399 between 1 and 1500) and 1399+1>1399;
select 1400 as n, (1400*3) as score, N'payload 01400 - kiểm thử dấu phẩy; -- Unicode' as payload where (1400 between 1 and 1500) and 1400+1>1400;
select 1401 as n, (1401*3) as score, N'payload 01401 - kiểm thử dấu phẩy; -- Unicode' as payload where (1401 between 1 and 1500) and 1401+1>1401;
select 1402 as n, (1402*3) as score, N'payload 01402 - kiểm thử dấu phẩy; -- Unicode' as payload where (1402 between 1 and 1500) and 1402+1>1402;
select 1403 as n, (1403*3) as score, N'payload 01403 - kiểm thử dấu phẩy; -- Unicode' as payload where (1403 between 1 and 1500) and 1403+1>1403;
select 1404 as n, (1404*3) as score, N'payload 01404 - kiểm thử dấu phẩy; -- Unicode' as payload where (1404 between 1 and 1500) and 1404+1>1404;
select 1405 as n, (1405*3) as score, N'payload 01405 - kiểm thử dấu phẩy; -- Unicode' as payload where (1405 between 1 and 1500) and 1405+1>1405;
select 1406 as n, (1406*3) as score, N'payload 01406 - kiểm thử dấu phẩy; -- Unicode' as payload where (1406 between 1 and 1500) and 1406+1>1406;
select 1407 as n, (1407*3) as score, N'payload 01407 - kiểm thử dấu phẩy; -- Unicode' as payload where (1407 between 1 and 1500) and 1407+1>1407;
select 1408 as n, (1408*3) as score, N'payload 01408 - kiểm thử dấu phẩy; -- Unicode' as payload where (1408 between 1 and 1500) and 1408+1>1408;
select 1409 as n, (1409*3) as score, N'payload 01409 - kiểm thử dấu phẩy; -- Unicode' as payload where (1409 between 1 and 1500) and 1409+1>1409;
select 1410 as n, (1410*3) as score, N'payload 01410 - kiểm thử dấu phẩy; -- Unicode' as payload where (1410 between 1 and 1500) and 1410+1>1410;
select 1411 as n, (1411*3) as score, N'payload 01411 - kiểm thử dấu phẩy; -- Unicode' as payload where (1411 between 1 and 1500) and 1411+1>1411;
select 1412 as n, (1412*3) as score, N'payload 01412 - kiểm thử dấu phẩy; -- Unicode' as payload where (1412 between 1 and 1500) and 1412+1>1412;
select 1413 as n, (1413*3) as score, N'payload 01413 - kiểm thử dấu phẩy; -- Unicode' as payload where (1413 between 1 and 1500) and 1413+1>1413;
select 1414 as n, (1414*3) as score, N'payload 01414 - kiểm thử dấu phẩy; -- Unicode' as payload where (1414 between 1 and 1500) and 1414+1>1414;
select 1415 as n, (1415*3) as score, N'payload 01415 - kiểm thử dấu phẩy; -- Unicode' as payload where (1415 between 1 and 1500) and 1415+1>1415;
select 1416 as n, (1416*3) as score, N'payload 01416 - kiểm thử dấu phẩy; -- Unicode' as payload where (1416 between 1 and 1500) and 1416+1>1416;
select 1417 as n, (1417*3) as score, N'payload 01417 - kiểm thử dấu phẩy; -- Unicode' as payload where (1417 between 1 and 1500) and 1417+1>1417;
select 1418 as n, (1418*3) as score, N'payload 01418 - kiểm thử dấu phẩy; -- Unicode' as payload where (1418 between 1 and 1500) and 1418+1>1418;
select 1419 as n, (1419*3) as score, N'payload 01419 - kiểm thử dấu phẩy; -- Unicode' as payload where (1419 between 1 and 1500) and 1419+1>1419;
select 1420 as n, (1420*3) as score, N'payload 01420 - kiểm thử dấu phẩy; -- Unicode' as payload where (1420 between 1 and 1500) and 1420+1>1420;
select 1421 as n, (1421*3) as score, N'payload 01421 - kiểm thử dấu phẩy; -- Unicode' as payload where (1421 between 1 and 1500) and 1421+1>1421;
select 1422 as n, (1422*3) as score, N'payload 01422 - kiểm thử dấu phẩy; -- Unicode' as payload where (1422 between 1 and 1500) and 1422+1>1422;
select 1423 as n, (1423*3) as score, N'payload 01423 - kiểm thử dấu phẩy; -- Unicode' as payload where (1423 between 1 and 1500) and 1423+1>1423;
select 1424 as n, (1424*3) as score, N'payload 01424 - kiểm thử dấu phẩy; -- Unicode' as payload where (1424 between 1 and 1500) and 1424+1>1424;
select 1425 as n, (1425*3) as score, N'payload 01425 - kiểm thử dấu phẩy; -- Unicode' as payload where (1425 between 1 and 1500) and 1425+1>1425;
select 1426 as n, (1426*3) as score, N'payload 01426 - kiểm thử dấu phẩy; -- Unicode' as payload where (1426 between 1 and 1500) and 1426+1>1426;
select 1427 as n, (1427*3) as score, N'payload 01427 - kiểm thử dấu phẩy; -- Unicode' as payload where (1427 between 1 and 1500) and 1427+1>1427;
select 1428 as n, (1428*3) as score, N'payload 01428 - kiểm thử dấu phẩy; -- Unicode' as payload where (1428 between 1 and 1500) and 1428+1>1428;
select 1429 as n, (1429*3) as score, N'payload 01429 - kiểm thử dấu phẩy; -- Unicode' as payload where (1429 between 1 and 1500) and 1429+1>1429;
select 1430 as n, (1430*3) as score, N'payload 01430 - kiểm thử dấu phẩy; -- Unicode' as payload where (1430 between 1 and 1500) and 1430+1>1430;
select 1431 as n, (1431*3) as score, N'payload 01431 - kiểm thử dấu phẩy; -- Unicode' as payload where (1431 between 1 and 1500) and 1431+1>1431;
select 1432 as n, (1432*3) as score, N'payload 01432 - kiểm thử dấu phẩy; -- Unicode' as payload where (1432 between 1 and 1500) and 1432+1>1432;
select 1433 as n, (1433*3) as score, N'payload 01433 - kiểm thử dấu phẩy; -- Unicode' as payload where (1433 between 1 and 1500) and 1433+1>1433;
select 1434 as n, (1434*3) as score, N'payload 01434 - kiểm thử dấu phẩy; -- Unicode' as payload where (1434 between 1 and 1500) and 1434+1>1434;
select 1435 as n, (1435*3) as score, N'payload 01435 - kiểm thử dấu phẩy; -- Unicode' as payload where (1435 between 1 and 1500) and 1435+1>1435;
select 1436 as n, (1436*3) as score, N'payload 01436 - kiểm thử dấu phẩy; -- Unicode' as payload where (1436 between 1 and 1500) and 1436+1>1436;
select 1437 as n, (1437*3) as score, N'payload 01437 - kiểm thử dấu phẩy; -- Unicode' as payload where (1437 between 1 and 1500) and 1437+1>1437;
select 1438 as n, (1438*3) as score, N'payload 01438 - kiểm thử dấu phẩy; -- Unicode' as payload where (1438 between 1 and 1500) and 1438+1>1438;
select 1439 as n, (1439*3) as score, N'payload 01439 - kiểm thử dấu phẩy; -- Unicode' as payload where (1439 between 1 and 1500) and 1439+1>1439;
select 1440 as n, (1440*3) as score, N'payload 01440 - kiểm thử dấu phẩy; -- Unicode' as payload where (1440 between 1 and 1500) and 1440+1>1440;
select 1441 as n, (1441*3) as score, N'payload 01441 - kiểm thử dấu phẩy; -- Unicode' as payload where (1441 between 1 and 1500) and 1441+1>1441;
select 1442 as n, (1442*3) as score, N'payload 01442 - kiểm thử dấu phẩy; -- Unicode' as payload where (1442 between 1 and 1500) and 1442+1>1442;
select 1443 as n, (1443*3) as score, N'payload 01443 - kiểm thử dấu phẩy; -- Unicode' as payload where (1443 between 1 and 1500) and 1443+1>1443;
select 1444 as n, (1444*3) as score, N'payload 01444 - kiểm thử dấu phẩy; -- Unicode' as payload where (1444 between 1 and 1500) and 1444+1>1444;
select 1445 as n, (1445*3) as score, N'payload 01445 - kiểm thử dấu phẩy; -- Unicode' as payload where (1445 between 1 and 1500) and 1445+1>1445;
select 1446 as n, (1446*3) as score, N'payload 01446 - kiểm thử dấu phẩy; -- Unicode' as payload where (1446 between 1 and 1500) and 1446+1>1446;
select 1447 as n, (1447*3) as score, N'payload 01447 - kiểm thử dấu phẩy; -- Unicode' as payload where (1447 between 1 and 1500) and 1447+1>1447;
select 1448 as n, (1448*3) as score, N'payload 01448 - kiểm thử dấu phẩy; -- Unicode' as payload where (1448 between 1 and 1500) and 1448+1>1448;
select 1449 as n, (1449*3) as score, N'payload 01449 - kiểm thử dấu phẩy; -- Unicode' as payload where (1449 between 1 and 1500) and 1449+1>1449;
select 1450 as n, (1450*3) as score, N'payload 01450 - kiểm thử dấu phẩy; -- Unicode' as payload where (1450 between 1 and 1500) and 1450+1>1450;
select 1451 as n, (1451*3) as score, N'payload 01451 - kiểm thử dấu phẩy; -- Unicode' as payload where (1451 between 1 and 1500) and 1451+1>1451;
select 1452 as n, (1452*3) as score, N'payload 01452 - kiểm thử dấu phẩy; -- Unicode' as payload where (1452 between 1 and 1500) and 1452+1>1452;
select 1453 as n, (1453*3) as score, N'payload 01453 - kiểm thử dấu phẩy; -- Unicode' as payload where (1453 between 1 and 1500) and 1453+1>1453;
select 1454 as n, (1454*3) as score, N'payload 01454 - kiểm thử dấu phẩy; -- Unicode' as payload where (1454 between 1 and 1500) and 1454+1>1454;
select 1455 as n, (1455*3) as score, N'payload 01455 - kiểm thử dấu phẩy; -- Unicode' as payload where (1455 between 1 and 1500) and 1455+1>1455;
select 1456 as n, (1456*3) as score, N'payload 01456 - kiểm thử dấu phẩy; -- Unicode' as payload where (1456 between 1 and 1500) and 1456+1>1456;
select 1457 as n, (1457*3) as score, N'payload 01457 - kiểm thử dấu phẩy; -- Unicode' as payload where (1457 between 1 and 1500) and 1457+1>1457;
select 1458 as n, (1458*3) as score, N'payload 01458 - kiểm thử dấu phẩy; -- Unicode' as payload where (1458 between 1 and 1500) and 1458+1>1458;
select 1459 as n, (1459*3) as score, N'payload 01459 - kiểm thử dấu phẩy; -- Unicode' as payload where (1459 between 1 and 1500) and 1459+1>1459;
select 1460 as n, (1460*3) as score, N'payload 01460 - kiểm thử dấu phẩy; -- Unicode' as payload where (1460 between 1 and 1500) and 1460+1>1460;
select 1461 as n, (1461*3) as score, N'payload 01461 - kiểm thử dấu phẩy; -- Unicode' as payload where (1461 between 1 and 1500) and 1461+1>1461;
select 1462 as n, (1462*3) as score, N'payload 01462 - kiểm thử dấu phẩy; -- Unicode' as payload where (1462 between 1 and 1500) and 1462+1>1462;
select 1463 as n, (1463*3) as score, N'payload 01463 - kiểm thử dấu phẩy; -- Unicode' as payload where (1463 between 1 and 1500) and 1463+1>1463;
select 1464 as n, (1464*3) as score, N'payload 01464 - kiểm thử dấu phẩy; -- Unicode' as payload where (1464 between 1 and 1500) and 1464+1>1464;
select 1465 as n, (1465*3) as score, N'payload 01465 - kiểm thử dấu phẩy; -- Unicode' as payload where (1465 between 1 and 1500) and 1465+1>1465;
select 1466 as n, (1466*3) as score, N'payload 01466 - kiểm thử dấu phẩy; -- Unicode' as payload where (1466 between 1 and 1500) and 1466+1>1466;
select 1467 as n, (1467*3) as score, N'payload 01467 - kiểm thử dấu phẩy; -- Unicode' as payload where (1467 between 1 and 1500) and 1467+1>1467;
select 1468 as n, (1468*3) as score, N'payload 01468 - kiểm thử dấu phẩy; -- Unicode' as payload where (1468 between 1 and 1500) and 1468+1>1468;
select 1469 as n, (1469*3) as score, N'payload 01469 - kiểm thử dấu phẩy; -- Unicode' as payload where (1469 between 1 and 1500) and 1469+1>1469;
select 1470 as n, (1470*3) as score, N'payload 01470 - kiểm thử dấu phẩy; -- Unicode' as payload where (1470 between 1 and 1500) and 1470+1>1470;
select 1471 as n, (1471*3) as score, N'payload 01471 - kiểm thử dấu phẩy; -- Unicode' as payload where (1471 between 1 and 1500) and 1471+1>1471;
select 1472 as n, (1472*3) as score, N'payload 01472 - kiểm thử dấu phẩy; -- Unicode' as payload where (1472 between 1 and 1500) and 1472+1>1472;
select 1473 as n, (1473*3) as score, N'payload 01473 - kiểm thử dấu phẩy; -- Unicode' as payload where (1473 between 1 and 1500) and 1473+1>1473;
select 1474 as n, (1474*3) as score, N'payload 01474 - kiểm thử dấu phẩy; -- Unicode' as payload where (1474 between 1 and 1500) and 1474+1>1474;
select 1475 as n, (1475*3) as score, N'payload 01475 - kiểm thử dấu phẩy; -- Unicode' as payload where (1475 between 1 and 1500) and 1475+1>1475;
select 1476 as n, (1476*3) as score, N'payload 01476 - kiểm thử dấu phẩy; -- Unicode' as payload where (1476 between 1 and 1500) and 1476+1>1476;
select 1477 as n, (1477*3) as score, N'payload 01477 - kiểm thử dấu phẩy; -- Unicode' as payload where (1477 between 1 and 1500) and 1477+1>1477;
select 1478 as n, (1478*3) as score, N'payload 01478 - kiểm thử dấu phẩy; -- Unicode' as payload where (1478 between 1 and 1500) and 1478+1>1478;
select 1479 as n, (1479*3) as score, N'payload 01479 - kiểm thử dấu phẩy; -- Unicode' as payload where (1479 between 1 and 1500) and 1479+1>1479;
select 1480 as n, (1480*3) as score, N'payload 01480 - kiểm thử dấu phẩy; -- Unicode' as payload where (1480 between 1 and 1500) and 1480+1>1480;
select 1481 as n, (1481*3) as score, N'payload 01481 - kiểm thử dấu phẩy; -- Unicode' as payload where (1481 between 1 and 1500) and 1481+1>1481;
select 1482 as n, (1482*3) as score, N'payload 01482 - kiểm thử dấu phẩy; -- Unicode' as payload where (1482 between 1 and 1500) and 1482+1>1482;
select 1483 as n, (1483*3) as score, N'payload 01483 - kiểm thử dấu phẩy; -- Unicode' as payload where (1483 between 1 and 1500) and 1483+1>1483;
select 1484 as n, (1484*3) as score, N'payload 01484 - kiểm thử dấu phẩy; -- Unicode' as payload where (1484 between 1 and 1500) and 1484+1>1484;
select 1485 as n, (1485*3) as score, N'payload 01485 - kiểm thử dấu phẩy; -- Unicode' as payload where (1485 between 1 and 1500) and 1485+1>1485;
select 1486 as n, (1486*3) as score, N'payload 01486 - kiểm thử dấu phẩy; -- Unicode' as payload where (1486 between 1 and 1500) and 1486+1>1486;
select 1487 as n, (1487*3) as score, N'payload 01487 - kiểm thử dấu phẩy; -- Unicode' as payload where (1487 between 1 and 1500) and 1487+1>1487;
select 1488 as n, (1488*3) as score, N'payload 01488 - kiểm thử dấu phẩy; -- Unicode' as payload where (1488 between 1 and 1500) and 1488+1>1488;
select 1489 as n, (1489*3) as score, N'payload 01489 - kiểm thử dấu phẩy; -- Unicode' as payload where (1489 between 1 and 1500) and 1489+1>1489;
select 1490 as n, (1490*3) as score, N'payload 01490 - kiểm thử dấu phẩy; -- Unicode' as payload where (1490 between 1 and 1500) and 1490+1>1490;
select 1491 as n, (1491*3) as score, N'payload 01491 - kiểm thử dấu phẩy; -- Unicode' as payload where (1491 between 1 and 1500) and 1491+1>1491;
select 1492 as n, (1492*3) as score, N'payload 01492 - kiểm thử dấu phẩy; -- Unicode' as payload where (1492 between 1 and 1500) and 1492+1>1492;
select 1493 as n, (1493*3) as score, N'payload 01493 - kiểm thử dấu phẩy; -- Unicode' as payload where (1493 between 1 and 1500) and 1493+1>1493;
select 1494 as n, (1494*3) as score, N'payload 01494 - kiểm thử dấu phẩy; -- Unicode' as payload where (1494 between 1 and 1500) and 1494+1>1494;
select 1495 as n, (1495*3) as score, N'payload 01495 - kiểm thử dấu phẩy; -- Unicode' as payload where (1495 between 1 and 1500) and 1495+1>1495;
select 1496 as n, (1496*3) as score, N'payload 01496 - kiểm thử dấu phẩy; -- Unicode' as payload where (1496 between 1 and 1500) and 1496+1>1496;
select 1497 as n, (1497*3) as score, N'payload 01497 - kiểm thử dấu phẩy; -- Unicode' as payload where (1497 between 1 and 1500) and 1497+1>1497;
select 1498 as n, (1498*3) as score, N'payload 01498 - kiểm thử dấu phẩy; -- Unicode' as payload where (1498 between 1 and 1500) and 1498+1>1498;
select 1499 as n, (1499*3) as score, N'payload 01499 - kiểm thử dấu phẩy; -- Unicode' as payload where (1499 between 1 and 1500) and 1499+1>1499;
select 1500 as n, (1500*3) as score, N'payload 01500 - kiểm thử dấu phẩy; -- Unicode' as payload where (1500 between 1 and 1500) and 1500+1>1500;

-- zea-case: stress/script-3000-statements
select 1 as n, (1*3) as score, N'payload 00001 - kiểm thử dấu phẩy; -- Unicode' as payload where (1 between 1 and 3000) and 1+1>1;
select 2 as n, (2*3) as score, N'payload 00002 - kiểm thử dấu phẩy; -- Unicode' as payload where (2 between 1 and 3000) and 2+1>2;
select 3 as n, (3*3) as score, N'payload 00003 - kiểm thử dấu phẩy; -- Unicode' as payload where (3 between 1 and 3000) and 3+1>3;
select 4 as n, (4*3) as score, N'payload 00004 - kiểm thử dấu phẩy; -- Unicode' as payload where (4 between 1 and 3000) and 4+1>4;
select 5 as n, (5*3) as score, N'payload 00005 - kiểm thử dấu phẩy; -- Unicode' as payload where (5 between 1 and 3000) and 5+1>5;
select 6 as n, (6*3) as score, N'payload 00006 - kiểm thử dấu phẩy; -- Unicode' as payload where (6 between 1 and 3000) and 6+1>6;
select 7 as n, (7*3) as score, N'payload 00007 - kiểm thử dấu phẩy; -- Unicode' as payload where (7 between 1 and 3000) and 7+1>7;
select 8 as n, (8*3) as score, N'payload 00008 - kiểm thử dấu phẩy; -- Unicode' as payload where (8 between 1 and 3000) and 8+1>8;
select 9 as n, (9*3) as score, N'payload 00009 - kiểm thử dấu phẩy; -- Unicode' as payload where (9 between 1 and 3000) and 9+1>9;
select 10 as n, (10*3) as score, N'payload 00010 - kiểm thử dấu phẩy; -- Unicode' as payload where (10 between 1 and 3000) and 10+1>10;
select 11 as n, (11*3) as score, N'payload 00011 - kiểm thử dấu phẩy; -- Unicode' as payload where (11 between 1 and 3000) and 11+1>11;
select 12 as n, (12*3) as score, N'payload 00012 - kiểm thử dấu phẩy; -- Unicode' as payload where (12 between 1 and 3000) and 12+1>12;
select 13 as n, (13*3) as score, N'payload 00013 - kiểm thử dấu phẩy; -- Unicode' as payload where (13 between 1 and 3000) and 13+1>13;
select 14 as n, (14*3) as score, N'payload 00014 - kiểm thử dấu phẩy; -- Unicode' as payload where (14 between 1 and 3000) and 14+1>14;
select 15 as n, (15*3) as score, N'payload 00015 - kiểm thử dấu phẩy; -- Unicode' as payload where (15 between 1 and 3000) and 15+1>15;
select 16 as n, (16*3) as score, N'payload 00016 - kiểm thử dấu phẩy; -- Unicode' as payload where (16 between 1 and 3000) and 16+1>16;
select 17 as n, (17*3) as score, N'payload 00017 - kiểm thử dấu phẩy; -- Unicode' as payload where (17 between 1 and 3000) and 17+1>17;
select 18 as n, (18*3) as score, N'payload 00018 - kiểm thử dấu phẩy; -- Unicode' as payload where (18 between 1 and 3000) and 18+1>18;
select 19 as n, (19*3) as score, N'payload 00019 - kiểm thử dấu phẩy; -- Unicode' as payload where (19 between 1 and 3000) and 19+1>19;
select 20 as n, (20*3) as score, N'payload 00020 - kiểm thử dấu phẩy; -- Unicode' as payload where (20 between 1 and 3000) and 20+1>20;
select 21 as n, (21*3) as score, N'payload 00021 - kiểm thử dấu phẩy; -- Unicode' as payload where (21 between 1 and 3000) and 21+1>21;
select 22 as n, (22*3) as score, N'payload 00022 - kiểm thử dấu phẩy; -- Unicode' as payload where (22 between 1 and 3000) and 22+1>22;
select 23 as n, (23*3) as score, N'payload 00023 - kiểm thử dấu phẩy; -- Unicode' as payload where (23 between 1 and 3000) and 23+1>23;
select 24 as n, (24*3) as score, N'payload 00024 - kiểm thử dấu phẩy; -- Unicode' as payload where (24 between 1 and 3000) and 24+1>24;
select 25 as n, (25*3) as score, N'payload 00025 - kiểm thử dấu phẩy; -- Unicode' as payload where (25 between 1 and 3000) and 25+1>25;
select 26 as n, (26*3) as score, N'payload 00026 - kiểm thử dấu phẩy; -- Unicode' as payload where (26 between 1 and 3000) and 26+1>26;
select 27 as n, (27*3) as score, N'payload 00027 - kiểm thử dấu phẩy; -- Unicode' as payload where (27 between 1 and 3000) and 27+1>27;
select 28 as n, (28*3) as score, N'payload 00028 - kiểm thử dấu phẩy; -- Unicode' as payload where (28 between 1 and 3000) and 28+1>28;
select 29 as n, (29*3) as score, N'payload 00029 - kiểm thử dấu phẩy; -- Unicode' as payload where (29 between 1 and 3000) and 29+1>29;
select 30 as n, (30*3) as score, N'payload 00030 - kiểm thử dấu phẩy; -- Unicode' as payload where (30 between 1 and 3000) and 30+1>30;
select 31 as n, (31*3) as score, N'payload 00031 - kiểm thử dấu phẩy; -- Unicode' as payload where (31 between 1 and 3000) and 31+1>31;
select 32 as n, (32*3) as score, N'payload 00032 - kiểm thử dấu phẩy; -- Unicode' as payload where (32 between 1 and 3000) and 32+1>32;
select 33 as n, (33*3) as score, N'payload 00033 - kiểm thử dấu phẩy; -- Unicode' as payload where (33 between 1 and 3000) and 33+1>33;
select 34 as n, (34*3) as score, N'payload 00034 - kiểm thử dấu phẩy; -- Unicode' as payload where (34 between 1 and 3000) and 34+1>34;
select 35 as n, (35*3) as score, N'payload 00035 - kiểm thử dấu phẩy; -- Unicode' as payload where (35 between 1 and 3000) and 35+1>35;
select 36 as n, (36*3) as score, N'payload 00036 - kiểm thử dấu phẩy; -- Unicode' as payload where (36 between 1 and 3000) and 36+1>36;
select 37 as n, (37*3) as score, N'payload 00037 - kiểm thử dấu phẩy; -- Unicode' as payload where (37 between 1 and 3000) and 37+1>37;
select 38 as n, (38*3) as score, N'payload 00038 - kiểm thử dấu phẩy; -- Unicode' as payload where (38 between 1 and 3000) and 38+1>38;
select 39 as n, (39*3) as score, N'payload 00039 - kiểm thử dấu phẩy; -- Unicode' as payload where (39 between 1 and 3000) and 39+1>39;
select 40 as n, (40*3) as score, N'payload 00040 - kiểm thử dấu phẩy; -- Unicode' as payload where (40 between 1 and 3000) and 40+1>40;
select 41 as n, (41*3) as score, N'payload 00041 - kiểm thử dấu phẩy; -- Unicode' as payload where (41 between 1 and 3000) and 41+1>41;
select 42 as n, (42*3) as score, N'payload 00042 - kiểm thử dấu phẩy; -- Unicode' as payload where (42 between 1 and 3000) and 42+1>42;
select 43 as n, (43*3) as score, N'payload 00043 - kiểm thử dấu phẩy; -- Unicode' as payload where (43 between 1 and 3000) and 43+1>43;
select 44 as n, (44*3) as score, N'payload 00044 - kiểm thử dấu phẩy; -- Unicode' as payload where (44 between 1 and 3000) and 44+1>44;
select 45 as n, (45*3) as score, N'payload 00045 - kiểm thử dấu phẩy; -- Unicode' as payload where (45 between 1 and 3000) and 45+1>45;
select 46 as n, (46*3) as score, N'payload 00046 - kiểm thử dấu phẩy; -- Unicode' as payload where (46 between 1 and 3000) and 46+1>46;
select 47 as n, (47*3) as score, N'payload 00047 - kiểm thử dấu phẩy; -- Unicode' as payload where (47 between 1 and 3000) and 47+1>47;
select 48 as n, (48*3) as score, N'payload 00048 - kiểm thử dấu phẩy; -- Unicode' as payload where (48 between 1 and 3000) and 48+1>48;
select 49 as n, (49*3) as score, N'payload 00049 - kiểm thử dấu phẩy; -- Unicode' as payload where (49 between 1 and 3000) and 49+1>49;
select 50 as n, (50*3) as score, N'payload 00050 - kiểm thử dấu phẩy; -- Unicode' as payload where (50 between 1 and 3000) and 50+1>50;
select 51 as n, (51*3) as score, N'payload 00051 - kiểm thử dấu phẩy; -- Unicode' as payload where (51 between 1 and 3000) and 51+1>51;
select 52 as n, (52*3) as score, N'payload 00052 - kiểm thử dấu phẩy; -- Unicode' as payload where (52 between 1 and 3000) and 52+1>52;
select 53 as n, (53*3) as score, N'payload 00053 - kiểm thử dấu phẩy; -- Unicode' as payload where (53 between 1 and 3000) and 53+1>53;
select 54 as n, (54*3) as score, N'payload 00054 - kiểm thử dấu phẩy; -- Unicode' as payload where (54 between 1 and 3000) and 54+1>54;
select 55 as n, (55*3) as score, N'payload 00055 - kiểm thử dấu phẩy; -- Unicode' as payload where (55 between 1 and 3000) and 55+1>55;
select 56 as n, (56*3) as score, N'payload 00056 - kiểm thử dấu phẩy; -- Unicode' as payload where (56 between 1 and 3000) and 56+1>56;
select 57 as n, (57*3) as score, N'payload 00057 - kiểm thử dấu phẩy; -- Unicode' as payload where (57 between 1 and 3000) and 57+1>57;
select 58 as n, (58*3) as score, N'payload 00058 - kiểm thử dấu phẩy; -- Unicode' as payload where (58 between 1 and 3000) and 58+1>58;
select 59 as n, (59*3) as score, N'payload 00059 - kiểm thử dấu phẩy; -- Unicode' as payload where (59 between 1 and 3000) and 59+1>59;
select 60 as n, (60*3) as score, N'payload 00060 - kiểm thử dấu phẩy; -- Unicode' as payload where (60 between 1 and 3000) and 60+1>60;
select 61 as n, (61*3) as score, N'payload 00061 - kiểm thử dấu phẩy; -- Unicode' as payload where (61 between 1 and 3000) and 61+1>61;
select 62 as n, (62*3) as score, N'payload 00062 - kiểm thử dấu phẩy; -- Unicode' as payload where (62 between 1 and 3000) and 62+1>62;
select 63 as n, (63*3) as score, N'payload 00063 - kiểm thử dấu phẩy; -- Unicode' as payload where (63 between 1 and 3000) and 63+1>63;
select 64 as n, (64*3) as score, N'payload 00064 - kiểm thử dấu phẩy; -- Unicode' as payload where (64 between 1 and 3000) and 64+1>64;
select 65 as n, (65*3) as score, N'payload 00065 - kiểm thử dấu phẩy; -- Unicode' as payload where (65 between 1 and 3000) and 65+1>65;
select 66 as n, (66*3) as score, N'payload 00066 - kiểm thử dấu phẩy; -- Unicode' as payload where (66 between 1 and 3000) and 66+1>66;
select 67 as n, (67*3) as score, N'payload 00067 - kiểm thử dấu phẩy; -- Unicode' as payload where (67 between 1 and 3000) and 67+1>67;
select 68 as n, (68*3) as score, N'payload 00068 - kiểm thử dấu phẩy; -- Unicode' as payload where (68 between 1 and 3000) and 68+1>68;
select 69 as n, (69*3) as score, N'payload 00069 - kiểm thử dấu phẩy; -- Unicode' as payload where (69 between 1 and 3000) and 69+1>69;
select 70 as n, (70*3) as score, N'payload 00070 - kiểm thử dấu phẩy; -- Unicode' as payload where (70 between 1 and 3000) and 70+1>70;
select 71 as n, (71*3) as score, N'payload 00071 - kiểm thử dấu phẩy; -- Unicode' as payload where (71 between 1 and 3000) and 71+1>71;
select 72 as n, (72*3) as score, N'payload 00072 - kiểm thử dấu phẩy; -- Unicode' as payload where (72 between 1 and 3000) and 72+1>72;
select 73 as n, (73*3) as score, N'payload 00073 - kiểm thử dấu phẩy; -- Unicode' as payload where (73 between 1 and 3000) and 73+1>73;
select 74 as n, (74*3) as score, N'payload 00074 - kiểm thử dấu phẩy; -- Unicode' as payload where (74 between 1 and 3000) and 74+1>74;
select 75 as n, (75*3) as score, N'payload 00075 - kiểm thử dấu phẩy; -- Unicode' as payload where (75 between 1 and 3000) and 75+1>75;
select 76 as n, (76*3) as score, N'payload 00076 - kiểm thử dấu phẩy; -- Unicode' as payload where (76 between 1 and 3000) and 76+1>76;
select 77 as n, (77*3) as score, N'payload 00077 - kiểm thử dấu phẩy; -- Unicode' as payload where (77 between 1 and 3000) and 77+1>77;
select 78 as n, (78*3) as score, N'payload 00078 - kiểm thử dấu phẩy; -- Unicode' as payload where (78 between 1 and 3000) and 78+1>78;
select 79 as n, (79*3) as score, N'payload 00079 - kiểm thử dấu phẩy; -- Unicode' as payload where (79 between 1 and 3000) and 79+1>79;
select 80 as n, (80*3) as score, N'payload 00080 - kiểm thử dấu phẩy; -- Unicode' as payload where (80 between 1 and 3000) and 80+1>80;
select 81 as n, (81*3) as score, N'payload 00081 - kiểm thử dấu phẩy; -- Unicode' as payload where (81 between 1 and 3000) and 81+1>81;
select 82 as n, (82*3) as score, N'payload 00082 - kiểm thử dấu phẩy; -- Unicode' as payload where (82 between 1 and 3000) and 82+1>82;
select 83 as n, (83*3) as score, N'payload 00083 - kiểm thử dấu phẩy; -- Unicode' as payload where (83 between 1 and 3000) and 83+1>83;
select 84 as n, (84*3) as score, N'payload 00084 - kiểm thử dấu phẩy; -- Unicode' as payload where (84 between 1 and 3000) and 84+1>84;
select 85 as n, (85*3) as score, N'payload 00085 - kiểm thử dấu phẩy; -- Unicode' as payload where (85 between 1 and 3000) and 85+1>85;
select 86 as n, (86*3) as score, N'payload 00086 - kiểm thử dấu phẩy; -- Unicode' as payload where (86 between 1 and 3000) and 86+1>86;
select 87 as n, (87*3) as score, N'payload 00087 - kiểm thử dấu phẩy; -- Unicode' as payload where (87 between 1 and 3000) and 87+1>87;
select 88 as n, (88*3) as score, N'payload 00088 - kiểm thử dấu phẩy; -- Unicode' as payload where (88 between 1 and 3000) and 88+1>88;
select 89 as n, (89*3) as score, N'payload 00089 - kiểm thử dấu phẩy; -- Unicode' as payload where (89 between 1 and 3000) and 89+1>89;
select 90 as n, (90*3) as score, N'payload 00090 - kiểm thử dấu phẩy; -- Unicode' as payload where (90 between 1 and 3000) and 90+1>90;
select 91 as n, (91*3) as score, N'payload 00091 - kiểm thử dấu phẩy; -- Unicode' as payload where (91 between 1 and 3000) and 91+1>91;
select 92 as n, (92*3) as score, N'payload 00092 - kiểm thử dấu phẩy; -- Unicode' as payload where (92 between 1 and 3000) and 92+1>92;
select 93 as n, (93*3) as score, N'payload 00093 - kiểm thử dấu phẩy; -- Unicode' as payload where (93 between 1 and 3000) and 93+1>93;
select 94 as n, (94*3) as score, N'payload 00094 - kiểm thử dấu phẩy; -- Unicode' as payload where (94 between 1 and 3000) and 94+1>94;
select 95 as n, (95*3) as score, N'payload 00095 - kiểm thử dấu phẩy; -- Unicode' as payload where (95 between 1 and 3000) and 95+1>95;
select 96 as n, (96*3) as score, N'payload 00096 - kiểm thử dấu phẩy; -- Unicode' as payload where (96 between 1 and 3000) and 96+1>96;
select 97 as n, (97*3) as score, N'payload 00097 - kiểm thử dấu phẩy; -- Unicode' as payload where (97 between 1 and 3000) and 97+1>97;
select 98 as n, (98*3) as score, N'payload 00098 - kiểm thử dấu phẩy; -- Unicode' as payload where (98 between 1 and 3000) and 98+1>98;
select 99 as n, (99*3) as score, N'payload 00099 - kiểm thử dấu phẩy; -- Unicode' as payload where (99 between 1 and 3000) and 99+1>99;
select 100 as n, (100*3) as score, N'payload 00100 - kiểm thử dấu phẩy; -- Unicode' as payload where (100 between 1 and 3000) and 100+1>100;
select 101 as n, (101*3) as score, N'payload 00101 - kiểm thử dấu phẩy; -- Unicode' as payload where (101 between 1 and 3000) and 101+1>101;
select 102 as n, (102*3) as score, N'payload 00102 - kiểm thử dấu phẩy; -- Unicode' as payload where (102 between 1 and 3000) and 102+1>102;
select 103 as n, (103*3) as score, N'payload 00103 - kiểm thử dấu phẩy; -- Unicode' as payload where (103 between 1 and 3000) and 103+1>103;
select 104 as n, (104*3) as score, N'payload 00104 - kiểm thử dấu phẩy; -- Unicode' as payload where (104 between 1 and 3000) and 104+1>104;
select 105 as n, (105*3) as score, N'payload 00105 - kiểm thử dấu phẩy; -- Unicode' as payload where (105 between 1 and 3000) and 105+1>105;
select 106 as n, (106*3) as score, N'payload 00106 - kiểm thử dấu phẩy; -- Unicode' as payload where (106 between 1 and 3000) and 106+1>106;
select 107 as n, (107*3) as score, N'payload 00107 - kiểm thử dấu phẩy; -- Unicode' as payload where (107 between 1 and 3000) and 107+1>107;
select 108 as n, (108*3) as score, N'payload 00108 - kiểm thử dấu phẩy; -- Unicode' as payload where (108 between 1 and 3000) and 108+1>108;
select 109 as n, (109*3) as score, N'payload 00109 - kiểm thử dấu phẩy; -- Unicode' as payload where (109 between 1 and 3000) and 109+1>109;
select 110 as n, (110*3) as score, N'payload 00110 - kiểm thử dấu phẩy; -- Unicode' as payload where (110 between 1 and 3000) and 110+1>110;
select 111 as n, (111*3) as score, N'payload 00111 - kiểm thử dấu phẩy; -- Unicode' as payload where (111 between 1 and 3000) and 111+1>111;
select 112 as n, (112*3) as score, N'payload 00112 - kiểm thử dấu phẩy; -- Unicode' as payload where (112 between 1 and 3000) and 112+1>112;
select 113 as n, (113*3) as score, N'payload 00113 - kiểm thử dấu phẩy; -- Unicode' as payload where (113 between 1 and 3000) and 113+1>113;
select 114 as n, (114*3) as score, N'payload 00114 - kiểm thử dấu phẩy; -- Unicode' as payload where (114 between 1 and 3000) and 114+1>114;
select 115 as n, (115*3) as score, N'payload 00115 - kiểm thử dấu phẩy; -- Unicode' as payload where (115 between 1 and 3000) and 115+1>115;
select 116 as n, (116*3) as score, N'payload 00116 - kiểm thử dấu phẩy; -- Unicode' as payload where (116 between 1 and 3000) and 116+1>116;
select 117 as n, (117*3) as score, N'payload 00117 - kiểm thử dấu phẩy; -- Unicode' as payload where (117 between 1 and 3000) and 117+1>117;
select 118 as n, (118*3) as score, N'payload 00118 - kiểm thử dấu phẩy; -- Unicode' as payload where (118 between 1 and 3000) and 118+1>118;
select 119 as n, (119*3) as score, N'payload 00119 - kiểm thử dấu phẩy; -- Unicode' as payload where (119 between 1 and 3000) and 119+1>119;
select 120 as n, (120*3) as score, N'payload 00120 - kiểm thử dấu phẩy; -- Unicode' as payload where (120 between 1 and 3000) and 120+1>120;
select 121 as n, (121*3) as score, N'payload 00121 - kiểm thử dấu phẩy; -- Unicode' as payload where (121 between 1 and 3000) and 121+1>121;
select 122 as n, (122*3) as score, N'payload 00122 - kiểm thử dấu phẩy; -- Unicode' as payload where (122 between 1 and 3000) and 122+1>122;
select 123 as n, (123*3) as score, N'payload 00123 - kiểm thử dấu phẩy; -- Unicode' as payload where (123 between 1 and 3000) and 123+1>123;
select 124 as n, (124*3) as score, N'payload 00124 - kiểm thử dấu phẩy; -- Unicode' as payload where (124 between 1 and 3000) and 124+1>124;
select 125 as n, (125*3) as score, N'payload 00125 - kiểm thử dấu phẩy; -- Unicode' as payload where (125 between 1 and 3000) and 125+1>125;
select 126 as n, (126*3) as score, N'payload 00126 - kiểm thử dấu phẩy; -- Unicode' as payload where (126 between 1 and 3000) and 126+1>126;
select 127 as n, (127*3) as score, N'payload 00127 - kiểm thử dấu phẩy; -- Unicode' as payload where (127 between 1 and 3000) and 127+1>127;
select 128 as n, (128*3) as score, N'payload 00128 - kiểm thử dấu phẩy; -- Unicode' as payload where (128 between 1 and 3000) and 128+1>128;
select 129 as n, (129*3) as score, N'payload 00129 - kiểm thử dấu phẩy; -- Unicode' as payload where (129 between 1 and 3000) and 129+1>129;
select 130 as n, (130*3) as score, N'payload 00130 - kiểm thử dấu phẩy; -- Unicode' as payload where (130 between 1 and 3000) and 130+1>130;
select 131 as n, (131*3) as score, N'payload 00131 - kiểm thử dấu phẩy; -- Unicode' as payload where (131 between 1 and 3000) and 131+1>131;
select 132 as n, (132*3) as score, N'payload 00132 - kiểm thử dấu phẩy; -- Unicode' as payload where (132 between 1 and 3000) and 132+1>132;
select 133 as n, (133*3) as score, N'payload 00133 - kiểm thử dấu phẩy; -- Unicode' as payload where (133 between 1 and 3000) and 133+1>133;
select 134 as n, (134*3) as score, N'payload 00134 - kiểm thử dấu phẩy; -- Unicode' as payload where (134 between 1 and 3000) and 134+1>134;
select 135 as n, (135*3) as score, N'payload 00135 - kiểm thử dấu phẩy; -- Unicode' as payload where (135 between 1 and 3000) and 135+1>135;
select 136 as n, (136*3) as score, N'payload 00136 - kiểm thử dấu phẩy; -- Unicode' as payload where (136 between 1 and 3000) and 136+1>136;
select 137 as n, (137*3) as score, N'payload 00137 - kiểm thử dấu phẩy; -- Unicode' as payload where (137 between 1 and 3000) and 137+1>137;
select 138 as n, (138*3) as score, N'payload 00138 - kiểm thử dấu phẩy; -- Unicode' as payload where (138 between 1 and 3000) and 138+1>138;
select 139 as n, (139*3) as score, N'payload 00139 - kiểm thử dấu phẩy; -- Unicode' as payload where (139 between 1 and 3000) and 139+1>139;
select 140 as n, (140*3) as score, N'payload 00140 - kiểm thử dấu phẩy; -- Unicode' as payload where (140 between 1 and 3000) and 140+1>140;
select 141 as n, (141*3) as score, N'payload 00141 - kiểm thử dấu phẩy; -- Unicode' as payload where (141 between 1 and 3000) and 141+1>141;
select 142 as n, (142*3) as score, N'payload 00142 - kiểm thử dấu phẩy; -- Unicode' as payload where (142 between 1 and 3000) and 142+1>142;
select 143 as n, (143*3) as score, N'payload 00143 - kiểm thử dấu phẩy; -- Unicode' as payload where (143 between 1 and 3000) and 143+1>143;
select 144 as n, (144*3) as score, N'payload 00144 - kiểm thử dấu phẩy; -- Unicode' as payload where (144 between 1 and 3000) and 144+1>144;
select 145 as n, (145*3) as score, N'payload 00145 - kiểm thử dấu phẩy; -- Unicode' as payload where (145 between 1 and 3000) and 145+1>145;
select 146 as n, (146*3) as score, N'payload 00146 - kiểm thử dấu phẩy; -- Unicode' as payload where (146 between 1 and 3000) and 146+1>146;
select 147 as n, (147*3) as score, N'payload 00147 - kiểm thử dấu phẩy; -- Unicode' as payload where (147 between 1 and 3000) and 147+1>147;
select 148 as n, (148*3) as score, N'payload 00148 - kiểm thử dấu phẩy; -- Unicode' as payload where (148 between 1 and 3000) and 148+1>148;
select 149 as n, (149*3) as score, N'payload 00149 - kiểm thử dấu phẩy; -- Unicode' as payload where (149 between 1 and 3000) and 149+1>149;
select 150 as n, (150*3) as score, N'payload 00150 - kiểm thử dấu phẩy; -- Unicode' as payload where (150 between 1 and 3000) and 150+1>150;
select 151 as n, (151*3) as score, N'payload 00151 - kiểm thử dấu phẩy; -- Unicode' as payload where (151 between 1 and 3000) and 151+1>151;
select 152 as n, (152*3) as score, N'payload 00152 - kiểm thử dấu phẩy; -- Unicode' as payload where (152 between 1 and 3000) and 152+1>152;
select 153 as n, (153*3) as score, N'payload 00153 - kiểm thử dấu phẩy; -- Unicode' as payload where (153 between 1 and 3000) and 153+1>153;
select 154 as n, (154*3) as score, N'payload 00154 - kiểm thử dấu phẩy; -- Unicode' as payload where (154 between 1 and 3000) and 154+1>154;
select 155 as n, (155*3) as score, N'payload 00155 - kiểm thử dấu phẩy; -- Unicode' as payload where (155 between 1 and 3000) and 155+1>155;
select 156 as n, (156*3) as score, N'payload 00156 - kiểm thử dấu phẩy; -- Unicode' as payload where (156 between 1 and 3000) and 156+1>156;
select 157 as n, (157*3) as score, N'payload 00157 - kiểm thử dấu phẩy; -- Unicode' as payload where (157 between 1 and 3000) and 157+1>157;
select 158 as n, (158*3) as score, N'payload 00158 - kiểm thử dấu phẩy; -- Unicode' as payload where (158 between 1 and 3000) and 158+1>158;
select 159 as n, (159*3) as score, N'payload 00159 - kiểm thử dấu phẩy; -- Unicode' as payload where (159 between 1 and 3000) and 159+1>159;
select 160 as n, (160*3) as score, N'payload 00160 - kiểm thử dấu phẩy; -- Unicode' as payload where (160 between 1 and 3000) and 160+1>160;
select 161 as n, (161*3) as score, N'payload 00161 - kiểm thử dấu phẩy; -- Unicode' as payload where (161 between 1 and 3000) and 161+1>161;
select 162 as n, (162*3) as score, N'payload 00162 - kiểm thử dấu phẩy; -- Unicode' as payload where (162 between 1 and 3000) and 162+1>162;
select 163 as n, (163*3) as score, N'payload 00163 - kiểm thử dấu phẩy; -- Unicode' as payload where (163 between 1 and 3000) and 163+1>163;
select 164 as n, (164*3) as score, N'payload 00164 - kiểm thử dấu phẩy; -- Unicode' as payload where (164 between 1 and 3000) and 164+1>164;
select 165 as n, (165*3) as score, N'payload 00165 - kiểm thử dấu phẩy; -- Unicode' as payload where (165 between 1 and 3000) and 165+1>165;
select 166 as n, (166*3) as score, N'payload 00166 - kiểm thử dấu phẩy; -- Unicode' as payload where (166 between 1 and 3000) and 166+1>166;
select 167 as n, (167*3) as score, N'payload 00167 - kiểm thử dấu phẩy; -- Unicode' as payload where (167 between 1 and 3000) and 167+1>167;
select 168 as n, (168*3) as score, N'payload 00168 - kiểm thử dấu phẩy; -- Unicode' as payload where (168 between 1 and 3000) and 168+1>168;
select 169 as n, (169*3) as score, N'payload 00169 - kiểm thử dấu phẩy; -- Unicode' as payload where (169 between 1 and 3000) and 169+1>169;
select 170 as n, (170*3) as score, N'payload 00170 - kiểm thử dấu phẩy; -- Unicode' as payload where (170 between 1 and 3000) and 170+1>170;
select 171 as n, (171*3) as score, N'payload 00171 - kiểm thử dấu phẩy; -- Unicode' as payload where (171 between 1 and 3000) and 171+1>171;
select 172 as n, (172*3) as score, N'payload 00172 - kiểm thử dấu phẩy; -- Unicode' as payload where (172 between 1 and 3000) and 172+1>172;
select 173 as n, (173*3) as score, N'payload 00173 - kiểm thử dấu phẩy; -- Unicode' as payload where (173 between 1 and 3000) and 173+1>173;
select 174 as n, (174*3) as score, N'payload 00174 - kiểm thử dấu phẩy; -- Unicode' as payload where (174 between 1 and 3000) and 174+1>174;
select 175 as n, (175*3) as score, N'payload 00175 - kiểm thử dấu phẩy; -- Unicode' as payload where (175 between 1 and 3000) and 175+1>175;
select 176 as n, (176*3) as score, N'payload 00176 - kiểm thử dấu phẩy; -- Unicode' as payload where (176 between 1 and 3000) and 176+1>176;
select 177 as n, (177*3) as score, N'payload 00177 - kiểm thử dấu phẩy; -- Unicode' as payload where (177 between 1 and 3000) and 177+1>177;
select 178 as n, (178*3) as score, N'payload 00178 - kiểm thử dấu phẩy; -- Unicode' as payload where (178 between 1 and 3000) and 178+1>178;
select 179 as n, (179*3) as score, N'payload 00179 - kiểm thử dấu phẩy; -- Unicode' as payload where (179 between 1 and 3000) and 179+1>179;
select 180 as n, (180*3) as score, N'payload 00180 - kiểm thử dấu phẩy; -- Unicode' as payload where (180 between 1 and 3000) and 180+1>180;
select 181 as n, (181*3) as score, N'payload 00181 - kiểm thử dấu phẩy; -- Unicode' as payload where (181 between 1 and 3000) and 181+1>181;
select 182 as n, (182*3) as score, N'payload 00182 - kiểm thử dấu phẩy; -- Unicode' as payload where (182 between 1 and 3000) and 182+1>182;
select 183 as n, (183*3) as score, N'payload 00183 - kiểm thử dấu phẩy; -- Unicode' as payload where (183 between 1 and 3000) and 183+1>183;
select 184 as n, (184*3) as score, N'payload 00184 - kiểm thử dấu phẩy; -- Unicode' as payload where (184 between 1 and 3000) and 184+1>184;
select 185 as n, (185*3) as score, N'payload 00185 - kiểm thử dấu phẩy; -- Unicode' as payload where (185 between 1 and 3000) and 185+1>185;
select 186 as n, (186*3) as score, N'payload 00186 - kiểm thử dấu phẩy; -- Unicode' as payload where (186 between 1 and 3000) and 186+1>186;
select 187 as n, (187*3) as score, N'payload 00187 - kiểm thử dấu phẩy; -- Unicode' as payload where (187 between 1 and 3000) and 187+1>187;
select 188 as n, (188*3) as score, N'payload 00188 - kiểm thử dấu phẩy; -- Unicode' as payload where (188 between 1 and 3000) and 188+1>188;
select 189 as n, (189*3) as score, N'payload 00189 - kiểm thử dấu phẩy; -- Unicode' as payload where (189 between 1 and 3000) and 189+1>189;
select 190 as n, (190*3) as score, N'payload 00190 - kiểm thử dấu phẩy; -- Unicode' as payload where (190 between 1 and 3000) and 190+1>190;
select 191 as n, (191*3) as score, N'payload 00191 - kiểm thử dấu phẩy; -- Unicode' as payload where (191 between 1 and 3000) and 191+1>191;
select 192 as n, (192*3) as score, N'payload 00192 - kiểm thử dấu phẩy; -- Unicode' as payload where (192 between 1 and 3000) and 192+1>192;
select 193 as n, (193*3) as score, N'payload 00193 - kiểm thử dấu phẩy; -- Unicode' as payload where (193 between 1 and 3000) and 193+1>193;
select 194 as n, (194*3) as score, N'payload 00194 - kiểm thử dấu phẩy; -- Unicode' as payload where (194 between 1 and 3000) and 194+1>194;
select 195 as n, (195*3) as score, N'payload 00195 - kiểm thử dấu phẩy; -- Unicode' as payload where (195 between 1 and 3000) and 195+1>195;
select 196 as n, (196*3) as score, N'payload 00196 - kiểm thử dấu phẩy; -- Unicode' as payload where (196 between 1 and 3000) and 196+1>196;
select 197 as n, (197*3) as score, N'payload 00197 - kiểm thử dấu phẩy; -- Unicode' as payload where (197 between 1 and 3000) and 197+1>197;
select 198 as n, (198*3) as score, N'payload 00198 - kiểm thử dấu phẩy; -- Unicode' as payload where (198 between 1 and 3000) and 198+1>198;
select 199 as n, (199*3) as score, N'payload 00199 - kiểm thử dấu phẩy; -- Unicode' as payload where (199 between 1 and 3000) and 199+1>199;
select 200 as n, (200*3) as score, N'payload 00200 - kiểm thử dấu phẩy; -- Unicode' as payload where (200 between 1 and 3000) and 200+1>200;
select 201 as n, (201*3) as score, N'payload 00201 - kiểm thử dấu phẩy; -- Unicode' as payload where (201 between 1 and 3000) and 201+1>201;
select 202 as n, (202*3) as score, N'payload 00202 - kiểm thử dấu phẩy; -- Unicode' as payload where (202 between 1 and 3000) and 202+1>202;
select 203 as n, (203*3) as score, N'payload 00203 - kiểm thử dấu phẩy; -- Unicode' as payload where (203 between 1 and 3000) and 203+1>203;
select 204 as n, (204*3) as score, N'payload 00204 - kiểm thử dấu phẩy; -- Unicode' as payload where (204 between 1 and 3000) and 204+1>204;
select 205 as n, (205*3) as score, N'payload 00205 - kiểm thử dấu phẩy; -- Unicode' as payload where (205 between 1 and 3000) and 205+1>205;
select 206 as n, (206*3) as score, N'payload 00206 - kiểm thử dấu phẩy; -- Unicode' as payload where (206 between 1 and 3000) and 206+1>206;
select 207 as n, (207*3) as score, N'payload 00207 - kiểm thử dấu phẩy; -- Unicode' as payload where (207 between 1 and 3000) and 207+1>207;
select 208 as n, (208*3) as score, N'payload 00208 - kiểm thử dấu phẩy; -- Unicode' as payload where (208 between 1 and 3000) and 208+1>208;
select 209 as n, (209*3) as score, N'payload 00209 - kiểm thử dấu phẩy; -- Unicode' as payload where (209 between 1 and 3000) and 209+1>209;
select 210 as n, (210*3) as score, N'payload 00210 - kiểm thử dấu phẩy; -- Unicode' as payload where (210 between 1 and 3000) and 210+1>210;
select 211 as n, (211*3) as score, N'payload 00211 - kiểm thử dấu phẩy; -- Unicode' as payload where (211 between 1 and 3000) and 211+1>211;
select 212 as n, (212*3) as score, N'payload 00212 - kiểm thử dấu phẩy; -- Unicode' as payload where (212 between 1 and 3000) and 212+1>212;
select 213 as n, (213*3) as score, N'payload 00213 - kiểm thử dấu phẩy; -- Unicode' as payload where (213 between 1 and 3000) and 213+1>213;
select 214 as n, (214*3) as score, N'payload 00214 - kiểm thử dấu phẩy; -- Unicode' as payload where (214 between 1 and 3000) and 214+1>214;
select 215 as n, (215*3) as score, N'payload 00215 - kiểm thử dấu phẩy; -- Unicode' as payload where (215 between 1 and 3000) and 215+1>215;
select 216 as n, (216*3) as score, N'payload 00216 - kiểm thử dấu phẩy; -- Unicode' as payload where (216 between 1 and 3000) and 216+1>216;
select 217 as n, (217*3) as score, N'payload 00217 - kiểm thử dấu phẩy; -- Unicode' as payload where (217 between 1 and 3000) and 217+1>217;
select 218 as n, (218*3) as score, N'payload 00218 - kiểm thử dấu phẩy; -- Unicode' as payload where (218 between 1 and 3000) and 218+1>218;
select 219 as n, (219*3) as score, N'payload 00219 - kiểm thử dấu phẩy; -- Unicode' as payload where (219 between 1 and 3000) and 219+1>219;
select 220 as n, (220*3) as score, N'payload 00220 - kiểm thử dấu phẩy; -- Unicode' as payload where (220 between 1 and 3000) and 220+1>220;
select 221 as n, (221*3) as score, N'payload 00221 - kiểm thử dấu phẩy; -- Unicode' as payload where (221 between 1 and 3000) and 221+1>221;
select 222 as n, (222*3) as score, N'payload 00222 - kiểm thử dấu phẩy; -- Unicode' as payload where (222 between 1 and 3000) and 222+1>222;
select 223 as n, (223*3) as score, N'payload 00223 - kiểm thử dấu phẩy; -- Unicode' as payload where (223 between 1 and 3000) and 223+1>223;
select 224 as n, (224*3) as score, N'payload 00224 - kiểm thử dấu phẩy; -- Unicode' as payload where (224 between 1 and 3000) and 224+1>224;
select 225 as n, (225*3) as score, N'payload 00225 - kiểm thử dấu phẩy; -- Unicode' as payload where (225 between 1 and 3000) and 225+1>225;
select 226 as n, (226*3) as score, N'payload 00226 - kiểm thử dấu phẩy; -- Unicode' as payload where (226 between 1 and 3000) and 226+1>226;
select 227 as n, (227*3) as score, N'payload 00227 - kiểm thử dấu phẩy; -- Unicode' as payload where (227 between 1 and 3000) and 227+1>227;
select 228 as n, (228*3) as score, N'payload 00228 - kiểm thử dấu phẩy; -- Unicode' as payload where (228 between 1 and 3000) and 228+1>228;
select 229 as n, (229*3) as score, N'payload 00229 - kiểm thử dấu phẩy; -- Unicode' as payload where (229 between 1 and 3000) and 229+1>229;
select 230 as n, (230*3) as score, N'payload 00230 - kiểm thử dấu phẩy; -- Unicode' as payload where (230 between 1 and 3000) and 230+1>230;
select 231 as n, (231*3) as score, N'payload 00231 - kiểm thử dấu phẩy; -- Unicode' as payload where (231 between 1 and 3000) and 231+1>231;
select 232 as n, (232*3) as score, N'payload 00232 - kiểm thử dấu phẩy; -- Unicode' as payload where (232 between 1 and 3000) and 232+1>232;
select 233 as n, (233*3) as score, N'payload 00233 - kiểm thử dấu phẩy; -- Unicode' as payload where (233 between 1 and 3000) and 233+1>233;
select 234 as n, (234*3) as score, N'payload 00234 - kiểm thử dấu phẩy; -- Unicode' as payload where (234 between 1 and 3000) and 234+1>234;
select 235 as n, (235*3) as score, N'payload 00235 - kiểm thử dấu phẩy; -- Unicode' as payload where (235 between 1 and 3000) and 235+1>235;
select 236 as n, (236*3) as score, N'payload 00236 - kiểm thử dấu phẩy; -- Unicode' as payload where (236 between 1 and 3000) and 236+1>236;
select 237 as n, (237*3) as score, N'payload 00237 - kiểm thử dấu phẩy; -- Unicode' as payload where (237 between 1 and 3000) and 237+1>237;
select 238 as n, (238*3) as score, N'payload 00238 - kiểm thử dấu phẩy; -- Unicode' as payload where (238 between 1 and 3000) and 238+1>238;
select 239 as n, (239*3) as score, N'payload 00239 - kiểm thử dấu phẩy; -- Unicode' as payload where (239 between 1 and 3000) and 239+1>239;
select 240 as n, (240*3) as score, N'payload 00240 - kiểm thử dấu phẩy; -- Unicode' as payload where (240 between 1 and 3000) and 240+1>240;
select 241 as n, (241*3) as score, N'payload 00241 - kiểm thử dấu phẩy; -- Unicode' as payload where (241 between 1 and 3000) and 241+1>241;
select 242 as n, (242*3) as score, N'payload 00242 - kiểm thử dấu phẩy; -- Unicode' as payload where (242 between 1 and 3000) and 242+1>242;
select 243 as n, (243*3) as score, N'payload 00243 - kiểm thử dấu phẩy; -- Unicode' as payload where (243 between 1 and 3000) and 243+1>243;
select 244 as n, (244*3) as score, N'payload 00244 - kiểm thử dấu phẩy; -- Unicode' as payload where (244 between 1 and 3000) and 244+1>244;
select 245 as n, (245*3) as score, N'payload 00245 - kiểm thử dấu phẩy; -- Unicode' as payload where (245 between 1 and 3000) and 245+1>245;
select 246 as n, (246*3) as score, N'payload 00246 - kiểm thử dấu phẩy; -- Unicode' as payload where (246 between 1 and 3000) and 246+1>246;
select 247 as n, (247*3) as score, N'payload 00247 - kiểm thử dấu phẩy; -- Unicode' as payload where (247 between 1 and 3000) and 247+1>247;
select 248 as n, (248*3) as score, N'payload 00248 - kiểm thử dấu phẩy; -- Unicode' as payload where (248 between 1 and 3000) and 248+1>248;
select 249 as n, (249*3) as score, N'payload 00249 - kiểm thử dấu phẩy; -- Unicode' as payload where (249 between 1 and 3000) and 249+1>249;
select 250 as n, (250*3) as score, N'payload 00250 - kiểm thử dấu phẩy; -- Unicode' as payload where (250 between 1 and 3000) and 250+1>250;
select 251 as n, (251*3) as score, N'payload 00251 - kiểm thử dấu phẩy; -- Unicode' as payload where (251 between 1 and 3000) and 251+1>251;
select 252 as n, (252*3) as score, N'payload 00252 - kiểm thử dấu phẩy; -- Unicode' as payload where (252 between 1 and 3000) and 252+1>252;
select 253 as n, (253*3) as score, N'payload 00253 - kiểm thử dấu phẩy; -- Unicode' as payload where (253 between 1 and 3000) and 253+1>253;
select 254 as n, (254*3) as score, N'payload 00254 - kiểm thử dấu phẩy; -- Unicode' as payload where (254 between 1 and 3000) and 254+1>254;
select 255 as n, (255*3) as score, N'payload 00255 - kiểm thử dấu phẩy; -- Unicode' as payload where (255 between 1 and 3000) and 255+1>255;
select 256 as n, (256*3) as score, N'payload 00256 - kiểm thử dấu phẩy; -- Unicode' as payload where (256 between 1 and 3000) and 256+1>256;
select 257 as n, (257*3) as score, N'payload 00257 - kiểm thử dấu phẩy; -- Unicode' as payload where (257 between 1 and 3000) and 257+1>257;
select 258 as n, (258*3) as score, N'payload 00258 - kiểm thử dấu phẩy; -- Unicode' as payload where (258 between 1 and 3000) and 258+1>258;
select 259 as n, (259*3) as score, N'payload 00259 - kiểm thử dấu phẩy; -- Unicode' as payload where (259 between 1 and 3000) and 259+1>259;
select 260 as n, (260*3) as score, N'payload 00260 - kiểm thử dấu phẩy; -- Unicode' as payload where (260 between 1 and 3000) and 260+1>260;
select 261 as n, (261*3) as score, N'payload 00261 - kiểm thử dấu phẩy; -- Unicode' as payload where (261 between 1 and 3000) and 261+1>261;
select 262 as n, (262*3) as score, N'payload 00262 - kiểm thử dấu phẩy; -- Unicode' as payload where (262 between 1 and 3000) and 262+1>262;
select 263 as n, (263*3) as score, N'payload 00263 - kiểm thử dấu phẩy; -- Unicode' as payload where (263 between 1 and 3000) and 263+1>263;
select 264 as n, (264*3) as score, N'payload 00264 - kiểm thử dấu phẩy; -- Unicode' as payload where (264 between 1 and 3000) and 264+1>264;
select 265 as n, (265*3) as score, N'payload 00265 - kiểm thử dấu phẩy; -- Unicode' as payload where (265 between 1 and 3000) and 265+1>265;
select 266 as n, (266*3) as score, N'payload 00266 - kiểm thử dấu phẩy; -- Unicode' as payload where (266 between 1 and 3000) and 266+1>266;
select 267 as n, (267*3) as score, N'payload 00267 - kiểm thử dấu phẩy; -- Unicode' as payload where (267 between 1 and 3000) and 267+1>267;
select 268 as n, (268*3) as score, N'payload 00268 - kiểm thử dấu phẩy; -- Unicode' as payload where (268 between 1 and 3000) and 268+1>268;
select 269 as n, (269*3) as score, N'payload 00269 - kiểm thử dấu phẩy; -- Unicode' as payload where (269 between 1 and 3000) and 269+1>269;
select 270 as n, (270*3) as score, N'payload 00270 - kiểm thử dấu phẩy; -- Unicode' as payload where (270 between 1 and 3000) and 270+1>270;
select 271 as n, (271*3) as score, N'payload 00271 - kiểm thử dấu phẩy; -- Unicode' as payload where (271 between 1 and 3000) and 271+1>271;
select 272 as n, (272*3) as score, N'payload 00272 - kiểm thử dấu phẩy; -- Unicode' as payload where (272 between 1 and 3000) and 272+1>272;
select 273 as n, (273*3) as score, N'payload 00273 - kiểm thử dấu phẩy; -- Unicode' as payload where (273 between 1 and 3000) and 273+1>273;
select 274 as n, (274*3) as score, N'payload 00274 - kiểm thử dấu phẩy; -- Unicode' as payload where (274 between 1 and 3000) and 274+1>274;
select 275 as n, (275*3) as score, N'payload 00275 - kiểm thử dấu phẩy; -- Unicode' as payload where (275 between 1 and 3000) and 275+1>275;
select 276 as n, (276*3) as score, N'payload 00276 - kiểm thử dấu phẩy; -- Unicode' as payload where (276 between 1 and 3000) and 276+1>276;
select 277 as n, (277*3) as score, N'payload 00277 - kiểm thử dấu phẩy; -- Unicode' as payload where (277 between 1 and 3000) and 277+1>277;
select 278 as n, (278*3) as score, N'payload 00278 - kiểm thử dấu phẩy; -- Unicode' as payload where (278 between 1 and 3000) and 278+1>278;
select 279 as n, (279*3) as score, N'payload 00279 - kiểm thử dấu phẩy; -- Unicode' as payload where (279 between 1 and 3000) and 279+1>279;
select 280 as n, (280*3) as score, N'payload 00280 - kiểm thử dấu phẩy; -- Unicode' as payload where (280 between 1 and 3000) and 280+1>280;
select 281 as n, (281*3) as score, N'payload 00281 - kiểm thử dấu phẩy; -- Unicode' as payload where (281 between 1 and 3000) and 281+1>281;
select 282 as n, (282*3) as score, N'payload 00282 - kiểm thử dấu phẩy; -- Unicode' as payload where (282 between 1 and 3000) and 282+1>282;
select 283 as n, (283*3) as score, N'payload 00283 - kiểm thử dấu phẩy; -- Unicode' as payload where (283 between 1 and 3000) and 283+1>283;
select 284 as n, (284*3) as score, N'payload 00284 - kiểm thử dấu phẩy; -- Unicode' as payload where (284 between 1 and 3000) and 284+1>284;
select 285 as n, (285*3) as score, N'payload 00285 - kiểm thử dấu phẩy; -- Unicode' as payload where (285 between 1 and 3000) and 285+1>285;
select 286 as n, (286*3) as score, N'payload 00286 - kiểm thử dấu phẩy; -- Unicode' as payload where (286 between 1 and 3000) and 286+1>286;
select 287 as n, (287*3) as score, N'payload 00287 - kiểm thử dấu phẩy; -- Unicode' as payload where (287 between 1 and 3000) and 287+1>287;
select 288 as n, (288*3) as score, N'payload 00288 - kiểm thử dấu phẩy; -- Unicode' as payload where (288 between 1 and 3000) and 288+1>288;
select 289 as n, (289*3) as score, N'payload 00289 - kiểm thử dấu phẩy; -- Unicode' as payload where (289 between 1 and 3000) and 289+1>289;
select 290 as n, (290*3) as score, N'payload 00290 - kiểm thử dấu phẩy; -- Unicode' as payload where (290 between 1 and 3000) and 290+1>290;
select 291 as n, (291*3) as score, N'payload 00291 - kiểm thử dấu phẩy; -- Unicode' as payload where (291 between 1 and 3000) and 291+1>291;
select 292 as n, (292*3) as score, N'payload 00292 - kiểm thử dấu phẩy; -- Unicode' as payload where (292 between 1 and 3000) and 292+1>292;
select 293 as n, (293*3) as score, N'payload 00293 - kiểm thử dấu phẩy; -- Unicode' as payload where (293 between 1 and 3000) and 293+1>293;
select 294 as n, (294*3) as score, N'payload 00294 - kiểm thử dấu phẩy; -- Unicode' as payload where (294 between 1 and 3000) and 294+1>294;
select 295 as n, (295*3) as score, N'payload 00295 - kiểm thử dấu phẩy; -- Unicode' as payload where (295 between 1 and 3000) and 295+1>295;
select 296 as n, (296*3) as score, N'payload 00296 - kiểm thử dấu phẩy; -- Unicode' as payload where (296 between 1 and 3000) and 296+1>296;
select 297 as n, (297*3) as score, N'payload 00297 - kiểm thử dấu phẩy; -- Unicode' as payload where (297 between 1 and 3000) and 297+1>297;
select 298 as n, (298*3) as score, N'payload 00298 - kiểm thử dấu phẩy; -- Unicode' as payload where (298 between 1 and 3000) and 298+1>298;
select 299 as n, (299*3) as score, N'payload 00299 - kiểm thử dấu phẩy; -- Unicode' as payload where (299 between 1 and 3000) and 299+1>299;
select 300 as n, (300*3) as score, N'payload 00300 - kiểm thử dấu phẩy; -- Unicode' as payload where (300 between 1 and 3000) and 300+1>300;
select 301 as n, (301*3) as score, N'payload 00301 - kiểm thử dấu phẩy; -- Unicode' as payload where (301 between 1 and 3000) and 301+1>301;
select 302 as n, (302*3) as score, N'payload 00302 - kiểm thử dấu phẩy; -- Unicode' as payload where (302 between 1 and 3000) and 302+1>302;
select 303 as n, (303*3) as score, N'payload 00303 - kiểm thử dấu phẩy; -- Unicode' as payload where (303 between 1 and 3000) and 303+1>303;
select 304 as n, (304*3) as score, N'payload 00304 - kiểm thử dấu phẩy; -- Unicode' as payload where (304 between 1 and 3000) and 304+1>304;
select 305 as n, (305*3) as score, N'payload 00305 - kiểm thử dấu phẩy; -- Unicode' as payload where (305 between 1 and 3000) and 305+1>305;
select 306 as n, (306*3) as score, N'payload 00306 - kiểm thử dấu phẩy; -- Unicode' as payload where (306 between 1 and 3000) and 306+1>306;
select 307 as n, (307*3) as score, N'payload 00307 - kiểm thử dấu phẩy; -- Unicode' as payload where (307 between 1 and 3000) and 307+1>307;
select 308 as n, (308*3) as score, N'payload 00308 - kiểm thử dấu phẩy; -- Unicode' as payload where (308 between 1 and 3000) and 308+1>308;
select 309 as n, (309*3) as score, N'payload 00309 - kiểm thử dấu phẩy; -- Unicode' as payload where (309 between 1 and 3000) and 309+1>309;
select 310 as n, (310*3) as score, N'payload 00310 - kiểm thử dấu phẩy; -- Unicode' as payload where (310 between 1 and 3000) and 310+1>310;
select 311 as n, (311*3) as score, N'payload 00311 - kiểm thử dấu phẩy; -- Unicode' as payload where (311 between 1 and 3000) and 311+1>311;
select 312 as n, (312*3) as score, N'payload 00312 - kiểm thử dấu phẩy; -- Unicode' as payload where (312 between 1 and 3000) and 312+1>312;
select 313 as n, (313*3) as score, N'payload 00313 - kiểm thử dấu phẩy; -- Unicode' as payload where (313 between 1 and 3000) and 313+1>313;
select 314 as n, (314*3) as score, N'payload 00314 - kiểm thử dấu phẩy; -- Unicode' as payload where (314 between 1 and 3000) and 314+1>314;
select 315 as n, (315*3) as score, N'payload 00315 - kiểm thử dấu phẩy; -- Unicode' as payload where (315 between 1 and 3000) and 315+1>315;
select 316 as n, (316*3) as score, N'payload 00316 - kiểm thử dấu phẩy; -- Unicode' as payload where (316 between 1 and 3000) and 316+1>316;
select 317 as n, (317*3) as score, N'payload 00317 - kiểm thử dấu phẩy; -- Unicode' as payload where (317 between 1 and 3000) and 317+1>317;
select 318 as n, (318*3) as score, N'payload 00318 - kiểm thử dấu phẩy; -- Unicode' as payload where (318 between 1 and 3000) and 318+1>318;
select 319 as n, (319*3) as score, N'payload 00319 - kiểm thử dấu phẩy; -- Unicode' as payload where (319 between 1 and 3000) and 319+1>319;
select 320 as n, (320*3) as score, N'payload 00320 - kiểm thử dấu phẩy; -- Unicode' as payload where (320 between 1 and 3000) and 320+1>320;
select 321 as n, (321*3) as score, N'payload 00321 - kiểm thử dấu phẩy; -- Unicode' as payload where (321 between 1 and 3000) and 321+1>321;
select 322 as n, (322*3) as score, N'payload 00322 - kiểm thử dấu phẩy; -- Unicode' as payload where (322 between 1 and 3000) and 322+1>322;
select 323 as n, (323*3) as score, N'payload 00323 - kiểm thử dấu phẩy; -- Unicode' as payload where (323 between 1 and 3000) and 323+1>323;
select 324 as n, (324*3) as score, N'payload 00324 - kiểm thử dấu phẩy; -- Unicode' as payload where (324 between 1 and 3000) and 324+1>324;
select 325 as n, (325*3) as score, N'payload 00325 - kiểm thử dấu phẩy; -- Unicode' as payload where (325 between 1 and 3000) and 325+1>325;
select 326 as n, (326*3) as score, N'payload 00326 - kiểm thử dấu phẩy; -- Unicode' as payload where (326 between 1 and 3000) and 326+1>326;
select 327 as n, (327*3) as score, N'payload 00327 - kiểm thử dấu phẩy; -- Unicode' as payload where (327 between 1 and 3000) and 327+1>327;
select 328 as n, (328*3) as score, N'payload 00328 - kiểm thử dấu phẩy; -- Unicode' as payload where (328 between 1 and 3000) and 328+1>328;
select 329 as n, (329*3) as score, N'payload 00329 - kiểm thử dấu phẩy; -- Unicode' as payload where (329 between 1 and 3000) and 329+1>329;
select 330 as n, (330*3) as score, N'payload 00330 - kiểm thử dấu phẩy; -- Unicode' as payload where (330 between 1 and 3000) and 330+1>330;
select 331 as n, (331*3) as score, N'payload 00331 - kiểm thử dấu phẩy; -- Unicode' as payload where (331 between 1 and 3000) and 331+1>331;
select 332 as n, (332*3) as score, N'payload 00332 - kiểm thử dấu phẩy; -- Unicode' as payload where (332 between 1 and 3000) and 332+1>332;
select 333 as n, (333*3) as score, N'payload 00333 - kiểm thử dấu phẩy; -- Unicode' as payload where (333 between 1 and 3000) and 333+1>333;
select 334 as n, (334*3) as score, N'payload 00334 - kiểm thử dấu phẩy; -- Unicode' as payload where (334 between 1 and 3000) and 334+1>334;
select 335 as n, (335*3) as score, N'payload 00335 - kiểm thử dấu phẩy; -- Unicode' as payload where (335 between 1 and 3000) and 335+1>335;
select 336 as n, (336*3) as score, N'payload 00336 - kiểm thử dấu phẩy; -- Unicode' as payload where (336 between 1 and 3000) and 336+1>336;
select 337 as n, (337*3) as score, N'payload 00337 - kiểm thử dấu phẩy; -- Unicode' as payload where (337 between 1 and 3000) and 337+1>337;
select 338 as n, (338*3) as score, N'payload 00338 - kiểm thử dấu phẩy; -- Unicode' as payload where (338 between 1 and 3000) and 338+1>338;
select 339 as n, (339*3) as score, N'payload 00339 - kiểm thử dấu phẩy; -- Unicode' as payload where (339 between 1 and 3000) and 339+1>339;
select 340 as n, (340*3) as score, N'payload 00340 - kiểm thử dấu phẩy; -- Unicode' as payload where (340 between 1 and 3000) and 340+1>340;
select 341 as n, (341*3) as score, N'payload 00341 - kiểm thử dấu phẩy; -- Unicode' as payload where (341 between 1 and 3000) and 341+1>341;
select 342 as n, (342*3) as score, N'payload 00342 - kiểm thử dấu phẩy; -- Unicode' as payload where (342 between 1 and 3000) and 342+1>342;
select 343 as n, (343*3) as score, N'payload 00343 - kiểm thử dấu phẩy; -- Unicode' as payload where (343 between 1 and 3000) and 343+1>343;
select 344 as n, (344*3) as score, N'payload 00344 - kiểm thử dấu phẩy; -- Unicode' as payload where (344 between 1 and 3000) and 344+1>344;
select 345 as n, (345*3) as score, N'payload 00345 - kiểm thử dấu phẩy; -- Unicode' as payload where (345 between 1 and 3000) and 345+1>345;
select 346 as n, (346*3) as score, N'payload 00346 - kiểm thử dấu phẩy; -- Unicode' as payload where (346 between 1 and 3000) and 346+1>346;
select 347 as n, (347*3) as score, N'payload 00347 - kiểm thử dấu phẩy; -- Unicode' as payload where (347 between 1 and 3000) and 347+1>347;
select 348 as n, (348*3) as score, N'payload 00348 - kiểm thử dấu phẩy; -- Unicode' as payload where (348 between 1 and 3000) and 348+1>348;
select 349 as n, (349*3) as score, N'payload 00349 - kiểm thử dấu phẩy; -- Unicode' as payload where (349 between 1 and 3000) and 349+1>349;
select 350 as n, (350*3) as score, N'payload 00350 - kiểm thử dấu phẩy; -- Unicode' as payload where (350 between 1 and 3000) and 350+1>350;
select 351 as n, (351*3) as score, N'payload 00351 - kiểm thử dấu phẩy; -- Unicode' as payload where (351 between 1 and 3000) and 351+1>351;
select 352 as n, (352*3) as score, N'payload 00352 - kiểm thử dấu phẩy; -- Unicode' as payload where (352 between 1 and 3000) and 352+1>352;
select 353 as n, (353*3) as score, N'payload 00353 - kiểm thử dấu phẩy; -- Unicode' as payload where (353 between 1 and 3000) and 353+1>353;
select 354 as n, (354*3) as score, N'payload 00354 - kiểm thử dấu phẩy; -- Unicode' as payload where (354 between 1 and 3000) and 354+1>354;
select 355 as n, (355*3) as score, N'payload 00355 - kiểm thử dấu phẩy; -- Unicode' as payload where (355 between 1 and 3000) and 355+1>355;
select 356 as n, (356*3) as score, N'payload 00356 - kiểm thử dấu phẩy; -- Unicode' as payload where (356 between 1 and 3000) and 356+1>356;
select 357 as n, (357*3) as score, N'payload 00357 - kiểm thử dấu phẩy; -- Unicode' as payload where (357 between 1 and 3000) and 357+1>357;
select 358 as n, (358*3) as score, N'payload 00358 - kiểm thử dấu phẩy; -- Unicode' as payload where (358 between 1 and 3000) and 358+1>358;
select 359 as n, (359*3) as score, N'payload 00359 - kiểm thử dấu phẩy; -- Unicode' as payload where (359 between 1 and 3000) and 359+1>359;
select 360 as n, (360*3) as score, N'payload 00360 - kiểm thử dấu phẩy; -- Unicode' as payload where (360 between 1 and 3000) and 360+1>360;
select 361 as n, (361*3) as score, N'payload 00361 - kiểm thử dấu phẩy; -- Unicode' as payload where (361 between 1 and 3000) and 361+1>361;
select 362 as n, (362*3) as score, N'payload 00362 - kiểm thử dấu phẩy; -- Unicode' as payload where (362 between 1 and 3000) and 362+1>362;
select 363 as n, (363*3) as score, N'payload 00363 - kiểm thử dấu phẩy; -- Unicode' as payload where (363 between 1 and 3000) and 363+1>363;
select 364 as n, (364*3) as score, N'payload 00364 - kiểm thử dấu phẩy; -- Unicode' as payload where (364 between 1 and 3000) and 364+1>364;
select 365 as n, (365*3) as score, N'payload 00365 - kiểm thử dấu phẩy; -- Unicode' as payload where (365 between 1 and 3000) and 365+1>365;
select 366 as n, (366*3) as score, N'payload 00366 - kiểm thử dấu phẩy; -- Unicode' as payload where (366 between 1 and 3000) and 366+1>366;
select 367 as n, (367*3) as score, N'payload 00367 - kiểm thử dấu phẩy; -- Unicode' as payload where (367 between 1 and 3000) and 367+1>367;
select 368 as n, (368*3) as score, N'payload 00368 - kiểm thử dấu phẩy; -- Unicode' as payload where (368 between 1 and 3000) and 368+1>368;
select 369 as n, (369*3) as score, N'payload 00369 - kiểm thử dấu phẩy; -- Unicode' as payload where (369 between 1 and 3000) and 369+1>369;
select 370 as n, (370*3) as score, N'payload 00370 - kiểm thử dấu phẩy; -- Unicode' as payload where (370 between 1 and 3000) and 370+1>370;
select 371 as n, (371*3) as score, N'payload 00371 - kiểm thử dấu phẩy; -- Unicode' as payload where (371 between 1 and 3000) and 371+1>371;
select 372 as n, (372*3) as score, N'payload 00372 - kiểm thử dấu phẩy; -- Unicode' as payload where (372 between 1 and 3000) and 372+1>372;
select 373 as n, (373*3) as score, N'payload 00373 - kiểm thử dấu phẩy; -- Unicode' as payload where (373 between 1 and 3000) and 373+1>373;
select 374 as n, (374*3) as score, N'payload 00374 - kiểm thử dấu phẩy; -- Unicode' as payload where (374 between 1 and 3000) and 374+1>374;
select 375 as n, (375*3) as score, N'payload 00375 - kiểm thử dấu phẩy; -- Unicode' as payload where (375 between 1 and 3000) and 375+1>375;
select 376 as n, (376*3) as score, N'payload 00376 - kiểm thử dấu phẩy; -- Unicode' as payload where (376 between 1 and 3000) and 376+1>376;
select 377 as n, (377*3) as score, N'payload 00377 - kiểm thử dấu phẩy; -- Unicode' as payload where (377 between 1 and 3000) and 377+1>377;
select 378 as n, (378*3) as score, N'payload 00378 - kiểm thử dấu phẩy; -- Unicode' as payload where (378 between 1 and 3000) and 378+1>378;
select 379 as n, (379*3) as score, N'payload 00379 - kiểm thử dấu phẩy; -- Unicode' as payload where (379 between 1 and 3000) and 379+1>379;
select 380 as n, (380*3) as score, N'payload 00380 - kiểm thử dấu phẩy; -- Unicode' as payload where (380 between 1 and 3000) and 380+1>380;
select 381 as n, (381*3) as score, N'payload 00381 - kiểm thử dấu phẩy; -- Unicode' as payload where (381 between 1 and 3000) and 381+1>381;
select 382 as n, (382*3) as score, N'payload 00382 - kiểm thử dấu phẩy; -- Unicode' as payload where (382 between 1 and 3000) and 382+1>382;
select 383 as n, (383*3) as score, N'payload 00383 - kiểm thử dấu phẩy; -- Unicode' as payload where (383 between 1 and 3000) and 383+1>383;
select 384 as n, (384*3) as score, N'payload 00384 - kiểm thử dấu phẩy; -- Unicode' as payload where (384 between 1 and 3000) and 384+1>384;
select 385 as n, (385*3) as score, N'payload 00385 - kiểm thử dấu phẩy; -- Unicode' as payload where (385 between 1 and 3000) and 385+1>385;
select 386 as n, (386*3) as score, N'payload 00386 - kiểm thử dấu phẩy; -- Unicode' as payload where (386 between 1 and 3000) and 386+1>386;
select 387 as n, (387*3) as score, N'payload 00387 - kiểm thử dấu phẩy; -- Unicode' as payload where (387 between 1 and 3000) and 387+1>387;
select 388 as n, (388*3) as score, N'payload 00388 - kiểm thử dấu phẩy; -- Unicode' as payload where (388 between 1 and 3000) and 388+1>388;
select 389 as n, (389*3) as score, N'payload 00389 - kiểm thử dấu phẩy; -- Unicode' as payload where (389 between 1 and 3000) and 389+1>389;
select 390 as n, (390*3) as score, N'payload 00390 - kiểm thử dấu phẩy; -- Unicode' as payload where (390 between 1 and 3000) and 390+1>390;
select 391 as n, (391*3) as score, N'payload 00391 - kiểm thử dấu phẩy; -- Unicode' as payload where (391 between 1 and 3000) and 391+1>391;
select 392 as n, (392*3) as score, N'payload 00392 - kiểm thử dấu phẩy; -- Unicode' as payload where (392 between 1 and 3000) and 392+1>392;
select 393 as n, (393*3) as score, N'payload 00393 - kiểm thử dấu phẩy; -- Unicode' as payload where (393 between 1 and 3000) and 393+1>393;
select 394 as n, (394*3) as score, N'payload 00394 - kiểm thử dấu phẩy; -- Unicode' as payload where (394 between 1 and 3000) and 394+1>394;
select 395 as n, (395*3) as score, N'payload 00395 - kiểm thử dấu phẩy; -- Unicode' as payload where (395 between 1 and 3000) and 395+1>395;
select 396 as n, (396*3) as score, N'payload 00396 - kiểm thử dấu phẩy; -- Unicode' as payload where (396 between 1 and 3000) and 396+1>396;
select 397 as n, (397*3) as score, N'payload 00397 - kiểm thử dấu phẩy; -- Unicode' as payload where (397 between 1 and 3000) and 397+1>397;
select 398 as n, (398*3) as score, N'payload 00398 - kiểm thử dấu phẩy; -- Unicode' as payload where (398 between 1 and 3000) and 398+1>398;
select 399 as n, (399*3) as score, N'payload 00399 - kiểm thử dấu phẩy; -- Unicode' as payload where (399 between 1 and 3000) and 399+1>399;
select 400 as n, (400*3) as score, N'payload 00400 - kiểm thử dấu phẩy; -- Unicode' as payload where (400 between 1 and 3000) and 400+1>400;
select 401 as n, (401*3) as score, N'payload 00401 - kiểm thử dấu phẩy; -- Unicode' as payload where (401 between 1 and 3000) and 401+1>401;
select 402 as n, (402*3) as score, N'payload 00402 - kiểm thử dấu phẩy; -- Unicode' as payload where (402 between 1 and 3000) and 402+1>402;
select 403 as n, (403*3) as score, N'payload 00403 - kiểm thử dấu phẩy; -- Unicode' as payload where (403 between 1 and 3000) and 403+1>403;
select 404 as n, (404*3) as score, N'payload 00404 - kiểm thử dấu phẩy; -- Unicode' as payload where (404 between 1 and 3000) and 404+1>404;
select 405 as n, (405*3) as score, N'payload 00405 - kiểm thử dấu phẩy; -- Unicode' as payload where (405 between 1 and 3000) and 405+1>405;
select 406 as n, (406*3) as score, N'payload 00406 - kiểm thử dấu phẩy; -- Unicode' as payload where (406 between 1 and 3000) and 406+1>406;
select 407 as n, (407*3) as score, N'payload 00407 - kiểm thử dấu phẩy; -- Unicode' as payload where (407 between 1 and 3000) and 407+1>407;
select 408 as n, (408*3) as score, N'payload 00408 - kiểm thử dấu phẩy; -- Unicode' as payload where (408 between 1 and 3000) and 408+1>408;
select 409 as n, (409*3) as score, N'payload 00409 - kiểm thử dấu phẩy; -- Unicode' as payload where (409 between 1 and 3000) and 409+1>409;
select 410 as n, (410*3) as score, N'payload 00410 - kiểm thử dấu phẩy; -- Unicode' as payload where (410 between 1 and 3000) and 410+1>410;
select 411 as n, (411*3) as score, N'payload 00411 - kiểm thử dấu phẩy; -- Unicode' as payload where (411 between 1 and 3000) and 411+1>411;
select 412 as n, (412*3) as score, N'payload 00412 - kiểm thử dấu phẩy; -- Unicode' as payload where (412 between 1 and 3000) and 412+1>412;
select 413 as n, (413*3) as score, N'payload 00413 - kiểm thử dấu phẩy; -- Unicode' as payload where (413 between 1 and 3000) and 413+1>413;
select 414 as n, (414*3) as score, N'payload 00414 - kiểm thử dấu phẩy; -- Unicode' as payload where (414 between 1 and 3000) and 414+1>414;
select 415 as n, (415*3) as score, N'payload 00415 - kiểm thử dấu phẩy; -- Unicode' as payload where (415 between 1 and 3000) and 415+1>415;
select 416 as n, (416*3) as score, N'payload 00416 - kiểm thử dấu phẩy; -- Unicode' as payload where (416 between 1 and 3000) and 416+1>416;
select 417 as n, (417*3) as score, N'payload 00417 - kiểm thử dấu phẩy; -- Unicode' as payload where (417 between 1 and 3000) and 417+1>417;
select 418 as n, (418*3) as score, N'payload 00418 - kiểm thử dấu phẩy; -- Unicode' as payload where (418 between 1 and 3000) and 418+1>418;
select 419 as n, (419*3) as score, N'payload 00419 - kiểm thử dấu phẩy; -- Unicode' as payload where (419 between 1 and 3000) and 419+1>419;
select 420 as n, (420*3) as score, N'payload 00420 - kiểm thử dấu phẩy; -- Unicode' as payload where (420 between 1 and 3000) and 420+1>420;
select 421 as n, (421*3) as score, N'payload 00421 - kiểm thử dấu phẩy; -- Unicode' as payload where (421 between 1 and 3000) and 421+1>421;
select 422 as n, (422*3) as score, N'payload 00422 - kiểm thử dấu phẩy; -- Unicode' as payload where (422 between 1 and 3000) and 422+1>422;
select 423 as n, (423*3) as score, N'payload 00423 - kiểm thử dấu phẩy; -- Unicode' as payload where (423 between 1 and 3000) and 423+1>423;
select 424 as n, (424*3) as score, N'payload 00424 - kiểm thử dấu phẩy; -- Unicode' as payload where (424 between 1 and 3000) and 424+1>424;
select 425 as n, (425*3) as score, N'payload 00425 - kiểm thử dấu phẩy; -- Unicode' as payload where (425 between 1 and 3000) and 425+1>425;
select 426 as n, (426*3) as score, N'payload 00426 - kiểm thử dấu phẩy; -- Unicode' as payload where (426 between 1 and 3000) and 426+1>426;
select 427 as n, (427*3) as score, N'payload 00427 - kiểm thử dấu phẩy; -- Unicode' as payload where (427 between 1 and 3000) and 427+1>427;
select 428 as n, (428*3) as score, N'payload 00428 - kiểm thử dấu phẩy; -- Unicode' as payload where (428 between 1 and 3000) and 428+1>428;
select 429 as n, (429*3) as score, N'payload 00429 - kiểm thử dấu phẩy; -- Unicode' as payload where (429 between 1 and 3000) and 429+1>429;
select 430 as n, (430*3) as score, N'payload 00430 - kiểm thử dấu phẩy; -- Unicode' as payload where (430 between 1 and 3000) and 430+1>430;
select 431 as n, (431*3) as score, N'payload 00431 - kiểm thử dấu phẩy; -- Unicode' as payload where (431 between 1 and 3000) and 431+1>431;
select 432 as n, (432*3) as score, N'payload 00432 - kiểm thử dấu phẩy; -- Unicode' as payload where (432 between 1 and 3000) and 432+1>432;
select 433 as n, (433*3) as score, N'payload 00433 - kiểm thử dấu phẩy; -- Unicode' as payload where (433 between 1 and 3000) and 433+1>433;
select 434 as n, (434*3) as score, N'payload 00434 - kiểm thử dấu phẩy; -- Unicode' as payload where (434 between 1 and 3000) and 434+1>434;
select 435 as n, (435*3) as score, N'payload 00435 - kiểm thử dấu phẩy; -- Unicode' as payload where (435 between 1 and 3000) and 435+1>435;
select 436 as n, (436*3) as score, N'payload 00436 - kiểm thử dấu phẩy; -- Unicode' as payload where (436 between 1 and 3000) and 436+1>436;
select 437 as n, (437*3) as score, N'payload 00437 - kiểm thử dấu phẩy; -- Unicode' as payload where (437 between 1 and 3000) and 437+1>437;
select 438 as n, (438*3) as score, N'payload 00438 - kiểm thử dấu phẩy; -- Unicode' as payload where (438 between 1 and 3000) and 438+1>438;
select 439 as n, (439*3) as score, N'payload 00439 - kiểm thử dấu phẩy; -- Unicode' as payload where (439 between 1 and 3000) and 439+1>439;
select 440 as n, (440*3) as score, N'payload 00440 - kiểm thử dấu phẩy; -- Unicode' as payload where (440 between 1 and 3000) and 440+1>440;
select 441 as n, (441*3) as score, N'payload 00441 - kiểm thử dấu phẩy; -- Unicode' as payload where (441 between 1 and 3000) and 441+1>441;
select 442 as n, (442*3) as score, N'payload 00442 - kiểm thử dấu phẩy; -- Unicode' as payload where (442 between 1 and 3000) and 442+1>442;
select 443 as n, (443*3) as score, N'payload 00443 - kiểm thử dấu phẩy; -- Unicode' as payload where (443 between 1 and 3000) and 443+1>443;
select 444 as n, (444*3) as score, N'payload 00444 - kiểm thử dấu phẩy; -- Unicode' as payload where (444 between 1 and 3000) and 444+1>444;
select 445 as n, (445*3) as score, N'payload 00445 - kiểm thử dấu phẩy; -- Unicode' as payload where (445 between 1 and 3000) and 445+1>445;
select 446 as n, (446*3) as score, N'payload 00446 - kiểm thử dấu phẩy; -- Unicode' as payload where (446 between 1 and 3000) and 446+1>446;
select 447 as n, (447*3) as score, N'payload 00447 - kiểm thử dấu phẩy; -- Unicode' as payload where (447 between 1 and 3000) and 447+1>447;
select 448 as n, (448*3) as score, N'payload 00448 - kiểm thử dấu phẩy; -- Unicode' as payload where (448 between 1 and 3000) and 448+1>448;
select 449 as n, (449*3) as score, N'payload 00449 - kiểm thử dấu phẩy; -- Unicode' as payload where (449 between 1 and 3000) and 449+1>449;
select 450 as n, (450*3) as score, N'payload 00450 - kiểm thử dấu phẩy; -- Unicode' as payload where (450 between 1 and 3000) and 450+1>450;
select 451 as n, (451*3) as score, N'payload 00451 - kiểm thử dấu phẩy; -- Unicode' as payload where (451 between 1 and 3000) and 451+1>451;
select 452 as n, (452*3) as score, N'payload 00452 - kiểm thử dấu phẩy; -- Unicode' as payload where (452 between 1 and 3000) and 452+1>452;
select 453 as n, (453*3) as score, N'payload 00453 - kiểm thử dấu phẩy; -- Unicode' as payload where (453 between 1 and 3000) and 453+1>453;
select 454 as n, (454*3) as score, N'payload 00454 - kiểm thử dấu phẩy; -- Unicode' as payload where (454 between 1 and 3000) and 454+1>454;
select 455 as n, (455*3) as score, N'payload 00455 - kiểm thử dấu phẩy; -- Unicode' as payload where (455 between 1 and 3000) and 455+1>455;
select 456 as n, (456*3) as score, N'payload 00456 - kiểm thử dấu phẩy; -- Unicode' as payload where (456 between 1 and 3000) and 456+1>456;
select 457 as n, (457*3) as score, N'payload 00457 - kiểm thử dấu phẩy; -- Unicode' as payload where (457 between 1 and 3000) and 457+1>457;
select 458 as n, (458*3) as score, N'payload 00458 - kiểm thử dấu phẩy; -- Unicode' as payload where (458 between 1 and 3000) and 458+1>458;
select 459 as n, (459*3) as score, N'payload 00459 - kiểm thử dấu phẩy; -- Unicode' as payload where (459 between 1 and 3000) and 459+1>459;
select 460 as n, (460*3) as score, N'payload 00460 - kiểm thử dấu phẩy; -- Unicode' as payload where (460 between 1 and 3000) and 460+1>460;
select 461 as n, (461*3) as score, N'payload 00461 - kiểm thử dấu phẩy; -- Unicode' as payload where (461 between 1 and 3000) and 461+1>461;
select 462 as n, (462*3) as score, N'payload 00462 - kiểm thử dấu phẩy; -- Unicode' as payload where (462 between 1 and 3000) and 462+1>462;
select 463 as n, (463*3) as score, N'payload 00463 - kiểm thử dấu phẩy; -- Unicode' as payload where (463 between 1 and 3000) and 463+1>463;
select 464 as n, (464*3) as score, N'payload 00464 - kiểm thử dấu phẩy; -- Unicode' as payload where (464 between 1 and 3000) and 464+1>464;
select 465 as n, (465*3) as score, N'payload 00465 - kiểm thử dấu phẩy; -- Unicode' as payload where (465 between 1 and 3000) and 465+1>465;
select 466 as n, (466*3) as score, N'payload 00466 - kiểm thử dấu phẩy; -- Unicode' as payload where (466 between 1 and 3000) and 466+1>466;
select 467 as n, (467*3) as score, N'payload 00467 - kiểm thử dấu phẩy; -- Unicode' as payload where (467 between 1 and 3000) and 467+1>467;
select 468 as n, (468*3) as score, N'payload 00468 - kiểm thử dấu phẩy; -- Unicode' as payload where (468 between 1 and 3000) and 468+1>468;
select 469 as n, (469*3) as score, N'payload 00469 - kiểm thử dấu phẩy; -- Unicode' as payload where (469 between 1 and 3000) and 469+1>469;
select 470 as n, (470*3) as score, N'payload 00470 - kiểm thử dấu phẩy; -- Unicode' as payload where (470 between 1 and 3000) and 470+1>470;
select 471 as n, (471*3) as score, N'payload 00471 - kiểm thử dấu phẩy; -- Unicode' as payload where (471 between 1 and 3000) and 471+1>471;
select 472 as n, (472*3) as score, N'payload 00472 - kiểm thử dấu phẩy; -- Unicode' as payload where (472 between 1 and 3000) and 472+1>472;
select 473 as n, (473*3) as score, N'payload 00473 - kiểm thử dấu phẩy; -- Unicode' as payload where (473 between 1 and 3000) and 473+1>473;
select 474 as n, (474*3) as score, N'payload 00474 - kiểm thử dấu phẩy; -- Unicode' as payload where (474 between 1 and 3000) and 474+1>474;
select 475 as n, (475*3) as score, N'payload 00475 - kiểm thử dấu phẩy; -- Unicode' as payload where (475 between 1 and 3000) and 475+1>475;
select 476 as n, (476*3) as score, N'payload 00476 - kiểm thử dấu phẩy; -- Unicode' as payload where (476 between 1 and 3000) and 476+1>476;
select 477 as n, (477*3) as score, N'payload 00477 - kiểm thử dấu phẩy; -- Unicode' as payload where (477 between 1 and 3000) and 477+1>477;
select 478 as n, (478*3) as score, N'payload 00478 - kiểm thử dấu phẩy; -- Unicode' as payload where (478 between 1 and 3000) and 478+1>478;
select 479 as n, (479*3) as score, N'payload 00479 - kiểm thử dấu phẩy; -- Unicode' as payload where (479 between 1 and 3000) and 479+1>479;
select 480 as n, (480*3) as score, N'payload 00480 - kiểm thử dấu phẩy; -- Unicode' as payload where (480 between 1 and 3000) and 480+1>480;
select 481 as n, (481*3) as score, N'payload 00481 - kiểm thử dấu phẩy; -- Unicode' as payload where (481 between 1 and 3000) and 481+1>481;
select 482 as n, (482*3) as score, N'payload 00482 - kiểm thử dấu phẩy; -- Unicode' as payload where (482 between 1 and 3000) and 482+1>482;
select 483 as n, (483*3) as score, N'payload 00483 - kiểm thử dấu phẩy; -- Unicode' as payload where (483 between 1 and 3000) and 483+1>483;
select 484 as n, (484*3) as score, N'payload 00484 - kiểm thử dấu phẩy; -- Unicode' as payload where (484 between 1 and 3000) and 484+1>484;
select 485 as n, (485*3) as score, N'payload 00485 - kiểm thử dấu phẩy; -- Unicode' as payload where (485 between 1 and 3000) and 485+1>485;
select 486 as n, (486*3) as score, N'payload 00486 - kiểm thử dấu phẩy; -- Unicode' as payload where (486 between 1 and 3000) and 486+1>486;
select 487 as n, (487*3) as score, N'payload 00487 - kiểm thử dấu phẩy; -- Unicode' as payload where (487 between 1 and 3000) and 487+1>487;
select 488 as n, (488*3) as score, N'payload 00488 - kiểm thử dấu phẩy; -- Unicode' as payload where (488 between 1 and 3000) and 488+1>488;
select 489 as n, (489*3) as score, N'payload 00489 - kiểm thử dấu phẩy; -- Unicode' as payload where (489 between 1 and 3000) and 489+1>489;
select 490 as n, (490*3) as score, N'payload 00490 - kiểm thử dấu phẩy; -- Unicode' as payload where (490 between 1 and 3000) and 490+1>490;
select 491 as n, (491*3) as score, N'payload 00491 - kiểm thử dấu phẩy; -- Unicode' as payload where (491 between 1 and 3000) and 491+1>491;
select 492 as n, (492*3) as score, N'payload 00492 - kiểm thử dấu phẩy; -- Unicode' as payload where (492 between 1 and 3000) and 492+1>492;
select 493 as n, (493*3) as score, N'payload 00493 - kiểm thử dấu phẩy; -- Unicode' as payload where (493 between 1 and 3000) and 493+1>493;
select 494 as n, (494*3) as score, N'payload 00494 - kiểm thử dấu phẩy; -- Unicode' as payload where (494 between 1 and 3000) and 494+1>494;
select 495 as n, (495*3) as score, N'payload 00495 - kiểm thử dấu phẩy; -- Unicode' as payload where (495 between 1 and 3000) and 495+1>495;
select 496 as n, (496*3) as score, N'payload 00496 - kiểm thử dấu phẩy; -- Unicode' as payload where (496 between 1 and 3000) and 496+1>496;
select 497 as n, (497*3) as score, N'payload 00497 - kiểm thử dấu phẩy; -- Unicode' as payload where (497 between 1 and 3000) and 497+1>497;
select 498 as n, (498*3) as score, N'payload 00498 - kiểm thử dấu phẩy; -- Unicode' as payload where (498 between 1 and 3000) and 498+1>498;
select 499 as n, (499*3) as score, N'payload 00499 - kiểm thử dấu phẩy; -- Unicode' as payload where (499 between 1 and 3000) and 499+1>499;
select 500 as n, (500*3) as score, N'payload 00500 - kiểm thử dấu phẩy; -- Unicode' as payload where (500 between 1 and 3000) and 500+1>500;
select 501 as n, (501*3) as score, N'payload 00501 - kiểm thử dấu phẩy; -- Unicode' as payload where (501 between 1 and 3000) and 501+1>501;
select 502 as n, (502*3) as score, N'payload 00502 - kiểm thử dấu phẩy; -- Unicode' as payload where (502 between 1 and 3000) and 502+1>502;
select 503 as n, (503*3) as score, N'payload 00503 - kiểm thử dấu phẩy; -- Unicode' as payload where (503 between 1 and 3000) and 503+1>503;
select 504 as n, (504*3) as score, N'payload 00504 - kiểm thử dấu phẩy; -- Unicode' as payload where (504 between 1 and 3000) and 504+1>504;
select 505 as n, (505*3) as score, N'payload 00505 - kiểm thử dấu phẩy; -- Unicode' as payload where (505 between 1 and 3000) and 505+1>505;
select 506 as n, (506*3) as score, N'payload 00506 - kiểm thử dấu phẩy; -- Unicode' as payload where (506 between 1 and 3000) and 506+1>506;
select 507 as n, (507*3) as score, N'payload 00507 - kiểm thử dấu phẩy; -- Unicode' as payload where (507 between 1 and 3000) and 507+1>507;
select 508 as n, (508*3) as score, N'payload 00508 - kiểm thử dấu phẩy; -- Unicode' as payload where (508 between 1 and 3000) and 508+1>508;
select 509 as n, (509*3) as score, N'payload 00509 - kiểm thử dấu phẩy; -- Unicode' as payload where (509 between 1 and 3000) and 509+1>509;
select 510 as n, (510*3) as score, N'payload 00510 - kiểm thử dấu phẩy; -- Unicode' as payload where (510 between 1 and 3000) and 510+1>510;
select 511 as n, (511*3) as score, N'payload 00511 - kiểm thử dấu phẩy; -- Unicode' as payload where (511 between 1 and 3000) and 511+1>511;
select 512 as n, (512*3) as score, N'payload 00512 - kiểm thử dấu phẩy; -- Unicode' as payload where (512 between 1 and 3000) and 512+1>512;
select 513 as n, (513*3) as score, N'payload 00513 - kiểm thử dấu phẩy; -- Unicode' as payload where (513 between 1 and 3000) and 513+1>513;
select 514 as n, (514*3) as score, N'payload 00514 - kiểm thử dấu phẩy; -- Unicode' as payload where (514 between 1 and 3000) and 514+1>514;
select 515 as n, (515*3) as score, N'payload 00515 - kiểm thử dấu phẩy; -- Unicode' as payload where (515 between 1 and 3000) and 515+1>515;
select 516 as n, (516*3) as score, N'payload 00516 - kiểm thử dấu phẩy; -- Unicode' as payload where (516 between 1 and 3000) and 516+1>516;
select 517 as n, (517*3) as score, N'payload 00517 - kiểm thử dấu phẩy; -- Unicode' as payload where (517 between 1 and 3000) and 517+1>517;
select 518 as n, (518*3) as score, N'payload 00518 - kiểm thử dấu phẩy; -- Unicode' as payload where (518 between 1 and 3000) and 518+1>518;
select 519 as n, (519*3) as score, N'payload 00519 - kiểm thử dấu phẩy; -- Unicode' as payload where (519 between 1 and 3000) and 519+1>519;
select 520 as n, (520*3) as score, N'payload 00520 - kiểm thử dấu phẩy; -- Unicode' as payload where (520 between 1 and 3000) and 520+1>520;
select 521 as n, (521*3) as score, N'payload 00521 - kiểm thử dấu phẩy; -- Unicode' as payload where (521 between 1 and 3000) and 521+1>521;
select 522 as n, (522*3) as score, N'payload 00522 - kiểm thử dấu phẩy; -- Unicode' as payload where (522 between 1 and 3000) and 522+1>522;
select 523 as n, (523*3) as score, N'payload 00523 - kiểm thử dấu phẩy; -- Unicode' as payload where (523 between 1 and 3000) and 523+1>523;
select 524 as n, (524*3) as score, N'payload 00524 - kiểm thử dấu phẩy; -- Unicode' as payload where (524 between 1 and 3000) and 524+1>524;
select 525 as n, (525*3) as score, N'payload 00525 - kiểm thử dấu phẩy; -- Unicode' as payload where (525 between 1 and 3000) and 525+1>525;
select 526 as n, (526*3) as score, N'payload 00526 - kiểm thử dấu phẩy; -- Unicode' as payload where (526 between 1 and 3000) and 526+1>526;
select 527 as n, (527*3) as score, N'payload 00527 - kiểm thử dấu phẩy; -- Unicode' as payload where (527 between 1 and 3000) and 527+1>527;
select 528 as n, (528*3) as score, N'payload 00528 - kiểm thử dấu phẩy; -- Unicode' as payload where (528 between 1 and 3000) and 528+1>528;
select 529 as n, (529*3) as score, N'payload 00529 - kiểm thử dấu phẩy; -- Unicode' as payload where (529 between 1 and 3000) and 529+1>529;
select 530 as n, (530*3) as score, N'payload 00530 - kiểm thử dấu phẩy; -- Unicode' as payload where (530 between 1 and 3000) and 530+1>530;
select 531 as n, (531*3) as score, N'payload 00531 - kiểm thử dấu phẩy; -- Unicode' as payload where (531 between 1 and 3000) and 531+1>531;
select 532 as n, (532*3) as score, N'payload 00532 - kiểm thử dấu phẩy; -- Unicode' as payload where (532 between 1 and 3000) and 532+1>532;
select 533 as n, (533*3) as score, N'payload 00533 - kiểm thử dấu phẩy; -- Unicode' as payload where (533 between 1 and 3000) and 533+1>533;
select 534 as n, (534*3) as score, N'payload 00534 - kiểm thử dấu phẩy; -- Unicode' as payload where (534 between 1 and 3000) and 534+1>534;
select 535 as n, (535*3) as score, N'payload 00535 - kiểm thử dấu phẩy; -- Unicode' as payload where (535 between 1 and 3000) and 535+1>535;
select 536 as n, (536*3) as score, N'payload 00536 - kiểm thử dấu phẩy; -- Unicode' as payload where (536 between 1 and 3000) and 536+1>536;
select 537 as n, (537*3) as score, N'payload 00537 - kiểm thử dấu phẩy; -- Unicode' as payload where (537 between 1 and 3000) and 537+1>537;
select 538 as n, (538*3) as score, N'payload 00538 - kiểm thử dấu phẩy; -- Unicode' as payload where (538 between 1 and 3000) and 538+1>538;
select 539 as n, (539*3) as score, N'payload 00539 - kiểm thử dấu phẩy; -- Unicode' as payload where (539 between 1 and 3000) and 539+1>539;
select 540 as n, (540*3) as score, N'payload 00540 - kiểm thử dấu phẩy; -- Unicode' as payload where (540 between 1 and 3000) and 540+1>540;
select 541 as n, (541*3) as score, N'payload 00541 - kiểm thử dấu phẩy; -- Unicode' as payload where (541 between 1 and 3000) and 541+1>541;
select 542 as n, (542*3) as score, N'payload 00542 - kiểm thử dấu phẩy; -- Unicode' as payload where (542 between 1 and 3000) and 542+1>542;
select 543 as n, (543*3) as score, N'payload 00543 - kiểm thử dấu phẩy; -- Unicode' as payload where (543 between 1 and 3000) and 543+1>543;
select 544 as n, (544*3) as score, N'payload 00544 - kiểm thử dấu phẩy; -- Unicode' as payload where (544 between 1 and 3000) and 544+1>544;
select 545 as n, (545*3) as score, N'payload 00545 - kiểm thử dấu phẩy; -- Unicode' as payload where (545 between 1 and 3000) and 545+1>545;
select 546 as n, (546*3) as score, N'payload 00546 - kiểm thử dấu phẩy; -- Unicode' as payload where (546 between 1 and 3000) and 546+1>546;
select 547 as n, (547*3) as score, N'payload 00547 - kiểm thử dấu phẩy; -- Unicode' as payload where (547 between 1 and 3000) and 547+1>547;
select 548 as n, (548*3) as score, N'payload 00548 - kiểm thử dấu phẩy; -- Unicode' as payload where (548 between 1 and 3000) and 548+1>548;
select 549 as n, (549*3) as score, N'payload 00549 - kiểm thử dấu phẩy; -- Unicode' as payload where (549 between 1 and 3000) and 549+1>549;
select 550 as n, (550*3) as score, N'payload 00550 - kiểm thử dấu phẩy; -- Unicode' as payload where (550 between 1 and 3000) and 550+1>550;
select 551 as n, (551*3) as score, N'payload 00551 - kiểm thử dấu phẩy; -- Unicode' as payload where (551 between 1 and 3000) and 551+1>551;
select 552 as n, (552*3) as score, N'payload 00552 - kiểm thử dấu phẩy; -- Unicode' as payload where (552 between 1 and 3000) and 552+1>552;
select 553 as n, (553*3) as score, N'payload 00553 - kiểm thử dấu phẩy; -- Unicode' as payload where (553 between 1 and 3000) and 553+1>553;
select 554 as n, (554*3) as score, N'payload 00554 - kiểm thử dấu phẩy; -- Unicode' as payload where (554 between 1 and 3000) and 554+1>554;
select 555 as n, (555*3) as score, N'payload 00555 - kiểm thử dấu phẩy; -- Unicode' as payload where (555 between 1 and 3000) and 555+1>555;
select 556 as n, (556*3) as score, N'payload 00556 - kiểm thử dấu phẩy; -- Unicode' as payload where (556 between 1 and 3000) and 556+1>556;
select 557 as n, (557*3) as score, N'payload 00557 - kiểm thử dấu phẩy; -- Unicode' as payload where (557 between 1 and 3000) and 557+1>557;
select 558 as n, (558*3) as score, N'payload 00558 - kiểm thử dấu phẩy; -- Unicode' as payload where (558 between 1 and 3000) and 558+1>558;
select 559 as n, (559*3) as score, N'payload 00559 - kiểm thử dấu phẩy; -- Unicode' as payload where (559 between 1 and 3000) and 559+1>559;
select 560 as n, (560*3) as score, N'payload 00560 - kiểm thử dấu phẩy; -- Unicode' as payload where (560 between 1 and 3000) and 560+1>560;
select 561 as n, (561*3) as score, N'payload 00561 - kiểm thử dấu phẩy; -- Unicode' as payload where (561 between 1 and 3000) and 561+1>561;
select 562 as n, (562*3) as score, N'payload 00562 - kiểm thử dấu phẩy; -- Unicode' as payload where (562 between 1 and 3000) and 562+1>562;
select 563 as n, (563*3) as score, N'payload 00563 - kiểm thử dấu phẩy; -- Unicode' as payload where (563 between 1 and 3000) and 563+1>563;
select 564 as n, (564*3) as score, N'payload 00564 - kiểm thử dấu phẩy; -- Unicode' as payload where (564 between 1 and 3000) and 564+1>564;
select 565 as n, (565*3) as score, N'payload 00565 - kiểm thử dấu phẩy; -- Unicode' as payload where (565 between 1 and 3000) and 565+1>565;
select 566 as n, (566*3) as score, N'payload 00566 - kiểm thử dấu phẩy; -- Unicode' as payload where (566 between 1 and 3000) and 566+1>566;
select 567 as n, (567*3) as score, N'payload 00567 - kiểm thử dấu phẩy; -- Unicode' as payload where (567 between 1 and 3000) and 567+1>567;
select 568 as n, (568*3) as score, N'payload 00568 - kiểm thử dấu phẩy; -- Unicode' as payload where (568 between 1 and 3000) and 568+1>568;
select 569 as n, (569*3) as score, N'payload 00569 - kiểm thử dấu phẩy; -- Unicode' as payload where (569 between 1 and 3000) and 569+1>569;
select 570 as n, (570*3) as score, N'payload 00570 - kiểm thử dấu phẩy; -- Unicode' as payload where (570 between 1 and 3000) and 570+1>570;
select 571 as n, (571*3) as score, N'payload 00571 - kiểm thử dấu phẩy; -- Unicode' as payload where (571 between 1 and 3000) and 571+1>571;
select 572 as n, (572*3) as score, N'payload 00572 - kiểm thử dấu phẩy; -- Unicode' as payload where (572 between 1 and 3000) and 572+1>572;
select 573 as n, (573*3) as score, N'payload 00573 - kiểm thử dấu phẩy; -- Unicode' as payload where (573 between 1 and 3000) and 573+1>573;
select 574 as n, (574*3) as score, N'payload 00574 - kiểm thử dấu phẩy; -- Unicode' as payload where (574 between 1 and 3000) and 574+1>574;
select 575 as n, (575*3) as score, N'payload 00575 - kiểm thử dấu phẩy; -- Unicode' as payload where (575 between 1 and 3000) and 575+1>575;
select 576 as n, (576*3) as score, N'payload 00576 - kiểm thử dấu phẩy; -- Unicode' as payload where (576 between 1 and 3000) and 576+1>576;
select 577 as n, (577*3) as score, N'payload 00577 - kiểm thử dấu phẩy; -- Unicode' as payload where (577 between 1 and 3000) and 577+1>577;
select 578 as n, (578*3) as score, N'payload 00578 - kiểm thử dấu phẩy; -- Unicode' as payload where (578 between 1 and 3000) and 578+1>578;
select 579 as n, (579*3) as score, N'payload 00579 - kiểm thử dấu phẩy; -- Unicode' as payload where (579 between 1 and 3000) and 579+1>579;
select 580 as n, (580*3) as score, N'payload 00580 - kiểm thử dấu phẩy; -- Unicode' as payload where (580 between 1 and 3000) and 580+1>580;
select 581 as n, (581*3) as score, N'payload 00581 - kiểm thử dấu phẩy; -- Unicode' as payload where (581 between 1 and 3000) and 581+1>581;
select 582 as n, (582*3) as score, N'payload 00582 - kiểm thử dấu phẩy; -- Unicode' as payload where (582 between 1 and 3000) and 582+1>582;
select 583 as n, (583*3) as score, N'payload 00583 - kiểm thử dấu phẩy; -- Unicode' as payload where (583 between 1 and 3000) and 583+1>583;
select 584 as n, (584*3) as score, N'payload 00584 - kiểm thử dấu phẩy; -- Unicode' as payload where (584 between 1 and 3000) and 584+1>584;
select 585 as n, (585*3) as score, N'payload 00585 - kiểm thử dấu phẩy; -- Unicode' as payload where (585 between 1 and 3000) and 585+1>585;
select 586 as n, (586*3) as score, N'payload 00586 - kiểm thử dấu phẩy; -- Unicode' as payload where (586 between 1 and 3000) and 586+1>586;
select 587 as n, (587*3) as score, N'payload 00587 - kiểm thử dấu phẩy; -- Unicode' as payload where (587 between 1 and 3000) and 587+1>587;
select 588 as n, (588*3) as score, N'payload 00588 - kiểm thử dấu phẩy; -- Unicode' as payload where (588 between 1 and 3000) and 588+1>588;
select 589 as n, (589*3) as score, N'payload 00589 - kiểm thử dấu phẩy; -- Unicode' as payload where (589 between 1 and 3000) and 589+1>589;
select 590 as n, (590*3) as score, N'payload 00590 - kiểm thử dấu phẩy; -- Unicode' as payload where (590 between 1 and 3000) and 590+1>590;
select 591 as n, (591*3) as score, N'payload 00591 - kiểm thử dấu phẩy; -- Unicode' as payload where (591 between 1 and 3000) and 591+1>591;
select 592 as n, (592*3) as score, N'payload 00592 - kiểm thử dấu phẩy; -- Unicode' as payload where (592 between 1 and 3000) and 592+1>592;
select 593 as n, (593*3) as score, N'payload 00593 - kiểm thử dấu phẩy; -- Unicode' as payload where (593 between 1 and 3000) and 593+1>593;
select 594 as n, (594*3) as score, N'payload 00594 - kiểm thử dấu phẩy; -- Unicode' as payload where (594 between 1 and 3000) and 594+1>594;
select 595 as n, (595*3) as score, N'payload 00595 - kiểm thử dấu phẩy; -- Unicode' as payload where (595 between 1 and 3000) and 595+1>595;
select 596 as n, (596*3) as score, N'payload 00596 - kiểm thử dấu phẩy; -- Unicode' as payload where (596 between 1 and 3000) and 596+1>596;
select 597 as n, (597*3) as score, N'payload 00597 - kiểm thử dấu phẩy; -- Unicode' as payload where (597 between 1 and 3000) and 597+1>597;
select 598 as n, (598*3) as score, N'payload 00598 - kiểm thử dấu phẩy; -- Unicode' as payload where (598 between 1 and 3000) and 598+1>598;
select 599 as n, (599*3) as score, N'payload 00599 - kiểm thử dấu phẩy; -- Unicode' as payload where (599 between 1 and 3000) and 599+1>599;
select 600 as n, (600*3) as score, N'payload 00600 - kiểm thử dấu phẩy; -- Unicode' as payload where (600 between 1 and 3000) and 600+1>600;
select 601 as n, (601*3) as score, N'payload 00601 - kiểm thử dấu phẩy; -- Unicode' as payload where (601 between 1 and 3000) and 601+1>601;
select 602 as n, (602*3) as score, N'payload 00602 - kiểm thử dấu phẩy; -- Unicode' as payload where (602 between 1 and 3000) and 602+1>602;
select 603 as n, (603*3) as score, N'payload 00603 - kiểm thử dấu phẩy; -- Unicode' as payload where (603 between 1 and 3000) and 603+1>603;
select 604 as n, (604*3) as score, N'payload 00604 - kiểm thử dấu phẩy; -- Unicode' as payload where (604 between 1 and 3000) and 604+1>604;
select 605 as n, (605*3) as score, N'payload 00605 - kiểm thử dấu phẩy; -- Unicode' as payload where (605 between 1 and 3000) and 605+1>605;
select 606 as n, (606*3) as score, N'payload 00606 - kiểm thử dấu phẩy; -- Unicode' as payload where (606 between 1 and 3000) and 606+1>606;
select 607 as n, (607*3) as score, N'payload 00607 - kiểm thử dấu phẩy; -- Unicode' as payload where (607 between 1 and 3000) and 607+1>607;
select 608 as n, (608*3) as score, N'payload 00608 - kiểm thử dấu phẩy; -- Unicode' as payload where (608 between 1 and 3000) and 608+1>608;
select 609 as n, (609*3) as score, N'payload 00609 - kiểm thử dấu phẩy; -- Unicode' as payload where (609 between 1 and 3000) and 609+1>609;
select 610 as n, (610*3) as score, N'payload 00610 - kiểm thử dấu phẩy; -- Unicode' as payload where (610 between 1 and 3000) and 610+1>610;
select 611 as n, (611*3) as score, N'payload 00611 - kiểm thử dấu phẩy; -- Unicode' as payload where (611 between 1 and 3000) and 611+1>611;
select 612 as n, (612*3) as score, N'payload 00612 - kiểm thử dấu phẩy; -- Unicode' as payload where (612 between 1 and 3000) and 612+1>612;
select 613 as n, (613*3) as score, N'payload 00613 - kiểm thử dấu phẩy; -- Unicode' as payload where (613 between 1 and 3000) and 613+1>613;
select 614 as n, (614*3) as score, N'payload 00614 - kiểm thử dấu phẩy; -- Unicode' as payload where (614 between 1 and 3000) and 614+1>614;
select 615 as n, (615*3) as score, N'payload 00615 - kiểm thử dấu phẩy; -- Unicode' as payload where (615 between 1 and 3000) and 615+1>615;
select 616 as n, (616*3) as score, N'payload 00616 - kiểm thử dấu phẩy; -- Unicode' as payload where (616 between 1 and 3000) and 616+1>616;
select 617 as n, (617*3) as score, N'payload 00617 - kiểm thử dấu phẩy; -- Unicode' as payload where (617 between 1 and 3000) and 617+1>617;
select 618 as n, (618*3) as score, N'payload 00618 - kiểm thử dấu phẩy; -- Unicode' as payload where (618 between 1 and 3000) and 618+1>618;
select 619 as n, (619*3) as score, N'payload 00619 - kiểm thử dấu phẩy; -- Unicode' as payload where (619 between 1 and 3000) and 619+1>619;
select 620 as n, (620*3) as score, N'payload 00620 - kiểm thử dấu phẩy; -- Unicode' as payload where (620 between 1 and 3000) and 620+1>620;
select 621 as n, (621*3) as score, N'payload 00621 - kiểm thử dấu phẩy; -- Unicode' as payload where (621 between 1 and 3000) and 621+1>621;
select 622 as n, (622*3) as score, N'payload 00622 - kiểm thử dấu phẩy; -- Unicode' as payload where (622 between 1 and 3000) and 622+1>622;
select 623 as n, (623*3) as score, N'payload 00623 - kiểm thử dấu phẩy; -- Unicode' as payload where (623 between 1 and 3000) and 623+1>623;
select 624 as n, (624*3) as score, N'payload 00624 - kiểm thử dấu phẩy; -- Unicode' as payload where (624 between 1 and 3000) and 624+1>624;
select 625 as n, (625*3) as score, N'payload 00625 - kiểm thử dấu phẩy; -- Unicode' as payload where (625 between 1 and 3000) and 625+1>625;
select 626 as n, (626*3) as score, N'payload 00626 - kiểm thử dấu phẩy; -- Unicode' as payload where (626 between 1 and 3000) and 626+1>626;
select 627 as n, (627*3) as score, N'payload 00627 - kiểm thử dấu phẩy; -- Unicode' as payload where (627 between 1 and 3000) and 627+1>627;
select 628 as n, (628*3) as score, N'payload 00628 - kiểm thử dấu phẩy; -- Unicode' as payload where (628 between 1 and 3000) and 628+1>628;
select 629 as n, (629*3) as score, N'payload 00629 - kiểm thử dấu phẩy; -- Unicode' as payload where (629 between 1 and 3000) and 629+1>629;
select 630 as n, (630*3) as score, N'payload 00630 - kiểm thử dấu phẩy; -- Unicode' as payload where (630 between 1 and 3000) and 630+1>630;
select 631 as n, (631*3) as score, N'payload 00631 - kiểm thử dấu phẩy; -- Unicode' as payload where (631 between 1 and 3000) and 631+1>631;
select 632 as n, (632*3) as score, N'payload 00632 - kiểm thử dấu phẩy; -- Unicode' as payload where (632 between 1 and 3000) and 632+1>632;
select 633 as n, (633*3) as score, N'payload 00633 - kiểm thử dấu phẩy; -- Unicode' as payload where (633 between 1 and 3000) and 633+1>633;
select 634 as n, (634*3) as score, N'payload 00634 - kiểm thử dấu phẩy; -- Unicode' as payload where (634 between 1 and 3000) and 634+1>634;
select 635 as n, (635*3) as score, N'payload 00635 - kiểm thử dấu phẩy; -- Unicode' as payload where (635 between 1 and 3000) and 635+1>635;
select 636 as n, (636*3) as score, N'payload 00636 - kiểm thử dấu phẩy; -- Unicode' as payload where (636 between 1 and 3000) and 636+1>636;
select 637 as n, (637*3) as score, N'payload 00637 - kiểm thử dấu phẩy; -- Unicode' as payload where (637 between 1 and 3000) and 637+1>637;
select 638 as n, (638*3) as score, N'payload 00638 - kiểm thử dấu phẩy; -- Unicode' as payload where (638 between 1 and 3000) and 638+1>638;
select 639 as n, (639*3) as score, N'payload 00639 - kiểm thử dấu phẩy; -- Unicode' as payload where (639 between 1 and 3000) and 639+1>639;
select 640 as n, (640*3) as score, N'payload 00640 - kiểm thử dấu phẩy; -- Unicode' as payload where (640 between 1 and 3000) and 640+1>640;
select 641 as n, (641*3) as score, N'payload 00641 - kiểm thử dấu phẩy; -- Unicode' as payload where (641 between 1 and 3000) and 641+1>641;
select 642 as n, (642*3) as score, N'payload 00642 - kiểm thử dấu phẩy; -- Unicode' as payload where (642 between 1 and 3000) and 642+1>642;
select 643 as n, (643*3) as score, N'payload 00643 - kiểm thử dấu phẩy; -- Unicode' as payload where (643 between 1 and 3000) and 643+1>643;
select 644 as n, (644*3) as score, N'payload 00644 - kiểm thử dấu phẩy; -- Unicode' as payload where (644 between 1 and 3000) and 644+1>644;
select 645 as n, (645*3) as score, N'payload 00645 - kiểm thử dấu phẩy; -- Unicode' as payload where (645 between 1 and 3000) and 645+1>645;
select 646 as n, (646*3) as score, N'payload 00646 - kiểm thử dấu phẩy; -- Unicode' as payload where (646 between 1 and 3000) and 646+1>646;
select 647 as n, (647*3) as score, N'payload 00647 - kiểm thử dấu phẩy; -- Unicode' as payload where (647 between 1 and 3000) and 647+1>647;
select 648 as n, (648*3) as score, N'payload 00648 - kiểm thử dấu phẩy; -- Unicode' as payload where (648 between 1 and 3000) and 648+1>648;
select 649 as n, (649*3) as score, N'payload 00649 - kiểm thử dấu phẩy; -- Unicode' as payload where (649 between 1 and 3000) and 649+1>649;
select 650 as n, (650*3) as score, N'payload 00650 - kiểm thử dấu phẩy; -- Unicode' as payload where (650 between 1 and 3000) and 650+1>650;
select 651 as n, (651*3) as score, N'payload 00651 - kiểm thử dấu phẩy; -- Unicode' as payload where (651 between 1 and 3000) and 651+1>651;
select 652 as n, (652*3) as score, N'payload 00652 - kiểm thử dấu phẩy; -- Unicode' as payload where (652 between 1 and 3000) and 652+1>652;
select 653 as n, (653*3) as score, N'payload 00653 - kiểm thử dấu phẩy; -- Unicode' as payload where (653 between 1 and 3000) and 653+1>653;
select 654 as n, (654*3) as score, N'payload 00654 - kiểm thử dấu phẩy; -- Unicode' as payload where (654 between 1 and 3000) and 654+1>654;
select 655 as n, (655*3) as score, N'payload 00655 - kiểm thử dấu phẩy; -- Unicode' as payload where (655 between 1 and 3000) and 655+1>655;
select 656 as n, (656*3) as score, N'payload 00656 - kiểm thử dấu phẩy; -- Unicode' as payload where (656 between 1 and 3000) and 656+1>656;
select 657 as n, (657*3) as score, N'payload 00657 - kiểm thử dấu phẩy; -- Unicode' as payload where (657 between 1 and 3000) and 657+1>657;
select 658 as n, (658*3) as score, N'payload 00658 - kiểm thử dấu phẩy; -- Unicode' as payload where (658 between 1 and 3000) and 658+1>658;
select 659 as n, (659*3) as score, N'payload 00659 - kiểm thử dấu phẩy; -- Unicode' as payload where (659 between 1 and 3000) and 659+1>659;
select 660 as n, (660*3) as score, N'payload 00660 - kiểm thử dấu phẩy; -- Unicode' as payload where (660 between 1 and 3000) and 660+1>660;
select 661 as n, (661*3) as score, N'payload 00661 - kiểm thử dấu phẩy; -- Unicode' as payload where (661 between 1 and 3000) and 661+1>661;
select 662 as n, (662*3) as score, N'payload 00662 - kiểm thử dấu phẩy; -- Unicode' as payload where (662 between 1 and 3000) and 662+1>662;
select 663 as n, (663*3) as score, N'payload 00663 - kiểm thử dấu phẩy; -- Unicode' as payload where (663 between 1 and 3000) and 663+1>663;
select 664 as n, (664*3) as score, N'payload 00664 - kiểm thử dấu phẩy; -- Unicode' as payload where (664 between 1 and 3000) and 664+1>664;
select 665 as n, (665*3) as score, N'payload 00665 - kiểm thử dấu phẩy; -- Unicode' as payload where (665 between 1 and 3000) and 665+1>665;
select 666 as n, (666*3) as score, N'payload 00666 - kiểm thử dấu phẩy; -- Unicode' as payload where (666 between 1 and 3000) and 666+1>666;
select 667 as n, (667*3) as score, N'payload 00667 - kiểm thử dấu phẩy; -- Unicode' as payload where (667 between 1 and 3000) and 667+1>667;
select 668 as n, (668*3) as score, N'payload 00668 - kiểm thử dấu phẩy; -- Unicode' as payload where (668 between 1 and 3000) and 668+1>668;
select 669 as n, (669*3) as score, N'payload 00669 - kiểm thử dấu phẩy; -- Unicode' as payload where (669 between 1 and 3000) and 669+1>669;
select 670 as n, (670*3) as score, N'payload 00670 - kiểm thử dấu phẩy; -- Unicode' as payload where (670 between 1 and 3000) and 670+1>670;
select 671 as n, (671*3) as score, N'payload 00671 - kiểm thử dấu phẩy; -- Unicode' as payload where (671 between 1 and 3000) and 671+1>671;
select 672 as n, (672*3) as score, N'payload 00672 - kiểm thử dấu phẩy; -- Unicode' as payload where (672 between 1 and 3000) and 672+1>672;
select 673 as n, (673*3) as score, N'payload 00673 - kiểm thử dấu phẩy; -- Unicode' as payload where (673 between 1 and 3000) and 673+1>673;
select 674 as n, (674*3) as score, N'payload 00674 - kiểm thử dấu phẩy; -- Unicode' as payload where (674 between 1 and 3000) and 674+1>674;
select 675 as n, (675*3) as score, N'payload 00675 - kiểm thử dấu phẩy; -- Unicode' as payload where (675 between 1 and 3000) and 675+1>675;
select 676 as n, (676*3) as score, N'payload 00676 - kiểm thử dấu phẩy; -- Unicode' as payload where (676 between 1 and 3000) and 676+1>676;
select 677 as n, (677*3) as score, N'payload 00677 - kiểm thử dấu phẩy; -- Unicode' as payload where (677 between 1 and 3000) and 677+1>677;
select 678 as n, (678*3) as score, N'payload 00678 - kiểm thử dấu phẩy; -- Unicode' as payload where (678 between 1 and 3000) and 678+1>678;
select 679 as n, (679*3) as score, N'payload 00679 - kiểm thử dấu phẩy; -- Unicode' as payload where (679 between 1 and 3000) and 679+1>679;
select 680 as n, (680*3) as score, N'payload 00680 - kiểm thử dấu phẩy; -- Unicode' as payload where (680 between 1 and 3000) and 680+1>680;
select 681 as n, (681*3) as score, N'payload 00681 - kiểm thử dấu phẩy; -- Unicode' as payload where (681 between 1 and 3000) and 681+1>681;
select 682 as n, (682*3) as score, N'payload 00682 - kiểm thử dấu phẩy; -- Unicode' as payload where (682 between 1 and 3000) and 682+1>682;
select 683 as n, (683*3) as score, N'payload 00683 - kiểm thử dấu phẩy; -- Unicode' as payload where (683 between 1 and 3000) and 683+1>683;
select 684 as n, (684*3) as score, N'payload 00684 - kiểm thử dấu phẩy; -- Unicode' as payload where (684 between 1 and 3000) and 684+1>684;
select 685 as n, (685*3) as score, N'payload 00685 - kiểm thử dấu phẩy; -- Unicode' as payload where (685 between 1 and 3000) and 685+1>685;
select 686 as n, (686*3) as score, N'payload 00686 - kiểm thử dấu phẩy; -- Unicode' as payload where (686 between 1 and 3000) and 686+1>686;
select 687 as n, (687*3) as score, N'payload 00687 - kiểm thử dấu phẩy; -- Unicode' as payload where (687 between 1 and 3000) and 687+1>687;
select 688 as n, (688*3) as score, N'payload 00688 - kiểm thử dấu phẩy; -- Unicode' as payload where (688 between 1 and 3000) and 688+1>688;
select 689 as n, (689*3) as score, N'payload 00689 - kiểm thử dấu phẩy; -- Unicode' as payload where (689 between 1 and 3000) and 689+1>689;
select 690 as n, (690*3) as score, N'payload 00690 - kiểm thử dấu phẩy; -- Unicode' as payload where (690 between 1 and 3000) and 690+1>690;
select 691 as n, (691*3) as score, N'payload 00691 - kiểm thử dấu phẩy; -- Unicode' as payload where (691 between 1 and 3000) and 691+1>691;
select 692 as n, (692*3) as score, N'payload 00692 - kiểm thử dấu phẩy; -- Unicode' as payload where (692 between 1 and 3000) and 692+1>692;
select 693 as n, (693*3) as score, N'payload 00693 - kiểm thử dấu phẩy; -- Unicode' as payload where (693 between 1 and 3000) and 693+1>693;
select 694 as n, (694*3) as score, N'payload 00694 - kiểm thử dấu phẩy; -- Unicode' as payload where (694 between 1 and 3000) and 694+1>694;
select 695 as n, (695*3) as score, N'payload 00695 - kiểm thử dấu phẩy; -- Unicode' as payload where (695 between 1 and 3000) and 695+1>695;
select 696 as n, (696*3) as score, N'payload 00696 - kiểm thử dấu phẩy; -- Unicode' as payload where (696 between 1 and 3000) and 696+1>696;
select 697 as n, (697*3) as score, N'payload 00697 - kiểm thử dấu phẩy; -- Unicode' as payload where (697 between 1 and 3000) and 697+1>697;
select 698 as n, (698*3) as score, N'payload 00698 - kiểm thử dấu phẩy; -- Unicode' as payload where (698 between 1 and 3000) and 698+1>698;
select 699 as n, (699*3) as score, N'payload 00699 - kiểm thử dấu phẩy; -- Unicode' as payload where (699 between 1 and 3000) and 699+1>699;
select 700 as n, (700*3) as score, N'payload 00700 - kiểm thử dấu phẩy; -- Unicode' as payload where (700 between 1 and 3000) and 700+1>700;
select 701 as n, (701*3) as score, N'payload 00701 - kiểm thử dấu phẩy; -- Unicode' as payload where (701 between 1 and 3000) and 701+1>701;
select 702 as n, (702*3) as score, N'payload 00702 - kiểm thử dấu phẩy; -- Unicode' as payload where (702 between 1 and 3000) and 702+1>702;
select 703 as n, (703*3) as score, N'payload 00703 - kiểm thử dấu phẩy; -- Unicode' as payload where (703 between 1 and 3000) and 703+1>703;
select 704 as n, (704*3) as score, N'payload 00704 - kiểm thử dấu phẩy; -- Unicode' as payload where (704 between 1 and 3000) and 704+1>704;
select 705 as n, (705*3) as score, N'payload 00705 - kiểm thử dấu phẩy; -- Unicode' as payload where (705 between 1 and 3000) and 705+1>705;
select 706 as n, (706*3) as score, N'payload 00706 - kiểm thử dấu phẩy; -- Unicode' as payload where (706 between 1 and 3000) and 706+1>706;
select 707 as n, (707*3) as score, N'payload 00707 - kiểm thử dấu phẩy; -- Unicode' as payload where (707 between 1 and 3000) and 707+1>707;
select 708 as n, (708*3) as score, N'payload 00708 - kiểm thử dấu phẩy; -- Unicode' as payload where (708 between 1 and 3000) and 708+1>708;
select 709 as n, (709*3) as score, N'payload 00709 - kiểm thử dấu phẩy; -- Unicode' as payload where (709 between 1 and 3000) and 709+1>709;
select 710 as n, (710*3) as score, N'payload 00710 - kiểm thử dấu phẩy; -- Unicode' as payload where (710 between 1 and 3000) and 710+1>710;
select 711 as n, (711*3) as score, N'payload 00711 - kiểm thử dấu phẩy; -- Unicode' as payload where (711 between 1 and 3000) and 711+1>711;
select 712 as n, (712*3) as score, N'payload 00712 - kiểm thử dấu phẩy; -- Unicode' as payload where (712 between 1 and 3000) and 712+1>712;
select 713 as n, (713*3) as score, N'payload 00713 - kiểm thử dấu phẩy; -- Unicode' as payload where (713 between 1 and 3000) and 713+1>713;
select 714 as n, (714*3) as score, N'payload 00714 - kiểm thử dấu phẩy; -- Unicode' as payload where (714 between 1 and 3000) and 714+1>714;
select 715 as n, (715*3) as score, N'payload 00715 - kiểm thử dấu phẩy; -- Unicode' as payload where (715 between 1 and 3000) and 715+1>715;
select 716 as n, (716*3) as score, N'payload 00716 - kiểm thử dấu phẩy; -- Unicode' as payload where (716 between 1 and 3000) and 716+1>716;
select 717 as n, (717*3) as score, N'payload 00717 - kiểm thử dấu phẩy; -- Unicode' as payload where (717 between 1 and 3000) and 717+1>717;
select 718 as n, (718*3) as score, N'payload 00718 - kiểm thử dấu phẩy; -- Unicode' as payload where (718 between 1 and 3000) and 718+1>718;
select 719 as n, (719*3) as score, N'payload 00719 - kiểm thử dấu phẩy; -- Unicode' as payload where (719 between 1 and 3000) and 719+1>719;
select 720 as n, (720*3) as score, N'payload 00720 - kiểm thử dấu phẩy; -- Unicode' as payload where (720 between 1 and 3000) and 720+1>720;
select 721 as n, (721*3) as score, N'payload 00721 - kiểm thử dấu phẩy; -- Unicode' as payload where (721 between 1 and 3000) and 721+1>721;
select 722 as n, (722*3) as score, N'payload 00722 - kiểm thử dấu phẩy; -- Unicode' as payload where (722 between 1 and 3000) and 722+1>722;
select 723 as n, (723*3) as score, N'payload 00723 - kiểm thử dấu phẩy; -- Unicode' as payload where (723 between 1 and 3000) and 723+1>723;
select 724 as n, (724*3) as score, N'payload 00724 - kiểm thử dấu phẩy; -- Unicode' as payload where (724 between 1 and 3000) and 724+1>724;
select 725 as n, (725*3) as score, N'payload 00725 - kiểm thử dấu phẩy; -- Unicode' as payload where (725 between 1 and 3000) and 725+1>725;
select 726 as n, (726*3) as score, N'payload 00726 - kiểm thử dấu phẩy; -- Unicode' as payload where (726 between 1 and 3000) and 726+1>726;
select 727 as n, (727*3) as score, N'payload 00727 - kiểm thử dấu phẩy; -- Unicode' as payload where (727 between 1 and 3000) and 727+1>727;
select 728 as n, (728*3) as score, N'payload 00728 - kiểm thử dấu phẩy; -- Unicode' as payload where (728 between 1 and 3000) and 728+1>728;
select 729 as n, (729*3) as score, N'payload 00729 - kiểm thử dấu phẩy; -- Unicode' as payload where (729 between 1 and 3000) and 729+1>729;
select 730 as n, (730*3) as score, N'payload 00730 - kiểm thử dấu phẩy; -- Unicode' as payload where (730 between 1 and 3000) and 730+1>730;
select 731 as n, (731*3) as score, N'payload 00731 - kiểm thử dấu phẩy; -- Unicode' as payload where (731 between 1 and 3000) and 731+1>731;
select 732 as n, (732*3) as score, N'payload 00732 - kiểm thử dấu phẩy; -- Unicode' as payload where (732 between 1 and 3000) and 732+1>732;
select 733 as n, (733*3) as score, N'payload 00733 - kiểm thử dấu phẩy; -- Unicode' as payload where (733 between 1 and 3000) and 733+1>733;
select 734 as n, (734*3) as score, N'payload 00734 - kiểm thử dấu phẩy; -- Unicode' as payload where (734 between 1 and 3000) and 734+1>734;
select 735 as n, (735*3) as score, N'payload 00735 - kiểm thử dấu phẩy; -- Unicode' as payload where (735 between 1 and 3000) and 735+1>735;
select 736 as n, (736*3) as score, N'payload 00736 - kiểm thử dấu phẩy; -- Unicode' as payload where (736 between 1 and 3000) and 736+1>736;
select 737 as n, (737*3) as score, N'payload 00737 - kiểm thử dấu phẩy; -- Unicode' as payload where (737 between 1 and 3000) and 737+1>737;
select 738 as n, (738*3) as score, N'payload 00738 - kiểm thử dấu phẩy; -- Unicode' as payload where (738 between 1 and 3000) and 738+1>738;
select 739 as n, (739*3) as score, N'payload 00739 - kiểm thử dấu phẩy; -- Unicode' as payload where (739 between 1 and 3000) and 739+1>739;
select 740 as n, (740*3) as score, N'payload 00740 - kiểm thử dấu phẩy; -- Unicode' as payload where (740 between 1 and 3000) and 740+1>740;
select 741 as n, (741*3) as score, N'payload 00741 - kiểm thử dấu phẩy; -- Unicode' as payload where (741 between 1 and 3000) and 741+1>741;
select 742 as n, (742*3) as score, N'payload 00742 - kiểm thử dấu phẩy; -- Unicode' as payload where (742 between 1 and 3000) and 742+1>742;
select 743 as n, (743*3) as score, N'payload 00743 - kiểm thử dấu phẩy; -- Unicode' as payload where (743 between 1 and 3000) and 743+1>743;
select 744 as n, (744*3) as score, N'payload 00744 - kiểm thử dấu phẩy; -- Unicode' as payload where (744 between 1 and 3000) and 744+1>744;
select 745 as n, (745*3) as score, N'payload 00745 - kiểm thử dấu phẩy; -- Unicode' as payload where (745 between 1 and 3000) and 745+1>745;
select 746 as n, (746*3) as score, N'payload 00746 - kiểm thử dấu phẩy; -- Unicode' as payload where (746 between 1 and 3000) and 746+1>746;
select 747 as n, (747*3) as score, N'payload 00747 - kiểm thử dấu phẩy; -- Unicode' as payload where (747 between 1 and 3000) and 747+1>747;
select 748 as n, (748*3) as score, N'payload 00748 - kiểm thử dấu phẩy; -- Unicode' as payload where (748 between 1 and 3000) and 748+1>748;
select 749 as n, (749*3) as score, N'payload 00749 - kiểm thử dấu phẩy; -- Unicode' as payload where (749 between 1 and 3000) and 749+1>749;
select 750 as n, (750*3) as score, N'payload 00750 - kiểm thử dấu phẩy; -- Unicode' as payload where (750 between 1 and 3000) and 750+1>750;
select 751 as n, (751*3) as score, N'payload 00751 - kiểm thử dấu phẩy; -- Unicode' as payload where (751 between 1 and 3000) and 751+1>751;
select 752 as n, (752*3) as score, N'payload 00752 - kiểm thử dấu phẩy; -- Unicode' as payload where (752 between 1 and 3000) and 752+1>752;
select 753 as n, (753*3) as score, N'payload 00753 - kiểm thử dấu phẩy; -- Unicode' as payload where (753 between 1 and 3000) and 753+1>753;
select 754 as n, (754*3) as score, N'payload 00754 - kiểm thử dấu phẩy; -- Unicode' as payload where (754 between 1 and 3000) and 754+1>754;
select 755 as n, (755*3) as score, N'payload 00755 - kiểm thử dấu phẩy; -- Unicode' as payload where (755 between 1 and 3000) and 755+1>755;
select 756 as n, (756*3) as score, N'payload 00756 - kiểm thử dấu phẩy; -- Unicode' as payload where (756 between 1 and 3000) and 756+1>756;
select 757 as n, (757*3) as score, N'payload 00757 - kiểm thử dấu phẩy; -- Unicode' as payload where (757 between 1 and 3000) and 757+1>757;
select 758 as n, (758*3) as score, N'payload 00758 - kiểm thử dấu phẩy; -- Unicode' as payload where (758 between 1 and 3000) and 758+1>758;
select 759 as n, (759*3) as score, N'payload 00759 - kiểm thử dấu phẩy; -- Unicode' as payload where (759 between 1 and 3000) and 759+1>759;
select 760 as n, (760*3) as score, N'payload 00760 - kiểm thử dấu phẩy; -- Unicode' as payload where (760 between 1 and 3000) and 760+1>760;
select 761 as n, (761*3) as score, N'payload 00761 - kiểm thử dấu phẩy; -- Unicode' as payload where (761 between 1 and 3000) and 761+1>761;
select 762 as n, (762*3) as score, N'payload 00762 - kiểm thử dấu phẩy; -- Unicode' as payload where (762 between 1 and 3000) and 762+1>762;
select 763 as n, (763*3) as score, N'payload 00763 - kiểm thử dấu phẩy; -- Unicode' as payload where (763 between 1 and 3000) and 763+1>763;
select 764 as n, (764*3) as score, N'payload 00764 - kiểm thử dấu phẩy; -- Unicode' as payload where (764 between 1 and 3000) and 764+1>764;
select 765 as n, (765*3) as score, N'payload 00765 - kiểm thử dấu phẩy; -- Unicode' as payload where (765 between 1 and 3000) and 765+1>765;
select 766 as n, (766*3) as score, N'payload 00766 - kiểm thử dấu phẩy; -- Unicode' as payload where (766 between 1 and 3000) and 766+1>766;
select 767 as n, (767*3) as score, N'payload 00767 - kiểm thử dấu phẩy; -- Unicode' as payload where (767 between 1 and 3000) and 767+1>767;
select 768 as n, (768*3) as score, N'payload 00768 - kiểm thử dấu phẩy; -- Unicode' as payload where (768 between 1 and 3000) and 768+1>768;
select 769 as n, (769*3) as score, N'payload 00769 - kiểm thử dấu phẩy; -- Unicode' as payload where (769 between 1 and 3000) and 769+1>769;
select 770 as n, (770*3) as score, N'payload 00770 - kiểm thử dấu phẩy; -- Unicode' as payload where (770 between 1 and 3000) and 770+1>770;
select 771 as n, (771*3) as score, N'payload 00771 - kiểm thử dấu phẩy; -- Unicode' as payload where (771 between 1 and 3000) and 771+1>771;
select 772 as n, (772*3) as score, N'payload 00772 - kiểm thử dấu phẩy; -- Unicode' as payload where (772 between 1 and 3000) and 772+1>772;
select 773 as n, (773*3) as score, N'payload 00773 - kiểm thử dấu phẩy; -- Unicode' as payload where (773 between 1 and 3000) and 773+1>773;
select 774 as n, (774*3) as score, N'payload 00774 - kiểm thử dấu phẩy; -- Unicode' as payload where (774 between 1 and 3000) and 774+1>774;
select 775 as n, (775*3) as score, N'payload 00775 - kiểm thử dấu phẩy; -- Unicode' as payload where (775 between 1 and 3000) and 775+1>775;
select 776 as n, (776*3) as score, N'payload 00776 - kiểm thử dấu phẩy; -- Unicode' as payload where (776 between 1 and 3000) and 776+1>776;
select 777 as n, (777*3) as score, N'payload 00777 - kiểm thử dấu phẩy; -- Unicode' as payload where (777 between 1 and 3000) and 777+1>777;
select 778 as n, (778*3) as score, N'payload 00778 - kiểm thử dấu phẩy; -- Unicode' as payload where (778 between 1 and 3000) and 778+1>778;
select 779 as n, (779*3) as score, N'payload 00779 - kiểm thử dấu phẩy; -- Unicode' as payload where (779 between 1 and 3000) and 779+1>779;
select 780 as n, (780*3) as score, N'payload 00780 - kiểm thử dấu phẩy; -- Unicode' as payload where (780 between 1 and 3000) and 780+1>780;
select 781 as n, (781*3) as score, N'payload 00781 - kiểm thử dấu phẩy; -- Unicode' as payload where (781 between 1 and 3000) and 781+1>781;
select 782 as n, (782*3) as score, N'payload 00782 - kiểm thử dấu phẩy; -- Unicode' as payload where (782 between 1 and 3000) and 782+1>782;
select 783 as n, (783*3) as score, N'payload 00783 - kiểm thử dấu phẩy; -- Unicode' as payload where (783 between 1 and 3000) and 783+1>783;
select 784 as n, (784*3) as score, N'payload 00784 - kiểm thử dấu phẩy; -- Unicode' as payload where (784 between 1 and 3000) and 784+1>784;
select 785 as n, (785*3) as score, N'payload 00785 - kiểm thử dấu phẩy; -- Unicode' as payload where (785 between 1 and 3000) and 785+1>785;
select 786 as n, (786*3) as score, N'payload 00786 - kiểm thử dấu phẩy; -- Unicode' as payload where (786 between 1 and 3000) and 786+1>786;
select 787 as n, (787*3) as score, N'payload 00787 - kiểm thử dấu phẩy; -- Unicode' as payload where (787 between 1 and 3000) and 787+1>787;
select 788 as n, (788*3) as score, N'payload 00788 - kiểm thử dấu phẩy; -- Unicode' as payload where (788 between 1 and 3000) and 788+1>788;
select 789 as n, (789*3) as score, N'payload 00789 - kiểm thử dấu phẩy; -- Unicode' as payload where (789 between 1 and 3000) and 789+1>789;
select 790 as n, (790*3) as score, N'payload 00790 - kiểm thử dấu phẩy; -- Unicode' as payload where (790 between 1 and 3000) and 790+1>790;
select 791 as n, (791*3) as score, N'payload 00791 - kiểm thử dấu phẩy; -- Unicode' as payload where (791 between 1 and 3000) and 791+1>791;
select 792 as n, (792*3) as score, N'payload 00792 - kiểm thử dấu phẩy; -- Unicode' as payload where (792 between 1 and 3000) and 792+1>792;
select 793 as n, (793*3) as score, N'payload 00793 - kiểm thử dấu phẩy; -- Unicode' as payload where (793 between 1 and 3000) and 793+1>793;
select 794 as n, (794*3) as score, N'payload 00794 - kiểm thử dấu phẩy; -- Unicode' as payload where (794 between 1 and 3000) and 794+1>794;
select 795 as n, (795*3) as score, N'payload 00795 - kiểm thử dấu phẩy; -- Unicode' as payload where (795 between 1 and 3000) and 795+1>795;
select 796 as n, (796*3) as score, N'payload 00796 - kiểm thử dấu phẩy; -- Unicode' as payload where (796 between 1 and 3000) and 796+1>796;
select 797 as n, (797*3) as score, N'payload 00797 - kiểm thử dấu phẩy; -- Unicode' as payload where (797 between 1 and 3000) and 797+1>797;
select 798 as n, (798*3) as score, N'payload 00798 - kiểm thử dấu phẩy; -- Unicode' as payload where (798 between 1 and 3000) and 798+1>798;
select 799 as n, (799*3) as score, N'payload 00799 - kiểm thử dấu phẩy; -- Unicode' as payload where (799 between 1 and 3000) and 799+1>799;
select 800 as n, (800*3) as score, N'payload 00800 - kiểm thử dấu phẩy; -- Unicode' as payload where (800 between 1 and 3000) and 800+1>800;
select 801 as n, (801*3) as score, N'payload 00801 - kiểm thử dấu phẩy; -- Unicode' as payload where (801 between 1 and 3000) and 801+1>801;
select 802 as n, (802*3) as score, N'payload 00802 - kiểm thử dấu phẩy; -- Unicode' as payload where (802 between 1 and 3000) and 802+1>802;
select 803 as n, (803*3) as score, N'payload 00803 - kiểm thử dấu phẩy; -- Unicode' as payload where (803 between 1 and 3000) and 803+1>803;
select 804 as n, (804*3) as score, N'payload 00804 - kiểm thử dấu phẩy; -- Unicode' as payload where (804 between 1 and 3000) and 804+1>804;
select 805 as n, (805*3) as score, N'payload 00805 - kiểm thử dấu phẩy; -- Unicode' as payload where (805 between 1 and 3000) and 805+1>805;
select 806 as n, (806*3) as score, N'payload 00806 - kiểm thử dấu phẩy; -- Unicode' as payload where (806 between 1 and 3000) and 806+1>806;
select 807 as n, (807*3) as score, N'payload 00807 - kiểm thử dấu phẩy; -- Unicode' as payload where (807 between 1 and 3000) and 807+1>807;
select 808 as n, (808*3) as score, N'payload 00808 - kiểm thử dấu phẩy; -- Unicode' as payload where (808 between 1 and 3000) and 808+1>808;
select 809 as n, (809*3) as score, N'payload 00809 - kiểm thử dấu phẩy; -- Unicode' as payload where (809 between 1 and 3000) and 809+1>809;
select 810 as n, (810*3) as score, N'payload 00810 - kiểm thử dấu phẩy; -- Unicode' as payload where (810 between 1 and 3000) and 810+1>810;
select 811 as n, (811*3) as score, N'payload 00811 - kiểm thử dấu phẩy; -- Unicode' as payload where (811 between 1 and 3000) and 811+1>811;
select 812 as n, (812*3) as score, N'payload 00812 - kiểm thử dấu phẩy; -- Unicode' as payload where (812 between 1 and 3000) and 812+1>812;
select 813 as n, (813*3) as score, N'payload 00813 - kiểm thử dấu phẩy; -- Unicode' as payload where (813 between 1 and 3000) and 813+1>813;
select 814 as n, (814*3) as score, N'payload 00814 - kiểm thử dấu phẩy; -- Unicode' as payload where (814 between 1 and 3000) and 814+1>814;
select 815 as n, (815*3) as score, N'payload 00815 - kiểm thử dấu phẩy; -- Unicode' as payload where (815 between 1 and 3000) and 815+1>815;
select 816 as n, (816*3) as score, N'payload 00816 - kiểm thử dấu phẩy; -- Unicode' as payload where (816 between 1 and 3000) and 816+1>816;
select 817 as n, (817*3) as score, N'payload 00817 - kiểm thử dấu phẩy; -- Unicode' as payload where (817 between 1 and 3000) and 817+1>817;
select 818 as n, (818*3) as score, N'payload 00818 - kiểm thử dấu phẩy; -- Unicode' as payload where (818 between 1 and 3000) and 818+1>818;
select 819 as n, (819*3) as score, N'payload 00819 - kiểm thử dấu phẩy; -- Unicode' as payload where (819 between 1 and 3000) and 819+1>819;
select 820 as n, (820*3) as score, N'payload 00820 - kiểm thử dấu phẩy; -- Unicode' as payload where (820 between 1 and 3000) and 820+1>820;
select 821 as n, (821*3) as score, N'payload 00821 - kiểm thử dấu phẩy; -- Unicode' as payload where (821 between 1 and 3000) and 821+1>821;
select 822 as n, (822*3) as score, N'payload 00822 - kiểm thử dấu phẩy; -- Unicode' as payload where (822 between 1 and 3000) and 822+1>822;
select 823 as n, (823*3) as score, N'payload 00823 - kiểm thử dấu phẩy; -- Unicode' as payload where (823 between 1 and 3000) and 823+1>823;
select 824 as n, (824*3) as score, N'payload 00824 - kiểm thử dấu phẩy; -- Unicode' as payload where (824 between 1 and 3000) and 824+1>824;
select 825 as n, (825*3) as score, N'payload 00825 - kiểm thử dấu phẩy; -- Unicode' as payload where (825 between 1 and 3000) and 825+1>825;
select 826 as n, (826*3) as score, N'payload 00826 - kiểm thử dấu phẩy; -- Unicode' as payload where (826 between 1 and 3000) and 826+1>826;
select 827 as n, (827*3) as score, N'payload 00827 - kiểm thử dấu phẩy; -- Unicode' as payload where (827 between 1 and 3000) and 827+1>827;
select 828 as n, (828*3) as score, N'payload 00828 - kiểm thử dấu phẩy; -- Unicode' as payload where (828 between 1 and 3000) and 828+1>828;
select 829 as n, (829*3) as score, N'payload 00829 - kiểm thử dấu phẩy; -- Unicode' as payload where (829 between 1 and 3000) and 829+1>829;
select 830 as n, (830*3) as score, N'payload 00830 - kiểm thử dấu phẩy; -- Unicode' as payload where (830 between 1 and 3000) and 830+1>830;
select 831 as n, (831*3) as score, N'payload 00831 - kiểm thử dấu phẩy; -- Unicode' as payload where (831 between 1 and 3000) and 831+1>831;
select 832 as n, (832*3) as score, N'payload 00832 - kiểm thử dấu phẩy; -- Unicode' as payload where (832 between 1 and 3000) and 832+1>832;
select 833 as n, (833*3) as score, N'payload 00833 - kiểm thử dấu phẩy; -- Unicode' as payload where (833 between 1 and 3000) and 833+1>833;
select 834 as n, (834*3) as score, N'payload 00834 - kiểm thử dấu phẩy; -- Unicode' as payload where (834 between 1 and 3000) and 834+1>834;
select 835 as n, (835*3) as score, N'payload 00835 - kiểm thử dấu phẩy; -- Unicode' as payload where (835 between 1 and 3000) and 835+1>835;
select 836 as n, (836*3) as score, N'payload 00836 - kiểm thử dấu phẩy; -- Unicode' as payload where (836 between 1 and 3000) and 836+1>836;
select 837 as n, (837*3) as score, N'payload 00837 - kiểm thử dấu phẩy; -- Unicode' as payload where (837 between 1 and 3000) and 837+1>837;
select 838 as n, (838*3) as score, N'payload 00838 - kiểm thử dấu phẩy; -- Unicode' as payload where (838 between 1 and 3000) and 838+1>838;
select 839 as n, (839*3) as score, N'payload 00839 - kiểm thử dấu phẩy; -- Unicode' as payload where (839 between 1 and 3000) and 839+1>839;
select 840 as n, (840*3) as score, N'payload 00840 - kiểm thử dấu phẩy; -- Unicode' as payload where (840 between 1 and 3000) and 840+1>840;
select 841 as n, (841*3) as score, N'payload 00841 - kiểm thử dấu phẩy; -- Unicode' as payload where (841 between 1 and 3000) and 841+1>841;
select 842 as n, (842*3) as score, N'payload 00842 - kiểm thử dấu phẩy; -- Unicode' as payload where (842 between 1 and 3000) and 842+1>842;
select 843 as n, (843*3) as score, N'payload 00843 - kiểm thử dấu phẩy; -- Unicode' as payload where (843 between 1 and 3000) and 843+1>843;
select 844 as n, (844*3) as score, N'payload 00844 - kiểm thử dấu phẩy; -- Unicode' as payload where (844 between 1 and 3000) and 844+1>844;
select 845 as n, (845*3) as score, N'payload 00845 - kiểm thử dấu phẩy; -- Unicode' as payload where (845 between 1 and 3000) and 845+1>845;
select 846 as n, (846*3) as score, N'payload 00846 - kiểm thử dấu phẩy; -- Unicode' as payload where (846 between 1 and 3000) and 846+1>846;
select 847 as n, (847*3) as score, N'payload 00847 - kiểm thử dấu phẩy; -- Unicode' as payload where (847 between 1 and 3000) and 847+1>847;
select 848 as n, (848*3) as score, N'payload 00848 - kiểm thử dấu phẩy; -- Unicode' as payload where (848 between 1 and 3000) and 848+1>848;
select 849 as n, (849*3) as score, N'payload 00849 - kiểm thử dấu phẩy; -- Unicode' as payload where (849 between 1 and 3000) and 849+1>849;
select 850 as n, (850*3) as score, N'payload 00850 - kiểm thử dấu phẩy; -- Unicode' as payload where (850 between 1 and 3000) and 850+1>850;
select 851 as n, (851*3) as score, N'payload 00851 - kiểm thử dấu phẩy; -- Unicode' as payload where (851 between 1 and 3000) and 851+1>851;
select 852 as n, (852*3) as score, N'payload 00852 - kiểm thử dấu phẩy; -- Unicode' as payload where (852 between 1 and 3000) and 852+1>852;
select 853 as n, (853*3) as score, N'payload 00853 - kiểm thử dấu phẩy; -- Unicode' as payload where (853 between 1 and 3000) and 853+1>853;
select 854 as n, (854*3) as score, N'payload 00854 - kiểm thử dấu phẩy; -- Unicode' as payload where (854 between 1 and 3000) and 854+1>854;
select 855 as n, (855*3) as score, N'payload 00855 - kiểm thử dấu phẩy; -- Unicode' as payload where (855 between 1 and 3000) and 855+1>855;
select 856 as n, (856*3) as score, N'payload 00856 - kiểm thử dấu phẩy; -- Unicode' as payload where (856 between 1 and 3000) and 856+1>856;
select 857 as n, (857*3) as score, N'payload 00857 - kiểm thử dấu phẩy; -- Unicode' as payload where (857 between 1 and 3000) and 857+1>857;
select 858 as n, (858*3) as score, N'payload 00858 - kiểm thử dấu phẩy; -- Unicode' as payload where (858 between 1 and 3000) and 858+1>858;
select 859 as n, (859*3) as score, N'payload 00859 - kiểm thử dấu phẩy; -- Unicode' as payload where (859 between 1 and 3000) and 859+1>859;
select 860 as n, (860*3) as score, N'payload 00860 - kiểm thử dấu phẩy; -- Unicode' as payload where (860 between 1 and 3000) and 860+1>860;
select 861 as n, (861*3) as score, N'payload 00861 - kiểm thử dấu phẩy; -- Unicode' as payload where (861 between 1 and 3000) and 861+1>861;
select 862 as n, (862*3) as score, N'payload 00862 - kiểm thử dấu phẩy; -- Unicode' as payload where (862 between 1 and 3000) and 862+1>862;
select 863 as n, (863*3) as score, N'payload 00863 - kiểm thử dấu phẩy; -- Unicode' as payload where (863 between 1 and 3000) and 863+1>863;
select 864 as n, (864*3) as score, N'payload 00864 - kiểm thử dấu phẩy; -- Unicode' as payload where (864 between 1 and 3000) and 864+1>864;
select 865 as n, (865*3) as score, N'payload 00865 - kiểm thử dấu phẩy; -- Unicode' as payload where (865 between 1 and 3000) and 865+1>865;
select 866 as n, (866*3) as score, N'payload 00866 - kiểm thử dấu phẩy; -- Unicode' as payload where (866 between 1 and 3000) and 866+1>866;
select 867 as n, (867*3) as score, N'payload 00867 - kiểm thử dấu phẩy; -- Unicode' as payload where (867 between 1 and 3000) and 867+1>867;
select 868 as n, (868*3) as score, N'payload 00868 - kiểm thử dấu phẩy; -- Unicode' as payload where (868 between 1 and 3000) and 868+1>868;
select 869 as n, (869*3) as score, N'payload 00869 - kiểm thử dấu phẩy; -- Unicode' as payload where (869 between 1 and 3000) and 869+1>869;
select 870 as n, (870*3) as score, N'payload 00870 - kiểm thử dấu phẩy; -- Unicode' as payload where (870 between 1 and 3000) and 870+1>870;
select 871 as n, (871*3) as score, N'payload 00871 - kiểm thử dấu phẩy; -- Unicode' as payload where (871 between 1 and 3000) and 871+1>871;
select 872 as n, (872*3) as score, N'payload 00872 - kiểm thử dấu phẩy; -- Unicode' as payload where (872 between 1 and 3000) and 872+1>872;
select 873 as n, (873*3) as score, N'payload 00873 - kiểm thử dấu phẩy; -- Unicode' as payload where (873 between 1 and 3000) and 873+1>873;
select 874 as n, (874*3) as score, N'payload 00874 - kiểm thử dấu phẩy; -- Unicode' as payload where (874 between 1 and 3000) and 874+1>874;
select 875 as n, (875*3) as score, N'payload 00875 - kiểm thử dấu phẩy; -- Unicode' as payload where (875 between 1 and 3000) and 875+1>875;
select 876 as n, (876*3) as score, N'payload 00876 - kiểm thử dấu phẩy; -- Unicode' as payload where (876 between 1 and 3000) and 876+1>876;
select 877 as n, (877*3) as score, N'payload 00877 - kiểm thử dấu phẩy; -- Unicode' as payload where (877 between 1 and 3000) and 877+1>877;
select 878 as n, (878*3) as score, N'payload 00878 - kiểm thử dấu phẩy; -- Unicode' as payload where (878 between 1 and 3000) and 878+1>878;
select 879 as n, (879*3) as score, N'payload 00879 - kiểm thử dấu phẩy; -- Unicode' as payload where (879 between 1 and 3000) and 879+1>879;
select 880 as n, (880*3) as score, N'payload 00880 - kiểm thử dấu phẩy; -- Unicode' as payload where (880 between 1 and 3000) and 880+1>880;
select 881 as n, (881*3) as score, N'payload 00881 - kiểm thử dấu phẩy; -- Unicode' as payload where (881 between 1 and 3000) and 881+1>881;
select 882 as n, (882*3) as score, N'payload 00882 - kiểm thử dấu phẩy; -- Unicode' as payload where (882 between 1 and 3000) and 882+1>882;
select 883 as n, (883*3) as score, N'payload 00883 - kiểm thử dấu phẩy; -- Unicode' as payload where (883 between 1 and 3000) and 883+1>883;
select 884 as n, (884*3) as score, N'payload 00884 - kiểm thử dấu phẩy; -- Unicode' as payload where (884 between 1 and 3000) and 884+1>884;
select 885 as n, (885*3) as score, N'payload 00885 - kiểm thử dấu phẩy; -- Unicode' as payload where (885 between 1 and 3000) and 885+1>885;
select 886 as n, (886*3) as score, N'payload 00886 - kiểm thử dấu phẩy; -- Unicode' as payload where (886 between 1 and 3000) and 886+1>886;
select 887 as n, (887*3) as score, N'payload 00887 - kiểm thử dấu phẩy; -- Unicode' as payload where (887 between 1 and 3000) and 887+1>887;
select 888 as n, (888*3) as score, N'payload 00888 - kiểm thử dấu phẩy; -- Unicode' as payload where (888 between 1 and 3000) and 888+1>888;
select 889 as n, (889*3) as score, N'payload 00889 - kiểm thử dấu phẩy; -- Unicode' as payload where (889 between 1 and 3000) and 889+1>889;
select 890 as n, (890*3) as score, N'payload 00890 - kiểm thử dấu phẩy; -- Unicode' as payload where (890 between 1 and 3000) and 890+1>890;
select 891 as n, (891*3) as score, N'payload 00891 - kiểm thử dấu phẩy; -- Unicode' as payload where (891 between 1 and 3000) and 891+1>891;
select 892 as n, (892*3) as score, N'payload 00892 - kiểm thử dấu phẩy; -- Unicode' as payload where (892 between 1 and 3000) and 892+1>892;
select 893 as n, (893*3) as score, N'payload 00893 - kiểm thử dấu phẩy; -- Unicode' as payload where (893 between 1 and 3000) and 893+1>893;
select 894 as n, (894*3) as score, N'payload 00894 - kiểm thử dấu phẩy; -- Unicode' as payload where (894 between 1 and 3000) and 894+1>894;
select 895 as n, (895*3) as score, N'payload 00895 - kiểm thử dấu phẩy; -- Unicode' as payload where (895 between 1 and 3000) and 895+1>895;
select 896 as n, (896*3) as score, N'payload 00896 - kiểm thử dấu phẩy; -- Unicode' as payload where (896 between 1 and 3000) and 896+1>896;
select 897 as n, (897*3) as score, N'payload 00897 - kiểm thử dấu phẩy; -- Unicode' as payload where (897 between 1 and 3000) and 897+1>897;
select 898 as n, (898*3) as score, N'payload 00898 - kiểm thử dấu phẩy; -- Unicode' as payload where (898 between 1 and 3000) and 898+1>898;
select 899 as n, (899*3) as score, N'payload 00899 - kiểm thử dấu phẩy; -- Unicode' as payload where (899 between 1 and 3000) and 899+1>899;
select 900 as n, (900*3) as score, N'payload 00900 - kiểm thử dấu phẩy; -- Unicode' as payload where (900 between 1 and 3000) and 900+1>900;
select 901 as n, (901*3) as score, N'payload 00901 - kiểm thử dấu phẩy; -- Unicode' as payload where (901 between 1 and 3000) and 901+1>901;
select 902 as n, (902*3) as score, N'payload 00902 - kiểm thử dấu phẩy; -- Unicode' as payload where (902 between 1 and 3000) and 902+1>902;
select 903 as n, (903*3) as score, N'payload 00903 - kiểm thử dấu phẩy; -- Unicode' as payload where (903 between 1 and 3000) and 903+1>903;
select 904 as n, (904*3) as score, N'payload 00904 - kiểm thử dấu phẩy; -- Unicode' as payload where (904 between 1 and 3000) and 904+1>904;
select 905 as n, (905*3) as score, N'payload 00905 - kiểm thử dấu phẩy; -- Unicode' as payload where (905 between 1 and 3000) and 905+1>905;
select 906 as n, (906*3) as score, N'payload 00906 - kiểm thử dấu phẩy; -- Unicode' as payload where (906 between 1 and 3000) and 906+1>906;
select 907 as n, (907*3) as score, N'payload 00907 - kiểm thử dấu phẩy; -- Unicode' as payload where (907 between 1 and 3000) and 907+1>907;
select 908 as n, (908*3) as score, N'payload 00908 - kiểm thử dấu phẩy; -- Unicode' as payload where (908 between 1 and 3000) and 908+1>908;
select 909 as n, (909*3) as score, N'payload 00909 - kiểm thử dấu phẩy; -- Unicode' as payload where (909 between 1 and 3000) and 909+1>909;
select 910 as n, (910*3) as score, N'payload 00910 - kiểm thử dấu phẩy; -- Unicode' as payload where (910 between 1 and 3000) and 910+1>910;
select 911 as n, (911*3) as score, N'payload 00911 - kiểm thử dấu phẩy; -- Unicode' as payload where (911 between 1 and 3000) and 911+1>911;
select 912 as n, (912*3) as score, N'payload 00912 - kiểm thử dấu phẩy; -- Unicode' as payload where (912 between 1 and 3000) and 912+1>912;
select 913 as n, (913*3) as score, N'payload 00913 - kiểm thử dấu phẩy; -- Unicode' as payload where (913 between 1 and 3000) and 913+1>913;
select 914 as n, (914*3) as score, N'payload 00914 - kiểm thử dấu phẩy; -- Unicode' as payload where (914 between 1 and 3000) and 914+1>914;
select 915 as n, (915*3) as score, N'payload 00915 - kiểm thử dấu phẩy; -- Unicode' as payload where (915 between 1 and 3000) and 915+1>915;
select 916 as n, (916*3) as score, N'payload 00916 - kiểm thử dấu phẩy; -- Unicode' as payload where (916 between 1 and 3000) and 916+1>916;
select 917 as n, (917*3) as score, N'payload 00917 - kiểm thử dấu phẩy; -- Unicode' as payload where (917 between 1 and 3000) and 917+1>917;
select 918 as n, (918*3) as score, N'payload 00918 - kiểm thử dấu phẩy; -- Unicode' as payload where (918 between 1 and 3000) and 918+1>918;
select 919 as n, (919*3) as score, N'payload 00919 - kiểm thử dấu phẩy; -- Unicode' as payload where (919 between 1 and 3000) and 919+1>919;
select 920 as n, (920*3) as score, N'payload 00920 - kiểm thử dấu phẩy; -- Unicode' as payload where (920 between 1 and 3000) and 920+1>920;
select 921 as n, (921*3) as score, N'payload 00921 - kiểm thử dấu phẩy; -- Unicode' as payload where (921 between 1 and 3000) and 921+1>921;
select 922 as n, (922*3) as score, N'payload 00922 - kiểm thử dấu phẩy; -- Unicode' as payload where (922 between 1 and 3000) and 922+1>922;
select 923 as n, (923*3) as score, N'payload 00923 - kiểm thử dấu phẩy; -- Unicode' as payload where (923 between 1 and 3000) and 923+1>923;
select 924 as n, (924*3) as score, N'payload 00924 - kiểm thử dấu phẩy; -- Unicode' as payload where (924 between 1 and 3000) and 924+1>924;
select 925 as n, (925*3) as score, N'payload 00925 - kiểm thử dấu phẩy; -- Unicode' as payload where (925 between 1 and 3000) and 925+1>925;
select 926 as n, (926*3) as score, N'payload 00926 - kiểm thử dấu phẩy; -- Unicode' as payload where (926 between 1 and 3000) and 926+1>926;
select 927 as n, (927*3) as score, N'payload 00927 - kiểm thử dấu phẩy; -- Unicode' as payload where (927 between 1 and 3000) and 927+1>927;
select 928 as n, (928*3) as score, N'payload 00928 - kiểm thử dấu phẩy; -- Unicode' as payload where (928 between 1 and 3000) and 928+1>928;
select 929 as n, (929*3) as score, N'payload 00929 - kiểm thử dấu phẩy; -- Unicode' as payload where (929 between 1 and 3000) and 929+1>929;
select 930 as n, (930*3) as score, N'payload 00930 - kiểm thử dấu phẩy; -- Unicode' as payload where (930 between 1 and 3000) and 930+1>930;
select 931 as n, (931*3) as score, N'payload 00931 - kiểm thử dấu phẩy; -- Unicode' as payload where (931 between 1 and 3000) and 931+1>931;
select 932 as n, (932*3) as score, N'payload 00932 - kiểm thử dấu phẩy; -- Unicode' as payload where (932 between 1 and 3000) and 932+1>932;
select 933 as n, (933*3) as score, N'payload 00933 - kiểm thử dấu phẩy; -- Unicode' as payload where (933 between 1 and 3000) and 933+1>933;
select 934 as n, (934*3) as score, N'payload 00934 - kiểm thử dấu phẩy; -- Unicode' as payload where (934 between 1 and 3000) and 934+1>934;
select 935 as n, (935*3) as score, N'payload 00935 - kiểm thử dấu phẩy; -- Unicode' as payload where (935 between 1 and 3000) and 935+1>935;
select 936 as n, (936*3) as score, N'payload 00936 - kiểm thử dấu phẩy; -- Unicode' as payload where (936 between 1 and 3000) and 936+1>936;
select 937 as n, (937*3) as score, N'payload 00937 - kiểm thử dấu phẩy; -- Unicode' as payload where (937 between 1 and 3000) and 937+1>937;
select 938 as n, (938*3) as score, N'payload 00938 - kiểm thử dấu phẩy; -- Unicode' as payload where (938 between 1 and 3000) and 938+1>938;
select 939 as n, (939*3) as score, N'payload 00939 - kiểm thử dấu phẩy; -- Unicode' as payload where (939 between 1 and 3000) and 939+1>939;
select 940 as n, (940*3) as score, N'payload 00940 - kiểm thử dấu phẩy; -- Unicode' as payload where (940 between 1 and 3000) and 940+1>940;
select 941 as n, (941*3) as score, N'payload 00941 - kiểm thử dấu phẩy; -- Unicode' as payload where (941 between 1 and 3000) and 941+1>941;
select 942 as n, (942*3) as score, N'payload 00942 - kiểm thử dấu phẩy; -- Unicode' as payload where (942 between 1 and 3000) and 942+1>942;
select 943 as n, (943*3) as score, N'payload 00943 - kiểm thử dấu phẩy; -- Unicode' as payload where (943 between 1 and 3000) and 943+1>943;
select 944 as n, (944*3) as score, N'payload 00944 - kiểm thử dấu phẩy; -- Unicode' as payload where (944 between 1 and 3000) and 944+1>944;
select 945 as n, (945*3) as score, N'payload 00945 - kiểm thử dấu phẩy; -- Unicode' as payload where (945 between 1 and 3000) and 945+1>945;
select 946 as n, (946*3) as score, N'payload 00946 - kiểm thử dấu phẩy; -- Unicode' as payload where (946 between 1 and 3000) and 946+1>946;
select 947 as n, (947*3) as score, N'payload 00947 - kiểm thử dấu phẩy; -- Unicode' as payload where (947 between 1 and 3000) and 947+1>947;
select 948 as n, (948*3) as score, N'payload 00948 - kiểm thử dấu phẩy; -- Unicode' as payload where (948 between 1 and 3000) and 948+1>948;
select 949 as n, (949*3) as score, N'payload 00949 - kiểm thử dấu phẩy; -- Unicode' as payload where (949 between 1 and 3000) and 949+1>949;
select 950 as n, (950*3) as score, N'payload 00950 - kiểm thử dấu phẩy; -- Unicode' as payload where (950 between 1 and 3000) and 950+1>950;
select 951 as n, (951*3) as score, N'payload 00951 - kiểm thử dấu phẩy; -- Unicode' as payload where (951 between 1 and 3000) and 951+1>951;
select 952 as n, (952*3) as score, N'payload 00952 - kiểm thử dấu phẩy; -- Unicode' as payload where (952 between 1 and 3000) and 952+1>952;
select 953 as n, (953*3) as score, N'payload 00953 - kiểm thử dấu phẩy; -- Unicode' as payload where (953 between 1 and 3000) and 953+1>953;
select 954 as n, (954*3) as score, N'payload 00954 - kiểm thử dấu phẩy; -- Unicode' as payload where (954 between 1 and 3000) and 954+1>954;
select 955 as n, (955*3) as score, N'payload 00955 - kiểm thử dấu phẩy; -- Unicode' as payload where (955 between 1 and 3000) and 955+1>955;
select 956 as n, (956*3) as score, N'payload 00956 - kiểm thử dấu phẩy; -- Unicode' as payload where (956 between 1 and 3000) and 956+1>956;
select 957 as n, (957*3) as score, N'payload 00957 - kiểm thử dấu phẩy; -- Unicode' as payload where (957 between 1 and 3000) and 957+1>957;
select 958 as n, (958*3) as score, N'payload 00958 - kiểm thử dấu phẩy; -- Unicode' as payload where (958 between 1 and 3000) and 958+1>958;
select 959 as n, (959*3) as score, N'payload 00959 - kiểm thử dấu phẩy; -- Unicode' as payload where (959 between 1 and 3000) and 959+1>959;
select 960 as n, (960*3) as score, N'payload 00960 - kiểm thử dấu phẩy; -- Unicode' as payload where (960 between 1 and 3000) and 960+1>960;
select 961 as n, (961*3) as score, N'payload 00961 - kiểm thử dấu phẩy; -- Unicode' as payload where (961 between 1 and 3000) and 961+1>961;
select 962 as n, (962*3) as score, N'payload 00962 - kiểm thử dấu phẩy; -- Unicode' as payload where (962 between 1 and 3000) and 962+1>962;
select 963 as n, (963*3) as score, N'payload 00963 - kiểm thử dấu phẩy; -- Unicode' as payload where (963 between 1 and 3000) and 963+1>963;
select 964 as n, (964*3) as score, N'payload 00964 - kiểm thử dấu phẩy; -- Unicode' as payload where (964 between 1 and 3000) and 964+1>964;
select 965 as n, (965*3) as score, N'payload 00965 - kiểm thử dấu phẩy; -- Unicode' as payload where (965 between 1 and 3000) and 965+1>965;
select 966 as n, (966*3) as score, N'payload 00966 - kiểm thử dấu phẩy; -- Unicode' as payload where (966 between 1 and 3000) and 966+1>966;
select 967 as n, (967*3) as score, N'payload 00967 - kiểm thử dấu phẩy; -- Unicode' as payload where (967 between 1 and 3000) and 967+1>967;
select 968 as n, (968*3) as score, N'payload 00968 - kiểm thử dấu phẩy; -- Unicode' as payload where (968 between 1 and 3000) and 968+1>968;
select 969 as n, (969*3) as score, N'payload 00969 - kiểm thử dấu phẩy; -- Unicode' as payload where (969 between 1 and 3000) and 969+1>969;
select 970 as n, (970*3) as score, N'payload 00970 - kiểm thử dấu phẩy; -- Unicode' as payload where (970 between 1 and 3000) and 970+1>970;
select 971 as n, (971*3) as score, N'payload 00971 - kiểm thử dấu phẩy; -- Unicode' as payload where (971 between 1 and 3000) and 971+1>971;
select 972 as n, (972*3) as score, N'payload 00972 - kiểm thử dấu phẩy; -- Unicode' as payload where (972 between 1 and 3000) and 972+1>972;
select 973 as n, (973*3) as score, N'payload 00973 - kiểm thử dấu phẩy; -- Unicode' as payload where (973 between 1 and 3000) and 973+1>973;
select 974 as n, (974*3) as score, N'payload 00974 - kiểm thử dấu phẩy; -- Unicode' as payload where (974 between 1 and 3000) and 974+1>974;
select 975 as n, (975*3) as score, N'payload 00975 - kiểm thử dấu phẩy; -- Unicode' as payload where (975 between 1 and 3000) and 975+1>975;
select 976 as n, (976*3) as score, N'payload 00976 - kiểm thử dấu phẩy; -- Unicode' as payload where (976 between 1 and 3000) and 976+1>976;
select 977 as n, (977*3) as score, N'payload 00977 - kiểm thử dấu phẩy; -- Unicode' as payload where (977 between 1 and 3000) and 977+1>977;
select 978 as n, (978*3) as score, N'payload 00978 - kiểm thử dấu phẩy; -- Unicode' as payload where (978 between 1 and 3000) and 978+1>978;
select 979 as n, (979*3) as score, N'payload 00979 - kiểm thử dấu phẩy; -- Unicode' as payload where (979 between 1 and 3000) and 979+1>979;
select 980 as n, (980*3) as score, N'payload 00980 - kiểm thử dấu phẩy; -- Unicode' as payload where (980 between 1 and 3000) and 980+1>980;
select 981 as n, (981*3) as score, N'payload 00981 - kiểm thử dấu phẩy; -- Unicode' as payload where (981 between 1 and 3000) and 981+1>981;
select 982 as n, (982*3) as score, N'payload 00982 - kiểm thử dấu phẩy; -- Unicode' as payload where (982 between 1 and 3000) and 982+1>982;
select 983 as n, (983*3) as score, N'payload 00983 - kiểm thử dấu phẩy; -- Unicode' as payload where (983 between 1 and 3000) and 983+1>983;
select 984 as n, (984*3) as score, N'payload 00984 - kiểm thử dấu phẩy; -- Unicode' as payload where (984 between 1 and 3000) and 984+1>984;
select 985 as n, (985*3) as score, N'payload 00985 - kiểm thử dấu phẩy; -- Unicode' as payload where (985 between 1 and 3000) and 985+1>985;
select 986 as n, (986*3) as score, N'payload 00986 - kiểm thử dấu phẩy; -- Unicode' as payload where (986 between 1 and 3000) and 986+1>986;
select 987 as n, (987*3) as score, N'payload 00987 - kiểm thử dấu phẩy; -- Unicode' as payload where (987 between 1 and 3000) and 987+1>987;
select 988 as n, (988*3) as score, N'payload 00988 - kiểm thử dấu phẩy; -- Unicode' as payload where (988 between 1 and 3000) and 988+1>988;
select 989 as n, (989*3) as score, N'payload 00989 - kiểm thử dấu phẩy; -- Unicode' as payload where (989 between 1 and 3000) and 989+1>989;
select 990 as n, (990*3) as score, N'payload 00990 - kiểm thử dấu phẩy; -- Unicode' as payload where (990 between 1 and 3000) and 990+1>990;
select 991 as n, (991*3) as score, N'payload 00991 - kiểm thử dấu phẩy; -- Unicode' as payload where (991 between 1 and 3000) and 991+1>991;
select 992 as n, (992*3) as score, N'payload 00992 - kiểm thử dấu phẩy; -- Unicode' as payload where (992 between 1 and 3000) and 992+1>992;
select 993 as n, (993*3) as score, N'payload 00993 - kiểm thử dấu phẩy; -- Unicode' as payload where (993 between 1 and 3000) and 993+1>993;
select 994 as n, (994*3) as score, N'payload 00994 - kiểm thử dấu phẩy; -- Unicode' as payload where (994 between 1 and 3000) and 994+1>994;
select 995 as n, (995*3) as score, N'payload 00995 - kiểm thử dấu phẩy; -- Unicode' as payload where (995 between 1 and 3000) and 995+1>995;
select 996 as n, (996*3) as score, N'payload 00996 - kiểm thử dấu phẩy; -- Unicode' as payload where (996 between 1 and 3000) and 996+1>996;
select 997 as n, (997*3) as score, N'payload 00997 - kiểm thử dấu phẩy; -- Unicode' as payload where (997 between 1 and 3000) and 997+1>997;
select 998 as n, (998*3) as score, N'payload 00998 - kiểm thử dấu phẩy; -- Unicode' as payload where (998 between 1 and 3000) and 998+1>998;
select 999 as n, (999*3) as score, N'payload 00999 - kiểm thử dấu phẩy; -- Unicode' as payload where (999 between 1 and 3000) and 999+1>999;
select 1000 as n, (1000*3) as score, N'payload 01000 - kiểm thử dấu phẩy; -- Unicode' as payload where (1000 between 1 and 3000) and 1000+1>1000;
select 1001 as n, (1001*3) as score, N'payload 01001 - kiểm thử dấu phẩy; -- Unicode' as payload where (1001 between 1 and 3000) and 1001+1>1001;
select 1002 as n, (1002*3) as score, N'payload 01002 - kiểm thử dấu phẩy; -- Unicode' as payload where (1002 between 1 and 3000) and 1002+1>1002;
select 1003 as n, (1003*3) as score, N'payload 01003 - kiểm thử dấu phẩy; -- Unicode' as payload where (1003 between 1 and 3000) and 1003+1>1003;
select 1004 as n, (1004*3) as score, N'payload 01004 - kiểm thử dấu phẩy; -- Unicode' as payload where (1004 between 1 and 3000) and 1004+1>1004;
select 1005 as n, (1005*3) as score, N'payload 01005 - kiểm thử dấu phẩy; -- Unicode' as payload where (1005 between 1 and 3000) and 1005+1>1005;
select 1006 as n, (1006*3) as score, N'payload 01006 - kiểm thử dấu phẩy; -- Unicode' as payload where (1006 between 1 and 3000) and 1006+1>1006;
select 1007 as n, (1007*3) as score, N'payload 01007 - kiểm thử dấu phẩy; -- Unicode' as payload where (1007 between 1 and 3000) and 1007+1>1007;
select 1008 as n, (1008*3) as score, N'payload 01008 - kiểm thử dấu phẩy; -- Unicode' as payload where (1008 between 1 and 3000) and 1008+1>1008;
select 1009 as n, (1009*3) as score, N'payload 01009 - kiểm thử dấu phẩy; -- Unicode' as payload where (1009 between 1 and 3000) and 1009+1>1009;
select 1010 as n, (1010*3) as score, N'payload 01010 - kiểm thử dấu phẩy; -- Unicode' as payload where (1010 between 1 and 3000) and 1010+1>1010;
select 1011 as n, (1011*3) as score, N'payload 01011 - kiểm thử dấu phẩy; -- Unicode' as payload where (1011 between 1 and 3000) and 1011+1>1011;
select 1012 as n, (1012*3) as score, N'payload 01012 - kiểm thử dấu phẩy; -- Unicode' as payload where (1012 between 1 and 3000) and 1012+1>1012;
select 1013 as n, (1013*3) as score, N'payload 01013 - kiểm thử dấu phẩy; -- Unicode' as payload where (1013 between 1 and 3000) and 1013+1>1013;
select 1014 as n, (1014*3) as score, N'payload 01014 - kiểm thử dấu phẩy; -- Unicode' as payload where (1014 between 1 and 3000) and 1014+1>1014;
select 1015 as n, (1015*3) as score, N'payload 01015 - kiểm thử dấu phẩy; -- Unicode' as payload where (1015 between 1 and 3000) and 1015+1>1015;
select 1016 as n, (1016*3) as score, N'payload 01016 - kiểm thử dấu phẩy; -- Unicode' as payload where (1016 between 1 and 3000) and 1016+1>1016;
select 1017 as n, (1017*3) as score, N'payload 01017 - kiểm thử dấu phẩy; -- Unicode' as payload where (1017 between 1 and 3000) and 1017+1>1017;
select 1018 as n, (1018*3) as score, N'payload 01018 - kiểm thử dấu phẩy; -- Unicode' as payload where (1018 between 1 and 3000) and 1018+1>1018;
select 1019 as n, (1019*3) as score, N'payload 01019 - kiểm thử dấu phẩy; -- Unicode' as payload where (1019 between 1 and 3000) and 1019+1>1019;
select 1020 as n, (1020*3) as score, N'payload 01020 - kiểm thử dấu phẩy; -- Unicode' as payload where (1020 between 1 and 3000) and 1020+1>1020;
select 1021 as n, (1021*3) as score, N'payload 01021 - kiểm thử dấu phẩy; -- Unicode' as payload where (1021 between 1 and 3000) and 1021+1>1021;
select 1022 as n, (1022*3) as score, N'payload 01022 - kiểm thử dấu phẩy; -- Unicode' as payload where (1022 between 1 and 3000) and 1022+1>1022;
select 1023 as n, (1023*3) as score, N'payload 01023 - kiểm thử dấu phẩy; -- Unicode' as payload where (1023 between 1 and 3000) and 1023+1>1023;
select 1024 as n, (1024*3) as score, N'payload 01024 - kiểm thử dấu phẩy; -- Unicode' as payload where (1024 between 1 and 3000) and 1024+1>1024;
select 1025 as n, (1025*3) as score, N'payload 01025 - kiểm thử dấu phẩy; -- Unicode' as payload where (1025 between 1 and 3000) and 1025+1>1025;
select 1026 as n, (1026*3) as score, N'payload 01026 - kiểm thử dấu phẩy; -- Unicode' as payload where (1026 between 1 and 3000) and 1026+1>1026;
select 1027 as n, (1027*3) as score, N'payload 01027 - kiểm thử dấu phẩy; -- Unicode' as payload where (1027 between 1 and 3000) and 1027+1>1027;
select 1028 as n, (1028*3) as score, N'payload 01028 - kiểm thử dấu phẩy; -- Unicode' as payload where (1028 between 1 and 3000) and 1028+1>1028;
select 1029 as n, (1029*3) as score, N'payload 01029 - kiểm thử dấu phẩy; -- Unicode' as payload where (1029 between 1 and 3000) and 1029+1>1029;
select 1030 as n, (1030*3) as score, N'payload 01030 - kiểm thử dấu phẩy; -- Unicode' as payload where (1030 between 1 and 3000) and 1030+1>1030;
select 1031 as n, (1031*3) as score, N'payload 01031 - kiểm thử dấu phẩy; -- Unicode' as payload where (1031 between 1 and 3000) and 1031+1>1031;
select 1032 as n, (1032*3) as score, N'payload 01032 - kiểm thử dấu phẩy; -- Unicode' as payload where (1032 between 1 and 3000) and 1032+1>1032;
select 1033 as n, (1033*3) as score, N'payload 01033 - kiểm thử dấu phẩy; -- Unicode' as payload where (1033 between 1 and 3000) and 1033+1>1033;
select 1034 as n, (1034*3) as score, N'payload 01034 - kiểm thử dấu phẩy; -- Unicode' as payload where (1034 between 1 and 3000) and 1034+1>1034;
select 1035 as n, (1035*3) as score, N'payload 01035 - kiểm thử dấu phẩy; -- Unicode' as payload where (1035 between 1 and 3000) and 1035+1>1035;
select 1036 as n, (1036*3) as score, N'payload 01036 - kiểm thử dấu phẩy; -- Unicode' as payload where (1036 between 1 and 3000) and 1036+1>1036;
select 1037 as n, (1037*3) as score, N'payload 01037 - kiểm thử dấu phẩy; -- Unicode' as payload where (1037 between 1 and 3000) and 1037+1>1037;
select 1038 as n, (1038*3) as score, N'payload 01038 - kiểm thử dấu phẩy; -- Unicode' as payload where (1038 between 1 and 3000) and 1038+1>1038;
select 1039 as n, (1039*3) as score, N'payload 01039 - kiểm thử dấu phẩy; -- Unicode' as payload where (1039 between 1 and 3000) and 1039+1>1039;
select 1040 as n, (1040*3) as score, N'payload 01040 - kiểm thử dấu phẩy; -- Unicode' as payload where (1040 between 1 and 3000) and 1040+1>1040;
select 1041 as n, (1041*3) as score, N'payload 01041 - kiểm thử dấu phẩy; -- Unicode' as payload where (1041 between 1 and 3000) and 1041+1>1041;
select 1042 as n, (1042*3) as score, N'payload 01042 - kiểm thử dấu phẩy; -- Unicode' as payload where (1042 between 1 and 3000) and 1042+1>1042;
select 1043 as n, (1043*3) as score, N'payload 01043 - kiểm thử dấu phẩy; -- Unicode' as payload where (1043 between 1 and 3000) and 1043+1>1043;
select 1044 as n, (1044*3) as score, N'payload 01044 - kiểm thử dấu phẩy; -- Unicode' as payload where (1044 between 1 and 3000) and 1044+1>1044;
select 1045 as n, (1045*3) as score, N'payload 01045 - kiểm thử dấu phẩy; -- Unicode' as payload where (1045 between 1 and 3000) and 1045+1>1045;
select 1046 as n, (1046*3) as score, N'payload 01046 - kiểm thử dấu phẩy; -- Unicode' as payload where (1046 between 1 and 3000) and 1046+1>1046;
select 1047 as n, (1047*3) as score, N'payload 01047 - kiểm thử dấu phẩy; -- Unicode' as payload where (1047 between 1 and 3000) and 1047+1>1047;
select 1048 as n, (1048*3) as score, N'payload 01048 - kiểm thử dấu phẩy; -- Unicode' as payload where (1048 between 1 and 3000) and 1048+1>1048;
select 1049 as n, (1049*3) as score, N'payload 01049 - kiểm thử dấu phẩy; -- Unicode' as payload where (1049 between 1 and 3000) and 1049+1>1049;
select 1050 as n, (1050*3) as score, N'payload 01050 - kiểm thử dấu phẩy; -- Unicode' as payload where (1050 between 1 and 3000) and 1050+1>1050;
select 1051 as n, (1051*3) as score, N'payload 01051 - kiểm thử dấu phẩy; -- Unicode' as payload where (1051 between 1 and 3000) and 1051+1>1051;
select 1052 as n, (1052*3) as score, N'payload 01052 - kiểm thử dấu phẩy; -- Unicode' as payload where (1052 between 1 and 3000) and 1052+1>1052;
select 1053 as n, (1053*3) as score, N'payload 01053 - kiểm thử dấu phẩy; -- Unicode' as payload where (1053 between 1 and 3000) and 1053+1>1053;
select 1054 as n, (1054*3) as score, N'payload 01054 - kiểm thử dấu phẩy; -- Unicode' as payload where (1054 between 1 and 3000) and 1054+1>1054;
select 1055 as n, (1055*3) as score, N'payload 01055 - kiểm thử dấu phẩy; -- Unicode' as payload where (1055 between 1 and 3000) and 1055+1>1055;
select 1056 as n, (1056*3) as score, N'payload 01056 - kiểm thử dấu phẩy; -- Unicode' as payload where (1056 between 1 and 3000) and 1056+1>1056;
select 1057 as n, (1057*3) as score, N'payload 01057 - kiểm thử dấu phẩy; -- Unicode' as payload where (1057 between 1 and 3000) and 1057+1>1057;
select 1058 as n, (1058*3) as score, N'payload 01058 - kiểm thử dấu phẩy; -- Unicode' as payload where (1058 between 1 and 3000) and 1058+1>1058;
select 1059 as n, (1059*3) as score, N'payload 01059 - kiểm thử dấu phẩy; -- Unicode' as payload where (1059 between 1 and 3000) and 1059+1>1059;
select 1060 as n, (1060*3) as score, N'payload 01060 - kiểm thử dấu phẩy; -- Unicode' as payload where (1060 between 1 and 3000) and 1060+1>1060;
select 1061 as n, (1061*3) as score, N'payload 01061 - kiểm thử dấu phẩy; -- Unicode' as payload where (1061 between 1 and 3000) and 1061+1>1061;
select 1062 as n, (1062*3) as score, N'payload 01062 - kiểm thử dấu phẩy; -- Unicode' as payload where (1062 between 1 and 3000) and 1062+1>1062;
select 1063 as n, (1063*3) as score, N'payload 01063 - kiểm thử dấu phẩy; -- Unicode' as payload where (1063 between 1 and 3000) and 1063+1>1063;
select 1064 as n, (1064*3) as score, N'payload 01064 - kiểm thử dấu phẩy; -- Unicode' as payload where (1064 between 1 and 3000) and 1064+1>1064;
select 1065 as n, (1065*3) as score, N'payload 01065 - kiểm thử dấu phẩy; -- Unicode' as payload where (1065 between 1 and 3000) and 1065+1>1065;
select 1066 as n, (1066*3) as score, N'payload 01066 - kiểm thử dấu phẩy; -- Unicode' as payload where (1066 between 1 and 3000) and 1066+1>1066;
select 1067 as n, (1067*3) as score, N'payload 01067 - kiểm thử dấu phẩy; -- Unicode' as payload where (1067 between 1 and 3000) and 1067+1>1067;
select 1068 as n, (1068*3) as score, N'payload 01068 - kiểm thử dấu phẩy; -- Unicode' as payload where (1068 between 1 and 3000) and 1068+1>1068;
select 1069 as n, (1069*3) as score, N'payload 01069 - kiểm thử dấu phẩy; -- Unicode' as payload where (1069 between 1 and 3000) and 1069+1>1069;
select 1070 as n, (1070*3) as score, N'payload 01070 - kiểm thử dấu phẩy; -- Unicode' as payload where (1070 between 1 and 3000) and 1070+1>1070;
select 1071 as n, (1071*3) as score, N'payload 01071 - kiểm thử dấu phẩy; -- Unicode' as payload where (1071 between 1 and 3000) and 1071+1>1071;
select 1072 as n, (1072*3) as score, N'payload 01072 - kiểm thử dấu phẩy; -- Unicode' as payload where (1072 between 1 and 3000) and 1072+1>1072;
select 1073 as n, (1073*3) as score, N'payload 01073 - kiểm thử dấu phẩy; -- Unicode' as payload where (1073 between 1 and 3000) and 1073+1>1073;
select 1074 as n, (1074*3) as score, N'payload 01074 - kiểm thử dấu phẩy; -- Unicode' as payload where (1074 between 1 and 3000) and 1074+1>1074;
select 1075 as n, (1075*3) as score, N'payload 01075 - kiểm thử dấu phẩy; -- Unicode' as payload where (1075 between 1 and 3000) and 1075+1>1075;
select 1076 as n, (1076*3) as score, N'payload 01076 - kiểm thử dấu phẩy; -- Unicode' as payload where (1076 between 1 and 3000) and 1076+1>1076;
select 1077 as n, (1077*3) as score, N'payload 01077 - kiểm thử dấu phẩy; -- Unicode' as payload where (1077 between 1 and 3000) and 1077+1>1077;
select 1078 as n, (1078*3) as score, N'payload 01078 - kiểm thử dấu phẩy; -- Unicode' as payload where (1078 between 1 and 3000) and 1078+1>1078;
select 1079 as n, (1079*3) as score, N'payload 01079 - kiểm thử dấu phẩy; -- Unicode' as payload where (1079 between 1 and 3000) and 1079+1>1079;
select 1080 as n, (1080*3) as score, N'payload 01080 - kiểm thử dấu phẩy; -- Unicode' as payload where (1080 between 1 and 3000) and 1080+1>1080;
select 1081 as n, (1081*3) as score, N'payload 01081 - kiểm thử dấu phẩy; -- Unicode' as payload where (1081 between 1 and 3000) and 1081+1>1081;
select 1082 as n, (1082*3) as score, N'payload 01082 - kiểm thử dấu phẩy; -- Unicode' as payload where (1082 between 1 and 3000) and 1082+1>1082;
select 1083 as n, (1083*3) as score, N'payload 01083 - kiểm thử dấu phẩy; -- Unicode' as payload where (1083 between 1 and 3000) and 1083+1>1083;
select 1084 as n, (1084*3) as score, N'payload 01084 - kiểm thử dấu phẩy; -- Unicode' as payload where (1084 between 1 and 3000) and 1084+1>1084;
select 1085 as n, (1085*3) as score, N'payload 01085 - kiểm thử dấu phẩy; -- Unicode' as payload where (1085 between 1 and 3000) and 1085+1>1085;
select 1086 as n, (1086*3) as score, N'payload 01086 - kiểm thử dấu phẩy; -- Unicode' as payload where (1086 between 1 and 3000) and 1086+1>1086;
select 1087 as n, (1087*3) as score, N'payload 01087 - kiểm thử dấu phẩy; -- Unicode' as payload where (1087 between 1 and 3000) and 1087+1>1087;
select 1088 as n, (1088*3) as score, N'payload 01088 - kiểm thử dấu phẩy; -- Unicode' as payload where (1088 between 1 and 3000) and 1088+1>1088;
select 1089 as n, (1089*3) as score, N'payload 01089 - kiểm thử dấu phẩy; -- Unicode' as payload where (1089 between 1 and 3000) and 1089+1>1089;
select 1090 as n, (1090*3) as score, N'payload 01090 - kiểm thử dấu phẩy; -- Unicode' as payload where (1090 between 1 and 3000) and 1090+1>1090;
select 1091 as n, (1091*3) as score, N'payload 01091 - kiểm thử dấu phẩy; -- Unicode' as payload where (1091 between 1 and 3000) and 1091+1>1091;
select 1092 as n, (1092*3) as score, N'payload 01092 - kiểm thử dấu phẩy; -- Unicode' as payload where (1092 between 1 and 3000) and 1092+1>1092;
select 1093 as n, (1093*3) as score, N'payload 01093 - kiểm thử dấu phẩy; -- Unicode' as payload where (1093 between 1 and 3000) and 1093+1>1093;
select 1094 as n, (1094*3) as score, N'payload 01094 - kiểm thử dấu phẩy; -- Unicode' as payload where (1094 between 1 and 3000) and 1094+1>1094;
select 1095 as n, (1095*3) as score, N'payload 01095 - kiểm thử dấu phẩy; -- Unicode' as payload where (1095 between 1 and 3000) and 1095+1>1095;
select 1096 as n, (1096*3) as score, N'payload 01096 - kiểm thử dấu phẩy; -- Unicode' as payload where (1096 between 1 and 3000) and 1096+1>1096;
select 1097 as n, (1097*3) as score, N'payload 01097 - kiểm thử dấu phẩy; -- Unicode' as payload where (1097 between 1 and 3000) and 1097+1>1097;
select 1098 as n, (1098*3) as score, N'payload 01098 - kiểm thử dấu phẩy; -- Unicode' as payload where (1098 between 1 and 3000) and 1098+1>1098;
select 1099 as n, (1099*3) as score, N'payload 01099 - kiểm thử dấu phẩy; -- Unicode' as payload where (1099 between 1 and 3000) and 1099+1>1099;
select 1100 as n, (1100*3) as score, N'payload 01100 - kiểm thử dấu phẩy; -- Unicode' as payload where (1100 between 1 and 3000) and 1100+1>1100;
select 1101 as n, (1101*3) as score, N'payload 01101 - kiểm thử dấu phẩy; -- Unicode' as payload where (1101 between 1 and 3000) and 1101+1>1101;
select 1102 as n, (1102*3) as score, N'payload 01102 - kiểm thử dấu phẩy; -- Unicode' as payload where (1102 between 1 and 3000) and 1102+1>1102;
select 1103 as n, (1103*3) as score, N'payload 01103 - kiểm thử dấu phẩy; -- Unicode' as payload where (1103 between 1 and 3000) and 1103+1>1103;
select 1104 as n, (1104*3) as score, N'payload 01104 - kiểm thử dấu phẩy; -- Unicode' as payload where (1104 between 1 and 3000) and 1104+1>1104;
select 1105 as n, (1105*3) as score, N'payload 01105 - kiểm thử dấu phẩy; -- Unicode' as payload where (1105 between 1 and 3000) and 1105+1>1105;
select 1106 as n, (1106*3) as score, N'payload 01106 - kiểm thử dấu phẩy; -- Unicode' as payload where (1106 between 1 and 3000) and 1106+1>1106;
select 1107 as n, (1107*3) as score, N'payload 01107 - kiểm thử dấu phẩy; -- Unicode' as payload where (1107 between 1 and 3000) and 1107+1>1107;
select 1108 as n, (1108*3) as score, N'payload 01108 - kiểm thử dấu phẩy; -- Unicode' as payload where (1108 between 1 and 3000) and 1108+1>1108;
select 1109 as n, (1109*3) as score, N'payload 01109 - kiểm thử dấu phẩy; -- Unicode' as payload where (1109 between 1 and 3000) and 1109+1>1109;
select 1110 as n, (1110*3) as score, N'payload 01110 - kiểm thử dấu phẩy; -- Unicode' as payload where (1110 between 1 and 3000) and 1110+1>1110;
select 1111 as n, (1111*3) as score, N'payload 01111 - kiểm thử dấu phẩy; -- Unicode' as payload where (1111 between 1 and 3000) and 1111+1>1111;
select 1112 as n, (1112*3) as score, N'payload 01112 - kiểm thử dấu phẩy; -- Unicode' as payload where (1112 between 1 and 3000) and 1112+1>1112;
select 1113 as n, (1113*3) as score, N'payload 01113 - kiểm thử dấu phẩy; -- Unicode' as payload where (1113 between 1 and 3000) and 1113+1>1113;
select 1114 as n, (1114*3) as score, N'payload 01114 - kiểm thử dấu phẩy; -- Unicode' as payload where (1114 between 1 and 3000) and 1114+1>1114;
select 1115 as n, (1115*3) as score, N'payload 01115 - kiểm thử dấu phẩy; -- Unicode' as payload where (1115 between 1 and 3000) and 1115+1>1115;
select 1116 as n, (1116*3) as score, N'payload 01116 - kiểm thử dấu phẩy; -- Unicode' as payload where (1116 between 1 and 3000) and 1116+1>1116;
select 1117 as n, (1117*3) as score, N'payload 01117 - kiểm thử dấu phẩy; -- Unicode' as payload where (1117 between 1 and 3000) and 1117+1>1117;
select 1118 as n, (1118*3) as score, N'payload 01118 - kiểm thử dấu phẩy; -- Unicode' as payload where (1118 between 1 and 3000) and 1118+1>1118;
select 1119 as n, (1119*3) as score, N'payload 01119 - kiểm thử dấu phẩy; -- Unicode' as payload where (1119 between 1 and 3000) and 1119+1>1119;
select 1120 as n, (1120*3) as score, N'payload 01120 - kiểm thử dấu phẩy; -- Unicode' as payload where (1120 between 1 and 3000) and 1120+1>1120;
select 1121 as n, (1121*3) as score, N'payload 01121 - kiểm thử dấu phẩy; -- Unicode' as payload where (1121 between 1 and 3000) and 1121+1>1121;
select 1122 as n, (1122*3) as score, N'payload 01122 - kiểm thử dấu phẩy; -- Unicode' as payload where (1122 between 1 and 3000) and 1122+1>1122;
select 1123 as n, (1123*3) as score, N'payload 01123 - kiểm thử dấu phẩy; -- Unicode' as payload where (1123 between 1 and 3000) and 1123+1>1123;
select 1124 as n, (1124*3) as score, N'payload 01124 - kiểm thử dấu phẩy; -- Unicode' as payload where (1124 between 1 and 3000) and 1124+1>1124;
select 1125 as n, (1125*3) as score, N'payload 01125 - kiểm thử dấu phẩy; -- Unicode' as payload where (1125 between 1 and 3000) and 1125+1>1125;
select 1126 as n, (1126*3) as score, N'payload 01126 - kiểm thử dấu phẩy; -- Unicode' as payload where (1126 between 1 and 3000) and 1126+1>1126;
select 1127 as n, (1127*3) as score, N'payload 01127 - kiểm thử dấu phẩy; -- Unicode' as payload where (1127 between 1 and 3000) and 1127+1>1127;
select 1128 as n, (1128*3) as score, N'payload 01128 - kiểm thử dấu phẩy; -- Unicode' as payload where (1128 between 1 and 3000) and 1128+1>1128;
select 1129 as n, (1129*3) as score, N'payload 01129 - kiểm thử dấu phẩy; -- Unicode' as payload where (1129 between 1 and 3000) and 1129+1>1129;
select 1130 as n, (1130*3) as score, N'payload 01130 - kiểm thử dấu phẩy; -- Unicode' as payload where (1130 between 1 and 3000) and 1130+1>1130;
select 1131 as n, (1131*3) as score, N'payload 01131 - kiểm thử dấu phẩy; -- Unicode' as payload where (1131 between 1 and 3000) and 1131+1>1131;
select 1132 as n, (1132*3) as score, N'payload 01132 - kiểm thử dấu phẩy; -- Unicode' as payload where (1132 between 1 and 3000) and 1132+1>1132;
select 1133 as n, (1133*3) as score, N'payload 01133 - kiểm thử dấu phẩy; -- Unicode' as payload where (1133 between 1 and 3000) and 1133+1>1133;
select 1134 as n, (1134*3) as score, N'payload 01134 - kiểm thử dấu phẩy; -- Unicode' as payload where (1134 between 1 and 3000) and 1134+1>1134;
select 1135 as n, (1135*3) as score, N'payload 01135 - kiểm thử dấu phẩy; -- Unicode' as payload where (1135 between 1 and 3000) and 1135+1>1135;
select 1136 as n, (1136*3) as score, N'payload 01136 - kiểm thử dấu phẩy; -- Unicode' as payload where (1136 between 1 and 3000) and 1136+1>1136;
select 1137 as n, (1137*3) as score, N'payload 01137 - kiểm thử dấu phẩy; -- Unicode' as payload where (1137 between 1 and 3000) and 1137+1>1137;
select 1138 as n, (1138*3) as score, N'payload 01138 - kiểm thử dấu phẩy; -- Unicode' as payload where (1138 between 1 and 3000) and 1138+1>1138;
select 1139 as n, (1139*3) as score, N'payload 01139 - kiểm thử dấu phẩy; -- Unicode' as payload where (1139 between 1 and 3000) and 1139+1>1139;
select 1140 as n, (1140*3) as score, N'payload 01140 - kiểm thử dấu phẩy; -- Unicode' as payload where (1140 between 1 and 3000) and 1140+1>1140;
select 1141 as n, (1141*3) as score, N'payload 01141 - kiểm thử dấu phẩy; -- Unicode' as payload where (1141 between 1 and 3000) and 1141+1>1141;
select 1142 as n, (1142*3) as score, N'payload 01142 - kiểm thử dấu phẩy; -- Unicode' as payload where (1142 between 1 and 3000) and 1142+1>1142;
select 1143 as n, (1143*3) as score, N'payload 01143 - kiểm thử dấu phẩy; -- Unicode' as payload where (1143 between 1 and 3000) and 1143+1>1143;
select 1144 as n, (1144*3) as score, N'payload 01144 - kiểm thử dấu phẩy; -- Unicode' as payload where (1144 between 1 and 3000) and 1144+1>1144;
select 1145 as n, (1145*3) as score, N'payload 01145 - kiểm thử dấu phẩy; -- Unicode' as payload where (1145 between 1 and 3000) and 1145+1>1145;
select 1146 as n, (1146*3) as score, N'payload 01146 - kiểm thử dấu phẩy; -- Unicode' as payload where (1146 between 1 and 3000) and 1146+1>1146;
select 1147 as n, (1147*3) as score, N'payload 01147 - kiểm thử dấu phẩy; -- Unicode' as payload where (1147 between 1 and 3000) and 1147+1>1147;
select 1148 as n, (1148*3) as score, N'payload 01148 - kiểm thử dấu phẩy; -- Unicode' as payload where (1148 between 1 and 3000) and 1148+1>1148;
select 1149 as n, (1149*3) as score, N'payload 01149 - kiểm thử dấu phẩy; -- Unicode' as payload where (1149 between 1 and 3000) and 1149+1>1149;
select 1150 as n, (1150*3) as score, N'payload 01150 - kiểm thử dấu phẩy; -- Unicode' as payload where (1150 between 1 and 3000) and 1150+1>1150;
select 1151 as n, (1151*3) as score, N'payload 01151 - kiểm thử dấu phẩy; -- Unicode' as payload where (1151 between 1 and 3000) and 1151+1>1151;
select 1152 as n, (1152*3) as score, N'payload 01152 - kiểm thử dấu phẩy; -- Unicode' as payload where (1152 between 1 and 3000) and 1152+1>1152;
select 1153 as n, (1153*3) as score, N'payload 01153 - kiểm thử dấu phẩy; -- Unicode' as payload where (1153 between 1 and 3000) and 1153+1>1153;
select 1154 as n, (1154*3) as score, N'payload 01154 - kiểm thử dấu phẩy; -- Unicode' as payload where (1154 between 1 and 3000) and 1154+1>1154;
select 1155 as n, (1155*3) as score, N'payload 01155 - kiểm thử dấu phẩy; -- Unicode' as payload where (1155 between 1 and 3000) and 1155+1>1155;
select 1156 as n, (1156*3) as score, N'payload 01156 - kiểm thử dấu phẩy; -- Unicode' as payload where (1156 between 1 and 3000) and 1156+1>1156;
select 1157 as n, (1157*3) as score, N'payload 01157 - kiểm thử dấu phẩy; -- Unicode' as payload where (1157 between 1 and 3000) and 1157+1>1157;
select 1158 as n, (1158*3) as score, N'payload 01158 - kiểm thử dấu phẩy; -- Unicode' as payload where (1158 between 1 and 3000) and 1158+1>1158;
select 1159 as n, (1159*3) as score, N'payload 01159 - kiểm thử dấu phẩy; -- Unicode' as payload where (1159 between 1 and 3000) and 1159+1>1159;
select 1160 as n, (1160*3) as score, N'payload 01160 - kiểm thử dấu phẩy; -- Unicode' as payload where (1160 between 1 and 3000) and 1160+1>1160;
select 1161 as n, (1161*3) as score, N'payload 01161 - kiểm thử dấu phẩy; -- Unicode' as payload where (1161 between 1 and 3000) and 1161+1>1161;
select 1162 as n, (1162*3) as score, N'payload 01162 - kiểm thử dấu phẩy; -- Unicode' as payload where (1162 between 1 and 3000) and 1162+1>1162;
select 1163 as n, (1163*3) as score, N'payload 01163 - kiểm thử dấu phẩy; -- Unicode' as payload where (1163 between 1 and 3000) and 1163+1>1163;
select 1164 as n, (1164*3) as score, N'payload 01164 - kiểm thử dấu phẩy; -- Unicode' as payload where (1164 between 1 and 3000) and 1164+1>1164;
select 1165 as n, (1165*3) as score, N'payload 01165 - kiểm thử dấu phẩy; -- Unicode' as payload where (1165 between 1 and 3000) and 1165+1>1165;
select 1166 as n, (1166*3) as score, N'payload 01166 - kiểm thử dấu phẩy; -- Unicode' as payload where (1166 between 1 and 3000) and 1166+1>1166;
select 1167 as n, (1167*3) as score, N'payload 01167 - kiểm thử dấu phẩy; -- Unicode' as payload where (1167 between 1 and 3000) and 1167+1>1167;
select 1168 as n, (1168*3) as score, N'payload 01168 - kiểm thử dấu phẩy; -- Unicode' as payload where (1168 between 1 and 3000) and 1168+1>1168;
select 1169 as n, (1169*3) as score, N'payload 01169 - kiểm thử dấu phẩy; -- Unicode' as payload where (1169 between 1 and 3000) and 1169+1>1169;
select 1170 as n, (1170*3) as score, N'payload 01170 - kiểm thử dấu phẩy; -- Unicode' as payload where (1170 between 1 and 3000) and 1170+1>1170;
select 1171 as n, (1171*3) as score, N'payload 01171 - kiểm thử dấu phẩy; -- Unicode' as payload where (1171 between 1 and 3000) and 1171+1>1171;
select 1172 as n, (1172*3) as score, N'payload 01172 - kiểm thử dấu phẩy; -- Unicode' as payload where (1172 between 1 and 3000) and 1172+1>1172;
select 1173 as n, (1173*3) as score, N'payload 01173 - kiểm thử dấu phẩy; -- Unicode' as payload where (1173 between 1 and 3000) and 1173+1>1173;
select 1174 as n, (1174*3) as score, N'payload 01174 - kiểm thử dấu phẩy; -- Unicode' as payload where (1174 between 1 and 3000) and 1174+1>1174;
select 1175 as n, (1175*3) as score, N'payload 01175 - kiểm thử dấu phẩy; -- Unicode' as payload where (1175 between 1 and 3000) and 1175+1>1175;
select 1176 as n, (1176*3) as score, N'payload 01176 - kiểm thử dấu phẩy; -- Unicode' as payload where (1176 between 1 and 3000) and 1176+1>1176;
select 1177 as n, (1177*3) as score, N'payload 01177 - kiểm thử dấu phẩy; -- Unicode' as payload where (1177 between 1 and 3000) and 1177+1>1177;
select 1178 as n, (1178*3) as score, N'payload 01178 - kiểm thử dấu phẩy; -- Unicode' as payload where (1178 between 1 and 3000) and 1178+1>1178;
select 1179 as n, (1179*3) as score, N'payload 01179 - kiểm thử dấu phẩy; -- Unicode' as payload where (1179 between 1 and 3000) and 1179+1>1179;
select 1180 as n, (1180*3) as score, N'payload 01180 - kiểm thử dấu phẩy; -- Unicode' as payload where (1180 between 1 and 3000) and 1180+1>1180;
select 1181 as n, (1181*3) as score, N'payload 01181 - kiểm thử dấu phẩy; -- Unicode' as payload where (1181 between 1 and 3000) and 1181+1>1181;
select 1182 as n, (1182*3) as score, N'payload 01182 - kiểm thử dấu phẩy; -- Unicode' as payload where (1182 between 1 and 3000) and 1182+1>1182;
select 1183 as n, (1183*3) as score, N'payload 01183 - kiểm thử dấu phẩy; -- Unicode' as payload where (1183 between 1 and 3000) and 1183+1>1183;
select 1184 as n, (1184*3) as score, N'payload 01184 - kiểm thử dấu phẩy; -- Unicode' as payload where (1184 between 1 and 3000) and 1184+1>1184;
select 1185 as n, (1185*3) as score, N'payload 01185 - kiểm thử dấu phẩy; -- Unicode' as payload where (1185 between 1 and 3000) and 1185+1>1185;
select 1186 as n, (1186*3) as score, N'payload 01186 - kiểm thử dấu phẩy; -- Unicode' as payload where (1186 between 1 and 3000) and 1186+1>1186;
select 1187 as n, (1187*3) as score, N'payload 01187 - kiểm thử dấu phẩy; -- Unicode' as payload where (1187 between 1 and 3000) and 1187+1>1187;
select 1188 as n, (1188*3) as score, N'payload 01188 - kiểm thử dấu phẩy; -- Unicode' as payload where (1188 between 1 and 3000) and 1188+1>1188;
select 1189 as n, (1189*3) as score, N'payload 01189 - kiểm thử dấu phẩy; -- Unicode' as payload where (1189 between 1 and 3000) and 1189+1>1189;
select 1190 as n, (1190*3) as score, N'payload 01190 - kiểm thử dấu phẩy; -- Unicode' as payload where (1190 between 1 and 3000) and 1190+1>1190;
select 1191 as n, (1191*3) as score, N'payload 01191 - kiểm thử dấu phẩy; -- Unicode' as payload where (1191 between 1 and 3000) and 1191+1>1191;
select 1192 as n, (1192*3) as score, N'payload 01192 - kiểm thử dấu phẩy; -- Unicode' as payload where (1192 between 1 and 3000) and 1192+1>1192;
select 1193 as n, (1193*3) as score, N'payload 01193 - kiểm thử dấu phẩy; -- Unicode' as payload where (1193 between 1 and 3000) and 1193+1>1193;
select 1194 as n, (1194*3) as score, N'payload 01194 - kiểm thử dấu phẩy; -- Unicode' as payload where (1194 between 1 and 3000) and 1194+1>1194;
select 1195 as n, (1195*3) as score, N'payload 01195 - kiểm thử dấu phẩy; -- Unicode' as payload where (1195 between 1 and 3000) and 1195+1>1195;
select 1196 as n, (1196*3) as score, N'payload 01196 - kiểm thử dấu phẩy; -- Unicode' as payload where (1196 between 1 and 3000) and 1196+1>1196;
select 1197 as n, (1197*3) as score, N'payload 01197 - kiểm thử dấu phẩy; -- Unicode' as payload where (1197 between 1 and 3000) and 1197+1>1197;
select 1198 as n, (1198*3) as score, N'payload 01198 - kiểm thử dấu phẩy; -- Unicode' as payload where (1198 between 1 and 3000) and 1198+1>1198;
select 1199 as n, (1199*3) as score, N'payload 01199 - kiểm thử dấu phẩy; -- Unicode' as payload where (1199 between 1 and 3000) and 1199+1>1199;
select 1200 as n, (1200*3) as score, N'payload 01200 - kiểm thử dấu phẩy; -- Unicode' as payload where (1200 between 1 and 3000) and 1200+1>1200;
select 1201 as n, (1201*3) as score, N'payload 01201 - kiểm thử dấu phẩy; -- Unicode' as payload where (1201 between 1 and 3000) and 1201+1>1201;
select 1202 as n, (1202*3) as score, N'payload 01202 - kiểm thử dấu phẩy; -- Unicode' as payload where (1202 between 1 and 3000) and 1202+1>1202;
select 1203 as n, (1203*3) as score, N'payload 01203 - kiểm thử dấu phẩy; -- Unicode' as payload where (1203 between 1 and 3000) and 1203+1>1203;
select 1204 as n, (1204*3) as score, N'payload 01204 - kiểm thử dấu phẩy; -- Unicode' as payload where (1204 between 1 and 3000) and 1204+1>1204;
select 1205 as n, (1205*3) as score, N'payload 01205 - kiểm thử dấu phẩy; -- Unicode' as payload where (1205 between 1 and 3000) and 1205+1>1205;
select 1206 as n, (1206*3) as score, N'payload 01206 - kiểm thử dấu phẩy; -- Unicode' as payload where (1206 between 1 and 3000) and 1206+1>1206;
select 1207 as n, (1207*3) as score, N'payload 01207 - kiểm thử dấu phẩy; -- Unicode' as payload where (1207 between 1 and 3000) and 1207+1>1207;
select 1208 as n, (1208*3) as score, N'payload 01208 - kiểm thử dấu phẩy; -- Unicode' as payload where (1208 between 1 and 3000) and 1208+1>1208;
select 1209 as n, (1209*3) as score, N'payload 01209 - kiểm thử dấu phẩy; -- Unicode' as payload where (1209 between 1 and 3000) and 1209+1>1209;
select 1210 as n, (1210*3) as score, N'payload 01210 - kiểm thử dấu phẩy; -- Unicode' as payload where (1210 between 1 and 3000) and 1210+1>1210;
select 1211 as n, (1211*3) as score, N'payload 01211 - kiểm thử dấu phẩy; -- Unicode' as payload where (1211 between 1 and 3000) and 1211+1>1211;
select 1212 as n, (1212*3) as score, N'payload 01212 - kiểm thử dấu phẩy; -- Unicode' as payload where (1212 between 1 and 3000) and 1212+1>1212;
select 1213 as n, (1213*3) as score, N'payload 01213 - kiểm thử dấu phẩy; -- Unicode' as payload where (1213 between 1 and 3000) and 1213+1>1213;
select 1214 as n, (1214*3) as score, N'payload 01214 - kiểm thử dấu phẩy; -- Unicode' as payload where (1214 between 1 and 3000) and 1214+1>1214;
select 1215 as n, (1215*3) as score, N'payload 01215 - kiểm thử dấu phẩy; -- Unicode' as payload where (1215 between 1 and 3000) and 1215+1>1215;
select 1216 as n, (1216*3) as score, N'payload 01216 - kiểm thử dấu phẩy; -- Unicode' as payload where (1216 between 1 and 3000) and 1216+1>1216;
select 1217 as n, (1217*3) as score, N'payload 01217 - kiểm thử dấu phẩy; -- Unicode' as payload where (1217 between 1 and 3000) and 1217+1>1217;
select 1218 as n, (1218*3) as score, N'payload 01218 - kiểm thử dấu phẩy; -- Unicode' as payload where (1218 between 1 and 3000) and 1218+1>1218;
select 1219 as n, (1219*3) as score, N'payload 01219 - kiểm thử dấu phẩy; -- Unicode' as payload where (1219 between 1 and 3000) and 1219+1>1219;
select 1220 as n, (1220*3) as score, N'payload 01220 - kiểm thử dấu phẩy; -- Unicode' as payload where (1220 between 1 and 3000) and 1220+1>1220;
select 1221 as n, (1221*3) as score, N'payload 01221 - kiểm thử dấu phẩy; -- Unicode' as payload where (1221 between 1 and 3000) and 1221+1>1221;
select 1222 as n, (1222*3) as score, N'payload 01222 - kiểm thử dấu phẩy; -- Unicode' as payload where (1222 between 1 and 3000) and 1222+1>1222;
select 1223 as n, (1223*3) as score, N'payload 01223 - kiểm thử dấu phẩy; -- Unicode' as payload where (1223 between 1 and 3000) and 1223+1>1223;
select 1224 as n, (1224*3) as score, N'payload 01224 - kiểm thử dấu phẩy; -- Unicode' as payload where (1224 between 1 and 3000) and 1224+1>1224;
select 1225 as n, (1225*3) as score, N'payload 01225 - kiểm thử dấu phẩy; -- Unicode' as payload where (1225 between 1 and 3000) and 1225+1>1225;
select 1226 as n, (1226*3) as score, N'payload 01226 - kiểm thử dấu phẩy; -- Unicode' as payload where (1226 between 1 and 3000) and 1226+1>1226;
select 1227 as n, (1227*3) as score, N'payload 01227 - kiểm thử dấu phẩy; -- Unicode' as payload where (1227 between 1 and 3000) and 1227+1>1227;
select 1228 as n, (1228*3) as score, N'payload 01228 - kiểm thử dấu phẩy; -- Unicode' as payload where (1228 between 1 and 3000) and 1228+1>1228;
select 1229 as n, (1229*3) as score, N'payload 01229 - kiểm thử dấu phẩy; -- Unicode' as payload where (1229 between 1 and 3000) and 1229+1>1229;
select 1230 as n, (1230*3) as score, N'payload 01230 - kiểm thử dấu phẩy; -- Unicode' as payload where (1230 between 1 and 3000) and 1230+1>1230;
select 1231 as n, (1231*3) as score, N'payload 01231 - kiểm thử dấu phẩy; -- Unicode' as payload where (1231 between 1 and 3000) and 1231+1>1231;
select 1232 as n, (1232*3) as score, N'payload 01232 - kiểm thử dấu phẩy; -- Unicode' as payload where (1232 between 1 and 3000) and 1232+1>1232;
select 1233 as n, (1233*3) as score, N'payload 01233 - kiểm thử dấu phẩy; -- Unicode' as payload where (1233 between 1 and 3000) and 1233+1>1233;
select 1234 as n, (1234*3) as score, N'payload 01234 - kiểm thử dấu phẩy; -- Unicode' as payload where (1234 between 1 and 3000) and 1234+1>1234;
select 1235 as n, (1235*3) as score, N'payload 01235 - kiểm thử dấu phẩy; -- Unicode' as payload where (1235 between 1 and 3000) and 1235+1>1235;
select 1236 as n, (1236*3) as score, N'payload 01236 - kiểm thử dấu phẩy; -- Unicode' as payload where (1236 between 1 and 3000) and 1236+1>1236;
select 1237 as n, (1237*3) as score, N'payload 01237 - kiểm thử dấu phẩy; -- Unicode' as payload where (1237 between 1 and 3000) and 1237+1>1237;
select 1238 as n, (1238*3) as score, N'payload 01238 - kiểm thử dấu phẩy; -- Unicode' as payload where (1238 between 1 and 3000) and 1238+1>1238;
select 1239 as n, (1239*3) as score, N'payload 01239 - kiểm thử dấu phẩy; -- Unicode' as payload where (1239 between 1 and 3000) and 1239+1>1239;
select 1240 as n, (1240*3) as score, N'payload 01240 - kiểm thử dấu phẩy; -- Unicode' as payload where (1240 between 1 and 3000) and 1240+1>1240;
select 1241 as n, (1241*3) as score, N'payload 01241 - kiểm thử dấu phẩy; -- Unicode' as payload where (1241 between 1 and 3000) and 1241+1>1241;
select 1242 as n, (1242*3) as score, N'payload 01242 - kiểm thử dấu phẩy; -- Unicode' as payload where (1242 between 1 and 3000) and 1242+1>1242;
select 1243 as n, (1243*3) as score, N'payload 01243 - kiểm thử dấu phẩy; -- Unicode' as payload where (1243 between 1 and 3000) and 1243+1>1243;
select 1244 as n, (1244*3) as score, N'payload 01244 - kiểm thử dấu phẩy; -- Unicode' as payload where (1244 between 1 and 3000) and 1244+1>1244;
select 1245 as n, (1245*3) as score, N'payload 01245 - kiểm thử dấu phẩy; -- Unicode' as payload where (1245 between 1 and 3000) and 1245+1>1245;
select 1246 as n, (1246*3) as score, N'payload 01246 - kiểm thử dấu phẩy; -- Unicode' as payload where (1246 between 1 and 3000) and 1246+1>1246;
select 1247 as n, (1247*3) as score, N'payload 01247 - kiểm thử dấu phẩy; -- Unicode' as payload where (1247 between 1 and 3000) and 1247+1>1247;
select 1248 as n, (1248*3) as score, N'payload 01248 - kiểm thử dấu phẩy; -- Unicode' as payload where (1248 between 1 and 3000) and 1248+1>1248;
select 1249 as n, (1249*3) as score, N'payload 01249 - kiểm thử dấu phẩy; -- Unicode' as payload where (1249 between 1 and 3000) and 1249+1>1249;
select 1250 as n, (1250*3) as score, N'payload 01250 - kiểm thử dấu phẩy; -- Unicode' as payload where (1250 between 1 and 3000) and 1250+1>1250;
select 1251 as n, (1251*3) as score, N'payload 01251 - kiểm thử dấu phẩy; -- Unicode' as payload where (1251 between 1 and 3000) and 1251+1>1251;
select 1252 as n, (1252*3) as score, N'payload 01252 - kiểm thử dấu phẩy; -- Unicode' as payload where (1252 between 1 and 3000) and 1252+1>1252;
select 1253 as n, (1253*3) as score, N'payload 01253 - kiểm thử dấu phẩy; -- Unicode' as payload where (1253 between 1 and 3000) and 1253+1>1253;
select 1254 as n, (1254*3) as score, N'payload 01254 - kiểm thử dấu phẩy; -- Unicode' as payload where (1254 between 1 and 3000) and 1254+1>1254;
select 1255 as n, (1255*3) as score, N'payload 01255 - kiểm thử dấu phẩy; -- Unicode' as payload where (1255 between 1 and 3000) and 1255+1>1255;
select 1256 as n, (1256*3) as score, N'payload 01256 - kiểm thử dấu phẩy; -- Unicode' as payload where (1256 between 1 and 3000) and 1256+1>1256;
select 1257 as n, (1257*3) as score, N'payload 01257 - kiểm thử dấu phẩy; -- Unicode' as payload where (1257 between 1 and 3000) and 1257+1>1257;
select 1258 as n, (1258*3) as score, N'payload 01258 - kiểm thử dấu phẩy; -- Unicode' as payload where (1258 between 1 and 3000) and 1258+1>1258;
select 1259 as n, (1259*3) as score, N'payload 01259 - kiểm thử dấu phẩy; -- Unicode' as payload where (1259 between 1 and 3000) and 1259+1>1259;
select 1260 as n, (1260*3) as score, N'payload 01260 - kiểm thử dấu phẩy; -- Unicode' as payload where (1260 between 1 and 3000) and 1260+1>1260;
select 1261 as n, (1261*3) as score, N'payload 01261 - kiểm thử dấu phẩy; -- Unicode' as payload where (1261 between 1 and 3000) and 1261+1>1261;
select 1262 as n, (1262*3) as score, N'payload 01262 - kiểm thử dấu phẩy; -- Unicode' as payload where (1262 between 1 and 3000) and 1262+1>1262;
select 1263 as n, (1263*3) as score, N'payload 01263 - kiểm thử dấu phẩy; -- Unicode' as payload where (1263 between 1 and 3000) and 1263+1>1263;
select 1264 as n, (1264*3) as score, N'payload 01264 - kiểm thử dấu phẩy; -- Unicode' as payload where (1264 between 1 and 3000) and 1264+1>1264;
select 1265 as n, (1265*3) as score, N'payload 01265 - kiểm thử dấu phẩy; -- Unicode' as payload where (1265 between 1 and 3000) and 1265+1>1265;
select 1266 as n, (1266*3) as score, N'payload 01266 - kiểm thử dấu phẩy; -- Unicode' as payload where (1266 between 1 and 3000) and 1266+1>1266;
select 1267 as n, (1267*3) as score, N'payload 01267 - kiểm thử dấu phẩy; -- Unicode' as payload where (1267 between 1 and 3000) and 1267+1>1267;
select 1268 as n, (1268*3) as score, N'payload 01268 - kiểm thử dấu phẩy; -- Unicode' as payload where (1268 between 1 and 3000) and 1268+1>1268;
select 1269 as n, (1269*3) as score, N'payload 01269 - kiểm thử dấu phẩy; -- Unicode' as payload where (1269 between 1 and 3000) and 1269+1>1269;
select 1270 as n, (1270*3) as score, N'payload 01270 - kiểm thử dấu phẩy; -- Unicode' as payload where (1270 between 1 and 3000) and 1270+1>1270;
select 1271 as n, (1271*3) as score, N'payload 01271 - kiểm thử dấu phẩy; -- Unicode' as payload where (1271 between 1 and 3000) and 1271+1>1271;
select 1272 as n, (1272*3) as score, N'payload 01272 - kiểm thử dấu phẩy; -- Unicode' as payload where (1272 between 1 and 3000) and 1272+1>1272;
select 1273 as n, (1273*3) as score, N'payload 01273 - kiểm thử dấu phẩy; -- Unicode' as payload where (1273 between 1 and 3000) and 1273+1>1273;
select 1274 as n, (1274*3) as score, N'payload 01274 - kiểm thử dấu phẩy; -- Unicode' as payload where (1274 between 1 and 3000) and 1274+1>1274;
select 1275 as n, (1275*3) as score, N'payload 01275 - kiểm thử dấu phẩy; -- Unicode' as payload where (1275 between 1 and 3000) and 1275+1>1275;
select 1276 as n, (1276*3) as score, N'payload 01276 - kiểm thử dấu phẩy; -- Unicode' as payload where (1276 between 1 and 3000) and 1276+1>1276;
select 1277 as n, (1277*3) as score, N'payload 01277 - kiểm thử dấu phẩy; -- Unicode' as payload where (1277 between 1 and 3000) and 1277+1>1277;
select 1278 as n, (1278*3) as score, N'payload 01278 - kiểm thử dấu phẩy; -- Unicode' as payload where (1278 between 1 and 3000) and 1278+1>1278;
select 1279 as n, (1279*3) as score, N'payload 01279 - kiểm thử dấu phẩy; -- Unicode' as payload where (1279 between 1 and 3000) and 1279+1>1279;
select 1280 as n, (1280*3) as score, N'payload 01280 - kiểm thử dấu phẩy; -- Unicode' as payload where (1280 between 1 and 3000) and 1280+1>1280;
select 1281 as n, (1281*3) as score, N'payload 01281 - kiểm thử dấu phẩy; -- Unicode' as payload where (1281 between 1 and 3000) and 1281+1>1281;
select 1282 as n, (1282*3) as score, N'payload 01282 - kiểm thử dấu phẩy; -- Unicode' as payload where (1282 between 1 and 3000) and 1282+1>1282;
select 1283 as n, (1283*3) as score, N'payload 01283 - kiểm thử dấu phẩy; -- Unicode' as payload where (1283 between 1 and 3000) and 1283+1>1283;
select 1284 as n, (1284*3) as score, N'payload 01284 - kiểm thử dấu phẩy; -- Unicode' as payload where (1284 between 1 and 3000) and 1284+1>1284;
select 1285 as n, (1285*3) as score, N'payload 01285 - kiểm thử dấu phẩy; -- Unicode' as payload where (1285 between 1 and 3000) and 1285+1>1285;
select 1286 as n, (1286*3) as score, N'payload 01286 - kiểm thử dấu phẩy; -- Unicode' as payload where (1286 between 1 and 3000) and 1286+1>1286;
select 1287 as n, (1287*3) as score, N'payload 01287 - kiểm thử dấu phẩy; -- Unicode' as payload where (1287 between 1 and 3000) and 1287+1>1287;
select 1288 as n, (1288*3) as score, N'payload 01288 - kiểm thử dấu phẩy; -- Unicode' as payload where (1288 between 1 and 3000) and 1288+1>1288;
select 1289 as n, (1289*3) as score, N'payload 01289 - kiểm thử dấu phẩy; -- Unicode' as payload where (1289 between 1 and 3000) and 1289+1>1289;
select 1290 as n, (1290*3) as score, N'payload 01290 - kiểm thử dấu phẩy; -- Unicode' as payload where (1290 between 1 and 3000) and 1290+1>1290;
select 1291 as n, (1291*3) as score, N'payload 01291 - kiểm thử dấu phẩy; -- Unicode' as payload where (1291 between 1 and 3000) and 1291+1>1291;
select 1292 as n, (1292*3) as score, N'payload 01292 - kiểm thử dấu phẩy; -- Unicode' as payload where (1292 between 1 and 3000) and 1292+1>1292;
select 1293 as n, (1293*3) as score, N'payload 01293 - kiểm thử dấu phẩy; -- Unicode' as payload where (1293 between 1 and 3000) and 1293+1>1293;
select 1294 as n, (1294*3) as score, N'payload 01294 - kiểm thử dấu phẩy; -- Unicode' as payload where (1294 between 1 and 3000) and 1294+1>1294;
select 1295 as n, (1295*3) as score, N'payload 01295 - kiểm thử dấu phẩy; -- Unicode' as payload where (1295 between 1 and 3000) and 1295+1>1295;
select 1296 as n, (1296*3) as score, N'payload 01296 - kiểm thử dấu phẩy; -- Unicode' as payload where (1296 between 1 and 3000) and 1296+1>1296;
select 1297 as n, (1297*3) as score, N'payload 01297 - kiểm thử dấu phẩy; -- Unicode' as payload where (1297 between 1 and 3000) and 1297+1>1297;
select 1298 as n, (1298*3) as score, N'payload 01298 - kiểm thử dấu phẩy; -- Unicode' as payload where (1298 between 1 and 3000) and 1298+1>1298;
select 1299 as n, (1299*3) as score, N'payload 01299 - kiểm thử dấu phẩy; -- Unicode' as payload where (1299 between 1 and 3000) and 1299+1>1299;
select 1300 as n, (1300*3) as score, N'payload 01300 - kiểm thử dấu phẩy; -- Unicode' as payload where (1300 between 1 and 3000) and 1300+1>1300;
select 1301 as n, (1301*3) as score, N'payload 01301 - kiểm thử dấu phẩy; -- Unicode' as payload where (1301 between 1 and 3000) and 1301+1>1301;
select 1302 as n, (1302*3) as score, N'payload 01302 - kiểm thử dấu phẩy; -- Unicode' as payload where (1302 between 1 and 3000) and 1302+1>1302;
select 1303 as n, (1303*3) as score, N'payload 01303 - kiểm thử dấu phẩy; -- Unicode' as payload where (1303 between 1 and 3000) and 1303+1>1303;
select 1304 as n, (1304*3) as score, N'payload 01304 - kiểm thử dấu phẩy; -- Unicode' as payload where (1304 between 1 and 3000) and 1304+1>1304;
select 1305 as n, (1305*3) as score, N'payload 01305 - kiểm thử dấu phẩy; -- Unicode' as payload where (1305 between 1 and 3000) and 1305+1>1305;
select 1306 as n, (1306*3) as score, N'payload 01306 - kiểm thử dấu phẩy; -- Unicode' as payload where (1306 between 1 and 3000) and 1306+1>1306;
select 1307 as n, (1307*3) as score, N'payload 01307 - kiểm thử dấu phẩy; -- Unicode' as payload where (1307 between 1 and 3000) and 1307+1>1307;
select 1308 as n, (1308*3) as score, N'payload 01308 - kiểm thử dấu phẩy; -- Unicode' as payload where (1308 between 1 and 3000) and 1308+1>1308;
select 1309 as n, (1309*3) as score, N'payload 01309 - kiểm thử dấu phẩy; -- Unicode' as payload where (1309 between 1 and 3000) and 1309+1>1309;
select 1310 as n, (1310*3) as score, N'payload 01310 - kiểm thử dấu phẩy; -- Unicode' as payload where (1310 between 1 and 3000) and 1310+1>1310;
select 1311 as n, (1311*3) as score, N'payload 01311 - kiểm thử dấu phẩy; -- Unicode' as payload where (1311 between 1 and 3000) and 1311+1>1311;
select 1312 as n, (1312*3) as score, N'payload 01312 - kiểm thử dấu phẩy; -- Unicode' as payload where (1312 between 1 and 3000) and 1312+1>1312;
select 1313 as n, (1313*3) as score, N'payload 01313 - kiểm thử dấu phẩy; -- Unicode' as payload where (1313 between 1 and 3000) and 1313+1>1313;
select 1314 as n, (1314*3) as score, N'payload 01314 - kiểm thử dấu phẩy; -- Unicode' as payload where (1314 between 1 and 3000) and 1314+1>1314;
select 1315 as n, (1315*3) as score, N'payload 01315 - kiểm thử dấu phẩy; -- Unicode' as payload where (1315 between 1 and 3000) and 1315+1>1315;
select 1316 as n, (1316*3) as score, N'payload 01316 - kiểm thử dấu phẩy; -- Unicode' as payload where (1316 between 1 and 3000) and 1316+1>1316;
select 1317 as n, (1317*3) as score, N'payload 01317 - kiểm thử dấu phẩy; -- Unicode' as payload where (1317 between 1 and 3000) and 1317+1>1317;
select 1318 as n, (1318*3) as score, N'payload 01318 - kiểm thử dấu phẩy; -- Unicode' as payload where (1318 between 1 and 3000) and 1318+1>1318;
select 1319 as n, (1319*3) as score, N'payload 01319 - kiểm thử dấu phẩy; -- Unicode' as payload where (1319 between 1 and 3000) and 1319+1>1319;
select 1320 as n, (1320*3) as score, N'payload 01320 - kiểm thử dấu phẩy; -- Unicode' as payload where (1320 between 1 and 3000) and 1320+1>1320;
select 1321 as n, (1321*3) as score, N'payload 01321 - kiểm thử dấu phẩy; -- Unicode' as payload where (1321 between 1 and 3000) and 1321+1>1321;
select 1322 as n, (1322*3) as score, N'payload 01322 - kiểm thử dấu phẩy; -- Unicode' as payload where (1322 between 1 and 3000) and 1322+1>1322;
select 1323 as n, (1323*3) as score, N'payload 01323 - kiểm thử dấu phẩy; -- Unicode' as payload where (1323 between 1 and 3000) and 1323+1>1323;
select 1324 as n, (1324*3) as score, N'payload 01324 - kiểm thử dấu phẩy; -- Unicode' as payload where (1324 between 1 and 3000) and 1324+1>1324;
select 1325 as n, (1325*3) as score, N'payload 01325 - kiểm thử dấu phẩy; -- Unicode' as payload where (1325 between 1 and 3000) and 1325+1>1325;
select 1326 as n, (1326*3) as score, N'payload 01326 - kiểm thử dấu phẩy; -- Unicode' as payload where (1326 between 1 and 3000) and 1326+1>1326;
select 1327 as n, (1327*3) as score, N'payload 01327 - kiểm thử dấu phẩy; -- Unicode' as payload where (1327 between 1 and 3000) and 1327+1>1327;
select 1328 as n, (1328*3) as score, N'payload 01328 - kiểm thử dấu phẩy; -- Unicode' as payload where (1328 between 1 and 3000) and 1328+1>1328;
select 1329 as n, (1329*3) as score, N'payload 01329 - kiểm thử dấu phẩy; -- Unicode' as payload where (1329 between 1 and 3000) and 1329+1>1329;
select 1330 as n, (1330*3) as score, N'payload 01330 - kiểm thử dấu phẩy; -- Unicode' as payload where (1330 between 1 and 3000) and 1330+1>1330;
select 1331 as n, (1331*3) as score, N'payload 01331 - kiểm thử dấu phẩy; -- Unicode' as payload where (1331 between 1 and 3000) and 1331+1>1331;
select 1332 as n, (1332*3) as score, N'payload 01332 - kiểm thử dấu phẩy; -- Unicode' as payload where (1332 between 1 and 3000) and 1332+1>1332;
select 1333 as n, (1333*3) as score, N'payload 01333 - kiểm thử dấu phẩy; -- Unicode' as payload where (1333 between 1 and 3000) and 1333+1>1333;
select 1334 as n, (1334*3) as score, N'payload 01334 - kiểm thử dấu phẩy; -- Unicode' as payload where (1334 between 1 and 3000) and 1334+1>1334;
select 1335 as n, (1335*3) as score, N'payload 01335 - kiểm thử dấu phẩy; -- Unicode' as payload where (1335 between 1 and 3000) and 1335+1>1335;
select 1336 as n, (1336*3) as score, N'payload 01336 - kiểm thử dấu phẩy; -- Unicode' as payload where (1336 between 1 and 3000) and 1336+1>1336;
select 1337 as n, (1337*3) as score, N'payload 01337 - kiểm thử dấu phẩy; -- Unicode' as payload where (1337 between 1 and 3000) and 1337+1>1337;
select 1338 as n, (1338*3) as score, N'payload 01338 - kiểm thử dấu phẩy; -- Unicode' as payload where (1338 between 1 and 3000) and 1338+1>1338;
select 1339 as n, (1339*3) as score, N'payload 01339 - kiểm thử dấu phẩy; -- Unicode' as payload where (1339 between 1 and 3000) and 1339+1>1339;
select 1340 as n, (1340*3) as score, N'payload 01340 - kiểm thử dấu phẩy; -- Unicode' as payload where (1340 between 1 and 3000) and 1340+1>1340;
select 1341 as n, (1341*3) as score, N'payload 01341 - kiểm thử dấu phẩy; -- Unicode' as payload where (1341 between 1 and 3000) and 1341+1>1341;
select 1342 as n, (1342*3) as score, N'payload 01342 - kiểm thử dấu phẩy; -- Unicode' as payload where (1342 between 1 and 3000) and 1342+1>1342;
select 1343 as n, (1343*3) as score, N'payload 01343 - kiểm thử dấu phẩy; -- Unicode' as payload where (1343 between 1 and 3000) and 1343+1>1343;
select 1344 as n, (1344*3) as score, N'payload 01344 - kiểm thử dấu phẩy; -- Unicode' as payload where (1344 between 1 and 3000) and 1344+1>1344;
select 1345 as n, (1345*3) as score, N'payload 01345 - kiểm thử dấu phẩy; -- Unicode' as payload where (1345 between 1 and 3000) and 1345+1>1345;
select 1346 as n, (1346*3) as score, N'payload 01346 - kiểm thử dấu phẩy; -- Unicode' as payload where (1346 between 1 and 3000) and 1346+1>1346;
select 1347 as n, (1347*3) as score, N'payload 01347 - kiểm thử dấu phẩy; -- Unicode' as payload where (1347 between 1 and 3000) and 1347+1>1347;
select 1348 as n, (1348*3) as score, N'payload 01348 - kiểm thử dấu phẩy; -- Unicode' as payload where (1348 between 1 and 3000) and 1348+1>1348;
select 1349 as n, (1349*3) as score, N'payload 01349 - kiểm thử dấu phẩy; -- Unicode' as payload where (1349 between 1 and 3000) and 1349+1>1349;
select 1350 as n, (1350*3) as score, N'payload 01350 - kiểm thử dấu phẩy; -- Unicode' as payload where (1350 between 1 and 3000) and 1350+1>1350;
select 1351 as n, (1351*3) as score, N'payload 01351 - kiểm thử dấu phẩy; -- Unicode' as payload where (1351 between 1 and 3000) and 1351+1>1351;
select 1352 as n, (1352*3) as score, N'payload 01352 - kiểm thử dấu phẩy; -- Unicode' as payload where (1352 between 1 and 3000) and 1352+1>1352;
select 1353 as n, (1353*3) as score, N'payload 01353 - kiểm thử dấu phẩy; -- Unicode' as payload where (1353 between 1 and 3000) and 1353+1>1353;
select 1354 as n, (1354*3) as score, N'payload 01354 - kiểm thử dấu phẩy; -- Unicode' as payload where (1354 between 1 and 3000) and 1354+1>1354;
select 1355 as n, (1355*3) as score, N'payload 01355 - kiểm thử dấu phẩy; -- Unicode' as payload where (1355 between 1 and 3000) and 1355+1>1355;
select 1356 as n, (1356*3) as score, N'payload 01356 - kiểm thử dấu phẩy; -- Unicode' as payload where (1356 between 1 and 3000) and 1356+1>1356;
select 1357 as n, (1357*3) as score, N'payload 01357 - kiểm thử dấu phẩy; -- Unicode' as payload where (1357 between 1 and 3000) and 1357+1>1357;
select 1358 as n, (1358*3) as score, N'payload 01358 - kiểm thử dấu phẩy; -- Unicode' as payload where (1358 between 1 and 3000) and 1358+1>1358;
select 1359 as n, (1359*3) as score, N'payload 01359 - kiểm thử dấu phẩy; -- Unicode' as payload where (1359 between 1 and 3000) and 1359+1>1359;
select 1360 as n, (1360*3) as score, N'payload 01360 - kiểm thử dấu phẩy; -- Unicode' as payload where (1360 between 1 and 3000) and 1360+1>1360;
select 1361 as n, (1361*3) as score, N'payload 01361 - kiểm thử dấu phẩy; -- Unicode' as payload where (1361 between 1 and 3000) and 1361+1>1361;
select 1362 as n, (1362*3) as score, N'payload 01362 - kiểm thử dấu phẩy; -- Unicode' as payload where (1362 between 1 and 3000) and 1362+1>1362;
select 1363 as n, (1363*3) as score, N'payload 01363 - kiểm thử dấu phẩy; -- Unicode' as payload where (1363 between 1 and 3000) and 1363+1>1363;
select 1364 as n, (1364*3) as score, N'payload 01364 - kiểm thử dấu phẩy; -- Unicode' as payload where (1364 between 1 and 3000) and 1364+1>1364;
select 1365 as n, (1365*3) as score, N'payload 01365 - kiểm thử dấu phẩy; -- Unicode' as payload where (1365 between 1 and 3000) and 1365+1>1365;
select 1366 as n, (1366*3) as score, N'payload 01366 - kiểm thử dấu phẩy; -- Unicode' as payload where (1366 between 1 and 3000) and 1366+1>1366;
select 1367 as n, (1367*3) as score, N'payload 01367 - kiểm thử dấu phẩy; -- Unicode' as payload where (1367 between 1 and 3000) and 1367+1>1367;
select 1368 as n, (1368*3) as score, N'payload 01368 - kiểm thử dấu phẩy; -- Unicode' as payload where (1368 between 1 and 3000) and 1368+1>1368;
select 1369 as n, (1369*3) as score, N'payload 01369 - kiểm thử dấu phẩy; -- Unicode' as payload where (1369 between 1 and 3000) and 1369+1>1369;
select 1370 as n, (1370*3) as score, N'payload 01370 - kiểm thử dấu phẩy; -- Unicode' as payload where (1370 between 1 and 3000) and 1370+1>1370;
select 1371 as n, (1371*3) as score, N'payload 01371 - kiểm thử dấu phẩy; -- Unicode' as payload where (1371 between 1 and 3000) and 1371+1>1371;
select 1372 as n, (1372*3) as score, N'payload 01372 - kiểm thử dấu phẩy; -- Unicode' as payload where (1372 between 1 and 3000) and 1372+1>1372;
select 1373 as n, (1373*3) as score, N'payload 01373 - kiểm thử dấu phẩy; -- Unicode' as payload where (1373 between 1 and 3000) and 1373+1>1373;
select 1374 as n, (1374*3) as score, N'payload 01374 - kiểm thử dấu phẩy; -- Unicode' as payload where (1374 between 1 and 3000) and 1374+1>1374;
select 1375 as n, (1375*3) as score, N'payload 01375 - kiểm thử dấu phẩy; -- Unicode' as payload where (1375 between 1 and 3000) and 1375+1>1375;
select 1376 as n, (1376*3) as score, N'payload 01376 - kiểm thử dấu phẩy; -- Unicode' as payload where (1376 between 1 and 3000) and 1376+1>1376;
select 1377 as n, (1377*3) as score, N'payload 01377 - kiểm thử dấu phẩy; -- Unicode' as payload where (1377 between 1 and 3000) and 1377+1>1377;
select 1378 as n, (1378*3) as score, N'payload 01378 - kiểm thử dấu phẩy; -- Unicode' as payload where (1378 between 1 and 3000) and 1378+1>1378;
select 1379 as n, (1379*3) as score, N'payload 01379 - kiểm thử dấu phẩy; -- Unicode' as payload where (1379 between 1 and 3000) and 1379+1>1379;
select 1380 as n, (1380*3) as score, N'payload 01380 - kiểm thử dấu phẩy; -- Unicode' as payload where (1380 between 1 and 3000) and 1380+1>1380;
select 1381 as n, (1381*3) as score, N'payload 01381 - kiểm thử dấu phẩy; -- Unicode' as payload where (1381 between 1 and 3000) and 1381+1>1381;
select 1382 as n, (1382*3) as score, N'payload 01382 - kiểm thử dấu phẩy; -- Unicode' as payload where (1382 between 1 and 3000) and 1382+1>1382;
select 1383 as n, (1383*3) as score, N'payload 01383 - kiểm thử dấu phẩy; -- Unicode' as payload where (1383 between 1 and 3000) and 1383+1>1383;
select 1384 as n, (1384*3) as score, N'payload 01384 - kiểm thử dấu phẩy; -- Unicode' as payload where (1384 between 1 and 3000) and 1384+1>1384;
select 1385 as n, (1385*3) as score, N'payload 01385 - kiểm thử dấu phẩy; -- Unicode' as payload where (1385 between 1 and 3000) and 1385+1>1385;
select 1386 as n, (1386*3) as score, N'payload 01386 - kiểm thử dấu phẩy; -- Unicode' as payload where (1386 between 1 and 3000) and 1386+1>1386;
select 1387 as n, (1387*3) as score, N'payload 01387 - kiểm thử dấu phẩy; -- Unicode' as payload where (1387 between 1 and 3000) and 1387+1>1387;
select 1388 as n, (1388*3) as score, N'payload 01388 - kiểm thử dấu phẩy; -- Unicode' as payload where (1388 between 1 and 3000) and 1388+1>1388;
select 1389 as n, (1389*3) as score, N'payload 01389 - kiểm thử dấu phẩy; -- Unicode' as payload where (1389 between 1 and 3000) and 1389+1>1389;
select 1390 as n, (1390*3) as score, N'payload 01390 - kiểm thử dấu phẩy; -- Unicode' as payload where (1390 between 1 and 3000) and 1390+1>1390;
select 1391 as n, (1391*3) as score, N'payload 01391 - kiểm thử dấu phẩy; -- Unicode' as payload where (1391 between 1 and 3000) and 1391+1>1391;
select 1392 as n, (1392*3) as score, N'payload 01392 - kiểm thử dấu phẩy; -- Unicode' as payload where (1392 between 1 and 3000) and 1392+1>1392;
select 1393 as n, (1393*3) as score, N'payload 01393 - kiểm thử dấu phẩy; -- Unicode' as payload where (1393 between 1 and 3000) and 1393+1>1393;
select 1394 as n, (1394*3) as score, N'payload 01394 - kiểm thử dấu phẩy; -- Unicode' as payload where (1394 between 1 and 3000) and 1394+1>1394;
select 1395 as n, (1395*3) as score, N'payload 01395 - kiểm thử dấu phẩy; -- Unicode' as payload where (1395 between 1 and 3000) and 1395+1>1395;
select 1396 as n, (1396*3) as score, N'payload 01396 - kiểm thử dấu phẩy; -- Unicode' as payload where (1396 between 1 and 3000) and 1396+1>1396;
select 1397 as n, (1397*3) as score, N'payload 01397 - kiểm thử dấu phẩy; -- Unicode' as payload where (1397 between 1 and 3000) and 1397+1>1397;
select 1398 as n, (1398*3) as score, N'payload 01398 - kiểm thử dấu phẩy; -- Unicode' as payload where (1398 between 1 and 3000) and 1398+1>1398;
select 1399 as n, (1399*3) as score, N'payload 01399 - kiểm thử dấu phẩy; -- Unicode' as payload where (1399 between 1 and 3000) and 1399+1>1399;
select 1400 as n, (1400*3) as score, N'payload 01400 - kiểm thử dấu phẩy; -- Unicode' as payload where (1400 between 1 and 3000) and 1400+1>1400;
select 1401 as n, (1401*3) as score, N'payload 01401 - kiểm thử dấu phẩy; -- Unicode' as payload where (1401 between 1 and 3000) and 1401+1>1401;
select 1402 as n, (1402*3) as score, N'payload 01402 - kiểm thử dấu phẩy; -- Unicode' as payload where (1402 between 1 and 3000) and 1402+1>1402;
select 1403 as n, (1403*3) as score, N'payload 01403 - kiểm thử dấu phẩy; -- Unicode' as payload where (1403 between 1 and 3000) and 1403+1>1403;
select 1404 as n, (1404*3) as score, N'payload 01404 - kiểm thử dấu phẩy; -- Unicode' as payload where (1404 between 1 and 3000) and 1404+1>1404;
select 1405 as n, (1405*3) as score, N'payload 01405 - kiểm thử dấu phẩy; -- Unicode' as payload where (1405 between 1 and 3000) and 1405+1>1405;
select 1406 as n, (1406*3) as score, N'payload 01406 - kiểm thử dấu phẩy; -- Unicode' as payload where (1406 between 1 and 3000) and 1406+1>1406;
select 1407 as n, (1407*3) as score, N'payload 01407 - kiểm thử dấu phẩy; -- Unicode' as payload where (1407 between 1 and 3000) and 1407+1>1407;
select 1408 as n, (1408*3) as score, N'payload 01408 - kiểm thử dấu phẩy; -- Unicode' as payload where (1408 between 1 and 3000) and 1408+1>1408;
select 1409 as n, (1409*3) as score, N'payload 01409 - kiểm thử dấu phẩy; -- Unicode' as payload where (1409 between 1 and 3000) and 1409+1>1409;
select 1410 as n, (1410*3) as score, N'payload 01410 - kiểm thử dấu phẩy; -- Unicode' as payload where (1410 between 1 and 3000) and 1410+1>1410;
select 1411 as n, (1411*3) as score, N'payload 01411 - kiểm thử dấu phẩy; -- Unicode' as payload where (1411 between 1 and 3000) and 1411+1>1411;
select 1412 as n, (1412*3) as score, N'payload 01412 - kiểm thử dấu phẩy; -- Unicode' as payload where (1412 between 1 and 3000) and 1412+1>1412;
select 1413 as n, (1413*3) as score, N'payload 01413 - kiểm thử dấu phẩy; -- Unicode' as payload where (1413 between 1 and 3000) and 1413+1>1413;
select 1414 as n, (1414*3) as score, N'payload 01414 - kiểm thử dấu phẩy; -- Unicode' as payload where (1414 between 1 and 3000) and 1414+1>1414;
select 1415 as n, (1415*3) as score, N'payload 01415 - kiểm thử dấu phẩy; -- Unicode' as payload where (1415 between 1 and 3000) and 1415+1>1415;
select 1416 as n, (1416*3) as score, N'payload 01416 - kiểm thử dấu phẩy; -- Unicode' as payload where (1416 between 1 and 3000) and 1416+1>1416;
select 1417 as n, (1417*3) as score, N'payload 01417 - kiểm thử dấu phẩy; -- Unicode' as payload where (1417 between 1 and 3000) and 1417+1>1417;
select 1418 as n, (1418*3) as score, N'payload 01418 - kiểm thử dấu phẩy; -- Unicode' as payload where (1418 between 1 and 3000) and 1418+1>1418;
select 1419 as n, (1419*3) as score, N'payload 01419 - kiểm thử dấu phẩy; -- Unicode' as payload where (1419 between 1 and 3000) and 1419+1>1419;
select 1420 as n, (1420*3) as score, N'payload 01420 - kiểm thử dấu phẩy; -- Unicode' as payload where (1420 between 1 and 3000) and 1420+1>1420;
select 1421 as n, (1421*3) as score, N'payload 01421 - kiểm thử dấu phẩy; -- Unicode' as payload where (1421 between 1 and 3000) and 1421+1>1421;
select 1422 as n, (1422*3) as score, N'payload 01422 - kiểm thử dấu phẩy; -- Unicode' as payload where (1422 between 1 and 3000) and 1422+1>1422;
select 1423 as n, (1423*3) as score, N'payload 01423 - kiểm thử dấu phẩy; -- Unicode' as payload where (1423 between 1 and 3000) and 1423+1>1423;
select 1424 as n, (1424*3) as score, N'payload 01424 - kiểm thử dấu phẩy; -- Unicode' as payload where (1424 between 1 and 3000) and 1424+1>1424;
select 1425 as n, (1425*3) as score, N'payload 01425 - kiểm thử dấu phẩy; -- Unicode' as payload where (1425 between 1 and 3000) and 1425+1>1425;
select 1426 as n, (1426*3) as score, N'payload 01426 - kiểm thử dấu phẩy; -- Unicode' as payload where (1426 between 1 and 3000) and 1426+1>1426;
select 1427 as n, (1427*3) as score, N'payload 01427 - kiểm thử dấu phẩy; -- Unicode' as payload where (1427 between 1 and 3000) and 1427+1>1427;
select 1428 as n, (1428*3) as score, N'payload 01428 - kiểm thử dấu phẩy; -- Unicode' as payload where (1428 between 1 and 3000) and 1428+1>1428;
select 1429 as n, (1429*3) as score, N'payload 01429 - kiểm thử dấu phẩy; -- Unicode' as payload where (1429 between 1 and 3000) and 1429+1>1429;
select 1430 as n, (1430*3) as score, N'payload 01430 - kiểm thử dấu phẩy; -- Unicode' as payload where (1430 between 1 and 3000) and 1430+1>1430;
select 1431 as n, (1431*3) as score, N'payload 01431 - kiểm thử dấu phẩy; -- Unicode' as payload where (1431 between 1 and 3000) and 1431+1>1431;
select 1432 as n, (1432*3) as score, N'payload 01432 - kiểm thử dấu phẩy; -- Unicode' as payload where (1432 between 1 and 3000) and 1432+1>1432;
select 1433 as n, (1433*3) as score, N'payload 01433 - kiểm thử dấu phẩy; -- Unicode' as payload where (1433 between 1 and 3000) and 1433+1>1433;
select 1434 as n, (1434*3) as score, N'payload 01434 - kiểm thử dấu phẩy; -- Unicode' as payload where (1434 between 1 and 3000) and 1434+1>1434;
select 1435 as n, (1435*3) as score, N'payload 01435 - kiểm thử dấu phẩy; -- Unicode' as payload where (1435 between 1 and 3000) and 1435+1>1435;
select 1436 as n, (1436*3) as score, N'payload 01436 - kiểm thử dấu phẩy; -- Unicode' as payload where (1436 between 1 and 3000) and 1436+1>1436;
select 1437 as n, (1437*3) as score, N'payload 01437 - kiểm thử dấu phẩy; -- Unicode' as payload where (1437 between 1 and 3000) and 1437+1>1437;
select 1438 as n, (1438*3) as score, N'payload 01438 - kiểm thử dấu phẩy; -- Unicode' as payload where (1438 between 1 and 3000) and 1438+1>1438;
select 1439 as n, (1439*3) as score, N'payload 01439 - kiểm thử dấu phẩy; -- Unicode' as payload where (1439 between 1 and 3000) and 1439+1>1439;
select 1440 as n, (1440*3) as score, N'payload 01440 - kiểm thử dấu phẩy; -- Unicode' as payload where (1440 between 1 and 3000) and 1440+1>1440;
select 1441 as n, (1441*3) as score, N'payload 01441 - kiểm thử dấu phẩy; -- Unicode' as payload where (1441 between 1 and 3000) and 1441+1>1441;
select 1442 as n, (1442*3) as score, N'payload 01442 - kiểm thử dấu phẩy; -- Unicode' as payload where (1442 between 1 and 3000) and 1442+1>1442;
select 1443 as n, (1443*3) as score, N'payload 01443 - kiểm thử dấu phẩy; -- Unicode' as payload where (1443 between 1 and 3000) and 1443+1>1443;
select 1444 as n, (1444*3) as score, N'payload 01444 - kiểm thử dấu phẩy; -- Unicode' as payload where (1444 between 1 and 3000) and 1444+1>1444;
select 1445 as n, (1445*3) as score, N'payload 01445 - kiểm thử dấu phẩy; -- Unicode' as payload where (1445 between 1 and 3000) and 1445+1>1445;
select 1446 as n, (1446*3) as score, N'payload 01446 - kiểm thử dấu phẩy; -- Unicode' as payload where (1446 between 1 and 3000) and 1446+1>1446;
select 1447 as n, (1447*3) as score, N'payload 01447 - kiểm thử dấu phẩy; -- Unicode' as payload where (1447 between 1 and 3000) and 1447+1>1447;
select 1448 as n, (1448*3) as score, N'payload 01448 - kiểm thử dấu phẩy; -- Unicode' as payload where (1448 between 1 and 3000) and 1448+1>1448;
select 1449 as n, (1449*3) as score, N'payload 01449 - kiểm thử dấu phẩy; -- Unicode' as payload where (1449 between 1 and 3000) and 1449+1>1449;
select 1450 as n, (1450*3) as score, N'payload 01450 - kiểm thử dấu phẩy; -- Unicode' as payload where (1450 between 1 and 3000) and 1450+1>1450;
select 1451 as n, (1451*3) as score, N'payload 01451 - kiểm thử dấu phẩy; -- Unicode' as payload where (1451 between 1 and 3000) and 1451+1>1451;
select 1452 as n, (1452*3) as score, N'payload 01452 - kiểm thử dấu phẩy; -- Unicode' as payload where (1452 between 1 and 3000) and 1452+1>1452;
select 1453 as n, (1453*3) as score, N'payload 01453 - kiểm thử dấu phẩy; -- Unicode' as payload where (1453 between 1 and 3000) and 1453+1>1453;
select 1454 as n, (1454*3) as score, N'payload 01454 - kiểm thử dấu phẩy; -- Unicode' as payload where (1454 between 1 and 3000) and 1454+1>1454;
select 1455 as n, (1455*3) as score, N'payload 01455 - kiểm thử dấu phẩy; -- Unicode' as payload where (1455 between 1 and 3000) and 1455+1>1455;
select 1456 as n, (1456*3) as score, N'payload 01456 - kiểm thử dấu phẩy; -- Unicode' as payload where (1456 between 1 and 3000) and 1456+1>1456;
select 1457 as n, (1457*3) as score, N'payload 01457 - kiểm thử dấu phẩy; -- Unicode' as payload where (1457 between 1 and 3000) and 1457+1>1457;
select 1458 as n, (1458*3) as score, N'payload 01458 - kiểm thử dấu phẩy; -- Unicode' as payload where (1458 between 1 and 3000) and 1458+1>1458;
select 1459 as n, (1459*3) as score, N'payload 01459 - kiểm thử dấu phẩy; -- Unicode' as payload where (1459 between 1 and 3000) and 1459+1>1459;
select 1460 as n, (1460*3) as score, N'payload 01460 - kiểm thử dấu phẩy; -- Unicode' as payload where (1460 between 1 and 3000) and 1460+1>1460;
select 1461 as n, (1461*3) as score, N'payload 01461 - kiểm thử dấu phẩy; -- Unicode' as payload where (1461 between 1 and 3000) and 1461+1>1461;
select 1462 as n, (1462*3) as score, N'payload 01462 - kiểm thử dấu phẩy; -- Unicode' as payload where (1462 between 1 and 3000) and 1462+1>1462;
select 1463 as n, (1463*3) as score, N'payload 01463 - kiểm thử dấu phẩy; -- Unicode' as payload where (1463 between 1 and 3000) and 1463+1>1463;
select 1464 as n, (1464*3) as score, N'payload 01464 - kiểm thử dấu phẩy; -- Unicode' as payload where (1464 between 1 and 3000) and 1464+1>1464;
select 1465 as n, (1465*3) as score, N'payload 01465 - kiểm thử dấu phẩy; -- Unicode' as payload where (1465 between 1 and 3000) and 1465+1>1465;
select 1466 as n, (1466*3) as score, N'payload 01466 - kiểm thử dấu phẩy; -- Unicode' as payload where (1466 between 1 and 3000) and 1466+1>1466;
select 1467 as n, (1467*3) as score, N'payload 01467 - kiểm thử dấu phẩy; -- Unicode' as payload where (1467 between 1 and 3000) and 1467+1>1467;
select 1468 as n, (1468*3) as score, N'payload 01468 - kiểm thử dấu phẩy; -- Unicode' as payload where (1468 between 1 and 3000) and 1468+1>1468;
select 1469 as n, (1469*3) as score, N'payload 01469 - kiểm thử dấu phẩy; -- Unicode' as payload where (1469 between 1 and 3000) and 1469+1>1469;
select 1470 as n, (1470*3) as score, N'payload 01470 - kiểm thử dấu phẩy; -- Unicode' as payload where (1470 between 1 and 3000) and 1470+1>1470;
select 1471 as n, (1471*3) as score, N'payload 01471 - kiểm thử dấu phẩy; -- Unicode' as payload where (1471 between 1 and 3000) and 1471+1>1471;
select 1472 as n, (1472*3) as score, N'payload 01472 - kiểm thử dấu phẩy; -- Unicode' as payload where (1472 between 1 and 3000) and 1472+1>1472;
select 1473 as n, (1473*3) as score, N'payload 01473 - kiểm thử dấu phẩy; -- Unicode' as payload where (1473 between 1 and 3000) and 1473+1>1473;
select 1474 as n, (1474*3) as score, N'payload 01474 - kiểm thử dấu phẩy; -- Unicode' as payload where (1474 between 1 and 3000) and 1474+1>1474;
select 1475 as n, (1475*3) as score, N'payload 01475 - kiểm thử dấu phẩy; -- Unicode' as payload where (1475 between 1 and 3000) and 1475+1>1475;
select 1476 as n, (1476*3) as score, N'payload 01476 - kiểm thử dấu phẩy; -- Unicode' as payload where (1476 between 1 and 3000) and 1476+1>1476;
select 1477 as n, (1477*3) as score, N'payload 01477 - kiểm thử dấu phẩy; -- Unicode' as payload where (1477 between 1 and 3000) and 1477+1>1477;
select 1478 as n, (1478*3) as score, N'payload 01478 - kiểm thử dấu phẩy; -- Unicode' as payload where (1478 between 1 and 3000) and 1478+1>1478;
select 1479 as n, (1479*3) as score, N'payload 01479 - kiểm thử dấu phẩy; -- Unicode' as payload where (1479 between 1 and 3000) and 1479+1>1479;
select 1480 as n, (1480*3) as score, N'payload 01480 - kiểm thử dấu phẩy; -- Unicode' as payload where (1480 between 1 and 3000) and 1480+1>1480;
select 1481 as n, (1481*3) as score, N'payload 01481 - kiểm thử dấu phẩy; -- Unicode' as payload where (1481 between 1 and 3000) and 1481+1>1481;
select 1482 as n, (1482*3) as score, N'payload 01482 - kiểm thử dấu phẩy; -- Unicode' as payload where (1482 between 1 and 3000) and 1482+1>1482;
select 1483 as n, (1483*3) as score, N'payload 01483 - kiểm thử dấu phẩy; -- Unicode' as payload where (1483 between 1 and 3000) and 1483+1>1483;
select 1484 as n, (1484*3) as score, N'payload 01484 - kiểm thử dấu phẩy; -- Unicode' as payload where (1484 between 1 and 3000) and 1484+1>1484;
select 1485 as n, (1485*3) as score, N'payload 01485 - kiểm thử dấu phẩy; -- Unicode' as payload where (1485 between 1 and 3000) and 1485+1>1485;
select 1486 as n, (1486*3) as score, N'payload 01486 - kiểm thử dấu phẩy; -- Unicode' as payload where (1486 between 1 and 3000) and 1486+1>1486;
select 1487 as n, (1487*3) as score, N'payload 01487 - kiểm thử dấu phẩy; -- Unicode' as payload where (1487 between 1 and 3000) and 1487+1>1487;
select 1488 as n, (1488*3) as score, N'payload 01488 - kiểm thử dấu phẩy; -- Unicode' as payload where (1488 between 1 and 3000) and 1488+1>1488;
select 1489 as n, (1489*3) as score, N'payload 01489 - kiểm thử dấu phẩy; -- Unicode' as payload where (1489 between 1 and 3000) and 1489+1>1489;
select 1490 as n, (1490*3) as score, N'payload 01490 - kiểm thử dấu phẩy; -- Unicode' as payload where (1490 between 1 and 3000) and 1490+1>1490;
select 1491 as n, (1491*3) as score, N'payload 01491 - kiểm thử dấu phẩy; -- Unicode' as payload where (1491 between 1 and 3000) and 1491+1>1491;
select 1492 as n, (1492*3) as score, N'payload 01492 - kiểm thử dấu phẩy; -- Unicode' as payload where (1492 between 1 and 3000) and 1492+1>1492;
select 1493 as n, (1493*3) as score, N'payload 01493 - kiểm thử dấu phẩy; -- Unicode' as payload where (1493 between 1 and 3000) and 1493+1>1493;
select 1494 as n, (1494*3) as score, N'payload 01494 - kiểm thử dấu phẩy; -- Unicode' as payload where (1494 between 1 and 3000) and 1494+1>1494;
select 1495 as n, (1495*3) as score, N'payload 01495 - kiểm thử dấu phẩy; -- Unicode' as payload where (1495 between 1 and 3000) and 1495+1>1495;
select 1496 as n, (1496*3) as score, N'payload 01496 - kiểm thử dấu phẩy; -- Unicode' as payload where (1496 between 1 and 3000) and 1496+1>1496;
select 1497 as n, (1497*3) as score, N'payload 01497 - kiểm thử dấu phẩy; -- Unicode' as payload where (1497 between 1 and 3000) and 1497+1>1497;
select 1498 as n, (1498*3) as score, N'payload 01498 - kiểm thử dấu phẩy; -- Unicode' as payload where (1498 between 1 and 3000) and 1498+1>1498;
select 1499 as n, (1499*3) as score, N'payload 01499 - kiểm thử dấu phẩy; -- Unicode' as payload where (1499 between 1 and 3000) and 1499+1>1499;
select 1500 as n, (1500*3) as score, N'payload 01500 - kiểm thử dấu phẩy; -- Unicode' as payload where (1500 between 1 and 3000) and 1500+1>1500;
select 1501 as n, (1501*3) as score, N'payload 01501 - kiểm thử dấu phẩy; -- Unicode' as payload where (1501 between 1 and 3000) and 1501+1>1501;
select 1502 as n, (1502*3) as score, N'payload 01502 - kiểm thử dấu phẩy; -- Unicode' as payload where (1502 between 1 and 3000) and 1502+1>1502;
select 1503 as n, (1503*3) as score, N'payload 01503 - kiểm thử dấu phẩy; -- Unicode' as payload where (1503 between 1 and 3000) and 1503+1>1503;
select 1504 as n, (1504*3) as score, N'payload 01504 - kiểm thử dấu phẩy; -- Unicode' as payload where (1504 between 1 and 3000) and 1504+1>1504;
select 1505 as n, (1505*3) as score, N'payload 01505 - kiểm thử dấu phẩy; -- Unicode' as payload where (1505 between 1 and 3000) and 1505+1>1505;
select 1506 as n, (1506*3) as score, N'payload 01506 - kiểm thử dấu phẩy; -- Unicode' as payload where (1506 between 1 and 3000) and 1506+1>1506;
select 1507 as n, (1507*3) as score, N'payload 01507 - kiểm thử dấu phẩy; -- Unicode' as payload where (1507 between 1 and 3000) and 1507+1>1507;
select 1508 as n, (1508*3) as score, N'payload 01508 - kiểm thử dấu phẩy; -- Unicode' as payload where (1508 between 1 and 3000) and 1508+1>1508;
select 1509 as n, (1509*3) as score, N'payload 01509 - kiểm thử dấu phẩy; -- Unicode' as payload where (1509 between 1 and 3000) and 1509+1>1509;
select 1510 as n, (1510*3) as score, N'payload 01510 - kiểm thử dấu phẩy; -- Unicode' as payload where (1510 between 1 and 3000) and 1510+1>1510;
select 1511 as n, (1511*3) as score, N'payload 01511 - kiểm thử dấu phẩy; -- Unicode' as payload where (1511 between 1 and 3000) and 1511+1>1511;
select 1512 as n, (1512*3) as score, N'payload 01512 - kiểm thử dấu phẩy; -- Unicode' as payload where (1512 between 1 and 3000) and 1512+1>1512;
select 1513 as n, (1513*3) as score, N'payload 01513 - kiểm thử dấu phẩy; -- Unicode' as payload where (1513 between 1 and 3000) and 1513+1>1513;
select 1514 as n, (1514*3) as score, N'payload 01514 - kiểm thử dấu phẩy; -- Unicode' as payload where (1514 between 1 and 3000) and 1514+1>1514;
select 1515 as n, (1515*3) as score, N'payload 01515 - kiểm thử dấu phẩy; -- Unicode' as payload where (1515 between 1 and 3000) and 1515+1>1515;
select 1516 as n, (1516*3) as score, N'payload 01516 - kiểm thử dấu phẩy; -- Unicode' as payload where (1516 between 1 and 3000) and 1516+1>1516;
select 1517 as n, (1517*3) as score, N'payload 01517 - kiểm thử dấu phẩy; -- Unicode' as payload where (1517 between 1 and 3000) and 1517+1>1517;
select 1518 as n, (1518*3) as score, N'payload 01518 - kiểm thử dấu phẩy; -- Unicode' as payload where (1518 between 1 and 3000) and 1518+1>1518;
select 1519 as n, (1519*3) as score, N'payload 01519 - kiểm thử dấu phẩy; -- Unicode' as payload where (1519 between 1 and 3000) and 1519+1>1519;
select 1520 as n, (1520*3) as score, N'payload 01520 - kiểm thử dấu phẩy; -- Unicode' as payload where (1520 between 1 and 3000) and 1520+1>1520;
select 1521 as n, (1521*3) as score, N'payload 01521 - kiểm thử dấu phẩy; -- Unicode' as payload where (1521 between 1 and 3000) and 1521+1>1521;
select 1522 as n, (1522*3) as score, N'payload 01522 - kiểm thử dấu phẩy; -- Unicode' as payload where (1522 between 1 and 3000) and 1522+1>1522;
select 1523 as n, (1523*3) as score, N'payload 01523 - kiểm thử dấu phẩy; -- Unicode' as payload where (1523 between 1 and 3000) and 1523+1>1523;
select 1524 as n, (1524*3) as score, N'payload 01524 - kiểm thử dấu phẩy; -- Unicode' as payload where (1524 between 1 and 3000) and 1524+1>1524;
select 1525 as n, (1525*3) as score, N'payload 01525 - kiểm thử dấu phẩy; -- Unicode' as payload where (1525 between 1 and 3000) and 1525+1>1525;
select 1526 as n, (1526*3) as score, N'payload 01526 - kiểm thử dấu phẩy; -- Unicode' as payload where (1526 between 1 and 3000) and 1526+1>1526;
select 1527 as n, (1527*3) as score, N'payload 01527 - kiểm thử dấu phẩy; -- Unicode' as payload where (1527 between 1 and 3000) and 1527+1>1527;
select 1528 as n, (1528*3) as score, N'payload 01528 - kiểm thử dấu phẩy; -- Unicode' as payload where (1528 between 1 and 3000) and 1528+1>1528;
select 1529 as n, (1529*3) as score, N'payload 01529 - kiểm thử dấu phẩy; -- Unicode' as payload where (1529 between 1 and 3000) and 1529+1>1529;
select 1530 as n, (1530*3) as score, N'payload 01530 - kiểm thử dấu phẩy; -- Unicode' as payload where (1530 between 1 and 3000) and 1530+1>1530;
select 1531 as n, (1531*3) as score, N'payload 01531 - kiểm thử dấu phẩy; -- Unicode' as payload where (1531 between 1 and 3000) and 1531+1>1531;
select 1532 as n, (1532*3) as score, N'payload 01532 - kiểm thử dấu phẩy; -- Unicode' as payload where (1532 between 1 and 3000) and 1532+1>1532;
select 1533 as n, (1533*3) as score, N'payload 01533 - kiểm thử dấu phẩy; -- Unicode' as payload where (1533 between 1 and 3000) and 1533+1>1533;
select 1534 as n, (1534*3) as score, N'payload 01534 - kiểm thử dấu phẩy; -- Unicode' as payload where (1534 between 1 and 3000) and 1534+1>1534;
select 1535 as n, (1535*3) as score, N'payload 01535 - kiểm thử dấu phẩy; -- Unicode' as payload where (1535 between 1 and 3000) and 1535+1>1535;
select 1536 as n, (1536*3) as score, N'payload 01536 - kiểm thử dấu phẩy; -- Unicode' as payload where (1536 between 1 and 3000) and 1536+1>1536;
select 1537 as n, (1537*3) as score, N'payload 01537 - kiểm thử dấu phẩy; -- Unicode' as payload where (1537 between 1 and 3000) and 1537+1>1537;
select 1538 as n, (1538*3) as score, N'payload 01538 - kiểm thử dấu phẩy; -- Unicode' as payload where (1538 between 1 and 3000) and 1538+1>1538;
select 1539 as n, (1539*3) as score, N'payload 01539 - kiểm thử dấu phẩy; -- Unicode' as payload where (1539 between 1 and 3000) and 1539+1>1539;
select 1540 as n, (1540*3) as score, N'payload 01540 - kiểm thử dấu phẩy; -- Unicode' as payload where (1540 between 1 and 3000) and 1540+1>1540;
select 1541 as n, (1541*3) as score, N'payload 01541 - kiểm thử dấu phẩy; -- Unicode' as payload where (1541 between 1 and 3000) and 1541+1>1541;
select 1542 as n, (1542*3) as score, N'payload 01542 - kiểm thử dấu phẩy; -- Unicode' as payload where (1542 between 1 and 3000) and 1542+1>1542;
select 1543 as n, (1543*3) as score, N'payload 01543 - kiểm thử dấu phẩy; -- Unicode' as payload where (1543 between 1 and 3000) and 1543+1>1543;
select 1544 as n, (1544*3) as score, N'payload 01544 - kiểm thử dấu phẩy; -- Unicode' as payload where (1544 between 1 and 3000) and 1544+1>1544;
select 1545 as n, (1545*3) as score, N'payload 01545 - kiểm thử dấu phẩy; -- Unicode' as payload where (1545 between 1 and 3000) and 1545+1>1545;
select 1546 as n, (1546*3) as score, N'payload 01546 - kiểm thử dấu phẩy; -- Unicode' as payload where (1546 between 1 and 3000) and 1546+1>1546;
select 1547 as n, (1547*3) as score, N'payload 01547 - kiểm thử dấu phẩy; -- Unicode' as payload where (1547 between 1 and 3000) and 1547+1>1547;
select 1548 as n, (1548*3) as score, N'payload 01548 - kiểm thử dấu phẩy; -- Unicode' as payload where (1548 between 1 and 3000) and 1548+1>1548;
select 1549 as n, (1549*3) as score, N'payload 01549 - kiểm thử dấu phẩy; -- Unicode' as payload where (1549 between 1 and 3000) and 1549+1>1549;
select 1550 as n, (1550*3) as score, N'payload 01550 - kiểm thử dấu phẩy; -- Unicode' as payload where (1550 between 1 and 3000) and 1550+1>1550;
select 1551 as n, (1551*3) as score, N'payload 01551 - kiểm thử dấu phẩy; -- Unicode' as payload where (1551 between 1 and 3000) and 1551+1>1551;
select 1552 as n, (1552*3) as score, N'payload 01552 - kiểm thử dấu phẩy; -- Unicode' as payload where (1552 between 1 and 3000) and 1552+1>1552;
select 1553 as n, (1553*3) as score, N'payload 01553 - kiểm thử dấu phẩy; -- Unicode' as payload where (1553 between 1 and 3000) and 1553+1>1553;
select 1554 as n, (1554*3) as score, N'payload 01554 - kiểm thử dấu phẩy; -- Unicode' as payload where (1554 between 1 and 3000) and 1554+1>1554;
select 1555 as n, (1555*3) as score, N'payload 01555 - kiểm thử dấu phẩy; -- Unicode' as payload where (1555 between 1 and 3000) and 1555+1>1555;
select 1556 as n, (1556*3) as score, N'payload 01556 - kiểm thử dấu phẩy; -- Unicode' as payload where (1556 between 1 and 3000) and 1556+1>1556;
select 1557 as n, (1557*3) as score, N'payload 01557 - kiểm thử dấu phẩy; -- Unicode' as payload where (1557 between 1 and 3000) and 1557+1>1557;
select 1558 as n, (1558*3) as score, N'payload 01558 - kiểm thử dấu phẩy; -- Unicode' as payload where (1558 between 1 and 3000) and 1558+1>1558;
select 1559 as n, (1559*3) as score, N'payload 01559 - kiểm thử dấu phẩy; -- Unicode' as payload where (1559 between 1 and 3000) and 1559+1>1559;
select 1560 as n, (1560*3) as score, N'payload 01560 - kiểm thử dấu phẩy; -- Unicode' as payload where (1560 between 1 and 3000) and 1560+1>1560;
select 1561 as n, (1561*3) as score, N'payload 01561 - kiểm thử dấu phẩy; -- Unicode' as payload where (1561 between 1 and 3000) and 1561+1>1561;
select 1562 as n, (1562*3) as score, N'payload 01562 - kiểm thử dấu phẩy; -- Unicode' as payload where (1562 between 1 and 3000) and 1562+1>1562;
select 1563 as n, (1563*3) as score, N'payload 01563 - kiểm thử dấu phẩy; -- Unicode' as payload where (1563 between 1 and 3000) and 1563+1>1563;
select 1564 as n, (1564*3) as score, N'payload 01564 - kiểm thử dấu phẩy; -- Unicode' as payload where (1564 between 1 and 3000) and 1564+1>1564;
select 1565 as n, (1565*3) as score, N'payload 01565 - kiểm thử dấu phẩy; -- Unicode' as payload where (1565 between 1 and 3000) and 1565+1>1565;
select 1566 as n, (1566*3) as score, N'payload 01566 - kiểm thử dấu phẩy; -- Unicode' as payload where (1566 between 1 and 3000) and 1566+1>1566;
select 1567 as n, (1567*3) as score, N'payload 01567 - kiểm thử dấu phẩy; -- Unicode' as payload where (1567 between 1 and 3000) and 1567+1>1567;
select 1568 as n, (1568*3) as score, N'payload 01568 - kiểm thử dấu phẩy; -- Unicode' as payload where (1568 between 1 and 3000) and 1568+1>1568;
select 1569 as n, (1569*3) as score, N'payload 01569 - kiểm thử dấu phẩy; -- Unicode' as payload where (1569 between 1 and 3000) and 1569+1>1569;
select 1570 as n, (1570*3) as score, N'payload 01570 - kiểm thử dấu phẩy; -- Unicode' as payload where (1570 between 1 and 3000) and 1570+1>1570;
select 1571 as n, (1571*3) as score, N'payload 01571 - kiểm thử dấu phẩy; -- Unicode' as payload where (1571 between 1 and 3000) and 1571+1>1571;
select 1572 as n, (1572*3) as score, N'payload 01572 - kiểm thử dấu phẩy; -- Unicode' as payload where (1572 between 1 and 3000) and 1572+1>1572;
select 1573 as n, (1573*3) as score, N'payload 01573 - kiểm thử dấu phẩy; -- Unicode' as payload where (1573 between 1 and 3000) and 1573+1>1573;
select 1574 as n, (1574*3) as score, N'payload 01574 - kiểm thử dấu phẩy; -- Unicode' as payload where (1574 between 1 and 3000) and 1574+1>1574;
select 1575 as n, (1575*3) as score, N'payload 01575 - kiểm thử dấu phẩy; -- Unicode' as payload where (1575 between 1 and 3000) and 1575+1>1575;
select 1576 as n, (1576*3) as score, N'payload 01576 - kiểm thử dấu phẩy; -- Unicode' as payload where (1576 between 1 and 3000) and 1576+1>1576;
select 1577 as n, (1577*3) as score, N'payload 01577 - kiểm thử dấu phẩy; -- Unicode' as payload where (1577 between 1 and 3000) and 1577+1>1577;
select 1578 as n, (1578*3) as score, N'payload 01578 - kiểm thử dấu phẩy; -- Unicode' as payload where (1578 between 1 and 3000) and 1578+1>1578;
select 1579 as n, (1579*3) as score, N'payload 01579 - kiểm thử dấu phẩy; -- Unicode' as payload where (1579 between 1 and 3000) and 1579+1>1579;
select 1580 as n, (1580*3) as score, N'payload 01580 - kiểm thử dấu phẩy; -- Unicode' as payload where (1580 between 1 and 3000) and 1580+1>1580;
select 1581 as n, (1581*3) as score, N'payload 01581 - kiểm thử dấu phẩy; -- Unicode' as payload where (1581 between 1 and 3000) and 1581+1>1581;
select 1582 as n, (1582*3) as score, N'payload 01582 - kiểm thử dấu phẩy; -- Unicode' as payload where (1582 between 1 and 3000) and 1582+1>1582;
select 1583 as n, (1583*3) as score, N'payload 01583 - kiểm thử dấu phẩy; -- Unicode' as payload where (1583 between 1 and 3000) and 1583+1>1583;
select 1584 as n, (1584*3) as score, N'payload 01584 - kiểm thử dấu phẩy; -- Unicode' as payload where (1584 between 1 and 3000) and 1584+1>1584;
select 1585 as n, (1585*3) as score, N'payload 01585 - kiểm thử dấu phẩy; -- Unicode' as payload where (1585 between 1 and 3000) and 1585+1>1585;
select 1586 as n, (1586*3) as score, N'payload 01586 - kiểm thử dấu phẩy; -- Unicode' as payload where (1586 between 1 and 3000) and 1586+1>1586;
select 1587 as n, (1587*3) as score, N'payload 01587 - kiểm thử dấu phẩy; -- Unicode' as payload where (1587 between 1 and 3000) and 1587+1>1587;
select 1588 as n, (1588*3) as score, N'payload 01588 - kiểm thử dấu phẩy; -- Unicode' as payload where (1588 between 1 and 3000) and 1588+1>1588;
select 1589 as n, (1589*3) as score, N'payload 01589 - kiểm thử dấu phẩy; -- Unicode' as payload where (1589 between 1 and 3000) and 1589+1>1589;
select 1590 as n, (1590*3) as score, N'payload 01590 - kiểm thử dấu phẩy; -- Unicode' as payload where (1590 between 1 and 3000) and 1590+1>1590;
select 1591 as n, (1591*3) as score, N'payload 01591 - kiểm thử dấu phẩy; -- Unicode' as payload where (1591 between 1 and 3000) and 1591+1>1591;
select 1592 as n, (1592*3) as score, N'payload 01592 - kiểm thử dấu phẩy; -- Unicode' as payload where (1592 between 1 and 3000) and 1592+1>1592;
select 1593 as n, (1593*3) as score, N'payload 01593 - kiểm thử dấu phẩy; -- Unicode' as payload where (1593 between 1 and 3000) and 1593+1>1593;
select 1594 as n, (1594*3) as score, N'payload 01594 - kiểm thử dấu phẩy; -- Unicode' as payload where (1594 between 1 and 3000) and 1594+1>1594;
select 1595 as n, (1595*3) as score, N'payload 01595 - kiểm thử dấu phẩy; -- Unicode' as payload where (1595 between 1 and 3000) and 1595+1>1595;
select 1596 as n, (1596*3) as score, N'payload 01596 - kiểm thử dấu phẩy; -- Unicode' as payload where (1596 between 1 and 3000) and 1596+1>1596;
select 1597 as n, (1597*3) as score, N'payload 01597 - kiểm thử dấu phẩy; -- Unicode' as payload where (1597 between 1 and 3000) and 1597+1>1597;
select 1598 as n, (1598*3) as score, N'payload 01598 - kiểm thử dấu phẩy; -- Unicode' as payload where (1598 between 1 and 3000) and 1598+1>1598;
select 1599 as n, (1599*3) as score, N'payload 01599 - kiểm thử dấu phẩy; -- Unicode' as payload where (1599 between 1 and 3000) and 1599+1>1599;
select 1600 as n, (1600*3) as score, N'payload 01600 - kiểm thử dấu phẩy; -- Unicode' as payload where (1600 between 1 and 3000) and 1600+1>1600;
select 1601 as n, (1601*3) as score, N'payload 01601 - kiểm thử dấu phẩy; -- Unicode' as payload where (1601 between 1 and 3000) and 1601+1>1601;
select 1602 as n, (1602*3) as score, N'payload 01602 - kiểm thử dấu phẩy; -- Unicode' as payload where (1602 between 1 and 3000) and 1602+1>1602;
select 1603 as n, (1603*3) as score, N'payload 01603 - kiểm thử dấu phẩy; -- Unicode' as payload where (1603 between 1 and 3000) and 1603+1>1603;
select 1604 as n, (1604*3) as score, N'payload 01604 - kiểm thử dấu phẩy; -- Unicode' as payload where (1604 between 1 and 3000) and 1604+1>1604;
select 1605 as n, (1605*3) as score, N'payload 01605 - kiểm thử dấu phẩy; -- Unicode' as payload where (1605 between 1 and 3000) and 1605+1>1605;
select 1606 as n, (1606*3) as score, N'payload 01606 - kiểm thử dấu phẩy; -- Unicode' as payload where (1606 between 1 and 3000) and 1606+1>1606;
select 1607 as n, (1607*3) as score, N'payload 01607 - kiểm thử dấu phẩy; -- Unicode' as payload where (1607 between 1 and 3000) and 1607+1>1607;
select 1608 as n, (1608*3) as score, N'payload 01608 - kiểm thử dấu phẩy; -- Unicode' as payload where (1608 between 1 and 3000) and 1608+1>1608;
select 1609 as n, (1609*3) as score, N'payload 01609 - kiểm thử dấu phẩy; -- Unicode' as payload where (1609 between 1 and 3000) and 1609+1>1609;
select 1610 as n, (1610*3) as score, N'payload 01610 - kiểm thử dấu phẩy; -- Unicode' as payload where (1610 between 1 and 3000) and 1610+1>1610;
select 1611 as n, (1611*3) as score, N'payload 01611 - kiểm thử dấu phẩy; -- Unicode' as payload where (1611 between 1 and 3000) and 1611+1>1611;
select 1612 as n, (1612*3) as score, N'payload 01612 - kiểm thử dấu phẩy; -- Unicode' as payload where (1612 between 1 and 3000) and 1612+1>1612;
select 1613 as n, (1613*3) as score, N'payload 01613 - kiểm thử dấu phẩy; -- Unicode' as payload where (1613 between 1 and 3000) and 1613+1>1613;
select 1614 as n, (1614*3) as score, N'payload 01614 - kiểm thử dấu phẩy; -- Unicode' as payload where (1614 between 1 and 3000) and 1614+1>1614;
select 1615 as n, (1615*3) as score, N'payload 01615 - kiểm thử dấu phẩy; -- Unicode' as payload where (1615 between 1 and 3000) and 1615+1>1615;
select 1616 as n, (1616*3) as score, N'payload 01616 - kiểm thử dấu phẩy; -- Unicode' as payload where (1616 between 1 and 3000) and 1616+1>1616;
select 1617 as n, (1617*3) as score, N'payload 01617 - kiểm thử dấu phẩy; -- Unicode' as payload where (1617 between 1 and 3000) and 1617+1>1617;
select 1618 as n, (1618*3) as score, N'payload 01618 - kiểm thử dấu phẩy; -- Unicode' as payload where (1618 between 1 and 3000) and 1618+1>1618;
select 1619 as n, (1619*3) as score, N'payload 01619 - kiểm thử dấu phẩy; -- Unicode' as payload where (1619 between 1 and 3000) and 1619+1>1619;
select 1620 as n, (1620*3) as score, N'payload 01620 - kiểm thử dấu phẩy; -- Unicode' as payload where (1620 between 1 and 3000) and 1620+1>1620;
select 1621 as n, (1621*3) as score, N'payload 01621 - kiểm thử dấu phẩy; -- Unicode' as payload where (1621 between 1 and 3000) and 1621+1>1621;
select 1622 as n, (1622*3) as score, N'payload 01622 - kiểm thử dấu phẩy; -- Unicode' as payload where (1622 between 1 and 3000) and 1622+1>1622;
select 1623 as n, (1623*3) as score, N'payload 01623 - kiểm thử dấu phẩy; -- Unicode' as payload where (1623 between 1 and 3000) and 1623+1>1623;
select 1624 as n, (1624*3) as score, N'payload 01624 - kiểm thử dấu phẩy; -- Unicode' as payload where (1624 between 1 and 3000) and 1624+1>1624;
select 1625 as n, (1625*3) as score, N'payload 01625 - kiểm thử dấu phẩy; -- Unicode' as payload where (1625 between 1 and 3000) and 1625+1>1625;
select 1626 as n, (1626*3) as score, N'payload 01626 - kiểm thử dấu phẩy; -- Unicode' as payload where (1626 between 1 and 3000) and 1626+1>1626;
select 1627 as n, (1627*3) as score, N'payload 01627 - kiểm thử dấu phẩy; -- Unicode' as payload where (1627 between 1 and 3000) and 1627+1>1627;
select 1628 as n, (1628*3) as score, N'payload 01628 - kiểm thử dấu phẩy; -- Unicode' as payload where (1628 between 1 and 3000) and 1628+1>1628;
select 1629 as n, (1629*3) as score, N'payload 01629 - kiểm thử dấu phẩy; -- Unicode' as payload where (1629 between 1 and 3000) and 1629+1>1629;
select 1630 as n, (1630*3) as score, N'payload 01630 - kiểm thử dấu phẩy; -- Unicode' as payload where (1630 between 1 and 3000) and 1630+1>1630;
select 1631 as n, (1631*3) as score, N'payload 01631 - kiểm thử dấu phẩy; -- Unicode' as payload where (1631 between 1 and 3000) and 1631+1>1631;
select 1632 as n, (1632*3) as score, N'payload 01632 - kiểm thử dấu phẩy; -- Unicode' as payload where (1632 between 1 and 3000) and 1632+1>1632;
select 1633 as n, (1633*3) as score, N'payload 01633 - kiểm thử dấu phẩy; -- Unicode' as payload where (1633 between 1 and 3000) and 1633+1>1633;
select 1634 as n, (1634*3) as score, N'payload 01634 - kiểm thử dấu phẩy; -- Unicode' as payload where (1634 between 1 and 3000) and 1634+1>1634;
select 1635 as n, (1635*3) as score, N'payload 01635 - kiểm thử dấu phẩy; -- Unicode' as payload where (1635 between 1 and 3000) and 1635+1>1635;
select 1636 as n, (1636*3) as score, N'payload 01636 - kiểm thử dấu phẩy; -- Unicode' as payload where (1636 between 1 and 3000) and 1636+1>1636;
select 1637 as n, (1637*3) as score, N'payload 01637 - kiểm thử dấu phẩy; -- Unicode' as payload where (1637 between 1 and 3000) and 1637+1>1637;
select 1638 as n, (1638*3) as score, N'payload 01638 - kiểm thử dấu phẩy; -- Unicode' as payload where (1638 between 1 and 3000) and 1638+1>1638;
select 1639 as n, (1639*3) as score, N'payload 01639 - kiểm thử dấu phẩy; -- Unicode' as payload where (1639 between 1 and 3000) and 1639+1>1639;
select 1640 as n, (1640*3) as score, N'payload 01640 - kiểm thử dấu phẩy; -- Unicode' as payload where (1640 between 1 and 3000) and 1640+1>1640;
select 1641 as n, (1641*3) as score, N'payload 01641 - kiểm thử dấu phẩy; -- Unicode' as payload where (1641 between 1 and 3000) and 1641+1>1641;
select 1642 as n, (1642*3) as score, N'payload 01642 - kiểm thử dấu phẩy; -- Unicode' as payload where (1642 between 1 and 3000) and 1642+1>1642;
select 1643 as n, (1643*3) as score, N'payload 01643 - kiểm thử dấu phẩy; -- Unicode' as payload where (1643 between 1 and 3000) and 1643+1>1643;
select 1644 as n, (1644*3) as score, N'payload 01644 - kiểm thử dấu phẩy; -- Unicode' as payload where (1644 between 1 and 3000) and 1644+1>1644;
select 1645 as n, (1645*3) as score, N'payload 01645 - kiểm thử dấu phẩy; -- Unicode' as payload where (1645 between 1 and 3000) and 1645+1>1645;
select 1646 as n, (1646*3) as score, N'payload 01646 - kiểm thử dấu phẩy; -- Unicode' as payload where (1646 between 1 and 3000) and 1646+1>1646;
select 1647 as n, (1647*3) as score, N'payload 01647 - kiểm thử dấu phẩy; -- Unicode' as payload where (1647 between 1 and 3000) and 1647+1>1647;
select 1648 as n, (1648*3) as score, N'payload 01648 - kiểm thử dấu phẩy; -- Unicode' as payload where (1648 between 1 and 3000) and 1648+1>1648;
select 1649 as n, (1649*3) as score, N'payload 01649 - kiểm thử dấu phẩy; -- Unicode' as payload where (1649 between 1 and 3000) and 1649+1>1649;
select 1650 as n, (1650*3) as score, N'payload 01650 - kiểm thử dấu phẩy; -- Unicode' as payload where (1650 between 1 and 3000) and 1650+1>1650;
select 1651 as n, (1651*3) as score, N'payload 01651 - kiểm thử dấu phẩy; -- Unicode' as payload where (1651 between 1 and 3000) and 1651+1>1651;
select 1652 as n, (1652*3) as score, N'payload 01652 - kiểm thử dấu phẩy; -- Unicode' as payload where (1652 between 1 and 3000) and 1652+1>1652;
select 1653 as n, (1653*3) as score, N'payload 01653 - kiểm thử dấu phẩy; -- Unicode' as payload where (1653 between 1 and 3000) and 1653+1>1653;
select 1654 as n, (1654*3) as score, N'payload 01654 - kiểm thử dấu phẩy; -- Unicode' as payload where (1654 between 1 and 3000) and 1654+1>1654;
select 1655 as n, (1655*3) as score, N'payload 01655 - kiểm thử dấu phẩy; -- Unicode' as payload where (1655 between 1 and 3000) and 1655+1>1655;
select 1656 as n, (1656*3) as score, N'payload 01656 - kiểm thử dấu phẩy; -- Unicode' as payload where (1656 between 1 and 3000) and 1656+1>1656;
select 1657 as n, (1657*3) as score, N'payload 01657 - kiểm thử dấu phẩy; -- Unicode' as payload where (1657 between 1 and 3000) and 1657+1>1657;
select 1658 as n, (1658*3) as score, N'payload 01658 - kiểm thử dấu phẩy; -- Unicode' as payload where (1658 between 1 and 3000) and 1658+1>1658;
select 1659 as n, (1659*3) as score, N'payload 01659 - kiểm thử dấu phẩy; -- Unicode' as payload where (1659 between 1 and 3000) and 1659+1>1659;
select 1660 as n, (1660*3) as score, N'payload 01660 - kiểm thử dấu phẩy; -- Unicode' as payload where (1660 between 1 and 3000) and 1660+1>1660;
select 1661 as n, (1661*3) as score, N'payload 01661 - kiểm thử dấu phẩy; -- Unicode' as payload where (1661 between 1 and 3000) and 1661+1>1661;
select 1662 as n, (1662*3) as score, N'payload 01662 - kiểm thử dấu phẩy; -- Unicode' as payload where (1662 between 1 and 3000) and 1662+1>1662;
select 1663 as n, (1663*3) as score, N'payload 01663 - kiểm thử dấu phẩy; -- Unicode' as payload where (1663 between 1 and 3000) and 1663+1>1663;
select 1664 as n, (1664*3) as score, N'payload 01664 - kiểm thử dấu phẩy; -- Unicode' as payload where (1664 between 1 and 3000) and 1664+1>1664;
select 1665 as n, (1665*3) as score, N'payload 01665 - kiểm thử dấu phẩy; -- Unicode' as payload where (1665 between 1 and 3000) and 1665+1>1665;
select 1666 as n, (1666*3) as score, N'payload 01666 - kiểm thử dấu phẩy; -- Unicode' as payload where (1666 between 1 and 3000) and 1666+1>1666;
select 1667 as n, (1667*3) as score, N'payload 01667 - kiểm thử dấu phẩy; -- Unicode' as payload where (1667 between 1 and 3000) and 1667+1>1667;
select 1668 as n, (1668*3) as score, N'payload 01668 - kiểm thử dấu phẩy; -- Unicode' as payload where (1668 between 1 and 3000) and 1668+1>1668;
select 1669 as n, (1669*3) as score, N'payload 01669 - kiểm thử dấu phẩy; -- Unicode' as payload where (1669 between 1 and 3000) and 1669+1>1669;
select 1670 as n, (1670*3) as score, N'payload 01670 - kiểm thử dấu phẩy; -- Unicode' as payload where (1670 between 1 and 3000) and 1670+1>1670;
select 1671 as n, (1671*3) as score, N'payload 01671 - kiểm thử dấu phẩy; -- Unicode' as payload where (1671 between 1 and 3000) and 1671+1>1671;
select 1672 as n, (1672*3) as score, N'payload 01672 - kiểm thử dấu phẩy; -- Unicode' as payload where (1672 between 1 and 3000) and 1672+1>1672;
select 1673 as n, (1673*3) as score, N'payload 01673 - kiểm thử dấu phẩy; -- Unicode' as payload where (1673 between 1 and 3000) and 1673+1>1673;
select 1674 as n, (1674*3) as score, N'payload 01674 - kiểm thử dấu phẩy; -- Unicode' as payload where (1674 between 1 and 3000) and 1674+1>1674;
select 1675 as n, (1675*3) as score, N'payload 01675 - kiểm thử dấu phẩy; -- Unicode' as payload where (1675 between 1 and 3000) and 1675+1>1675;
select 1676 as n, (1676*3) as score, N'payload 01676 - kiểm thử dấu phẩy; -- Unicode' as payload where (1676 between 1 and 3000) and 1676+1>1676;
select 1677 as n, (1677*3) as score, N'payload 01677 - kiểm thử dấu phẩy; -- Unicode' as payload where (1677 between 1 and 3000) and 1677+1>1677;
select 1678 as n, (1678*3) as score, N'payload 01678 - kiểm thử dấu phẩy; -- Unicode' as payload where (1678 between 1 and 3000) and 1678+1>1678;
select 1679 as n, (1679*3) as score, N'payload 01679 - kiểm thử dấu phẩy; -- Unicode' as payload where (1679 between 1 and 3000) and 1679+1>1679;
select 1680 as n, (1680*3) as score, N'payload 01680 - kiểm thử dấu phẩy; -- Unicode' as payload where (1680 between 1 and 3000) and 1680+1>1680;
select 1681 as n, (1681*3) as score, N'payload 01681 - kiểm thử dấu phẩy; -- Unicode' as payload where (1681 between 1 and 3000) and 1681+1>1681;
select 1682 as n, (1682*3) as score, N'payload 01682 - kiểm thử dấu phẩy; -- Unicode' as payload where (1682 between 1 and 3000) and 1682+1>1682;
select 1683 as n, (1683*3) as score, N'payload 01683 - kiểm thử dấu phẩy; -- Unicode' as payload where (1683 between 1 and 3000) and 1683+1>1683;
select 1684 as n, (1684*3) as score, N'payload 01684 - kiểm thử dấu phẩy; -- Unicode' as payload where (1684 between 1 and 3000) and 1684+1>1684;
select 1685 as n, (1685*3) as score, N'payload 01685 - kiểm thử dấu phẩy; -- Unicode' as payload where (1685 between 1 and 3000) and 1685+1>1685;
select 1686 as n, (1686*3) as score, N'payload 01686 - kiểm thử dấu phẩy; -- Unicode' as payload where (1686 between 1 and 3000) and 1686+1>1686;
select 1687 as n, (1687*3) as score, N'payload 01687 - kiểm thử dấu phẩy; -- Unicode' as payload where (1687 between 1 and 3000) and 1687+1>1687;
select 1688 as n, (1688*3) as score, N'payload 01688 - kiểm thử dấu phẩy; -- Unicode' as payload where (1688 between 1 and 3000) and 1688+1>1688;
select 1689 as n, (1689*3) as score, N'payload 01689 - kiểm thử dấu phẩy; -- Unicode' as payload where (1689 between 1 and 3000) and 1689+1>1689;
select 1690 as n, (1690*3) as score, N'payload 01690 - kiểm thử dấu phẩy; -- Unicode' as payload where (1690 between 1 and 3000) and 1690+1>1690;
select 1691 as n, (1691*3) as score, N'payload 01691 - kiểm thử dấu phẩy; -- Unicode' as payload where (1691 between 1 and 3000) and 1691+1>1691;
select 1692 as n, (1692*3) as score, N'payload 01692 - kiểm thử dấu phẩy; -- Unicode' as payload where (1692 between 1 and 3000) and 1692+1>1692;
select 1693 as n, (1693*3) as score, N'payload 01693 - kiểm thử dấu phẩy; -- Unicode' as payload where (1693 between 1 and 3000) and 1693+1>1693;
select 1694 as n, (1694*3) as score, N'payload 01694 - kiểm thử dấu phẩy; -- Unicode' as payload where (1694 between 1 and 3000) and 1694+1>1694;
select 1695 as n, (1695*3) as score, N'payload 01695 - kiểm thử dấu phẩy; -- Unicode' as payload where (1695 between 1 and 3000) and 1695+1>1695;
select 1696 as n, (1696*3) as score, N'payload 01696 - kiểm thử dấu phẩy; -- Unicode' as payload where (1696 between 1 and 3000) and 1696+1>1696;
select 1697 as n, (1697*3) as score, N'payload 01697 - kiểm thử dấu phẩy; -- Unicode' as payload where (1697 between 1 and 3000) and 1697+1>1697;
select 1698 as n, (1698*3) as score, N'payload 01698 - kiểm thử dấu phẩy; -- Unicode' as payload where (1698 between 1 and 3000) and 1698+1>1698;
select 1699 as n, (1699*3) as score, N'payload 01699 - kiểm thử dấu phẩy; -- Unicode' as payload where (1699 between 1 and 3000) and 1699+1>1699;
select 1700 as n, (1700*3) as score, N'payload 01700 - kiểm thử dấu phẩy; -- Unicode' as payload where (1700 between 1 and 3000) and 1700+1>1700;
select 1701 as n, (1701*3) as score, N'payload 01701 - kiểm thử dấu phẩy; -- Unicode' as payload where (1701 between 1 and 3000) and 1701+1>1701;
select 1702 as n, (1702*3) as score, N'payload 01702 - kiểm thử dấu phẩy; -- Unicode' as payload where (1702 between 1 and 3000) and 1702+1>1702;
select 1703 as n, (1703*3) as score, N'payload 01703 - kiểm thử dấu phẩy; -- Unicode' as payload where (1703 between 1 and 3000) and 1703+1>1703;
select 1704 as n, (1704*3) as score, N'payload 01704 - kiểm thử dấu phẩy; -- Unicode' as payload where (1704 between 1 and 3000) and 1704+1>1704;
select 1705 as n, (1705*3) as score, N'payload 01705 - kiểm thử dấu phẩy; -- Unicode' as payload where (1705 between 1 and 3000) and 1705+1>1705;
select 1706 as n, (1706*3) as score, N'payload 01706 - kiểm thử dấu phẩy; -- Unicode' as payload where (1706 between 1 and 3000) and 1706+1>1706;
select 1707 as n, (1707*3) as score, N'payload 01707 - kiểm thử dấu phẩy; -- Unicode' as payload where (1707 between 1 and 3000) and 1707+1>1707;
select 1708 as n, (1708*3) as score, N'payload 01708 - kiểm thử dấu phẩy; -- Unicode' as payload where (1708 between 1 and 3000) and 1708+1>1708;
select 1709 as n, (1709*3) as score, N'payload 01709 - kiểm thử dấu phẩy; -- Unicode' as payload where (1709 between 1 and 3000) and 1709+1>1709;
select 1710 as n, (1710*3) as score, N'payload 01710 - kiểm thử dấu phẩy; -- Unicode' as payload where (1710 between 1 and 3000) and 1710+1>1710;
select 1711 as n, (1711*3) as score, N'payload 01711 - kiểm thử dấu phẩy; -- Unicode' as payload where (1711 between 1 and 3000) and 1711+1>1711;
select 1712 as n, (1712*3) as score, N'payload 01712 - kiểm thử dấu phẩy; -- Unicode' as payload where (1712 between 1 and 3000) and 1712+1>1712;
select 1713 as n, (1713*3) as score, N'payload 01713 - kiểm thử dấu phẩy; -- Unicode' as payload where (1713 between 1 and 3000) and 1713+1>1713;
select 1714 as n, (1714*3) as score, N'payload 01714 - kiểm thử dấu phẩy; -- Unicode' as payload where (1714 between 1 and 3000) and 1714+1>1714;
select 1715 as n, (1715*3) as score, N'payload 01715 - kiểm thử dấu phẩy; -- Unicode' as payload where (1715 between 1 and 3000) and 1715+1>1715;
select 1716 as n, (1716*3) as score, N'payload 01716 - kiểm thử dấu phẩy; -- Unicode' as payload where (1716 between 1 and 3000) and 1716+1>1716;
select 1717 as n, (1717*3) as score, N'payload 01717 - kiểm thử dấu phẩy; -- Unicode' as payload where (1717 between 1 and 3000) and 1717+1>1717;
select 1718 as n, (1718*3) as score, N'payload 01718 - kiểm thử dấu phẩy; -- Unicode' as payload where (1718 between 1 and 3000) and 1718+1>1718;
select 1719 as n, (1719*3) as score, N'payload 01719 - kiểm thử dấu phẩy; -- Unicode' as payload where (1719 between 1 and 3000) and 1719+1>1719;
select 1720 as n, (1720*3) as score, N'payload 01720 - kiểm thử dấu phẩy; -- Unicode' as payload where (1720 between 1 and 3000) and 1720+1>1720;
select 1721 as n, (1721*3) as score, N'payload 01721 - kiểm thử dấu phẩy; -- Unicode' as payload where (1721 between 1 and 3000) and 1721+1>1721;
select 1722 as n, (1722*3) as score, N'payload 01722 - kiểm thử dấu phẩy; -- Unicode' as payload where (1722 between 1 and 3000) and 1722+1>1722;
select 1723 as n, (1723*3) as score, N'payload 01723 - kiểm thử dấu phẩy; -- Unicode' as payload where (1723 between 1 and 3000) and 1723+1>1723;
select 1724 as n, (1724*3) as score, N'payload 01724 - kiểm thử dấu phẩy; -- Unicode' as payload where (1724 between 1 and 3000) and 1724+1>1724;
select 1725 as n, (1725*3) as score, N'payload 01725 - kiểm thử dấu phẩy; -- Unicode' as payload where (1725 between 1 and 3000) and 1725+1>1725;
select 1726 as n, (1726*3) as score, N'payload 01726 - kiểm thử dấu phẩy; -- Unicode' as payload where (1726 between 1 and 3000) and 1726+1>1726;
select 1727 as n, (1727*3) as score, N'payload 01727 - kiểm thử dấu phẩy; -- Unicode' as payload where (1727 between 1 and 3000) and 1727+1>1727;
select 1728 as n, (1728*3) as score, N'payload 01728 - kiểm thử dấu phẩy; -- Unicode' as payload where (1728 between 1 and 3000) and 1728+1>1728;
select 1729 as n, (1729*3) as score, N'payload 01729 - kiểm thử dấu phẩy; -- Unicode' as payload where (1729 between 1 and 3000) and 1729+1>1729;
select 1730 as n, (1730*3) as score, N'payload 01730 - kiểm thử dấu phẩy; -- Unicode' as payload where (1730 between 1 and 3000) and 1730+1>1730;
select 1731 as n, (1731*3) as score, N'payload 01731 - kiểm thử dấu phẩy; -- Unicode' as payload where (1731 between 1 and 3000) and 1731+1>1731;
select 1732 as n, (1732*3) as score, N'payload 01732 - kiểm thử dấu phẩy; -- Unicode' as payload where (1732 between 1 and 3000) and 1732+1>1732;
select 1733 as n, (1733*3) as score, N'payload 01733 - kiểm thử dấu phẩy; -- Unicode' as payload where (1733 between 1 and 3000) and 1733+1>1733;
select 1734 as n, (1734*3) as score, N'payload 01734 - kiểm thử dấu phẩy; -- Unicode' as payload where (1734 between 1 and 3000) and 1734+1>1734;
select 1735 as n, (1735*3) as score, N'payload 01735 - kiểm thử dấu phẩy; -- Unicode' as payload where (1735 between 1 and 3000) and 1735+1>1735;
select 1736 as n, (1736*3) as score, N'payload 01736 - kiểm thử dấu phẩy; -- Unicode' as payload where (1736 between 1 and 3000) and 1736+1>1736;
select 1737 as n, (1737*3) as score, N'payload 01737 - kiểm thử dấu phẩy; -- Unicode' as payload where (1737 between 1 and 3000) and 1737+1>1737;
select 1738 as n, (1738*3) as score, N'payload 01738 - kiểm thử dấu phẩy; -- Unicode' as payload where (1738 between 1 and 3000) and 1738+1>1738;
select 1739 as n, (1739*3) as score, N'payload 01739 - kiểm thử dấu phẩy; -- Unicode' as payload where (1739 between 1 and 3000) and 1739+1>1739;
select 1740 as n, (1740*3) as score, N'payload 01740 - kiểm thử dấu phẩy; -- Unicode' as payload where (1740 between 1 and 3000) and 1740+1>1740;
select 1741 as n, (1741*3) as score, N'payload 01741 - kiểm thử dấu phẩy; -- Unicode' as payload where (1741 between 1 and 3000) and 1741+1>1741;
select 1742 as n, (1742*3) as score, N'payload 01742 - kiểm thử dấu phẩy; -- Unicode' as payload where (1742 between 1 and 3000) and 1742+1>1742;
select 1743 as n, (1743*3) as score, N'payload 01743 - kiểm thử dấu phẩy; -- Unicode' as payload where (1743 between 1 and 3000) and 1743+1>1743;
select 1744 as n, (1744*3) as score, N'payload 01744 - kiểm thử dấu phẩy; -- Unicode' as payload where (1744 between 1 and 3000) and 1744+1>1744;
select 1745 as n, (1745*3) as score, N'payload 01745 - kiểm thử dấu phẩy; -- Unicode' as payload where (1745 between 1 and 3000) and 1745+1>1745;
select 1746 as n, (1746*3) as score, N'payload 01746 - kiểm thử dấu phẩy; -- Unicode' as payload where (1746 between 1 and 3000) and 1746+1>1746;
select 1747 as n, (1747*3) as score, N'payload 01747 - kiểm thử dấu phẩy; -- Unicode' as payload where (1747 between 1 and 3000) and 1747+1>1747;
select 1748 as n, (1748*3) as score, N'payload 01748 - kiểm thử dấu phẩy; -- Unicode' as payload where (1748 between 1 and 3000) and 1748+1>1748;
select 1749 as n, (1749*3) as score, N'payload 01749 - kiểm thử dấu phẩy; -- Unicode' as payload where (1749 between 1 and 3000) and 1749+1>1749;
select 1750 as n, (1750*3) as score, N'payload 01750 - kiểm thử dấu phẩy; -- Unicode' as payload where (1750 between 1 and 3000) and 1750+1>1750;
select 1751 as n, (1751*3) as score, N'payload 01751 - kiểm thử dấu phẩy; -- Unicode' as payload where (1751 between 1 and 3000) and 1751+1>1751;
select 1752 as n, (1752*3) as score, N'payload 01752 - kiểm thử dấu phẩy; -- Unicode' as payload where (1752 between 1 and 3000) and 1752+1>1752;
select 1753 as n, (1753*3) as score, N'payload 01753 - kiểm thử dấu phẩy; -- Unicode' as payload where (1753 between 1 and 3000) and 1753+1>1753;
select 1754 as n, (1754*3) as score, N'payload 01754 - kiểm thử dấu phẩy; -- Unicode' as payload where (1754 between 1 and 3000) and 1754+1>1754;
select 1755 as n, (1755*3) as score, N'payload 01755 - kiểm thử dấu phẩy; -- Unicode' as payload where (1755 between 1 and 3000) and 1755+1>1755;
select 1756 as n, (1756*3) as score, N'payload 01756 - kiểm thử dấu phẩy; -- Unicode' as payload where (1756 between 1 and 3000) and 1756+1>1756;
select 1757 as n, (1757*3) as score, N'payload 01757 - kiểm thử dấu phẩy; -- Unicode' as payload where (1757 between 1 and 3000) and 1757+1>1757;
select 1758 as n, (1758*3) as score, N'payload 01758 - kiểm thử dấu phẩy; -- Unicode' as payload where (1758 between 1 and 3000) and 1758+1>1758;
select 1759 as n, (1759*3) as score, N'payload 01759 - kiểm thử dấu phẩy; -- Unicode' as payload where (1759 between 1 and 3000) and 1759+1>1759;
select 1760 as n, (1760*3) as score, N'payload 01760 - kiểm thử dấu phẩy; -- Unicode' as payload where (1760 between 1 and 3000) and 1760+1>1760;
select 1761 as n, (1761*3) as score, N'payload 01761 - kiểm thử dấu phẩy; -- Unicode' as payload where (1761 between 1 and 3000) and 1761+1>1761;
select 1762 as n, (1762*3) as score, N'payload 01762 - kiểm thử dấu phẩy; -- Unicode' as payload where (1762 between 1 and 3000) and 1762+1>1762;
select 1763 as n, (1763*3) as score, N'payload 01763 - kiểm thử dấu phẩy; -- Unicode' as payload where (1763 between 1 and 3000) and 1763+1>1763;
select 1764 as n, (1764*3) as score, N'payload 01764 - kiểm thử dấu phẩy; -- Unicode' as payload where (1764 between 1 and 3000) and 1764+1>1764;
select 1765 as n, (1765*3) as score, N'payload 01765 - kiểm thử dấu phẩy; -- Unicode' as payload where (1765 between 1 and 3000) and 1765+1>1765;
select 1766 as n, (1766*3) as score, N'payload 01766 - kiểm thử dấu phẩy; -- Unicode' as payload where (1766 between 1 and 3000) and 1766+1>1766;
select 1767 as n, (1767*3) as score, N'payload 01767 - kiểm thử dấu phẩy; -- Unicode' as payload where (1767 between 1 and 3000) and 1767+1>1767;
select 1768 as n, (1768*3) as score, N'payload 01768 - kiểm thử dấu phẩy; -- Unicode' as payload where (1768 between 1 and 3000) and 1768+1>1768;
select 1769 as n, (1769*3) as score, N'payload 01769 - kiểm thử dấu phẩy; -- Unicode' as payload where (1769 between 1 and 3000) and 1769+1>1769;
select 1770 as n, (1770*3) as score, N'payload 01770 - kiểm thử dấu phẩy; -- Unicode' as payload where (1770 between 1 and 3000) and 1770+1>1770;
select 1771 as n, (1771*3) as score, N'payload 01771 - kiểm thử dấu phẩy; -- Unicode' as payload where (1771 between 1 and 3000) and 1771+1>1771;
select 1772 as n, (1772*3) as score, N'payload 01772 - kiểm thử dấu phẩy; -- Unicode' as payload where (1772 between 1 and 3000) and 1772+1>1772;
select 1773 as n, (1773*3) as score, N'payload 01773 - kiểm thử dấu phẩy; -- Unicode' as payload where (1773 between 1 and 3000) and 1773+1>1773;
select 1774 as n, (1774*3) as score, N'payload 01774 - kiểm thử dấu phẩy; -- Unicode' as payload where (1774 between 1 and 3000) and 1774+1>1774;
select 1775 as n, (1775*3) as score, N'payload 01775 - kiểm thử dấu phẩy; -- Unicode' as payload where (1775 between 1 and 3000) and 1775+1>1775;
select 1776 as n, (1776*3) as score, N'payload 01776 - kiểm thử dấu phẩy; -- Unicode' as payload where (1776 between 1 and 3000) and 1776+1>1776;
select 1777 as n, (1777*3) as score, N'payload 01777 - kiểm thử dấu phẩy; -- Unicode' as payload where (1777 between 1 and 3000) and 1777+1>1777;
select 1778 as n, (1778*3) as score, N'payload 01778 - kiểm thử dấu phẩy; -- Unicode' as payload where (1778 between 1 and 3000) and 1778+1>1778;
select 1779 as n, (1779*3) as score, N'payload 01779 - kiểm thử dấu phẩy; -- Unicode' as payload where (1779 between 1 and 3000) and 1779+1>1779;
select 1780 as n, (1780*3) as score, N'payload 01780 - kiểm thử dấu phẩy; -- Unicode' as payload where (1780 between 1 and 3000) and 1780+1>1780;
select 1781 as n, (1781*3) as score, N'payload 01781 - kiểm thử dấu phẩy; -- Unicode' as payload where (1781 between 1 and 3000) and 1781+1>1781;
select 1782 as n, (1782*3) as score, N'payload 01782 - kiểm thử dấu phẩy; -- Unicode' as payload where (1782 between 1 and 3000) and 1782+1>1782;
select 1783 as n, (1783*3) as score, N'payload 01783 - kiểm thử dấu phẩy; -- Unicode' as payload where (1783 between 1 and 3000) and 1783+1>1783;
select 1784 as n, (1784*3) as score, N'payload 01784 - kiểm thử dấu phẩy; -- Unicode' as payload where (1784 between 1 and 3000) and 1784+1>1784;
select 1785 as n, (1785*3) as score, N'payload 01785 - kiểm thử dấu phẩy; -- Unicode' as payload where (1785 between 1 and 3000) and 1785+1>1785;
select 1786 as n, (1786*3) as score, N'payload 01786 - kiểm thử dấu phẩy; -- Unicode' as payload where (1786 between 1 and 3000) and 1786+1>1786;
select 1787 as n, (1787*3) as score, N'payload 01787 - kiểm thử dấu phẩy; -- Unicode' as payload where (1787 between 1 and 3000) and 1787+1>1787;
select 1788 as n, (1788*3) as score, N'payload 01788 - kiểm thử dấu phẩy; -- Unicode' as payload where (1788 between 1 and 3000) and 1788+1>1788;
select 1789 as n, (1789*3) as score, N'payload 01789 - kiểm thử dấu phẩy; -- Unicode' as payload where (1789 between 1 and 3000) and 1789+1>1789;
select 1790 as n, (1790*3) as score, N'payload 01790 - kiểm thử dấu phẩy; -- Unicode' as payload where (1790 between 1 and 3000) and 1790+1>1790;
select 1791 as n, (1791*3) as score, N'payload 01791 - kiểm thử dấu phẩy; -- Unicode' as payload where (1791 between 1 and 3000) and 1791+1>1791;
select 1792 as n, (1792*3) as score, N'payload 01792 - kiểm thử dấu phẩy; -- Unicode' as payload where (1792 between 1 and 3000) and 1792+1>1792;
select 1793 as n, (1793*3) as score, N'payload 01793 - kiểm thử dấu phẩy; -- Unicode' as payload where (1793 between 1 and 3000) and 1793+1>1793;
select 1794 as n, (1794*3) as score, N'payload 01794 - kiểm thử dấu phẩy; -- Unicode' as payload where (1794 between 1 and 3000) and 1794+1>1794;
select 1795 as n, (1795*3) as score, N'payload 01795 - kiểm thử dấu phẩy; -- Unicode' as payload where (1795 between 1 and 3000) and 1795+1>1795;
select 1796 as n, (1796*3) as score, N'payload 01796 - kiểm thử dấu phẩy; -- Unicode' as payload where (1796 between 1 and 3000) and 1796+1>1796;
select 1797 as n, (1797*3) as score, N'payload 01797 - kiểm thử dấu phẩy; -- Unicode' as payload where (1797 between 1 and 3000) and 1797+1>1797;
select 1798 as n, (1798*3) as score, N'payload 01798 - kiểm thử dấu phẩy; -- Unicode' as payload where (1798 between 1 and 3000) and 1798+1>1798;
select 1799 as n, (1799*3) as score, N'payload 01799 - kiểm thử dấu phẩy; -- Unicode' as payload where (1799 between 1 and 3000) and 1799+1>1799;
select 1800 as n, (1800*3) as score, N'payload 01800 - kiểm thử dấu phẩy; -- Unicode' as payload where (1800 between 1 and 3000) and 1800+1>1800;
select 1801 as n, (1801*3) as score, N'payload 01801 - kiểm thử dấu phẩy; -- Unicode' as payload where (1801 between 1 and 3000) and 1801+1>1801;
select 1802 as n, (1802*3) as score, N'payload 01802 - kiểm thử dấu phẩy; -- Unicode' as payload where (1802 between 1 and 3000) and 1802+1>1802;
select 1803 as n, (1803*3) as score, N'payload 01803 - kiểm thử dấu phẩy; -- Unicode' as payload where (1803 between 1 and 3000) and 1803+1>1803;
select 1804 as n, (1804*3) as score, N'payload 01804 - kiểm thử dấu phẩy; -- Unicode' as payload where (1804 between 1 and 3000) and 1804+1>1804;
select 1805 as n, (1805*3) as score, N'payload 01805 - kiểm thử dấu phẩy; -- Unicode' as payload where (1805 between 1 and 3000) and 1805+1>1805;
select 1806 as n, (1806*3) as score, N'payload 01806 - kiểm thử dấu phẩy; -- Unicode' as payload where (1806 between 1 and 3000) and 1806+1>1806;
select 1807 as n, (1807*3) as score, N'payload 01807 - kiểm thử dấu phẩy; -- Unicode' as payload where (1807 between 1 and 3000) and 1807+1>1807;
select 1808 as n, (1808*3) as score, N'payload 01808 - kiểm thử dấu phẩy; -- Unicode' as payload where (1808 between 1 and 3000) and 1808+1>1808;
select 1809 as n, (1809*3) as score, N'payload 01809 - kiểm thử dấu phẩy; -- Unicode' as payload where (1809 between 1 and 3000) and 1809+1>1809;
select 1810 as n, (1810*3) as score, N'payload 01810 - kiểm thử dấu phẩy; -- Unicode' as payload where (1810 between 1 and 3000) and 1810+1>1810;
select 1811 as n, (1811*3) as score, N'payload 01811 - kiểm thử dấu phẩy; -- Unicode' as payload where (1811 between 1 and 3000) and 1811+1>1811;
select 1812 as n, (1812*3) as score, N'payload 01812 - kiểm thử dấu phẩy; -- Unicode' as payload where (1812 between 1 and 3000) and 1812+1>1812;
select 1813 as n, (1813*3) as score, N'payload 01813 - kiểm thử dấu phẩy; -- Unicode' as payload where (1813 between 1 and 3000) and 1813+1>1813;
select 1814 as n, (1814*3) as score, N'payload 01814 - kiểm thử dấu phẩy; -- Unicode' as payload where (1814 between 1 and 3000) and 1814+1>1814;
select 1815 as n, (1815*3) as score, N'payload 01815 - kiểm thử dấu phẩy; -- Unicode' as payload where (1815 between 1 and 3000) and 1815+1>1815;
select 1816 as n, (1816*3) as score, N'payload 01816 - kiểm thử dấu phẩy; -- Unicode' as payload where (1816 between 1 and 3000) and 1816+1>1816;
select 1817 as n, (1817*3) as score, N'payload 01817 - kiểm thử dấu phẩy; -- Unicode' as payload where (1817 between 1 and 3000) and 1817+1>1817;
select 1818 as n, (1818*3) as score, N'payload 01818 - kiểm thử dấu phẩy; -- Unicode' as payload where (1818 between 1 and 3000) and 1818+1>1818;
select 1819 as n, (1819*3) as score, N'payload 01819 - kiểm thử dấu phẩy; -- Unicode' as payload where (1819 between 1 and 3000) and 1819+1>1819;
select 1820 as n, (1820*3) as score, N'payload 01820 - kiểm thử dấu phẩy; -- Unicode' as payload where (1820 between 1 and 3000) and 1820+1>1820;
select 1821 as n, (1821*3) as score, N'payload 01821 - kiểm thử dấu phẩy; -- Unicode' as payload where (1821 between 1 and 3000) and 1821+1>1821;
select 1822 as n, (1822*3) as score, N'payload 01822 - kiểm thử dấu phẩy; -- Unicode' as payload where (1822 between 1 and 3000) and 1822+1>1822;
select 1823 as n, (1823*3) as score, N'payload 01823 - kiểm thử dấu phẩy; -- Unicode' as payload where (1823 between 1 and 3000) and 1823+1>1823;
select 1824 as n, (1824*3) as score, N'payload 01824 - kiểm thử dấu phẩy; -- Unicode' as payload where (1824 between 1 and 3000) and 1824+1>1824;
select 1825 as n, (1825*3) as score, N'payload 01825 - kiểm thử dấu phẩy; -- Unicode' as payload where (1825 between 1 and 3000) and 1825+1>1825;
select 1826 as n, (1826*3) as score, N'payload 01826 - kiểm thử dấu phẩy; -- Unicode' as payload where (1826 between 1 and 3000) and 1826+1>1826;
select 1827 as n, (1827*3) as score, N'payload 01827 - kiểm thử dấu phẩy; -- Unicode' as payload where (1827 between 1 and 3000) and 1827+1>1827;
select 1828 as n, (1828*3) as score, N'payload 01828 - kiểm thử dấu phẩy; -- Unicode' as payload where (1828 between 1 and 3000) and 1828+1>1828;
select 1829 as n, (1829*3) as score, N'payload 01829 - kiểm thử dấu phẩy; -- Unicode' as payload where (1829 between 1 and 3000) and 1829+1>1829;
select 1830 as n, (1830*3) as score, N'payload 01830 - kiểm thử dấu phẩy; -- Unicode' as payload where (1830 between 1 and 3000) and 1830+1>1830;
select 1831 as n, (1831*3) as score, N'payload 01831 - kiểm thử dấu phẩy; -- Unicode' as payload where (1831 between 1 and 3000) and 1831+1>1831;
select 1832 as n, (1832*3) as score, N'payload 01832 - kiểm thử dấu phẩy; -- Unicode' as payload where (1832 between 1 and 3000) and 1832+1>1832;
select 1833 as n, (1833*3) as score, N'payload 01833 - kiểm thử dấu phẩy; -- Unicode' as payload where (1833 between 1 and 3000) and 1833+1>1833;
select 1834 as n, (1834*3) as score, N'payload 01834 - kiểm thử dấu phẩy; -- Unicode' as payload where (1834 between 1 and 3000) and 1834+1>1834;
select 1835 as n, (1835*3) as score, N'payload 01835 - kiểm thử dấu phẩy; -- Unicode' as payload where (1835 between 1 and 3000) and 1835+1>1835;
select 1836 as n, (1836*3) as score, N'payload 01836 - kiểm thử dấu phẩy; -- Unicode' as payload where (1836 between 1 and 3000) and 1836+1>1836;
select 1837 as n, (1837*3) as score, N'payload 01837 - kiểm thử dấu phẩy; -- Unicode' as payload where (1837 between 1 and 3000) and 1837+1>1837;
select 1838 as n, (1838*3) as score, N'payload 01838 - kiểm thử dấu phẩy; -- Unicode' as payload where (1838 between 1 and 3000) and 1838+1>1838;
select 1839 as n, (1839*3) as score, N'payload 01839 - kiểm thử dấu phẩy; -- Unicode' as payload where (1839 between 1 and 3000) and 1839+1>1839;
select 1840 as n, (1840*3) as score, N'payload 01840 - kiểm thử dấu phẩy; -- Unicode' as payload where (1840 between 1 and 3000) and 1840+1>1840;
select 1841 as n, (1841*3) as score, N'payload 01841 - kiểm thử dấu phẩy; -- Unicode' as payload where (1841 between 1 and 3000) and 1841+1>1841;
select 1842 as n, (1842*3) as score, N'payload 01842 - kiểm thử dấu phẩy; -- Unicode' as payload where (1842 between 1 and 3000) and 1842+1>1842;
select 1843 as n, (1843*3) as score, N'payload 01843 - kiểm thử dấu phẩy; -- Unicode' as payload where (1843 between 1 and 3000) and 1843+1>1843;
select 1844 as n, (1844*3) as score, N'payload 01844 - kiểm thử dấu phẩy; -- Unicode' as payload where (1844 between 1 and 3000) and 1844+1>1844;
select 1845 as n, (1845*3) as score, N'payload 01845 - kiểm thử dấu phẩy; -- Unicode' as payload where (1845 between 1 and 3000) and 1845+1>1845;
select 1846 as n, (1846*3) as score, N'payload 01846 - kiểm thử dấu phẩy; -- Unicode' as payload where (1846 between 1 and 3000) and 1846+1>1846;
select 1847 as n, (1847*3) as score, N'payload 01847 - kiểm thử dấu phẩy; -- Unicode' as payload where (1847 between 1 and 3000) and 1847+1>1847;
select 1848 as n, (1848*3) as score, N'payload 01848 - kiểm thử dấu phẩy; -- Unicode' as payload where (1848 between 1 and 3000) and 1848+1>1848;
select 1849 as n, (1849*3) as score, N'payload 01849 - kiểm thử dấu phẩy; -- Unicode' as payload where (1849 between 1 and 3000) and 1849+1>1849;
select 1850 as n, (1850*3) as score, N'payload 01850 - kiểm thử dấu phẩy; -- Unicode' as payload where (1850 between 1 and 3000) and 1850+1>1850;
select 1851 as n, (1851*3) as score, N'payload 01851 - kiểm thử dấu phẩy; -- Unicode' as payload where (1851 between 1 and 3000) and 1851+1>1851;
select 1852 as n, (1852*3) as score, N'payload 01852 - kiểm thử dấu phẩy; -- Unicode' as payload where (1852 between 1 and 3000) and 1852+1>1852;
select 1853 as n, (1853*3) as score, N'payload 01853 - kiểm thử dấu phẩy; -- Unicode' as payload where (1853 between 1 and 3000) and 1853+1>1853;
select 1854 as n, (1854*3) as score, N'payload 01854 - kiểm thử dấu phẩy; -- Unicode' as payload where (1854 between 1 and 3000) and 1854+1>1854;
select 1855 as n, (1855*3) as score, N'payload 01855 - kiểm thử dấu phẩy; -- Unicode' as payload where (1855 between 1 and 3000) and 1855+1>1855;
select 1856 as n, (1856*3) as score, N'payload 01856 - kiểm thử dấu phẩy; -- Unicode' as payload where (1856 between 1 and 3000) and 1856+1>1856;
select 1857 as n, (1857*3) as score, N'payload 01857 - kiểm thử dấu phẩy; -- Unicode' as payload where (1857 between 1 and 3000) and 1857+1>1857;
select 1858 as n, (1858*3) as score, N'payload 01858 - kiểm thử dấu phẩy; -- Unicode' as payload where (1858 between 1 and 3000) and 1858+1>1858;
select 1859 as n, (1859*3) as score, N'payload 01859 - kiểm thử dấu phẩy; -- Unicode' as payload where (1859 between 1 and 3000) and 1859+1>1859;
select 1860 as n, (1860*3) as score, N'payload 01860 - kiểm thử dấu phẩy; -- Unicode' as payload where (1860 between 1 and 3000) and 1860+1>1860;
select 1861 as n, (1861*3) as score, N'payload 01861 - kiểm thử dấu phẩy; -- Unicode' as payload where (1861 between 1 and 3000) and 1861+1>1861;
select 1862 as n, (1862*3) as score, N'payload 01862 - kiểm thử dấu phẩy; -- Unicode' as payload where (1862 between 1 and 3000) and 1862+1>1862;
select 1863 as n, (1863*3) as score, N'payload 01863 - kiểm thử dấu phẩy; -- Unicode' as payload where (1863 between 1 and 3000) and 1863+1>1863;
select 1864 as n, (1864*3) as score, N'payload 01864 - kiểm thử dấu phẩy; -- Unicode' as payload where (1864 between 1 and 3000) and 1864+1>1864;
select 1865 as n, (1865*3) as score, N'payload 01865 - kiểm thử dấu phẩy; -- Unicode' as payload where (1865 between 1 and 3000) and 1865+1>1865;
select 1866 as n, (1866*3) as score, N'payload 01866 - kiểm thử dấu phẩy; -- Unicode' as payload where (1866 between 1 and 3000) and 1866+1>1866;
select 1867 as n, (1867*3) as score, N'payload 01867 - kiểm thử dấu phẩy; -- Unicode' as payload where (1867 between 1 and 3000) and 1867+1>1867;
select 1868 as n, (1868*3) as score, N'payload 01868 - kiểm thử dấu phẩy; -- Unicode' as payload where (1868 between 1 and 3000) and 1868+1>1868;
select 1869 as n, (1869*3) as score, N'payload 01869 - kiểm thử dấu phẩy; -- Unicode' as payload where (1869 between 1 and 3000) and 1869+1>1869;
select 1870 as n, (1870*3) as score, N'payload 01870 - kiểm thử dấu phẩy; -- Unicode' as payload where (1870 between 1 and 3000) and 1870+1>1870;
select 1871 as n, (1871*3) as score, N'payload 01871 - kiểm thử dấu phẩy; -- Unicode' as payload where (1871 between 1 and 3000) and 1871+1>1871;
select 1872 as n, (1872*3) as score, N'payload 01872 - kiểm thử dấu phẩy; -- Unicode' as payload where (1872 between 1 and 3000) and 1872+1>1872;
select 1873 as n, (1873*3) as score, N'payload 01873 - kiểm thử dấu phẩy; -- Unicode' as payload where (1873 between 1 and 3000) and 1873+1>1873;
select 1874 as n, (1874*3) as score, N'payload 01874 - kiểm thử dấu phẩy; -- Unicode' as payload where (1874 between 1 and 3000) and 1874+1>1874;
select 1875 as n, (1875*3) as score, N'payload 01875 - kiểm thử dấu phẩy; -- Unicode' as payload where (1875 between 1 and 3000) and 1875+1>1875;
select 1876 as n, (1876*3) as score, N'payload 01876 - kiểm thử dấu phẩy; -- Unicode' as payload where (1876 between 1 and 3000) and 1876+1>1876;
select 1877 as n, (1877*3) as score, N'payload 01877 - kiểm thử dấu phẩy; -- Unicode' as payload where (1877 between 1 and 3000) and 1877+1>1877;
select 1878 as n, (1878*3) as score, N'payload 01878 - kiểm thử dấu phẩy; -- Unicode' as payload where (1878 between 1 and 3000) and 1878+1>1878;
select 1879 as n, (1879*3) as score, N'payload 01879 - kiểm thử dấu phẩy; -- Unicode' as payload where (1879 between 1 and 3000) and 1879+1>1879;
select 1880 as n, (1880*3) as score, N'payload 01880 - kiểm thử dấu phẩy; -- Unicode' as payload where (1880 between 1 and 3000) and 1880+1>1880;
select 1881 as n, (1881*3) as score, N'payload 01881 - kiểm thử dấu phẩy; -- Unicode' as payload where (1881 between 1 and 3000) and 1881+1>1881;
select 1882 as n, (1882*3) as score, N'payload 01882 - kiểm thử dấu phẩy; -- Unicode' as payload where (1882 between 1 and 3000) and 1882+1>1882;
select 1883 as n, (1883*3) as score, N'payload 01883 - kiểm thử dấu phẩy; -- Unicode' as payload where (1883 between 1 and 3000) and 1883+1>1883;
select 1884 as n, (1884*3) as score, N'payload 01884 - kiểm thử dấu phẩy; -- Unicode' as payload where (1884 between 1 and 3000) and 1884+1>1884;
select 1885 as n, (1885*3) as score, N'payload 01885 - kiểm thử dấu phẩy; -- Unicode' as payload where (1885 between 1 and 3000) and 1885+1>1885;
select 1886 as n, (1886*3) as score, N'payload 01886 - kiểm thử dấu phẩy; -- Unicode' as payload where (1886 between 1 and 3000) and 1886+1>1886;
select 1887 as n, (1887*3) as score, N'payload 01887 - kiểm thử dấu phẩy; -- Unicode' as payload where (1887 between 1 and 3000) and 1887+1>1887;
select 1888 as n, (1888*3) as score, N'payload 01888 - kiểm thử dấu phẩy; -- Unicode' as payload where (1888 between 1 and 3000) and 1888+1>1888;
select 1889 as n, (1889*3) as score, N'payload 01889 - kiểm thử dấu phẩy; -- Unicode' as payload where (1889 between 1 and 3000) and 1889+1>1889;
select 1890 as n, (1890*3) as score, N'payload 01890 - kiểm thử dấu phẩy; -- Unicode' as payload where (1890 between 1 and 3000) and 1890+1>1890;
select 1891 as n, (1891*3) as score, N'payload 01891 - kiểm thử dấu phẩy; -- Unicode' as payload where (1891 between 1 and 3000) and 1891+1>1891;
select 1892 as n, (1892*3) as score, N'payload 01892 - kiểm thử dấu phẩy; -- Unicode' as payload where (1892 between 1 and 3000) and 1892+1>1892;
select 1893 as n, (1893*3) as score, N'payload 01893 - kiểm thử dấu phẩy; -- Unicode' as payload where (1893 between 1 and 3000) and 1893+1>1893;
select 1894 as n, (1894*3) as score, N'payload 01894 - kiểm thử dấu phẩy; -- Unicode' as payload where (1894 between 1 and 3000) and 1894+1>1894;
select 1895 as n, (1895*3) as score, N'payload 01895 - kiểm thử dấu phẩy; -- Unicode' as payload where (1895 between 1 and 3000) and 1895+1>1895;
select 1896 as n, (1896*3) as score, N'payload 01896 - kiểm thử dấu phẩy; -- Unicode' as payload where (1896 between 1 and 3000) and 1896+1>1896;
select 1897 as n, (1897*3) as score, N'payload 01897 - kiểm thử dấu phẩy; -- Unicode' as payload where (1897 between 1 and 3000) and 1897+1>1897;
select 1898 as n, (1898*3) as score, N'payload 01898 - kiểm thử dấu phẩy; -- Unicode' as payload where (1898 between 1 and 3000) and 1898+1>1898;
select 1899 as n, (1899*3) as score, N'payload 01899 - kiểm thử dấu phẩy; -- Unicode' as payload where (1899 between 1 and 3000) and 1899+1>1899;
select 1900 as n, (1900*3) as score, N'payload 01900 - kiểm thử dấu phẩy; -- Unicode' as payload where (1900 between 1 and 3000) and 1900+1>1900;
select 1901 as n, (1901*3) as score, N'payload 01901 - kiểm thử dấu phẩy; -- Unicode' as payload where (1901 between 1 and 3000) and 1901+1>1901;
select 1902 as n, (1902*3) as score, N'payload 01902 - kiểm thử dấu phẩy; -- Unicode' as payload where (1902 between 1 and 3000) and 1902+1>1902;
select 1903 as n, (1903*3) as score, N'payload 01903 - kiểm thử dấu phẩy; -- Unicode' as payload where (1903 between 1 and 3000) and 1903+1>1903;
select 1904 as n, (1904*3) as score, N'payload 01904 - kiểm thử dấu phẩy; -- Unicode' as payload where (1904 between 1 and 3000) and 1904+1>1904;
select 1905 as n, (1905*3) as score, N'payload 01905 - kiểm thử dấu phẩy; -- Unicode' as payload where (1905 between 1 and 3000) and 1905+1>1905;
select 1906 as n, (1906*3) as score, N'payload 01906 - kiểm thử dấu phẩy; -- Unicode' as payload where (1906 between 1 and 3000) and 1906+1>1906;
select 1907 as n, (1907*3) as score, N'payload 01907 - kiểm thử dấu phẩy; -- Unicode' as payload where (1907 between 1 and 3000) and 1907+1>1907;
select 1908 as n, (1908*3) as score, N'payload 01908 - kiểm thử dấu phẩy; -- Unicode' as payload where (1908 between 1 and 3000) and 1908+1>1908;
select 1909 as n, (1909*3) as score, N'payload 01909 - kiểm thử dấu phẩy; -- Unicode' as payload where (1909 between 1 and 3000) and 1909+1>1909;
select 1910 as n, (1910*3) as score, N'payload 01910 - kiểm thử dấu phẩy; -- Unicode' as payload where (1910 between 1 and 3000) and 1910+1>1910;
select 1911 as n, (1911*3) as score, N'payload 01911 - kiểm thử dấu phẩy; -- Unicode' as payload where (1911 between 1 and 3000) and 1911+1>1911;
select 1912 as n, (1912*3) as score, N'payload 01912 - kiểm thử dấu phẩy; -- Unicode' as payload where (1912 between 1 and 3000) and 1912+1>1912;
select 1913 as n, (1913*3) as score, N'payload 01913 - kiểm thử dấu phẩy; -- Unicode' as payload where (1913 between 1 and 3000) and 1913+1>1913;
select 1914 as n, (1914*3) as score, N'payload 01914 - kiểm thử dấu phẩy; -- Unicode' as payload where (1914 between 1 and 3000) and 1914+1>1914;
select 1915 as n, (1915*3) as score, N'payload 01915 - kiểm thử dấu phẩy; -- Unicode' as payload where (1915 between 1 and 3000) and 1915+1>1915;
select 1916 as n, (1916*3) as score, N'payload 01916 - kiểm thử dấu phẩy; -- Unicode' as payload where (1916 between 1 and 3000) and 1916+1>1916;
select 1917 as n, (1917*3) as score, N'payload 01917 - kiểm thử dấu phẩy; -- Unicode' as payload where (1917 between 1 and 3000) and 1917+1>1917;
select 1918 as n, (1918*3) as score, N'payload 01918 - kiểm thử dấu phẩy; -- Unicode' as payload where (1918 between 1 and 3000) and 1918+1>1918;
select 1919 as n, (1919*3) as score, N'payload 01919 - kiểm thử dấu phẩy; -- Unicode' as payload where (1919 between 1 and 3000) and 1919+1>1919;
select 1920 as n, (1920*3) as score, N'payload 01920 - kiểm thử dấu phẩy; -- Unicode' as payload where (1920 between 1 and 3000) and 1920+1>1920;
select 1921 as n, (1921*3) as score, N'payload 01921 - kiểm thử dấu phẩy; -- Unicode' as payload where (1921 between 1 and 3000) and 1921+1>1921;
select 1922 as n, (1922*3) as score, N'payload 01922 - kiểm thử dấu phẩy; -- Unicode' as payload where (1922 between 1 and 3000) and 1922+1>1922;
select 1923 as n, (1923*3) as score, N'payload 01923 - kiểm thử dấu phẩy; -- Unicode' as payload where (1923 between 1 and 3000) and 1923+1>1923;
select 1924 as n, (1924*3) as score, N'payload 01924 - kiểm thử dấu phẩy; -- Unicode' as payload where (1924 between 1 and 3000) and 1924+1>1924;
select 1925 as n, (1925*3) as score, N'payload 01925 - kiểm thử dấu phẩy; -- Unicode' as payload where (1925 between 1 and 3000) and 1925+1>1925;
select 1926 as n, (1926*3) as score, N'payload 01926 - kiểm thử dấu phẩy; -- Unicode' as payload where (1926 between 1 and 3000) and 1926+1>1926;
select 1927 as n, (1927*3) as score, N'payload 01927 - kiểm thử dấu phẩy; -- Unicode' as payload where (1927 between 1 and 3000) and 1927+1>1927;
select 1928 as n, (1928*3) as score, N'payload 01928 - kiểm thử dấu phẩy; -- Unicode' as payload where (1928 between 1 and 3000) and 1928+1>1928;
select 1929 as n, (1929*3) as score, N'payload 01929 - kiểm thử dấu phẩy; -- Unicode' as payload where (1929 between 1 and 3000) and 1929+1>1929;
select 1930 as n, (1930*3) as score, N'payload 01930 - kiểm thử dấu phẩy; -- Unicode' as payload where (1930 between 1 and 3000) and 1930+1>1930;
select 1931 as n, (1931*3) as score, N'payload 01931 - kiểm thử dấu phẩy; -- Unicode' as payload where (1931 between 1 and 3000) and 1931+1>1931;
select 1932 as n, (1932*3) as score, N'payload 01932 - kiểm thử dấu phẩy; -- Unicode' as payload where (1932 between 1 and 3000) and 1932+1>1932;
select 1933 as n, (1933*3) as score, N'payload 01933 - kiểm thử dấu phẩy; -- Unicode' as payload where (1933 between 1 and 3000) and 1933+1>1933;
select 1934 as n, (1934*3) as score, N'payload 01934 - kiểm thử dấu phẩy; -- Unicode' as payload where (1934 between 1 and 3000) and 1934+1>1934;
select 1935 as n, (1935*3) as score, N'payload 01935 - kiểm thử dấu phẩy; -- Unicode' as payload where (1935 between 1 and 3000) and 1935+1>1935;
select 1936 as n, (1936*3) as score, N'payload 01936 - kiểm thử dấu phẩy; -- Unicode' as payload where (1936 between 1 and 3000) and 1936+1>1936;
select 1937 as n, (1937*3) as score, N'payload 01937 - kiểm thử dấu phẩy; -- Unicode' as payload where (1937 between 1 and 3000) and 1937+1>1937;
select 1938 as n, (1938*3) as score, N'payload 01938 - kiểm thử dấu phẩy; -- Unicode' as payload where (1938 between 1 and 3000) and 1938+1>1938;
select 1939 as n, (1939*3) as score, N'payload 01939 - kiểm thử dấu phẩy; -- Unicode' as payload where (1939 between 1 and 3000) and 1939+1>1939;
select 1940 as n, (1940*3) as score, N'payload 01940 - kiểm thử dấu phẩy; -- Unicode' as payload where (1940 between 1 and 3000) and 1940+1>1940;
select 1941 as n, (1941*3) as score, N'payload 01941 - kiểm thử dấu phẩy; -- Unicode' as payload where (1941 between 1 and 3000) and 1941+1>1941;
select 1942 as n, (1942*3) as score, N'payload 01942 - kiểm thử dấu phẩy; -- Unicode' as payload where (1942 between 1 and 3000) and 1942+1>1942;
select 1943 as n, (1943*3) as score, N'payload 01943 - kiểm thử dấu phẩy; -- Unicode' as payload where (1943 between 1 and 3000) and 1943+1>1943;
select 1944 as n, (1944*3) as score, N'payload 01944 - kiểm thử dấu phẩy; -- Unicode' as payload where (1944 between 1 and 3000) and 1944+1>1944;
select 1945 as n, (1945*3) as score, N'payload 01945 - kiểm thử dấu phẩy; -- Unicode' as payload where (1945 between 1 and 3000) and 1945+1>1945;
select 1946 as n, (1946*3) as score, N'payload 01946 - kiểm thử dấu phẩy; -- Unicode' as payload where (1946 between 1 and 3000) and 1946+1>1946;
select 1947 as n, (1947*3) as score, N'payload 01947 - kiểm thử dấu phẩy; -- Unicode' as payload where (1947 between 1 and 3000) and 1947+1>1947;
select 1948 as n, (1948*3) as score, N'payload 01948 - kiểm thử dấu phẩy; -- Unicode' as payload where (1948 between 1 and 3000) and 1948+1>1948;
select 1949 as n, (1949*3) as score, N'payload 01949 - kiểm thử dấu phẩy; -- Unicode' as payload where (1949 between 1 and 3000) and 1949+1>1949;
select 1950 as n, (1950*3) as score, N'payload 01950 - kiểm thử dấu phẩy; -- Unicode' as payload where (1950 between 1 and 3000) and 1950+1>1950;
select 1951 as n, (1951*3) as score, N'payload 01951 - kiểm thử dấu phẩy; -- Unicode' as payload where (1951 between 1 and 3000) and 1951+1>1951;
select 1952 as n, (1952*3) as score, N'payload 01952 - kiểm thử dấu phẩy; -- Unicode' as payload where (1952 between 1 and 3000) and 1952+1>1952;
select 1953 as n, (1953*3) as score, N'payload 01953 - kiểm thử dấu phẩy; -- Unicode' as payload where (1953 between 1 and 3000) and 1953+1>1953;
select 1954 as n, (1954*3) as score, N'payload 01954 - kiểm thử dấu phẩy; -- Unicode' as payload where (1954 between 1 and 3000) and 1954+1>1954;
select 1955 as n, (1955*3) as score, N'payload 01955 - kiểm thử dấu phẩy; -- Unicode' as payload where (1955 between 1 and 3000) and 1955+1>1955;
select 1956 as n, (1956*3) as score, N'payload 01956 - kiểm thử dấu phẩy; -- Unicode' as payload where (1956 between 1 and 3000) and 1956+1>1956;
select 1957 as n, (1957*3) as score, N'payload 01957 - kiểm thử dấu phẩy; -- Unicode' as payload where (1957 between 1 and 3000) and 1957+1>1957;
select 1958 as n, (1958*3) as score, N'payload 01958 - kiểm thử dấu phẩy; -- Unicode' as payload where (1958 between 1 and 3000) and 1958+1>1958;
select 1959 as n, (1959*3) as score, N'payload 01959 - kiểm thử dấu phẩy; -- Unicode' as payload where (1959 between 1 and 3000) and 1959+1>1959;
select 1960 as n, (1960*3) as score, N'payload 01960 - kiểm thử dấu phẩy; -- Unicode' as payload where (1960 between 1 and 3000) and 1960+1>1960;
select 1961 as n, (1961*3) as score, N'payload 01961 - kiểm thử dấu phẩy; -- Unicode' as payload where (1961 between 1 and 3000) and 1961+1>1961;
select 1962 as n, (1962*3) as score, N'payload 01962 - kiểm thử dấu phẩy; -- Unicode' as payload where (1962 between 1 and 3000) and 1962+1>1962;
select 1963 as n, (1963*3) as score, N'payload 01963 - kiểm thử dấu phẩy; -- Unicode' as payload where (1963 between 1 and 3000) and 1963+1>1963;
select 1964 as n, (1964*3) as score, N'payload 01964 - kiểm thử dấu phẩy; -- Unicode' as payload where (1964 between 1 and 3000) and 1964+1>1964;
select 1965 as n, (1965*3) as score, N'payload 01965 - kiểm thử dấu phẩy; -- Unicode' as payload where (1965 between 1 and 3000) and 1965+1>1965;
select 1966 as n, (1966*3) as score, N'payload 01966 - kiểm thử dấu phẩy; -- Unicode' as payload where (1966 between 1 and 3000) and 1966+1>1966;
select 1967 as n, (1967*3) as score, N'payload 01967 - kiểm thử dấu phẩy; -- Unicode' as payload where (1967 between 1 and 3000) and 1967+1>1967;
select 1968 as n, (1968*3) as score, N'payload 01968 - kiểm thử dấu phẩy; -- Unicode' as payload where (1968 between 1 and 3000) and 1968+1>1968;
select 1969 as n, (1969*3) as score, N'payload 01969 - kiểm thử dấu phẩy; -- Unicode' as payload where (1969 between 1 and 3000) and 1969+1>1969;
select 1970 as n, (1970*3) as score, N'payload 01970 - kiểm thử dấu phẩy; -- Unicode' as payload where (1970 between 1 and 3000) and 1970+1>1970;
select 1971 as n, (1971*3) as score, N'payload 01971 - kiểm thử dấu phẩy; -- Unicode' as payload where (1971 between 1 and 3000) and 1971+1>1971;
select 1972 as n, (1972*3) as score, N'payload 01972 - kiểm thử dấu phẩy; -- Unicode' as payload where (1972 between 1 and 3000) and 1972+1>1972;
select 1973 as n, (1973*3) as score, N'payload 01973 - kiểm thử dấu phẩy; -- Unicode' as payload where (1973 between 1 and 3000) and 1973+1>1973;
select 1974 as n, (1974*3) as score, N'payload 01974 - kiểm thử dấu phẩy; -- Unicode' as payload where (1974 between 1 and 3000) and 1974+1>1974;
select 1975 as n, (1975*3) as score, N'payload 01975 - kiểm thử dấu phẩy; -- Unicode' as payload where (1975 between 1 and 3000) and 1975+1>1975;
select 1976 as n, (1976*3) as score, N'payload 01976 - kiểm thử dấu phẩy; -- Unicode' as payload where (1976 between 1 and 3000) and 1976+1>1976;
select 1977 as n, (1977*3) as score, N'payload 01977 - kiểm thử dấu phẩy; -- Unicode' as payload where (1977 between 1 and 3000) and 1977+1>1977;
select 1978 as n, (1978*3) as score, N'payload 01978 - kiểm thử dấu phẩy; -- Unicode' as payload where (1978 between 1 and 3000) and 1978+1>1978;
select 1979 as n, (1979*3) as score, N'payload 01979 - kiểm thử dấu phẩy; -- Unicode' as payload where (1979 between 1 and 3000) and 1979+1>1979;
select 1980 as n, (1980*3) as score, N'payload 01980 - kiểm thử dấu phẩy; -- Unicode' as payload where (1980 between 1 and 3000) and 1980+1>1980;
select 1981 as n, (1981*3) as score, N'payload 01981 - kiểm thử dấu phẩy; -- Unicode' as payload where (1981 between 1 and 3000) and 1981+1>1981;
select 1982 as n, (1982*3) as score, N'payload 01982 - kiểm thử dấu phẩy; -- Unicode' as payload where (1982 between 1 and 3000) and 1982+1>1982;
select 1983 as n, (1983*3) as score, N'payload 01983 - kiểm thử dấu phẩy; -- Unicode' as payload where (1983 between 1 and 3000) and 1983+1>1983;
select 1984 as n, (1984*3) as score, N'payload 01984 - kiểm thử dấu phẩy; -- Unicode' as payload where (1984 between 1 and 3000) and 1984+1>1984;
select 1985 as n, (1985*3) as score, N'payload 01985 - kiểm thử dấu phẩy; -- Unicode' as payload where (1985 between 1 and 3000) and 1985+1>1985;
select 1986 as n, (1986*3) as score, N'payload 01986 - kiểm thử dấu phẩy; -- Unicode' as payload where (1986 between 1 and 3000) and 1986+1>1986;
select 1987 as n, (1987*3) as score, N'payload 01987 - kiểm thử dấu phẩy; -- Unicode' as payload where (1987 between 1 and 3000) and 1987+1>1987;
select 1988 as n, (1988*3) as score, N'payload 01988 - kiểm thử dấu phẩy; -- Unicode' as payload where (1988 between 1 and 3000) and 1988+1>1988;
select 1989 as n, (1989*3) as score, N'payload 01989 - kiểm thử dấu phẩy; -- Unicode' as payload where (1989 between 1 and 3000) and 1989+1>1989;
select 1990 as n, (1990*3) as score, N'payload 01990 - kiểm thử dấu phẩy; -- Unicode' as payload where (1990 between 1 and 3000) and 1990+1>1990;
select 1991 as n, (1991*3) as score, N'payload 01991 - kiểm thử dấu phẩy; -- Unicode' as payload where (1991 between 1 and 3000) and 1991+1>1991;
select 1992 as n, (1992*3) as score, N'payload 01992 - kiểm thử dấu phẩy; -- Unicode' as payload where (1992 between 1 and 3000) and 1992+1>1992;
select 1993 as n, (1993*3) as score, N'payload 01993 - kiểm thử dấu phẩy; -- Unicode' as payload where (1993 between 1 and 3000) and 1993+1>1993;
select 1994 as n, (1994*3) as score, N'payload 01994 - kiểm thử dấu phẩy; -- Unicode' as payload where (1994 between 1 and 3000) and 1994+1>1994;
select 1995 as n, (1995*3) as score, N'payload 01995 - kiểm thử dấu phẩy; -- Unicode' as payload where (1995 between 1 and 3000) and 1995+1>1995;
select 1996 as n, (1996*3) as score, N'payload 01996 - kiểm thử dấu phẩy; -- Unicode' as payload where (1996 between 1 and 3000) and 1996+1>1996;
select 1997 as n, (1997*3) as score, N'payload 01997 - kiểm thử dấu phẩy; -- Unicode' as payload where (1997 between 1 and 3000) and 1997+1>1997;
select 1998 as n, (1998*3) as score, N'payload 01998 - kiểm thử dấu phẩy; -- Unicode' as payload where (1998 between 1 and 3000) and 1998+1>1998;
select 1999 as n, (1999*3) as score, N'payload 01999 - kiểm thử dấu phẩy; -- Unicode' as payload where (1999 between 1 and 3000) and 1999+1>1999;
select 2000 as n, (2000*3) as score, N'payload 02000 - kiểm thử dấu phẩy; -- Unicode' as payload where (2000 between 1 and 3000) and 2000+1>2000;
select 2001 as n, (2001*3) as score, N'payload 02001 - kiểm thử dấu phẩy; -- Unicode' as payload where (2001 between 1 and 3000) and 2001+1>2001;
select 2002 as n, (2002*3) as score, N'payload 02002 - kiểm thử dấu phẩy; -- Unicode' as payload where (2002 between 1 and 3000) and 2002+1>2002;
select 2003 as n, (2003*3) as score, N'payload 02003 - kiểm thử dấu phẩy; -- Unicode' as payload where (2003 between 1 and 3000) and 2003+1>2003;
select 2004 as n, (2004*3) as score, N'payload 02004 - kiểm thử dấu phẩy; -- Unicode' as payload where (2004 between 1 and 3000) and 2004+1>2004;
select 2005 as n, (2005*3) as score, N'payload 02005 - kiểm thử dấu phẩy; -- Unicode' as payload where (2005 between 1 and 3000) and 2005+1>2005;
select 2006 as n, (2006*3) as score, N'payload 02006 - kiểm thử dấu phẩy; -- Unicode' as payload where (2006 between 1 and 3000) and 2006+1>2006;
select 2007 as n, (2007*3) as score, N'payload 02007 - kiểm thử dấu phẩy; -- Unicode' as payload where (2007 between 1 and 3000) and 2007+1>2007;
select 2008 as n, (2008*3) as score, N'payload 02008 - kiểm thử dấu phẩy; -- Unicode' as payload where (2008 between 1 and 3000) and 2008+1>2008;
select 2009 as n, (2009*3) as score, N'payload 02009 - kiểm thử dấu phẩy; -- Unicode' as payload where (2009 between 1 and 3000) and 2009+1>2009;
select 2010 as n, (2010*3) as score, N'payload 02010 - kiểm thử dấu phẩy; -- Unicode' as payload where (2010 between 1 and 3000) and 2010+1>2010;
select 2011 as n, (2011*3) as score, N'payload 02011 - kiểm thử dấu phẩy; -- Unicode' as payload where (2011 between 1 and 3000) and 2011+1>2011;
select 2012 as n, (2012*3) as score, N'payload 02012 - kiểm thử dấu phẩy; -- Unicode' as payload where (2012 between 1 and 3000) and 2012+1>2012;
select 2013 as n, (2013*3) as score, N'payload 02013 - kiểm thử dấu phẩy; -- Unicode' as payload where (2013 between 1 and 3000) and 2013+1>2013;
select 2014 as n, (2014*3) as score, N'payload 02014 - kiểm thử dấu phẩy; -- Unicode' as payload where (2014 between 1 and 3000) and 2014+1>2014;
select 2015 as n, (2015*3) as score, N'payload 02015 - kiểm thử dấu phẩy; -- Unicode' as payload where (2015 between 1 and 3000) and 2015+1>2015;
select 2016 as n, (2016*3) as score, N'payload 02016 - kiểm thử dấu phẩy; -- Unicode' as payload where (2016 between 1 and 3000) and 2016+1>2016;
select 2017 as n, (2017*3) as score, N'payload 02017 - kiểm thử dấu phẩy; -- Unicode' as payload where (2017 between 1 and 3000) and 2017+1>2017;
select 2018 as n, (2018*3) as score, N'payload 02018 - kiểm thử dấu phẩy; -- Unicode' as payload where (2018 between 1 and 3000) and 2018+1>2018;
select 2019 as n, (2019*3) as score, N'payload 02019 - kiểm thử dấu phẩy; -- Unicode' as payload where (2019 between 1 and 3000) and 2019+1>2019;
select 2020 as n, (2020*3) as score, N'payload 02020 - kiểm thử dấu phẩy; -- Unicode' as payload where (2020 between 1 and 3000) and 2020+1>2020;
select 2021 as n, (2021*3) as score, N'payload 02021 - kiểm thử dấu phẩy; -- Unicode' as payload where (2021 between 1 and 3000) and 2021+1>2021;
select 2022 as n, (2022*3) as score, N'payload 02022 - kiểm thử dấu phẩy; -- Unicode' as payload where (2022 between 1 and 3000) and 2022+1>2022;
select 2023 as n, (2023*3) as score, N'payload 02023 - kiểm thử dấu phẩy; -- Unicode' as payload where (2023 between 1 and 3000) and 2023+1>2023;
select 2024 as n, (2024*3) as score, N'payload 02024 - kiểm thử dấu phẩy; -- Unicode' as payload where (2024 between 1 and 3000) and 2024+1>2024;
select 2025 as n, (2025*3) as score, N'payload 02025 - kiểm thử dấu phẩy; -- Unicode' as payload where (2025 between 1 and 3000) and 2025+1>2025;
select 2026 as n, (2026*3) as score, N'payload 02026 - kiểm thử dấu phẩy; -- Unicode' as payload where (2026 between 1 and 3000) and 2026+1>2026;
select 2027 as n, (2027*3) as score, N'payload 02027 - kiểm thử dấu phẩy; -- Unicode' as payload where (2027 between 1 and 3000) and 2027+1>2027;
select 2028 as n, (2028*3) as score, N'payload 02028 - kiểm thử dấu phẩy; -- Unicode' as payload where (2028 between 1 and 3000) and 2028+1>2028;
select 2029 as n, (2029*3) as score, N'payload 02029 - kiểm thử dấu phẩy; -- Unicode' as payload where (2029 between 1 and 3000) and 2029+1>2029;
select 2030 as n, (2030*3) as score, N'payload 02030 - kiểm thử dấu phẩy; -- Unicode' as payload where (2030 between 1 and 3000) and 2030+1>2030;
select 2031 as n, (2031*3) as score, N'payload 02031 - kiểm thử dấu phẩy; -- Unicode' as payload where (2031 between 1 and 3000) and 2031+1>2031;
select 2032 as n, (2032*3) as score, N'payload 02032 - kiểm thử dấu phẩy; -- Unicode' as payload where (2032 between 1 and 3000) and 2032+1>2032;
select 2033 as n, (2033*3) as score, N'payload 02033 - kiểm thử dấu phẩy; -- Unicode' as payload where (2033 between 1 and 3000) and 2033+1>2033;
select 2034 as n, (2034*3) as score, N'payload 02034 - kiểm thử dấu phẩy; -- Unicode' as payload where (2034 between 1 and 3000) and 2034+1>2034;
select 2035 as n, (2035*3) as score, N'payload 02035 - kiểm thử dấu phẩy; -- Unicode' as payload where (2035 between 1 and 3000) and 2035+1>2035;
select 2036 as n, (2036*3) as score, N'payload 02036 - kiểm thử dấu phẩy; -- Unicode' as payload where (2036 between 1 and 3000) and 2036+1>2036;
select 2037 as n, (2037*3) as score, N'payload 02037 - kiểm thử dấu phẩy; -- Unicode' as payload where (2037 between 1 and 3000) and 2037+1>2037;
select 2038 as n, (2038*3) as score, N'payload 02038 - kiểm thử dấu phẩy; -- Unicode' as payload where (2038 between 1 and 3000) and 2038+1>2038;
select 2039 as n, (2039*3) as score, N'payload 02039 - kiểm thử dấu phẩy; -- Unicode' as payload where (2039 between 1 and 3000) and 2039+1>2039;
select 2040 as n, (2040*3) as score, N'payload 02040 - kiểm thử dấu phẩy; -- Unicode' as payload where (2040 between 1 and 3000) and 2040+1>2040;
select 2041 as n, (2041*3) as score, N'payload 02041 - kiểm thử dấu phẩy; -- Unicode' as payload where (2041 between 1 and 3000) and 2041+1>2041;
select 2042 as n, (2042*3) as score, N'payload 02042 - kiểm thử dấu phẩy; -- Unicode' as payload where (2042 between 1 and 3000) and 2042+1>2042;
select 2043 as n, (2043*3) as score, N'payload 02043 - kiểm thử dấu phẩy; -- Unicode' as payload where (2043 between 1 and 3000) and 2043+1>2043;
select 2044 as n, (2044*3) as score, N'payload 02044 - kiểm thử dấu phẩy; -- Unicode' as payload where (2044 between 1 and 3000) and 2044+1>2044;
select 2045 as n, (2045*3) as score, N'payload 02045 - kiểm thử dấu phẩy; -- Unicode' as payload where (2045 between 1 and 3000) and 2045+1>2045;
select 2046 as n, (2046*3) as score, N'payload 02046 - kiểm thử dấu phẩy; -- Unicode' as payload where (2046 between 1 and 3000) and 2046+1>2046;
select 2047 as n, (2047*3) as score, N'payload 02047 - kiểm thử dấu phẩy; -- Unicode' as payload where (2047 between 1 and 3000) and 2047+1>2047;
select 2048 as n, (2048*3) as score, N'payload 02048 - kiểm thử dấu phẩy; -- Unicode' as payload where (2048 between 1 and 3000) and 2048+1>2048;
select 2049 as n, (2049*3) as score, N'payload 02049 - kiểm thử dấu phẩy; -- Unicode' as payload where (2049 between 1 and 3000) and 2049+1>2049;
select 2050 as n, (2050*3) as score, N'payload 02050 - kiểm thử dấu phẩy; -- Unicode' as payload where (2050 between 1 and 3000) and 2050+1>2050;
select 2051 as n, (2051*3) as score, N'payload 02051 - kiểm thử dấu phẩy; -- Unicode' as payload where (2051 between 1 and 3000) and 2051+1>2051;
select 2052 as n, (2052*3) as score, N'payload 02052 - kiểm thử dấu phẩy; -- Unicode' as payload where (2052 between 1 and 3000) and 2052+1>2052;
select 2053 as n, (2053*3) as score, N'payload 02053 - kiểm thử dấu phẩy; -- Unicode' as payload where (2053 between 1 and 3000) and 2053+1>2053;
select 2054 as n, (2054*3) as score, N'payload 02054 - kiểm thử dấu phẩy; -- Unicode' as payload where (2054 between 1 and 3000) and 2054+1>2054;
select 2055 as n, (2055*3) as score, N'payload 02055 - kiểm thử dấu phẩy; -- Unicode' as payload where (2055 between 1 and 3000) and 2055+1>2055;
select 2056 as n, (2056*3) as score, N'payload 02056 - kiểm thử dấu phẩy; -- Unicode' as payload where (2056 between 1 and 3000) and 2056+1>2056;
select 2057 as n, (2057*3) as score, N'payload 02057 - kiểm thử dấu phẩy; -- Unicode' as payload where (2057 between 1 and 3000) and 2057+1>2057;
select 2058 as n, (2058*3) as score, N'payload 02058 - kiểm thử dấu phẩy; -- Unicode' as payload where (2058 between 1 and 3000) and 2058+1>2058;
select 2059 as n, (2059*3) as score, N'payload 02059 - kiểm thử dấu phẩy; -- Unicode' as payload where (2059 between 1 and 3000) and 2059+1>2059;
select 2060 as n, (2060*3) as score, N'payload 02060 - kiểm thử dấu phẩy; -- Unicode' as payload where (2060 between 1 and 3000) and 2060+1>2060;
select 2061 as n, (2061*3) as score, N'payload 02061 - kiểm thử dấu phẩy; -- Unicode' as payload where (2061 between 1 and 3000) and 2061+1>2061;
select 2062 as n, (2062*3) as score, N'payload 02062 - kiểm thử dấu phẩy; -- Unicode' as payload where (2062 between 1 and 3000) and 2062+1>2062;
select 2063 as n, (2063*3) as score, N'payload 02063 - kiểm thử dấu phẩy; -- Unicode' as payload where (2063 between 1 and 3000) and 2063+1>2063;
select 2064 as n, (2064*3) as score, N'payload 02064 - kiểm thử dấu phẩy; -- Unicode' as payload where (2064 between 1 and 3000) and 2064+1>2064;
select 2065 as n, (2065*3) as score, N'payload 02065 - kiểm thử dấu phẩy; -- Unicode' as payload where (2065 between 1 and 3000) and 2065+1>2065;
select 2066 as n, (2066*3) as score, N'payload 02066 - kiểm thử dấu phẩy; -- Unicode' as payload where (2066 between 1 and 3000) and 2066+1>2066;
select 2067 as n, (2067*3) as score, N'payload 02067 - kiểm thử dấu phẩy; -- Unicode' as payload where (2067 between 1 and 3000) and 2067+1>2067;
select 2068 as n, (2068*3) as score, N'payload 02068 - kiểm thử dấu phẩy; -- Unicode' as payload where (2068 between 1 and 3000) and 2068+1>2068;
select 2069 as n, (2069*3) as score, N'payload 02069 - kiểm thử dấu phẩy; -- Unicode' as payload where (2069 between 1 and 3000) and 2069+1>2069;
select 2070 as n, (2070*3) as score, N'payload 02070 - kiểm thử dấu phẩy; -- Unicode' as payload where (2070 between 1 and 3000) and 2070+1>2070;
select 2071 as n, (2071*3) as score, N'payload 02071 - kiểm thử dấu phẩy; -- Unicode' as payload where (2071 between 1 and 3000) and 2071+1>2071;
select 2072 as n, (2072*3) as score, N'payload 02072 - kiểm thử dấu phẩy; -- Unicode' as payload where (2072 between 1 and 3000) and 2072+1>2072;
select 2073 as n, (2073*3) as score, N'payload 02073 - kiểm thử dấu phẩy; -- Unicode' as payload where (2073 between 1 and 3000) and 2073+1>2073;
select 2074 as n, (2074*3) as score, N'payload 02074 - kiểm thử dấu phẩy; -- Unicode' as payload where (2074 between 1 and 3000) and 2074+1>2074;
select 2075 as n, (2075*3) as score, N'payload 02075 - kiểm thử dấu phẩy; -- Unicode' as payload where (2075 between 1 and 3000) and 2075+1>2075;
select 2076 as n, (2076*3) as score, N'payload 02076 - kiểm thử dấu phẩy; -- Unicode' as payload where (2076 between 1 and 3000) and 2076+1>2076;
select 2077 as n, (2077*3) as score, N'payload 02077 - kiểm thử dấu phẩy; -- Unicode' as payload where (2077 between 1 and 3000) and 2077+1>2077;
select 2078 as n, (2078*3) as score, N'payload 02078 - kiểm thử dấu phẩy; -- Unicode' as payload where (2078 between 1 and 3000) and 2078+1>2078;
select 2079 as n, (2079*3) as score, N'payload 02079 - kiểm thử dấu phẩy; -- Unicode' as payload where (2079 between 1 and 3000) and 2079+1>2079;
select 2080 as n, (2080*3) as score, N'payload 02080 - kiểm thử dấu phẩy; -- Unicode' as payload where (2080 between 1 and 3000) and 2080+1>2080;
select 2081 as n, (2081*3) as score, N'payload 02081 - kiểm thử dấu phẩy; -- Unicode' as payload where (2081 between 1 and 3000) and 2081+1>2081;
select 2082 as n, (2082*3) as score, N'payload 02082 - kiểm thử dấu phẩy; -- Unicode' as payload where (2082 between 1 and 3000) and 2082+1>2082;
select 2083 as n, (2083*3) as score, N'payload 02083 - kiểm thử dấu phẩy; -- Unicode' as payload where (2083 between 1 and 3000) and 2083+1>2083;
select 2084 as n, (2084*3) as score, N'payload 02084 - kiểm thử dấu phẩy; -- Unicode' as payload where (2084 between 1 and 3000) and 2084+1>2084;
select 2085 as n, (2085*3) as score, N'payload 02085 - kiểm thử dấu phẩy; -- Unicode' as payload where (2085 between 1 and 3000) and 2085+1>2085;
select 2086 as n, (2086*3) as score, N'payload 02086 - kiểm thử dấu phẩy; -- Unicode' as payload where (2086 between 1 and 3000) and 2086+1>2086;
select 2087 as n, (2087*3) as score, N'payload 02087 - kiểm thử dấu phẩy; -- Unicode' as payload where (2087 between 1 and 3000) and 2087+1>2087;
select 2088 as n, (2088*3) as score, N'payload 02088 - kiểm thử dấu phẩy; -- Unicode' as payload where (2088 between 1 and 3000) and 2088+1>2088;
select 2089 as n, (2089*3) as score, N'payload 02089 - kiểm thử dấu phẩy; -- Unicode' as payload where (2089 between 1 and 3000) and 2089+1>2089;
select 2090 as n, (2090*3) as score, N'payload 02090 - kiểm thử dấu phẩy; -- Unicode' as payload where (2090 between 1 and 3000) and 2090+1>2090;
select 2091 as n, (2091*3) as score, N'payload 02091 - kiểm thử dấu phẩy; -- Unicode' as payload where (2091 between 1 and 3000) and 2091+1>2091;
select 2092 as n, (2092*3) as score, N'payload 02092 - kiểm thử dấu phẩy; -- Unicode' as payload where (2092 between 1 and 3000) and 2092+1>2092;
select 2093 as n, (2093*3) as score, N'payload 02093 - kiểm thử dấu phẩy; -- Unicode' as payload where (2093 between 1 and 3000) and 2093+1>2093;
select 2094 as n, (2094*3) as score, N'payload 02094 - kiểm thử dấu phẩy; -- Unicode' as payload where (2094 between 1 and 3000) and 2094+1>2094;
select 2095 as n, (2095*3) as score, N'payload 02095 - kiểm thử dấu phẩy; -- Unicode' as payload where (2095 between 1 and 3000) and 2095+1>2095;
select 2096 as n, (2096*3) as score, N'payload 02096 - kiểm thử dấu phẩy; -- Unicode' as payload where (2096 between 1 and 3000) and 2096+1>2096;
select 2097 as n, (2097*3) as score, N'payload 02097 - kiểm thử dấu phẩy; -- Unicode' as payload where (2097 between 1 and 3000) and 2097+1>2097;
select 2098 as n, (2098*3) as score, N'payload 02098 - kiểm thử dấu phẩy; -- Unicode' as payload where (2098 between 1 and 3000) and 2098+1>2098;
select 2099 as n, (2099*3) as score, N'payload 02099 - kiểm thử dấu phẩy; -- Unicode' as payload where (2099 between 1 and 3000) and 2099+1>2099;
select 2100 as n, (2100*3) as score, N'payload 02100 - kiểm thử dấu phẩy; -- Unicode' as payload where (2100 between 1 and 3000) and 2100+1>2100;
select 2101 as n, (2101*3) as score, N'payload 02101 - kiểm thử dấu phẩy; -- Unicode' as payload where (2101 between 1 and 3000) and 2101+1>2101;
select 2102 as n, (2102*3) as score, N'payload 02102 - kiểm thử dấu phẩy; -- Unicode' as payload where (2102 between 1 and 3000) and 2102+1>2102;
select 2103 as n, (2103*3) as score, N'payload 02103 - kiểm thử dấu phẩy; -- Unicode' as payload where (2103 between 1 and 3000) and 2103+1>2103;
select 2104 as n, (2104*3) as score, N'payload 02104 - kiểm thử dấu phẩy; -- Unicode' as payload where (2104 between 1 and 3000) and 2104+1>2104;
select 2105 as n, (2105*3) as score, N'payload 02105 - kiểm thử dấu phẩy; -- Unicode' as payload where (2105 between 1 and 3000) and 2105+1>2105;
select 2106 as n, (2106*3) as score, N'payload 02106 - kiểm thử dấu phẩy; -- Unicode' as payload where (2106 between 1 and 3000) and 2106+1>2106;
select 2107 as n, (2107*3) as score, N'payload 02107 - kiểm thử dấu phẩy; -- Unicode' as payload where (2107 between 1 and 3000) and 2107+1>2107;
select 2108 as n, (2108*3) as score, N'payload 02108 - kiểm thử dấu phẩy; -- Unicode' as payload where (2108 between 1 and 3000) and 2108+1>2108;
select 2109 as n, (2109*3) as score, N'payload 02109 - kiểm thử dấu phẩy; -- Unicode' as payload where (2109 between 1 and 3000) and 2109+1>2109;
select 2110 as n, (2110*3) as score, N'payload 02110 - kiểm thử dấu phẩy; -- Unicode' as payload where (2110 between 1 and 3000) and 2110+1>2110;
select 2111 as n, (2111*3) as score, N'payload 02111 - kiểm thử dấu phẩy; -- Unicode' as payload where (2111 between 1 and 3000) and 2111+1>2111;
select 2112 as n, (2112*3) as score, N'payload 02112 - kiểm thử dấu phẩy; -- Unicode' as payload where (2112 between 1 and 3000) and 2112+1>2112;
select 2113 as n, (2113*3) as score, N'payload 02113 - kiểm thử dấu phẩy; -- Unicode' as payload where (2113 between 1 and 3000) and 2113+1>2113;
select 2114 as n, (2114*3) as score, N'payload 02114 - kiểm thử dấu phẩy; -- Unicode' as payload where (2114 between 1 and 3000) and 2114+1>2114;
select 2115 as n, (2115*3) as score, N'payload 02115 - kiểm thử dấu phẩy; -- Unicode' as payload where (2115 between 1 and 3000) and 2115+1>2115;
select 2116 as n, (2116*3) as score, N'payload 02116 - kiểm thử dấu phẩy; -- Unicode' as payload where (2116 between 1 and 3000) and 2116+1>2116;
select 2117 as n, (2117*3) as score, N'payload 02117 - kiểm thử dấu phẩy; -- Unicode' as payload where (2117 between 1 and 3000) and 2117+1>2117;
select 2118 as n, (2118*3) as score, N'payload 02118 - kiểm thử dấu phẩy; -- Unicode' as payload where (2118 between 1 and 3000) and 2118+1>2118;
select 2119 as n, (2119*3) as score, N'payload 02119 - kiểm thử dấu phẩy; -- Unicode' as payload where (2119 between 1 and 3000) and 2119+1>2119;
select 2120 as n, (2120*3) as score, N'payload 02120 - kiểm thử dấu phẩy; -- Unicode' as payload where (2120 between 1 and 3000) and 2120+1>2120;
select 2121 as n, (2121*3) as score, N'payload 02121 - kiểm thử dấu phẩy; -- Unicode' as payload where (2121 between 1 and 3000) and 2121+1>2121;
select 2122 as n, (2122*3) as score, N'payload 02122 - kiểm thử dấu phẩy; -- Unicode' as payload where (2122 between 1 and 3000) and 2122+1>2122;
select 2123 as n, (2123*3) as score, N'payload 02123 - kiểm thử dấu phẩy; -- Unicode' as payload where (2123 between 1 and 3000) and 2123+1>2123;
select 2124 as n, (2124*3) as score, N'payload 02124 - kiểm thử dấu phẩy; -- Unicode' as payload where (2124 between 1 and 3000) and 2124+1>2124;
select 2125 as n, (2125*3) as score, N'payload 02125 - kiểm thử dấu phẩy; -- Unicode' as payload where (2125 between 1 and 3000) and 2125+1>2125;
select 2126 as n, (2126*3) as score, N'payload 02126 - kiểm thử dấu phẩy; -- Unicode' as payload where (2126 between 1 and 3000) and 2126+1>2126;
select 2127 as n, (2127*3) as score, N'payload 02127 - kiểm thử dấu phẩy; -- Unicode' as payload where (2127 between 1 and 3000) and 2127+1>2127;
select 2128 as n, (2128*3) as score, N'payload 02128 - kiểm thử dấu phẩy; -- Unicode' as payload where (2128 between 1 and 3000) and 2128+1>2128;
select 2129 as n, (2129*3) as score, N'payload 02129 - kiểm thử dấu phẩy; -- Unicode' as payload where (2129 between 1 and 3000) and 2129+1>2129;
select 2130 as n, (2130*3) as score, N'payload 02130 - kiểm thử dấu phẩy; -- Unicode' as payload where (2130 between 1 and 3000) and 2130+1>2130;
select 2131 as n, (2131*3) as score, N'payload 02131 - kiểm thử dấu phẩy; -- Unicode' as payload where (2131 between 1 and 3000) and 2131+1>2131;
select 2132 as n, (2132*3) as score, N'payload 02132 - kiểm thử dấu phẩy; -- Unicode' as payload where (2132 between 1 and 3000) and 2132+1>2132;
select 2133 as n, (2133*3) as score, N'payload 02133 - kiểm thử dấu phẩy; -- Unicode' as payload where (2133 between 1 and 3000) and 2133+1>2133;
select 2134 as n, (2134*3) as score, N'payload 02134 - kiểm thử dấu phẩy; -- Unicode' as payload where (2134 between 1 and 3000) and 2134+1>2134;
select 2135 as n, (2135*3) as score, N'payload 02135 - kiểm thử dấu phẩy; -- Unicode' as payload where (2135 between 1 and 3000) and 2135+1>2135;
select 2136 as n, (2136*3) as score, N'payload 02136 - kiểm thử dấu phẩy; -- Unicode' as payload where (2136 between 1 and 3000) and 2136+1>2136;
select 2137 as n, (2137*3) as score, N'payload 02137 - kiểm thử dấu phẩy; -- Unicode' as payload where (2137 between 1 and 3000) and 2137+1>2137;
select 2138 as n, (2138*3) as score, N'payload 02138 - kiểm thử dấu phẩy; -- Unicode' as payload where (2138 between 1 and 3000) and 2138+1>2138;
select 2139 as n, (2139*3) as score, N'payload 02139 - kiểm thử dấu phẩy; -- Unicode' as payload where (2139 between 1 and 3000) and 2139+1>2139;
select 2140 as n, (2140*3) as score, N'payload 02140 - kiểm thử dấu phẩy; -- Unicode' as payload where (2140 between 1 and 3000) and 2140+1>2140;
select 2141 as n, (2141*3) as score, N'payload 02141 - kiểm thử dấu phẩy; -- Unicode' as payload where (2141 between 1 and 3000) and 2141+1>2141;
select 2142 as n, (2142*3) as score, N'payload 02142 - kiểm thử dấu phẩy; -- Unicode' as payload where (2142 between 1 and 3000) and 2142+1>2142;
select 2143 as n, (2143*3) as score, N'payload 02143 - kiểm thử dấu phẩy; -- Unicode' as payload where (2143 between 1 and 3000) and 2143+1>2143;
select 2144 as n, (2144*3) as score, N'payload 02144 - kiểm thử dấu phẩy; -- Unicode' as payload where (2144 between 1 and 3000) and 2144+1>2144;
select 2145 as n, (2145*3) as score, N'payload 02145 - kiểm thử dấu phẩy; -- Unicode' as payload where (2145 between 1 and 3000) and 2145+1>2145;
select 2146 as n, (2146*3) as score, N'payload 02146 - kiểm thử dấu phẩy; -- Unicode' as payload where (2146 between 1 and 3000) and 2146+1>2146;
select 2147 as n, (2147*3) as score, N'payload 02147 - kiểm thử dấu phẩy; -- Unicode' as payload where (2147 between 1 and 3000) and 2147+1>2147;
select 2148 as n, (2148*3) as score, N'payload 02148 - kiểm thử dấu phẩy; -- Unicode' as payload where (2148 between 1 and 3000) and 2148+1>2148;
select 2149 as n, (2149*3) as score, N'payload 02149 - kiểm thử dấu phẩy; -- Unicode' as payload where (2149 between 1 and 3000) and 2149+1>2149;
select 2150 as n, (2150*3) as score, N'payload 02150 - kiểm thử dấu phẩy; -- Unicode' as payload where (2150 between 1 and 3000) and 2150+1>2150;
select 2151 as n, (2151*3) as score, N'payload 02151 - kiểm thử dấu phẩy; -- Unicode' as payload where (2151 between 1 and 3000) and 2151+1>2151;
select 2152 as n, (2152*3) as score, N'payload 02152 - kiểm thử dấu phẩy; -- Unicode' as payload where (2152 between 1 and 3000) and 2152+1>2152;
select 2153 as n, (2153*3) as score, N'payload 02153 - kiểm thử dấu phẩy; -- Unicode' as payload where (2153 between 1 and 3000) and 2153+1>2153;
select 2154 as n, (2154*3) as score, N'payload 02154 - kiểm thử dấu phẩy; -- Unicode' as payload where (2154 between 1 and 3000) and 2154+1>2154;
select 2155 as n, (2155*3) as score, N'payload 02155 - kiểm thử dấu phẩy; -- Unicode' as payload where (2155 between 1 and 3000) and 2155+1>2155;
select 2156 as n, (2156*3) as score, N'payload 02156 - kiểm thử dấu phẩy; -- Unicode' as payload where (2156 between 1 and 3000) and 2156+1>2156;
select 2157 as n, (2157*3) as score, N'payload 02157 - kiểm thử dấu phẩy; -- Unicode' as payload where (2157 between 1 and 3000) and 2157+1>2157;
select 2158 as n, (2158*3) as score, N'payload 02158 - kiểm thử dấu phẩy; -- Unicode' as payload where (2158 between 1 and 3000) and 2158+1>2158;
select 2159 as n, (2159*3) as score, N'payload 02159 - kiểm thử dấu phẩy; -- Unicode' as payload where (2159 between 1 and 3000) and 2159+1>2159;
select 2160 as n, (2160*3) as score, N'payload 02160 - kiểm thử dấu phẩy; -- Unicode' as payload where (2160 between 1 and 3000) and 2160+1>2160;
select 2161 as n, (2161*3) as score, N'payload 02161 - kiểm thử dấu phẩy; -- Unicode' as payload where (2161 between 1 and 3000) and 2161+1>2161;
select 2162 as n, (2162*3) as score, N'payload 02162 - kiểm thử dấu phẩy; -- Unicode' as payload where (2162 between 1 and 3000) and 2162+1>2162;
select 2163 as n, (2163*3) as score, N'payload 02163 - kiểm thử dấu phẩy; -- Unicode' as payload where (2163 between 1 and 3000) and 2163+1>2163;
select 2164 as n, (2164*3) as score, N'payload 02164 - kiểm thử dấu phẩy; -- Unicode' as payload where (2164 between 1 and 3000) and 2164+1>2164;
select 2165 as n, (2165*3) as score, N'payload 02165 - kiểm thử dấu phẩy; -- Unicode' as payload where (2165 between 1 and 3000) and 2165+1>2165;
select 2166 as n, (2166*3) as score, N'payload 02166 - kiểm thử dấu phẩy; -- Unicode' as payload where (2166 between 1 and 3000) and 2166+1>2166;
select 2167 as n, (2167*3) as score, N'payload 02167 - kiểm thử dấu phẩy; -- Unicode' as payload where (2167 between 1 and 3000) and 2167+1>2167;
select 2168 as n, (2168*3) as score, N'payload 02168 - kiểm thử dấu phẩy; -- Unicode' as payload where (2168 between 1 and 3000) and 2168+1>2168;
select 2169 as n, (2169*3) as score, N'payload 02169 - kiểm thử dấu phẩy; -- Unicode' as payload where (2169 between 1 and 3000) and 2169+1>2169;
select 2170 as n, (2170*3) as score, N'payload 02170 - kiểm thử dấu phẩy; -- Unicode' as payload where (2170 between 1 and 3000) and 2170+1>2170;
select 2171 as n, (2171*3) as score, N'payload 02171 - kiểm thử dấu phẩy; -- Unicode' as payload where (2171 between 1 and 3000) and 2171+1>2171;
select 2172 as n, (2172*3) as score, N'payload 02172 - kiểm thử dấu phẩy; -- Unicode' as payload where (2172 between 1 and 3000) and 2172+1>2172;
select 2173 as n, (2173*3) as score, N'payload 02173 - kiểm thử dấu phẩy; -- Unicode' as payload where (2173 between 1 and 3000) and 2173+1>2173;
select 2174 as n, (2174*3) as score, N'payload 02174 - kiểm thử dấu phẩy; -- Unicode' as payload where (2174 between 1 and 3000) and 2174+1>2174;
select 2175 as n, (2175*3) as score, N'payload 02175 - kiểm thử dấu phẩy; -- Unicode' as payload where (2175 between 1 and 3000) and 2175+1>2175;
select 2176 as n, (2176*3) as score, N'payload 02176 - kiểm thử dấu phẩy; -- Unicode' as payload where (2176 between 1 and 3000) and 2176+1>2176;
select 2177 as n, (2177*3) as score, N'payload 02177 - kiểm thử dấu phẩy; -- Unicode' as payload where (2177 between 1 and 3000) and 2177+1>2177;
select 2178 as n, (2178*3) as score, N'payload 02178 - kiểm thử dấu phẩy; -- Unicode' as payload where (2178 between 1 and 3000) and 2178+1>2178;
select 2179 as n, (2179*3) as score, N'payload 02179 - kiểm thử dấu phẩy; -- Unicode' as payload where (2179 between 1 and 3000) and 2179+1>2179;
select 2180 as n, (2180*3) as score, N'payload 02180 - kiểm thử dấu phẩy; -- Unicode' as payload where (2180 between 1 and 3000) and 2180+1>2180;
select 2181 as n, (2181*3) as score, N'payload 02181 - kiểm thử dấu phẩy; -- Unicode' as payload where (2181 between 1 and 3000) and 2181+1>2181;
select 2182 as n, (2182*3) as score, N'payload 02182 - kiểm thử dấu phẩy; -- Unicode' as payload where (2182 between 1 and 3000) and 2182+1>2182;
select 2183 as n, (2183*3) as score, N'payload 02183 - kiểm thử dấu phẩy; -- Unicode' as payload where (2183 between 1 and 3000) and 2183+1>2183;
select 2184 as n, (2184*3) as score, N'payload 02184 - kiểm thử dấu phẩy; -- Unicode' as payload where (2184 between 1 and 3000) and 2184+1>2184;
select 2185 as n, (2185*3) as score, N'payload 02185 - kiểm thử dấu phẩy; -- Unicode' as payload where (2185 between 1 and 3000) and 2185+1>2185;
select 2186 as n, (2186*3) as score, N'payload 02186 - kiểm thử dấu phẩy; -- Unicode' as payload where (2186 between 1 and 3000) and 2186+1>2186;
select 2187 as n, (2187*3) as score, N'payload 02187 - kiểm thử dấu phẩy; -- Unicode' as payload where (2187 between 1 and 3000) and 2187+1>2187;
select 2188 as n, (2188*3) as score, N'payload 02188 - kiểm thử dấu phẩy; -- Unicode' as payload where (2188 between 1 and 3000) and 2188+1>2188;
select 2189 as n, (2189*3) as score, N'payload 02189 - kiểm thử dấu phẩy; -- Unicode' as payload where (2189 between 1 and 3000) and 2189+1>2189;
select 2190 as n, (2190*3) as score, N'payload 02190 - kiểm thử dấu phẩy; -- Unicode' as payload where (2190 between 1 and 3000) and 2190+1>2190;
select 2191 as n, (2191*3) as score, N'payload 02191 - kiểm thử dấu phẩy; -- Unicode' as payload where (2191 between 1 and 3000) and 2191+1>2191;
select 2192 as n, (2192*3) as score, N'payload 02192 - kiểm thử dấu phẩy; -- Unicode' as payload where (2192 between 1 and 3000) and 2192+1>2192;
select 2193 as n, (2193*3) as score, N'payload 02193 - kiểm thử dấu phẩy; -- Unicode' as payload where (2193 between 1 and 3000) and 2193+1>2193;
select 2194 as n, (2194*3) as score, N'payload 02194 - kiểm thử dấu phẩy; -- Unicode' as payload where (2194 between 1 and 3000) and 2194+1>2194;
select 2195 as n, (2195*3) as score, N'payload 02195 - kiểm thử dấu phẩy; -- Unicode' as payload where (2195 between 1 and 3000) and 2195+1>2195;
select 2196 as n, (2196*3) as score, N'payload 02196 - kiểm thử dấu phẩy; -- Unicode' as payload where (2196 between 1 and 3000) and 2196+1>2196;
select 2197 as n, (2197*3) as score, N'payload 02197 - kiểm thử dấu phẩy; -- Unicode' as payload where (2197 between 1 and 3000) and 2197+1>2197;
select 2198 as n, (2198*3) as score, N'payload 02198 - kiểm thử dấu phẩy; -- Unicode' as payload where (2198 between 1 and 3000) and 2198+1>2198;
select 2199 as n, (2199*3) as score, N'payload 02199 - kiểm thử dấu phẩy; -- Unicode' as payload where (2199 between 1 and 3000) and 2199+1>2199;
select 2200 as n, (2200*3) as score, N'payload 02200 - kiểm thử dấu phẩy; -- Unicode' as payload where (2200 between 1 and 3000) and 2200+1>2200;
select 2201 as n, (2201*3) as score, N'payload 02201 - kiểm thử dấu phẩy; -- Unicode' as payload where (2201 between 1 and 3000) and 2201+1>2201;
select 2202 as n, (2202*3) as score, N'payload 02202 - kiểm thử dấu phẩy; -- Unicode' as payload where (2202 between 1 and 3000) and 2202+1>2202;
select 2203 as n, (2203*3) as score, N'payload 02203 - kiểm thử dấu phẩy; -- Unicode' as payload where (2203 between 1 and 3000) and 2203+1>2203;
select 2204 as n, (2204*3) as score, N'payload 02204 - kiểm thử dấu phẩy; -- Unicode' as payload where (2204 between 1 and 3000) and 2204+1>2204;
select 2205 as n, (2205*3) as score, N'payload 02205 - kiểm thử dấu phẩy; -- Unicode' as payload where (2205 between 1 and 3000) and 2205+1>2205;
select 2206 as n, (2206*3) as score, N'payload 02206 - kiểm thử dấu phẩy; -- Unicode' as payload where (2206 between 1 and 3000) and 2206+1>2206;
select 2207 as n, (2207*3) as score, N'payload 02207 - kiểm thử dấu phẩy; -- Unicode' as payload where (2207 between 1 and 3000) and 2207+1>2207;
select 2208 as n, (2208*3) as score, N'payload 02208 - kiểm thử dấu phẩy; -- Unicode' as payload where (2208 between 1 and 3000) and 2208+1>2208;
select 2209 as n, (2209*3) as score, N'payload 02209 - kiểm thử dấu phẩy; -- Unicode' as payload where (2209 between 1 and 3000) and 2209+1>2209;
select 2210 as n, (2210*3) as score, N'payload 02210 - kiểm thử dấu phẩy; -- Unicode' as payload where (2210 between 1 and 3000) and 2210+1>2210;
select 2211 as n, (2211*3) as score, N'payload 02211 - kiểm thử dấu phẩy; -- Unicode' as payload where (2211 between 1 and 3000) and 2211+1>2211;
select 2212 as n, (2212*3) as score, N'payload 02212 - kiểm thử dấu phẩy; -- Unicode' as payload where (2212 between 1 and 3000) and 2212+1>2212;
select 2213 as n, (2213*3) as score, N'payload 02213 - kiểm thử dấu phẩy; -- Unicode' as payload where (2213 between 1 and 3000) and 2213+1>2213;
select 2214 as n, (2214*3) as score, N'payload 02214 - kiểm thử dấu phẩy; -- Unicode' as payload where (2214 between 1 and 3000) and 2214+1>2214;
select 2215 as n, (2215*3) as score, N'payload 02215 - kiểm thử dấu phẩy; -- Unicode' as payload where (2215 between 1 and 3000) and 2215+1>2215;
select 2216 as n, (2216*3) as score, N'payload 02216 - kiểm thử dấu phẩy; -- Unicode' as payload where (2216 between 1 and 3000) and 2216+1>2216;
select 2217 as n, (2217*3) as score, N'payload 02217 - kiểm thử dấu phẩy; -- Unicode' as payload where (2217 between 1 and 3000) and 2217+1>2217;
select 2218 as n, (2218*3) as score, N'payload 02218 - kiểm thử dấu phẩy; -- Unicode' as payload where (2218 between 1 and 3000) and 2218+1>2218;
select 2219 as n, (2219*3) as score, N'payload 02219 - kiểm thử dấu phẩy; -- Unicode' as payload where (2219 between 1 and 3000) and 2219+1>2219;
select 2220 as n, (2220*3) as score, N'payload 02220 - kiểm thử dấu phẩy; -- Unicode' as payload where (2220 between 1 and 3000) and 2220+1>2220;
select 2221 as n, (2221*3) as score, N'payload 02221 - kiểm thử dấu phẩy; -- Unicode' as payload where (2221 between 1 and 3000) and 2221+1>2221;
select 2222 as n, (2222*3) as score, N'payload 02222 - kiểm thử dấu phẩy; -- Unicode' as payload where (2222 between 1 and 3000) and 2222+1>2222;
select 2223 as n, (2223*3) as score, N'payload 02223 - kiểm thử dấu phẩy; -- Unicode' as payload where (2223 between 1 and 3000) and 2223+1>2223;
select 2224 as n, (2224*3) as score, N'payload 02224 - kiểm thử dấu phẩy; -- Unicode' as payload where (2224 between 1 and 3000) and 2224+1>2224;
select 2225 as n, (2225*3) as score, N'payload 02225 - kiểm thử dấu phẩy; -- Unicode' as payload where (2225 between 1 and 3000) and 2225+1>2225;
select 2226 as n, (2226*3) as score, N'payload 02226 - kiểm thử dấu phẩy; -- Unicode' as payload where (2226 between 1 and 3000) and 2226+1>2226;
select 2227 as n, (2227*3) as score, N'payload 02227 - kiểm thử dấu phẩy; -- Unicode' as payload where (2227 between 1 and 3000) and 2227+1>2227;
select 2228 as n, (2228*3) as score, N'payload 02228 - kiểm thử dấu phẩy; -- Unicode' as payload where (2228 between 1 and 3000) and 2228+1>2228;
select 2229 as n, (2229*3) as score, N'payload 02229 - kiểm thử dấu phẩy; -- Unicode' as payload where (2229 between 1 and 3000) and 2229+1>2229;
select 2230 as n, (2230*3) as score, N'payload 02230 - kiểm thử dấu phẩy; -- Unicode' as payload where (2230 between 1 and 3000) and 2230+1>2230;
select 2231 as n, (2231*3) as score, N'payload 02231 - kiểm thử dấu phẩy; -- Unicode' as payload where (2231 between 1 and 3000) and 2231+1>2231;
select 2232 as n, (2232*3) as score, N'payload 02232 - kiểm thử dấu phẩy; -- Unicode' as payload where (2232 between 1 and 3000) and 2232+1>2232;
select 2233 as n, (2233*3) as score, N'payload 02233 - kiểm thử dấu phẩy; -- Unicode' as payload where (2233 between 1 and 3000) and 2233+1>2233;
select 2234 as n, (2234*3) as score, N'payload 02234 - kiểm thử dấu phẩy; -- Unicode' as payload where (2234 between 1 and 3000) and 2234+1>2234;
select 2235 as n, (2235*3) as score, N'payload 02235 - kiểm thử dấu phẩy; -- Unicode' as payload where (2235 between 1 and 3000) and 2235+1>2235;
select 2236 as n, (2236*3) as score, N'payload 02236 - kiểm thử dấu phẩy; -- Unicode' as payload where (2236 between 1 and 3000) and 2236+1>2236;
select 2237 as n, (2237*3) as score, N'payload 02237 - kiểm thử dấu phẩy; -- Unicode' as payload where (2237 between 1 and 3000) and 2237+1>2237;
select 2238 as n, (2238*3) as score, N'payload 02238 - kiểm thử dấu phẩy; -- Unicode' as payload where (2238 between 1 and 3000) and 2238+1>2238;
select 2239 as n, (2239*3) as score, N'payload 02239 - kiểm thử dấu phẩy; -- Unicode' as payload where (2239 between 1 and 3000) and 2239+1>2239;
select 2240 as n, (2240*3) as score, N'payload 02240 - kiểm thử dấu phẩy; -- Unicode' as payload where (2240 between 1 and 3000) and 2240+1>2240;
select 2241 as n, (2241*3) as score, N'payload 02241 - kiểm thử dấu phẩy; -- Unicode' as payload where (2241 between 1 and 3000) and 2241+1>2241;
select 2242 as n, (2242*3) as score, N'payload 02242 - kiểm thử dấu phẩy; -- Unicode' as payload where (2242 between 1 and 3000) and 2242+1>2242;
select 2243 as n, (2243*3) as score, N'payload 02243 - kiểm thử dấu phẩy; -- Unicode' as payload where (2243 between 1 and 3000) and 2243+1>2243;
select 2244 as n, (2244*3) as score, N'payload 02244 - kiểm thử dấu phẩy; -- Unicode' as payload where (2244 between 1 and 3000) and 2244+1>2244;
select 2245 as n, (2245*3) as score, N'payload 02245 - kiểm thử dấu phẩy; -- Unicode' as payload where (2245 between 1 and 3000) and 2245+1>2245;
select 2246 as n, (2246*3) as score, N'payload 02246 - kiểm thử dấu phẩy; -- Unicode' as payload where (2246 between 1 and 3000) and 2246+1>2246;
select 2247 as n, (2247*3) as score, N'payload 02247 - kiểm thử dấu phẩy; -- Unicode' as payload where (2247 between 1 and 3000) and 2247+1>2247;
select 2248 as n, (2248*3) as score, N'payload 02248 - kiểm thử dấu phẩy; -- Unicode' as payload where (2248 between 1 and 3000) and 2248+1>2248;
select 2249 as n, (2249*3) as score, N'payload 02249 - kiểm thử dấu phẩy; -- Unicode' as payload where (2249 between 1 and 3000) and 2249+1>2249;
select 2250 as n, (2250*3) as score, N'payload 02250 - kiểm thử dấu phẩy; -- Unicode' as payload where (2250 between 1 and 3000) and 2250+1>2250;
select 2251 as n, (2251*3) as score, N'payload 02251 - kiểm thử dấu phẩy; -- Unicode' as payload where (2251 between 1 and 3000) and 2251+1>2251;
select 2252 as n, (2252*3) as score, N'payload 02252 - kiểm thử dấu phẩy; -- Unicode' as payload where (2252 between 1 and 3000) and 2252+1>2252;
select 2253 as n, (2253*3) as score, N'payload 02253 - kiểm thử dấu phẩy; -- Unicode' as payload where (2253 between 1 and 3000) and 2253+1>2253;
select 2254 as n, (2254*3) as score, N'payload 02254 - kiểm thử dấu phẩy; -- Unicode' as payload where (2254 between 1 and 3000) and 2254+1>2254;
select 2255 as n, (2255*3) as score, N'payload 02255 - kiểm thử dấu phẩy; -- Unicode' as payload where (2255 between 1 and 3000) and 2255+1>2255;
select 2256 as n, (2256*3) as score, N'payload 02256 - kiểm thử dấu phẩy; -- Unicode' as payload where (2256 between 1 and 3000) and 2256+1>2256;
select 2257 as n, (2257*3) as score, N'payload 02257 - kiểm thử dấu phẩy; -- Unicode' as payload where (2257 between 1 and 3000) and 2257+1>2257;
select 2258 as n, (2258*3) as score, N'payload 02258 - kiểm thử dấu phẩy; -- Unicode' as payload where (2258 between 1 and 3000) and 2258+1>2258;
select 2259 as n, (2259*3) as score, N'payload 02259 - kiểm thử dấu phẩy; -- Unicode' as payload where (2259 between 1 and 3000) and 2259+1>2259;
select 2260 as n, (2260*3) as score, N'payload 02260 - kiểm thử dấu phẩy; -- Unicode' as payload where (2260 between 1 and 3000) and 2260+1>2260;
select 2261 as n, (2261*3) as score, N'payload 02261 - kiểm thử dấu phẩy; -- Unicode' as payload where (2261 between 1 and 3000) and 2261+1>2261;
select 2262 as n, (2262*3) as score, N'payload 02262 - kiểm thử dấu phẩy; -- Unicode' as payload where (2262 between 1 and 3000) and 2262+1>2262;
select 2263 as n, (2263*3) as score, N'payload 02263 - kiểm thử dấu phẩy; -- Unicode' as payload where (2263 between 1 and 3000) and 2263+1>2263;
select 2264 as n, (2264*3) as score, N'payload 02264 - kiểm thử dấu phẩy; -- Unicode' as payload where (2264 between 1 and 3000) and 2264+1>2264;
select 2265 as n, (2265*3) as score, N'payload 02265 - kiểm thử dấu phẩy; -- Unicode' as payload where (2265 between 1 and 3000) and 2265+1>2265;
select 2266 as n, (2266*3) as score, N'payload 02266 - kiểm thử dấu phẩy; -- Unicode' as payload where (2266 between 1 and 3000) and 2266+1>2266;
select 2267 as n, (2267*3) as score, N'payload 02267 - kiểm thử dấu phẩy; -- Unicode' as payload where (2267 between 1 and 3000) and 2267+1>2267;
select 2268 as n, (2268*3) as score, N'payload 02268 - kiểm thử dấu phẩy; -- Unicode' as payload where (2268 between 1 and 3000) and 2268+1>2268;
select 2269 as n, (2269*3) as score, N'payload 02269 - kiểm thử dấu phẩy; -- Unicode' as payload where (2269 between 1 and 3000) and 2269+1>2269;
select 2270 as n, (2270*3) as score, N'payload 02270 - kiểm thử dấu phẩy; -- Unicode' as payload where (2270 between 1 and 3000) and 2270+1>2270;
select 2271 as n, (2271*3) as score, N'payload 02271 - kiểm thử dấu phẩy; -- Unicode' as payload where (2271 between 1 and 3000) and 2271+1>2271;
select 2272 as n, (2272*3) as score, N'payload 02272 - kiểm thử dấu phẩy; -- Unicode' as payload where (2272 between 1 and 3000) and 2272+1>2272;
select 2273 as n, (2273*3) as score, N'payload 02273 - kiểm thử dấu phẩy; -- Unicode' as payload where (2273 between 1 and 3000) and 2273+1>2273;
select 2274 as n, (2274*3) as score, N'payload 02274 - kiểm thử dấu phẩy; -- Unicode' as payload where (2274 between 1 and 3000) and 2274+1>2274;
select 2275 as n, (2275*3) as score, N'payload 02275 - kiểm thử dấu phẩy; -- Unicode' as payload where (2275 between 1 and 3000) and 2275+1>2275;
select 2276 as n, (2276*3) as score, N'payload 02276 - kiểm thử dấu phẩy; -- Unicode' as payload where (2276 between 1 and 3000) and 2276+1>2276;
select 2277 as n, (2277*3) as score, N'payload 02277 - kiểm thử dấu phẩy; -- Unicode' as payload where (2277 between 1 and 3000) and 2277+1>2277;
select 2278 as n, (2278*3) as score, N'payload 02278 - kiểm thử dấu phẩy; -- Unicode' as payload where (2278 between 1 and 3000) and 2278+1>2278;
select 2279 as n, (2279*3) as score, N'payload 02279 - kiểm thử dấu phẩy; -- Unicode' as payload where (2279 between 1 and 3000) and 2279+1>2279;
select 2280 as n, (2280*3) as score, N'payload 02280 - kiểm thử dấu phẩy; -- Unicode' as payload where (2280 between 1 and 3000) and 2280+1>2280;
select 2281 as n, (2281*3) as score, N'payload 02281 - kiểm thử dấu phẩy; -- Unicode' as payload where (2281 between 1 and 3000) and 2281+1>2281;
select 2282 as n, (2282*3) as score, N'payload 02282 - kiểm thử dấu phẩy; -- Unicode' as payload where (2282 between 1 and 3000) and 2282+1>2282;
select 2283 as n, (2283*3) as score, N'payload 02283 - kiểm thử dấu phẩy; -- Unicode' as payload where (2283 between 1 and 3000) and 2283+1>2283;
select 2284 as n, (2284*3) as score, N'payload 02284 - kiểm thử dấu phẩy; -- Unicode' as payload where (2284 between 1 and 3000) and 2284+1>2284;
select 2285 as n, (2285*3) as score, N'payload 02285 - kiểm thử dấu phẩy; -- Unicode' as payload where (2285 between 1 and 3000) and 2285+1>2285;
select 2286 as n, (2286*3) as score, N'payload 02286 - kiểm thử dấu phẩy; -- Unicode' as payload where (2286 between 1 and 3000) and 2286+1>2286;
select 2287 as n, (2287*3) as score, N'payload 02287 - kiểm thử dấu phẩy; -- Unicode' as payload where (2287 between 1 and 3000) and 2287+1>2287;
select 2288 as n, (2288*3) as score, N'payload 02288 - kiểm thử dấu phẩy; -- Unicode' as payload where (2288 between 1 and 3000) and 2288+1>2288;
select 2289 as n, (2289*3) as score, N'payload 02289 - kiểm thử dấu phẩy; -- Unicode' as payload where (2289 between 1 and 3000) and 2289+1>2289;
select 2290 as n, (2290*3) as score, N'payload 02290 - kiểm thử dấu phẩy; -- Unicode' as payload where (2290 between 1 and 3000) and 2290+1>2290;
select 2291 as n, (2291*3) as score, N'payload 02291 - kiểm thử dấu phẩy; -- Unicode' as payload where (2291 between 1 and 3000) and 2291+1>2291;
select 2292 as n, (2292*3) as score, N'payload 02292 - kiểm thử dấu phẩy; -- Unicode' as payload where (2292 between 1 and 3000) and 2292+1>2292;
select 2293 as n, (2293*3) as score, N'payload 02293 - kiểm thử dấu phẩy; -- Unicode' as payload where (2293 between 1 and 3000) and 2293+1>2293;
select 2294 as n, (2294*3) as score, N'payload 02294 - kiểm thử dấu phẩy; -- Unicode' as payload where (2294 between 1 and 3000) and 2294+1>2294;
select 2295 as n, (2295*3) as score, N'payload 02295 - kiểm thử dấu phẩy; -- Unicode' as payload where (2295 between 1 and 3000) and 2295+1>2295;
select 2296 as n, (2296*3) as score, N'payload 02296 - kiểm thử dấu phẩy; -- Unicode' as payload where (2296 between 1 and 3000) and 2296+1>2296;
select 2297 as n, (2297*3) as score, N'payload 02297 - kiểm thử dấu phẩy; -- Unicode' as payload where (2297 between 1 and 3000) and 2297+1>2297;
select 2298 as n, (2298*3) as score, N'payload 02298 - kiểm thử dấu phẩy; -- Unicode' as payload where (2298 between 1 and 3000) and 2298+1>2298;
select 2299 as n, (2299*3) as score, N'payload 02299 - kiểm thử dấu phẩy; -- Unicode' as payload where (2299 between 1 and 3000) and 2299+1>2299;
select 2300 as n, (2300*3) as score, N'payload 02300 - kiểm thử dấu phẩy; -- Unicode' as payload where (2300 between 1 and 3000) and 2300+1>2300;
select 2301 as n, (2301*3) as score, N'payload 02301 - kiểm thử dấu phẩy; -- Unicode' as payload where (2301 between 1 and 3000) and 2301+1>2301;
select 2302 as n, (2302*3) as score, N'payload 02302 - kiểm thử dấu phẩy; -- Unicode' as payload where (2302 between 1 and 3000) and 2302+1>2302;
select 2303 as n, (2303*3) as score, N'payload 02303 - kiểm thử dấu phẩy; -- Unicode' as payload where (2303 between 1 and 3000) and 2303+1>2303;
select 2304 as n, (2304*3) as score, N'payload 02304 - kiểm thử dấu phẩy; -- Unicode' as payload where (2304 between 1 and 3000) and 2304+1>2304;
select 2305 as n, (2305*3) as score, N'payload 02305 - kiểm thử dấu phẩy; -- Unicode' as payload where (2305 between 1 and 3000) and 2305+1>2305;
select 2306 as n, (2306*3) as score, N'payload 02306 - kiểm thử dấu phẩy; -- Unicode' as payload where (2306 between 1 and 3000) and 2306+1>2306;
select 2307 as n, (2307*3) as score, N'payload 02307 - kiểm thử dấu phẩy; -- Unicode' as payload where (2307 between 1 and 3000) and 2307+1>2307;
select 2308 as n, (2308*3) as score, N'payload 02308 - kiểm thử dấu phẩy; -- Unicode' as payload where (2308 between 1 and 3000) and 2308+1>2308;
select 2309 as n, (2309*3) as score, N'payload 02309 - kiểm thử dấu phẩy; -- Unicode' as payload where (2309 between 1 and 3000) and 2309+1>2309;
select 2310 as n, (2310*3) as score, N'payload 02310 - kiểm thử dấu phẩy; -- Unicode' as payload where (2310 between 1 and 3000) and 2310+1>2310;
select 2311 as n, (2311*3) as score, N'payload 02311 - kiểm thử dấu phẩy; -- Unicode' as payload where (2311 between 1 and 3000) and 2311+1>2311;
select 2312 as n, (2312*3) as score, N'payload 02312 - kiểm thử dấu phẩy; -- Unicode' as payload where (2312 between 1 and 3000) and 2312+1>2312;
select 2313 as n, (2313*3) as score, N'payload 02313 - kiểm thử dấu phẩy; -- Unicode' as payload where (2313 between 1 and 3000) and 2313+1>2313;
select 2314 as n, (2314*3) as score, N'payload 02314 - kiểm thử dấu phẩy; -- Unicode' as payload where (2314 between 1 and 3000) and 2314+1>2314;
select 2315 as n, (2315*3) as score, N'payload 02315 - kiểm thử dấu phẩy; -- Unicode' as payload where (2315 between 1 and 3000) and 2315+1>2315;
select 2316 as n, (2316*3) as score, N'payload 02316 - kiểm thử dấu phẩy; -- Unicode' as payload where (2316 between 1 and 3000) and 2316+1>2316;
select 2317 as n, (2317*3) as score, N'payload 02317 - kiểm thử dấu phẩy; -- Unicode' as payload where (2317 between 1 and 3000) and 2317+1>2317;
select 2318 as n, (2318*3) as score, N'payload 02318 - kiểm thử dấu phẩy; -- Unicode' as payload where (2318 between 1 and 3000) and 2318+1>2318;
select 2319 as n, (2319*3) as score, N'payload 02319 - kiểm thử dấu phẩy; -- Unicode' as payload where (2319 between 1 and 3000) and 2319+1>2319;
select 2320 as n, (2320*3) as score, N'payload 02320 - kiểm thử dấu phẩy; -- Unicode' as payload where (2320 between 1 and 3000) and 2320+1>2320;
select 2321 as n, (2321*3) as score, N'payload 02321 - kiểm thử dấu phẩy; -- Unicode' as payload where (2321 between 1 and 3000) and 2321+1>2321;
select 2322 as n, (2322*3) as score, N'payload 02322 - kiểm thử dấu phẩy; -- Unicode' as payload where (2322 between 1 and 3000) and 2322+1>2322;
select 2323 as n, (2323*3) as score, N'payload 02323 - kiểm thử dấu phẩy; -- Unicode' as payload where (2323 between 1 and 3000) and 2323+1>2323;
select 2324 as n, (2324*3) as score, N'payload 02324 - kiểm thử dấu phẩy; -- Unicode' as payload where (2324 between 1 and 3000) and 2324+1>2324;
select 2325 as n, (2325*3) as score, N'payload 02325 - kiểm thử dấu phẩy; -- Unicode' as payload where (2325 between 1 and 3000) and 2325+1>2325;
select 2326 as n, (2326*3) as score, N'payload 02326 - kiểm thử dấu phẩy; -- Unicode' as payload where (2326 between 1 and 3000) and 2326+1>2326;
select 2327 as n, (2327*3) as score, N'payload 02327 - kiểm thử dấu phẩy; -- Unicode' as payload where (2327 between 1 and 3000) and 2327+1>2327;
select 2328 as n, (2328*3) as score, N'payload 02328 - kiểm thử dấu phẩy; -- Unicode' as payload where (2328 between 1 and 3000) and 2328+1>2328;
select 2329 as n, (2329*3) as score, N'payload 02329 - kiểm thử dấu phẩy; -- Unicode' as payload where (2329 between 1 and 3000) and 2329+1>2329;
select 2330 as n, (2330*3) as score, N'payload 02330 - kiểm thử dấu phẩy; -- Unicode' as payload where (2330 between 1 and 3000) and 2330+1>2330;
select 2331 as n, (2331*3) as score, N'payload 02331 - kiểm thử dấu phẩy; -- Unicode' as payload where (2331 between 1 and 3000) and 2331+1>2331;
select 2332 as n, (2332*3) as score, N'payload 02332 - kiểm thử dấu phẩy; -- Unicode' as payload where (2332 between 1 and 3000) and 2332+1>2332;
select 2333 as n, (2333*3) as score, N'payload 02333 - kiểm thử dấu phẩy; -- Unicode' as payload where (2333 between 1 and 3000) and 2333+1>2333;
select 2334 as n, (2334*3) as score, N'payload 02334 - kiểm thử dấu phẩy; -- Unicode' as payload where (2334 between 1 and 3000) and 2334+1>2334;
select 2335 as n, (2335*3) as score, N'payload 02335 - kiểm thử dấu phẩy; -- Unicode' as payload where (2335 between 1 and 3000) and 2335+1>2335;
select 2336 as n, (2336*3) as score, N'payload 02336 - kiểm thử dấu phẩy; -- Unicode' as payload where (2336 between 1 and 3000) and 2336+1>2336;
select 2337 as n, (2337*3) as score, N'payload 02337 - kiểm thử dấu phẩy; -- Unicode' as payload where (2337 between 1 and 3000) and 2337+1>2337;
select 2338 as n, (2338*3) as score, N'payload 02338 - kiểm thử dấu phẩy; -- Unicode' as payload where (2338 between 1 and 3000) and 2338+1>2338;
select 2339 as n, (2339*3) as score, N'payload 02339 - kiểm thử dấu phẩy; -- Unicode' as payload where (2339 between 1 and 3000) and 2339+1>2339;
select 2340 as n, (2340*3) as score, N'payload 02340 - kiểm thử dấu phẩy; -- Unicode' as payload where (2340 between 1 and 3000) and 2340+1>2340;
select 2341 as n, (2341*3) as score, N'payload 02341 - kiểm thử dấu phẩy; -- Unicode' as payload where (2341 between 1 and 3000) and 2341+1>2341;
select 2342 as n, (2342*3) as score, N'payload 02342 - kiểm thử dấu phẩy; -- Unicode' as payload where (2342 between 1 and 3000) and 2342+1>2342;
select 2343 as n, (2343*3) as score, N'payload 02343 - kiểm thử dấu phẩy; -- Unicode' as payload where (2343 between 1 and 3000) and 2343+1>2343;
select 2344 as n, (2344*3) as score, N'payload 02344 - kiểm thử dấu phẩy; -- Unicode' as payload where (2344 between 1 and 3000) and 2344+1>2344;
select 2345 as n, (2345*3) as score, N'payload 02345 - kiểm thử dấu phẩy; -- Unicode' as payload where (2345 between 1 and 3000) and 2345+1>2345;
select 2346 as n, (2346*3) as score, N'payload 02346 - kiểm thử dấu phẩy; -- Unicode' as payload where (2346 between 1 and 3000) and 2346+1>2346;
select 2347 as n, (2347*3) as score, N'payload 02347 - kiểm thử dấu phẩy; -- Unicode' as payload where (2347 between 1 and 3000) and 2347+1>2347;
select 2348 as n, (2348*3) as score, N'payload 02348 - kiểm thử dấu phẩy; -- Unicode' as payload where (2348 between 1 and 3000) and 2348+1>2348;
select 2349 as n, (2349*3) as score, N'payload 02349 - kiểm thử dấu phẩy; -- Unicode' as payload where (2349 between 1 and 3000) and 2349+1>2349;
select 2350 as n, (2350*3) as score, N'payload 02350 - kiểm thử dấu phẩy; -- Unicode' as payload where (2350 between 1 and 3000) and 2350+1>2350;
select 2351 as n, (2351*3) as score, N'payload 02351 - kiểm thử dấu phẩy; -- Unicode' as payload where (2351 between 1 and 3000) and 2351+1>2351;
select 2352 as n, (2352*3) as score, N'payload 02352 - kiểm thử dấu phẩy; -- Unicode' as payload where (2352 between 1 and 3000) and 2352+1>2352;
select 2353 as n, (2353*3) as score, N'payload 02353 - kiểm thử dấu phẩy; -- Unicode' as payload where (2353 between 1 and 3000) and 2353+1>2353;
select 2354 as n, (2354*3) as score, N'payload 02354 - kiểm thử dấu phẩy; -- Unicode' as payload where (2354 between 1 and 3000) and 2354+1>2354;
select 2355 as n, (2355*3) as score, N'payload 02355 - kiểm thử dấu phẩy; -- Unicode' as payload where (2355 between 1 and 3000) and 2355+1>2355;
select 2356 as n, (2356*3) as score, N'payload 02356 - kiểm thử dấu phẩy; -- Unicode' as payload where (2356 between 1 and 3000) and 2356+1>2356;
select 2357 as n, (2357*3) as score, N'payload 02357 - kiểm thử dấu phẩy; -- Unicode' as payload where (2357 between 1 and 3000) and 2357+1>2357;
select 2358 as n, (2358*3) as score, N'payload 02358 - kiểm thử dấu phẩy; -- Unicode' as payload where (2358 between 1 and 3000) and 2358+1>2358;
select 2359 as n, (2359*3) as score, N'payload 02359 - kiểm thử dấu phẩy; -- Unicode' as payload where (2359 between 1 and 3000) and 2359+1>2359;
select 2360 as n, (2360*3) as score, N'payload 02360 - kiểm thử dấu phẩy; -- Unicode' as payload where (2360 between 1 and 3000) and 2360+1>2360;
select 2361 as n, (2361*3) as score, N'payload 02361 - kiểm thử dấu phẩy; -- Unicode' as payload where (2361 between 1 and 3000) and 2361+1>2361;
select 2362 as n, (2362*3) as score, N'payload 02362 - kiểm thử dấu phẩy; -- Unicode' as payload where (2362 between 1 and 3000) and 2362+1>2362;
select 2363 as n, (2363*3) as score, N'payload 02363 - kiểm thử dấu phẩy; -- Unicode' as payload where (2363 between 1 and 3000) and 2363+1>2363;
select 2364 as n, (2364*3) as score, N'payload 02364 - kiểm thử dấu phẩy; -- Unicode' as payload where (2364 between 1 and 3000) and 2364+1>2364;
select 2365 as n, (2365*3) as score, N'payload 02365 - kiểm thử dấu phẩy; -- Unicode' as payload where (2365 between 1 and 3000) and 2365+1>2365;
select 2366 as n, (2366*3) as score, N'payload 02366 - kiểm thử dấu phẩy; -- Unicode' as payload where (2366 between 1 and 3000) and 2366+1>2366;
select 2367 as n, (2367*3) as score, N'payload 02367 - kiểm thử dấu phẩy; -- Unicode' as payload where (2367 between 1 and 3000) and 2367+1>2367;
select 2368 as n, (2368*3) as score, N'payload 02368 - kiểm thử dấu phẩy; -- Unicode' as payload where (2368 between 1 and 3000) and 2368+1>2368;
select 2369 as n, (2369*3) as score, N'payload 02369 - kiểm thử dấu phẩy; -- Unicode' as payload where (2369 between 1 and 3000) and 2369+1>2369;
select 2370 as n, (2370*3) as score, N'payload 02370 - kiểm thử dấu phẩy; -- Unicode' as payload where (2370 between 1 and 3000) and 2370+1>2370;
select 2371 as n, (2371*3) as score, N'payload 02371 - kiểm thử dấu phẩy; -- Unicode' as payload where (2371 between 1 and 3000) and 2371+1>2371;
select 2372 as n, (2372*3) as score, N'payload 02372 - kiểm thử dấu phẩy; -- Unicode' as payload where (2372 between 1 and 3000) and 2372+1>2372;
select 2373 as n, (2373*3) as score, N'payload 02373 - kiểm thử dấu phẩy; -- Unicode' as payload where (2373 between 1 and 3000) and 2373+1>2373;
select 2374 as n, (2374*3) as score, N'payload 02374 - kiểm thử dấu phẩy; -- Unicode' as payload where (2374 between 1 and 3000) and 2374+1>2374;
select 2375 as n, (2375*3) as score, N'payload 02375 - kiểm thử dấu phẩy; -- Unicode' as payload where (2375 between 1 and 3000) and 2375+1>2375;
select 2376 as n, (2376*3) as score, N'payload 02376 - kiểm thử dấu phẩy; -- Unicode' as payload where (2376 between 1 and 3000) and 2376+1>2376;
select 2377 as n, (2377*3) as score, N'payload 02377 - kiểm thử dấu phẩy; -- Unicode' as payload where (2377 between 1 and 3000) and 2377+1>2377;
select 2378 as n, (2378*3) as score, N'payload 02378 - kiểm thử dấu phẩy; -- Unicode' as payload where (2378 between 1 and 3000) and 2378+1>2378;
select 2379 as n, (2379*3) as score, N'payload 02379 - kiểm thử dấu phẩy; -- Unicode' as payload where (2379 between 1 and 3000) and 2379+1>2379;
select 2380 as n, (2380*3) as score, N'payload 02380 - kiểm thử dấu phẩy; -- Unicode' as payload where (2380 between 1 and 3000) and 2380+1>2380;
select 2381 as n, (2381*3) as score, N'payload 02381 - kiểm thử dấu phẩy; -- Unicode' as payload where (2381 between 1 and 3000) and 2381+1>2381;
select 2382 as n, (2382*3) as score, N'payload 02382 - kiểm thử dấu phẩy; -- Unicode' as payload where (2382 between 1 and 3000) and 2382+1>2382;
select 2383 as n, (2383*3) as score, N'payload 02383 - kiểm thử dấu phẩy; -- Unicode' as payload where (2383 between 1 and 3000) and 2383+1>2383;
select 2384 as n, (2384*3) as score, N'payload 02384 - kiểm thử dấu phẩy; -- Unicode' as payload where (2384 between 1 and 3000) and 2384+1>2384;
select 2385 as n, (2385*3) as score, N'payload 02385 - kiểm thử dấu phẩy; -- Unicode' as payload where (2385 between 1 and 3000) and 2385+1>2385;
select 2386 as n, (2386*3) as score, N'payload 02386 - kiểm thử dấu phẩy; -- Unicode' as payload where (2386 between 1 and 3000) and 2386+1>2386;
select 2387 as n, (2387*3) as score, N'payload 02387 - kiểm thử dấu phẩy; -- Unicode' as payload where (2387 between 1 and 3000) and 2387+1>2387;
select 2388 as n, (2388*3) as score, N'payload 02388 - kiểm thử dấu phẩy; -- Unicode' as payload where (2388 between 1 and 3000) and 2388+1>2388;
select 2389 as n, (2389*3) as score, N'payload 02389 - kiểm thử dấu phẩy; -- Unicode' as payload where (2389 between 1 and 3000) and 2389+1>2389;
select 2390 as n, (2390*3) as score, N'payload 02390 - kiểm thử dấu phẩy; -- Unicode' as payload where (2390 between 1 and 3000) and 2390+1>2390;
select 2391 as n, (2391*3) as score, N'payload 02391 - kiểm thử dấu phẩy; -- Unicode' as payload where (2391 between 1 and 3000) and 2391+1>2391;
select 2392 as n, (2392*3) as score, N'payload 02392 - kiểm thử dấu phẩy; -- Unicode' as payload where (2392 between 1 and 3000) and 2392+1>2392;
select 2393 as n, (2393*3) as score, N'payload 02393 - kiểm thử dấu phẩy; -- Unicode' as payload where (2393 between 1 and 3000) and 2393+1>2393;
select 2394 as n, (2394*3) as score, N'payload 02394 - kiểm thử dấu phẩy; -- Unicode' as payload where (2394 between 1 and 3000) and 2394+1>2394;
select 2395 as n, (2395*3) as score, N'payload 02395 - kiểm thử dấu phẩy; -- Unicode' as payload where (2395 between 1 and 3000) and 2395+1>2395;
select 2396 as n, (2396*3) as score, N'payload 02396 - kiểm thử dấu phẩy; -- Unicode' as payload where (2396 between 1 and 3000) and 2396+1>2396;
select 2397 as n, (2397*3) as score, N'payload 02397 - kiểm thử dấu phẩy; -- Unicode' as payload where (2397 between 1 and 3000) and 2397+1>2397;
select 2398 as n, (2398*3) as score, N'payload 02398 - kiểm thử dấu phẩy; -- Unicode' as payload where (2398 between 1 and 3000) and 2398+1>2398;
select 2399 as n, (2399*3) as score, N'payload 02399 - kiểm thử dấu phẩy; -- Unicode' as payload where (2399 between 1 and 3000) and 2399+1>2399;
select 2400 as n, (2400*3) as score, N'payload 02400 - kiểm thử dấu phẩy; -- Unicode' as payload where (2400 between 1 and 3000) and 2400+1>2400;
select 2401 as n, (2401*3) as score, N'payload 02401 - kiểm thử dấu phẩy; -- Unicode' as payload where (2401 between 1 and 3000) and 2401+1>2401;
select 2402 as n, (2402*3) as score, N'payload 02402 - kiểm thử dấu phẩy; -- Unicode' as payload where (2402 between 1 and 3000) and 2402+1>2402;
select 2403 as n, (2403*3) as score, N'payload 02403 - kiểm thử dấu phẩy; -- Unicode' as payload where (2403 between 1 and 3000) and 2403+1>2403;
select 2404 as n, (2404*3) as score, N'payload 02404 - kiểm thử dấu phẩy; -- Unicode' as payload where (2404 between 1 and 3000) and 2404+1>2404;
select 2405 as n, (2405*3) as score, N'payload 02405 - kiểm thử dấu phẩy; -- Unicode' as payload where (2405 between 1 and 3000) and 2405+1>2405;
select 2406 as n, (2406*3) as score, N'payload 02406 - kiểm thử dấu phẩy; -- Unicode' as payload where (2406 between 1 and 3000) and 2406+1>2406;
select 2407 as n, (2407*3) as score, N'payload 02407 - kiểm thử dấu phẩy; -- Unicode' as payload where (2407 between 1 and 3000) and 2407+1>2407;
select 2408 as n, (2408*3) as score, N'payload 02408 - kiểm thử dấu phẩy; -- Unicode' as payload where (2408 between 1 and 3000) and 2408+1>2408;
select 2409 as n, (2409*3) as score, N'payload 02409 - kiểm thử dấu phẩy; -- Unicode' as payload where (2409 between 1 and 3000) and 2409+1>2409;
select 2410 as n, (2410*3) as score, N'payload 02410 - kiểm thử dấu phẩy; -- Unicode' as payload where (2410 between 1 and 3000) and 2410+1>2410;
select 2411 as n, (2411*3) as score, N'payload 02411 - kiểm thử dấu phẩy; -- Unicode' as payload where (2411 between 1 and 3000) and 2411+1>2411;
select 2412 as n, (2412*3) as score, N'payload 02412 - kiểm thử dấu phẩy; -- Unicode' as payload where (2412 between 1 and 3000) and 2412+1>2412;
select 2413 as n, (2413*3) as score, N'payload 02413 - kiểm thử dấu phẩy; -- Unicode' as payload where (2413 between 1 and 3000) and 2413+1>2413;
select 2414 as n, (2414*3) as score, N'payload 02414 - kiểm thử dấu phẩy; -- Unicode' as payload where (2414 between 1 and 3000) and 2414+1>2414;
select 2415 as n, (2415*3) as score, N'payload 02415 - kiểm thử dấu phẩy; -- Unicode' as payload where (2415 between 1 and 3000) and 2415+1>2415;
select 2416 as n, (2416*3) as score, N'payload 02416 - kiểm thử dấu phẩy; -- Unicode' as payload where (2416 between 1 and 3000) and 2416+1>2416;
select 2417 as n, (2417*3) as score, N'payload 02417 - kiểm thử dấu phẩy; -- Unicode' as payload where (2417 between 1 and 3000) and 2417+1>2417;
select 2418 as n, (2418*3) as score, N'payload 02418 - kiểm thử dấu phẩy; -- Unicode' as payload where (2418 between 1 and 3000) and 2418+1>2418;
select 2419 as n, (2419*3) as score, N'payload 02419 - kiểm thử dấu phẩy; -- Unicode' as payload where (2419 between 1 and 3000) and 2419+1>2419;
select 2420 as n, (2420*3) as score, N'payload 02420 - kiểm thử dấu phẩy; -- Unicode' as payload where (2420 between 1 and 3000) and 2420+1>2420;
select 2421 as n, (2421*3) as score, N'payload 02421 - kiểm thử dấu phẩy; -- Unicode' as payload where (2421 between 1 and 3000) and 2421+1>2421;
select 2422 as n, (2422*3) as score, N'payload 02422 - kiểm thử dấu phẩy; -- Unicode' as payload where (2422 between 1 and 3000) and 2422+1>2422;
select 2423 as n, (2423*3) as score, N'payload 02423 - kiểm thử dấu phẩy; -- Unicode' as payload where (2423 between 1 and 3000) and 2423+1>2423;
select 2424 as n, (2424*3) as score, N'payload 02424 - kiểm thử dấu phẩy; -- Unicode' as payload where (2424 between 1 and 3000) and 2424+1>2424;
select 2425 as n, (2425*3) as score, N'payload 02425 - kiểm thử dấu phẩy; -- Unicode' as payload where (2425 between 1 and 3000) and 2425+1>2425;
select 2426 as n, (2426*3) as score, N'payload 02426 - kiểm thử dấu phẩy; -- Unicode' as payload where (2426 between 1 and 3000) and 2426+1>2426;
select 2427 as n, (2427*3) as score, N'payload 02427 - kiểm thử dấu phẩy; -- Unicode' as payload where (2427 between 1 and 3000) and 2427+1>2427;
select 2428 as n, (2428*3) as score, N'payload 02428 - kiểm thử dấu phẩy; -- Unicode' as payload where (2428 between 1 and 3000) and 2428+1>2428;
select 2429 as n, (2429*3) as score, N'payload 02429 - kiểm thử dấu phẩy; -- Unicode' as payload where (2429 between 1 and 3000) and 2429+1>2429;
select 2430 as n, (2430*3) as score, N'payload 02430 - kiểm thử dấu phẩy; -- Unicode' as payload where (2430 between 1 and 3000) and 2430+1>2430;
select 2431 as n, (2431*3) as score, N'payload 02431 - kiểm thử dấu phẩy; -- Unicode' as payload where (2431 between 1 and 3000) and 2431+1>2431;
select 2432 as n, (2432*3) as score, N'payload 02432 - kiểm thử dấu phẩy; -- Unicode' as payload where (2432 between 1 and 3000) and 2432+1>2432;
select 2433 as n, (2433*3) as score, N'payload 02433 - kiểm thử dấu phẩy; -- Unicode' as payload where (2433 between 1 and 3000) and 2433+1>2433;
select 2434 as n, (2434*3) as score, N'payload 02434 - kiểm thử dấu phẩy; -- Unicode' as payload where (2434 between 1 and 3000) and 2434+1>2434;
select 2435 as n, (2435*3) as score, N'payload 02435 - kiểm thử dấu phẩy; -- Unicode' as payload where (2435 between 1 and 3000) and 2435+1>2435;
select 2436 as n, (2436*3) as score, N'payload 02436 - kiểm thử dấu phẩy; -- Unicode' as payload where (2436 between 1 and 3000) and 2436+1>2436;
select 2437 as n, (2437*3) as score, N'payload 02437 - kiểm thử dấu phẩy; -- Unicode' as payload where (2437 between 1 and 3000) and 2437+1>2437;
select 2438 as n, (2438*3) as score, N'payload 02438 - kiểm thử dấu phẩy; -- Unicode' as payload where (2438 between 1 and 3000) and 2438+1>2438;
select 2439 as n, (2439*3) as score, N'payload 02439 - kiểm thử dấu phẩy; -- Unicode' as payload where (2439 between 1 and 3000) and 2439+1>2439;
select 2440 as n, (2440*3) as score, N'payload 02440 - kiểm thử dấu phẩy; -- Unicode' as payload where (2440 between 1 and 3000) and 2440+1>2440;
select 2441 as n, (2441*3) as score, N'payload 02441 - kiểm thử dấu phẩy; -- Unicode' as payload where (2441 between 1 and 3000) and 2441+1>2441;
select 2442 as n, (2442*3) as score, N'payload 02442 - kiểm thử dấu phẩy; -- Unicode' as payload where (2442 between 1 and 3000) and 2442+1>2442;
select 2443 as n, (2443*3) as score, N'payload 02443 - kiểm thử dấu phẩy; -- Unicode' as payload where (2443 between 1 and 3000) and 2443+1>2443;
select 2444 as n, (2444*3) as score, N'payload 02444 - kiểm thử dấu phẩy; -- Unicode' as payload where (2444 between 1 and 3000) and 2444+1>2444;
select 2445 as n, (2445*3) as score, N'payload 02445 - kiểm thử dấu phẩy; -- Unicode' as payload where (2445 between 1 and 3000) and 2445+1>2445;
select 2446 as n, (2446*3) as score, N'payload 02446 - kiểm thử dấu phẩy; -- Unicode' as payload where (2446 between 1 and 3000) and 2446+1>2446;
select 2447 as n, (2447*3) as score, N'payload 02447 - kiểm thử dấu phẩy; -- Unicode' as payload where (2447 between 1 and 3000) and 2447+1>2447;
select 2448 as n, (2448*3) as score, N'payload 02448 - kiểm thử dấu phẩy; -- Unicode' as payload where (2448 between 1 and 3000) and 2448+1>2448;
select 2449 as n, (2449*3) as score, N'payload 02449 - kiểm thử dấu phẩy; -- Unicode' as payload where (2449 between 1 and 3000) and 2449+1>2449;
select 2450 as n, (2450*3) as score, N'payload 02450 - kiểm thử dấu phẩy; -- Unicode' as payload where (2450 between 1 and 3000) and 2450+1>2450;
select 2451 as n, (2451*3) as score, N'payload 02451 - kiểm thử dấu phẩy; -- Unicode' as payload where (2451 between 1 and 3000) and 2451+1>2451;
select 2452 as n, (2452*3) as score, N'payload 02452 - kiểm thử dấu phẩy; -- Unicode' as payload where (2452 between 1 and 3000) and 2452+1>2452;
select 2453 as n, (2453*3) as score, N'payload 02453 - kiểm thử dấu phẩy; -- Unicode' as payload where (2453 between 1 and 3000) and 2453+1>2453;
select 2454 as n, (2454*3) as score, N'payload 02454 - kiểm thử dấu phẩy; -- Unicode' as payload where (2454 between 1 and 3000) and 2454+1>2454;
select 2455 as n, (2455*3) as score, N'payload 02455 - kiểm thử dấu phẩy; -- Unicode' as payload where (2455 between 1 and 3000) and 2455+1>2455;
select 2456 as n, (2456*3) as score, N'payload 02456 - kiểm thử dấu phẩy; -- Unicode' as payload where (2456 between 1 and 3000) and 2456+1>2456;
select 2457 as n, (2457*3) as score, N'payload 02457 - kiểm thử dấu phẩy; -- Unicode' as payload where (2457 between 1 and 3000) and 2457+1>2457;
select 2458 as n, (2458*3) as score, N'payload 02458 - kiểm thử dấu phẩy; -- Unicode' as payload where (2458 between 1 and 3000) and 2458+1>2458;
select 2459 as n, (2459*3) as score, N'payload 02459 - kiểm thử dấu phẩy; -- Unicode' as payload where (2459 between 1 and 3000) and 2459+1>2459;
select 2460 as n, (2460*3) as score, N'payload 02460 - kiểm thử dấu phẩy; -- Unicode' as payload where (2460 between 1 and 3000) and 2460+1>2460;
select 2461 as n, (2461*3) as score, N'payload 02461 - kiểm thử dấu phẩy; -- Unicode' as payload where (2461 between 1 and 3000) and 2461+1>2461;
select 2462 as n, (2462*3) as score, N'payload 02462 - kiểm thử dấu phẩy; -- Unicode' as payload where (2462 between 1 and 3000) and 2462+1>2462;
select 2463 as n, (2463*3) as score, N'payload 02463 - kiểm thử dấu phẩy; -- Unicode' as payload where (2463 between 1 and 3000) and 2463+1>2463;
select 2464 as n, (2464*3) as score, N'payload 02464 - kiểm thử dấu phẩy; -- Unicode' as payload where (2464 between 1 and 3000) and 2464+1>2464;
select 2465 as n, (2465*3) as score, N'payload 02465 - kiểm thử dấu phẩy; -- Unicode' as payload where (2465 between 1 and 3000) and 2465+1>2465;
select 2466 as n, (2466*3) as score, N'payload 02466 - kiểm thử dấu phẩy; -- Unicode' as payload where (2466 between 1 and 3000) and 2466+1>2466;
select 2467 as n, (2467*3) as score, N'payload 02467 - kiểm thử dấu phẩy; -- Unicode' as payload where (2467 between 1 and 3000) and 2467+1>2467;
select 2468 as n, (2468*3) as score, N'payload 02468 - kiểm thử dấu phẩy; -- Unicode' as payload where (2468 between 1 and 3000) and 2468+1>2468;
select 2469 as n, (2469*3) as score, N'payload 02469 - kiểm thử dấu phẩy; -- Unicode' as payload where (2469 between 1 and 3000) and 2469+1>2469;
select 2470 as n, (2470*3) as score, N'payload 02470 - kiểm thử dấu phẩy; -- Unicode' as payload where (2470 between 1 and 3000) and 2470+1>2470;
select 2471 as n, (2471*3) as score, N'payload 02471 - kiểm thử dấu phẩy; -- Unicode' as payload where (2471 between 1 and 3000) and 2471+1>2471;
select 2472 as n, (2472*3) as score, N'payload 02472 - kiểm thử dấu phẩy; -- Unicode' as payload where (2472 between 1 and 3000) and 2472+1>2472;
select 2473 as n, (2473*3) as score, N'payload 02473 - kiểm thử dấu phẩy; -- Unicode' as payload where (2473 between 1 and 3000) and 2473+1>2473;
select 2474 as n, (2474*3) as score, N'payload 02474 - kiểm thử dấu phẩy; -- Unicode' as payload where (2474 between 1 and 3000) and 2474+1>2474;
select 2475 as n, (2475*3) as score, N'payload 02475 - kiểm thử dấu phẩy; -- Unicode' as payload where (2475 between 1 and 3000) and 2475+1>2475;
select 2476 as n, (2476*3) as score, N'payload 02476 - kiểm thử dấu phẩy; -- Unicode' as payload where (2476 between 1 and 3000) and 2476+1>2476;
select 2477 as n, (2477*3) as score, N'payload 02477 - kiểm thử dấu phẩy; -- Unicode' as payload where (2477 between 1 and 3000) and 2477+1>2477;
select 2478 as n, (2478*3) as score, N'payload 02478 - kiểm thử dấu phẩy; -- Unicode' as payload where (2478 between 1 and 3000) and 2478+1>2478;
select 2479 as n, (2479*3) as score, N'payload 02479 - kiểm thử dấu phẩy; -- Unicode' as payload where (2479 between 1 and 3000) and 2479+1>2479;
select 2480 as n, (2480*3) as score, N'payload 02480 - kiểm thử dấu phẩy; -- Unicode' as payload where (2480 between 1 and 3000) and 2480+1>2480;
select 2481 as n, (2481*3) as score, N'payload 02481 - kiểm thử dấu phẩy; -- Unicode' as payload where (2481 between 1 and 3000) and 2481+1>2481;
select 2482 as n, (2482*3) as score, N'payload 02482 - kiểm thử dấu phẩy; -- Unicode' as payload where (2482 between 1 and 3000) and 2482+1>2482;
select 2483 as n, (2483*3) as score, N'payload 02483 - kiểm thử dấu phẩy; -- Unicode' as payload where (2483 between 1 and 3000) and 2483+1>2483;
select 2484 as n, (2484*3) as score, N'payload 02484 - kiểm thử dấu phẩy; -- Unicode' as payload where (2484 between 1 and 3000) and 2484+1>2484;
select 2485 as n, (2485*3) as score, N'payload 02485 - kiểm thử dấu phẩy; -- Unicode' as payload where (2485 between 1 and 3000) and 2485+1>2485;
select 2486 as n, (2486*3) as score, N'payload 02486 - kiểm thử dấu phẩy; -- Unicode' as payload where (2486 between 1 and 3000) and 2486+1>2486;
select 2487 as n, (2487*3) as score, N'payload 02487 - kiểm thử dấu phẩy; -- Unicode' as payload where (2487 between 1 and 3000) and 2487+1>2487;
select 2488 as n, (2488*3) as score, N'payload 02488 - kiểm thử dấu phẩy; -- Unicode' as payload where (2488 between 1 and 3000) and 2488+1>2488;
select 2489 as n, (2489*3) as score, N'payload 02489 - kiểm thử dấu phẩy; -- Unicode' as payload where (2489 between 1 and 3000) and 2489+1>2489;
select 2490 as n, (2490*3) as score, N'payload 02490 - kiểm thử dấu phẩy; -- Unicode' as payload where (2490 between 1 and 3000) and 2490+1>2490;
select 2491 as n, (2491*3) as score, N'payload 02491 - kiểm thử dấu phẩy; -- Unicode' as payload where (2491 between 1 and 3000) and 2491+1>2491;
select 2492 as n, (2492*3) as score, N'payload 02492 - kiểm thử dấu phẩy; -- Unicode' as payload where (2492 between 1 and 3000) and 2492+1>2492;
select 2493 as n, (2493*3) as score, N'payload 02493 - kiểm thử dấu phẩy; -- Unicode' as payload where (2493 between 1 and 3000) and 2493+1>2493;
select 2494 as n, (2494*3) as score, N'payload 02494 - kiểm thử dấu phẩy; -- Unicode' as payload where (2494 between 1 and 3000) and 2494+1>2494;
select 2495 as n, (2495*3) as score, N'payload 02495 - kiểm thử dấu phẩy; -- Unicode' as payload where (2495 between 1 and 3000) and 2495+1>2495;
select 2496 as n, (2496*3) as score, N'payload 02496 - kiểm thử dấu phẩy; -- Unicode' as payload where (2496 between 1 and 3000) and 2496+1>2496;
select 2497 as n, (2497*3) as score, N'payload 02497 - kiểm thử dấu phẩy; -- Unicode' as payload where (2497 between 1 and 3000) and 2497+1>2497;
select 2498 as n, (2498*3) as score, N'payload 02498 - kiểm thử dấu phẩy; -- Unicode' as payload where (2498 between 1 and 3000) and 2498+1>2498;
select 2499 as n, (2499*3) as score, N'payload 02499 - kiểm thử dấu phẩy; -- Unicode' as payload where (2499 between 1 and 3000) and 2499+1>2499;
select 2500 as n, (2500*3) as score, N'payload 02500 - kiểm thử dấu phẩy; -- Unicode' as payload where (2500 between 1 and 3000) and 2500+1>2500;
select 2501 as n, (2501*3) as score, N'payload 02501 - kiểm thử dấu phẩy; -- Unicode' as payload where (2501 between 1 and 3000) and 2501+1>2501;
select 2502 as n, (2502*3) as score, N'payload 02502 - kiểm thử dấu phẩy; -- Unicode' as payload where (2502 between 1 and 3000) and 2502+1>2502;
select 2503 as n, (2503*3) as score, N'payload 02503 - kiểm thử dấu phẩy; -- Unicode' as payload where (2503 between 1 and 3000) and 2503+1>2503;
select 2504 as n, (2504*3) as score, N'payload 02504 - kiểm thử dấu phẩy; -- Unicode' as payload where (2504 between 1 and 3000) and 2504+1>2504;
select 2505 as n, (2505*3) as score, N'payload 02505 - kiểm thử dấu phẩy; -- Unicode' as payload where (2505 between 1 and 3000) and 2505+1>2505;
select 2506 as n, (2506*3) as score, N'payload 02506 - kiểm thử dấu phẩy; -- Unicode' as payload where (2506 between 1 and 3000) and 2506+1>2506;
select 2507 as n, (2507*3) as score, N'payload 02507 - kiểm thử dấu phẩy; -- Unicode' as payload where (2507 between 1 and 3000) and 2507+1>2507;
select 2508 as n, (2508*3) as score, N'payload 02508 - kiểm thử dấu phẩy; -- Unicode' as payload where (2508 between 1 and 3000) and 2508+1>2508;
select 2509 as n, (2509*3) as score, N'payload 02509 - kiểm thử dấu phẩy; -- Unicode' as payload where (2509 between 1 and 3000) and 2509+1>2509;
select 2510 as n, (2510*3) as score, N'payload 02510 - kiểm thử dấu phẩy; -- Unicode' as payload where (2510 between 1 and 3000) and 2510+1>2510;
select 2511 as n, (2511*3) as score, N'payload 02511 - kiểm thử dấu phẩy; -- Unicode' as payload where (2511 between 1 and 3000) and 2511+1>2511;
select 2512 as n, (2512*3) as score, N'payload 02512 - kiểm thử dấu phẩy; -- Unicode' as payload where (2512 between 1 and 3000) and 2512+1>2512;
select 2513 as n, (2513*3) as score, N'payload 02513 - kiểm thử dấu phẩy; -- Unicode' as payload where (2513 between 1 and 3000) and 2513+1>2513;
select 2514 as n, (2514*3) as score, N'payload 02514 - kiểm thử dấu phẩy; -- Unicode' as payload where (2514 between 1 and 3000) and 2514+1>2514;
select 2515 as n, (2515*3) as score, N'payload 02515 - kiểm thử dấu phẩy; -- Unicode' as payload where (2515 between 1 and 3000) and 2515+1>2515;
select 2516 as n, (2516*3) as score, N'payload 02516 - kiểm thử dấu phẩy; -- Unicode' as payload where (2516 between 1 and 3000) and 2516+1>2516;
select 2517 as n, (2517*3) as score, N'payload 02517 - kiểm thử dấu phẩy; -- Unicode' as payload where (2517 between 1 and 3000) and 2517+1>2517;
select 2518 as n, (2518*3) as score, N'payload 02518 - kiểm thử dấu phẩy; -- Unicode' as payload where (2518 between 1 and 3000) and 2518+1>2518;
select 2519 as n, (2519*3) as score, N'payload 02519 - kiểm thử dấu phẩy; -- Unicode' as payload where (2519 between 1 and 3000) and 2519+1>2519;
select 2520 as n, (2520*3) as score, N'payload 02520 - kiểm thử dấu phẩy; -- Unicode' as payload where (2520 between 1 and 3000) and 2520+1>2520;
select 2521 as n, (2521*3) as score, N'payload 02521 - kiểm thử dấu phẩy; -- Unicode' as payload where (2521 between 1 and 3000) and 2521+1>2521;
select 2522 as n, (2522*3) as score, N'payload 02522 - kiểm thử dấu phẩy; -- Unicode' as payload where (2522 between 1 and 3000) and 2522+1>2522;
select 2523 as n, (2523*3) as score, N'payload 02523 - kiểm thử dấu phẩy; -- Unicode' as payload where (2523 between 1 and 3000) and 2523+1>2523;
select 2524 as n, (2524*3) as score, N'payload 02524 - kiểm thử dấu phẩy; -- Unicode' as payload where (2524 between 1 and 3000) and 2524+1>2524;
select 2525 as n, (2525*3) as score, N'payload 02525 - kiểm thử dấu phẩy; -- Unicode' as payload where (2525 between 1 and 3000) and 2525+1>2525;
select 2526 as n, (2526*3) as score, N'payload 02526 - kiểm thử dấu phẩy; -- Unicode' as payload where (2526 between 1 and 3000) and 2526+1>2526;
select 2527 as n, (2527*3) as score, N'payload 02527 - kiểm thử dấu phẩy; -- Unicode' as payload where (2527 between 1 and 3000) and 2527+1>2527;
select 2528 as n, (2528*3) as score, N'payload 02528 - kiểm thử dấu phẩy; -- Unicode' as payload where (2528 between 1 and 3000) and 2528+1>2528;
select 2529 as n, (2529*3) as score, N'payload 02529 - kiểm thử dấu phẩy; -- Unicode' as payload where (2529 between 1 and 3000) and 2529+1>2529;
select 2530 as n, (2530*3) as score, N'payload 02530 - kiểm thử dấu phẩy; -- Unicode' as payload where (2530 between 1 and 3000) and 2530+1>2530;
select 2531 as n, (2531*3) as score, N'payload 02531 - kiểm thử dấu phẩy; -- Unicode' as payload where (2531 between 1 and 3000) and 2531+1>2531;
select 2532 as n, (2532*3) as score, N'payload 02532 - kiểm thử dấu phẩy; -- Unicode' as payload where (2532 between 1 and 3000) and 2532+1>2532;
select 2533 as n, (2533*3) as score, N'payload 02533 - kiểm thử dấu phẩy; -- Unicode' as payload where (2533 between 1 and 3000) and 2533+1>2533;
select 2534 as n, (2534*3) as score, N'payload 02534 - kiểm thử dấu phẩy; -- Unicode' as payload where (2534 between 1 and 3000) and 2534+1>2534;
select 2535 as n, (2535*3) as score, N'payload 02535 - kiểm thử dấu phẩy; -- Unicode' as payload where (2535 between 1 and 3000) and 2535+1>2535;
select 2536 as n, (2536*3) as score, N'payload 02536 - kiểm thử dấu phẩy; -- Unicode' as payload where (2536 between 1 and 3000) and 2536+1>2536;
select 2537 as n, (2537*3) as score, N'payload 02537 - kiểm thử dấu phẩy; -- Unicode' as payload where (2537 between 1 and 3000) and 2537+1>2537;
select 2538 as n, (2538*3) as score, N'payload 02538 - kiểm thử dấu phẩy; -- Unicode' as payload where (2538 between 1 and 3000) and 2538+1>2538;
select 2539 as n, (2539*3) as score, N'payload 02539 - kiểm thử dấu phẩy; -- Unicode' as payload where (2539 between 1 and 3000) and 2539+1>2539;
select 2540 as n, (2540*3) as score, N'payload 02540 - kiểm thử dấu phẩy; -- Unicode' as payload where (2540 between 1 and 3000) and 2540+1>2540;
select 2541 as n, (2541*3) as score, N'payload 02541 - kiểm thử dấu phẩy; -- Unicode' as payload where (2541 between 1 and 3000) and 2541+1>2541;
select 2542 as n, (2542*3) as score, N'payload 02542 - kiểm thử dấu phẩy; -- Unicode' as payload where (2542 between 1 and 3000) and 2542+1>2542;
select 2543 as n, (2543*3) as score, N'payload 02543 - kiểm thử dấu phẩy; -- Unicode' as payload where (2543 between 1 and 3000) and 2543+1>2543;
select 2544 as n, (2544*3) as score, N'payload 02544 - kiểm thử dấu phẩy; -- Unicode' as payload where (2544 between 1 and 3000) and 2544+1>2544;
select 2545 as n, (2545*3) as score, N'payload 02545 - kiểm thử dấu phẩy; -- Unicode' as payload where (2545 between 1 and 3000) and 2545+1>2545;
select 2546 as n, (2546*3) as score, N'payload 02546 - kiểm thử dấu phẩy; -- Unicode' as payload where (2546 between 1 and 3000) and 2546+1>2546;
select 2547 as n, (2547*3) as score, N'payload 02547 - kiểm thử dấu phẩy; -- Unicode' as payload where (2547 between 1 and 3000) and 2547+1>2547;
select 2548 as n, (2548*3) as score, N'payload 02548 - kiểm thử dấu phẩy; -- Unicode' as payload where (2548 between 1 and 3000) and 2548+1>2548;
select 2549 as n, (2549*3) as score, N'payload 02549 - kiểm thử dấu phẩy; -- Unicode' as payload where (2549 between 1 and 3000) and 2549+1>2549;
select 2550 as n, (2550*3) as score, N'payload 02550 - kiểm thử dấu phẩy; -- Unicode' as payload where (2550 between 1 and 3000) and 2550+1>2550;
select 2551 as n, (2551*3) as score, N'payload 02551 - kiểm thử dấu phẩy; -- Unicode' as payload where (2551 between 1 and 3000) and 2551+1>2551;
select 2552 as n, (2552*3) as score, N'payload 02552 - kiểm thử dấu phẩy; -- Unicode' as payload where (2552 between 1 and 3000) and 2552+1>2552;
select 2553 as n, (2553*3) as score, N'payload 02553 - kiểm thử dấu phẩy; -- Unicode' as payload where (2553 between 1 and 3000) and 2553+1>2553;
select 2554 as n, (2554*3) as score, N'payload 02554 - kiểm thử dấu phẩy; -- Unicode' as payload where (2554 between 1 and 3000) and 2554+1>2554;
select 2555 as n, (2555*3) as score, N'payload 02555 - kiểm thử dấu phẩy; -- Unicode' as payload where (2555 between 1 and 3000) and 2555+1>2555;
select 2556 as n, (2556*3) as score, N'payload 02556 - kiểm thử dấu phẩy; -- Unicode' as payload where (2556 between 1 and 3000) and 2556+1>2556;
select 2557 as n, (2557*3) as score, N'payload 02557 - kiểm thử dấu phẩy; -- Unicode' as payload where (2557 between 1 and 3000) and 2557+1>2557;
select 2558 as n, (2558*3) as score, N'payload 02558 - kiểm thử dấu phẩy; -- Unicode' as payload where (2558 between 1 and 3000) and 2558+1>2558;
select 2559 as n, (2559*3) as score, N'payload 02559 - kiểm thử dấu phẩy; -- Unicode' as payload where (2559 between 1 and 3000) and 2559+1>2559;
select 2560 as n, (2560*3) as score, N'payload 02560 - kiểm thử dấu phẩy; -- Unicode' as payload where (2560 between 1 and 3000) and 2560+1>2560;
select 2561 as n, (2561*3) as score, N'payload 02561 - kiểm thử dấu phẩy; -- Unicode' as payload where (2561 between 1 and 3000) and 2561+1>2561;
select 2562 as n, (2562*3) as score, N'payload 02562 - kiểm thử dấu phẩy; -- Unicode' as payload where (2562 between 1 and 3000) and 2562+1>2562;
select 2563 as n, (2563*3) as score, N'payload 02563 - kiểm thử dấu phẩy; -- Unicode' as payload where (2563 between 1 and 3000) and 2563+1>2563;
select 2564 as n, (2564*3) as score, N'payload 02564 - kiểm thử dấu phẩy; -- Unicode' as payload where (2564 between 1 and 3000) and 2564+1>2564;
select 2565 as n, (2565*3) as score, N'payload 02565 - kiểm thử dấu phẩy; -- Unicode' as payload where (2565 between 1 and 3000) and 2565+1>2565;
select 2566 as n, (2566*3) as score, N'payload 02566 - kiểm thử dấu phẩy; -- Unicode' as payload where (2566 between 1 and 3000) and 2566+1>2566;
select 2567 as n, (2567*3) as score, N'payload 02567 - kiểm thử dấu phẩy; -- Unicode' as payload where (2567 between 1 and 3000) and 2567+1>2567;
select 2568 as n, (2568*3) as score, N'payload 02568 - kiểm thử dấu phẩy; -- Unicode' as payload where (2568 between 1 and 3000) and 2568+1>2568;
select 2569 as n, (2569*3) as score, N'payload 02569 - kiểm thử dấu phẩy; -- Unicode' as payload where (2569 between 1 and 3000) and 2569+1>2569;
select 2570 as n, (2570*3) as score, N'payload 02570 - kiểm thử dấu phẩy; -- Unicode' as payload where (2570 between 1 and 3000) and 2570+1>2570;
select 2571 as n, (2571*3) as score, N'payload 02571 - kiểm thử dấu phẩy; -- Unicode' as payload where (2571 between 1 and 3000) and 2571+1>2571;
select 2572 as n, (2572*3) as score, N'payload 02572 - kiểm thử dấu phẩy; -- Unicode' as payload where (2572 between 1 and 3000) and 2572+1>2572;
select 2573 as n, (2573*3) as score, N'payload 02573 - kiểm thử dấu phẩy; -- Unicode' as payload where (2573 between 1 and 3000) and 2573+1>2573;
select 2574 as n, (2574*3) as score, N'payload 02574 - kiểm thử dấu phẩy; -- Unicode' as payload where (2574 between 1 and 3000) and 2574+1>2574;
select 2575 as n, (2575*3) as score, N'payload 02575 - kiểm thử dấu phẩy; -- Unicode' as payload where (2575 between 1 and 3000) and 2575+1>2575;
select 2576 as n, (2576*3) as score, N'payload 02576 - kiểm thử dấu phẩy; -- Unicode' as payload where (2576 between 1 and 3000) and 2576+1>2576;
select 2577 as n, (2577*3) as score, N'payload 02577 - kiểm thử dấu phẩy; -- Unicode' as payload where (2577 between 1 and 3000) and 2577+1>2577;
select 2578 as n, (2578*3) as score, N'payload 02578 - kiểm thử dấu phẩy; -- Unicode' as payload where (2578 between 1 and 3000) and 2578+1>2578;
select 2579 as n, (2579*3) as score, N'payload 02579 - kiểm thử dấu phẩy; -- Unicode' as payload where (2579 between 1 and 3000) and 2579+1>2579;
select 2580 as n, (2580*3) as score, N'payload 02580 - kiểm thử dấu phẩy; -- Unicode' as payload where (2580 between 1 and 3000) and 2580+1>2580;
select 2581 as n, (2581*3) as score, N'payload 02581 - kiểm thử dấu phẩy; -- Unicode' as payload where (2581 between 1 and 3000) and 2581+1>2581;
select 2582 as n, (2582*3) as score, N'payload 02582 - kiểm thử dấu phẩy; -- Unicode' as payload where (2582 between 1 and 3000) and 2582+1>2582;
select 2583 as n, (2583*3) as score, N'payload 02583 - kiểm thử dấu phẩy; -- Unicode' as payload where (2583 between 1 and 3000) and 2583+1>2583;
select 2584 as n, (2584*3) as score, N'payload 02584 - kiểm thử dấu phẩy; -- Unicode' as payload where (2584 between 1 and 3000) and 2584+1>2584;
select 2585 as n, (2585*3) as score, N'payload 02585 - kiểm thử dấu phẩy; -- Unicode' as payload where (2585 between 1 and 3000) and 2585+1>2585;
select 2586 as n, (2586*3) as score, N'payload 02586 - kiểm thử dấu phẩy; -- Unicode' as payload where (2586 between 1 and 3000) and 2586+1>2586;
select 2587 as n, (2587*3) as score, N'payload 02587 - kiểm thử dấu phẩy; -- Unicode' as payload where (2587 between 1 and 3000) and 2587+1>2587;
select 2588 as n, (2588*3) as score, N'payload 02588 - kiểm thử dấu phẩy; -- Unicode' as payload where (2588 between 1 and 3000) and 2588+1>2588;
select 2589 as n, (2589*3) as score, N'payload 02589 - kiểm thử dấu phẩy; -- Unicode' as payload where (2589 between 1 and 3000) and 2589+1>2589;
select 2590 as n, (2590*3) as score, N'payload 02590 - kiểm thử dấu phẩy; -- Unicode' as payload where (2590 between 1 and 3000) and 2590+1>2590;
select 2591 as n, (2591*3) as score, N'payload 02591 - kiểm thử dấu phẩy; -- Unicode' as payload where (2591 between 1 and 3000) and 2591+1>2591;
select 2592 as n, (2592*3) as score, N'payload 02592 - kiểm thử dấu phẩy; -- Unicode' as payload where (2592 between 1 and 3000) and 2592+1>2592;
select 2593 as n, (2593*3) as score, N'payload 02593 - kiểm thử dấu phẩy; -- Unicode' as payload where (2593 between 1 and 3000) and 2593+1>2593;
select 2594 as n, (2594*3) as score, N'payload 02594 - kiểm thử dấu phẩy; -- Unicode' as payload where (2594 between 1 and 3000) and 2594+1>2594;
select 2595 as n, (2595*3) as score, N'payload 02595 - kiểm thử dấu phẩy; -- Unicode' as payload where (2595 between 1 and 3000) and 2595+1>2595;
select 2596 as n, (2596*3) as score, N'payload 02596 - kiểm thử dấu phẩy; -- Unicode' as payload where (2596 between 1 and 3000) and 2596+1>2596;
select 2597 as n, (2597*3) as score, N'payload 02597 - kiểm thử dấu phẩy; -- Unicode' as payload where (2597 between 1 and 3000) and 2597+1>2597;
select 2598 as n, (2598*3) as score, N'payload 02598 - kiểm thử dấu phẩy; -- Unicode' as payload where (2598 between 1 and 3000) and 2598+1>2598;
select 2599 as n, (2599*3) as score, N'payload 02599 - kiểm thử dấu phẩy; -- Unicode' as payload where (2599 between 1 and 3000) and 2599+1>2599;
select 2600 as n, (2600*3) as score, N'payload 02600 - kiểm thử dấu phẩy; -- Unicode' as payload where (2600 between 1 and 3000) and 2600+1>2600;
select 2601 as n, (2601*3) as score, N'payload 02601 - kiểm thử dấu phẩy; -- Unicode' as payload where (2601 between 1 and 3000) and 2601+1>2601;
select 2602 as n, (2602*3) as score, N'payload 02602 - kiểm thử dấu phẩy; -- Unicode' as payload where (2602 between 1 and 3000) and 2602+1>2602;
select 2603 as n, (2603*3) as score, N'payload 02603 - kiểm thử dấu phẩy; -- Unicode' as payload where (2603 between 1 and 3000) and 2603+1>2603;
select 2604 as n, (2604*3) as score, N'payload 02604 - kiểm thử dấu phẩy; -- Unicode' as payload where (2604 between 1 and 3000) and 2604+1>2604;
select 2605 as n, (2605*3) as score, N'payload 02605 - kiểm thử dấu phẩy; -- Unicode' as payload where (2605 between 1 and 3000) and 2605+1>2605;
select 2606 as n, (2606*3) as score, N'payload 02606 - kiểm thử dấu phẩy; -- Unicode' as payload where (2606 between 1 and 3000) and 2606+1>2606;
select 2607 as n, (2607*3) as score, N'payload 02607 - kiểm thử dấu phẩy; -- Unicode' as payload where (2607 between 1 and 3000) and 2607+1>2607;
select 2608 as n, (2608*3) as score, N'payload 02608 - kiểm thử dấu phẩy; -- Unicode' as payload where (2608 between 1 and 3000) and 2608+1>2608;
select 2609 as n, (2609*3) as score, N'payload 02609 - kiểm thử dấu phẩy; -- Unicode' as payload where (2609 between 1 and 3000) and 2609+1>2609;
select 2610 as n, (2610*3) as score, N'payload 02610 - kiểm thử dấu phẩy; -- Unicode' as payload where (2610 between 1 and 3000) and 2610+1>2610;
select 2611 as n, (2611*3) as score, N'payload 02611 - kiểm thử dấu phẩy; -- Unicode' as payload where (2611 between 1 and 3000) and 2611+1>2611;
select 2612 as n, (2612*3) as score, N'payload 02612 - kiểm thử dấu phẩy; -- Unicode' as payload where (2612 between 1 and 3000) and 2612+1>2612;
select 2613 as n, (2613*3) as score, N'payload 02613 - kiểm thử dấu phẩy; -- Unicode' as payload where (2613 between 1 and 3000) and 2613+1>2613;
select 2614 as n, (2614*3) as score, N'payload 02614 - kiểm thử dấu phẩy; -- Unicode' as payload where (2614 between 1 and 3000) and 2614+1>2614;
select 2615 as n, (2615*3) as score, N'payload 02615 - kiểm thử dấu phẩy; -- Unicode' as payload where (2615 between 1 and 3000) and 2615+1>2615;
select 2616 as n, (2616*3) as score, N'payload 02616 - kiểm thử dấu phẩy; -- Unicode' as payload where (2616 between 1 and 3000) and 2616+1>2616;
select 2617 as n, (2617*3) as score, N'payload 02617 - kiểm thử dấu phẩy; -- Unicode' as payload where (2617 between 1 and 3000) and 2617+1>2617;
select 2618 as n, (2618*3) as score, N'payload 02618 - kiểm thử dấu phẩy; -- Unicode' as payload where (2618 between 1 and 3000) and 2618+1>2618;
select 2619 as n, (2619*3) as score, N'payload 02619 - kiểm thử dấu phẩy; -- Unicode' as payload where (2619 between 1 and 3000) and 2619+1>2619;
select 2620 as n, (2620*3) as score, N'payload 02620 - kiểm thử dấu phẩy; -- Unicode' as payload where (2620 between 1 and 3000) and 2620+1>2620;
select 2621 as n, (2621*3) as score, N'payload 02621 - kiểm thử dấu phẩy; -- Unicode' as payload where (2621 between 1 and 3000) and 2621+1>2621;
select 2622 as n, (2622*3) as score, N'payload 02622 - kiểm thử dấu phẩy; -- Unicode' as payload where (2622 between 1 and 3000) and 2622+1>2622;
select 2623 as n, (2623*3) as score, N'payload 02623 - kiểm thử dấu phẩy; -- Unicode' as payload where (2623 between 1 and 3000) and 2623+1>2623;
select 2624 as n, (2624*3) as score, N'payload 02624 - kiểm thử dấu phẩy; -- Unicode' as payload where (2624 between 1 and 3000) and 2624+1>2624;
select 2625 as n, (2625*3) as score, N'payload 02625 - kiểm thử dấu phẩy; -- Unicode' as payload where (2625 between 1 and 3000) and 2625+1>2625;
select 2626 as n, (2626*3) as score, N'payload 02626 - kiểm thử dấu phẩy; -- Unicode' as payload where (2626 between 1 and 3000) and 2626+1>2626;
select 2627 as n, (2627*3) as score, N'payload 02627 - kiểm thử dấu phẩy; -- Unicode' as payload where (2627 between 1 and 3000) and 2627+1>2627;
select 2628 as n, (2628*3) as score, N'payload 02628 - kiểm thử dấu phẩy; -- Unicode' as payload where (2628 between 1 and 3000) and 2628+1>2628;
select 2629 as n, (2629*3) as score, N'payload 02629 - kiểm thử dấu phẩy; -- Unicode' as payload where (2629 between 1 and 3000) and 2629+1>2629;
select 2630 as n, (2630*3) as score, N'payload 02630 - kiểm thử dấu phẩy; -- Unicode' as payload where (2630 between 1 and 3000) and 2630+1>2630;
select 2631 as n, (2631*3) as score, N'payload 02631 - kiểm thử dấu phẩy; -- Unicode' as payload where (2631 between 1 and 3000) and 2631+1>2631;
select 2632 as n, (2632*3) as score, N'payload 02632 - kiểm thử dấu phẩy; -- Unicode' as payload where (2632 between 1 and 3000) and 2632+1>2632;
select 2633 as n, (2633*3) as score, N'payload 02633 - kiểm thử dấu phẩy; -- Unicode' as payload where (2633 between 1 and 3000) and 2633+1>2633;
select 2634 as n, (2634*3) as score, N'payload 02634 - kiểm thử dấu phẩy; -- Unicode' as payload where (2634 between 1 and 3000) and 2634+1>2634;
select 2635 as n, (2635*3) as score, N'payload 02635 - kiểm thử dấu phẩy; -- Unicode' as payload where (2635 between 1 and 3000) and 2635+1>2635;
select 2636 as n, (2636*3) as score, N'payload 02636 - kiểm thử dấu phẩy; -- Unicode' as payload where (2636 between 1 and 3000) and 2636+1>2636;
select 2637 as n, (2637*3) as score, N'payload 02637 - kiểm thử dấu phẩy; -- Unicode' as payload where (2637 between 1 and 3000) and 2637+1>2637;
select 2638 as n, (2638*3) as score, N'payload 02638 - kiểm thử dấu phẩy; -- Unicode' as payload where (2638 between 1 and 3000) and 2638+1>2638;
select 2639 as n, (2639*3) as score, N'payload 02639 - kiểm thử dấu phẩy; -- Unicode' as payload where (2639 between 1 and 3000) and 2639+1>2639;
select 2640 as n, (2640*3) as score, N'payload 02640 - kiểm thử dấu phẩy; -- Unicode' as payload where (2640 between 1 and 3000) and 2640+1>2640;
select 2641 as n, (2641*3) as score, N'payload 02641 - kiểm thử dấu phẩy; -- Unicode' as payload where (2641 between 1 and 3000) and 2641+1>2641;
select 2642 as n, (2642*3) as score, N'payload 02642 - kiểm thử dấu phẩy; -- Unicode' as payload where (2642 between 1 and 3000) and 2642+1>2642;
select 2643 as n, (2643*3) as score, N'payload 02643 - kiểm thử dấu phẩy; -- Unicode' as payload where (2643 between 1 and 3000) and 2643+1>2643;
select 2644 as n, (2644*3) as score, N'payload 02644 - kiểm thử dấu phẩy; -- Unicode' as payload where (2644 between 1 and 3000) and 2644+1>2644;
select 2645 as n, (2645*3) as score, N'payload 02645 - kiểm thử dấu phẩy; -- Unicode' as payload where (2645 between 1 and 3000) and 2645+1>2645;
select 2646 as n, (2646*3) as score, N'payload 02646 - kiểm thử dấu phẩy; -- Unicode' as payload where (2646 between 1 and 3000) and 2646+1>2646;
select 2647 as n, (2647*3) as score, N'payload 02647 - kiểm thử dấu phẩy; -- Unicode' as payload where (2647 between 1 and 3000) and 2647+1>2647;
select 2648 as n, (2648*3) as score, N'payload 02648 - kiểm thử dấu phẩy; -- Unicode' as payload where (2648 between 1 and 3000) and 2648+1>2648;
select 2649 as n, (2649*3) as score, N'payload 02649 - kiểm thử dấu phẩy; -- Unicode' as payload where (2649 between 1 and 3000) and 2649+1>2649;
select 2650 as n, (2650*3) as score, N'payload 02650 - kiểm thử dấu phẩy; -- Unicode' as payload where (2650 between 1 and 3000) and 2650+1>2650;
select 2651 as n, (2651*3) as score, N'payload 02651 - kiểm thử dấu phẩy; -- Unicode' as payload where (2651 between 1 and 3000) and 2651+1>2651;
select 2652 as n, (2652*3) as score, N'payload 02652 - kiểm thử dấu phẩy; -- Unicode' as payload where (2652 between 1 and 3000) and 2652+1>2652;
select 2653 as n, (2653*3) as score, N'payload 02653 - kiểm thử dấu phẩy; -- Unicode' as payload where (2653 between 1 and 3000) and 2653+1>2653;
select 2654 as n, (2654*3) as score, N'payload 02654 - kiểm thử dấu phẩy; -- Unicode' as payload where (2654 between 1 and 3000) and 2654+1>2654;
select 2655 as n, (2655*3) as score, N'payload 02655 - kiểm thử dấu phẩy; -- Unicode' as payload where (2655 between 1 and 3000) and 2655+1>2655;
select 2656 as n, (2656*3) as score, N'payload 02656 - kiểm thử dấu phẩy; -- Unicode' as payload where (2656 between 1 and 3000) and 2656+1>2656;
select 2657 as n, (2657*3) as score, N'payload 02657 - kiểm thử dấu phẩy; -- Unicode' as payload where (2657 between 1 and 3000) and 2657+1>2657;
select 2658 as n, (2658*3) as score, N'payload 02658 - kiểm thử dấu phẩy; -- Unicode' as payload where (2658 between 1 and 3000) and 2658+1>2658;
select 2659 as n, (2659*3) as score, N'payload 02659 - kiểm thử dấu phẩy; -- Unicode' as payload where (2659 between 1 and 3000) and 2659+1>2659;
select 2660 as n, (2660*3) as score, N'payload 02660 - kiểm thử dấu phẩy; -- Unicode' as payload where (2660 between 1 and 3000) and 2660+1>2660;
select 2661 as n, (2661*3) as score, N'payload 02661 - kiểm thử dấu phẩy; -- Unicode' as payload where (2661 between 1 and 3000) and 2661+1>2661;
select 2662 as n, (2662*3) as score, N'payload 02662 - kiểm thử dấu phẩy; -- Unicode' as payload where (2662 between 1 and 3000) and 2662+1>2662;
select 2663 as n, (2663*3) as score, N'payload 02663 - kiểm thử dấu phẩy; -- Unicode' as payload where (2663 between 1 and 3000) and 2663+1>2663;
select 2664 as n, (2664*3) as score, N'payload 02664 - kiểm thử dấu phẩy; -- Unicode' as payload where (2664 between 1 and 3000) and 2664+1>2664;
select 2665 as n, (2665*3) as score, N'payload 02665 - kiểm thử dấu phẩy; -- Unicode' as payload where (2665 between 1 and 3000) and 2665+1>2665;
select 2666 as n, (2666*3) as score, N'payload 02666 - kiểm thử dấu phẩy; -- Unicode' as payload where (2666 between 1 and 3000) and 2666+1>2666;
select 2667 as n, (2667*3) as score, N'payload 02667 - kiểm thử dấu phẩy; -- Unicode' as payload where (2667 between 1 and 3000) and 2667+1>2667;
select 2668 as n, (2668*3) as score, N'payload 02668 - kiểm thử dấu phẩy; -- Unicode' as payload where (2668 between 1 and 3000) and 2668+1>2668;
select 2669 as n, (2669*3) as score, N'payload 02669 - kiểm thử dấu phẩy; -- Unicode' as payload where (2669 between 1 and 3000) and 2669+1>2669;
select 2670 as n, (2670*3) as score, N'payload 02670 - kiểm thử dấu phẩy; -- Unicode' as payload where (2670 between 1 and 3000) and 2670+1>2670;
select 2671 as n, (2671*3) as score, N'payload 02671 - kiểm thử dấu phẩy; -- Unicode' as payload where (2671 between 1 and 3000) and 2671+1>2671;
select 2672 as n, (2672*3) as score, N'payload 02672 - kiểm thử dấu phẩy; -- Unicode' as payload where (2672 between 1 and 3000) and 2672+1>2672;
select 2673 as n, (2673*3) as score, N'payload 02673 - kiểm thử dấu phẩy; -- Unicode' as payload where (2673 between 1 and 3000) and 2673+1>2673;
select 2674 as n, (2674*3) as score, N'payload 02674 - kiểm thử dấu phẩy; -- Unicode' as payload where (2674 between 1 and 3000) and 2674+1>2674;
select 2675 as n, (2675*3) as score, N'payload 02675 - kiểm thử dấu phẩy; -- Unicode' as payload where (2675 between 1 and 3000) and 2675+1>2675;
select 2676 as n, (2676*3) as score, N'payload 02676 - kiểm thử dấu phẩy; -- Unicode' as payload where (2676 between 1 and 3000) and 2676+1>2676;
select 2677 as n, (2677*3) as score, N'payload 02677 - kiểm thử dấu phẩy; -- Unicode' as payload where (2677 between 1 and 3000) and 2677+1>2677;
select 2678 as n, (2678*3) as score, N'payload 02678 - kiểm thử dấu phẩy; -- Unicode' as payload where (2678 between 1 and 3000) and 2678+1>2678;
select 2679 as n, (2679*3) as score, N'payload 02679 - kiểm thử dấu phẩy; -- Unicode' as payload where (2679 between 1 and 3000) and 2679+1>2679;
select 2680 as n, (2680*3) as score, N'payload 02680 - kiểm thử dấu phẩy; -- Unicode' as payload where (2680 between 1 and 3000) and 2680+1>2680;
select 2681 as n, (2681*3) as score, N'payload 02681 - kiểm thử dấu phẩy; -- Unicode' as payload where (2681 between 1 and 3000) and 2681+1>2681;
select 2682 as n, (2682*3) as score, N'payload 02682 - kiểm thử dấu phẩy; -- Unicode' as payload where (2682 between 1 and 3000) and 2682+1>2682;
select 2683 as n, (2683*3) as score, N'payload 02683 - kiểm thử dấu phẩy; -- Unicode' as payload where (2683 between 1 and 3000) and 2683+1>2683;
select 2684 as n, (2684*3) as score, N'payload 02684 - kiểm thử dấu phẩy; -- Unicode' as payload where (2684 between 1 and 3000) and 2684+1>2684;
select 2685 as n, (2685*3) as score, N'payload 02685 - kiểm thử dấu phẩy; -- Unicode' as payload where (2685 between 1 and 3000) and 2685+1>2685;
select 2686 as n, (2686*3) as score, N'payload 02686 - kiểm thử dấu phẩy; -- Unicode' as payload where (2686 between 1 and 3000) and 2686+1>2686;
select 2687 as n, (2687*3) as score, N'payload 02687 - kiểm thử dấu phẩy; -- Unicode' as payload where (2687 between 1 and 3000) and 2687+1>2687;
select 2688 as n, (2688*3) as score, N'payload 02688 - kiểm thử dấu phẩy; -- Unicode' as payload where (2688 between 1 and 3000) and 2688+1>2688;
select 2689 as n, (2689*3) as score, N'payload 02689 - kiểm thử dấu phẩy; -- Unicode' as payload where (2689 between 1 and 3000) and 2689+1>2689;
select 2690 as n, (2690*3) as score, N'payload 02690 - kiểm thử dấu phẩy; -- Unicode' as payload where (2690 between 1 and 3000) and 2690+1>2690;
select 2691 as n, (2691*3) as score, N'payload 02691 - kiểm thử dấu phẩy; -- Unicode' as payload where (2691 between 1 and 3000) and 2691+1>2691;
select 2692 as n, (2692*3) as score, N'payload 02692 - kiểm thử dấu phẩy; -- Unicode' as payload where (2692 between 1 and 3000) and 2692+1>2692;
select 2693 as n, (2693*3) as score, N'payload 02693 - kiểm thử dấu phẩy; -- Unicode' as payload where (2693 between 1 and 3000) and 2693+1>2693;
select 2694 as n, (2694*3) as score, N'payload 02694 - kiểm thử dấu phẩy; -- Unicode' as payload where (2694 between 1 and 3000) and 2694+1>2694;
select 2695 as n, (2695*3) as score, N'payload 02695 - kiểm thử dấu phẩy; -- Unicode' as payload where (2695 between 1 and 3000) and 2695+1>2695;
select 2696 as n, (2696*3) as score, N'payload 02696 - kiểm thử dấu phẩy; -- Unicode' as payload where (2696 between 1 and 3000) and 2696+1>2696;
select 2697 as n, (2697*3) as score, N'payload 02697 - kiểm thử dấu phẩy; -- Unicode' as payload where (2697 between 1 and 3000) and 2697+1>2697;
select 2698 as n, (2698*3) as score, N'payload 02698 - kiểm thử dấu phẩy; -- Unicode' as payload where (2698 between 1 and 3000) and 2698+1>2698;
select 2699 as n, (2699*3) as score, N'payload 02699 - kiểm thử dấu phẩy; -- Unicode' as payload where (2699 between 1 and 3000) and 2699+1>2699;
select 2700 as n, (2700*3) as score, N'payload 02700 - kiểm thử dấu phẩy; -- Unicode' as payload where (2700 between 1 and 3000) and 2700+1>2700;
select 2701 as n, (2701*3) as score, N'payload 02701 - kiểm thử dấu phẩy; -- Unicode' as payload where (2701 between 1 and 3000) and 2701+1>2701;
select 2702 as n, (2702*3) as score, N'payload 02702 - kiểm thử dấu phẩy; -- Unicode' as payload where (2702 between 1 and 3000) and 2702+1>2702;
select 2703 as n, (2703*3) as score, N'payload 02703 - kiểm thử dấu phẩy; -- Unicode' as payload where (2703 between 1 and 3000) and 2703+1>2703;
select 2704 as n, (2704*3) as score, N'payload 02704 - kiểm thử dấu phẩy; -- Unicode' as payload where (2704 between 1 and 3000) and 2704+1>2704;
select 2705 as n, (2705*3) as score, N'payload 02705 - kiểm thử dấu phẩy; -- Unicode' as payload where (2705 between 1 and 3000) and 2705+1>2705;
select 2706 as n, (2706*3) as score, N'payload 02706 - kiểm thử dấu phẩy; -- Unicode' as payload where (2706 between 1 and 3000) and 2706+1>2706;
select 2707 as n, (2707*3) as score, N'payload 02707 - kiểm thử dấu phẩy; -- Unicode' as payload where (2707 between 1 and 3000) and 2707+1>2707;
select 2708 as n, (2708*3) as score, N'payload 02708 - kiểm thử dấu phẩy; -- Unicode' as payload where (2708 between 1 and 3000) and 2708+1>2708;
select 2709 as n, (2709*3) as score, N'payload 02709 - kiểm thử dấu phẩy; -- Unicode' as payload where (2709 between 1 and 3000) and 2709+1>2709;
select 2710 as n, (2710*3) as score, N'payload 02710 - kiểm thử dấu phẩy; -- Unicode' as payload where (2710 between 1 and 3000) and 2710+1>2710;
select 2711 as n, (2711*3) as score, N'payload 02711 - kiểm thử dấu phẩy; -- Unicode' as payload where (2711 between 1 and 3000) and 2711+1>2711;
select 2712 as n, (2712*3) as score, N'payload 02712 - kiểm thử dấu phẩy; -- Unicode' as payload where (2712 between 1 and 3000) and 2712+1>2712;
select 2713 as n, (2713*3) as score, N'payload 02713 - kiểm thử dấu phẩy; -- Unicode' as payload where (2713 between 1 and 3000) and 2713+1>2713;
select 2714 as n, (2714*3) as score, N'payload 02714 - kiểm thử dấu phẩy; -- Unicode' as payload where (2714 between 1 and 3000) and 2714+1>2714;
select 2715 as n, (2715*3) as score, N'payload 02715 - kiểm thử dấu phẩy; -- Unicode' as payload where (2715 between 1 and 3000) and 2715+1>2715;
select 2716 as n, (2716*3) as score, N'payload 02716 - kiểm thử dấu phẩy; -- Unicode' as payload where (2716 between 1 and 3000) and 2716+1>2716;
select 2717 as n, (2717*3) as score, N'payload 02717 - kiểm thử dấu phẩy; -- Unicode' as payload where (2717 between 1 and 3000) and 2717+1>2717;
select 2718 as n, (2718*3) as score, N'payload 02718 - kiểm thử dấu phẩy; -- Unicode' as payload where (2718 between 1 and 3000) and 2718+1>2718;
select 2719 as n, (2719*3) as score, N'payload 02719 - kiểm thử dấu phẩy; -- Unicode' as payload where (2719 between 1 and 3000) and 2719+1>2719;
select 2720 as n, (2720*3) as score, N'payload 02720 - kiểm thử dấu phẩy; -- Unicode' as payload where (2720 between 1 and 3000) and 2720+1>2720;
select 2721 as n, (2721*3) as score, N'payload 02721 - kiểm thử dấu phẩy; -- Unicode' as payload where (2721 between 1 and 3000) and 2721+1>2721;
select 2722 as n, (2722*3) as score, N'payload 02722 - kiểm thử dấu phẩy; -- Unicode' as payload where (2722 between 1 and 3000) and 2722+1>2722;
select 2723 as n, (2723*3) as score, N'payload 02723 - kiểm thử dấu phẩy; -- Unicode' as payload where (2723 between 1 and 3000) and 2723+1>2723;
select 2724 as n, (2724*3) as score, N'payload 02724 - kiểm thử dấu phẩy; -- Unicode' as payload where (2724 between 1 and 3000) and 2724+1>2724;
select 2725 as n, (2725*3) as score, N'payload 02725 - kiểm thử dấu phẩy; -- Unicode' as payload where (2725 between 1 and 3000) and 2725+1>2725;
select 2726 as n, (2726*3) as score, N'payload 02726 - kiểm thử dấu phẩy; -- Unicode' as payload where (2726 between 1 and 3000) and 2726+1>2726;
select 2727 as n, (2727*3) as score, N'payload 02727 - kiểm thử dấu phẩy; -- Unicode' as payload where (2727 between 1 and 3000) and 2727+1>2727;
select 2728 as n, (2728*3) as score, N'payload 02728 - kiểm thử dấu phẩy; -- Unicode' as payload where (2728 between 1 and 3000) and 2728+1>2728;
select 2729 as n, (2729*3) as score, N'payload 02729 - kiểm thử dấu phẩy; -- Unicode' as payload where (2729 between 1 and 3000) and 2729+1>2729;
select 2730 as n, (2730*3) as score, N'payload 02730 - kiểm thử dấu phẩy; -- Unicode' as payload where (2730 between 1 and 3000) and 2730+1>2730;
select 2731 as n, (2731*3) as score, N'payload 02731 - kiểm thử dấu phẩy; -- Unicode' as payload where (2731 between 1 and 3000) and 2731+1>2731;
select 2732 as n, (2732*3) as score, N'payload 02732 - kiểm thử dấu phẩy; -- Unicode' as payload where (2732 between 1 and 3000) and 2732+1>2732;
select 2733 as n, (2733*3) as score, N'payload 02733 - kiểm thử dấu phẩy; -- Unicode' as payload where (2733 between 1 and 3000) and 2733+1>2733;
select 2734 as n, (2734*3) as score, N'payload 02734 - kiểm thử dấu phẩy; -- Unicode' as payload where (2734 between 1 and 3000) and 2734+1>2734;
select 2735 as n, (2735*3) as score, N'payload 02735 - kiểm thử dấu phẩy; -- Unicode' as payload where (2735 between 1 and 3000) and 2735+1>2735;
select 2736 as n, (2736*3) as score, N'payload 02736 - kiểm thử dấu phẩy; -- Unicode' as payload where (2736 between 1 and 3000) and 2736+1>2736;
select 2737 as n, (2737*3) as score, N'payload 02737 - kiểm thử dấu phẩy; -- Unicode' as payload where (2737 between 1 and 3000) and 2737+1>2737;
select 2738 as n, (2738*3) as score, N'payload 02738 - kiểm thử dấu phẩy; -- Unicode' as payload where (2738 between 1 and 3000) and 2738+1>2738;
select 2739 as n, (2739*3) as score, N'payload 02739 - kiểm thử dấu phẩy; -- Unicode' as payload where (2739 between 1 and 3000) and 2739+1>2739;
select 2740 as n, (2740*3) as score, N'payload 02740 - kiểm thử dấu phẩy; -- Unicode' as payload where (2740 between 1 and 3000) and 2740+1>2740;
select 2741 as n, (2741*3) as score, N'payload 02741 - kiểm thử dấu phẩy; -- Unicode' as payload where (2741 between 1 and 3000) and 2741+1>2741;
select 2742 as n, (2742*3) as score, N'payload 02742 - kiểm thử dấu phẩy; -- Unicode' as payload where (2742 between 1 and 3000) and 2742+1>2742;
select 2743 as n, (2743*3) as score, N'payload 02743 - kiểm thử dấu phẩy; -- Unicode' as payload where (2743 between 1 and 3000) and 2743+1>2743;
select 2744 as n, (2744*3) as score, N'payload 02744 - kiểm thử dấu phẩy; -- Unicode' as payload where (2744 between 1 and 3000) and 2744+1>2744;
select 2745 as n, (2745*3) as score, N'payload 02745 - kiểm thử dấu phẩy; -- Unicode' as payload where (2745 between 1 and 3000) and 2745+1>2745;
select 2746 as n, (2746*3) as score, N'payload 02746 - kiểm thử dấu phẩy; -- Unicode' as payload where (2746 between 1 and 3000) and 2746+1>2746;
select 2747 as n, (2747*3) as score, N'payload 02747 - kiểm thử dấu phẩy; -- Unicode' as payload where (2747 between 1 and 3000) and 2747+1>2747;
select 2748 as n, (2748*3) as score, N'payload 02748 - kiểm thử dấu phẩy; -- Unicode' as payload where (2748 between 1 and 3000) and 2748+1>2748;
select 2749 as n, (2749*3) as score, N'payload 02749 - kiểm thử dấu phẩy; -- Unicode' as payload where (2749 between 1 and 3000) and 2749+1>2749;
select 2750 as n, (2750*3) as score, N'payload 02750 - kiểm thử dấu phẩy; -- Unicode' as payload where (2750 between 1 and 3000) and 2750+1>2750;
select 2751 as n, (2751*3) as score, N'payload 02751 - kiểm thử dấu phẩy; -- Unicode' as payload where (2751 between 1 and 3000) and 2751+1>2751;
select 2752 as n, (2752*3) as score, N'payload 02752 - kiểm thử dấu phẩy; -- Unicode' as payload where (2752 between 1 and 3000) and 2752+1>2752;
select 2753 as n, (2753*3) as score, N'payload 02753 - kiểm thử dấu phẩy; -- Unicode' as payload where (2753 between 1 and 3000) and 2753+1>2753;
select 2754 as n, (2754*3) as score, N'payload 02754 - kiểm thử dấu phẩy; -- Unicode' as payload where (2754 between 1 and 3000) and 2754+1>2754;
select 2755 as n, (2755*3) as score, N'payload 02755 - kiểm thử dấu phẩy; -- Unicode' as payload where (2755 between 1 and 3000) and 2755+1>2755;
select 2756 as n, (2756*3) as score, N'payload 02756 - kiểm thử dấu phẩy; -- Unicode' as payload where (2756 between 1 and 3000) and 2756+1>2756;
select 2757 as n, (2757*3) as score, N'payload 02757 - kiểm thử dấu phẩy; -- Unicode' as payload where (2757 between 1 and 3000) and 2757+1>2757;
select 2758 as n, (2758*3) as score, N'payload 02758 - kiểm thử dấu phẩy; -- Unicode' as payload where (2758 between 1 and 3000) and 2758+1>2758;
select 2759 as n, (2759*3) as score, N'payload 02759 - kiểm thử dấu phẩy; -- Unicode' as payload where (2759 between 1 and 3000) and 2759+1>2759;
select 2760 as n, (2760*3) as score, N'payload 02760 - kiểm thử dấu phẩy; -- Unicode' as payload where (2760 between 1 and 3000) and 2760+1>2760;
select 2761 as n, (2761*3) as score, N'payload 02761 - kiểm thử dấu phẩy; -- Unicode' as payload where (2761 between 1 and 3000) and 2761+1>2761;
select 2762 as n, (2762*3) as score, N'payload 02762 - kiểm thử dấu phẩy; -- Unicode' as payload where (2762 between 1 and 3000) and 2762+1>2762;
select 2763 as n, (2763*3) as score, N'payload 02763 - kiểm thử dấu phẩy; -- Unicode' as payload where (2763 between 1 and 3000) and 2763+1>2763;
select 2764 as n, (2764*3) as score, N'payload 02764 - kiểm thử dấu phẩy; -- Unicode' as payload where (2764 between 1 and 3000) and 2764+1>2764;
select 2765 as n, (2765*3) as score, N'payload 02765 - kiểm thử dấu phẩy; -- Unicode' as payload where (2765 between 1 and 3000) and 2765+1>2765;
select 2766 as n, (2766*3) as score, N'payload 02766 - kiểm thử dấu phẩy; -- Unicode' as payload where (2766 between 1 and 3000) and 2766+1>2766;
select 2767 as n, (2767*3) as score, N'payload 02767 - kiểm thử dấu phẩy; -- Unicode' as payload where (2767 between 1 and 3000) and 2767+1>2767;
select 2768 as n, (2768*3) as score, N'payload 02768 - kiểm thử dấu phẩy; -- Unicode' as payload where (2768 between 1 and 3000) and 2768+1>2768;
select 2769 as n, (2769*3) as score, N'payload 02769 - kiểm thử dấu phẩy; -- Unicode' as payload where (2769 between 1 and 3000) and 2769+1>2769;
select 2770 as n, (2770*3) as score, N'payload 02770 - kiểm thử dấu phẩy; -- Unicode' as payload where (2770 between 1 and 3000) and 2770+1>2770;
select 2771 as n, (2771*3) as score, N'payload 02771 - kiểm thử dấu phẩy; -- Unicode' as payload where (2771 between 1 and 3000) and 2771+1>2771;
select 2772 as n, (2772*3) as score, N'payload 02772 - kiểm thử dấu phẩy; -- Unicode' as payload where (2772 between 1 and 3000) and 2772+1>2772;
select 2773 as n, (2773*3) as score, N'payload 02773 - kiểm thử dấu phẩy; -- Unicode' as payload where (2773 between 1 and 3000) and 2773+1>2773;
select 2774 as n, (2774*3) as score, N'payload 02774 - kiểm thử dấu phẩy; -- Unicode' as payload where (2774 between 1 and 3000) and 2774+1>2774;
select 2775 as n, (2775*3) as score, N'payload 02775 - kiểm thử dấu phẩy; -- Unicode' as payload where (2775 between 1 and 3000) and 2775+1>2775;
select 2776 as n, (2776*3) as score, N'payload 02776 - kiểm thử dấu phẩy; -- Unicode' as payload where (2776 between 1 and 3000) and 2776+1>2776;
select 2777 as n, (2777*3) as score, N'payload 02777 - kiểm thử dấu phẩy; -- Unicode' as payload where (2777 between 1 and 3000) and 2777+1>2777;
select 2778 as n, (2778*3) as score, N'payload 02778 - kiểm thử dấu phẩy; -- Unicode' as payload where (2778 between 1 and 3000) and 2778+1>2778;
select 2779 as n, (2779*3) as score, N'payload 02779 - kiểm thử dấu phẩy; -- Unicode' as payload where (2779 between 1 and 3000) and 2779+1>2779;
select 2780 as n, (2780*3) as score, N'payload 02780 - kiểm thử dấu phẩy; -- Unicode' as payload where (2780 between 1 and 3000) and 2780+1>2780;
select 2781 as n, (2781*3) as score, N'payload 02781 - kiểm thử dấu phẩy; -- Unicode' as payload where (2781 between 1 and 3000) and 2781+1>2781;
select 2782 as n, (2782*3) as score, N'payload 02782 - kiểm thử dấu phẩy; -- Unicode' as payload where (2782 between 1 and 3000) and 2782+1>2782;
select 2783 as n, (2783*3) as score, N'payload 02783 - kiểm thử dấu phẩy; -- Unicode' as payload where (2783 between 1 and 3000) and 2783+1>2783;
select 2784 as n, (2784*3) as score, N'payload 02784 - kiểm thử dấu phẩy; -- Unicode' as payload where (2784 between 1 and 3000) and 2784+1>2784;
select 2785 as n, (2785*3) as score, N'payload 02785 - kiểm thử dấu phẩy; -- Unicode' as payload where (2785 between 1 and 3000) and 2785+1>2785;
select 2786 as n, (2786*3) as score, N'payload 02786 - kiểm thử dấu phẩy; -- Unicode' as payload where (2786 between 1 and 3000) and 2786+1>2786;
select 2787 as n, (2787*3) as score, N'payload 02787 - kiểm thử dấu phẩy; -- Unicode' as payload where (2787 between 1 and 3000) and 2787+1>2787;
select 2788 as n, (2788*3) as score, N'payload 02788 - kiểm thử dấu phẩy; -- Unicode' as payload where (2788 between 1 and 3000) and 2788+1>2788;
select 2789 as n, (2789*3) as score, N'payload 02789 - kiểm thử dấu phẩy; -- Unicode' as payload where (2789 between 1 and 3000) and 2789+1>2789;
select 2790 as n, (2790*3) as score, N'payload 02790 - kiểm thử dấu phẩy; -- Unicode' as payload where (2790 between 1 and 3000) and 2790+1>2790;
select 2791 as n, (2791*3) as score, N'payload 02791 - kiểm thử dấu phẩy; -- Unicode' as payload where (2791 between 1 and 3000) and 2791+1>2791;
select 2792 as n, (2792*3) as score, N'payload 02792 - kiểm thử dấu phẩy; -- Unicode' as payload where (2792 between 1 and 3000) and 2792+1>2792;
select 2793 as n, (2793*3) as score, N'payload 02793 - kiểm thử dấu phẩy; -- Unicode' as payload where (2793 between 1 and 3000) and 2793+1>2793;
select 2794 as n, (2794*3) as score, N'payload 02794 - kiểm thử dấu phẩy; -- Unicode' as payload where (2794 between 1 and 3000) and 2794+1>2794;
select 2795 as n, (2795*3) as score, N'payload 02795 - kiểm thử dấu phẩy; -- Unicode' as payload where (2795 between 1 and 3000) and 2795+1>2795;
select 2796 as n, (2796*3) as score, N'payload 02796 - kiểm thử dấu phẩy; -- Unicode' as payload where (2796 between 1 and 3000) and 2796+1>2796;
select 2797 as n, (2797*3) as score, N'payload 02797 - kiểm thử dấu phẩy; -- Unicode' as payload where (2797 between 1 and 3000) and 2797+1>2797;
select 2798 as n, (2798*3) as score, N'payload 02798 - kiểm thử dấu phẩy; -- Unicode' as payload where (2798 between 1 and 3000) and 2798+1>2798;
select 2799 as n, (2799*3) as score, N'payload 02799 - kiểm thử dấu phẩy; -- Unicode' as payload where (2799 between 1 and 3000) and 2799+1>2799;
select 2800 as n, (2800*3) as score, N'payload 02800 - kiểm thử dấu phẩy; -- Unicode' as payload where (2800 between 1 and 3000) and 2800+1>2800;
select 2801 as n, (2801*3) as score, N'payload 02801 - kiểm thử dấu phẩy; -- Unicode' as payload where (2801 between 1 and 3000) and 2801+1>2801;
select 2802 as n, (2802*3) as score, N'payload 02802 - kiểm thử dấu phẩy; -- Unicode' as payload where (2802 between 1 and 3000) and 2802+1>2802;
select 2803 as n, (2803*3) as score, N'payload 02803 - kiểm thử dấu phẩy; -- Unicode' as payload where (2803 between 1 and 3000) and 2803+1>2803;
select 2804 as n, (2804*3) as score, N'payload 02804 - kiểm thử dấu phẩy; -- Unicode' as payload where (2804 between 1 and 3000) and 2804+1>2804;
select 2805 as n, (2805*3) as score, N'payload 02805 - kiểm thử dấu phẩy; -- Unicode' as payload where (2805 between 1 and 3000) and 2805+1>2805;
select 2806 as n, (2806*3) as score, N'payload 02806 - kiểm thử dấu phẩy; -- Unicode' as payload where (2806 between 1 and 3000) and 2806+1>2806;
select 2807 as n, (2807*3) as score, N'payload 02807 - kiểm thử dấu phẩy; -- Unicode' as payload where (2807 between 1 and 3000) and 2807+1>2807;
select 2808 as n, (2808*3) as score, N'payload 02808 - kiểm thử dấu phẩy; -- Unicode' as payload where (2808 between 1 and 3000) and 2808+1>2808;
select 2809 as n, (2809*3) as score, N'payload 02809 - kiểm thử dấu phẩy; -- Unicode' as payload where (2809 between 1 and 3000) and 2809+1>2809;
select 2810 as n, (2810*3) as score, N'payload 02810 - kiểm thử dấu phẩy; -- Unicode' as payload where (2810 between 1 and 3000) and 2810+1>2810;
select 2811 as n, (2811*3) as score, N'payload 02811 - kiểm thử dấu phẩy; -- Unicode' as payload where (2811 between 1 and 3000) and 2811+1>2811;
select 2812 as n, (2812*3) as score, N'payload 02812 - kiểm thử dấu phẩy; -- Unicode' as payload where (2812 between 1 and 3000) and 2812+1>2812;
select 2813 as n, (2813*3) as score, N'payload 02813 - kiểm thử dấu phẩy; -- Unicode' as payload where (2813 between 1 and 3000) and 2813+1>2813;
select 2814 as n, (2814*3) as score, N'payload 02814 - kiểm thử dấu phẩy; -- Unicode' as payload where (2814 between 1 and 3000) and 2814+1>2814;
select 2815 as n, (2815*3) as score, N'payload 02815 - kiểm thử dấu phẩy; -- Unicode' as payload where (2815 between 1 and 3000) and 2815+1>2815;
select 2816 as n, (2816*3) as score, N'payload 02816 - kiểm thử dấu phẩy; -- Unicode' as payload where (2816 between 1 and 3000) and 2816+1>2816;
select 2817 as n, (2817*3) as score, N'payload 02817 - kiểm thử dấu phẩy; -- Unicode' as payload where (2817 between 1 and 3000) and 2817+1>2817;
select 2818 as n, (2818*3) as score, N'payload 02818 - kiểm thử dấu phẩy; -- Unicode' as payload where (2818 between 1 and 3000) and 2818+1>2818;
select 2819 as n, (2819*3) as score, N'payload 02819 - kiểm thử dấu phẩy; -- Unicode' as payload where (2819 between 1 and 3000) and 2819+1>2819;
select 2820 as n, (2820*3) as score, N'payload 02820 - kiểm thử dấu phẩy; -- Unicode' as payload where (2820 between 1 and 3000) and 2820+1>2820;
select 2821 as n, (2821*3) as score, N'payload 02821 - kiểm thử dấu phẩy; -- Unicode' as payload where (2821 between 1 and 3000) and 2821+1>2821;
select 2822 as n, (2822*3) as score, N'payload 02822 - kiểm thử dấu phẩy; -- Unicode' as payload where (2822 between 1 and 3000) and 2822+1>2822;
select 2823 as n, (2823*3) as score, N'payload 02823 - kiểm thử dấu phẩy; -- Unicode' as payload where (2823 between 1 and 3000) and 2823+1>2823;
select 2824 as n, (2824*3) as score, N'payload 02824 - kiểm thử dấu phẩy; -- Unicode' as payload where (2824 between 1 and 3000) and 2824+1>2824;
select 2825 as n, (2825*3) as score, N'payload 02825 - kiểm thử dấu phẩy; -- Unicode' as payload where (2825 between 1 and 3000) and 2825+1>2825;
select 2826 as n, (2826*3) as score, N'payload 02826 - kiểm thử dấu phẩy; -- Unicode' as payload where (2826 between 1 and 3000) and 2826+1>2826;
select 2827 as n, (2827*3) as score, N'payload 02827 - kiểm thử dấu phẩy; -- Unicode' as payload where (2827 between 1 and 3000) and 2827+1>2827;
select 2828 as n, (2828*3) as score, N'payload 02828 - kiểm thử dấu phẩy; -- Unicode' as payload where (2828 between 1 and 3000) and 2828+1>2828;
select 2829 as n, (2829*3) as score, N'payload 02829 - kiểm thử dấu phẩy; -- Unicode' as payload where (2829 between 1 and 3000) and 2829+1>2829;
select 2830 as n, (2830*3) as score, N'payload 02830 - kiểm thử dấu phẩy; -- Unicode' as payload where (2830 between 1 and 3000) and 2830+1>2830;
select 2831 as n, (2831*3) as score, N'payload 02831 - kiểm thử dấu phẩy; -- Unicode' as payload where (2831 between 1 and 3000) and 2831+1>2831;
select 2832 as n, (2832*3) as score, N'payload 02832 - kiểm thử dấu phẩy; -- Unicode' as payload where (2832 between 1 and 3000) and 2832+1>2832;
select 2833 as n, (2833*3) as score, N'payload 02833 - kiểm thử dấu phẩy; -- Unicode' as payload where (2833 between 1 and 3000) and 2833+1>2833;
select 2834 as n, (2834*3) as score, N'payload 02834 - kiểm thử dấu phẩy; -- Unicode' as payload where (2834 between 1 and 3000) and 2834+1>2834;
select 2835 as n, (2835*3) as score, N'payload 02835 - kiểm thử dấu phẩy; -- Unicode' as payload where (2835 between 1 and 3000) and 2835+1>2835;
select 2836 as n, (2836*3) as score, N'payload 02836 - kiểm thử dấu phẩy; -- Unicode' as payload where (2836 between 1 and 3000) and 2836+1>2836;
select 2837 as n, (2837*3) as score, N'payload 02837 - kiểm thử dấu phẩy; -- Unicode' as payload where (2837 between 1 and 3000) and 2837+1>2837;
select 2838 as n, (2838*3) as score, N'payload 02838 - kiểm thử dấu phẩy; -- Unicode' as payload where (2838 between 1 and 3000) and 2838+1>2838;
select 2839 as n, (2839*3) as score, N'payload 02839 - kiểm thử dấu phẩy; -- Unicode' as payload where (2839 between 1 and 3000) and 2839+1>2839;
select 2840 as n, (2840*3) as score, N'payload 02840 - kiểm thử dấu phẩy; -- Unicode' as payload where (2840 between 1 and 3000) and 2840+1>2840;
select 2841 as n, (2841*3) as score, N'payload 02841 - kiểm thử dấu phẩy; -- Unicode' as payload where (2841 between 1 and 3000) and 2841+1>2841;
select 2842 as n, (2842*3) as score, N'payload 02842 - kiểm thử dấu phẩy; -- Unicode' as payload where (2842 between 1 and 3000) and 2842+1>2842;
select 2843 as n, (2843*3) as score, N'payload 02843 - kiểm thử dấu phẩy; -- Unicode' as payload where (2843 between 1 and 3000) and 2843+1>2843;
select 2844 as n, (2844*3) as score, N'payload 02844 - kiểm thử dấu phẩy; -- Unicode' as payload where (2844 between 1 and 3000) and 2844+1>2844;
select 2845 as n, (2845*3) as score, N'payload 02845 - kiểm thử dấu phẩy; -- Unicode' as payload where (2845 between 1 and 3000) and 2845+1>2845;
select 2846 as n, (2846*3) as score, N'payload 02846 - kiểm thử dấu phẩy; -- Unicode' as payload where (2846 between 1 and 3000) and 2846+1>2846;
select 2847 as n, (2847*3) as score, N'payload 02847 - kiểm thử dấu phẩy; -- Unicode' as payload where (2847 between 1 and 3000) and 2847+1>2847;
select 2848 as n, (2848*3) as score, N'payload 02848 - kiểm thử dấu phẩy; -- Unicode' as payload where (2848 between 1 and 3000) and 2848+1>2848;
select 2849 as n, (2849*3) as score, N'payload 02849 - kiểm thử dấu phẩy; -- Unicode' as payload where (2849 between 1 and 3000) and 2849+1>2849;
select 2850 as n, (2850*3) as score, N'payload 02850 - kiểm thử dấu phẩy; -- Unicode' as payload where (2850 between 1 and 3000) and 2850+1>2850;
select 2851 as n, (2851*3) as score, N'payload 02851 - kiểm thử dấu phẩy; -- Unicode' as payload where (2851 between 1 and 3000) and 2851+1>2851;
select 2852 as n, (2852*3) as score, N'payload 02852 - kiểm thử dấu phẩy; -- Unicode' as payload where (2852 between 1 and 3000) and 2852+1>2852;
select 2853 as n, (2853*3) as score, N'payload 02853 - kiểm thử dấu phẩy; -- Unicode' as payload where (2853 between 1 and 3000) and 2853+1>2853;
select 2854 as n, (2854*3) as score, N'payload 02854 - kiểm thử dấu phẩy; -- Unicode' as payload where (2854 between 1 and 3000) and 2854+1>2854;
select 2855 as n, (2855*3) as score, N'payload 02855 - kiểm thử dấu phẩy; -- Unicode' as payload where (2855 between 1 and 3000) and 2855+1>2855;
select 2856 as n, (2856*3) as score, N'payload 02856 - kiểm thử dấu phẩy; -- Unicode' as payload where (2856 between 1 and 3000) and 2856+1>2856;
select 2857 as n, (2857*3) as score, N'payload 02857 - kiểm thử dấu phẩy; -- Unicode' as payload where (2857 between 1 and 3000) and 2857+1>2857;
select 2858 as n, (2858*3) as score, N'payload 02858 - kiểm thử dấu phẩy; -- Unicode' as payload where (2858 between 1 and 3000) and 2858+1>2858;
select 2859 as n, (2859*3) as score, N'payload 02859 - kiểm thử dấu phẩy; -- Unicode' as payload where (2859 between 1 and 3000) and 2859+1>2859;
select 2860 as n, (2860*3) as score, N'payload 02860 - kiểm thử dấu phẩy; -- Unicode' as payload where (2860 between 1 and 3000) and 2860+1>2860;
select 2861 as n, (2861*3) as score, N'payload 02861 - kiểm thử dấu phẩy; -- Unicode' as payload where (2861 between 1 and 3000) and 2861+1>2861;
select 2862 as n, (2862*3) as score, N'payload 02862 - kiểm thử dấu phẩy; -- Unicode' as payload where (2862 between 1 and 3000) and 2862+1>2862;
select 2863 as n, (2863*3) as score, N'payload 02863 - kiểm thử dấu phẩy; -- Unicode' as payload where (2863 between 1 and 3000) and 2863+1>2863;
select 2864 as n, (2864*3) as score, N'payload 02864 - kiểm thử dấu phẩy; -- Unicode' as payload where (2864 between 1 and 3000) and 2864+1>2864;
select 2865 as n, (2865*3) as score, N'payload 02865 - kiểm thử dấu phẩy; -- Unicode' as payload where (2865 between 1 and 3000) and 2865+1>2865;
select 2866 as n, (2866*3) as score, N'payload 02866 - kiểm thử dấu phẩy; -- Unicode' as payload where (2866 between 1 and 3000) and 2866+1>2866;
select 2867 as n, (2867*3) as score, N'payload 02867 - kiểm thử dấu phẩy; -- Unicode' as payload where (2867 between 1 and 3000) and 2867+1>2867;
select 2868 as n, (2868*3) as score, N'payload 02868 - kiểm thử dấu phẩy; -- Unicode' as payload where (2868 between 1 and 3000) and 2868+1>2868;
select 2869 as n, (2869*3) as score, N'payload 02869 - kiểm thử dấu phẩy; -- Unicode' as payload where (2869 between 1 and 3000) and 2869+1>2869;
select 2870 as n, (2870*3) as score, N'payload 02870 - kiểm thử dấu phẩy; -- Unicode' as payload where (2870 between 1 and 3000) and 2870+1>2870;
select 2871 as n, (2871*3) as score, N'payload 02871 - kiểm thử dấu phẩy; -- Unicode' as payload where (2871 between 1 and 3000) and 2871+1>2871;
select 2872 as n, (2872*3) as score, N'payload 02872 - kiểm thử dấu phẩy; -- Unicode' as payload where (2872 between 1 and 3000) and 2872+1>2872;
select 2873 as n, (2873*3) as score, N'payload 02873 - kiểm thử dấu phẩy; -- Unicode' as payload where (2873 between 1 and 3000) and 2873+1>2873;
select 2874 as n, (2874*3) as score, N'payload 02874 - kiểm thử dấu phẩy; -- Unicode' as payload where (2874 between 1 and 3000) and 2874+1>2874;
select 2875 as n, (2875*3) as score, N'payload 02875 - kiểm thử dấu phẩy; -- Unicode' as payload where (2875 between 1 and 3000) and 2875+1>2875;
select 2876 as n, (2876*3) as score, N'payload 02876 - kiểm thử dấu phẩy; -- Unicode' as payload where (2876 between 1 and 3000) and 2876+1>2876;
select 2877 as n, (2877*3) as score, N'payload 02877 - kiểm thử dấu phẩy; -- Unicode' as payload where (2877 between 1 and 3000) and 2877+1>2877;
select 2878 as n, (2878*3) as score, N'payload 02878 - kiểm thử dấu phẩy; -- Unicode' as payload where (2878 between 1 and 3000) and 2878+1>2878;
select 2879 as n, (2879*3) as score, N'payload 02879 - kiểm thử dấu phẩy; -- Unicode' as payload where (2879 between 1 and 3000) and 2879+1>2879;
select 2880 as n, (2880*3) as score, N'payload 02880 - kiểm thử dấu phẩy; -- Unicode' as payload where (2880 between 1 and 3000) and 2880+1>2880;
select 2881 as n, (2881*3) as score, N'payload 02881 - kiểm thử dấu phẩy; -- Unicode' as payload where (2881 between 1 and 3000) and 2881+1>2881;
select 2882 as n, (2882*3) as score, N'payload 02882 - kiểm thử dấu phẩy; -- Unicode' as payload where (2882 between 1 and 3000) and 2882+1>2882;
select 2883 as n, (2883*3) as score, N'payload 02883 - kiểm thử dấu phẩy; -- Unicode' as payload where (2883 between 1 and 3000) and 2883+1>2883;
select 2884 as n, (2884*3) as score, N'payload 02884 - kiểm thử dấu phẩy; -- Unicode' as payload where (2884 between 1 and 3000) and 2884+1>2884;
select 2885 as n, (2885*3) as score, N'payload 02885 - kiểm thử dấu phẩy; -- Unicode' as payload where (2885 between 1 and 3000) and 2885+1>2885;
select 2886 as n, (2886*3) as score, N'payload 02886 - kiểm thử dấu phẩy; -- Unicode' as payload where (2886 between 1 and 3000) and 2886+1>2886;
select 2887 as n, (2887*3) as score, N'payload 02887 - kiểm thử dấu phẩy; -- Unicode' as payload where (2887 between 1 and 3000) and 2887+1>2887;
select 2888 as n, (2888*3) as score, N'payload 02888 - kiểm thử dấu phẩy; -- Unicode' as payload where (2888 between 1 and 3000) and 2888+1>2888;
select 2889 as n, (2889*3) as score, N'payload 02889 - kiểm thử dấu phẩy; -- Unicode' as payload where (2889 between 1 and 3000) and 2889+1>2889;
select 2890 as n, (2890*3) as score, N'payload 02890 - kiểm thử dấu phẩy; -- Unicode' as payload where (2890 between 1 and 3000) and 2890+1>2890;
select 2891 as n, (2891*3) as score, N'payload 02891 - kiểm thử dấu phẩy; -- Unicode' as payload where (2891 between 1 and 3000) and 2891+1>2891;
select 2892 as n, (2892*3) as score, N'payload 02892 - kiểm thử dấu phẩy; -- Unicode' as payload where (2892 between 1 and 3000) and 2892+1>2892;
select 2893 as n, (2893*3) as score, N'payload 02893 - kiểm thử dấu phẩy; -- Unicode' as payload where (2893 between 1 and 3000) and 2893+1>2893;
select 2894 as n, (2894*3) as score, N'payload 02894 - kiểm thử dấu phẩy; -- Unicode' as payload where (2894 between 1 and 3000) and 2894+1>2894;
select 2895 as n, (2895*3) as score, N'payload 02895 - kiểm thử dấu phẩy; -- Unicode' as payload where (2895 between 1 and 3000) and 2895+1>2895;
select 2896 as n, (2896*3) as score, N'payload 02896 - kiểm thử dấu phẩy; -- Unicode' as payload where (2896 between 1 and 3000) and 2896+1>2896;
select 2897 as n, (2897*3) as score, N'payload 02897 - kiểm thử dấu phẩy; -- Unicode' as payload where (2897 between 1 and 3000) and 2897+1>2897;
select 2898 as n, (2898*3) as score, N'payload 02898 - kiểm thử dấu phẩy; -- Unicode' as payload where (2898 between 1 and 3000) and 2898+1>2898;
select 2899 as n, (2899*3) as score, N'payload 02899 - kiểm thử dấu phẩy; -- Unicode' as payload where (2899 between 1 and 3000) and 2899+1>2899;
select 2900 as n, (2900*3) as score, N'payload 02900 - kiểm thử dấu phẩy; -- Unicode' as payload where (2900 between 1 and 3000) and 2900+1>2900;
select 2901 as n, (2901*3) as score, N'payload 02901 - kiểm thử dấu phẩy; -- Unicode' as payload where (2901 between 1 and 3000) and 2901+1>2901;
select 2902 as n, (2902*3) as score, N'payload 02902 - kiểm thử dấu phẩy; -- Unicode' as payload where (2902 between 1 and 3000) and 2902+1>2902;
select 2903 as n, (2903*3) as score, N'payload 02903 - kiểm thử dấu phẩy; -- Unicode' as payload where (2903 between 1 and 3000) and 2903+1>2903;
select 2904 as n, (2904*3) as score, N'payload 02904 - kiểm thử dấu phẩy; -- Unicode' as payload where (2904 between 1 and 3000) and 2904+1>2904;
select 2905 as n, (2905*3) as score, N'payload 02905 - kiểm thử dấu phẩy; -- Unicode' as payload where (2905 between 1 and 3000) and 2905+1>2905;
select 2906 as n, (2906*3) as score, N'payload 02906 - kiểm thử dấu phẩy; -- Unicode' as payload where (2906 between 1 and 3000) and 2906+1>2906;
select 2907 as n, (2907*3) as score, N'payload 02907 - kiểm thử dấu phẩy; -- Unicode' as payload where (2907 between 1 and 3000) and 2907+1>2907;
select 2908 as n, (2908*3) as score, N'payload 02908 - kiểm thử dấu phẩy; -- Unicode' as payload where (2908 between 1 and 3000) and 2908+1>2908;
select 2909 as n, (2909*3) as score, N'payload 02909 - kiểm thử dấu phẩy; -- Unicode' as payload where (2909 between 1 and 3000) and 2909+1>2909;
select 2910 as n, (2910*3) as score, N'payload 02910 - kiểm thử dấu phẩy; -- Unicode' as payload where (2910 between 1 and 3000) and 2910+1>2910;
select 2911 as n, (2911*3) as score, N'payload 02911 - kiểm thử dấu phẩy; -- Unicode' as payload where (2911 between 1 and 3000) and 2911+1>2911;
select 2912 as n, (2912*3) as score, N'payload 02912 - kiểm thử dấu phẩy; -- Unicode' as payload where (2912 between 1 and 3000) and 2912+1>2912;
select 2913 as n, (2913*3) as score, N'payload 02913 - kiểm thử dấu phẩy; -- Unicode' as payload where (2913 between 1 and 3000) and 2913+1>2913;
select 2914 as n, (2914*3) as score, N'payload 02914 - kiểm thử dấu phẩy; -- Unicode' as payload where (2914 between 1 and 3000) and 2914+1>2914;
select 2915 as n, (2915*3) as score, N'payload 02915 - kiểm thử dấu phẩy; -- Unicode' as payload where (2915 between 1 and 3000) and 2915+1>2915;
select 2916 as n, (2916*3) as score, N'payload 02916 - kiểm thử dấu phẩy; -- Unicode' as payload where (2916 between 1 and 3000) and 2916+1>2916;
select 2917 as n, (2917*3) as score, N'payload 02917 - kiểm thử dấu phẩy; -- Unicode' as payload where (2917 between 1 and 3000) and 2917+1>2917;
select 2918 as n, (2918*3) as score, N'payload 02918 - kiểm thử dấu phẩy; -- Unicode' as payload where (2918 between 1 and 3000) and 2918+1>2918;
select 2919 as n, (2919*3) as score, N'payload 02919 - kiểm thử dấu phẩy; -- Unicode' as payload where (2919 between 1 and 3000) and 2919+1>2919;
select 2920 as n, (2920*3) as score, N'payload 02920 - kiểm thử dấu phẩy; -- Unicode' as payload where (2920 between 1 and 3000) and 2920+1>2920;
select 2921 as n, (2921*3) as score, N'payload 02921 - kiểm thử dấu phẩy; -- Unicode' as payload where (2921 between 1 and 3000) and 2921+1>2921;
select 2922 as n, (2922*3) as score, N'payload 02922 - kiểm thử dấu phẩy; -- Unicode' as payload where (2922 between 1 and 3000) and 2922+1>2922;
select 2923 as n, (2923*3) as score, N'payload 02923 - kiểm thử dấu phẩy; -- Unicode' as payload where (2923 between 1 and 3000) and 2923+1>2923;
select 2924 as n, (2924*3) as score, N'payload 02924 - kiểm thử dấu phẩy; -- Unicode' as payload where (2924 between 1 and 3000) and 2924+1>2924;
select 2925 as n, (2925*3) as score, N'payload 02925 - kiểm thử dấu phẩy; -- Unicode' as payload where (2925 between 1 and 3000) and 2925+1>2925;
select 2926 as n, (2926*3) as score, N'payload 02926 - kiểm thử dấu phẩy; -- Unicode' as payload where (2926 between 1 and 3000) and 2926+1>2926;
select 2927 as n, (2927*3) as score, N'payload 02927 - kiểm thử dấu phẩy; -- Unicode' as payload where (2927 between 1 and 3000) and 2927+1>2927;
select 2928 as n, (2928*3) as score, N'payload 02928 - kiểm thử dấu phẩy; -- Unicode' as payload where (2928 between 1 and 3000) and 2928+1>2928;
select 2929 as n, (2929*3) as score, N'payload 02929 - kiểm thử dấu phẩy; -- Unicode' as payload where (2929 between 1 and 3000) and 2929+1>2929;
select 2930 as n, (2930*3) as score, N'payload 02930 - kiểm thử dấu phẩy; -- Unicode' as payload where (2930 between 1 and 3000) and 2930+1>2930;
select 2931 as n, (2931*3) as score, N'payload 02931 - kiểm thử dấu phẩy; -- Unicode' as payload where (2931 between 1 and 3000) and 2931+1>2931;
select 2932 as n, (2932*3) as score, N'payload 02932 - kiểm thử dấu phẩy; -- Unicode' as payload where (2932 between 1 and 3000) and 2932+1>2932;
select 2933 as n, (2933*3) as score, N'payload 02933 - kiểm thử dấu phẩy; -- Unicode' as payload where (2933 between 1 and 3000) and 2933+1>2933;
select 2934 as n, (2934*3) as score, N'payload 02934 - kiểm thử dấu phẩy; -- Unicode' as payload where (2934 between 1 and 3000) and 2934+1>2934;
select 2935 as n, (2935*3) as score, N'payload 02935 - kiểm thử dấu phẩy; -- Unicode' as payload where (2935 between 1 and 3000) and 2935+1>2935;
select 2936 as n, (2936*3) as score, N'payload 02936 - kiểm thử dấu phẩy; -- Unicode' as payload where (2936 between 1 and 3000) and 2936+1>2936;
select 2937 as n, (2937*3) as score, N'payload 02937 - kiểm thử dấu phẩy; -- Unicode' as payload where (2937 between 1 and 3000) and 2937+1>2937;
select 2938 as n, (2938*3) as score, N'payload 02938 - kiểm thử dấu phẩy; -- Unicode' as payload where (2938 between 1 and 3000) and 2938+1>2938;
select 2939 as n, (2939*3) as score, N'payload 02939 - kiểm thử dấu phẩy; -- Unicode' as payload where (2939 between 1 and 3000) and 2939+1>2939;
select 2940 as n, (2940*3) as score, N'payload 02940 - kiểm thử dấu phẩy; -- Unicode' as payload where (2940 between 1 and 3000) and 2940+1>2940;
select 2941 as n, (2941*3) as score, N'payload 02941 - kiểm thử dấu phẩy; -- Unicode' as payload where (2941 between 1 and 3000) and 2941+1>2941;
select 2942 as n, (2942*3) as score, N'payload 02942 - kiểm thử dấu phẩy; -- Unicode' as payload where (2942 between 1 and 3000) and 2942+1>2942;
select 2943 as n, (2943*3) as score, N'payload 02943 - kiểm thử dấu phẩy; -- Unicode' as payload where (2943 between 1 and 3000) and 2943+1>2943;
select 2944 as n, (2944*3) as score, N'payload 02944 - kiểm thử dấu phẩy; -- Unicode' as payload where (2944 between 1 and 3000) and 2944+1>2944;
select 2945 as n, (2945*3) as score, N'payload 02945 - kiểm thử dấu phẩy; -- Unicode' as payload where (2945 between 1 and 3000) and 2945+1>2945;
select 2946 as n, (2946*3) as score, N'payload 02946 - kiểm thử dấu phẩy; -- Unicode' as payload where (2946 between 1 and 3000) and 2946+1>2946;
select 2947 as n, (2947*3) as score, N'payload 02947 - kiểm thử dấu phẩy; -- Unicode' as payload where (2947 between 1 and 3000) and 2947+1>2947;
select 2948 as n, (2948*3) as score, N'payload 02948 - kiểm thử dấu phẩy; -- Unicode' as payload where (2948 between 1 and 3000) and 2948+1>2948;
select 2949 as n, (2949*3) as score, N'payload 02949 - kiểm thử dấu phẩy; -- Unicode' as payload where (2949 between 1 and 3000) and 2949+1>2949;
select 2950 as n, (2950*3) as score, N'payload 02950 - kiểm thử dấu phẩy; -- Unicode' as payload where (2950 between 1 and 3000) and 2950+1>2950;
select 2951 as n, (2951*3) as score, N'payload 02951 - kiểm thử dấu phẩy; -- Unicode' as payload where (2951 between 1 and 3000) and 2951+1>2951;
select 2952 as n, (2952*3) as score, N'payload 02952 - kiểm thử dấu phẩy; -- Unicode' as payload where (2952 between 1 and 3000) and 2952+1>2952;
select 2953 as n, (2953*3) as score, N'payload 02953 - kiểm thử dấu phẩy; -- Unicode' as payload where (2953 between 1 and 3000) and 2953+1>2953;
select 2954 as n, (2954*3) as score, N'payload 02954 - kiểm thử dấu phẩy; -- Unicode' as payload where (2954 between 1 and 3000) and 2954+1>2954;
select 2955 as n, (2955*3) as score, N'payload 02955 - kiểm thử dấu phẩy; -- Unicode' as payload where (2955 between 1 and 3000) and 2955+1>2955;
select 2956 as n, (2956*3) as score, N'payload 02956 - kiểm thử dấu phẩy; -- Unicode' as payload where (2956 between 1 and 3000) and 2956+1>2956;
select 2957 as n, (2957*3) as score, N'payload 02957 - kiểm thử dấu phẩy; -- Unicode' as payload where (2957 between 1 and 3000) and 2957+1>2957;
select 2958 as n, (2958*3) as score, N'payload 02958 - kiểm thử dấu phẩy; -- Unicode' as payload where (2958 between 1 and 3000) and 2958+1>2958;
select 2959 as n, (2959*3) as score, N'payload 02959 - kiểm thử dấu phẩy; -- Unicode' as payload where (2959 between 1 and 3000) and 2959+1>2959;
select 2960 as n, (2960*3) as score, N'payload 02960 - kiểm thử dấu phẩy; -- Unicode' as payload where (2960 between 1 and 3000) and 2960+1>2960;
select 2961 as n, (2961*3) as score, N'payload 02961 - kiểm thử dấu phẩy; -- Unicode' as payload where (2961 between 1 and 3000) and 2961+1>2961;
select 2962 as n, (2962*3) as score, N'payload 02962 - kiểm thử dấu phẩy; -- Unicode' as payload where (2962 between 1 and 3000) and 2962+1>2962;
select 2963 as n, (2963*3) as score, N'payload 02963 - kiểm thử dấu phẩy; -- Unicode' as payload where (2963 between 1 and 3000) and 2963+1>2963;
select 2964 as n, (2964*3) as score, N'payload 02964 - kiểm thử dấu phẩy; -- Unicode' as payload where (2964 between 1 and 3000) and 2964+1>2964;
select 2965 as n, (2965*3) as score, N'payload 02965 - kiểm thử dấu phẩy; -- Unicode' as payload where (2965 between 1 and 3000) and 2965+1>2965;
select 2966 as n, (2966*3) as score, N'payload 02966 - kiểm thử dấu phẩy; -- Unicode' as payload where (2966 between 1 and 3000) and 2966+1>2966;
select 2967 as n, (2967*3) as score, N'payload 02967 - kiểm thử dấu phẩy; -- Unicode' as payload where (2967 between 1 and 3000) and 2967+1>2967;
select 2968 as n, (2968*3) as score, N'payload 02968 - kiểm thử dấu phẩy; -- Unicode' as payload where (2968 between 1 and 3000) and 2968+1>2968;
select 2969 as n, (2969*3) as score, N'payload 02969 - kiểm thử dấu phẩy; -- Unicode' as payload where (2969 between 1 and 3000) and 2969+1>2969;
select 2970 as n, (2970*3) as score, N'payload 02970 - kiểm thử dấu phẩy; -- Unicode' as payload where (2970 between 1 and 3000) and 2970+1>2970;
select 2971 as n, (2971*3) as score, N'payload 02971 - kiểm thử dấu phẩy; -- Unicode' as payload where (2971 between 1 and 3000) and 2971+1>2971;
select 2972 as n, (2972*3) as score, N'payload 02972 - kiểm thử dấu phẩy; -- Unicode' as payload where (2972 between 1 and 3000) and 2972+1>2972;
select 2973 as n, (2973*3) as score, N'payload 02973 - kiểm thử dấu phẩy; -- Unicode' as payload where (2973 between 1 and 3000) and 2973+1>2973;
select 2974 as n, (2974*3) as score, N'payload 02974 - kiểm thử dấu phẩy; -- Unicode' as payload where (2974 between 1 and 3000) and 2974+1>2974;
select 2975 as n, (2975*3) as score, N'payload 02975 - kiểm thử dấu phẩy; -- Unicode' as payload where (2975 between 1 and 3000) and 2975+1>2975;
select 2976 as n, (2976*3) as score, N'payload 02976 - kiểm thử dấu phẩy; -- Unicode' as payload where (2976 between 1 and 3000) and 2976+1>2976;
select 2977 as n, (2977*3) as score, N'payload 02977 - kiểm thử dấu phẩy; -- Unicode' as payload where (2977 between 1 and 3000) and 2977+1>2977;
select 2978 as n, (2978*3) as score, N'payload 02978 - kiểm thử dấu phẩy; -- Unicode' as payload where (2978 between 1 and 3000) and 2978+1>2978;
select 2979 as n, (2979*3) as score, N'payload 02979 - kiểm thử dấu phẩy; -- Unicode' as payload where (2979 between 1 and 3000) and 2979+1>2979;
select 2980 as n, (2980*3) as score, N'payload 02980 - kiểm thử dấu phẩy; -- Unicode' as payload where (2980 between 1 and 3000) and 2980+1>2980;
select 2981 as n, (2981*3) as score, N'payload 02981 - kiểm thử dấu phẩy; -- Unicode' as payload where (2981 between 1 and 3000) and 2981+1>2981;
select 2982 as n, (2982*3) as score, N'payload 02982 - kiểm thử dấu phẩy; -- Unicode' as payload where (2982 between 1 and 3000) and 2982+1>2982;
select 2983 as n, (2983*3) as score, N'payload 02983 - kiểm thử dấu phẩy; -- Unicode' as payload where (2983 between 1 and 3000) and 2983+1>2983;
select 2984 as n, (2984*3) as score, N'payload 02984 - kiểm thử dấu phẩy; -- Unicode' as payload where (2984 between 1 and 3000) and 2984+1>2984;
select 2985 as n, (2985*3) as score, N'payload 02985 - kiểm thử dấu phẩy; -- Unicode' as payload where (2985 between 1 and 3000) and 2985+1>2985;
select 2986 as n, (2986*3) as score, N'payload 02986 - kiểm thử dấu phẩy; -- Unicode' as payload where (2986 between 1 and 3000) and 2986+1>2986;
select 2987 as n, (2987*3) as score, N'payload 02987 - kiểm thử dấu phẩy; -- Unicode' as payload where (2987 between 1 and 3000) and 2987+1>2987;
select 2988 as n, (2988*3) as score, N'payload 02988 - kiểm thử dấu phẩy; -- Unicode' as payload where (2988 between 1 and 3000) and 2988+1>2988;
select 2989 as n, (2989*3) as score, N'payload 02989 - kiểm thử dấu phẩy; -- Unicode' as payload where (2989 between 1 and 3000) and 2989+1>2989;
select 2990 as n, (2990*3) as score, N'payload 02990 - kiểm thử dấu phẩy; -- Unicode' as payload where (2990 between 1 and 3000) and 2990+1>2990;
select 2991 as n, (2991*3) as score, N'payload 02991 - kiểm thử dấu phẩy; -- Unicode' as payload where (2991 between 1 and 3000) and 2991+1>2991;
select 2992 as n, (2992*3) as score, N'payload 02992 - kiểm thử dấu phẩy; -- Unicode' as payload where (2992 between 1 and 3000) and 2992+1>2992;
select 2993 as n, (2993*3) as score, N'payload 02993 - kiểm thử dấu phẩy; -- Unicode' as payload where (2993 between 1 and 3000) and 2993+1>2993;
select 2994 as n, (2994*3) as score, N'payload 02994 - kiểm thử dấu phẩy; -- Unicode' as payload where (2994 between 1 and 3000) and 2994+1>2994;
select 2995 as n, (2995*3) as score, N'payload 02995 - kiểm thử dấu phẩy; -- Unicode' as payload where (2995 between 1 and 3000) and 2995+1>2995;
select 2996 as n, (2996*3) as score, N'payload 02996 - kiểm thử dấu phẩy; -- Unicode' as payload where (2996 between 1 and 3000) and 2996+1>2996;
select 2997 as n, (2997*3) as score, N'payload 02997 - kiểm thử dấu phẩy; -- Unicode' as payload where (2997 between 1 and 3000) and 2997+1>2997;
select 2998 as n, (2998*3) as score, N'payload 02998 - kiểm thử dấu phẩy; -- Unicode' as payload where (2998 between 1 and 3000) and 2998+1>2998;
select 2999 as n, (2999*3) as score, N'payload 02999 - kiểm thử dấu phẩy; -- Unicode' as payload where (2999 between 1 and 3000) and 2999+1>2999;
select 3000 as n, (3000*3) as score, N'payload 03000 - kiểm thử dấu phẩy; -- Unicode' as payload where (3000 between 1 and 3000) and 3000+1>3000;

-- zea-case: invalid/01
select 1)

-- zea-case: invalid/02
select 'unfinished

-- zea-case: invalid/03
select from

-- zea-case: invalid/04
create table dbo.Incomplete (id int,

-- zea-case: invalid/05
begin select 1;

-- zea-case: invalid/06
/* unclosed comment

-- zea-case: invalid/07
select 1 as a where (1=1;

-- zea-case: invalid/08
merge dbo.a using dbo.b on dbo.a.id=dbo.b.id when matched then;

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


-- zea-case: format-regions/noformat-block
-- zea-expect: ["SELECT 1 + /* [noformat] */ 2  +  3 /* [/noformat] */","    ,4;"]
select 1  + /* [noformat] */ 2  +  3 /* [/noformat] */, 4;

-- zea-case: format-regions/noformat-line
-- zea-expect: ["SELECT 1","    ,","    -- [noformat]","2   +  3,","-- [/noformat]","    4;"]
select 1,
-- [noformat]
2   +  3,
-- [/noformat]
4;

-- zea-case: format-regions/noformat-eof
-- zea-expect: ["SELECT 1","    ,","    -- [noformat]","2   +  3, 4;"]
select 1,
-- [noformat]
2   +  3, 4;

-- zea-case: format-regions/minify-block
-- zea-expect: ["SELECT 1 + /* [minify] */2+3/* [/minify] */","    ,4;"]
select 1  + /* [minify] */ 2  +  3 /* [/minify] */, 4;

-- zea-case: format-regions/minify-line
-- zea-expect: ["SELECT 1","    ,","    -- [minify]","2+3,","    -- [/minify]","    4;"]
select 1,
-- [minify]
2   +  3,
-- [/minify]
4;

-- zea-case: format-regions/minify-eof
-- zea-expect: ["SELECT 1","    ,","    -- [minify]","2+3,4;"]
select 1,
-- [minify]
2   +  3, 4;

-- zea-case: format-regions/minify-wrap
-- zea-expect: ["SELECT /* [minify] */column_name_abcdefghij+column_name_klmnopqrst+column_name_uvwxyzabcd+","column_name_efghijklmn/* [/minify] */;"]
select /* [minify] */ column_name_abcdefghij + column_name_klmnopqrst + column_name_uvwxyzabcd + column_name_efghijklmn /* [/minify] */;
