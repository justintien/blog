Last-Modified: {docsify-updated}

# DBA

`data base administrator`

> 我不是 DBA, 我不是 DBA, 我不是 DBA

# db

- [mysql](/dba/mysql.md)
- [mongodb](/dba/mongodb.md)
- [sqlite](/dba/sqlite.md)

## Survey

> 2019/07/24 survey

- http://nosql-database.org/
- https://db-engines.com/en/ranking

## link

- dgraph: https://github.com/dgraph-io/dgraph
- arangoDb https://www.arangodb.com/

> 2018/06

| type | list |
| --- | --- |
| Document store | ArangoDB, Couchbase, BaseX, Clusterpoint, CouchDB, DocumentDB,MarkLogic, IBM Domino, MongoDB,RethinkDB Qizx |
| key-value store (Classical) | ArangoDB, Keyspace, Flare, Aerospike, RAMCloud, SchemaFree,quasardb |
| key-value store (Ordered) | Actord, Lightcloud, FoundationDB,InfinityDB, LMDB, Luxio, NMDB,MemcacheDB, TokyoTyrant |
| Key-value cache | Memcached, Apache Ignite, eXtreme Scale, Hazelcast, Infinispan, JBoss Cache, Coherence, Repcached, Velocity |
| Tuple store  元组 | Coord, Apache River, GigaSpaces |
| Object database | Perst, Objectivity/DB,DB4O, Shoal, ZopeDB |
| Data structures | Redis |
| Wide column store | Bigtable, KAI, Amazon DynamoDB, HBase, Hypertable, Cassandra, Druid, OpenNeptune, KDI, Qbase |
| key-value store (Ordered) | Oracle NoSQL Database, DovetailDB, Riak, Dynomite, Dynamo, Voldemort, SubRecord |

- 2017 的统计 http://lvshen9.coding.me/2017/10/27/%E9%9D%A2%E5%90%91-Java-%E5%BC%80%E5%8F%91%E8%80%85%E7%9A%84-NoSQL-%E9%80%89%E9%A1%B9/
￼

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
