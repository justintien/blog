#!/bin/bash
# Author: Justin Tien (Jiapan)
# Date: 2018-01-21
# Modified: 2018-05-14
# Description:
#  - git pull all repos for each orgs or user

# usage
read -r -d '' usage << EOM
Usage: "$0" <authorization-basic> <api-url>

  <> 参数为必须
  [] 为选用

Env:
  DIST_FOLDER: 目的地资料夹路径 (预设为 ~/projects)

Example:
  "$0" basic_token https://api.github.com/orgs/:name/repos?per_page=100

EOM

# check parameters
if [ "$#" -lt 2 ]; then
    echo "$usage"
    exit 2
fi

# HASH=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 6`
# required parameters
AUTHORIZATION_BASIC=$1
API_URL=$2
shift

function log () {
  echo [`date`] $@
}
function error () {
  (>&2 echo [`date`] $@)
  exit 2
}

if [ -z "$AUTHORIZATION_BASIC" ];then
  echo "Please enter ${AUTHORIZATION_BASIC}"
  exit 2
fi

if [ -z "$DIST_FOLDER" ];then
  DIST_FOLDER=~/projects
fi

# 照 字母 排列 目前 78个 repo
LIST=`curl -s -X GET -H "Authorization: Basic ${AUTHORIZATION_BASIC}" ${API_URL}`
ERROR=$(echo "${LIST}" | jq -r '.message')
if [ ! -z "$ERROR" ];then
  error $ERROR
fi

DATE=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)

printf "[%s]\n" "$DATE"


for row in $(echo "${LIST}" | jq -r '.[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }
    REPO=$(_jq '.name')
    DIRECTORY=${DIST_FOLDER}/${REPO}
    if [ -d "${DIRECTORY}" ]; then
        log "[${REPO}] cd ${DIRECTORY}"
        cd "$DIRECTORY" || exit
        log "[${REPO}] git pull"
        git pull
    else
        log "[${REPO}] cd ${DIST_FOLDER}"
        cd ${DIST_FOLDER} || exit
        log "[${REPO}] git clone ${url}"
        git clone ${url}
    fi
done