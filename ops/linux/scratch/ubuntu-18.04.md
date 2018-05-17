# ubuntu-18.04

> linode

```sh
#!/bin/bash

# install docker (current: 17.12.1-ce)
apt install docker.io -y
# install docker-compose: (current: 1.17.1)
apt install docker-compose -y

# run shadowsocks
NAME=shadowsocks
PORT=10443
PASSWORD=test
METHOD=aes-256-cfb

docker run \
-d \
--name ${NAME} \
--restart=always \
-p ${PORT}:${PORT} \
jiapantw/shadowsocks-alpine -s 0.0.0.0 -p ${PORT} -k ${PASSWORD} -m ${METHOD}
```

> gcp

```sh
#!/bin/bash

sudo apt update
# install docker (current: 17.12.1-ce)
sudo apt install docker.io -y
# install docker-compose: (current: 1.17.1)
sudo apt install docker-compose -y

# run shadowsocks
NAME=shadowsocks
PORT=10443
PASSWORD=test
METHOD=aes-256-cfb

docker run \
-d \
--name ${NAME} \
--restart=always \
-p ${PORT}:${PORT} \
jiapantw/shadowsocks-alpine -s 0.0.0.0 -p ${PORT} -k ${PASSWORD} -m ${METHOD}
```