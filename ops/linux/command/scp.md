Last-Modified: {docsify-updated}


# scp

```sh

# 複整 data 目錄至 local ./
scp -vrp vm:/data ./
# 結果 local 會有此目錄
# ./data/

# 複製 data 的所有檔案至 local ./ (注意結尾 / 的區別)
scp -vrp vm:/data/ ./
# 結果 local ./ 會有 很多檔案
# ./
```

```
用法舉例：

1、複製遠程服務器的文件到本地：
scp -P888 root@120.18.50.33:/data/ha97.zip /home/
2、複製遠程服務器的目錄到本地：
scp -vrp -P888 root@120.18.50.33:/data/ha97/ /home/
3、複製本地的文件到遠程服務器：
scp -P888 /home/ha97.zip root@120.18.50.33:/data/
4、複製本地的目錄到遠程服務器：
scp -vrp -P888 /home/ root@120.18.50.33:/data/

SCP 命令語法
scp [-1245BCpqrv] [-c cipher] [F ssh_config] [-I identity_file] [-l limit] [-o ssh_option] [-P port] [-S program] [[user@]host1:] file1 […] [[suer@]host2:]file2

SCP 命令說明
Scp在主機間複製文件。他使用 ssh(1)作為數據傳輸。而且用同樣認證和安全性。 scp將在認證中請求輸入密碼所有的文件可能需要服務器和用戶的特別描述來指明文件將被複制到/從某臺服務器。兩個遠程登錄的服務器間的文件複製是允許的。

SCP 命令選項
-1 強制scp 用協議1
-2 強制scp 用協議2
-4 強制scp用IPV4的網址
-6 強制scp用IPV6的網址
-B 選擇批處理模式（防止輸入密碼）
-C 允許壓縮。 標註-C到ssh(1)來允許壓縮
-c cipher
選擇cipher來加密數據傳輸。這個選項直接傳遞到ssh(1)
-F ssh_config
設定一個可變動的用戶配置給ssh.這個選項直接會被傳遞到ssh(1)
-i identity_file
選擇被RSA認證讀取私有密碼的文件。這個選項可以直接被傳遞到ssh(1)
-l limit
限制傳輸帶寬，也就是速度 用Kbit/s的速度
-o ssh_option
可以把ssh_config中的配置格式傳到ssh中。這種模式對於說明沒有獨立的scp文件中斷符的scp很有幫助。關於選項的如下。而他們的值請參看ssh_config(5)
-P port
指定連接遠程連接端口。注意這個選項需要寫成大寫的模式。因為-p已經早保留了次數和模式
-S program
指定一個加密程序。這個程序必須可讀所有ssh(1)的選項。
-p 指定修改次數，連接次數，還有對於原文件的模式
-q 把進度參數關掉
-r 遞歸的複製整個文件夾
-S program
指定一個加密程序。這個程序必須可讀所有ssh(1)的選項。
-V 冗餘模式。 讓 scp 和 ssh(1) 打印他們的排錯信息， 這個在排錯連接，認證，和配置中非常有用。

SCP 命令診斷
scp 返回0 成功時，不成功時返回值大於0
```