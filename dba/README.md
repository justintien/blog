Last-Modified: {docsify-updated}

# DBA

`data base administrator`

> 我不是 DBA, 我不是 DBA, 我不是 DBA

## mysql

- [mysql](/dba/mysql.md)

## mongodb

- [mongodb](/dba/mongodb.md)

## sqlite

- [sqlite](/dba/sqlite.md)

## other

- mdb 工具 (將 mdb 轉換為其他 sql syntax)

```sh
# mac install
brew install mdbtools

DB_FILE=20160421

mdb-schema ${DB_FILE}.mdb mysql > sql/schema.sql
for i in $( mdb-tables ${DB_FILE}.mdb ); do echo $i ;  MDB_JET3_CHARSET="big5" mdb-export -D "%Y-%m-%d %H:%M:%S" -H -I mysql ${DB_FILE}.mdb $i > sql/$i.sql; done

# MDB_JET3_CHARSET="big5" mdb-export -I mysql 20160421.mdb MYMONEY_DATA
```

- 如果有人問你數據庫的原理，叫他看這篇文章 http://blog.jobbole.com/100349/
