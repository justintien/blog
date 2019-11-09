Last-Modified: {docsify-updated}

# openssl

## example

```sh
openssl s_client -connect jiapan.tw:443
```

```sh
# openssl shell 檢驗 ssl 證書過期時間
domain=jiapan.tw
echo | openssl s_client -servername $domain -connect $domain:443 2>/dev/null | openssl x509 -noout -dates
```

```sh
# decode cert
openssl x509 -in fullchain.cer -text -noout

# see 證書有效期限
openssl x509 -dates -noout -in fullchain.cer

```

## test iOS 證書

```sh
# test 證書

# 正式
openssl s_client -connect gateway.push.apple.com:2195 -cert nutsbp_prod.pem

# 測試 sandbox
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
