Last-Modified: {docsify-updated}

# lsof

```sh
# 查看当前所有监听的端口以及对应的Command和PID
lsof -nP -iTCP -sTCP:LISTEN

# 查看指定端口对应的Command和PID
lsof -nP -iTCP:4000 -sTCP:LISTEN

# 输出占用该端口的 PID
lsof -nP -iTCP:4000 |grep LISTEN|awk '{print $2;}'
```