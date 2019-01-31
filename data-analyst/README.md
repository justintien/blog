# DA

> 數據分析師

## Tools

- 代碼管理工具
  - Google Tag Manager

- 數據收集
  - Google Analytics (Global Site Tag)
  - Facebook Pixel
  - Mixpanel
  - GrowingIO (中国)
  - 诸葛IO (中国)
  - TalkingData (中国)
  - 神策数据 (中国)
  - 百度统计 (中国)

- 熱力圖 https://www.zhihu.com/question/23328249/answer/115671828
  - crazyegg
  - hotjar
  - ptengine
  - heatmap.com

## Log 数据收集架构

- elastic
- Azure Log Analytics
- raw log 自建syslogng主機, 重要 / DB log 另外丟到splunk. 不過splunk要錢 用input 流量計費.
- sentry
- 程式輸出到檔案 -> Filebeat -> Kafka -> Logstash -> Elasticsearch 上百台server的log輕鬆打 Access log也是，用不同 collection存，另外建議順便把trace id一起做 抓bug更輕鬆Post body也是 都用trace id串起來要接什麼看他需求囉，但是elasticsearch前面，如果沒有logstash or fluentd 進去的資料也只是一堆text，他最終還是要選一個fluentd小，沒有jvm需求，用戶也不少，是個可以參考的選擇
- splunk