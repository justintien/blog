Last-Modified: {docsify-updated}

# commit

## commit message 怎麼寫?

> 嘗試了幾種不同的格式, 最後發現了 angular 定義的 commit message guildlines 非常明確 https://github.com/angular/angular/blob/master/CONTRIBUTING.md

- 需要 node & npm (yarn 當然也可以)

```sh
npm i -g commitizen

# 這個看個人喜好二選一, cz-emoji type 有圖示
npm i -g cz-conventional-changelog
npm i -g cz-emoji

# 如果想要使用 angular 規範
# 方法一: 更改 .czrc (這個是全域的)
vim ~/.czrc
# see: https://github.com/justintien/justin-tool/blob/master/home/.czrc
# 方法二: (這個是針對 個別專案裡使用)
# use https://github.com/up9cloud/cz-emoji-types-angular

```

- 都已經這麼有規範了, CHANGELOG 當然也可以自動生成

```sh
npm install -g conventional-changelog conventional-changelog-cli

# 如果你第一次使用這個工具，想要生成所有以前的更改日誌，你可以做
conventional-changelog -p angular -i CHANGELOG.md -s -r 0

# 這個還用不是很順手
# -p angular (好像只列出 fix type)

# 為了方便使用，可以將其寫入 package.json 的 scripts 字段。
{
  "scripts": {
    "changelog": "conventional-changelog -p angular -i CHANGELOG.md -s -r 0"
  }
}
```

- 這下來 git commit 指令, 以 git cz 取代
```sh
git add .
git cz
# 接下來 command line 會依序詢問
# > 本次 commit 的 type
# > 範圍 (e.g. user, account, pay 等等自定義)
# > 短描述
# > 相關 issue 編號
# > 長描述
```

## type

| key       | icon                        | why?                                                                |
| --------- | --------------------------- | ------------------------------------------------------------------- |
| feat      | 🎉 `:tada:`                  | I'm so excited to announce this feature! tada~                      |
| fix       | 🐞 `:beetle:`                | Original :bug: is actually a worm, so i choose another red bug.     |
| docs      | 📖 `:book:`                  | It's shortest word in all book-like emojis. (:books: :notebook:...) |
| style     | 🌈 `:rainbow:`               | Style makes world colorful!                                         |
| refactor  | 👍 `:+1:`                    | I'm refactoring things, you can cheer me up with +1.                |
| perf      | 🚀 `:rocket:`                | Launch a rocket, faster than ever!                                  |
| test      | 🚥 `:traffic_light:`         | As you know, tests make things green(ok), red(fail)                 |
| build     | 🏗 `:building_construction:` | Build, build, build.                                                |
| ci        | 🤖 `:robot:`                 | Make ci (auto robot) better!                                        |
| chore     | 🍺 `:beer:`                  | I'm doing chores, you should buy me a drink.                        |
| revert    | 🔙 `:back:`                  | Nothing special, Revert and back to previous version.               |
| [DEFAULT] | ❔ `:grey_question:`         | Unknown key.                                                        |

> 中文說明

- feat: 添加了一個新功能
- fix: 修復了一個 bug
- docs: 文檔發生修改
- style: 不影響代碼運行的更改（空格，格式，缺少分號等）
- refactor: 重構代碼且不引進新的功能或修復 bug
- perf: 代碼優化
- test: 添加或修改測試用例
- build: 構建工具或外部依賴的更改（npm，webpack，gulp等）
- ci: 更改項目級的配置文件或腳本
- chore: 除上述之外的修改
- revert: 撤銷改動先前的提交

[參考 angular]:https://github.com/angular/angular/blob/master/CONTRIBUTING.md#type
[參考 egg]:https://eggjs.org/zh-cn/contributing.html
[阮一峰]:http://www.ruanyifeng.com/blog/2016/01/commit_message_change_log.html