#!/bin/bash
# Author: Justin
# Date: 2018-10-28
# Modified: 2018-10-28
# Description:

AFTER=$(echo | openssl s_client -servername lolimew.com -connect lolimew.com:443 2>/dev/null | openssl x509 -noout -dates | grep After)

END=$(date -d "${AFTER/notAfter=/}" +%s)
NOW=$(date +%s)

DIFF=$(( (END - NOW) / 86400 )) # days

function POST_TG() {
    curl -v -X POST https://telegram.jiapan.tw/broadcast -H 'content-type: application/json' -d $1
}

if [ $DIFF -lt 3 ]; then
    JSON="{\"test_domain\":\"lolimew.com\",\"days\":\"$DIFF\"}"
    POST_TG $JSON
fi