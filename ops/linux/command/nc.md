# nc

- example:

```sh
# coreos
# alias ncs="docker run -t --rm --network=host --name=ncs subfuzion/netcat -vl"
# alias nc="docker run -i --rm --network=host --name=nc subfuzion/netcat localhost"
# docker run -i --rm --network=host --name=nc subfuzion/netcat -l -p "$port" 2>/dev/null && break 2
```
