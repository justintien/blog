Last-Modified: {docsify-updated}

# docker

- docker logs 16k 限制 https://github.com/moby/moby/issues/34855
  - json-file log \n 來區分結尾
  - 解決方案:Filebeat or https://github.com/fluent-plugins-nursery/fluent-plugin-concat 合併

## docker inspect

> 簡單地說， -f 的實參是個 Go 模版

- 通過模版來查找所有退出碼為非 0 的容器名：

```sh
docker inspect -f '{{if ne 0 .State.ExitCode }}{{.Name}} {{.State.ExitCode}}{{ end }}' $(docker ps -aq)
```