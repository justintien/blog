# sh

## google-style http://zh-google-styleguide.readthedocs.io/en/latest/google-shell-styleguide/formatting/
```sh
# 所有的错误信息都应该被导向STDERR。
err() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}
# example
if ! do_something; then
    err "Unable to do_something"
    exit "${E_DID_NOTHING}"
fi

# 行的最大长度为80个字符。
# DO use 'here document's
cat <<END;
I am an exceptionally long
string.
END

# Embedded newlines are ok too
long_string="I am an exceptionally
  long string."

# All fits on one line
command1 | command2

# Long commands
command1 \
  | command2 \
  | command3 \
  | command4
```

## function

```sh
function log () {
  echo $@
}
function error () {
  (>&2 echo $@)
}
function getLatestFile() {
  folder=$1
  echo $(find $folder -type f | sort -r | head -n 1)
}
function utilMysqlStarted() {
  TRY_COUNT_MAX=5
  try_count=0
  CONTAINER=$1
  until docker exec $CONTAINER mysqladmin ping &>/dev/null; do
    let try_count=try_count+1

    # 失敗且嘗試次數超過最大嘗試次數則寫入 log
    if [ $try_count -gt $TRY_COUNT_MAX ];then
        echo -e "${CONTAINER_NAME_LIST[0]} start failed!";
        exit 2
    fi
    echo -e "$CONTAINER starting..."; sleep 3
  done
}
function showUsage(){
read -r -d '' usage << EOM
Usage: ./renew.cert.sh [Command | Domain]

Command:
    all: renew all default domains (${DEFAULT_LIST[@]})

Domain: renew one domain
    example: ./renew.cert.sh www.nutsbp.com

EOM
echo "$usage"
}
```

## 乱数字串数字

```sh
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
cat /dev/urandom | tr -dc 'a-zA-Z0-9@' | fold -w ${1:-32} | head -n 1
< /dev/urandom tr -dc _A-Z-a-z-0-9@ | head -c${1:-32};echo;
```

- see <https://gist.github.com/earthgecko/3089509>

```sh

#!/bin/bash
# bash generate random alphanumeric string
#

# bash generate random 32 character alphanumeric string (upper and lowercase) and
NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

# bash generate random 32 character alphanumeric string (lowercase only)
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1

# Random numbers in a range, more randomly distributed than $RANDOM which is not
# very random in terms of distribution of numbers.

# bash generate random number between 0 and 9
cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | head --bytes 1

# bash generate random number between 0 and 99
NUMBER=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | sed -e 's/^0*//' | head --bytes 2)
if [ "$NUMBER" == "" ]; then
  NUMBER=0
fi

# bash generate random number between 0 and 999
NUMBER=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | sed -e 's/^0*//' | head --bytes 3)
if [ "$NUMBER" == "" ]; then
  NUMBER=0
fi
```

### Bash变量的知识点归纳（二） [see](http://www.jianshu.com/p/b0d8ab8e0229)

<http://www.jianshu.com/p/30aaddb84330>

```sh
# 获取变量长度
${#变量名}

# 替换匹配的的字符串
# 替换第一个找到的
${变量名/匹配字符串/替换后的字符串}
# 替换全部
${变量名//匹配字符串/替换后的字符串}
# 替换最开头字
${变量名/#匹配字符串/替换后的字符串}
# 替换最末尾
${变量名/%匹配字符串/替换后的字符串}

# 提取指定位置后面指定长度的字符串
${变量名:开始提取位置:提取的长度}
```

# see <http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_10_02.html>

shell <http://codewiki.wikidot.com/shell-script>

