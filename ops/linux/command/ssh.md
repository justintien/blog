# ssh

##

- tunnel

```sh
ssh -TND 1086 <proxy-server>

# 反向 https://ez3c.tw/2043
[userA@ServerA] $ ssh -NfR 2244:192.168.0.125:22 me@MyServer
--------------------------------------------------------------
[me@MyServer] $ netstat -tnl | grep 127.0.0.1
tcp        0      0 127.0.0.1:2244              0.0.0.0:*                   LISTEN  
[me@MyServer] $ ssh userB@127.0.0.1 -p 2244
MyServer連線到本機2244 port會導向到ServerB的ssh port，成功連線到ServerB
```

```shh
# The close the loop here. The answer, in this case, was to force the ssh client to use ipv4. E.g.
ssh -4 -D 8081 user@8.8.8.8

ssh -L 1086:127.0.0.1:1086 <proxy-server>
```
