
##install [phpunit]

[phpunit_video]

- install phpunit
```
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit
phpunit --version
```

- phpunit test file example
```php
namespace com\company;
class something{
    function sum($x,$y){
        return $x+$y;
    }
}
```
```php
use com\company\something;
class somethingTest extends PHPUnit_Framework_TestCase
{
    public function setUp(){
        $this->something=new something();
    }
    public function datas(){
        return [
            [1,1,2],
            [1.5,1.5,3]
        ];
    }
    /**
     * @dataProvider datas
     */
    public function testSomething($x,$y,$sum)
    {
        $this->assertEquals($sum, $this->something->sum($x,$y));
    }
}
```

##install [composer]

- install composer (for autoload classes)
```
#*nix
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
```

- generate config file -> composer.json
```
composer init
```

- generate autoloader files -> vendor/*
```
composer install
```

- update composer autoload files.
```
composer dump-autoload
```

- bootstrap (create phpunit.xml file at the base folder)
```

```
- 


[phpunit]:https://phpunit.de/getting-started.html/
[phpunit_video]:http://www.youtube.com/watch?v=84j61_aI0q8
[composer]:https://getcomposer.org/doc/00-intro.md#installation-nix
