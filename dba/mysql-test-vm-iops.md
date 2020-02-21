# mysql-test-vm-iops

`資料庫版本是 MySQL 5.7`

> run docker

```sh
docker run -it -d \
--name mysql \
-e MYSQL_ALLOW_EMPTY_PASSWORD=true \
-e MYSQL_DATABASE=test \
mysql:5.7
```

## test 有 text type 的

```sql
CREATE TABLE `user` (
   `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
   `uuid` char(36) DEFAULT NULL COMMENT 'UUID',
   `text` text DEFAULT NULL COMMENT 'text',
   PRIMARY KEY (`id`),
   KEY k_uuid (uuid) USING HASH -- default is b-tree
 ) ENGINE=InnoDB AUTO_INCREMENT=0 CHARSET=utf8mb4;


DROP PROCEDURE IF EXISTS mockdata;
DELIMITER $$
SET AUTOCOMMIT = 0$$
CREATE  PROCEDURE mockdata(IN loop_time INT)
BEGIN
DECLARE v_cnt DECIMAL (10)  DEFAULT 0 ;
dd:LOOP
          INSERT  INTO user (uuid, `text`) VALUES (UUID(), concat(
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID()
          ));
                  COMMIT;
                    SET v_cnt = v_cnt+1 ;
                           IF  v_cnt = loop_time THEN LEAVE dd;
                          END IF;
         END LOOP dd ;
END;$$
DELIMITER ;

-- 此區為 g1-small (1 個 vCPU，1.7 GB 記憶體) 測試 start ---

-- 100萬筆
call mockdata(1000000);
-- Query OK, 0 rows affected (13 min 59.88 sec)

select * from user where id = 500000;
-- 1 row in set (0.00 sec)

SET profiling = 1;

select * from user where text = 'e8d7f208-314f-11ea-a01b-0242ac110005e8d7f209-314f-11ea-a01b-0242ac110005e8d7f20b-314f-11ea-a01b-0242ac110005e8d7f20d-314f-11ea-a01b-0242ac110005e8d7f20e-314f-11ea-a01b-0242ac110005e8d7f20f-314f-11ea-a01b-0242ac110005e8d7f210-314f-11ea-a01b-0242ac110005e8d7f211-314f-11ea-a01b-0242ac110005e8d7f212-314f-11ea-a01b-0242ac110005e8d7f213-314f-11ea-a01b-0242ac110005e8d7f214-314f-11ea-a01b-0242ac110005e8d7f215-314f-11ea-a01b-0242ac110005e8d7f216-314f-11ea-a01b-0242ac110005e8d7f217-314f-11ea-a01b-0242ac110005e8d7f218-314f-11ea-a01b-0242ac110005e8d7f219-314f-11ea-a01b-0242ac110005e8d7f21a-314f-11ea-a01b-0242ac110005e8d7f21c-314f-11ea-a01b-0242ac110005e8d7f21d-314f-11ea-a01b-0242ac110005e8d7f21e-314f-11ea-a01b-0242ac110005';
-- 1 row in set (11.38 sec)

SHOW PROFILE CPU, BLOCK IO;
+----------------------+----------+----------+------------+--------------+---------------+
| Status               | Duration | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+----------+----------+------------+--------------+---------------+
| starting             | 0.000331 | 0.000216 |   0.000114 |            0 |             0 |
| checking permissions | 0.000010 | 0.000006 |   0.000004 |            0 |             0 |
| Opening tables       | 0.000058 | 0.000038 |   0.000020 |            0 |             0 |
| init                 | 0.000040 | 0.000026 |   0.000014 |            0 |             0 |
| System lock          | 0.000012 | 0.000008 |   0.000004 |            0 |             0 |
| optimizing           | 0.000012 | 0.000008 |   0.000004 |            0 |             0 |
| statistics           | 0.000019 | 0.000012 |   0.000006 |            0 |             0 |
| preparing            | 0.000014 | 0.000009 |   0.000005 |            0 |             0 |
| executing            | 0.000005 | 0.000003 |   0.000002 |            0 |             0 |
| Sending data         | 6.505760 | 1.225292 |   1.121294 |      1572472 |             0 |
| end                  | 0.000023 | 0.000011 |   0.000006 |            0 |             0 |
| query end            | 0.000015 | 0.000010 |   0.000005 |            0 |             0 |
| closing tables       | 0.000071 | 0.000046 |   0.000025 |            0 |             0 |
| freeing items        | 0.002746 | 0.000057 |   0.000030 |            0 |             0 |
| cleaning up          | 0.000027 | 0.000016 |   0.000008 |            0 |             0 |
+----------------------+----------+----------+------------+--------------+---------------+
15 rows in set, 1 warning (0.00 sec)


