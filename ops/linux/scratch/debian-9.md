# debian-9

> gcp

- 參考: https://yeasy.gitbooks.io/docker_practice/install/debian.html

```sh
# 安裝 docker
sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     lsb-release \
     software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce

# 啟動 docker
sudo systemctl enable docker
sudo systemctl start docker

# run shadowsocks
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

# iptables all port to 10001
sudo iptables -t nat -A PREROUTING -p tcp --dport 10001:65000 -j REDIRECT --to-ports 10001 && sudo iptables-save
# check iptables
sudo iptables -L -n -t nat
# Chain PREROUTING (policy ACCEPT)
# target     prot opt source               destination         
# DOCKER     all  --  0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type LOCAL
# REDIRECT   tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpts
```
