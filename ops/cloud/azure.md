Last-Modified: {docsify-updated}

# azure

- [azure](https://azure.microsoft.com/)
- [azure.cn - 中國區是俺割版](https://www.azure.cn/)

## 服務說明

> vm

- [virtual-machines](https://azure.microsoft.com/zh-tw/pricing/details/virtual-machines/linux/)

## issue
- [azure networking broken](https://joonas.fi/2017/01/23/microsoft-azures-networking-is-fundamentally-broken/)
## 一個訂閱帳戶的限制

- https://docs.microsoft.com/zh-cn/azure/azure-subscription-service-limits#networking-limits
- 虛擬機壓力測試延遲高的可能原因及 ILPIP 配置 / 查詢腳本: https://www.jianshu.com/p/78d19a3acf9b

## vm

> 目前遇到的一個坑 (可能我不是很懂 azure 的架構吧)

- 虛擬機(經典): 預設為不具實例級IP 的 共用虛擬IP (VIP)
  - 目前經驗: 預設 SNAT 160個端口，若 佔滿則需要等待 (網路阻塞)
  - 設定實例級 ip 可解決 SNAT 耗盡問題 [連結](https://docs.microsoft.com/zh-cn/azure/virtual-network/virtual-networks-instance-level-public-ip)
  - 無實例級ip，使用的網路為 (PAT) 偽裝的 SNAT: 限制 160個…
    - 會有耗盡問題，進而無法出站連線 (阻塞) [連結](https://docs.azure.cn/zh-cn/load-balancer/load-balancer-outbound-connections?toc=%2fvirtual-network%2ftoc.json#snatexhaust)
  - refs: http://www.cnblogs.com/zangdalei/p/7417860.html

- `長連接時間 4 分鐘, 超過 會不正常 斷線 (client 無法正常收到 tcp 握手)` azure 似乎所有服務都有此設定 (gateway 層, mysql 也是 4分鐘)
  - 目前追到原因是防火牆 gateway 是設定 4分鐘

```sh
# see https://www.jianshu.com/p/e6eef03ed86c
# see http://www.firefoxbug.com/index.php/archives/2805/
# see http://blog.51cto.com/waringid/183496
sysctl -a | grep tcp_keepalive
# linux 預設 tcp keepalive 是 2小時之後, 每75秒檢查一次, 共檢查 9次 沒有響應則斷線
net.ipv4.tcp_keepalive_intvl = 75
net.ipv4.tcp_keepalive_probes = 9
net.ipv4.tcp_keepalive_time = 7200
# 設置相關的參數
sysctl -w net.ipv4.tcp_keepalive_time=240
sysctl -w net.ipv4.tcp_keepalive_intvl=30
sysctl -w net.ipv4.tcp_keepalive_probes=3

sysctl -w net.ipv4.tcp_keepalive_time=7200
sysctl -w net.ipv4.tcp_keepalive_intvl=75
sysctl -w net.ipv4.tcp_keepalive_probes=9
# 也可以直接打開
# vim/etc/sysctl.conf
# 加入net.ipv4.tcp_keepalive_time = 7500，然後保存退出

# 讓參數生效
# sysctl -p
```

## cdn
- 中國區另外提供 image processing [連結](https://docs.azure.cn/zh-cn/cdn/cdn-image-processing)
- storage 必須 為 public (private 不行)
- 限制:
  - 支持格式轉換的文件格式包括jpg, png, bmp, webp, gif，tif
  - 圖片源文件的大小不可大於20MB
  - 處理後的圖片尺寸不得大於4096 * 4096 像素, 且任意邊邊長不得大於4096*4 像素

```sh
針對郵件下面的疑問，目前我們收到後端團隊進一步反饋，供您參考：

=========================================

“圖片尺寸不得大於 4096 * 4096 像素, 且任意邊邊長不得大於 4096*4 像素”,這裡指的是圖片的總像素值不能大於4096*4096, 而如果一條邊是4096*2, 另一條邊小於4096/2的話，也是可以的。
```

- 訪問控制要開工單請 azure 協助設置 (防盜鏈)
- 默認緩存規則: https://docs.azure.cn/zh-cn/cdn/cdn-faq-service-inquiry#step5
- 刷新緩存api: https://docs.azure.cn/zh-cn/cdn/cdn-api-add-purge

## mysql

> 注意事項

- 調整定價層，會短暫停機
- 每4分鐘會自動斷線一次

## CosmosDB

> 注意事項

- 使用 php driver to connection
  - 大約 30分鐘會斷線一次 connection time out
## blob

- 私人
- blob (無目錄)
- 容器 (可以有目錄)

> cors

- 允許的來源
  - *
  - <http://aaa.com/,http://bbb.com/>
  - 不能用 regex
