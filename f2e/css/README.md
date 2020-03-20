# css

- [cheatsheet](https://htmlcheatsheet.com/css/)

## NOTE

> selector: css4 or postcss support

- `&`: 指的是上一級元素 (parent)

```css
#main {
    & div { /* 這裡沒有指定 > div，指的是所有的 nested div 都會受影響 */
        font-size: 20px;
    }
}
```

- `>` 指定下一級子元素 (children)

```css
#main {
    & > div { /* 指定 > div，只有 #main 下一層的 div 會影響，第二層…第三層的甚至更裡面的 div 不受影響*/
        font-size: 20px;
    }
}
```

## link

- [用遊戲學 flex](https://hexschool.github.io/flexbox-pirate/index.html)
- https://github.com/chokcoco/CSS-Inspiration
- http://zh-tw.learnlayout.com/no-layout.html
- 不怕你用不上！CSS 列表項佈局技巧 https://juejin.im/post/5c171f0ef265da61553abade
- https://css-tricks.com/