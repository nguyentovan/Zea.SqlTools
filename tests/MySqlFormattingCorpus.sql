-- MySQL formatter corpus. Feed each zea-case body independently to Zea.
-- Intended for parsing and formatting only. Contains client directives and invalid SQL.

-- zea-case: select/single-literal
-- zea-expect: ["SELECT 42;"]
SELECT     42;

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT product_id","FROM products","WHERE active = 1;"]
SELECT product_id FROM products WHERE active=1;

-- zea-case: select/projection-list
-- zea-expect: ["SELECT product_id","    ,name","FROM products;"]
SELECT product_id, name FROM products;

-- zea-case: select/function-call
-- zea-expect: ["SELECT ABS(-7);"]
SELECT ABS( -7 );

-- zea-case: select/distinct-sort
-- zea-expect: ["SELECT DISTINCT category_id","FROM products","ORDER BY category_id DESC;"]
SELECT DISTINCT category_id FROM products ORDER BY category_id DESC;

-- zea-case: select/distinctrow
SELECT DISTINCTROW department_id FROM employees;

-- zea-case: select/limit-offset
SELECT customer_id, company FROM customers ORDER BY customer_id LIMIT 20 OFFSET 40;

-- zea-case: select/limit-comma
SELECT order_id FROM orders ORDER BY created_at DESC LIMIT 5, 20;

-- zea-case: select/for-update-skip-locked
-- MySQL 8.0 locking read.
SELECT job_id FROM work_queue WHERE status='pending' ORDER BY job_id LIMIT 5 FOR UPDATE SKIP LOCKED;

-- zea-case: select/for-share-nowait
-- MySQL 8.0 locking read.
SELECT product_id FROM products WHERE product_id=1 FOR SHARE NOWAIT;

-- zea-case: select/case-label
SELECT order_id, CASE WHEN amount >= 1000 THEN 'large' WHEN amount > 0 THEN 'small' ELSE 'zero' END AS order_size FROM orders;

-- zea-case: select/union-all
SELECT customer_id, 'open' AS status FROM open_orders UNION ALL SELECT customer_id, 'closed' FROM archive_orders ORDER BY customer_id;

-- zea-case: join/inner-with-aliases
SELECT o.id, c.name FROM orders AS o INNER JOIN customers c ON c.id=o.customer_id;

-- zea-case: join/left-with-two-conditions
SELECT c.id, a.city FROM customers c LEFT OUTER JOIN addresses a ON a.customer_id=c.id AND a.is_primary=1;

-- zea-case: join/right-outer
SELECT p.name, s.quantity FROM products p RIGHT OUTER JOIN stock s ON p.id=s.product_id;

-- zea-case: join/using-two-columns
SELECT warehouse_id, product_id, actual_qty, expected_qty FROM actual_stock JOIN expected_stock USING (warehouse_id, product_id);

-- zea-case: join/natural-left
SELECT p.product_id, t.name FROM products p NATURAL LEFT JOIN translations t;

-- zea-case: join/cross-with-derived
SELECT p.name, flags.enabled FROM products p CROSS JOIN (SELECT 0 AS enabled UNION ALL SELECT 1) flags;

-- zea-case: join/parenthesized-nested
SELECT a.id, c.country FROM accounts a LEFT JOIN (contacts b JOIN countries c ON b.country_id=c.id) ON b.account_id=a.id;

-- zea-case: join/lateral-top-per-customer
-- LATERAL derived tables are available in MySQL 8.0.14+.
SELECT c.id, recent.order_id FROM customers c
LEFT JOIN LATERAL (SELECT o.order_id FROM orders o WHERE o.customer_id=c.id ORDER BY o.created_at DESC LIMIT 1) AS recent ON TRUE;

-- zea-case: join/straight-join-chains
SELECT p.id, s.quantity FROM products p STRAIGHT_JOIN stock s ON p.id=s.product_id JOIN warehouse w ON s.warehouse_id=w.id;

