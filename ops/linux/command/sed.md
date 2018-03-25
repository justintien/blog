```sh
# 取 1~20行
sed -n '1,20p'

# 删除 2~3行
sed '2,3d'

# 删除 3~最后一行
sed '3,$d'

# 取代
tail -n 1 38855.log | sed -e 's/\\\\\\"/"/g' -e 's/\\\\\\"/"/g' > test.log
```