-- 此區為 g1-small (1 個 vCPU，1.7 GB 記憶體) 測試 end ---


-- 此區為 linode 1GB RAM start --

-- 100萬筆
call mockdata(1000000);
select * from user where id = 500000;
SET profiling = 1;

select * from user where uuid = '6af35f23-31b0-11ea-bbf6-0242ac110003';
-- 1 row in set (0.00 sec)

select * from user where text = '6af35f44-31b0-11ea-bbf6-0242ac1100036af35f4d-31b0-11ea-bbf6-0242ac1100036af35f5e-31b0-11ea-bbf6-0242ac1100036af35f68-31b0-11ea-bbf6-0242ac1100036af35f71-31b0-11ea-bbf6-0242ac1100036af35f7a-31b0-11ea-bbf6-0242ac1100036af35f84-31b0-11ea-bbf6-0242ac1100036af35f8d-31b0-11ea-bbf6-0242ac1100036af35f96-31b0-11ea-bbf6-0242ac1100036af35f9f-31b0-11ea-bbf6-0242ac1100036af35fa9-31b0-11ea-bbf6-0242ac1100036af35fb2-31b0-11ea-bbf6-0242ac1100036af35fbc-31b0-11ea-bbf6-0242ac1100036af35fc5-31b0-11ea-bbf6-0242ac1100036af35fce-31b0-11ea-bbf6-0242ac1100036af35fd8-31b0-11ea-bbf6-0242ac1100036af35fe1-31b0-11ea-bbf6-0242ac1100036af35fea-31b0-11ea-bbf6-0242ac1100036af35ff3-31b0-11ea-bbf6-0242ac1100036af35ffd-31b0-11ea-bbf6-0242ac110003';
-- 1 row in set (6.34 sec)

SHOW PROFILE CPU, BLOCK IO;
+----------------------+----------+----------+------------+--------------+---------------+
| Status               | Duration | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+----------+----------+------------+--------------+---------------+
| starting             | 0.003813 | 0.000000 |   0.000181 |          248 |             0 |
| checking permissions | 0.000513 | 0.000000 |   0.000062 |           40 |             0 |
| Opening tables       | 0.000026 | 0.000000 |   0.000025 |            0 |             0 |
| init                 | 0.000104 | 0.000000 |   0.000071 |            0 |             0 |
| System lock          | 0.000018 | 0.000000 |   0.000017 |            0 |             0 |
| optimizing           | 0.000014 | 0.000000 |   0.000014 |            0 |             0 |
| statistics           | 0.000020 | 0.000000 |   0.000020 |            0 |             0 |
| preparing            | 0.000015 | 0.000000 |   0.000015 |            0 |             0 |
| executing            | 0.000004 | 0.000000 |   0.000005 |            0 |             0 |
| Sending data         | 6.323172 | 1.999108 |   1.507180 |      1650056 |             0 |
| end                  | 0.007755 | 0.000187 |   0.000101 |          104 |             0 |
| query end            | 0.001759 | 0.000163 |   0.000088 |          312 |             0 |
| closing tables       | 0.001830 | 0.000163 |   0.000087 |          384 |             0 |
| freeing items        | 0.002388 | 0.000156 |   0.000084 |          424 |             0 |
| cleaning up          | 0.001427 | 0.000116 |   0.000062 |          152 |             0 |
+----------------------+----------+----------+------------+--------------+---------------+
15 rows in set, 1 warning (0.00 sec)

+-------+-----------+
| Table | Size (MB) |
+-------+-----------+
| user  |       867 |
+-------+-----------+
1 row in set (0.00 sec)

-- test 1000萬筆
call mockdata(10000000);

select * from user where id = 500000;
-- 1 row in set (0.00 sec)
select * from user where uuid = '6af35f23-31b0-11ea-bbf6-0242ac110003';
-- 1 row in set (0.00 sec)

SET profiling = 1;


