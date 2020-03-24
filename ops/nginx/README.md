Last-Modified: {docsify-updated}

# nginx

> 最好用最輕量的代理 服務器

location [ = | ~ | ~* | ^~ ] uri { ... }
location @name { ... }


* = 表示精确匹配。只有请求的url路径与后面的字符串完全相等时，才会命中。
* ~ 表示该规则是使用正则定义的，区分大小写。
* ~* 表示该规则是使用正则定义的，不区分大小写。
* ^~ 表示如果该符号后面的字符是最佳匹配，采用该规则，不再进行后续的查找。

## 常見問題

- [Nginx錯誤日誌與優化專題](http://www.cnblogs.com/tinywan/p/6777592.html)
- [Nginx常見的錯誤及解決方法](http://blog.51cto.com/nanchunle/1657410)
- nginx 1.11.6 104: Connection reset by peer (防火牆 issue or other)
- [Connection reset](https://theantway.com/2017/11/analyze-connection-reset-error-in-nginx-upstream-with-keep-alive-enabled)
