# MYSQL

- [优化 InnoDB 表](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/optimizing-innodb.html#%E4%BC%98%E5%8C%96-innodb-%E8%A1%A8)

## 設計概念

- [mysql web數據庫的設計歸範-1命名規範 原](https://my.oschina.net/dongzerun/blog/289664)
- [MySql數據庫設計總結](https://mp.weixin.qq.com/s/oFFoVN_P3FGj7yUeRN-fpQ)
- [如何為標籤雲設計MySql表？](http://osask.cn/front/ask/view/524948)
- [mysql processlist](http://www.ywnds.com/?p=9337)

## default

- max_allowed_packet: 1M
  - (例如 json type 超過 1M 則會報錯 ERROR 1153 (08S01) at line XX: Got a packet bigger than 'max_allowed_packet' bytes)
  - [see](http://blog.xuite.net/tolarku/blog/385615135-MySQL+%E9%8C%AF%E8%AA%A4+got+a+packet+bigger+than+%27max_allowed_packet%27+bytes+mysql)
- 關於 sql_mode: http://seanlook.com/2016/04/22/mysql-sql-mode-troubleshooting/

Last-Modified: {docsify-updated}

## mysqldump

> mysql dump

### 一些指令

- only schema

```sh
mysqldump -d -u someuser -p mydatabase > mydatabase.sql
```

- only dump some data
```sh
docker run -it --rm mariadb:10 mysql dbName -B -e "select * from user_register_log" > test
```

```sh
# see: https://segmentfault.com/a/1190000000621104
mysqldump -B --add-drop-database --events --routines --triggers nutspie_prod > ./sql/test.sql

mysqldump --single-transaction --routines --triggers --all-databases
```

## 常用查詢語法

> 查詢當天、本周、本月、上個月

```sql
/* 今天 */
SELECT * FROM 表名 WHERE TO_DAYS(時間字段名) = TO_DAYS(now());
/* 昨天 */
SELECT * FROM 表名 WHERE TO_DAYS( NOW( ) ) - TO_DAYS( 時間字段名 ) <= 1;
/* 近7日 */
SELECT * FROM 表名 WHERE DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(時間字段名);
/* 近30日 */
SELECT * FROM 表名 WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= date(時間字段名);
/* 本月 */
SELECT * FROM 表名 WHERE DATE_FORMAT( 時間字段名, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m' );
/* 上個月 */
SELECT * FROM 表名 WHERE PERIOD_DIFF( DATE_FORMAT( now( ) , '%Y%m' ) , DATE_FORMAT( 時間字段名, '%Y%m' ) ) = 1;
/* 查詢本季度 */
SELECT * FROM 表名 WHERE QUARTER(時間字段名) = QUARTER(now());
/* 查詢上季度 */
SELECT * FROM 表名 WHERE QUARTER(時間字段名) = QUARTER(DATE_SUB(now(),interval 1 QUARTER));
/* 查詢本年度 */
SELECT * FROM 表名 WHERE YEAR(時間字段名) = YEAR(NOW());
/* 查詢上年度 */
SELECT * FROM 表名 WHERE YEAR(時間字段名) = YEAR(DATE_SUB(now(),interval 1 year));
/* 查詢當前這周 */
SELECT 時間字段名 FROM 表名 WHERE YEARWEEK(DATE_FORMAT(時間字段名, '%Y-%m-%d')) = YEARWEEK(now());
/* 查詢上周 */
SELECT 時間字段名 FROM 表名 WHERE YEARWEEK(DATE_FORMAT(時間字段名,'%Y-%m-%d')) = YEARWEEK(now())-1;
/* 每一日 群組 */
SELECT created_at, count(*) FROM 表名 WHERE created_at > '2018-07-01' GROUP BY YEAR(created_at), MONTH(created_at), DAY(created_at);

-- mysql json 找尋 key 存在的 sql
SELECT * from table where JSON_CONTAINS_PATH(`json`, 'one', '$.name') = 1;
```

> 大量插入數據

```sql
use test;
DROP PROCEDURE IF EXISTS BatchInsert;
delimiter //   -- 把界定符改成双斜杠
CREATE PROCEDURE BatchInsert(IN init INT, IN loop_time INT)  -- 第一个参数为初始ID号（可自定义），第二个位生成MySQL记录个数
  BEGIN
      DECLARE Var INT;
      DECLARE ID INT;
      SET Var = 0;
      SET ID = init;
      WHILE Var < loop_time DO
          insert into employees(id, fname, lname, birth, hired, separated, job_code, store_id) values (ID, CONCAT('chen', ID), CONCAT('haixiang', ID), Now(), Now(), Now(), 1, ID);
          SET ID = ID + 1;
          SET Var = Var + 1;
      END WHILE;
  END;
  //
delimiter ;  -- 界定符改回分号
CALL BatchInsert(30036, 200000);   -- 调用存储过程插入函数
```

### 查詢DB狀態語法

```sql
/* 連線數 */
show status where `variable_name` = 'Threads_connected';
/* 程序列表 */
SHOW PROCESSLIST;
/* 關閉 foreign key 檢查 */
SET FOREIGN_KEY_CHECKS = 0;
/* innodb status */
SHOW ENGINE INNODB STATUS\G
/* show lock table */
SHOW OPEN TABLES;
/* lock table */
LOCK TABLE t WRITE, t AS t1 READ;
/* unlock table */
UNLOCK TABLE
/* 查看慢查詢時間 */  
show variables like "long_query_time";默認10s
/* 查看慢查詢配置情況 */  
show status like "%slow_queries%";
/* 查看慢查詢日誌路徑 */  
show variables like "%slow%";
/* 慢查詢的數量 */
show global status like '%slow%';
--copy and paste in your prompt of mysql>
show triggers;
--for see all the triggers create
describe INFORMATION_SCHEMA.TRIGGERS;
--for see the columns of INFORMATION_SCHEMA table
describe INFORMATION_SCHEMA.COLUMNS;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS;
--for see all the columns creates :)Dangerous

SELECT * FROM INFORMATION_SCHEMA.TRIGGERS;
--for see all the triggers informations

-- size
SELECT
  TABLE_NAME AS `Table`,
  ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024) AS `Size (MB)`
FROM
  information_schema.TABLES
WHERE
  TABLE_SCHEMA = "bookstore"
ORDER BY
  (DATA_LENGTH + INDEX_LENGTH)
DESC;


-- cache config
show global variables like '%query_cache%';

-- SHOW PROFILE
SET profiling = 1; -- session 只有本次會話有效
// some query syntax....
SHOW PROFILES;
show PROFILE for query 1;
show PROFILE ALL for query 1; --查看sql1相关的所有分析【主要看i/o与cpu,下边分析中有各项意义介绍】
```

## db debug

> ER_LOCK_WAIT_TIMEOUT 追查
> ER_LOCK_DEADLOCK

```sh
show processlist;

# 隔離級別: see http://mysql.taobao.org/monthly/2017/06/07/
show variables like 'tx_isolation';

select * from information_schema.innodb_lock_waits;

SELECT r.trx_id waiting_trx_id, r.trx_query waiting_query, b.trx_id blocking_trx_id, b.trx_query, blocking_query,b.trx_mysql_thread_id blocking_thread,b.trx_started,b.trx_wait_started
FROM information_schema.innodb_lock_waits w
INNER JOIN information_schema.innodb_trx b
ON b.trx_id = w.blocking_trx_id
INNER JOIN information_schema.innodb_trx r
ON r.trx_id = w.requesting_trx_id;

select * from information_schema.innodb_locks;

select trx_id,trx_state,trx_isolation_level from information_schema.innodb_trx;
```

## 插入變慢優化

- https://www.cnblogs.com/kubidemanong/p/10734045.html

```sh
# 這幾個嘗試調整下
max_allowed_packet
net_buffer_length
bulk_insert_buffer_size
innodb_flush_log_at_trx_commit
```

### links

- [Mysql 必知](http://blog.cjli.info/2016/02/02/MySQL-Must-Knows/)
- [一千行 MySQL 學習筆記](https://shockerli.net/post/1000-line-mysql-note/)
- [二十种实战调优MySQL性能优化的经验](https://mp.weixin.qq.com/s/tORc47YRfsmtgDQV23XiPA)
- [面试小知识：MySQL索引相关](https://mp.weixin.qq.com/s/RemJcqPIvLArmfWIhoaZ1g)
- https://mengkang.net/958.html
<!-- - [分享：详记一次MySQL千万级大表优化过程！](https://zhuanlan.zhihu.com/p/76217095) -->