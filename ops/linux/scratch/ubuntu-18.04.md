Last-Modified: {docsify-updated}

# ubuntu-18.04

> gcp/linode

```sh
#!/bin/bash

sudo apt update
# install docker (current: Docker version 19.03.6)
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
sudo su
mkdir -p /etc/v2ray && echo '
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

- wireguard (https://www.wireguard.com/install/)

```sh
# install
sudo add-apt-repository ppa:wireguard/wireguard && sudo apt-get update && sudo apt-get install wireguard -y

# ref: https://www.linode.com/docs/networking/vpn/set-up-wireguard-vpn-on-ubuntu/
# configure
umask 077
wg genkey | tee privatekey | wg pubkey > publickey

# Create the file /etc/wireguard/wg0.conf and add the contents indicated below. You’ll need to enter your server’s private key in the PrivateKey field, and its IP addresses in the Address field.
sudo vim /etc/wireguard/wg0.conf

[Interface]
PrivateKey = <Private Key>
Address = 10.140.0.1/24, fd86:ea04:1115::1/64
ListenPort = 51820
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -A POSTROUTING -o ens4 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -D POSTROUTING -o ens4 -j MASQUERADE
SaveConfig = true

# Add client
sudo wg set wg0 peer <Public Key> allowed-ips 10.140.0.20

# Allow SSH connections and WireGuard’s VPN port:
sudo ufw allow 22/tcp
sudo ufw allow 51820/udp
sudo ufw enable

# Verify the settings:
sudo ufw status verbose

# Start wireguard
wg-quick up wg0
# Enable the Wireguard service to automatically restart on boot:
sudo systemctl enable wg-quick@wg0
# Check if the VPN tunnel is running with the following two commands:
sudo wg show
ifconfig wg0

# Allow forward
sudo sysctl net.ipv4.ip_forward=1
sudo nano /etc/sysctl.conf
# ^W -> #net.ipv4.ip_forward=1 -> Uncomment -> Save

# Run sysctl -p to make the changes take effect immediatly:
sysctl -p

# Verify the settings:
sysctl net.ipv4.ip_forward

# server: test ping client
ping 10.140.0.20
```
