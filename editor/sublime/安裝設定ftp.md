
#install package control first!

[package control]

##install ftp package

```
Preferences->package controll
install package->SFTP
```

##ftp config


######initial config (會自動產生sftp-config.json檔)

```
[folder]->(right click)->SFTP/FTP->Map to remote...
```

######sftp-config.json

此檔案不會上傳(已經列入在ignore_regexes裡)，可安心寫入帳密。

若使用git，記得要把此檔案加入.gitignore。
```json
{
    // The tab key will cycle through the settings when first created
    // Visit http://wbond.net/sublime_packages/sftp/settings for help
    
    // sftp, ftp or ftps
    "type": "sftp",

    "save_before_upload": true,
    "upload_on_save": false, //true: 存檔後自動上傳
    "sync_down_on_open": false,
    "sync_skip_deletes": false,
    "sync_same_age": true,
    "confirm_downloads": false,
    "confirm_sync": true,
    "confirm_overwrite_newer": false,
    
    "host": "example.com",
    "user": "username",
    //"password": "password",
    //"port": "22",
    
    "remote_path": "/example/path/", //remote的base path
    "ignore_regexes": [
        "\\.sublime-(project|workspace)", "sftp-config(-alt\\d?)?\\.json",
        "sftp-settings\\.json", "/venv/", "\\.svn/", "\\.hg/", "\\.git/",
        "\\.bzr", "_darcs", "CVS", "\\.DS_Store", "Thumbs\\.db", "desktop\\.ini"
    ],
    //"file_permissions": "664",
    //"dir_permissions": "775",
    
    //"extra_list_connections": 0,

    "connect_timeout": 30,
    //"keepalive": 120,
    //"ftp_passive_mode": true,
    //"ftp_obey_passive_host": false,
    //"ssh_key_file": "~/.ssh/id_rsa",
    //"sftp_flags": ["-F", "/path/to/ssh_config"],
    
    //"preserve_modification_times": false,
    //"remote_time_offset_in_hours": 0,
    //"remote_encoding": "utf-8",
    //"remote_locale": "C",
    //"allow_config_upload": false,
}
```



[package control]:https://github.com/up9cloud/blog/blob/master/editor/sublime/%E5%AE%89%E8%A3%9Dpackage%20control.md
