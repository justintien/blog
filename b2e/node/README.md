# node

> http.createServer

```js
// 长连接测试
var http = require('http');

let server = http.createServer(function (request, response){
}).listen(3000);

// timeout 设 10分钟
server.setTimeout(10 * 60 * 1000);
```

> nginx 要设超时

```nginx
# see https://skyao.gitbooks.io/learning-nginx/content/documentation/keep_alive.html

# 超过 240 秒 会 504 timeout
# default: 120s;
keepalive_timeout  240s;
proxy_connect_timeout 240s;
proxy_read_timeout 240s;
```