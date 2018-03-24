


```
<VirtualHost *:80>
ServerName demo.up9cloud.net                  
RewriteEngine On                                      

#將http://demo.up9cloud.net/project (無/)
#重新導入至有/
RewriteCond %{REQUEST_URI} ^/([^/]+)$ [NC]            
RewriteRule ^(.*)$ http://%{SERVER_NAME}/%1/ [R=301,L]
                                                      
#寫入想要導入的地方...
RewriteRule ^(.*)$ http://xxx.xxx.xxx.xxx/$1 [P]      
</VirtualHost>                                        
```
