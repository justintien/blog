
##debian method

啟用mod
```
a2enmod include
```

修改.htaccess
```
Options +Includes
#附檔名可改任意(php也支援)
AddOutputFilter INCLUDES .shtml
```
