#!/bin/bash
# Author: Justin Tien (Jiapan)
# Date: 2017-11-10
# 共用 function 区块

ADMIN_MAIL="test@gmail.com"

# $1 重试次数
# $2 最大连线时间 timeout
# $3 监测的 url
function curlCheck() {
  retry_count=$1
  max_time=$2
  url=$3
  error_log=$4
  #  -f, --fail          Fail silently (no output at all) on HTTP errors
  # errors meant httpcode >= 400
  curl -v -X GET --output /dev/null --silent --fail --retry "$retry_count" --max-time "$max_time" "$url" 2> "$error_log"
  # curl exit code see: https://www.computerhope.com/unix/curl.htm
  # 常见 code:
  # 6 Couldn't resolve host. The given remote host was not resolved.
  # 22 --fail
  # 28 Operation timeout. The specified time-out period was reached according to the conditions.
  return $?
}

# $1 Subject of mail
# $2 Content of mail
# $3 收件人, e.g. 多个以逗号区隔
function localMailservice() {
  SUBJECT=$1
  CONTENT=$2
  TO=$3
  echo "$CONTENT" | mail --append="Content-type: text/html" -s "$SUBJECT" "$TO" -aFrom:【sitedown】\<do-not-reply@none\>
}


# docker --version 1.13 (含)以上版本做法
function dockerStatsJsonFormat() {
  HOST=$1
  ssh $HOST 'docker stats --no-stream --format "{\"container\":\"{{ .Container }}\",\"name\":\"{{ .Name }}\",\"memory\":{\"raw\":\"{{ .MemUsage }}\",\"percent\":\"{{ .MemPerc }}\"},\"cpu\":\"{{ .CPUPerc }}\",\"timestamp\":\"$(date +%s)\",\"date\":\"$(date -u +%Y-%m-%d_%H:%M:%S%z)\"}"'
}

# docker --version 1.13 以下版本 tricky做法
function dockerStatsJsonFormatOldVersionTricky() {
  HOST=$1
  ssh $HOST 'docker stats --no-stream $(docker ps --format={{.Names}}) | tail -n +2' | awk -v timestamp=$(date +%s) -v date=$(date -u +%Y-%m-%d_%H:%M:%S%z) '{printf("{\"container\":\"\",\"name\":\"%s\",\"memory\":{\"raw\":\"%s %s %s %s %s\",\"percent\":\"%s\"},\"cpu\":\"%s\",\"timestamp\":\"%s\",\"date\":\"%s\"}\n", $1, $3, $4, $5, $6, $7, $8, $2, timestamp, date)}'
}
