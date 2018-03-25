# docker

## 常用

```sh
docker stats $(docker ps --format={{.Names}})

# 1678 * 80% = 1342
docker update -m="1342m" --memory-swap="1342m" nuts-ranch

# v1.13(含)以上版本使用
# {
#   "container": "d2b8284f2453",
#   "name": "nuts-sms-service-node-mysql",
#   "memory": {
#     "raw": "186.2MiB / 1.952GiB",
#     "percent": "9.31%"
#   },
#   "cpu": "0.05%"
# }
docker stats --no-stream --format \
"{\"container\":\"{{ .Container }}\",\"name\":\"{{ .Name }}\",\"memory\":{\"raw\":\"{{ .MemUsage }}\",\"percent\":\"{{ .MemPerc }}\"},\"cpu\":\"{{ .CPUPerc }}\",\"timestamp\":$(date +%s)}"

# tricky 1.13 以下版本 ($3~$7 => memory.raw)
docker stats --no-stream $(docker ps --format={{.Names}}) | tail -n +2 | awk '{printf("{\"container\":\"\",\"name\":\"%s\",\"memory\":{\"raw\":\"%s %s %s %s %s\",\"percent\":\"%s\"},\"cpu\":\"%s\"}\n", $1, $3, $4, $5, $6, $7, $8, $2)}'

# Log太大太麻煩，沒有關係，用這一句指令就可以一次解決
truncate -s 0 /var/lib/docker/containers/*/*-json.log
docker start $(docker ps -aq --filter status=exited)
docker-compose up -d --force-recreate
```

### 查看 logs driver
```sh
docker inspect -f '{{.HostConfig.LogConfig.Type}}' <CONTAINER>

docker inspect -f '{{.Id}}' nuts-sms-service-node
```

### 查找各容器 日志 size
```sh
ls -lh $(find /var/lib/docker/containers/ -name *-json.log)
```

### cleanup
```sh
#!/bin/bash

# cleanup
docker rm -v $(docker ps -a -q -f status=exited);
docker rm -v $(docker ps -a -q -f status=created);
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
```

```sh
#!/bin/bash -e

# is_running
CONTAINER_NAME=$1

state=`docker inspect -f {{.State.Running}} ${CONTAINER_NAME}`
if [ "$state" == "false" ];then
  exit 2;
fi
```

```sh
docker update --restart=no container
```

### docker run

```
docker run -it --rm \
—name=phptest \
-v $(pwd):/var/www/html/ \
-p 8080:80 \
php:5.6-apache
```

### docker export

```
docker export xxxxx > xxx.tar


docker save id -o xxx.tar
docker load < xxx.tar
docker tag 0e5574283393 fedora/httpd:version1.0


https://blog.hinablue.me/docker-bi-jiao-save-export-dui-yu-ying-xiang-dang-cao-zuo-chai-yi/
```

### docker cp

```
docker cp xxxx:/path /path
```

### docker stats by name

```
docker stats $(docker ps | awk '{if(NR>1) print $NF}')

docker stats $(docker ps --format={{.Names}})
```

### 取得容器的 PID

```
PID=$(docker inspect --format "{{ .State.Pid }}" <container>)
```

### docker ps format

```sh
docker ps --format="table {{.Image}}\t{{.Names}}"
```

### log

```sh
docker logs --since=1497084800 -t nutsbp-editor-server  | more

docker logs --since=1510675199 -t nutsbp-editor-server  | more
```

### update

```sh
docker update -m="64m" nuts-data-api-server nuts-mail-service nuts-mail-service.queue nutsbp-ppt-service
```

<http://blog.daocloud.io/edu170623/>

[1]: http://www.itread01.com/articles/1487291919.html
[2]: https://philipzheng.gitbooks.io/docker_practice/content/container/enter.html
