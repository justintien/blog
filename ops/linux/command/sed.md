Last-Modified: {docsify-updated}

```sh
# 取 1~20行
sed -n '1,20p'

# 刪除 2~3行
sed '2,3d'

# 刪除 3~最後一行
sed '3,$d'

# 取代
tail -n 1 38855.log | sed -e 's/\\\\\\"/"/g' -e 's/\\\\\\"/"/g' > test.log
```