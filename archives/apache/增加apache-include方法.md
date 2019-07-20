

@@好久以前寫的

先備忘一下
```sh
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
apache2Dir="/etc/apache2"
fname="default_000"
fpath="$apache2Dir/sites-enabled/$fname"

start="<Directory \/var\/www"
end="<\/Directory>"
pattern="Options"
appendment="Includes"
#apache2 include's permission depends upon user's ip. So it won't deny from .htaccess, unless use other language's include(php?).

sed -i "/$start/,/$end/{s/\($pattern.*\)/\1 $appendment/}" $fpath
service apache2 restart
```
