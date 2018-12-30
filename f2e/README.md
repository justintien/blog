Last-Modified: {docsify-updated}

# 前端

> 我是前端，前端是我，我什么都会

## javascript

> github趋势: https://github.com/trending/javascript?since=daily
> bestofjs: https://bestofjs.org/projects

### framework

> 目前我最常用的是 vue2, 期待 vu3 支援 typescript

- [vue2](/f2e/js/framework/vue.md#vue)
- [react](/f2e/js/framework/react.md#react)
- [cyclejs](/f2e/js/framework/cyclejs.md#cyclejs)
- [rxjs - 响应式编程](/f2e/js/framework/rxjs.md#rxjs)

### lib

- [fabrics - canvas framework](https://github.com/kangax/fabric.js)
- [localForage - 强大的 local db](https://github.com/localForage/localForage)
- [lodash](/f2e/js/lodash.md)
- [不可错过的javascript迷你库
](https://juejin.im/entry/5aa728fbf265da239147c59a?utm_source=gold_browser_extension)

- [动画库](https://github.com/greensock/GreenSock-JS)
- 前+后端(js)
  - [lowdb (本地 db)](https://github.com/typicode/lowdb)
  - http request client:
    - [axios (目前最流行)](https://github.com/axios/axios)
    - [request (promise 要另外裝...)](https://github.com/request/request)
    - [node-fetch - 实现 browser native fetch](https://github.com/bitinn/node-fetch/)
  - Other:
    - [fake response](http://www.fakeresponse.com/)
- [挺有意思 手绘element组件](https://github.com/wiredjs/wired-elements)

### testing

> 目前我最常用的是 mocha, 未来考虑 jest

- [ava](https://github.com/avajs/ava)
  - [ava-practice](http://i5ting.github.io/ava-practice/)
- [jest](https://github.com/facebook/jest)
- [mocha](https://github.com/mochajs/mocha)

### 打包工具

- [webpack 4](https://webpack.js.org/)
  - [中文站](https://webpack.docschina.org/)
  - [Webpack 4 和单页应用入门](https://github.com/fenivana/webpack-and-spa-guide)
- [browserify](http://browserify.org/)

### 任务工具

- [grunt](https://gruntjs.com/)
- [gulp](https://gulpjs.com/)

### blog

- [fwon - blog](https://github.com/fwon/blog)
- [我们整理了一份 GitHub 上的微信小程序开发工具名单（文末附链接）](https://mp.weixin.qq.com/s/DxwkB7tZH4lzt3vUU_dunw)
- [数组的遍历你都会用了，那Promise版本的呢 数组](https://segmentfault.com/a/1190000014598785)
- [dwqs - blog](https://github.com/dwqs/blog/issues)
  - [你有必要知道的 25 个 JavaScript 面试题](https://github.com/dwqs/blog/issues/17)
- [javascript algorithms](https://github.com/trekhleb/javascript-algorithms)
- [科技橘子](https://blog.techbridge.cc/)

> ithome 鐵人賽文章

- [重新認識 JavaScript 系列](https://ithelp.ithome.com.tw/users/20065504/ironman/1259)
- [30天精通 RxJS](https://ithelp.ithome.com.tw/ironman/articles/1199)
- [認識 Functional Programming](https://ithelp.ithome.com.tw/articles/10191612)

> 其它

- 通过rgb值判断颜色深浅: https://blog.csdn.net/qq_36843675/article/details/79448051
  

```js
// 通过rgb值判断颜色深浅
// 通过把 RGB 模式转换成 YUV 模式，而 Y 是明亮度（灰阶），因此只需要获得 Y 的值而判断他是否足够亮就可以了：
if(r*0.299 + g*0.578 + b*0.114 >= 192){ //浅色
    ...
}else{  //深色
    ...
}
```

- 移动端拉起软键盘坑: http://www.iamaddy.net/2016/11/mobile-keyboard-javascript/
  - [CanvasInput](https://goldfirestudios.com/blog/108/CanvasInput-HTML5-Canvas-Text-Input)
- [ES6 系列之模拟实现 Symbol 类型](https://segmentfault.com/a/1190000015262174)
- [前端大牛们](https://news.cnblogs.com/n/500861/)
- [关于 npm 前端模块的那点儿事儿（ES2015, Babel, UMD）](http://dxy-biz-developer.github.io/2016/03/things-about-npm-front-end-modules/)
- [進階 React Component Patterns 筆記（上）](https://blog.techbridge.cc/2018/06/27/advanced-react-component-patterns-note/)
- [前端性能与异常上报](https://segmentfault.com/a/1190000015808043)
- [javascript实现的一些数据结构知识](https://github.com/captainwz/JSer-Algorithm)

### Admin Template & Dashboard

- [adminLTE](https://github.com/almasaeed2010/AdminLTE/releases)
- [coreui](https://github.com/coreui/coreui-free-bootstrap-admin-template)
- [gentelella](https://github.com/puikinsh/gentelella)
- [quasar](https://github.com/quasarframework/quasar)
- [vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)
- [ngx-admin](https://github.com/akveo/ngx-admin)
- [ant-design-pro](https://github.com/ant-design/ant-design-pro)
- [blur-admin](https://github.com/akveo/blur-admin)
- github: https://github.com/search?o=desc&q=admin&s=stars&type=Repositories


## Android

> TODO: 还没机会写 android...

## iOS

> TODO: 还没机会写 ios...

## app 托管平台

- https://www.pgyer.com/doc
- https://fir.im/