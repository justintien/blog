# curl

- 上传档案
```sh
curl \
  'http://api.com' \
  -F "file=@/Users/justintien/projects/dartcome-server/test/test.jpg"
```
- POST with JSON
```sh
#!/bin/bash
curl 'http://api.com' \
-X POST \
-H 'content-type: application/json;charset=utf-8' \
-H 'accept: application/json, text/plain, */*' \
-v \
-d '[]'
```
