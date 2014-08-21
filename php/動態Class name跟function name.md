
```php
class A{
	function B(){
		echo 'Hello';
	}
	static function C(){
	  echo 'World';
	}
}
$classname=  'A';
$funcname='B';

(new $classname)->$funcname();

$funcname='C';
$classname::$funcname();
```
