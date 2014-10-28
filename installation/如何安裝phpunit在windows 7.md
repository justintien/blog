<!-- tags: php phpunit win7-->

- 先要有php (可安裝[wamp][wamp server])

- 為方便將php路徑加入path，以便直接使用php指令。
```ps
C:\wamp\bin\php\php5.5.12
```

- 下載 [phpunit.phar] 至php資料夾
```ps
C:\wamp\bin\php\php5.5.12
```

- 為求方便在資料夾下新增一個檔案為phpunit.bat
```ps
"%~dp0php.exe" "%~dp0phpunit.phar" %*
```

- 檢查phpunit安裝成功否
```ps
phpunit --version
```

[wamp server]:http://www.wampserver.com/en/
[pear]:http://pear.php.net/go-pear.phar
[install pear]:http://www.viper007bond.com/2012/08/21/installing-phpunit-on-windows/
[phpunit.phar]:https://phar.phpunit.de/phpunit.phar
[install phpunit]:http://nishutayaltech.blogspot.in/2011/04/installing-phpunit-on-windows.html
