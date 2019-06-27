Last-Modified: {docsify-updated}

# nslookup

## example

- DNS汙染驗證方法: 由於144.223.234.234不存在，理應沒有任何返回。但我們卻得到了一個錯誤的IP（不確定）。即可證明這個域名已經被DNS汙染了。

```sh
nslookup www.google.com 144.223.234.234
```


```sh
nslookup myip.opendns.com resolver1.opendns.com
```