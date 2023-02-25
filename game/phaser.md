Last-Modified: {docsify-updated}

# phaser3

當前已使用到了 phaser v3.55.2 版本

暫時未更新文檔內容，有問題可以直接問我

以下文檔是我在 phaser v3.16 以前整理的: (可能很多已不堪使用了)

- [github](https://github.com/facebook/react)
- 官方文檔:
  - [phaser 3](https://photonstorm.github.io/phaser3-docs/)
  - [phaser 2 examples](http://phaser.io/examples)
- refs (phaser 3 跟 2 & CE 截然不同):
- [awesome-phaser](https://github.com/Raiper34/awesome-phaser)
  - phaser 3
    - [[phaser3入門探坑]使用phaser3製作山寨馬里奧](https://segmentfault.com/a/1190000013979583)
    - [Phaser3初體驗（譯文）](http://club.phaser-china.com/topic/5a94bd94484a53dd723f42c9)
    - [[phaser3入門探坑]使用phaser3製作山寨馬里奧](https://segmentfault.com/a/1190000013979583)
    - [日文教學文檔](https://baroqueengine.net/gamedev/phaser3/)
    - [phaser3-rex-notes - 蠻詳細的](https://rexrainbow.github.io/phaser3-rex-notes/docs/site/tween/)
  - phaser 2
    - [從零到一：用Phaser.js寫意地開發小遊戲（Chapter 1 - 認識Phaser.js）](https://segmentfault.com/a/1190000009212221)
    - phaser社區: http://club.phaser-china.com/
    - [phaser 中文站](http://www.phaser.me/)
    - [phaser 2 文檔](http://www.phaser.me/2018/03/22/phaser-js-%E5%AE%98%E6%96%B9%E4%B8%AD%E6%96%87%E6%96%87%E6%A1%A3-phaser-io-2/?nsukey=iMRYAl2OwquTJ5AxXVnuWafewvq7DfF2KY99CiKeS29GjAWZwJAl%2FxFnDL6vIOOaSYZTZ12DyMMDlp%2F%2FzjZOJLr5W4V3BqJ7vbXbblaB%2FW%2BS2acmYVw8I3ZAWL%2Bk044nF3Ittf3UfPF4s8nGxNrWrnhMRxFDqp2rMN0PwBItSG8RfmZH6g46WsV8jqUziRMRpfU5J10W5Ixx89MNAaHi1A%3D%3D)
    - [使用Phaser 2框架構建你的第一個H5遊戲](https://blog.csdn.net/sinat_32582203/article/details/73303153)

    - [phaser製作h5小遊戲（二）](https://www.jianshu.com/p/24bfe5edb4e9)
    - [phaser-ce & vue 樣板](https://github.com/sekl/node-vue-phaser-boilerplate)
    - [phaser 2 範例](https://developer.mozilla.org/zh-CN/docs/Games/Tutorials/2D_breakout_game_Phaser)
  - https://www.zhihu.com/question/29335822?utm_medium=social&utm_source=wechat_session
  - [phaser v2.4.6 performance 測試](https://github.com/mattcolman/phaser-performance-tests)
  - [phaser-ce v2.8.1 performance](https://codepen.io/samme/pen/OmGNgL)
  - [forum](http://www.html5gamedevs.com/forum/33-phaser-3/)
  - forums: http://www.html5gamedevs.com/topic/35897-phaser-3-vs-phaser-2-benchmarks/

> 中國官網鏡像: http://api100.net/phaser3/

## 學習 phaser3

`2018/06/19 更新: 官方文檔已更新許多…所以這邊暫時不繼續寫`

> step1 創建遊戲

```js
// 看了官方的教學文檔: https://phaser.io/tutorials/making-your-first-phaser-3-game
// 文檔似乎不完整!? 看不懂 >"<
// 這裡直接貼 code 說明

// 創建遊戲
// https://github.com/photonstorm/phaser/blob/master/src/boot/Config.js
var config = {
    type: Phaser.AUTO,
    width: 800,
    height: 600,
    scene: {
        // 一個場景的生命週期
        preload: function () {
            // 預加載
        },
        create: function () {
            // 建立時
        },
        update: function () {
            // 每次更新時 執行
        }
    }
};
// 補充說明 scene: array<Scene> or Scene
// 如果是 array, 第一個將當作預設 Scene

// https://github.com/photonstorm/phaser/blob/master/src/boot/Game.js
var game = new Phaser.Game(config);

// 如果不在 config 裡 添加 scene, 可以使用場景管理器
// game.scene = Phaser.Scenes.SceneManager (可以從 Game.js 看出來)
// api: https://photonstorm.github.io/phaser3-docs/Phaser.Scenes.SceneManager.html#methods
game.scene.add('init', InitScene, true)
```

> step2 場景

```js
// 以 InitScene 為例
// https://github.com/photonstorm/phaser/blob/master/src/scene/Scene.js
import Phaser from 'phaser'
import { ajax } from '@/helper'

import Text from '../component/Text.js'

export default class InitScene extends Phaser.Scene {
  constructor (config) {
    // https://github.com/photonstorm/phaser/blob/master/src/scene/Settings.js
    super(config)
  }

  preload () {
    // 要加載的資源
    // this.load = Phaser.Loader.LoaderPlugin
    // https://photonstorm.github.io/phaser3-docs/Phaser.Loader.LoaderPlugin.html#methods
    this.load.image('key', 'path/to/xxx')
  }

  create () {
    let config = this.cache.game.config

    // this.add = Phaser.GameObjects.GameObjectFactory
    // https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.GameObjectFactory.html#methods
    let cover = this.add.image(0, 0, 'key')
    let text = this.add.text(0, 0, '遊戲開始', {})

    // 將 cover 以遊戲畫布，置中
    // https://github.com/photonstorm/phaser/blob/master/src/display/align/in/Center.js
    Phaser.Display.Align.In.Center(cover, this.add.zone(config.width / 2, config.height / 2, config.width, config.height))

    // 將 text 放在 cover 的上方 - 中間，並且 偏移 y 值 -985...
    Phaser.Display.Align.In.TopCenter(text, cover, 0, -985)

    // next scene
    this.scene.start('ready')
  }
}
```

> step3 官方 examples https://github.com/photonstorm/phaser3-examples

```md
看完 step1 & step2 以後就會發現…直接看 source code 可能會詳細一些
```

> ease map: https://github.com/photonstorm/phaser/blob/master/src/math/easing/EaseMap.js

<!-- ```js
this.cameras.main.shake(500);
this.tweens.add({
        targets: this.cameras.main,
        props: {
            zoom: { value: 2.5, duration: 4000, ease: 'Sine.easeInOut' },
            rotation: { value: 2.3, duration: 8000, ease: 'Cubic.easeInOut' }
        },
        delay: 5000,
        yoyo: true,
        repeat: -1
    });
tweens.timeline
``` -->

### known-issues

- Text letter style issue https://github.com/photonstorm/phaser/issues/3390

[未知]:http://www.photonstorm.com/html5
[phaser2: text-underline-solved]:http://www.html5gamedevs.com/topic/28741-text-underline-solved/
