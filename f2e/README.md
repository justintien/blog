# f2e


> javascript

## framework

- [vue](/f2e/js/framework/vue.md)
- [react](/f2e/js/framework/react.md#react)
- [cyclejs](/f2e/js/framework/cyclejs.md#cyclejs)
- [rxjs](/f2e/js/framework/rxjs.md#rxjs)

## lib
- [fabrics](https://github.com/kangax/fabric.js)
- [localForage](https://github.com/localForage/localForage)
- [lodash](/f2e/js/lodash.md)
- [不可错过的javascript迷你库
](https://juejin.im/entry/5aa728fbf265da239147c59a?utm_source=gold_browser_extension)
- [动画库](https://github.com/greensock/GreenSock-JS)

## blog
- https://github.com/fwon/blog
- [我们整理了一份 GitHub 上的微信小程序开发工具名单（文末附链接）](https://mp.weixin.qq.com/s/DxwkB7tZH4lzt3vUU_dunw)
- [数组的遍历你都会用了，那Promise版本的呢 数组](https://segmentfault.com/a/1190000014598785)

## 鐵人賽文章
- [重新認識 JavaScript 系列](https://ithelp.ithome.com.tw/users/20065504/ironman/1259)
- [30天精通 RxJS](https://ithelp.ithome.com.tw/ironman/articles/1199)
- [認識 Functional Programming](https://ithelp.ithome.com.tw/articles/10191612)

### 其他

> 通过rgb值判断颜色深浅: https://blog.csdn.net/qq_36843675/article/details/79448051

```js
// 通过rgb值判断颜色深浅
// 通过把 RGB 模式转换成 YUV 模式，而 Y 是明亮度（灰阶），因此只需要获得 Y 的值而判断他是否足够亮就可以了：
if(r*0.299 + g*0.578 + b*0.114 >= 192){ //浅色
    ...
}else{  //深色
    ...
}
```

