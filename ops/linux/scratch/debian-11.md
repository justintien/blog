# debian-9

> gcp

- ref: https://docs.docker.com/engine/install/debian/

```sh
# 安裝 docker
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

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
