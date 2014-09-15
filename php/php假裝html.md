
####debian method

修改/etc/apache2/mods-enabled/php5.conf
```sh
<FilesMatch ".+\.html$">
  SetHandler application/x-httpd-php
</FilesMatch>
```
