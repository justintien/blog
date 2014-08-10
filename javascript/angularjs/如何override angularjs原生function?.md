#如何override angularjs原有的function?

[解決方法](http://manikanta.com/blog/2013/07/25/decorate-angularjs-http-service-to-convert-put/)


####嘗試案例1
嘗試inject，讓所有的$http都有ngProgress反應
但是失敗...
```javascript
app.config('$http', ['$provide', function($provide) {
                $provide.decorator('$http', ['$delegate', 'ngProgress', function($http, ngProgress) {
                        //start progress
                        ngProgress.start();
                        //backup success & error method
                        $http._success = $http.success;
                        $http._error = $http.error;
                        //overwrite
                        $http.success = function(data, status, headers, config) {
                            ngProgress.complete();
                            return $http._success(data, status, headers, config);
                        };
                        $http.error = function(data, status, headers, config) {
                            ngProgress.complete();
                            return $http._error(data, status, headers, config);
                        };
                        return $http;
                    }]);
            }]);
```

####嘗試2
還是失敗...
```
app.factory('$http', ['$http', 'ngProgress', function($http, ngProgress) {
                //start progress
                ngProgress.start();
                //backup success & error method
                $http._success = $http.success;
                $http._error = $http.error;
                //overwrite
                $http.success = function(data, status, headers, config) {
                    ngProgress.complete();
                    return $http._success(data, status, headers, config);
                };
                $http.error = function(data, status, headers, config) {
                    ngProgress.complete();
                    return $http._error(data, status, headers, config);
                };
                return $http;
            }])
```


####問題
```
使用$provide.decorator時
無法inject其他非native的service...
有error出現，尚不知道如何解決..
```

