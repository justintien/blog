# db test

## docker

```sh
docker run -it -d \
--name mysql \
-e MYSQL_ALLOW_EMPTY_PASSWORD=true \
-e MYSQL_DATABASE=test \
mysql:5.7
```

### card

```sql
CREATE TABLE `card` (
   `card_id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
   `card_number` char(36) DEFAULT NULL COMMENT '卡号',
   PRIMARY KEY (`card_id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=0 CHARSET=utf8mb4;

DROP PROCEDURE IF EXISTS proc1;
DELIMITER $$
SET AUTOCOMMIT = 0$$
CREATE  PROCEDURE proc1()
BEGIN
DECLARE v_cnt DECIMAL (10)  DEFAULT 0 ;
dd:LOOP
          INSERT  INTO card (card_number) VALUES (UUID());
                  COMMIT;
                    SET v_cnt = v_cnt+1 ;
                           IF  v_cnt = 10000000 THEN LEAVE dd;
                          END IF;
         END LOOP dd ;
END;$$
DELIMITER ;

call proc1();

SET profiling = 1;

select * from card order by rand() limit 1;
select * from card where card_number like '%xxx%';

show PROFILE ALL for query 1;

SELECT
  TABLE_NAME AS `Table`,
  ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024) AS `Size (MB)`
FROM
  information_schema.TABLES
WHERE
  TABLE_SCHEMA = "test"
ORDER BY
  (DATA_LENGTH + INDEX_LENGTH)
DESC;

+-------+-----------+
| Table | Size (MB) |
+-------+-----------+
| card  |       636 |
+-------+-----------+
1 row in set (0.07 sec)


mysql> select * from card where card_number = 'd3d19b33-2dfe-11ea-b2a3-0242ac110005';
+---------+--------------------------------------+
| card_id | card_number                          |
+---------+--------------------------------------+
|     120 | d3d19b33-2dfe-11ea-b2a3-0242ac110005 |
+---------+--------------------------------------+
1 row in set (4.1 sec)

// default is b-tree
mysql> alter table card add key k_card_number(card_number) using btree;
Query OK, 0 rows affected (2 min 50.82 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from card where card_number = 'd3d19b33-2dfe-11ea-b2a3-0242ac110005';
+---------+--------------------------------------+
| card_id | card_number                          |
+---------+--------------------------------------+
|     120 | d3d19b33-2dfe-11ea-b2a3-0242ac110005 |
+---------+--------------------------------------+
1 row in set (0.08 sec)

-- 增加索引後，快了不少(空間也多佔了一倍)

+-------+-----------+
| Table | Size (MB) |
+-------+-----------+
| card  |      1206 |
+-------+-----------+
1 row in set (0.06 sec)

-- use hash (變更快了)
mysql> alter table card drop key k_card_number;
mysql>  alter table card add key k_card_number(card_number) using hash;
Query OK, 0 rows affected (2 min 37.65 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from card where card_number = 'd3d19b33-2dfe-11ea-b2a3-0242ac110005';
+---------+--------------------------------------+
| card_id | card_number                          |
+---------+--------------------------------------+
|     120 | d3d19b33-2dfe-11ea-b2a3-0242ac110005 |
+---------+--------------------------------------+
1 row in set (0.00 sec)


-- drop key & add key size 并不会减少…
+-------+-----------+
| Table | Size (MB) |
+-------+-----------+
| card  |      1776 |
+-------+-----------+
1 row in set (0.00 sec)
```