```sh
在shell script 中if 條件式的基本語法如下
 


if [  CONDITION ]
then
    ......
else
    ......
fi


if test CONDITION
the
   .....
else
   .....
fi
另外在if 條件式中可以利用下面的判斷
[ string1 = string2 ]    string1 and string2 are equal
[ string1 != string2 ]    string1 and string2 are not equal
[ string1 \< string2 ]    string1 is lexically less than string2
(e.g. 'a' is less than 'b')
[ string1 \> string2 ]    string1 is lexically greater than string2

(e.g. 'b' is greater than 'a')
[ -z string ]    string is zero (e.g. a empty string)
[ -n string ]    string is nonzero (e.g. a VAR string)
[ -e file ]    file exists
[ -f file ]    file is a file
[ -d file ]    file is a directory
[ -c file ]    file is a character device
[ -b file ]    file is a block device
[ -p file ]    file is a named pipe
[ -s file ]    file is not empty
[ -k file ]    file's sticky bit is set
[ -S file ]    file is a socket
[ -L file ]    file is a symbolic link
[ -r file ]    file is readable by user
[ -w file ]    file is writeable by user
[ -x file ]    file is executeable by user
[ -O file ]    file is owner by user
[ -G file ]    file is group owned by a greoup
[ -u file ]    file has its set user ID bit set
[ -g file ]    file has its group user ID bit set
[ file1 -nt file2 ]    file1 is newer than file2
[ file1 -ot file2 ]    file1 is older than file2
[ file -ef file2 ]    file1 is another name for file2
[ n1 -eq n2 ]    true if integer n1 = integer n2
[ n1 -ne n2 ]    true if integer n1 <> n2
[ n1 -gt n2 ]    true if n1 > n2
[ n1 -ge n2 ]    true if n1 >= n2
[ n1 -lt n2 ]    true if n1 < n2
[ n1 -le n2 ]    true if n1 <= n2
常用的系統符號變數
$#    參數的數目
$*    代表所有參數
$?    Exit status of previous command
$$    PID of this shell's process
$!    PID of the most recently started backgroup job
```

## 特殊变量列表

变量 | 含义
-- | -------------------------------------------------
$0 | 当前脚本的文件名
$n | 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
$# | 传递给脚本或函数的参数个数。
$* | 传递给脚本或函数的所有参数。
$@ | 传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到。
$? | 上个命令的退出状态，或函数的返回值。
$$ | 当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。

## 檢測 mysql is running

```sh
until mysqladmin ping &>/dev/null; do
  echo -e "starting..."; sleep 3
done
```



### see https://stackoverflow.com/questions/18258804/how-to-catch-timeout-errors-in-a-curl-shell-script
Execute following as script.sh http://www.google.com/.
-D - dump headers to file
-o - write response to file
-s - be silent
-w - display value of specified variables

#!/bin/bash

RESPONSE=response.txt
HEADERS=headers.txt

status=$(curl -s -w %{http_code} $1 -o $RESPONSE)

# or
#curl -s -D $HEADERS $1 -o $RESPONSE
#status=$(cat $HEADERS | head -n 1 | awk '{print $2}')

echo $status
Use $status and $RESPONSE for further processing.


##### test
```sh
#!/bin/bash
# 假设 /data/test.sh

printf "%s:%s\n" '$(dirname $(readlink -f $0))' $(dirname $(readlink -f $0 ))
# / : /data/test.sh
# /data: /data/test.sh
printf "%s:%s\n" '$(dirname "$0")' $(dirname "$0")
# / : /data/test.sh
# /data: test.sh
printf "%s:%s\n" '$(dirname "${BASH_SOURCE[0]}")' $(dirname "${BASH_SOURCE[0]}")
# / : /data/test.sh
# /data: test.sh

# 绝对路径 $(dirname $(readlink -f $0 ))
```


```sh
# time curl -o /dev/null http://az.img.nutsbp.com/public/nutsbp/image/user_image/45812/50274860-42bb-11e8-999d-a9207b883cd6.png?basic=info;
for i in {1..100};
do
  TIME=$(curl -o /dev/null -s -w %{time_total}\\n http://az.img.nutsbp.com/public/nutsbp/image/user_image/45812/50274860-42bb-11e8-999d-a9207b883cd6.png?basic=info);
  echo "${TIME}"
done
```