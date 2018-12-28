Last-Modified: {docsify-updated}

# ps

### BSD style - The options in bsd style syntax are not preceded with a dash.
```
ps aux
```

### UNIX/LINUX style - The options in linux style syntax are preceded by a dash as usual.
```
ps -ef
```

### How to use ps command
- Display all processes
```
ps aux
ps -ef -f
```
-  Display process by user
```
ps -f -u www-data
```
- Show process by name or process id
```
ps -C apache2
ps -f  -p 3150,7298,6544
ps -ef | grep apache
```
- Sort process by cpu or memory usage
```
ps aux --sort=-pcpu,+pmem
```

```
// Display the top 5 processes consuming most of the cpu.
ps aux --sort=-pcpu | head -5
```

- Display process hierarchy in a tree style
```
ps -f --forest -C apache2
```

- Display child processes of a parent process
```
ps -o pid,uname,comm -C apache2
ps --ppid 2359
```

- Display threads of a process
```
ps -p 3150 -L
```

- Change the columns to display
```
ps -e -o pid,uname,pcpu,pmem,comm
ps -e -o pid,uname=USERNAME,pcpu=CPU_USAGE,pmem,comm
```

- Display elapsed time of processes
```
ps -e -o pid,comm,etime
```

- Turn ps into an realtime process viewer
```
watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15'
```

[原文]:http://www.binarytides.com/linux-ps-command/


### 重要
- 列出類似程式樹的程式顯示
    + 命令：ps -axjf

[原文2]:http://jashliao.pixnet.net/blog/post/165105774-%E6%AF%8F%E5%A4%A9%E4%B8%80%E5%80%8Blinux%E6%8C%87%E4%BB%A4--ps-%E6%8C%87%E4%BB%A4(%E5%88%97%E5%87%BA%E7%B3%BB%E7%B5%B1%E4%B8%AD%E7%95%B6%E5%89%8D%E9%81%8B
