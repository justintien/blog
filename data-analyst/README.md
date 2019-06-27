# DA

> 數據分析師

## Tools

- 代碼管理工具
  - Google Tag Manager
    - https://transbiz.com.tw/google-tag-manager-gtm-%E6%95%99%E5%AD%B8/

- 數據收集
  - Google Analytics (Global Site Tag)
  - Facebook Pixel
  - Mixpanel
  - GrowingIO (中國)
  - 諸葛IO (中國)
  - TalkingData (中國)
  - 神策數據 (中國)
  - 百度統計 (中國)

- 熱力圖 https://www.zhihu.com/question/23328249/answer/115671828
  - crazyegg
  - hotjar
  - ptengine
  - heatmap.com

## Log 數據收集架構

- elastic
- Azure Log Analytics
- raw log 自建syslogng主機, 重要 / DB log 另外丟到splunk. 不過splunk要錢 用input 流量計費.
- sentry
- 程式輸出到檔案 -> Filebeat -> Kafka -> Logstash -> Elasticsearch 上百臺server的log輕鬆打 Access log也是，用不同 collection存，另外建議順便把trace id一起做 抓bug更輕鬆Post body也是 都用trace id串起來要接什麼看他需求囉，但是elasticsearch前面，如果沒有logstash or fluentd 進去的資料也只是一堆text，他最終還是要選一個fluentd小，沒有jvm需求，用戶也不少，是個可以參考的選擇
- splunk

### links

- [數據埋點是什麼？設置埋點的意義是什麼？](https://www.zhihu.com/question/36411025)