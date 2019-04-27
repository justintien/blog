#!/bin/bash

HTML=$(curl 'https://www.dlsite.com/maniax/fsr/=/language/jp/sex_category%5B0%5D/male/work_category%5B0%5D/doujin/work_type%5B0%5D/RPG/work_type_name%5B0%5D/%E3%83%AD%E3%83%BC%E3%83%AB%E3%83%97%E3%83%AC%E3%82%A4%E3%83%B3%E3%82%B0/per_page/30/without_order/1/page/1/order/release_d')


DATE_END_ShangHai=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)

# function join { local IFS="$1"; shift; echo "$*"; }

result=$(echo ${HTML} | grep -Eo "link_RJ[0-9]+" | grep -Eo "RJ[0-9]+")

idstring=$(echo $result | sed -e 's/ /,/g')

result2=$(curl "https://www.dlsite.com/maniax/product/info/ajax?product_id=${idstring}")

content=$(echo $result2 | jq 'to_entries[] | ["https://www.dlsite.com/maniax/work/=/product_id/" + .key + ".html", .value.price, .value.dl_count] | @csv' | sed -e 's/^"/ /g' -e 's/"$/ /g' | awk -v FS="," 'BEGIN{printf "dlsite release latest 30 \n Ben: RJ249278 %s \nURL\tPRICE\tCOUNT",$DATE_END_ShangHai,ORS;print "============"}{printf "%s\t%s\t%s%s",$1,$2,$3,ORS}')

fetch_data() {
  cat << EOF
    {
        "channel": "#dlsite",
        "username": "webhookbot",
        "text": "${content}",
        "icon_emoji": ":ghost:"
    }
    EOF
EOF
}

curl -v https://hooks.slack.com/services/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 -d "$(fetch_data)"