select * from user where text = 'f242c6be-314b-11ea-b800-0242ac110003f242c6c8-314b-11ea-b800-0242ac110003f242c6d5-314b-11ea-b800-0242ac110003f242c6df-314b-11ea-b800-0242ac110003f242c6e8-314b-11ea-b800-0242ac110003f242c6f1-314b-11ea-b800-0242ac110003f242c6fb-314b-11ea-b800-0242ac110003f242c704-314b-11ea-b800-0242ac110003f242c70d-314b-11ea-b800-0242ac110003f242c716-314b-11ea-b800-0242ac110003f242c720-314b-11ea-b800-0242ac110003f242c729-314b-11ea-b800-0242ac110003f242c732-314b-11ea-b800-0242ac110003f242c73c-314b-11ea-b800-0242ac110003f242c745-314b-11ea-b800-0242ac110003f242c74e-314b-11ea-b800-0242ac110003f242c758-314b-11ea-b800-0242ac110003f242c761-314b-11ea-b800-0242ac110003f242c76a-314b-11ea-b800-0242ac110003f242c774-314b-11ea-b800-0242ac110003';
-- 1 row in set (49.22 sec)

 SHOW PROFILE CPU, BLOCK IO;
+----------------------+-----------+-----------+------------+--------------+---------------+
| Status               | Duration  | CPU_user  | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+-----------+-----------+------------+--------------+---------------+
| starting             |  0.002934 |  0.000289 |   0.000000 |          248 |             0 |
| checking permissions |  0.000019 |  0.000018 |   0.000000 |            0 |             0 |
| Opening tables       |  0.000022 |  0.000022 |   0.000000 |            0 |             0 |
| init                 |  0.000041 |  0.000041 |   0.000000 |            0 |             0 |
| System lock          |  0.000012 |  0.000012 |   0.000000 |            0 |             0 |
| optimizing           |  0.000012 |  0.000012 |   0.000000 |            0 |             0 |
| statistics           |  0.000023 |  0.000022 |   0.000000 |            0 |             0 |
| preparing            |  0.000016 |  0.000016 |   0.000000 |            0 |             0 |
| executing            |  0.000005 |  0.000005 |   0.000000 |            0 |             0 |
| Sending data         | 49.212545 | 18.620916 |  13.659935 |     15151648 |             0 |
| end                  |  0.000021 |  0.000011 |   0.000005 |            0 |             0 |
| query end            |  0.000013 |  0.000009 |   0.000003 |            0 |             0 |
| closing tables       |  0.000012 |  0.000008 |   0.000004 |            0 |             0 |
| freeing items        |  0.000402 |  0.000027 |   0.000012 |            0 |             0 |
| cleaning up          |  0.000026 |  0.000017 |   0.000007 |            0 |             0 |
+----------------------+-----------+-----------+------------+--------------+---------------+
15 rows in set, 1 warning (0.00 sec)

+-------+-----------+
| Table | Size (MB) |
+-------+-----------+
| user  |      7769 |
+-------+-----------+
1 row in set (0.00 sec)

