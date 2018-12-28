Last-Modified: {docsify-updated}

# node

> blog

- https://github.com/nswbmw/N-blog

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

> proof of work example
```js
const createHash = require('crypto').createHash
function work(input, zeroString = '000') {
  let id = 0;
  let begin = +new Date()
  while (true) {
    let nonce = id.toString(16);

    let sha256 = createHash('sha256');
    sha256.update(input);
    sha256.update(nonce);
    let hex = sha256.digest('hex')
    if (hex.substring(0, zeroString.length) === zeroString) {
        let end = +new Date()
        console.log(end, begin, end-begin +'ms')
        return nonce;
    } else {
        id++;
    }
  }
}

crypto.createHash('sha256').update('10').digest('hex')
```