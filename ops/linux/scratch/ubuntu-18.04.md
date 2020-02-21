Last-Modified: {docsify-updated}

# ubuntu-18.04

> linode

```sh
#!/bin/bash

# install docker (current: 17.12.1-ce)
apt install docker.io -y
# install docker-compose: (current: 1.17.1)
apt install docker-compose -y
```

> gcp

```sh
#!/bin/bash

sudo apt update
# install docker (current: 17.12.1-ce)
sudo apt install docker.io -y
# install docker-compose: (current: 1.17.1)
sudo apt install docker-compose -y

# sudo apt update && sudo apt install docker.io -y
```

## run services

- shadowsocks

```sh
# shadowsocks server
NAME=shadowsocks
PORT=10001
PASSWORD=test
METHOD=aes-256-gcm

sudo docker run \
-d \
--name ${NAME} \
--restart=always \
-e PASSWORD=${PASSWORD} \
-e METHOD=${METHOD} \
-p ${PORT}:8388 \
-p ${PORT}:8388/udp \
shadowsocks/shadowsocks-libev

# sudo iptables -t nat -A PREROUTING -p tcp --dport 10001:65000 -j REDIRECT --to-ports 10001 && sudo iptables-save
```

- v2ray

```sh
# need root
sudo su -
sudo echo '
{
  "log" : {
    "access": "/var/log/v2ray/access.log",
    "error": "/var/log/v2ray/error.log",
    "loglevel": "warning"
  },
  "inbounds": [{
    "port": 8001,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "60ca58e9-003e-4c01-98de-c2223ae49153",
          "level": 1,
          "alterId": 64
        }
      ]
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
' >> /etc/v2ray/config.json

PORT=9999

sudo docker run \
-d \
--name v2ray${PORT} \
-v /etc/v2ray:/etc/v2ray \
-p ${PORT}:8001 \
v2ray/official \
v2ray -config=/etc/v2ray/config.json
```
