Last-Modified: {docsify-updated}

# node

- [best pratices](https://github.com/i0natan/nodebestpractices)

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

## links

- [我是这样黑进你Node.js生产服务器的](https://zhuanlan.zhihu.com/p/43514079)
- [websoket.io 高并发 实现](https://segmentfault.com/a/1190000008544300)
- [精华 node开发游戏服务器遇到的性能问题](https://cnodejs.org/topic/55a0dff4419f1e8a23a64276)
- [網易遊戲框架](https://github.com/NetEase/pomelo)
- [腾讯 h5](http://gad.qq.com/article/detail/37903)
- 100万并发连接服务器笔记之1M并发连接目标达成 www.blogjava.net/yongboy/archive/2013/04/11/397677.html
- 单机千万并发连接实战 https://zhuanlan.zhihu.com/p/21378825
- TCP/IP 应用程序的通信连接模式 https://www.ibm.com/developerworks/cn/aix/library/0807_liugb_tcpip/#ibm-pcon
- [cool node game engine](https://github.com/RanvierMUD/ranviermud)