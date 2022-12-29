Last-Modified: {docsify-updated}

# find


```sh
# 查找目錄最後修改時間在 99 天以前的，並且刪除它 (慎用)
find ./ -type d -mtime +99 -exec rm -rfv {} \;
```