今天研究下計算session數量

達到簡易快速計算線上人數

卻遇到檔案權限問題...


php在debian預設的資料夾為/var/lib/php5
session檔案都是sess_開頭，

一開始使用shell指令想直接抓出量

```bash
ls /var/lib/php5/sess_*|wc -l
```

用root運作良好，but變成php

```php
$session_count=\exec('ls /var/lib/php5/sess_*|wc -l');
```

馬上因為權限問題掰掰。

查了一堆資料，session本來就設定不給www-data使用

我也不想隨便改資料夾權限
就用其他方式解

- 寫一隻shell檔名給session_count.sh
我放在/var下
```sh
ls /var/lib/php5/sess_*|wc -l
```

記得給執行
```
chmod u+x /var/session_count.sh
```

安裝sudo
```sh
apt-get install sudo
```

編輯sudoers
```
visudo
```

加上此行
```
www-data ALL = (root) NOPASSWD: /var/session_count.sh
```

之後在php內招換
```
$online_count = \exec("sudo /var/session_count.sh 2>&1");
if (!preg_match('/^\d+$/', $online_count)) {
	$online_count = -1;
}
```

就得到session數量啦！
