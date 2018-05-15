#!/bin/bash
# Author: Justin Tien (Jiapan)
# Date: 2017-11-10
# Desc:
# - check prod sites 存活
# - use curl --fail 判断

__DIR__=$( dirname "$0" )
. $__DIR__/__function.sh

# 定时 ping 所有 sites, 检查是否有 site down

# 开始时间
TS_BEGIN=$(date +%s)
DATE=$(date -u +%Y-%m-%d_%H:%M:%S%z)
DATE_ShangHai=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)

# 收件人
MAIL_LIST='""'

# retry 次数
if test -z "$1";then
	TRY_COUNT_MAX=2
else
	TRY_COUNT_MAX=$1
fi

# 整个过程容许的时间 (秒)
if test -z "$2";then
	TIMEOUT=5
else
	TIMEOUT=$2
fi

# TODO: 目前手动增加 list, 看有无方法 自动加
LIST=(
'https://google.com'
)

printf "[%s]\n" "$DATE"

table="<table border=1>
    <thead>
        <tr>
            <th>网址</th>
            <th>详情</th>
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

#结束时间
TS_END=$(date +%s)
DATE_END_ShangHai=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)

spend=$(expr "$TS_END" - "$TS_BEGIN")

echo "花费时间为$spend秒"

if [ ${#LIST[@]} -ne 0 ];then
  read -r -d '' HTML << EOM
<h1>正服站点 测试失败！</h1>
<h2>* 这表示有站点挂掉，请先连结网址确认无法连线，再回报给相关人员</h2>

<h3>站点连线超时测试回报: </h3>
<h3>任务开始时间: $DATE_ShangHai</h3>
<h3>任务结束时间: $DATE_END_ShangHai</h3>
<h3>本次任务总耗时: $spend 秒</h3>
$table
EOM
  # echo $HTML
  echo "开始寄信: $(date)"
  tsBegin=$(date +%s)
  localMailservice "[op] site down list:" "$HTML" "$MAIL_LIST"
  tsEnd=$(date +%s)
  tsDiff=$(expr "$tsEnd" - "$tsBegin")
  echo "结束寄信: $(date)"
  echo "寄信耗时: $tsDiff"
fi

printf "\n\n"
