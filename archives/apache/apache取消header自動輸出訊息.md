
#取消apache回應的header帶的訊息

Server:Apache/2.2.22 (Debian)
=> Server:Apache
無法再減少...
```
#修改apache.conf
#debian預設在/etc/apache2/apache2.conf
#新增一行
ServerTokens ProductOnly
```

#取消原本apache回應的錯誤訊息會帶版本訊息

```
#修改apache.conf
#debian預設在/etc/apache2/apache2.conf
#新增一行
ServerSignature Off
```

#取消apache回應的header帶php訊息

X-Powered-By: PHP/5.3.7
```
#修改php.ini
#debian預設在/etc/php5/apache2/php.ini(/etc/php5/cli/php.ini)
expose_php = Off
```

#加層保險
```
<IfModule mod_headers.c>
  Header unset Server
  Header unset X-Powered-By
</IfModule>  
```
