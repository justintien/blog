Last-Modified: {docsify-updated}

- proxy timeout 設置
```conf
proxy_connect_timeout      120s;
proxy_send_timeout         120s;
proxy_read_timeout         120s;
```

- location 匹配
```sh
location匹配命令

~      #波浪線表示執行一個正則匹配，區分大小寫
~*    #表示執行一個正則匹配，不區分大小寫
^~    #^~表示普通字符匹配，如果該選項匹配，只匹配該選項，不匹配別的選項，一般用來匹配目錄
=      #進行普通字符精確匹配
@     #"@" 定義一個命名的 location，使用在內部定向時，例如 error_page, try_files


＝：精確匹配
^~：精確前綴匹配
~：區分大小寫的正則匹配
~*：不區分大小寫的正則匹配
/uri：普通前綴匹配
/：通用匹配

# see http://seanlook.com/2015/05/17/nginx-location-rewrite/
# see https://moonbingbing.gitbooks.io/openresty-best-practices/ngx/nginx_local_pcre.html
```
