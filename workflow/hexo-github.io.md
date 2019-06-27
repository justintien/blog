Last-Modified: {docsify-updated}

# hexo-github.io

> 使用 [hexo](https://hexo.io/) 建立自己的 blog to github.io

- 首先開個倉庫名為: justintien.github.io (其中 `justintien` 為 你的 github 名稱)
- 用 hexo 寫博客, 接下來就是一長串的命令在本機

```sh
# 安裝 hexo-cli (npm 怎麼安裝就不在這說明了…)
npm install -g hexo-cli

# 初始化目錄
hexo ini my-hexo

cd my-hexo

# 更換 主題 theme (這個自己選自己喜歡的 ~ 我找了一個 名為 next 的 theme)
git clone https://github.com/theme-next/hexo-theme-next themes/next

# 啟動本地 server 測試, localhost:4000 即可看到結果
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

# deploy 完, 會發現對應的 倉庫 justintien.github.io 更新了
# 接著，把工作目錄 my-hexo 放到倉庫裡面去 (開 branch)
cd ../
git clone https://github.com/justintien/justintien.github.io
cd justintien.github.io
git checkout -b hexo
rm -rf *
cp -R ../my-hext/* ./
rm -rf themes/next/.git

# 這樣就完成了！
```

[GitHub+Hexo 搭建個人網站詳細教程]:https://zhuanlan.zhihu.com/p/26625249