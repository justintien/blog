Last-Modified: {docsify-updated}

# DBA

`data base administrator`

> 我不是 DBA, 我不是 DBA, 我不是 DBA

## 設計概念

- [mysql web數據庫的設計歸範-1命名規範 原](https://my.oschina.net/dongzerun/blog/289664)
- [MySql數據庫設計總結](https://mp.weixin.qq.com/s/oFFoVN_P3FGj7yUeRN-fpQ)
- [如何為標籤雲設計MySql表？](http://osask.cn/front/ask/view/524948)
- [mysql processlist](http://www.ywnds.com/?p=9337)


##### other

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
