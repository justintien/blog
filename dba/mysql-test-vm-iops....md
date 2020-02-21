# no title

> run docker

```sh
docker run -it -d \
--name mysql \
-e MYSQL_ALLOW_EMPTY_PASSWORD=true \
-e MYSQL_DATABASE=test \
mysql:5.7.22
```

```sql
CREATE TABLE `user` (
   `uuid` char(36) NOT NULL COMMENT 'UUID',
   `uuid2` char(36) NOT NULL COMMENT 'UUID',
   `uuid3` char(36) NOT NULL COMMENT 'UUID',
   `uuid4` char(36) NOT NULL COMMENT 'UUID',
   `sort` int(11) DEFAULT '0',
   `json` longtext COMMENT '',
   `text` text COMMENT '',
   `create` datetime DEFAULT NULL COMMENT '创建时间',
   `modify` bigint(20) DEFAULT '0' COMMENT '修改时间',

   PRIMARY KEY (`uuid`) USING HASH,
   KEY k_uuid2_uuid3 (uuid2, uuid3) USING BTREE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP PROCEDURE IF EXISTS mockdata;
DELIMITER $$
SET AUTOCOMMIT = 0$$
CREATE  PROCEDURE mockdata(IN loop_time INT)
BEGIN
DECLARE v_cnt DECIMAL (10)  DEFAULT 0 ;
dd:LOOP
          INSERT  INTO user (uuid, uuid2, uuid3, uuid4, `json`) VALUES (UUID(), UUID(), UUID(), UUID(), concat(
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

call mockdata(2000000); -- Query OK, 0 rows affected (27 min 3.09 sec)
SET profiling = 1;
select * from user limit 1000000, 1; -- 1 row in set (6.09 sec)

select * from user where uuid2 = '8a551706-31c2-11ea-ad49-0242ac110003' and uuid3 = '8a551713-31c2-11ea-ad49-0242ac110003'; -- 1 row in set (0.01 sec) 有索引
select * from user where uuid4 = '8a551721-31c2-11ea-ad49-0242ac110003'; -- 1 row in set (13.15 sec)
SHOW PROFILE CPU, BLOCK IO;
+----------------------+-----------+----------+------------+--------------+---------------+
| Status               | Duration  | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+-----------+----------+------------+--------------+---------------+
| starting             |  0.000092 | 0.000081 |   0.000000 |            0 |             0 |
| checking permissions |  0.000009 | 0.000009 |   0.000000 |            0 |             0 |
| Opening tables       |  0.000018 | 0.000018 |   0.000000 |            0 |             0 |
| init                 |  0.000037 | 0.000036 |   0.000000 |            0 |             0 |
| System lock          |  0.000011 | 0.000011 |   0.000000 |            0 |             0 |
| optimizing           |  0.000011 | 0.000080 |   0.000000 |            0 |             0 |
| statistics           |  0.000091 | 0.000022 |   0.000000 |            0 |             0 |
| preparing            |  0.000015 | 0.000015 |   0.000000 |            0 |             0 |
| executing            |  0.000005 | 0.000005 |   0.000000 |            0 |             0 |
| Sending data         | 13.150757 | 4.921611 |   3.428449 |      5645848 |             0 |
| end                  |  0.001536 | 0.000181 |   0.000098 |          336 |             0 |
| query end            |  0.000501 | 0.000057 |   0.000031 |          128 |             0 |
| closing tables       |  0.000534 | 0.000048 |   0.000026 |           24 |             0 |
| freeing items        |  0.000516 | 0.000026 |   0.000015 |            0 |             0 |
| cleaning up          |  0.000033 | 0.000021 |   0.000011 |            0 |             0 |
+----------------------+-----------+----------+------------+--------------+---------------+
15 rows in set, 1 warning (0.01 sec)


-- 等沒緩存時執行
select * from user where uuid2 in ('8a7126b6-31c2-11ea-ad49-0242ac110003','8a712ed9-31c3-11ea-ad49-0242ac110003','8a712ef3-31c1-11ea-ad49-0242ac110003','8a71356c-31c2-11ea-ad49-0242ac110003','8a7139d5-31c1-11ea-ad49-0242ac110003','8a715331-31c2-11ea-ad49-0242ac110003','8a715ac4-31c3-11ea-ad49-0242ac110003','8a715fdc-31c2-11ea-ad49-0242ac110003','8a716ea6-31c3-11ea-ad49-0242ac110003','8a717021-31c1-11ea-ad49-0242ac110003','8a71736d-31c2-11ea-ad49-0242ac110003','8a717bd2-31c3-11ea-ad49-0242ac110003','8a717e0b-31c1-11ea-ad49-0242ac110003','8a717fc3-31c2-11ea-ad49-0242ac110003','8a718b1a-31c1-11ea-ad49-0242ac110003','8a718b82-31c3-11ea-ad49-0242ac110003','8a718bef-31c2-11ea-ad49-0242ac110003','8a71988a-31c2-11ea-ad49-0242ac110003','8a7199e7-31c3-11ea-ad49-0242ac110003','8a71a331-31c1-11ea-ad49-0242ac110003','8a71a6f7-31c3-11ea-ad49-0242ac110003','8a71a833-31c2-11ea-ad49-0242ac110003','8a71b206-31c1-11ea-ad49-0242ac110003','8a71b4a7-31c2-11ea-ad49-0242ac110003','8a71b7f9-31c3-11ea-ad49-0242ac110003','8a71c325-31c1-11ea-ad49-0242ac110003','8a71ccbb-31c3-11ea-ad49-0242ac110003','8a71d216-31c2-11ea-ad49-0242ac110003','8a71ddb3-31c1-11ea-ad49-0242ac110003','8a71e24f-31c2-11ea-ad49-0242ac110003','8a71eae1-31c1-11ea-ad49-0242ac110003','8a71f118-31c2-11ea-ad49-0242ac110003','8a71f32a-31c3-11ea-ad49-0242ac110003','8a71f7fe-31c1-11ea-ad49-0242ac110003','8a71fbf0-31c2-11ea-ad49-0242ac110003','8a7200df-31c3-11ea-ad49-0242ac110003','8a720e5d-31c3-11ea-ad49-0242ac110003','8a721251-31c2-11ea-ad49-0242ac110003','8a7216c2-31c1-11ea-ad49-0242ac110003','8a7221da-31c2-11ea-ad49-0242ac110003','8a722754-31c1-11ea-ad49-0242ac110003','8a723499-31c1-11ea-ad49-0242ac110003','8a72359b-31c2-11ea-ad49-0242ac110003','8a723bd3-31c3-11ea-ad49-0242ac110003','8a724125-31c1-11ea-ad49-0242ac110003','8a725655-31c2-11ea-ad49-0242ac110003','8a725980-31c1-11ea-ad49-0242ac110003','8a72614c-31c3-11ea-ad49-0242ac110003','8a7263ad-31c2-11ea-ad49-0242ac110003','8a726524-31c1-11ea-ad49-0242ac110003','8a726f37-31c3-11ea-ad49-0242ac110003','8a727085-31c2-11ea-ad49-0242ac110003','8a727182-31c1-11ea-ad49-0242ac110003','8a727c8e-31c2-11ea-ad49-0242ac110003','8a727d10-31c3-11ea-ad49-0242ac110003','8a727e27-31c1-11ea-ad49-0242ac110003','8a728b3d-31c2-11ea-ad49-0242ac110003','8a728e0b-31c3-11ea-ad49-0242ac110003','8a729064-31c1-11ea-ad49-0242ac110003','8a729c09-31c1-11ea-ad49-0242ac110003','8a729d80-31c2-11ea-ad49-0242ac110003','8a729e1f-31c3-11ea-ad49-0242ac110003','8a72aae7-31c2-11ea-ad49-0242ac110003','8a72aea2-31c1-11ea-ad49-0242ac110003','8a72b65e-31c3-11ea-ad49-0242ac110003','8a72b8f0-31c2-11ea-ad49-0242ac110003','8a72bced-31c1-11ea-ad49-0242ac110003','8a72d24d-31c3-11ea-ad49-0242ac110003','8a72d95d-31c2-11ea-ad49-0242ac110003','8a72e6a3-31c2-11ea-ad49-0242ac110003','8a7315f1-31c3-11ea-ad49-0242ac110003','8a73267b-31c2-11ea-ad49-0242ac110003','8a73319d-31c3-11ea-ad49-0242ac110003','8a7342dc-31c3-11ea-ad49-0242ac110003','8a734375-31c2-11ea-ad49-0242ac110003','8a734f3a-31c1-11ea-ad49-0242ac110003','8a73603e-31c3-11ea-ad49-0242ac110003','8a73747d-31c1-11ea-ad49-0242ac110003','8a737620-31c3-11ea-ad49-0242ac110003','8a738409-31c1-11ea-ad49-0242ac110003','8a739099-31c3-11ea-ad49-0242ac110003','8a739353-31c1-11ea-ad49-0242ac110003','8a739c9d-31c2-11ea-ad49-0242ac110003','8a73a4bf-31c3-11ea-ad49-0242ac110003','8a73b69a-31c2-11ea-ad49-0242ac110003','8a73b867-31c3-11ea-ad49-0242ac110003','8a73ccfb-31c2-11ea-ad49-0242ac110003','8a73d47b-31c1-11ea-ad49-0242ac110003','8a73d97a-31c3-11ea-ad49-0242ac110003','8a73ea91-31c2-11ea-ad49-0242ac110003','8a73ed18-31c3-11ea-ad49-0242ac110003','8a73fea9-31c3-11ea-ad49-0242ac110003','8a740117-31c1-11ea-ad49-0242ac110003','8a740183-31c2-11ea-ad49-0242ac110003','8a74112c-31c1-11ea-ad49-0242ac110003','8a7411e4-31c2-11ea-ad49-0242ac110003','8a7412b1-31c3-11ea-ad49-0242ac110003','8a741d80-31c1-11ea-ad49-0242ac110003','8a742650-31c2-11ea-ad49-0242ac110003','8a742bdb-31c1-11ea-ad49-0242ac110003');

```
