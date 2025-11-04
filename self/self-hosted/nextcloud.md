# nextcloud

## 自托管部署指令(macos)

- 需要安裝 docker
- 如果是本地使用，需要安裝 tailscale: `brew install tailscale`

### shell

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
```

### docker compose

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

- env file

```env
NEXTCLOUD_DATADIR=""
NEXTCLOUD_TRUSTED_DOMAINS=nextcloud.local

# 反向代理需要
APACHE_PORT=11000
APACHE_IP_BINDING: 127.0.0.1
```
