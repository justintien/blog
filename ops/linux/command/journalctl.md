Last-Modified: {docsify-updated}

# journalctl

> systemd/Journal (简体中文): https://wiki.archlinux.org/index.php/Systemd/Journal_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

## 基本命令

```sh
# 查看有错误的
journalctl -ex

# 重启数次观察日志记录结果
journalctl --list-boots
# 最近一次
journalctl -b 0

# Just use the journalctl command, as in:
journalctl -u service-name.service

# Or, to see only log messages for the current boot:
journalctl -u service-name.service -b

# For things named <something>.service, you can actually just use <something>, as in:
journalctl -u service-name

# 從最新的開始  -r 反向
journalctl -u service-name.service -r

journalctl -b --unit systemd-journald

# 查詢日誌佔的空間
journalctl --disk-usage
```

> list units & times

```sh
systemctl list-unit-files --type=service --all --state=enabled
systemctl list-timers --all
curl -Lso- bench.sh | bash
```

## systemd-journald 耗 disk io 盤查

https://forum.manjaro.org/t/solved-very-high-hard-disk-writing-by-systemd-journald/13919/2

What is it writing into the journals?
This could be the result of a primary issue flooding the journal logs with error or warning messages.

What does journalctl -xn output?
journalctl -xn 

Are there any errors in your kernel log? You can check using dmesg.
You can adjust the level of detail logged in your journals, and your max journal size /etc/systemd/journald.conf.
I changed these settings in mine.
```
SystemMaxUse=50M
MaxLevelStore=err
MaxLevelSyslog=warning
MaxLevelKMsg=warning
MaxLevelConsole=err
```

Also, if you journal logs are reaching the 4GB maximum, you can shrink them using

# 手动清理日志

sudo journalctl --vacuum-size=50M

Or use a size of your choosing.

http://www.fepede.net/blog/2016/10/managing-systemd-journald-disk-usage/

https://askubuntu.com/questions/1094389/what-is-the-use-of-systemd-journal-flush-service
sudo journalctl --vacuum-size=1G --vacuum-time=5d --vacuum-files=5 
systemd攻略
https://www.jianshu.com/p/8b3fba13fcad

## issue

https://github.com/coreos/bugs/issues/990
 
