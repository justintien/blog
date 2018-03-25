# jq https://stedolan.github.io/jq/manual
## 读档案 format json
```sh

# 读档 & filter
tail -n 100 access.log | jq 'select(.req.url == "/project")'

tail -n 100 access.log | jq '.req | select(.url == "/project")'

# 包含内容
tail -n 100 access.log | jq '.req | select(.url | contains("/project"))'

tail -n 10000 access.log | jq '.res["time-ms"]'

tail -n 1000 access.log | jq '. | select(.res["time-ms"] > 1000)'

jq 'select(.geo != null)' all.json

# morgan dev format: :method :url :status :response-time ms - :res[content-length]
tail -n 1 -f access.log | jq '(.req.method + " " + .req.url + " " + (.res.status | tostring) + " " + (.res["time-ms"] | tostring) + " - " + (.res["content-length"] | tostring))'

tail -n 1 -f access.log | jq '(.req.method + ": " + .req.url + " " + (.res["time-ms"] | tostring) + " " + .date)'
```
