# nc

- [使用 nc (Netcat) 建立傳送資料的 socket server](https://blog.longwin.com.tw/2012/02/nc-data-send-socket-server-2012/)

- example:

```sh
# coreos
# alias ncs="docker run -t --rm --network=host --name=ncs subfuzion/netcat -vl"
# alias nc="docker run -i --rm --network=host --name=nc subfuzion/netcat localhost"
# docker run -i --rm --network=host --name=nc subfuzion/netcat -l -p "$port" 2>/dev/null && break 2
```
