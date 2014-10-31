<!-- tag: windows linux composer-->

- install composer (for autoload classes)

[composer installation linux]
```
#*nix
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
```

[composer installation windows]
```
#windows
若使用Composer-Setup.exe安裝檔安裝
可用where composer查詢path
應在C:\ProgramData\ComposerSetup\bin\下
```

- go to project folder
```
cd /path/to/project
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

[composer installation windows]:https://getcomposer.org/doc/00-intro.md#installation-windows
[composer installation linux]:https://getcomposer.org/doc/00-intro.md#installation-nix
