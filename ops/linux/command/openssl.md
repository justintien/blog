# openssl

## example

```sh
openssl s_client -connect www.nutsbp.com:443
```

```sh
# openssl shell 检验 ssl 证书过期时间
echo | openssl s_client -servername az.cdn.nutsbp.com -connect az.cdn.nutsbp.com:443 2>/dev/null | openssl x509 -noout -dates
```

```sh
# decode cert
openssl x509 -in fullchain.cer -text -noout
```

## test iOS 证书

```sh
# test 证书

# 正式
openssl s_client -connect gateway.push.apple.com:2195 -cert nutsbp_prod.pem

# 测试 sandbox
openssl s_client -connect gateway.sandbox.push.apple.com:2195 -cert nutsbp_sandbox.pem
```

1. Export from Firefox/IE (**If there are key usages use Digital Signature  from RFC) or run certmgr.msc in Windows.
2. The resulting pcks12 (.pfx, .p12) can be converted to PEM format openssl pkcs12 -in <.p12 filename> -out <new pem cert filename> -nodes
3. export the private key from the pkcs12 with the -nocerts flag openssl pkcs12 -in <.p12 filename> -out <key pem key filename> -nodes -nocerts
4. test with openssl s_client


```js
Buffer.from(base64_encode, ‘base64’)
fs.writeFile("ios.p12", a, "binary")
```