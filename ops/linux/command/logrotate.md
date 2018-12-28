Last-Modified: {docsify-updated}


其中 daily 表示每天整理，也可以改成 weekly 或 monthly
dateext 表示檔案補上 rotate 的日期
missingok 表示如果找不到 log 檔也沒關係
rotate 7 表示保留65535份
compress 表示壓縮起來，預設用 gzip。不過如果硬碟空間多，不壓也沒關係。
delaycompress 表示延後壓縮直到下一次 rotate
notifempty 表示如果 log 檔是空的，就不 rotate
copytruncate 先複製 log 檔的內容後，在清空的作法，因為有些程式一定 log 在本來的檔名，例如 rails。另一種方法是 create。

設定好之後，可以等明天，或是執行 /usr/sbin/logrotate -f /etc/logrotate.conf 看看。


## bpe logrotate docker-container 测试
```sh
vim /etc/logrotate.d/docker-container
/var/lib/docker/containers/*/*.log {
  rotate 7
  daily
  compress
  size=100M
  missingok
  delaycompress
  copytruncate
}

# test
logrotate -fv /etc/logrotate.d/docker-container
```

```sh
vim /etc/logrotate.d/nutsbp-editor-server
/data/log/nutsbp-editor-server/*.log {
  rotate 3
  weekly
  dateext
  compress
  size=100M
  missingok
  delaycompress
  copytruncate
}

# test
logrotate -fv /etc/logrotate.d/nutsbp-editor-server
```
