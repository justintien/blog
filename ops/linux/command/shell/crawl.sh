#!/bin/bash

# printTable
function printTable()
{
    local -r delimiter="${1}"
    local -r data="$(removeEmptyLines "${2}")"

    if [[ "${delimiter}" != '' && "$(isEmptyString "${data}")" = 'false' ]]
    then
        local -r numberOfLines="$(wc -l <<< "${data}")"

        if [[ "${numberOfLines}" -gt '0' ]]
        then
            local table=''
            local i=1

            for ((i = 1; i <= "${numberOfLines}"; i = i + 1))
            do
                local line=''
                line="$(sed "${i}q;d" <<< "${data}")"

                local numberOfColumns='0'
                numberOfColumns="$(awk -F "${delimiter}" '{print NF}' <<< "${line}")"

                # Add Line Delimiter

                if [[ "${i}" -eq '1' ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi

                # Add Header Or Body

                table="${table}\n"

                local j=1

                for ((j = 1; j <= "${numberOfColumns}"; j = j + 1))
                do
                    table="${table}$(printf '#| %s' "$(cut -d "${delimiter}" -f "${j}" <<< "${line}")")"
                done

                table="${table}#|\n"

                # Add Line Delimiter

                if [[ "${i}" -eq '1' ]] || [[ "${numberOfLines}" -gt '1' && "${i}" -eq "${numberOfLines}" ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi
            done

            if [[ "$(isEmptyString "${table}")" = 'false' ]]
            then
                echo -e "${table}" | column -s '#' -t | awk '/^\+/{gsub(" ", "-", $0)}1'
            fi
        fi
    fi
}

function removeEmptyLines()
{
    local -r content="${1}"

    echo -e "${content}" | sed '/^\s*$/d'
}

function repeatString()
{
    local -r string="${1}"
    local -r numberToRepeat="${2}"

    if [[ "${string}" != '' && "${numberToRepeat}" =~ ^[1-9][0-9]*$ ]]
    then
        local -r result="$(printf "%${numberToRepeat}s")"
        echo -e "${result// /${string}}"
    fi
}

function isEmptyString()
{
    local -r string="${1}"

    if [[ "$(trimString "${string}")" = '' ]]
    then
        echo 'true' && return 0
    fi

    echo 'false' && return 1
}

function trimString()
{
    local -r string="${1}"

    sed 's,^[[:blank:]]*,,' <<< "${string}" | sed 's,[[:blank:]]*$,,'
}
# printTabl end

# dlsite 新->舊 前30筆
HTML=$(curl 'https://www.dlsite.com/maniax/fsr/=/language/jp/sex_category%5B0%5D/male/work_category%5B0%5D/doujin/work_type%5B0%5D/RPG/work_type_name%5B0%5D/%E3%83%AD%E3%83%BC%E3%83%AB%E3%83%97%E3%83%AC%E3%82%A4%E3%83%B3%E3%82%B0/per_page/30/without_order/1/page/1/order/release_d')


DATE_END_ShangHai=$(TZ=":Asia/Shanghai" date +%Y-%m-%d_%H:%M:%S%z)

# function join { local IFS="$1"; shift; echo "$*"; }

result=$(echo ${HTML} | grep -Eo "link_RJ[0-9]+" | grep -Eo "RJ[0-9]+")

idstring=$(echo $result | sed -e 's/ /,/g')

result2=$(curl "https://www.dlsite.com/maniax/product/info/ajax?product_id=${idstring}")

content=$(echo $result2 | jq 'to_entries[] | ["https://www.dlsite.com/maniax/work/=/product_id/" + .key + ".html", .value.price, .value.dl_count ] | @csv' | sed -e 's/^"/ /g' -e 's/"$/ /g' | awk -v FS="," 'BEGIN{printf "URL,PRICE,COUNT\n"}{printf "%s,%s,%s\n",$1,$2,$3}')

title="dlsite release latest 30 \n Ben: RJ249278 \n date:${DATE_END_ShangHai}\n"
table=$(printTable "," "${content}")
fetch_data() {
  cat << EOF
    {
        "channel": "#dlsite",
        "username": "webhookbot",
        "text": "${title}${table}",
        "icon_emoji": ":ghost:"
    }
EOF
}

curl -v <webhook_url> -d "$(fetch_data)"