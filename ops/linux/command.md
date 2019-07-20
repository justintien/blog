Last-Modified: {docsify-updated}

# command

## 我接觸 Ops 時, linux 常用指令

> 其實 google "linux 常用指令" 應該會有相當多的文章，這邊寫的主要是我在做 Ops 時，常用的指令。

- [ab](/ops/linux/command/ab.md#ab)
  - 壓力測試時可用
- [at](/ops/linux/command/at.md#at)
  - 想要執行一次性任務，又不想排入 crontab 時可用
- [curl](/ops/linux/command/curl.md#curl)
  - call api
- date: (e.g. 昨天: `date -d "$date -1 days" +"%Y/%m/%d"`)
- [dig](/ops/linux/command/dig.md#dig)
  - dns 正/反查詢, 網域詢問 TXT, A 記錄 等等時可用
- [docker](/ops/linux/command/docker.md#docker)
  - docker 容器指令，其實去官網看文檔比較恰當的，這裡列出我常用的
- [du](/ops/linux/command/du.md#du)
  - 查詢 disk 使用量
- [grap](/ops/linux/command/grep.md#grep)
  - 查詢 log 內容的好能手 (當然能不必看 log 更佳)
- [gz](/ops/linux/command/gz.md#gz)
- [jq](/ops/linux/command/jq.md#jq)
  - 觀看 json format log 的好能手 (json parser)
- [ln](/ops/linux/command/ln.md#ln)
- [logrotate](/ops/linux/command/logrotate.md#logrotate)
  - 將 log 檔案自動分類切檔好工具 (但最終目錄是直接將 log 打到像是 elasticsearch)
- [ls](/ops/linux/command/ls.md#ls)
  - 查詢目錄列表、檔案屬性就用它
- [nc](/ops/linux/command/nc.md#nc)
- [netstat](/ops/linux/command/netstat.md#netstat)
  - 查詢網路連線狀態 tcp/udp 和使用的端口
- [nslookup](/ops/linux/command/nslookup.md#nslookup)
- [openssl](/ops/linux/command/openssl.md#openssl)
- [ps](/ops/linux/command/ps.md#ps)
  - 執行程序
- [rsync](/ops/linux/command/rsync.md#rsync)
  - 複製檔案 to 遠端
- [scp](/ops/linux/command/scp.md#scp)
  - 複製檔案 from ssh 遠端
- [sed](/ops/linux/command/sed.md#sed)
- [sh](/ops/linux/command/sh.md#sh)
- [ssh-keygen](/ops/linux/command/ssh-keygen.md)
- [stat](/ops/linux/command/stat.md)
- [telnet](/ops/linux/command/telnet.md#telnet)
- [time](/ops/linux/command/time.md#time)
  - 一個 command 的執行時間
- [timeout](/ops/linux/command/timeout.md#timeout)
  - 設定一個 command 的 timeout
- [tmux](/ops/linux/command/tmux.md#tmux)
  - 多視窗 command line 作業怎麼能沒有它 (還包含了儲存工作狀態)
- [top](/ops/linux/command/top.md#top)
- [tree](/ops/linux/command/tree.md#tree)
- [truncate](/ops/linux/command/truncate.md#truncate)
- [vim](/ops/linux/command/vim.md#vim)
- [watch](/ops/linux/command/watch.md#watch)

> 若想看更多 linux 指令, see:

- [linux 命令大全](http://man.linuxde.net/)

> 如何查詢 Linux 的發行版名稱與版本？ https://blog.gtwang.org/linux/find-linux-distribution-name-version-number/