-- 此區為 linode 1GB RAM end --
```

## test 用 uuid 當主鍵的

```sql
CREATE TABLE `user` (
   `uuid` char(36) NOT NULL COMMENT 'UUID',
   `uuid2` char(36) NOT NULL COMMENT 'UUID',
   `uuid3` char(36) NOT NULL COMMENT 'UUID',
   `uuid4` char(36) NOT NULL COMMENT 'UUID',
   `text` text COMMENT 'text',
   PRIMARY KEY (`uuid`),
   KEY k_uuid2_uuid3 (uuid2, uuid3) USING BTREE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP PROCEDURE IF EXISTS mockdata;
DELIMITER $$
SET AUTOCOMMIT = 0$$
CREATE  PROCEDURE mockdata(IN loop_time INT)
BEGIN
DECLARE v_cnt DECIMAL (10)  DEFAULT 0 ;
dd:LOOP
          INSERT  INTO user (uuid, uuid2, uuid3, uuid4, `text`) VALUES (UUID(), UUID(), UUID(), UUID(), concat(
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID()
          ));
                  COMMIT;
                    SET v_cnt = v_cnt+1 ;
                           IF  v_cnt = loop_time THEN LEAVE dd;
                          END IF;
         END LOOP dd ;
END;$$
DELIMITER ;

-- 此區為 gcp sql vCPU: 1, Memory: 3.75G, SSD: 10G (mysql) 測試 start ---
call mockdata(2000000); -- 

-- 此區為 gcp sql vCPU: 1, Memory: 3.75G, SSD: 10G (mysql) 測試 end ---


-- 此區為 g1-small (1 個 vCPU，1.7 GB 記憶體) 測試 start ---

-- 200萬筆
call mockdata(2000000); -- Query OK, 0 rows affected (34 min 0.13 sec)
SET profiling = 1;
select * from user limit 1000000, 1; -- 1 row in set (25.85 sec)

select * from user where uuid2 = '86ad15c6-31b7-11ea-9d3e-0242ac110006'; -- 1 row in set (0.16 sec) 有索引
select * from user where uuid4 = '86ad15ce-31b7-11ea-9d3e-0242ac110006'; -- 1 row in set (46.56 sec) 無索引
SHOW PROFILE CPU, BLOCK IO;
+----------------------+-----------+----------+------------+--------------+---------------+
| Status               | Duration  | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+-----------+----------+------------+--------------+---------------+
| starting             |  0.000083 | 0.000053 |   0.000028 |            0 |             0 |
| checking permissions |  0.000010 | 0.000007 |   0.000004 |            0 |             0 |
| Opening tables       |  0.000020 | 0.000013 |   0.000007 |            0 |             0 |
| init                 |  0.000067 | 0.000044 |   0.000023 |            0 |             0 |
| System lock          |  0.000010 | 0.000006 |   0.000004 |            0 |             0 |
| optimizing           |  0.000012 | 0.000008 |   0.000004 |            0 |             0 |
| statistics           |  0.000020 | 0.000013 |   0.000007 |            0 |             0 |
| preparing            |  0.000014 | 0.000009 |   0.000005 |            0 |             0 |
| executing            |  0.000005 | 0.000003 |   0.000001 |            0 |             0 |
| Sending data         | 46.488346 | 2.917264 |   2.049348 |      5063072 |             0 |
| end                  |  0.014841 | 0.000020 |   0.000011 |            0 |             0 |
| query end            |  0.010273 | 0.000239 |   0.000000 |          168 |             0 |
| closing tables       |  0.035040 | 0.000263 |   0.000000 |          112 |             0 |
| freeing items        |  0.011206 | 0.000373 |   0.000000 |          640 |             0 |
| cleaning up          |  0.023716 | 0.000142 |   0.000017 |          128 |             0 |
+----------------------+-----------+----------+------------+--------------+---------------+
15 rows in set, 1 warning (0.13 sec)

select * from user limit 1001000, 100; -- 100 rows in set (21.23 sec)

SHOW PROFILE CPU, BLOCK IO;
+----------------------+-----------+----------+------------+--------------+---------------+
| Status               | Duration  | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+-----------+----------+------------+--------------+---------------+
| starting             |  0.000097 | 0.000062 |   0.000033 |            0 |             0 |
| checking permissions |  0.000010 | 0.000006 |   0.000004 |            0 |             0 |
| Opening tables       |  0.000030 | 0.000020 |   0.000010 |            0 |             0 |
| init                 |  0.000025 | 0.000016 |   0.000009 |            0 |             0 |
| System lock          |  0.000011 | 0.000007 |   0.000004 |            0 |             0 |
| optimizing           |  0.000006 | 0.000003 |   0.000002 |            0 |             0 |
| statistics           |  0.000017 | 0.000011 |   0.000005 |            0 |             0 |
| preparing            |  0.000011 | 0.000008 |   0.000004 |            0 |             0 |
| executing            |  0.000004 | 0.000002 |   0.000002 |            0 |             0 |
| Sending data         | 21.233598 | 1.428086 |   1.029885 |      2515016 |             0 |
| end                  |  0.000017 | 0.000010 |   0.000006 |            0 |             0 |
| query end            |  0.000013 | 0.000008 |   0.000004 |            0 |             0 |
| closing tables       |  0.000011 | 0.000007 |   0.000004 |            0 |             0 |
| freeing items        |  0.015820 | 0.000170 |   0.000092 |            0 |             0 |
| cleaning up          |  0.000034 | 0.000021 |   0.000011 |            0 |             0 |
+----------------------+-----------+----------+------------+--------------+---------------+
15 rows in set, 1 warning (0.00 sec)

call mockdata(2000000); -- 第二次mockdata變慢了， Query OK, 0 rows affected (36 min 7.28 sec)

-- 此區為 g1-small (1 個 vCPU，1.7 GB 記憶體) 測試 end ---


-- 此區為 linode 1GB RAM start --
call mockdata(2000000); -- Query OK, 0 rows affected (29 min 18.49 sec)
SET profiling = 1;
select * from user limit 1000000, 1; -- 1 row in set (7.73 sec)
select * from user where uuid2 = '7e171f6b-31b6-11ea-b8b8-0242ac110003'; -- 1 row in set (0.01 sec) 有索引
select * from user where uuid4 = '7e17205f-31b6-11ea-b8b8-0242ac110003'; -- 1 row in set (17.81 sec) 無索引
SHOW PROFILE CPU, BLOCK IO;
+----------------------+-----------+----------+------------+--------------+---------------+
| Status               | Duration  | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+-----------+----------+------------+--------------+---------------+
| starting             |  0.000076 | 0.000000 |   0.000076 |            0 |             0 |
| checking permissions |  0.000009 | 0.000000 |   0.000008 |            0 |             0 |
| Opening tables       |  0.000018 | 0.000000 |   0.000017 |            0 |             0 |
| init                 |  0.000033 | 0.000000 |   0.000033 |            0 |             0 |
| System lock          |  0.000011 | 0.000000 |   0.000011 |            0 |             0 |
| optimizing           |  0.000011 | 0.000000 |   0.000011 |            0 |             0 |
| statistics           |  0.000019 | 0.000000 |   0.000019 |            0 |             0 |
| preparing            |  0.000015 | 0.000000 |   0.000014 |            0 |             0 |
| executing            |  0.000004 | 0.000000 |   0.000005 |            0 |             0 |
| Sending data         | 17.809709 | 4.789240 |   3.451040 |      5478576 |             0 |
| end                  |  0.000018 | 0.000011 |   0.000006 |            0 |             0 |
| query end            |  0.000013 | 0.000008 |   0.000005 |            0 |             0 |
| closing tables       |  0.000015 | 0.000010 |   0.000005 |            0 |             0 |
| freeing items        |  0.000368 | 0.000025 |   0.000014 |            0 |             0 |
| cleaning up          |  0.000025 | 0.000016 |   0.000008 |            0 |             0 |
+----------------------+-----------+----------+------------+--------------+---------------+
15 rows in set, 1 warning (0.00 sec)

select * from user limit 1001000, 100; -- 100 rows in set (6.16 sec)
SHOW PROFILE CPU, BLOCK IO;
+----------------------+----------+----------+------------+--------------+---------------+
| Status               | Duration | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+----------+----------+------------+--------------+---------------+
| starting             | 0.000068 | 0.000067 |   0.000000 |            0 |             0 |
| checking permissions | 0.000009 | 0.000009 |   0.000000 |            0 |             0 |
| Opening tables       | 0.000034 | 0.000027 |   0.000000 |            0 |             0 |
| init                 | 0.000022 | 0.000021 |   0.000000 |            0 |             0 |
| System lock          | 0.000011 | 0.000011 |   0.000000 |            0 |             0 |
| optimizing           | 0.000006 | 0.000006 |   0.000000 |            0 |             0 |
| statistics           | 0.000016 | 0.000016 |   0.000000 |            0 |             0 |
| preparing            | 0.000013 | 0.000013 |   0.000000 |            0 |             0 |
| executing            | 0.000005 | 0.000005 |   0.000000 |            0 |             0 |
| Sending data         | 6.157347 | 2.176718 |   1.696348 |      2621920 |             0 |
| end                  | 0.000019 | 0.000011 |   0.000006 |            0 |             0 |
| query end            | 0.000017 | 0.000011 |   0.000006 |            0 |             0 |
| closing tables       | 0.000015 | 0.000009 |   0.000005 |            0 |             0 |
| freeing items        | 0.000029 | 0.000019 |   0.000010 |            0 |             0 |
| cleaning up          | 0.000024 | 0.000015 |   0.000009 |            0 |             0 |
+----------------------+----------+----------+------------+--------------+---------------+
15 rows in set, 1 warning (0.00 sec)

call mockdata(2000000); -- 第二次mockdata變慢了， Query OK, 0 rows affected (36 min 7.28 sec)

-- 此區為 linode 1GB RAM end --
```

## test 用 uuid 當主鍵的 且 text > 16KB (1KB=1024字節，1字節=8位)

```sql
CREATE TABLE `user` (
   `uuid` char(36) NOT NULL COMMENT 'UUID',
   `uuid2` char(36) NOT NULL COMMENT 'UUID',
   `uuid3` char(36) NOT NULL COMMENT 'UUID',
   `uuid4` char(36) NOT NULL COMMENT 'UUID',
   `text` text COMMENT 'text',
   PRIMARY KEY (`uuid`),
   KEY k_uuid2_uuid3 (uuid2, uuid3) USING BTREE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP PROCEDURE IF EXISTS mockdata;
DELIMITER $$
SET AUTOCOMMIT = 0$$
CREATE  PROCEDURE mockdata(IN loop_time INT)
BEGIN
DECLARE v_cnt DECIMAL (10)  DEFAULT 0 ;
dd:LOOP
          INSERT  INTO user (uuid, uuid2, uuid3, uuid4, `text`) VALUES (UUID(), UUID(), UUID(), UUID(), concat(
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),
              UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID(),UUID()
          ));
                  COMMIT;
                    SET v_cnt = v_cnt+1 ;
                           IF  v_cnt = loop_time THEN LEAVE dd;
                          END IF;
         END LOOP dd ;
END;$$
DELIMITER ;

-- 先試10萬筆
call mockdata(100000); -- Query OK, 0 rows affected (8 min 37.72 sec)

SET profiling = 1;
select uuid2, uuid3, uuid4 from user limit 90000, 10;
+--------------------------------------+--------------------------------------+--------------------------------------+
| uuid2                                | uuid3                                | uuid4                                |
+--------------------------------------+--------------------------------------+--------------------------------------+
| ee9e4a77-31f2-11ea-886a-0242ac110006 | ee9e4a7b-31f2-11ea-886a-0242ac110006 | ee9e4a7f-31f2-11ea-886a-0242ac110006 |
| ee9e7eed-31f2-11ea-886a-0242ac110006 | ee9e7ef1-31f2-11ea-886a-0242ac110006 | ee9e7ef5-31f2-11ea-886a-0242ac110006 |
| ee9ebb9d-31f2-11ea-886a-0242ac110006 | ee9ebba1-31f2-11ea-886a-0242ac110006 | ee9ebba5-31f2-11ea-886a-0242ac110006 |
| ee9ef1aa-31f2-11ea-886a-0242ac110006 | ee9ef1ae-31f2-11ea-886a-0242ac110006 | ee9ef1b2-31f2-11ea-886a-0242ac110006 |
| ee9f2c22-31f2-11ea-886a-0242ac110006 | ee9f2c27-31f2-11ea-886a-0242ac110006 | ee9f2c2b-31f2-11ea-886a-0242ac110006 |
| ee9f6168-31f2-11ea-886a-0242ac110006 | ee9f616c-31f2-11ea-886a-0242ac110006 | ee9f6170-31f2-11ea-886a-0242ac110006 |
| ee9f9cc1-31f2-11ea-886a-0242ac110006 | ee9f9cc6-31f2-11ea-886a-0242ac110006 | ee9f9cca-31f2-11ea-886a-0242ac110006 |
| ee9fd88a-31f2-11ea-886a-0242ac110006 | ee9fd88e-31f2-11ea-886a-0242ac110006 | ee9fd893-31f2-11ea-886a-0242ac110006 |
| ee9ffe32-31f1-11ea-886a-0242ac110006 | ee9ffe3a-31f1-11ea-886a-0242ac110006 | ee9ffe41-31f1-11ea-886a-0242ac110006 |
| eea00aa7-31f2-11ea-886a-0242ac110006 | eea00aac-31f2-11ea-886a-0242ac110006 | eea00ab0-31f2-11ea-886a-0242ac110006 |
+--------------------------------------+--------------------------------------+--------------------------------------+
10 rows in set (6.65 sec)

select * from user where uuid2 = 'ee9e4a77-31f2-11ea-886a-0242ac110006'; -- 1 row in set (0.01 sec) 有索引
select * from user where uuid4 = 'ee9e4a7f-31f2-11ea-886a-0242ac110006'; -- 1 row in set (59.98 sec) 無索引
```
