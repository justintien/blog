Last-Modified: {docsify-updated}

# mysqldump

## 一些指令

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