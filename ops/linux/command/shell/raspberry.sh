#!/bin/bash

DATE_END_ShangHai=$(TZ=":UTC" date +%Y-%m-%d_%H:%M:%S%z)
LOG_FILE=/data/log/temperature_$DATE_END_ShangHai.log

printf "%-15s%5s\n" "TIMESTAMP" "TEMP(degC)" > $LOG_FILE
printf "%20s\n" "......................" >> $LOG_FILE

while true
do
    temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
    timestamp=$(date +'%s')
    printf "%-15s%5s\n" "$timestamp" "$temp" >> $LOG_FILE
    sleep 1
done