Last-Modified: {docsify-updated}

# DBA

`data base administrator`

> 我不是 DBA, 我不是 DBA, 我不是 DBA

## 设计概念

- [mysql web数据库的设计归范-1命名规范 原](https://my.oschina.net/dongzerun/blog/289664)
- [MySql数据库设计总结](https://mp.weixin.qq.com/s/oFFoVN_P3FGj7yUeRN-fpQ)
- [如何为标签云设计MySql表？](http://osask.cn/front/ask/view/524948)
- [mysql processlist](http://www.ywnds.com/?p=9337)


##### other

- mdb 工具 (将 mdb 转换为其他 sql syntax)

```sh
# mac install
brew install mdbtools

DB_FILE=20160421

mdb-schema ${DB_FILE}.mdb mysql > sql/schema.sql
for i in $( mdb-tables ${DB_FILE}.mdb ); do echo $i ;  MDB_JET3_CHARSET="big5" mdb-export -D "%Y-%m-%d %H:%M:%S" -H -I mysql ${DB_FILE}.mdb $i > sql/$i.sql; done
```