# nslookup

## example

- DNS污染验证方法: 由于144.223.234.234不存在，理应没有任何返回。但我们却得到了一个错误的IP（不确定）。即可证明这个域名已经被DNS污染了。

```sh
nslookup www.google.com 144.223.234.234
```


```sh
nslookup myip.opendns.com resolver1.opendns.com
```