Last-Modified: {docsify-updated}

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

- size
```sh
# curl --compressed -so /dev/null http://az.cdn.nutsbp.nutsb.com/007/nuts-component/component/jquery/jquery-3.2.1.min.js -w '%{size_download}'

URL=http://az.cdn.nutsbp.nutsb.com/007/nuts-component/component/jquery/jquery-3.2.1.min.js

curl ${URL} -sL --write-out '%{size_download}' --output /dev/null
```