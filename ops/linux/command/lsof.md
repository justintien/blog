Last-Modified: {docsify-updated}

# lsof

```sh
# 查看當前所有監聽的端口以及對應的Command和PID
lsof -nP -iTCP -sTCP:LISTEN

# 查看指定端口對應的Command和PID
lsof -nP -iTCP:4000 -sTCP:LISTEN

# 輸出佔用該端口的 PID
lsof -nP -iTCP:4000 |grep LISTEN|awk '{print $2;}'
```