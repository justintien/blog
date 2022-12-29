Last-Modified: {docsify-updated}

# date


```sh
# 當前日期時間
date

# RFC 5322 format
date -R

# RFC 3339 format (date/seconds/ns)
date --rfc-3339=seconds

# 取得昨天的日期
date -d "$date -1 days" +"%Y/%m/%d"
```