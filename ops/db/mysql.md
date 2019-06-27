Last-Modified: {docsify-updated}

# mysql

## default
- max_allowed_packet: 1M
  - (例如 json type 超過 1M 則會報錯 ERROR 1153 (08S01) at line XX: Got a packet bigger than 'max_allowed_packet' bytes)
  - [see](http://blog.xuite.net/tolarku/blog/385615135-MySQL+%E9%8C%AF%E8%AA%A4+got+a+packet+bigger+than+%27max_allowed_packet%27+bytes+mysql)
- 關於 sql_mode: http://seanlook.com/2016/04/22/mysql-sql-mode-troubleshooting/

## 刪除 幾個月前的記錄
```sh
select * from log_slide_main_industry_id where create_time >= '2018-12-31';
```

## 每一日 群組
```sql
/* 每一日 群組 */
select created_at, count(*) from log_report where create_time > '2018-07-01' GROUP BY YEAR(created_at), MONTH(created_at), DAY(created_at);
```

## 連線數
```sh
show status where `variable_name` = 'Threads_connected';
```

```sh
SHOW PROCESSLIST;
```

```sh
SET FOREIGN_KEY_CHECKS = 0;
```

```
SHOW ENGINE INNODB STATUS\G
```

## show lock table
```sh
SHOW OPEN TABLES;

LOCK TABLE t WRITE, t AS t1 READ;
UNLOCK TABLE
```

```sh
/*查看慢查詢時間 */  
show variables like "long_query_time";默認10s

/*查看慢查詢配置情況 */  
show status like "%slow_queries%";

/*查看慢查詢日誌路徑 */  
 show variables like "%slow%";

// 慢查詢的數量
show global status like '%slow%';

作者：飛翔咖啡館
鏈接：http://www.jianshu.com/p/38cbb5426bee
來源：簡書
著作權歸作者所有。商業轉載請聯繫作者獲得授權，非商業轉載請註明出處。
```

```sql
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

see you !!!
```

- json 搜尋
```sql
-- mysql json 找尋 key 存在的 sql
SELECT * from table where JSON_CONTAINS_PATH(`json`, 'one', '$.name') = 1;
```

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