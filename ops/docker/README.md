Last-Modified: {docsify-updated}

# docker

- docker logs 16k 限制 https://github.com/moby/moby/issues/34855
  - json-file log \n 来区分结尾
  - 解决方案:Filebeat or https://github.com/fluent-plugins-nursery/fluent-plugin-concat 合并