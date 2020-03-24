# mysql  join vs subquery vs exists

> explain: join & subquery 一樣, exists 不一樣

```sql
mysql> explain select * from t_student_summary where c_user in (select c_user from t_marketer_binding where c_marketer = 'xxx');
+----+-------------+--------------------+------------+------+---------------+--------+---------+-----------------------------------------+------+----------+-------------+
| id | select_type | table              | partitions | type | possible_keys | key    | key_len | ref                                     | rows | filtered | Extra       |
+----+-------------+--------------------+------------+------+---------------+--------+---------+-----------------------------------------+------+----------+-------------+
|  1 | SIMPLE      | t_marketer_binding | NULL       | ALL  | uk_user       | NULL   | NULL    | NULL                                    |    3 |    33.33 | Using where |
|  1 | SIMPLE      | t_student_summary  | NULL       | ref  | k_user        | k_user | 144     | d_popcorn_dev.t_marketer_binding.c_user |    1 |   100.00 | NULL        |
+----+-------------+--------------------+------------+------+---------------+--------+---------+-----------------------------------------+------+----------+-------------+
2 rows in set, 1 warning (0.00 sec)

mysql> explain select * from t_student_summary left join t_marketer_binding on t_student_summary.c_user = t_marketer_binding.c_user where t_marketer_binding.c_marketer = 'xxx';
+----+-------------+--------------------+------------+------+---------------+--------+---------+-----------------------------------------+------+----------+-------------+
| id | select_type | table              | partitions | type | possible_keys | key    | key_len | ref                                     | rows | filtered | Extra       |
+----+-------------+--------------------+------------+------+---------------+--------+---------+-----------------------------------------+------+----------+-------------+
|  1 | SIMPLE      | t_marketer_binding | NULL       | ALL  | uk_user       | NULL   | NULL    | NULL                                    |    3 |    33.33 | Using where |
|  1 | SIMPLE      | t_student_summary  | NULL       | ref  | k_user        | k_user | 144     | d_popcorn_dev.t_marketer_binding.c_user |    1 |   100.00 | NULL        |
+----+-------------+--------------------+------------+------+---------------+--------+---------+-----------------------------------------+------+----------+-------------+
2 rows in set, 1 warning (0.00 sec)

mysql> explain select * from t_student_summary where exists (select * from t_marketer_binding where c_user = t_student_summary.c_user and c_marketer = 'xxx');
+----+--------------------+--------------------+------------+--------+---------------+---------+---------+----------------------------------------+------+----------+-------------+
| id | select_type        | table              | partitions | type   | possible_keys | key     | key_len | ref                                    | rows | filtered | Extra       |
+----+--------------------+--------------------+------------+--------+---------------+---------+---------+----------------------------------------+------+----------+-------------+
|  1 | PRIMARY            | t_student_summary  | NULL       | ALL    | NULL          | NULL    | NULL    | NULL                                   |    4 |   100.00 | Using where |
|  2 | DEPENDENT SUBQUERY | t_marketer_binding | NULL       | eq_ref | uk_user       | uk_user | 144     | d_popcorn_dev.t_student_summary.c_user |    1 |    33.33 | Using where |
+----+--------------------+--------------------+------------+--------+---------------+---------+---------+----------------------------------------+------+----------+-------------+
2 rows in set, 2 warnings (0.00 sec)

```