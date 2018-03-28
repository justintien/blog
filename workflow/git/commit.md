# commit

## commit message 怎么写?

> 尝试了几种不同的格式, 最后发现了 angular 定义的 commit message guildlines 非常明确 https://github.com/angular/angular/blob/master/CONTRIBUTING.md

- 需要 node & npm (yarn 当然也可以)

```sh
npm i -g commitizen
npm i -g cz-conventional-changelog

# 这个看个人喜好, type 可带图示
npm i -g cz-emoji

# 接着设定 config 以符合 angular 规范
vim ~/.czrc
# see https://github.com/justintien/justin-tool/blob/master/home/.czrc
```

- 都已经这么有规范了, CHANGELOG 当然也可以自动生成

```sh
npm install -g conventional-changelog

# 如果你第一次使用这个工具，想要生成所有以前的更改日志，你可以做
conventional-changelog -p angular -i CHANGELOG.md -s -r 0
```

- 这下来 git commit 指令, 以 git cz 取代
```sh
git add .
git cz
# 接下来 command line 会依序询问
# > 本次 commit 的 type
# > 范围 (e.g. user, account, pay 等等自定义)
# > 短描述
# > 相关 issue 编号
# > 长描述
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

> 中文说明

- feat: 添加了一个新功能
- fix: 修复了一个 bug
- docs: 文档发生修改
- style: 不影响代码运行的更改（空格，格式，缺少分号等）
- refactor: 重构代码且不引进新的功能或修复 bug
- perf: 代码优化
- test: 添加或修改测试用例
- build: 构建工具或外部依赖的更改（npm，webpack，gulp等）
- ci: 更改项目级的配置文件或脚本
- chore: 除上述之外的修改
- revert: 撤销改动先前的提交

[参考 angular]:https://github.com/angular/angular/blob/master/CONTRIBUTING.md#type
[参考 egg]:https://eggjs.org/zh-cn/contributing.html
