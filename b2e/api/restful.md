Last-Modified: {docsify-updated}

# restful

> 基本知識

- http method: http://restful-api-design.readthedocs.io/en/latest/methods.html
- http request 方式: 注意使用不同編碼方式傳入參數，header 的 Content-Type 會不同。

|Content-type|desc|
|---|---|
|application/x-www-form-urlencoded|form encode|
|multipart/form-data|form data mixed, 檔案上傳必須用這個|
|application/json|json encode|

- 定義 response format:
  - success format
  - error format

[理解RESTful架構 - 阮一峰]:http://www.ruanyifeng.com/blog/2011/09/restful.html
[RESTful API 設計指南 - 阮一峰]:http://www.ruanyifeng.com/blog/2014/05/restful_api.html
[restful-api-design]:http://restful-api-design.readthedocs.io/en/latest/
[我所認為的RESTful API最佳實踐]:http://www.scienjus.com/my-restful-api-best-practices/
[再談 API 的撰寫 - 總覽]:https://mp.weixin.qq.com/s?__biz=MzA3NDM0ODQwMw==&mid=401902529&idx=1&sn=575ae8fdf163afa30604d712a73079fd&scene=21&key=6bfd4496cfb24e58c75aa77d8469604ba8f892cc933bbfa669be42ff199772577120c566b08256793423fb20c6f5ac133d66201bab88ac6ab32e183c1c0ad14cfe95a749bdf8c8e90b49a17db0b80dab&ascene=0&uin=MjM0MjExMTk4Mg%3D%3D&devicetype=iMac+MacBookPro12%2C1+OSX+OSX+10.11.6+build(15G1217)&version=12020002&nettype=WIFI&fontScale=100&pass_ticket=SaNGKJhWjcIpysWuYsY8%2Bt2OOu%2FloxoNArxdJfRYloEcEjrcNP2ySDhnEeknEt%2B3
[從達標到卓越 —— API 設計之道 - taobao]:http://taobaofed.org/blog/2017/02/16/a-guide-to-api-design/

[jsonapi]:http://jsonapi.org/
[用 JSON 構建 API 的標準指南]:http://jsonapi.org.cn/

[How to do authentication with a REST API right? - stackoverflow]:https://stackoverflow.com/questions/15051712/how-to-do-authentication-with-a-rest-api-right-browser-native-clients