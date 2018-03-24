
修改php.ini

dabian

```sh
nano /etc/php5/apache2/php.ini

session.gc_probability = ?
session.gc_divisor = ?
session.gc_maxlifetime = ?
service apache2 restart
```

php檔操作

```php
//觸發gc比例 a/b
ini_set('session.gc_probability',a);
ini_set('session.gc_divisor',b)
//多久開始觸發 ?
ini_set('session.gc_maxlifetime',?);
```
