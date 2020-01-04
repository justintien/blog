Last-Modified: {docsify-updated}

# top

## example

```sh
top
```

# top 解釋

  Cpu(s):  0.0%us,  0.5%sy,  0.0%ni, 99.5%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st


 I try to explain  these:
  us: is meaning of "user CPU time"
  sy: is meaning of "system CPU time"
  ni: is meaning of" nice CPU time"
  id: is meaning of "idle"
  wa: is meaning of "iowait" 
  hi：is meaning of "hardware irq"
  si : is meaning of "software irq"
  st : is meaning of "steal time"


  us 用户空间占用CPU百分比
  sy 内核空间占用CPU百分比
  ni 用户进程空间内改变过优先级的进程占用CPU百分比
  id 空闲CPU百分比
  wa 等待输入输出的CPU时间百分比
  hi 硬件中断
  si 软件中断 
  st: 实时

https://www.kernel.org/doc/Documentation/ABI/testing/procfs-diskstats

https://lenciel.com/2014/02/hunting-the-iowait-problem-maker/

# while true; do date; ps auxf | awk '{if($8=="D") print $0;}'; sleep 1; done > /var/log/ps.log

nohup /path/to/your/script.sh > /dev/null 2>&1 &

