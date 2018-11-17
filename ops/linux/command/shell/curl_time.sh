#!/bin/bash
# Author: Justin
# Date: 2018-10-28
# Modified: 2018-10-28
# Description:
# - curl url of time log
# Dependencies:
# - 
# */15 * * * * /data/curl_time.sh https://cdn.lolimew.com/upload/app/76364a76-3d50-438b-ad0b-a15bed20b228/gameConfig.json >> /data/curl_time.gameConfig.log 2>&1


# usage
read -r -d '' usage << EOM
Usage: "$0" <url> [SLEEP]

<> 参数为必须
[] 为选用

parameters:
    url: 测试的 URL
    SLEEP: 每秒执行, 不设则执行一次
env:
    NAME: 機器名字
    TG: 是否要 tg 通知 (default: false)
example:
"$0" https://api.github.com/

EOM

# check parameters
if [ "$#" -lt 1 ]; then
    echo "$usage"
    exit 2
fi

URL=$1
SLEEP=$2

function curl_time() {
    DATE_ShangHai=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)
    curl -so /dev/null -w "{\"from\":\"${NAME}\",\"test_url\":\"${URL}\",\"date\":\"${DATE_ShangHai}\",\"namelookup\":\"%{time_namelookup}s\",\"connect\":\"%{time_connect}s\",\"appconnect\":\"%{time_appconnect}s\",\"pretransfer\":\"%{time_pretransfer}s\",\"redirect\":\"%{time_redirect}s\",\"starttransfer\":\"%{time_starttransfer}s\",\"total\":\"%{time_total}s\"}\n" "$@"
}

function POST_TG() {
    curl -X POST https://xxxxxxxx -H 'content-type: application/json' -d $1
}

if test -z "$2";then
    RESPONSE=$(curl_time ${URL})
    echo $RESPONSE
    if [ "$TG" == "true" ];then
        POST_TG $RESPONSE
    fi
else
    while [ true ];do
        sleep $SLEEP
        RESPONSE=curl_time ${URL}
        echo $RESPONSE
        if [ "$TG" == "true" ];then
            POST_TG $RESPONSE
        fi
    done
fi
