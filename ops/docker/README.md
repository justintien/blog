Last-Modified: {docsify-updated}

# docker

- docker logs 16k 限制 https://github.com/moby/moby/issues/34855
  - json-file log \n 来区分结尾
  - 解决方案:Filebeat or https://github.com/fluent-plugins-nursery/fluent-plugin-concat 合并

## docker inspect

> 简单地说， -f 的实参是个 Go 模版

- 通过模版来查找所有退出码为非 0 的容器名：

```sh
docker inspect -f '{{if ne 0 .State.ExitCode }}{{.Name}} {{.State.ExitCode}}{{ end }}' $(docker ps -aq)
```