Last-Modified: {docsify-updated}

# 前端

> 我是前端，前端是我，我什麼都會

- [* 前端優質網絡內容](/f2e/收集.md)
- [Web前端開發規範手冊](https://segmentfault.com/a/1190000014317104)
- [前端大記事](http://qianduanyule.club/)
- [The best front-end hacking cheatsheets — all in one place.](https://medium.freecodecamp.org/modern-frontend-hacking-cheatsheets-df9c2566c72a)
- [log 收集](https://1c7.me/2018-8-31-front-end-error-tracking/)

## javascript

> github趨勢: https://github.com/trending/javascript?since=daily
> bestofjs: https://bestofjs.org/projects

- js中的~~：轉換成整型數字的神器（效率）: https://blog.csdn.net/superit401/article/details/80662476
  - https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/Bitwise_Operators
  - 缺點: 不易閱讀 (一般人不容易理解 ~~ )
- [jsliang 的文檔庫. 裡面包含了所有的前端文章，例如 vue、react,、angular、微信小程序、設計模式](https://github.com/LiangJunrong/document-library)

avascript中寫好條件語句的五個技巧
https://juejin.im/post/5c4fa79b51882525487c6fe0
記第一個Vue項目臺前幕後的經歷
https://juejin.im/post/5c4f1f0de51d4552d573b784
vue系列之面試總結
https://segmentfault.com/a/1190000018060680
每晚8點前端日報：http://t.cn/RaTsQX7，歡迎star：http://t.cn/Rc5XyB4

### css

- https://github.com/chokcoco/CSS-Inspiration
- http://zh-tw.learnlayout.com/no-layout.html
- 不怕你用不上！CSS 列表項佈局技巧 https://juejin.im/post/5c171f0ef265da61553abade

### framework

> 目前我最常用的是 vue2, 期待 vu3 支援 typescript

- [vue2](/f2e/js/framework/vue.md#vue)
- [react](/f2e/js/framework/react.md#react)
- [cyclejs](/f2e/js/framework/cyclejs.md#cyclejs)
- [rxjs - 響應式編程](/f2e/js/framework/rxjs.md#rxjs)
- redux
  - https://cn.redux.js.org/docs/recipes/ReducingBoilerplate.html
- framework list: http://usablica.github.io/front-end-frameworks/compare.html?fbclid=IwAR0zn_7AiNI3XOlL-EjwUW2kuA0xedrnqPBn0hc8UUkOthLnfM2tTcTqhwA

### lib

- [fabrics - canvas framework](https://github.com/kangax/fabric.js)
- [localForage - 強大的 local db](https://github.com/localForage/localForage)
- [lodash](/f2e/js/lodash.md)
- [不可錯過的javascript迷你庫
](https://juejin.im/entry/5aa728fbf265da239147c59a?utm_source=gold_browser_extension)

- [動畫庫](https://github.com/greensock/GreenSock-JS)
- 前+後端(js)
  - [lowdb (本地 db)](https://github.com/typicode/lowdb)
  - http request client:
    - [axios (目前最流行)](https://github.com/axios/axios)
    - [request (promise 要另外裝...)](https://github.com/request/request)
    - [node-fetch - 實現 browser native fetch](https://github.com/bitinn/node-fetch/)
  - Other:
    - [fake response](http://www.fakeresponse.com/)
- [挺有意思 手繪element組件](https://github.com/wiredjs/wired-elements)

### testing

> 目前我最常用的是 mocha, 未來考慮 jest

- [ava](https://github.com/avajs/ava)
  - [ava-practice](http://i5ting.github.io/ava-practice/)
- [jest](https://github.com/facebook/jest)
- [mocha](https://github.com/mochajs/mocha)

### 打包工具

- [webpack 4](https://webpack.js.org/)
  - [中文站](https://webpack.docschina.org/)
  - [Webpack 4 和單頁應用入門](https://github.com/fenivana/webpack-and-spa-guide)
- [browserify](http://browserify.org/)

### 任務工具

- [grunt](https://gruntjs.com/)
- [gulp](https://gulpjs.com/)

### blog

- [fwon - blog](https://github.com/fwon/blog)
- [我們整理了一份 GitHub 上的微信小程序開發工具名單（文末附鏈接）](https://mp.weixin.qq.com/s/DxwkB7tZH4lzt3vUU_dunw)
- [數組的遍歷你都會用了，那Promise版本的呢 數組](https://segmentfault.com/a/1190000014598785)
- [dwqs - blog](https://github.com/dwqs/blog/issues)
  - [你有必要知道的 25 個 JavaScript 面試題](https://github.com/dwqs/blog/issues/17)
- [javascript algorithms](https://github.com/trekhleb/javascript-algorithms)
- [科技橘子](https://blog.techbridge.cc/)
- [xufei](https://github.com/xufei/blog)

> ithome 鐵人賽文章

- [重新認識 JavaScript 系列](https://ithelp.ithome.com.tw/users/20065504/ironman/1259)
- [30天精通 RxJS](https://ithelp.ithome.com.tw/ironman/articles/1199)
- [認識 Functional Programming](https://ithelp.ithome.com.tw/articles/10191612)

> 其它

- 通過rgb值判斷顏色深淺: https://blog.csdn.net/qq_36843675/article/details/79448051

```js
// 通過rgb值判斷顏色深淺
// 通過把 RGB 模式轉換成 YUV 模式，而 Y 是明亮度（灰階），因此只需要獲得 Y 的值而判斷他是否足夠亮就可以了：
if(r*0.299 + g*0.578 + b*0.114 >= 192){ //淺色
    ...
}else{  //深色
    ...
}
```

- 移動端拉起軟鍵盤坑: http://www.iamaddy.net/2016/11/mobile-keyboard-javascript/
  - [CanvasInput](https://goldfirestudios.com/blog/108/CanvasInput-HTML5-Canvas-Text-Input)
- [ES6 系列之模擬實現 Symbol 類型](https://segmentfault.com/a/1190000015262174)
- [前端大牛們](https://news.cnblogs.com/n/500861/)
- [關於 npm 前端模塊的那點兒事兒（ES2015, Babel, UMD）](http://dxy-biz-developer.github.io/2016/03/things-about-npm-front-end-modules/)
- [進階 React Component Patterns 筆記（上）](https://blog.techbridge.cc/2018/06/27/advanced-react-component-patterns-note/)
- [前端性能與異常上報](https://segmentfault.com/a/1190000015808043)
- [javascript實現的一些數據結構知識](https://github.com/captainwz/JSer-Algorithm)
- [react 的數據管理方案：redux 還是 mobx？](https://imweb.io/topic/59f4833db72024f03c7f49b4)
- [JavaScript 解決不同裝置Canvas的解析度問題](http://kuan-wei-kuo-blog.logdown.com/posts/736565-javascript-canvas-of-different-device-resolution)
- [lodash在webpack中的各項優化的嘗試](https://zhuanlan.zhihu.com/p/36280323)
- [js 內存分析](http://wiki.jikexueyuan.com/project/chrome-devtools/javascript-memory-profiling.html)
- [基於webpack4搭建一個腳手架（適用於react,vue,webpack入門）](https://yq.aliyun.com/articles/619737)

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

> TODO: 還沒機會寫 android...

## iOS

> TODO: 還沒機會寫 ios...

## app 託管平臺

- https://www.pgyer.com/doc
- https://fir.im/