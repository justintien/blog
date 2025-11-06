# nextcloud

## 自托管部署指令(macos)

- 需要安裝 docker
<!-- - 如果是本地使用，需要安裝 tailscale: https://tailscale.com/download/mac -->

<!-- - Setting up a domain

```sh
tailscale serve --bg http://127.0.0.1:11000
``` -->

<!-- ### shell

```sh
#!/bin/bash

sudo docker run \
  --init \
  --sig-proxy=false \
  --name nextcloud-aio-mastercontainer \
  --restart always \
  --publish 80:80 \
  --publish 8080:8080 \
  --publish 8443:8443 \
  --volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  -e NEXTCLOUD_DATADIR="自定義資料夾" \
  -e NEXTCLOUD_TRUSTED_DOMAINS=localhost,127.0.0.1 \
  ghcr.io/nextcloud-releases/all-in-one:latest
``` -->

### 使用 docker 部署

> ref: https://github.com/nextcloud/all-in-one/discussions/6817 (但要注意！它的 docker-compose.yml 有部份 env typo)

#### 步驟一：創建 docker-compose.yaml file

```yaml
# ref: https://github.com/nextcloud/all-in-one/blob/main/compose.yaml
version: "3.8"

services:
  nextcloud-aio-mastercontainer:
    image: ghcr.io/nextcloud-releases/all-in-one:latest
    container_name: nextcloud-aio-mastercontainer
    restart: always
    init: true
    # environment: # docker compose 會自行尋找當前資料夾的 .env file
    ports:
      - "8080:8080" # AIO 管理介面
      - "8443:8443" # HTTPS
      - "80:80" # HTTP (可省略或反向代理)
    volumes:
      - nextcloud_aio_mastercontainer:/mnt/docker-aio-config
      - /var/run/docker.sock:/var/run/docker.sock:ro
    # macOS 下 docker.sock 可直接使用此路徑

volumes:
  nextcloud_aio_mastercontainer:
    name: nextcloud_aio_mastercontainer
```

#### 步驟一：創建 .env file

> 看你自己想要設置哪些 env

```env
NEXTCLOUD_DATA_DIR=""
NEXTCLOUD_TRUSTED_DOMAINS=nextcloud.local

# 反向代理需要
APACHE_PORT=11000
APACHE_IP_BINDING: 127.0.0.1
```

#### 步驟三：叫起伺服器

```sh
docker compose up -d

# 會出現一組密碼，請記下
```

#### 步驟四：本地執行後台介面

https://localhost:8080

輸入上一個步驟的密碼進行初始化安裝 > 過程就省略(自行設置) > 關鍵的一點是自定義域名，dns 要先設置好

##### 後記

因為一開始忘了將資料 mount 進去 docker volumes，但是已經開始運行了

所以需要手動將 contianer 資料複製到實體機器，再將之前的 docker 容器刪除，重新佈建

```sh
# 所有指令若有需要，請自行加 sudo

REAL_DIR_PATH="/data"

# 複製設定檔 (請將 'nextcloud-aio-mastercontainer' 替換為您的實際容器名稱或ID)
docker cp nextcloud-aio-mastercontainer:/mnt/docker-aio-config $REAL_DIR_PATH

# 複製主體資料
docker cp nextcloud-aio-nextcloud:/mnt/ncdata $REAL_DIR_PATH

# 停止所有相關容器
docker stop $(docker ps -a -q --filter name='nextcloud-aio-*')

# 刪除所有相關容器
docker rm $(docker ps -a -q --filter name='nextcloud-aio-*')

# 回到上面的步驟三，完成
docker compose up -d
```
