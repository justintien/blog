# mongodb

## dump & restore
- refs:
  - https://docs.mongodb.com/manual/tutorial/backup-and-restore-tools/
  - https://www.mongodb.com/blog/post/archiving-and-compression-in-mongodb-tools

```sh
# example
mongodump -h 127.0.0.1 -d db -u test -p test -o ./output

mongorestore -d db --drop /output
```

### find
http://blog.fens.me/nodejs-mongodb-regexp/

### php sql to mongo
http://php.net/manual/en/mongo.sqltomongo.php

### 慢查询 @see http://yucanghai.blog.51cto.com/5260262/1705195
```js
// 0：关闭，不收集任何数据。
// 1：收集慢查询数据，默认是100毫秒。
// 2：收集所有数据
// #查看状态：级别和时间
db.getProfilingStatus()
{ "was" : 1, "slowms" : 200 }
// #查看级别
db.getProfilingLevel()
// #设置级别
db.setProfilingLevel(2)
// { "was" : 1, "slowms" : 100, "ok" : 1 }
// #设置级别和时间
db.setProfilingLevel(1,200)
// { "was" : 2, "slowms" : 100, "ok" : 1 }
```
