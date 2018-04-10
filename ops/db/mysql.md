# mysql

## default
- max_allowed_packet: 1M
  - (例如 json type 超过 1M 则会报错 ERROR 1153 (08S01) at line XX: Got a packet bigger than 'max_allowed_packet' bytes)
  - [see](http://blog.xuite.net/tolarku/blog/385615135-MySQL+%E9%8C%AF%E8%AA%A4+got+a+packet+bigger+than+%27max_allowed_packet%27+bytes+mysql)


## 刪除 幾個月前的記錄
```sh
select * from log_slide_main_industry_id where create_time >= '2018-12-31';
```

## 连线数
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
/*查看慢查询时间 */  
show variables like "long_query_time";默认10s

/*查看慢查询配置情况 */  
show status like "%slow_queries%";

/*查看慢查询日志路径 */  
 show variables like "%slow%";

// 慢查询的数量
show global status like '%slow%';

作者：飞翔咖啡馆
链接：http://www.jianshu.com/p/38cbb5426bee
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
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

- json 搜寻
```sql
-- mysql json 找寻 key 存在的 sql
SELECT * from table where JSON_CONTAINS_PATH(`json`, 'one', '$.name') = 1;
```