# ab

> 壓力測試

## example

```sh
ab -n2000 -c100 -H "Authorization: Token xxx" -v 2 http://localhost:3000/slide/7632/ppt
```

```sh
ab 一般常用参数就是 -n， -t ，和 -c。

-c（concurrency）表示用多少并q发来进行测试；

-t表示测试持续多长时间；

-n表示要发送多少次测试请求。

一般-t或者-n选一个用。

ab -n10000 -c100 -k http://localhost:3000

# macOS, 要多并发 要解除限制
ulimit -n 10000
```

### ab -h

```sh
Usage: ab [options] [http[s]://]hostname[:port]/path
Options are:
    -n requests     Number of requests to perform
    -c concurrency  Number of multiple requests to make at a time
    -t timelimit    Seconds to max. to spend on benchmarking
                    This implies -n 50000
    -s timeout      Seconds to max. wait for each response
                    Default is 30 seconds
    -b windowsize   Size of TCP send/receive buffer, in bytes
    -B address      Address to bind to when making outgoing connections
    -p postfile     File containing data to POST. Remember also to set -T
    -u putfile      File containing data to PUT. Remember also to set -T
    -T content-type Content-type header to use for POST/PUT data, eg.
                    'application/x-www-form-urlencoded'
                    Default is 'text/plain'
    -v verbosity    How much troubleshooting info to print
    -w              Print out results in HTML tables
    -i              Use HEAD instead of GET
    -x attributes   String to insert as table attributes
    -y attributes   String to insert as tr attributes
    -z attributes   String to insert as td or th attributes
    -C attribute    Add cookie, eg. 'Apache=1234'. (repeatable)
    -H attribute    Add Arbitrary header line, eg. 'Accept-Encoding: gzip'
                    Inserted after all normal header lines. (repeatable)
    -A attribute    Add Basic WWW Authentication, the attributes
                    are a colon separated username and password.
    -P attribute    Add Basic Proxy Authentication, the attributes
                    are a colon separated username and password.
    -X proxy:port   Proxyserver and port number to use
    -V              Print version number and exit
    -k              Use HTTP KeepAlive feature
    -d              Do not show percentiles served table.
    -S              Do not show confidence estimators and warnings.
    -q              Do not show progress when doing more than 150 requests
    -l              Accept variable document length (use this for dynamic pages)
    -g filename     Output collected data to gnuplot format file.
    -e filename     Output CSV file with percentages served
    -r              Don\'t exit on socket receive errors.
    -m method       Method name
    -h              Display usage information (this message)
    -Z ciphersuite  Specify SSL/TLS cipher suite (See openssl ciphers)
    -f protocol     Specify SSL/TLS protocol
                    (SSL3, TLS1, TLS1.1, TLS1.2 or ALL)
```

# 模拟测试

```sh
ab -c 10 -n 1000 http://test1.n.tw/

This is ApacheBench, Version 2.3 <$Revision: 1528965 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking test1.n.tw (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests


Server Software:        nginx/1.4.6
Server Hostname:      test1.n.tw
Server Port:            80

Document Path:          /
Document Length:        9643 bytes

Concurrency Level:      10
Time taken for tests:   10.946 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      10037000 bytes
HTML transferred:       9643000 bytes
Requests per second:    91.36 [#/sec] (mean)
Time per request:       109.462 [ms] (mean)
Time per request:       10.946 [ms] (mean, across all concurrent requests)
Transfer rate:          895.45 [Kbytes/sec] received


Connection Times (ms）             ：
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:    64  109  26.7    104     306
Waiting:       60  104  26.1    100     303
Total:         64  109  26.7    105     306


Percentage of the requests served within a certain time (ms)
  50%    105
  66%    116
  75%    123
  80%    127
  90%    140
  95%    157
  98%    170
  99%    190
 100%    306 (longest request)
```

## 输出结果说明

```#!/bin/sh
Server Software         （Web主機的作業系統與版本）
Server Hostname         （Web主機的IP位址)
Server Port             （Web主機的連接埠(Port)）
Document Path           （網址的路徑部分）
Document Length         （網頁回應的網頁大小）
Concurrency Level       （同時進行壓力測試的人數）
Time taken for tests    （本次壓力測試所花費的總秒數）
Complete requests       （完成的要求數(Requests)）
Failed requests         （失敗的要求數(Requests)）
Total transferred       （本次壓力測試的總數據傳輸量(包括 HTTP Header 的資料也計算在內)）
HTML transferred        （本次壓力測試的總數據傳輸量(僅計算回傳的 HTML 的資料)）
Requests per second     （平均每秒可回應多少要求）
Time per request        （平均每個要求所花費的時間(單位: 豪秒)）
Time per request        （平均每個要求所花費的時間，所有同時連線數的平均值(單位: 豪秒)）
Transfer rate           （從 ab 到 Web Server 之間的網路傳輸速度）
Connection Times (ms)   （壓力測試時的連線處理時間）

下面的表格
橫軸欄位的部分：

min:      最小值
mean:     平均值(正、負標準差)
median:   平均值(中間值)
max:      最大值

縱軸欄位的部分：

Connect:       從 ab 發出 TCP 要求到 Web 主機所花費的建立時間。
Processing:    從 TCP 連線建立後，直到 HTTP 回應(Response)的資料全部都收到所花的時間。
Waiting:       從發送 HTTP 要求完後，到 HTTP 回應(Response)第一個 Byte 所等待的時間。
Total:         等於 Connect + Processing 的時間（因為 Waiting 包含在 Processing 時間內了）
```

[参数连结](https://blog.hellosanta.com.tw/%E7%B6%B2%E7%AB%99%E8%A8%AD%E8%A8%88/%E4%BC%BA%E6%9C%8D%E5%99%A8/%E7%B6%B2%E9%A0%81%E4%BC%BA%E6%9C%8D%E5%99%A8%E7%9B%A3%E6%B8%AC%E7%AB%99%EF%BC%81%EF%BC%81%E4%B8%8D%E8%83%BD%E4%B8%8D%E7%9F%A5%E9%81%93%E7%9A%84apachebench%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95)

[参考连结2](http://blog.miniasp.com/post/2008/06/30/Using-ApacheBench-ab-to-to-Web-stress-test.aspx)
