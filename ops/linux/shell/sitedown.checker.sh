#!/bin/bash
# Author: Justin Tien (Jiapan)
# Date: 2017-11-10
# Desc:
# - check prod sites 存活
# - use curl --fail 判斷

__DIR__=$( dirname "$0" )
. $__DIR__/__function.sh

# 定時 ping 所有 sites, 檢查是否有 site down

# 開始時間
TS_BEGIN=$(date +%s)
DATE=$(date -u +%Y-%m-%d_%H:%M:%S%z)
DATE_ShangHai=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)

# 收件人
MAIL_LIST='""'

# retry 次數
if test -z "$1";then
	TRY_COUNT_MAX=2
else
	TRY_COUNT_MAX=$1
fi

# 整個過程容許的時間 (秒)
if test -z "$2";then
	TIMEOUT=5
else
	TIMEOUT=$2
fi

# TODO: 目前手動增加 list, 看有無方法 自動加
LIST=(
'https://google.com'
)

printf "[%s]\n" "$DATE"

table="<table border=1>
    <thead>
        <tr>
            <th>網址</th>
            <th>詳情</th>
            <th>exit code(curl)</th>
        </tr>
    </thead>
    <tbody>"

for i in "${!LIST[@]}";do
    url=${LIST[i]}
    error_log=/tmp/curl.prod.error

    curlCheck "2" "5" "$url" "$error_log"
    CODE=$?

    result=$(cat "$error_log")

    if test $CODE = 0; then
      unset 'LIST[i]'
      printf "%s exist\n" "$url"
    else
      printf "%s fail %s \n%s \n" "$url" "$CODE" "$result"
      read -r -d '' table << EOM
$table
    <tr>
      <td><a href='$url'>$url</a></td>
      <td>${result}</td>
      <td>${CODE}</td>
</tr>
EOM
    fi
done

table+="</tbody></table>"

#結束時間
TS_END=$(date +%s)
DATE_END_ShangHai=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)

spend=$(expr "$TS_END" - "$TS_BEGIN")

echo "花費時間為$spend秒"

if [ ${#LIST[@]} -ne 0 ];then
  read -r -d '' HTML << EOM
<h1>正服站點 測試失敗！</h1>
<h2>* 這表示有站點掛掉，請先連結網址確認無法連線，再回報給相關人員</h2>

<h3>站點連線超時測試回報: </h3>
<h3>任務開始時間: $DATE_ShangHai</h3>
<h3>任務結束時間: $DATE_END_ShangHai</h3>
<h3>本次任務總耗時: $spend 秒</h3>
$table
EOM
  # echo $HTML
  echo "開始寄信: $(date)"
  tsBegin=$(date +%s)
  localMailservice "[op] site down list:" "$HTML" "$MAIL_LIST"
  tsEnd=$(date +%s)
  tsDiff=$(expr "$tsEnd" - "$tsBegin")
  echo "結束寄信: $(date)"
  echo "寄信耗時: $tsDiff"
fi

printf "\n\n"
