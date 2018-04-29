# azure

- [azure](https://azure.microsoft.com/)
- 中国区是俺割版

## 一个订阅帐户的限制

- https://docs.microsoft.com/zh-cn/azure/azure-subscription-service-limits#networking-limits
- 虚拟机压力测试延迟高的可能原因及 ILPIP 配置 / 查询脚本: https://www.jianshu.com/p/78d19a3acf9b

## vm

> 目前遇到的一个坑 (可能我不是很懂 azure 的架构吧)

- 虚拟机(经典): 预设为不具实例级IP 的 共用虚拟IP (VIP)
  - 目前经验: 预设 SNAT 160个端口，若 占满则需要等待 (网路阻塞)
  - 设定实例级 ip 可解决 SNAT 耗尽问题 [连结](https://docs.microsoft.com/zh-cn/azure/virtual-network/virtual-networks-instance-level-public-ip)
  - 无实例级ip，使用的网路为 (PAT) 伪装的 SNAT: 限制 160个…
    - 会有耗尽问题，进而无法出站连线 (阻塞) [连结](https://docs.azure.cn/zh-cn/load-balancer/load-balancer-outbound-connections?toc=%2fvirtual-network%2ftoc.json#snatexhaust)
  - refs: http://www.cnblogs.com/zangdalei/p/7417860.html

- `长连接时间 4 分钟, 超过 会不正常 断线 (client 无法正常收到 tcp 握手)` azure 似乎所有服务都有此设定 (gateway 层, mysql 也是 4分钟)
  - 目前追到原因是防火墙 gateway 是设定 4分钟

```sh
# see https://www.jianshu.com/p/e6eef03ed86c
# see http://www.firefoxbug.com/index.php/archives/2805/
# see http://blog.51cto.com/waringid/183496
sysctl -a | grep tcp_keepalive
# linux 预设 tcp keepalive 是 2小时之后, 每75秒检查一次, 共检查 9次 没有响应则断线
net.ipv4.tcp_keepalive_intvl = 75
net.ipv4.tcp_keepalive_probes = 9
net.ipv4.tcp_keepalive_time = 7200
# 设置相关的参数
sysctl -w net.ipv4.tcp_keepalive_time=240
sysctl -w net.ipv4.tcp_keepalive_intvl=30
sysctl -w net.ipv4.tcp_keepalive_probes=3

sysctl -w net.ipv4.tcp_keepalive_time=7200
sysctl -w net.ipv4.tcp_keepalive_intvl=75
sysctl -w net.ipv4.tcp_keepalive_probes=9
# 也可以直接打开
# vim/etc/sysctl.conf
# 加入net.ipv4.tcp_keepalive_time = 7500，然后保存退出

# 让参数生效
# sysctl -p
```

## cdn
- 中国区另外提供 image processing [连结](https://docs.azure.cn/zh-cn/cdn/cdn-image-processing)
- storage 必须 为 public (private 不行)
- 限制:
  - 支持格式转换的文件格式包括jpg, png, bmp, webp, gif，tif
  - 图片源文件的大小不可大于20MB
  - 处理后的图片尺寸不得大于4096 * 4096 像素, 且任意边边长不得大于4096*4 像素

```sh
针对邮件下面的疑问，目前我们收到后端团队进一步反馈，供您参考：

=========================================

“图片尺寸不得大于 4096 * 4096 像素, 且任意边边长不得大于 4096*4 像素”,这里指的是图片的总像素值不能大于4096*4096, 而如果一条边是4096*2, 另一条边小于4096/2的话，也是可以的。
```

- 访问控制要开工单请 azure 协助设置 (防盗链)
- 默认缓存规则: https://docs.azure.cn/zh-cn/cdn/cdn-faq-service-inquiry#step5
- 刷新缓存api: https://docs.azure.cn/zh-cn/cdn/cdn-api-add-purge

## mysql

> 注意事项

- 调整定价层，会短暂停机
- 每4分钟会自动断线一次

## CosmosDB

> 注意事项

- 使用 php driver to connection
  - 大约 30分钟会断线一次 connection time out
## blob

- 私人
- blob (无目录)
- 容器 (可以有目录)

> cors

- 允许的来源
  - *
  - <http://aaa.com/,http://bbb.com/>
  - 不能用 regex
