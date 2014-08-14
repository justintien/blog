
#....


以下做法
```js
$http(
url:'/api/user/pw'
params:{id:1,local:'tw'}
method:'PATCH'
)
```

居然會送出
```
PATCH /api/user/pw?id=1&local=tw HTTP/1.1
```

一整個無言...
