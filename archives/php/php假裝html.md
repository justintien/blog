
####debian method

修改/etc/apache2/mods-enabled/php5.conf
增加以下幾行
```sh
<FilesMatch ".+\.html$">
  SetHandler application/x-httpd-php
</FilesMatch>
```
