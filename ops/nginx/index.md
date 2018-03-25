- proxy timeout 设置
```conf
proxy_connect_timeout      120s;
proxy_send_timeout         120s;
proxy_read_timeout         120s;
```

- location 匹配
```sh
location匹配命令

~      #波浪线表示执行一个正则匹配，区分大小写
~*    #表示执行一个正则匹配，不区分大小写
^~    #^~表示普通字符匹配，如果该选项匹配，只匹配该选项，不匹配别的选项，一般用来匹配目录
=      #进行普通字符精确匹配
@     #"@" 定义一个命名的 location，使用在内部定向时，例如 error_page, try_files


＝：精确匹配
^~：精确前缀匹配
~：区分大小写的正则匹配
~*：不区分大小写的正则匹配
/uri：普通前缀匹配
/：通用匹配

# see http://seanlook.com/2015/05/17/nginx-location-rewrite/
# see https://moonbingbing.gitbooks.io/openresty-best-practices/ngx/nginx_local_pcre.html
```
