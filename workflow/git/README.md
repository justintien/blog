Last-Modified: {docsify-updated}

# git

> 這裡還沒有整理成我自己的心得，轉貼來源: [連結](http://huaqianlee.github.io/2015/06/11/Git/git%E5%B8%B8%E7%94%A8%E5%8F%8A%E8%BF%9B%E9%98%B6%E5%91%BD%E4%BB%A4%E6%80%BB%E7%BB%93/)

## links

- [git-flight-rules](https://github.com/k88hudson/git-flight-rules)
- [換行符問題 CRLF / LF](https://juejin.im/post/5ad21df05188257cc20db9de)
- [git submodule](http://liuxiang.github.io/2017/12/08/git%20submodule(%E5%AD%90%E6%A8%A1%E5%9D%97)/)
  - git submodule http://biang.io/blog/development/tools/revision-control/git/submod
  - submodule 心得: 不太直覺，要學很多指令&操作&流程…
- [github 漫遊指南](https://github.phodal.com/)
- [如何利用GitHub搜索敏感信息](https://mp.weixin.qq.com/s/K-8qVzSgkzm1e3nyHsK39w)

##### 配置

```sh
git config --global user.name "JustinTien"
git config --global user.email "thitbbeb+git-commit@gmail.com"

git config --global color.ui true
git config --global alias.co checkout # 配置別名，co 配為checkout 別名， 不過我沒用
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global core.editor "mate -w"    # 設置Editor使用textmate
git config -l  # 列舉所有配置
```

> 用戶的git配置文件~/.gitconfig

##### 常用及進階命令

```sh
git help  #查看幫助，命令忘記了就靠它
git init    #初始化話目錄為git倉庫
git clean -fd  # 刪除無用目錄及文件
git clean -fX  # 刪除無用文件
git clean # 刪除所有untracked文件
```

##### add

```sh
git add file   #添加文件到暫存區
git add .        #將所有修改或者新加文件添加到暫存區
git add -A     # 添加所有文件(除刪除的文件,自動 git rm)
```

##### rm

```sh
git rm file         #刪除文件
git rm <file> --cached  # 從版本庫中刪除文件，但不刪除文件
```

##### 撤銷回退

```sh
git checkout -- xx  #撤銷xx文件修改
git checkout .     #撤銷工作區修改
git checkout ${commit} /path/to/file #撤銷指定文件到指定版本
git revert <$id>    # 恢復某次提交的狀態，恢復動作本身也創建了一次提交對象
git revert HEAD     # 恢復最後一次提交的狀態
git reset <file>    # 從暫存區恢復某一文件
git reset -- .      # 從暫存區恢復所有文件
git reset  –hard HEAD^/HEAD~  #回退到上一版本
git reset  –hard <commit_id>    #回退到指定版本
git reset HEAD file  #取消add文件

git revert <commit>  # 撤銷提交
git add (--all)/git rm/... # 當上次提交異常時，不能成功撤銷，需要針對衝突進行處理，LOG 也會相應提示
git revert --continue # 處理完後，重新提交
```


##### commit

```sh
git commit  <file> #提交單個文件
git commit –m “description”   #提交暫存區到服務器
git commit -a           # 等同執行git add、 git rm及git commit
git commit -am "some comments"
git commit --amend      # 修改最後一次提交記錄
```


##### 查看狀態記錄

```sh
git status        #查看倉庫狀態
git show ($id)  # 顯示某次提交的內容
git log   (file)       #查看（文件）提交記錄
git log -p <file>   # 查看每次詳細修改內容的diff
git log -p -2       # 查看最近兩次詳細修改內容的diff
git log --stat      # 查看提交統計信息
git reflog       #查看歷史版本號
git log -g #同上，用'log'格式輸出
git log -- grep "name" # 搜索包含name的log 
git log record-ID  -l -p #查看指定ID記錄，-l:顯示一行，-p:顯示詳細修改
```

##### 查看差異

```sh
git diff <file>     # 比較當前文件和暫存區文件差異
git diff   #比較所有文件
git diff master..Andylee-Github/master #比較本地和遠端倉庫
git diff <$id1> <$id2>   # 比較兩次提交之間的差異
git diff <branch1>..<branch2> #比較分支
git diff --staged   # 比較暫存區和版本庫差異
git diff --cached   # 比較暫存區和版本庫差異
git diff --stat     # 僅僅比較統計信息
```

##### 本地分支管理

```sh
git branch  #查看本地分支
git branch  -r    # 查看遠程分支
git branch  -a     #查看包括遠程文件在內的所有分支 
git branch   <new_branch> # 創建新分支
git branch   -v           # 查看各個分支最後提交信息
git branch   --merged     # 查看已經被合併到當前分支的分支
git branch   --no-merged  # 查看尚未被合併到當前分支的分支

git checkout <branch>  #切換分支
git checkout –b <new_branch>#創建新分支，並切換到新分支
git merge dev    #在當前的分支上合併dev分支
git checkout -b <new_branch> <branch>  # 基於branch創建新的new_branch
git checkout  $id          # 把某次歷史提交記錄checkout出來，但無分支信息，切換到其他分支會自動刪除
git checkout  $id -b <new_branch>  # 把某次歷史提交記錄checkout出來，創建成一個分支

git branch-d <branch>  # 刪除分支
git branch-D <branch>  # 強制刪除分支 (未被合併的分支被刪除的時需要強制)

git merge <branch>               # 將branch分支合併到當前分支
git merge origin/master --no-ff  # 不要Fast-Foward合併，這樣可以生成merge提交
git rebase master <branch>       # 將master rebase到branch，等同於：
#git checkout   <branch> + git rebase master + git checkout  master + git merge <branch>

git cherry-pick <commit>  # 合併其它分支的某一次提交
# 合併其它分支一系列提交，first_commit ~ last_commit
git checkout -b newbranch <last_commit> # 依據需要合併的最後一條 commit 創建新分支
git rebase --onto master <first_commit>^  # 從新分支中需要合併的第一條 commit 開始合併
```

##### 補丁應用

```sh
git diff > ../sync.patch         # 生成補丁
git apply ../sync.patch          # 打補丁
git apply --check ../sync.patch  # 測試補丁能否成功
```

##### 暫存管理

```sh
git stash  #暫存當前工作，恢復現場後可繼續工作
git stash list  #查看暫存文件列表
git stash apply  #恢復暫存內容，暫存區不刪除
git stash drop  #刪除暫存文件
git stash pop  #恢復並刪除文件
```

##### 遠程分支管理

```sh
git pull                         # 抓取遠程倉庫所有分支更新併合併到本地
git pull --no-ff                 # 抓取遠程倉庫所有分支更新併合併到本地，不要快進合併
git fetch origin                 # 抓取遠程倉庫更新，加下一條指令等同於git pull
git merge origin/master          # 將遠程主分支合併到本地當前分支
git checkout   --track origin/branch     # 跟蹤某個遠程分支創建相應的本地分支
git checkout   -b <local_branch> origin/<remote_branch>  # 基於遠程分支創建本地分支，功能同上

git push                         # push所有分支
git push origin branch   # 將本地分支推到遠程分支
git push –u origin branch   #推送本地分支到遠程倉庫，首次提交需要加-u 
git push origin <local_branch>   # 創建遠程分支， origin是遠程倉庫名
git push origin <local_branch>:<remote_branch>  # 創建遠程分支
git push origin :<remote_branch>  #先刪除本地分支(git br -d <branch>)，然後再push刪除遠程分支
```

##### 遠程倉庫管理

```sh
git remote  #查看遠程庫的信息
git remote –v  #查看遠程庫地址和名稱
git remote show origin           # 查看遠程服務器倉庫狀態
git remote add origin git@github:robbin/robbin_site.git         # 添加遠程倉庫地址
git remote set-url origin git@github.com:robbin/robbin_site.git # 設置遠程倉庫地址(用於修改遠程倉庫地址)
git remote rm <repository>       # 刪除遠程倉庫

git clone https://github.com/AndyLee-Github/cartboon.git   #從遠程倉庫中克隆
git clone --bare robbin_site robbin_site.git  # 用帶版本的項目創建純版本倉庫
scp -r my_project.git git@git.csdn.net:~      # 將純倉庫上傳到服務器上

mkdir robbin_site.git + cd robbin_site.git + git --bare init # 在服務器創建純倉庫
git remote add origin git@github.com:robbin/robbin_site.git    # 設置遠程倉庫地址
git push -u origin master                                      # 客戶端首次提交
git push -u origin develop  # 首次將本地develop分支提交到遠程develop分支，並且track
git remote set-head origin master   # 設置遠程倉庫的HEAD指向master分支
```

##### 命令設置跟蹤遠程庫和本地庫

```sh
git branch --set-upstream master origin/master
git branch --set-upstream develop origin/develop
```

##### create a new repository on the command line

```sh
echo "# hexo-theme" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:huaqianlee/hexo-theme.git
git push -u origin master
```

##### push an existing repository from the command line

```sh
git remote add origin git@github.com:huaqianlee/hexo-theme.git
git push -u origin master
```
