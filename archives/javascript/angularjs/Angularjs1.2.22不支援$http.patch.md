
#....

首先
```
$http.patch()
```
是無用的...因為1.2.22根本沒這function


之後，改為以下做法
```js
$http(
url:'/api/user/pw'
params:{id:1,local:'tw'}
method:'PATCH'
)
```

送出的卻是
```
PATCH /api/user/pw?id=1&local=tw HTTP/1.1
```

一整個無言.

只好改版本
