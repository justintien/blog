
修改php.ini

dabian

```sh
nano /etc/php5/apache2/php.ini
//session.gc_maxlifetime = ?
service apache2 restart
```

php檔操作

```php
ini_set('session.gc_maxlifetime',?);
```
