Last-Modified: {docsify-updated}

# node

- [best pratices](https://github.com/i0natan/nodebestpractices)

> blog

- https://github.com/nswbmw/N-blog

> http.createServer

```js
// 長連接測試
var http = require('http');

let server = http.createServer(function (request, response){
}).listen(3000);

// timeout 設 10分鐘
server.setTimeout(10 * 60 * 1000);
```

> nginx 要設超時

```nginx
# see https://skyao.gitbooks.io/learning-nginx/content/documentation/keep_alive.html

# 超過 240 秒 會 504 timeout
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

- [我是這樣黑進你Node.js生產服務器的](https://zhuanlan.zhihu.com/p/43514079)
- [websoket.io 高併發 實現](https://segmentfault.com/a/1190000008544300)
- [精華 node開發遊戲服務器遇到的性能問題](https://cnodejs.org/topic/55a0dff4419f1e8a23a64276)
- [網易遊戲框架](https://github.com/NetEase/pomelo)
- [騰訊 h5](http://gad.qq.com/article/detail/37903)
- 100萬併發連接服務器筆記之1M併發連接目標達成 www.blogjava.net/yongboy/archive/2013/04/11/397677.html
- 單機千萬併發連接實戰 https://zhuanlan.zhihu.com/p/21378825
- TCP/IP 應用程序的通信連接模式 https://www.ibm.com/developerworks/cn/aix/library/0807_liugb_tcpip/#ibm-pcon
- [cool node game engine](https://github.com/RanvierMUD/ranviermud)