-- zea-case: predicate/null-tests
SELECT id FROM work_queue WHERE started_at IS NOT NULL AND ended_at IS NULL;

-- zea-case: predicate/null-safe-equality
SELECT a.item_id FROM source_items a JOIN mirror_items b ON a.external_id <=> b.external_id;

-- zea-case: predicate/range-and-in
SELECT id FROM products WHERE price BETWEEN 10 AND 20 AND category_id IN (3, 5, 8);

-- zea-case: predicate/like-with-escape
SELECT recipe_id FROM recipes WHERE title LIKE '%!_%' ESCAPE '!';

-- zea-case: predicate/regexp-rlike
SELECT id FROM addresses WHERE postcode REGEXP '^[0-9]+$' OR state RLIKE '^(CA|NY)$';

-- zea-case: predicate/correlated-not-exists
SELECT c.id FROM customers c WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id=c.id AND o.created_at >= '2024-01-01');

-- zea-case: predicate/tuple-in-subquery
SELECT * FROM stock WHERE (warehouse_id, product_id) IN (SELECT warehouse_id, product_id FROM inventory_targets);

-- zea-case: predicate/boolean-xor
SELECT order_id FROM orders WHERE (paid_at IS NOT NULL) XOR (shipped_at IS NOT NULL);

-- zea-case: predicate/any-subquery
SELECT employee_id FROM staff WHERE salary > ANY (SELECT salary FROM interns);

-- zea-case: aggregate/group-having
SELECT customer_id, COUNT(*) AS purchases, SUM(total) AS revenue FROM orders
GROUP BY customer_id HAVING COUNT(*)>=3 ORDER BY revenue DESC;

-- zea-case: aggregate/multi-column-count-distinct
SELECT COUNT(DISTINCT country_code, postcode) AS active_areas FROM customers;

-- zea-case: aggregate/rollup
SELECT country_code, state_code, SUM(amount) FROM revenues GROUP BY country_code, state_code WITH ROLLUP;

-- zea-case: aggregate/group-concat
SELECT order_id, GROUP_CONCAT(DISTINCT sku ORDER BY sku DESC SEPARATOR '|') AS items FROM order_lines GROUP BY order_id;

-- zea-case: aggregate/json-array
SELECT customer_id, JSON_ARRAYAGG(order_id) AS order_ids FROM orders GROUP BY customer_id;

-- zea-case: aggregate/json-object
SELECT product_id, JSON_OBJECTAGG(attribute_name, attribute_value) AS attributes FROM product_attributes GROUP BY product_id;

-- zea-case: aggregate/standard-deviation
SELECT category_id, STDDEV_POP(price), VAR_SAMP(price) FROM products GROUP BY category_id;

-- zea-case: aggregate/window-rank
-- Window functions are supported in MySQL 8.0.
SELECT department_id, employee_id, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_in_dept FROM salaries;

-- zea-case: aggregate/named-window
SELECT sale_id, SUM(amount) OVER by_region AS running_sales, LAG(amount) OVER by_region AS previous_amount
FROM sales WINDOW by_region AS (PARTITION BY region ORDER BY sale_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW);

