Last-Modified: {docsify-updated}

# telnet

```sh
#!/bin/bash
# Author: Justin
# Date: 2017-11-10
# Desc:
# - check vm 存活
# - use telnet host port 监测 22 (ssh default) 通道有开

__DIR__=$( dirname "${BASH_SOURCE[0]}" )

if command -v reallink;then
	__DIR__=$(reallink -f "$__DIR__")
elif command -v grealpath;then
	__DIR__=$(grealpath "$__DIR__")
else
	__DIR__=$(pwd)
fi

. $__DIR__/../__function.sh

# 开始时间
begin=$(date +%s)
# 收件人
# MAIL_LIST='"all@nutsbp.com","all@nutspie.com"'
MAIL_LIST='"justin@nutsbp.com"'
# UTC
DATE=$(date -u +%Y-%m-%d_%H:%M:%S%z)
DATE_ShangHai=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)

LIST=(
'nuts-deploy'
'test'
# 'develop'
# 'jia'
# 'cms'
# 'nutspie'
# 'bpe'
# 'wp-nutsbp'
# 'dev3'
# 'pdf'
# 'ranch'
# 'chrome'
# 'account'
)

HTML="<h2>无法连线时间: $DATE_ShangHai</h3>
      <h3>* 请回报给相关人员</h3>
    <table border=1>
    <thead>
        <tr>
            <th>机器名称</th>
        </tr>
    </thead>
    <tbody>"

for i in "${!LIST[@]}";do
  port=22 # default
  name=${LIST[i]}
  check=$(echo q | telnet -e 'q' "$name" "$port" && echo "@ok@" || echo "@fail@")
  check=$(echo "$check" | grep "@ok@")

  # telnet host port 有通
  if test "$CODE" = "@ok@"; then
    unset 'LIST[i]'
  else
    printf "%s fail\n" "$name"
    HTML+="<tr>
            <td>${name}</td>
          </tr>"
  fi
done

HTML+="</tbody></table>"
if [ ${#LIST[@]} -ne 0 ];then
  echo $HTML
  # mailservice "[op] site down list:" "$HTML" "$MAIL_LIST"
fi

#结束时间
end=$(date +%s)
spend=$(expr "$end" - "$begin")
echo "花费时间为$spend秒"

printf "\n\n"
```
