Last-Modified: {docsify-updated}

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

### 慢查詢 @see http://yucanghai.blog.51cto.com/5260262/1705195
```js
// 0：關閉，不收集任何數據。
// 1：收集慢查詢數據，默認是100毫秒。
// 2：收集所有數據
// #查看狀態：級別和時間
db.getProfilingStatus()
{ "was" : 1, "slowms" : 200 }
// #查看級別
db.getProfilingLevel()
// #設置級別
db.setProfilingLevel(2)
// { "was" : 1, "slowms" : 100, "ok" : 1 }
// #設置級別和時間
db.setProfilingLevel(1,200)
// { "was" : 2, "slowms" : 100, "ok" : 1 }
```


### aggregate

```js
// 找出 重複的數據
db.all.aggregate([
    {
        $match: {
            _type: 'xxx'
        }
    },
    {
        $group: { 
            _id: { account: "$account" },
            uniqueIds: { $addToSet: "$_id" },
            count: { $sum: 1 } 
        }
    }, 
    {
        $match: { 
            count: { $gt: 1 } 
        }
    }
])
```