-- zea-case: aggregate/window-bounded-frame
SELECT measured_at, AVG(temperature) OVER (ORDER BY measured_at ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS smooth_value FROM measurements;

-- zea-case: cte/two-dependent-ctes
WITH eligible AS (SELECT id FROM customers WHERE country_code='DE'),
totals AS (SELECT o.customer_id, SUM(o.amount) AS total FROM orders o JOIN eligible e ON e.id=o.customer_id GROUP BY o.customer_id)
SELECT customer_id, total FROM totals WHERE total > 100;

-- zea-case: cte/recursive-integer-series
WITH RECURSIVE ticks(n) AS (
  SELECT 1
  UNION ALL
  SELECT n+1 FROM ticks WHERE n < 10
)
SELECT n, n*n AS square FROM ticks;

-- zea-case: cte/recursive-hierarchy
WITH RECURSIVE org(id, manager_id, depth) AS (
  SELECT id, manager_id, 0 FROM staff WHERE manager_id IS NULL
  UNION ALL
  SELECT s.id, s.manager_id, p.depth+1 FROM staff s JOIN org p ON s.manager_id=p.id
)
SELECT id, manager_id, depth FROM org ORDER BY depth, id;

-- zea-case: cte/insert-select
INSERT INTO customer_metrics (customer_id, total)
WITH running AS (SELECT customer_id, SUM(amount) AS total FROM orders GROUP BY customer_id)
SELECT customer_id, total FROM running;

-- zea-case: cte/update-join
WITH stale AS (SELECT id FROM sessions WHERE expires_at < CURRENT_TIMESTAMP)
UPDATE sessions s JOIN stale t ON s.id=t.id SET s.expired=TRUE;

-- zea-case: cte/delete-filter
WITH expired_rows AS (SELECT id FROM cache_entries WHERE expires_at < CURRENT_TIMESTAMP)
DELETE FROM cache_entries WHERE id IN (SELECT id FROM expired_rows);

-- zea-case: cte/quoted-columns
WITH `summary` (`key`, `value`) AS (SELECT source_key, source_value FROM source_data)
SELECT `key`, `value` FROM `summary`;

-- zea-case: literal/escaped-identifier
SELECT `has space`, `contains``tick` FROM `select`;

-- zea-case: literal/doubled-quotes
SELECT 'O''Brien', 'This ; is content', '/* keep */';

-- zea-case: literal/backslash-escapes
-- Default MySQL escaping rules apply.
SELECT 'O\'Brien', 'first\nsecond', 'C:\\archive\\input.csv';

-- zea-case: literal/charset-introducer
SELECT _utf8mb4'Tiếng Việt' COLLATE utf8mb4_bin, _binary'bytes';

-- zea-case: literal/hex-and-bit
SELECT X'4142', 0xCAFE, b'0101', 0b1010;

-- zea-case: literal/exact-and-approximate
-- zea-expect: ["SELECT 0123","    ,5.0","    ,-0.75","    ,1e-4","    ,+2.5E+6;"]
SELECT 0123, 5.0, -0.75, 1e-4, +2.5E+6;

-- zea-case: literal/date-time-timestamp
SELECT DATE '2024-02-29', TIME '12:34:56', TIMESTAMP '2024-02-29 12:34:56';

-- zea-case: literal/interval-units
SELECT CURRENT_DATE + INTERVAL 7 DAY, TIMESTAMPADD(MINUTE, -90, CURRENT_TIMESTAMP), DATE_SUB(CURRENT_DATE, INTERVAL '1-2' YEAR_MONTH);

-- zea-case: literal/signed-and-unsigned-casts
SELECT CAST('42' AS SIGNED), CAST(-1 AS UNSIGNED), CONVERT('abc' USING utf8mb4);

-- zea-case: literal/json-operators
SELECT payload->'$.location[0]', payload->>'$.name' FROM events WHERE JSON_VALID(payload);

-- zea-case: dml/insert-single
INSERT INTO products (product_id, name, active) VALUES (1, 'pencil', DEFAULT);

-- zea-case: dml/insert-multi-row
INSERT INTO order_lines (order_id, sku, quantity) VALUES (10, 'AX', 2), (10, 'BZ', 1), (11, 'AX', 3);

-- zea-case: dml/insert-select
INSERT INTO historic_orders (order_id, placed_at) SELECT order_id, placed_at FROM orders WHERE shipped_at < '2024-01-01';

-- zea-case: dml/duplicate-key-values
-- VALUES(col) remains parseable but is deprecated since MySQL 8.0.20.
INSERT INTO daily_totals (day_key, amount) VALUES ('2024-06-01', 30) ON DUPLICATE KEY UPDATE amount=amount+VALUES(amount);

-- zea-case: dml/duplicate-key-row-alias
-- Row aliases in this statement are supported since MySQL 8.0.19.
INSERT INTO daily_totals (day_key, amount) VALUES ('2024-06-01', 30), ('2024-06-02', 21) AS incoming
ON DUPLICATE KEY UPDATE amount=amount+incoming.amount;

-- zea-case: dml/replace-select
REPLACE INTO daily_snapshot (id, amount) SELECT id, amount FROM staging_snapshot WHERE valid=1;

-- zea-case: dml/update-with-limit
UPDATE work_queue SET status='archived', changed_at=NOW() WHERE status='done' ORDER BY changed_at ASC LIMIT 50;

-- zea-case: dml/update-multiple-tables
UPDATE orders o JOIN customers c ON o.customer_id=c.id SET o.modified_at=NOW(), c.last_order_id=o.id WHERE o.id=120;

-- zea-case: dml/delete-with-limit
DELETE FROM sessions WHERE expires_at < CURRENT_TIMESTAMP ORDER BY expires_at LIMIT 100;

-- zea-case: dml/multi-table-delete
DELETE a, c FROM attachments a JOIN attachment_chunks c ON c.attachment_id=a.id WHERE a.expired=1;

-- zea-case: dml/load-data-local
LOAD DATA LOCAL INFILE 'inventory.csv' INTO TABLE staging_inventory
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(sku, @qty) SET quantity=NULLIF(@qty, '');

-- zea-case: dml/load-xml
LOAD XML LOCAL INFILE 'inventory.xml' INTO TABLE staging_inventory ROWS IDENTIFIED BY '<item>';

-- zea-case: ddl/auto-increment-table
CREATE TABLE IF NOT EXISTS orders (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  customer_id BIGINT UNSIGNED NOT NULL,
  amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (id), KEY order_customer (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- zea-case: ddl/generated-column
CREATE TABLE products (
  id INT PRIMARY KEY, price DECIMAL(10,2),
  tax DECIMAL(8,2) GENERATED ALWAYS AS (price*0.20) STORED,
  gross DECIMAL(10,2) AS (price+tax) VIRTUAL
);

-- zea-case: ddl/check-constraints
-- CHECK constraints are enforced since MySQL 8.0.16.
CREATE TABLE accounts (account_id INT PRIMARY KEY, balance DECIMAL(12,2),
CONSTRAINT nonnegative_balance CHECK (balance >= 0) ENFORCED);

-- zea-case: ddl/foreign-key-actions
CREATE TABLE order_lines (
  order_id BIGINT NOT NULL, line_no INT NOT NULL, sku VARCHAR(40),
  PRIMARY KEY (order_id, line_no),
  CONSTRAINT fk_line_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE RESTRICT
);

-- zea-case: ddl/alter-multiple-actions
ALTER TABLE products ADD COLUMN note VARCHAR(200) NULL AFTER name, DROP COLUMN legacy_code, ADD INDEX idx_note (note(24));

-- zea-case: ddl/rename-column
-- RENAME COLUMN is supported in MySQL 8.0.
ALTER TABLE orders RENAME COLUMN amount TO gross_amount;

-- zea-case: ddl/functional-index
-- Functional key parts are available in MySQL 8.0.13+.
CREATE INDEX idx_lower_email ON users ((LOWER(email)));

-- zea-case: ddl/invisible-index
-- Invisible indexes are supported in MySQL 8.0.
CREATE INDEX idx_recent ON orders (created_at DESC) INVISIBLE;

-- zea-case: ddl/range-partitions
CREATE TABLE tickets (id INT NOT NULL, filed_on DATE NOT NULL, PRIMARY KEY (id, filed_on))
PARTITION BY RANGE COLUMNS(filed_on) (
  PARTITION p2024 VALUES LESS THAN ('2025-01-01'),
  PARTITION p2025 VALUES LESS THAN ('2026-01-01'),
  PARTITION pmax VALUES LESS THAN (MAXVALUE)
);

-- zea-case: ddl/view-options
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW open_jobs AS
SELECT job_id, status FROM jobs WHERE status='open' WITH CASCADED CHECK OPTION;

-- zea-case: ddl/rename-tables
RENAME TABLE current_orders TO archive_orders, next_orders TO current_orders;

-- zea-case: ddl/temporary-table-select
CREATE TEMPORARY TABLE active_customers ENGINE=InnoDB AS SELECT customer_id FROM customers WHERE active=1;

-- zea-case: ddl/enum-and-set
CREATE TABLE member_preferences (
  stage ENUM('new','active','suspended') NOT NULL DEFAULT 'new',
  contact_methods SET('email','sms','post') NOT NULL DEFAULT ''
);

-- zea-case: ddl/fulltext-index
CREATE FULLTEXT INDEX ft_content ON articles (title, body);

-- zea-case: ddl/drop-if-exists
DROP TEMPORARY TABLE IF EXISTS old_ids, stale_records;

-- zea-case: comments/inline-line-comment
SELECT customer_id -- stable external identifier
FROM customers
WHERE active=1;

-- zea-case: comments/hash-comment
# comment with SELECT and ; as plain text
SELECT 1 AS code # attached hash comment
FROM dual;

-- zea-case: comments/block-between-tokens
SELECT /* projection */ a, b FROM store /* read-only source */ WHERE b IS NOT NULL;

-- zea-case: comments/optimizer-hints
SELECT /*+ NO_RANGE_OPTIMIZATION(o idx_orders_date) */ o.id FROM orders o WHERE o.placed_at > '2024-01-01';

-- zea-case: comments/versioned-executable-comment
SELECT /*!80000 DISTINCT */ product_id FROM products;

-- zea-case: comments/mixed-line-and-block
/*
  Documentation containing ('quotes') and token-like SQL.
*/
SELECT a /* later: b */, b FROM source_table; -- end statement

-- zea-case: advanced/json-table-typed-nested
-- JSON_TABLE is supported in MySQL 8.0.4+.
SELECT e.id, j.row_num, j.sku FROM events e
JOIN JSON_TABLE(e.payload, '$.items[*]' COLUMNS (
  row_num FOR ORDINALITY,
  NESTED PATH '$.details[*]' COLUMNS (sku VARCHAR(30) PATH '$.sku' NULL ON EMPTY)
)) AS j ON TRUE;

-- zea-case: advanced/json-value-returning
-- JSON_VALUE is supported in MySQL 8.0.21+.
SELECT JSON_VALUE(payload, '$.qty' RETURNING UNSIGNED DEFAULT 0 ON EMPTY NULL ON ERROR) AS qty FROM inventory_events;

-- zea-case: advanced/row-value-constructor
-- Standalone VALUES with ROW constructors is supported in MySQL 8.0.19+.
VALUES ROW(1, 'one'), ROW(2, 'two') ORDER BY column_0 DESC;

-- zea-case: advanced/table-set-operations
-- TABLE is supported in MySQL 8.0.19+, INTERSECT and EXCEPT in 8.0.31+.
TABLE expected_inventory EXCEPT ALL TABLE physical_inventory INTERSECT TABLE live_inventory;

-- zea-case: advanced/explain-json
EXPLAIN FORMAT=JSON SELECT * FROM orders WHERE customer_id=20 ORDER BY created_at LIMIT 5;

-- zea-case: advanced/describe-query
DESCRIBE SELECT item_id FROM inventory WHERE quantity>0;

-- zea-case: advanced/match-against-boolean
SELECT id, MATCH(title, body) AGAINST ('+database -distributed' IN BOOLEAN MODE) AS relevance FROM articles
WHERE MATCH(title, body) AGAINST ('+database -distributed' IN BOOLEAN MODE) ORDER BY relevance DESC;

-- zea-case: advanced/spatial-functions
SELECT place_id, ST_Distance_Sphere(location, POINT(2.1734, 41.3851)) AS meters FROM places;

-- zea-case: advanced/transaction-chain
START TRANSACTION WITH CONSISTENT SNAPSHOT;
SAVEPOINT before_update;
UPDATE jobs SET priority=5 WHERE id=12;
ROLLBACK TO SAVEPOINT before_update;
RELEASE SAVEPOINT before_update;
COMMIT AND NO CHAIN;

-- zea-case: advanced/session-system-variables
SET @@SESSION.sql_mode='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
SELECT @@SESSION.sql_mode, @@GLOBAL.sql_mode, @current_user_id;

-- zea-case: advanced/prepared-statement
SET @query_text='SELECT * FROM products WHERE id = ?';
PREPARE lookup_product FROM @query_text;
SET @lookup_id=12;
EXECUTE lookup_product USING @lookup_id;
DEALLOCATE PREPARE lookup_product;

-- zea-case: advanced/lock-tables
LOCK TABLES product_summary AS s WRITE, products READ;
UNLOCK TABLES;

-- zea-case: advanced/analyze-histogram
ANALYZE TABLE orders UPDATE HISTOGRAM ON amount WITH 32 BUCKETS;

-- zea-case: procedural/procedure-in-out
CREATE PROCEDURE add_total(IN customer INT, OUT out_total DECIMAL(12,2))
BEGIN
  SELECT COALESCE(SUM(amount), 0) INTO out_total FROM orders WHERE customer_id=customer;
END;

-- zea-case: procedural/function-conditional
CREATE FUNCTION level_code(amount DECIMAL(12,2)) RETURNS VARCHAR(10) DETERMINISTIC NO SQL
BEGIN
  IF amount >= 100 THEN
    RETURN 'high';
  ELSEIF amount >= 10 THEN
    RETURN 'mid';
  ELSE
    RETURN 'low';
  END IF;
END;

-- zea-case: procedural/trigger-before-insert
CREATE TRIGGER products_before_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
  IF NEW.created_at IS NULL THEN
    SET NEW.created_at=CURRENT_TIMESTAMP;
  END IF;
END;

-- zea-case: procedural/repeat-and-until
CREATE PROCEDURE refill(IN steps INT)
BEGIN
  DECLARE iteration INT DEFAULT 0;
  REPEAT
    SET iteration=iteration+1;
  UNTIL iteration >= steps
  END REPEAT;
END;

-- zea-case: procedural/while-loop
CREATE PROCEDURE count_to(IN wanted INT)
BEGIN
  DECLARE counter INT DEFAULT 0;
  WHILE counter < wanted DO
    SET counter=counter+1;
  END WHILE;
  SELECT counter;
END;

-- zea-case: procedural/cursor-handler
CREATE PROCEDURE collect_ids()
BEGIN
  DECLARE finished BOOL DEFAULT FALSE;
  DECLARE product_key INT;
  DECLARE product_cursor CURSOR FOR SELECT id FROM products;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished=TRUE;
  OPEN product_cursor;
  read_rows: LOOP
    FETCH product_cursor INTO product_key;
    IF finished THEN LEAVE read_rows; END IF;
    INSERT INTO product_ids VALUES (product_key);
  END LOOP read_rows;
  CLOSE product_cursor;
END;

-- zea-case: procedural/signal-user-error
CREATE PROCEDURE enforce_amount(IN amount DECIMAL(12,2))
BEGIN
  IF amount < 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Amount must be nonnegative';
  END IF;
END;

-- zea-case: procedural/scheduled-event
CREATE EVENT cleanup_cache ON SCHEDULE EVERY 1 DAY STARTS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO DELETE FROM cache_entries WHERE expires_at < CURRENT_TIMESTAMP;

-- zea-case: procedural/client-delimiter
-- DELIMITER is a mysql client command; this case represents a script sent to that client.
DELIMITER //
CREATE PROCEDURE select_version()
BEGIN
  SELECT VERSION();
END//
DELIMITER ;
CALL select_version();

-- zea-case: exclusive/on-duplicate-key
INSERT INTO sample_counts (category, total) VALUES ('parts', 1) ON DUPLICATE KEY UPDATE total=total+1;

-- zea-case: exclusive/insert-ignore-set
INSERT IGNORE INTO sample_entries SET item_id=3, item_name='latch';

-- zea-case: exclusive/replace-low-priority
REPLACE LOW_PRIORITY INTO sample_entries SET item_id=1, item_name='nut';

-- zea-case: exclusive/index-hints
SELECT * FROM orders FORCE INDEX FOR ORDER BY (idx_date) IGNORE INDEX FOR JOIN (idx_customer) ORDER BY order_date;

-- zea-case: exclusive/lock-in-share-mode
SELECT * FROM pending_orders WHERE customer_id=3 LOCK IN SHARE MODE;

-- zea-case: exclusive/auto-increment-engine
CREATE TABLE sample_items (id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY) ENGINE=InnoDB;

-- zea-case: exclusive/show-create-table
SHOW CREATE TABLE order_lines;

-- zea-case: exclusive/sql-calc-found-rows
-- Deprecated since MySQL 8.0.17, still present in MySQL 8.0.
SELECT SQL_CALC_FOUND_ROWS item_id AS projected_id FROM inventory WHERE quantity>0 LIMIT 25;

-- zea-case: exclusive/bulk-load-duplicate-policy
LOAD DATA INFILE 'imports/data.csv' REPLACE INTO TABLE inventory
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- zea-case: exclusive/flush-table-read-lock
FLUSH TABLES inventory WITH READ LOCK;

-- zea-case: stress/reconciliation-report
WITH recent_orders AS (
  SELECT o.id, o.customer_id, o.placed_at, o.channel, l.sku, l.qty, l.unit_price
  FROM orders o JOIN order_lines l ON l.order_id=o.id
  WHERE o.placed_at >= CURRENT_DATE - INTERVAL 30 DAY AND o.status NOT IN ('draft', 'cancelled')
), totals AS (
  SELECT customer_id, channel, COUNT(DISTINCT id) AS order_count, SUM(qty*unit_price) AS earned
  FROM recent_orders GROUP BY customer_id, channel
), ranked AS (
  SELECT customer_id, channel, order_count, earned,
         DENSE_RANK() OVER (PARTITION BY channel ORDER BY earned DESC) AS rank_in_channel
  FROM totals
)
SELECT c.customer_id, c.name, r.channel, r.order_count, r.earned, r.rank_in_channel,
       CASE WHEN r.rank_in_channel <= 3 THEN 'featured' ELSE 'standard' END AS tier
FROM customers c JOIN ranked r ON r.customer_id=c.customer_id
WHERE c.active=1 AND EXISTS (SELECT 1 FROM region_permissions p WHERE p.region_code=c.region_code AND p.enabled=1)
ORDER BY r.channel, r.rank_in_channel, c.customer_id LIMIT 100;

-- zea-case: stress/round-trip-transaction-script
START TRANSACTION;
INSERT INTO audit_events (event_type, event_body) VALUES
('ready', JSON_OBJECT('reason', 'retry ; [1]', 'labels', JSON_ARRAY('urgent', 'day'))),
('queued', JSON_OBJECT('source', 'system', 'ids', JSON_ARRAY(1,2,3)));
SAVEPOINT after_audit;
UPDATE work_queue q JOIN scheduled_jobs j ON j.job_id=q.job_id
SET q.status=CASE WHEN j.retries=0 THEN 'ready' ELSE 'retry' END, q.changed_at=CURRENT_TIMESTAMP
WHERE ((q.status='waiting' AND j.run_at <= CURRENT_TIMESTAMP) OR (q.status='stalled' AND j.retries < 4))
AND NOT EXISTS (SELECT 1 FROM paused_queues p WHERE p.queue_name=q.queue_name);
SELECT q.queue_name, COUNT(*) AS ready_count, MIN(q.changed_at) AS earliest
FROM work_queue q WHERE q.status IN ('retry', 'ready')
GROUP BY q.queue_name HAVING COUNT(*)>0 ORDER BY ready_count DESC;
COMMIT;

-- zea-case: stress/large-insert-values
INSERT INTO audit_events (event_id, event_kind, event_body) VALUES
(1,'entry',JSON_OBJECT('code','E01','active',TRUE)), (2,'entry',JSON_OBJECT('code','E02','active',TRUE)),
(3,'entry',JSON_OBJECT('code','E03','active',FALSE)), (4,'entry',JSON_OBJECT('code','E04','active',FALSE)),
(5,'entry',JSON_OBJECT('code','E05','active',TRUE)), (6,'entry',JSON_OBJECT('code','E06','active',FALSE)),
(7,'entry',JSON_OBJECT('code','E07','active',TRUE)), (8,'entry',JSON_OBJECT('code','E08','active',FALSE)),
(9,'entry',JSON_OBJECT('code','E09','active',TRUE)), (10,'entry',JSON_OBJECT('code','E10','active',TRUE)),
(11,'entry',JSON_OBJECT('code','E11','active',FALSE)), (12,'entry',JSON_OBJECT('code','E12','active',FALSE)),
(13,'entry',JSON_OBJECT('code','E13','active',TRUE)), (14,'entry',JSON_OBJECT('code','E14','active',FALSE)),
(15,'entry',JSON_OBJECT('code','E15','active',TRUE)), (16,'entry',JSON_OBJECT('code','E16','active',FALSE)),
(17,'entry',JSON_OBJECT('code','E17','active',TRUE)), (18,'entry',JSON_OBJECT('code','E18','active',FALSE)),
(19,'entry',JSON_OBJECT('code','E19','active',FALSE)), (20,'entry',JSON_OBJECT('code','E20','active',TRUE));

-- zea-case: stress/join-fanout-nested-reports
SELECT report.city_id, report.totals, places.city_name, owners.display_name,
       COALESCE(flags.active, 0) AS flag_active
FROM (
  SELECT r.city_id, SUM(r.subtotal) AS totals
  FROM (SELECT city_id, region_id, SUM(amount) AS subtotal FROM daily_revenues GROUP BY city_id, region_id) r
  LEFT JOIN region_config rc ON r.region_id=rc.region_id
  WHERE rc.reportable=1 OR rc.region_id IS NULL
  GROUP BY r.city_id
) AS report
JOIN places ON places.city_id=report.city_id
LEFT JOIN owners ON owners.owner_id=places.owner_id
LEFT JOIN (SELECT city_id, MAX(active) AS active FROM city_flags GROUP BY city_id) AS flags
  ON flags.city_id=report.city_id
WHERE report.totals BETWEEN 100 AND 100000 ORDER BY report.totals DESC, places.city_name;

-- zea-case: invalid/unclosed-string
SELECT 'unterminated FROM products;

-- zea-case: invalid/unmatched-paren
SELECT JSON_OBJECT('id', id FROM products;

-- zea-case: invalid/missing-select-projection
SELECT FROM products WHERE active=1;

-- zea-case: invalid/missing-update-value
UPDATE products SET price = WHERE id=1;

-- zea-case: invalid/missing-table-name
CREATE TABLE (id INT);

-- zea-case: invalid/incomplete-duplicate-key
INSERT INTO products (id) VALUES (3) ON DUPLICATE KEY UPDATE;

-- zea-case: invalid/incomplete-cte
WITH recent AS (SELECT id FROM orders) SELECT id FROM;

-- zea-case: invalid/broken-procedure
CREATE PROCEDURE open_proc() BEGIN IF TRUE THEN SELECT 1; END;

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
