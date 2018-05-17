# hexo-github.io

> 使用 [hexo](https://hexo.io/) 建立自己的 blog to github.io

- 首先开个仓库名为: justintien.github.io (其中 `justintien` 为 你的 github 名称)
- 用 hexo 写博客, 接下来就是一长串的命令在本机
```sh
# 安装 hexo-cli (npm 怎么安装就不在这说明了…)
npm install -g hexo-cli

# 初始化目录
hexo ini justintien.github.io

cd justintien.github.io

# 更换 主题 theme (这个自己选自己喜欢的 ~ 我找了一个 名为 next 的 theme)
git clone https://github.com/theme-next/hexo-theme-next themes/next

# 启动本地 server 测试, localhost:4000 即可看到结果
hexo server -p 4000

# new post
hexo new firstDay

# 設定部署 _config.md
vim _config.yml

# 我們是用 github, 所以 type 設定為 git, repo 為 your repo url (其餘預設值就不改了)
deploy:
  type: git
  repo: https://github.com/justintien/justintien.github.io

# type: git 需要額外裝個 npm package
npm install hexo-deployer-git --save

# deploy to github
hexo deploy -g

# 等待 上傳完成後就可以看到結果了...
# justintien.github.io
```

[GitHub+Hexo 搭建个人网站详细教程]:https://zhuanlan.zhihu.com/p/26625249