
##install [phpunit]

[phpunit_video]

- install phpunit
```
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit
phpunit --version
```

- install [composer]

- create phpunit.xml file (bootstrap to avoid include vendor/autoload.php)
```
<?xml version="1.0" encoding="UTF-8"?>
<phpunit backupGlobals="false"
         backupStaticAttributes="false"
         bootstrap="vendor/autoload.php"
         colors="true"
         convertErrorsToExceptions="true"
         convertNoticesToExceptions="true"
         convertWarningsToExceptions="true"
         processIsolation="false"
         stopOnFailure="false"
         syntaxCheck="false">
    <testsuites>
        <testsuite name="a test">
            <directory suffix=".php">./path/to/test/folder/</directory>
        </testsuite>
    </testsuites>
</phpunit>
```

- phpunit test file example
```php
//the file need to be tested
namespace com\company;
class something{
    function sum($x,$y){
        return $x+$y;
    }
}
```
```php
//the test file
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

- run test
```
phpunit
```

[phpunit]:https://phpunit.de/getting-started.html/
[phpunit_video]:http://www.youtube.com/watch?v=84j61_aI0q8
[composer]:https://github.com/up9cloud/blog/blob/master/installation/%E5%AE%89%E8%A3%9Dcomposer.md
