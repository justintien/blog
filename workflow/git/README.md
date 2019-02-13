Last-Modified: {docsify-updated}

# git

> 这里还没有整理成我自己的心得，转贴来源: [连结](http://huaqianlee.github.io/2015/06/11/Git/git%E5%B8%B8%E7%94%A8%E5%8F%8A%E8%BF%9B%E9%98%B6%E5%91%BD%E4%BB%A4%E6%80%BB%E7%BB%93/)

## links

- [git-flight-rules](https://github.com/k88hudson/git-flight-rules)
- [換行符問題 CRLF / LF](https://juejin.im/post/5ad21df05188257cc20db9de)
- [git submodule](http://liuxiang.github.io/2017/12/08/git%20submodule(%E5%AD%90%E6%A8%A1%E5%9D%97)/)
  - git submodule http://biang.io/blog/development/tools/revision-control/git/submod
  - submodule 心得: 不太直觉，要学很多指令&操作&流程…
- [github 漫游指南](https://github.phodal.com/)
- [如何利用GitHub搜索敏感信息](https://mp.weixin.qq.com/s/K-8qVzSgkzm1e3nyHsK39w)

##### 配置

```sh
git config --global user.name "huaqianlee"   
git config --global user.email "huaqianlee@gmail.com" 
  
git config --global color.ui true
git config --global alias.co checkout # 配置别名，co 配为checkout 别名， 不过我没用
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global core.editor "mate -w"    # 设置Editor使用textmate
git config -l  # 列举所有配置
```

> 用户的git配置文件~/.gitconfig

##### 常用及进阶命令

```sh
git help  #查看帮助，命令忘记了就靠它
git init    #初始化话目录为git仓库
git clean -fd  # 删除无用目录及文件
git clean -fX  # 删除无用文件
git clean # 删除所有untracked文件
```

##### add

```sh
git add file   #添加文件到暂存区
git add .        #将所有修改或者新加文件添加到暂存区
git add -A     # 添加所有文件(除删除的文件,自动 git rm)
```

##### rm

```sh
git rm file         #删除文件
git rm <file> --cached  # 从版本库中删除文件，但不删除文件
```

##### 撤销回退

```sh
git checkout -- xx  #撤销xx文件修改
git checkout .     #撤销工作区修改
git checkout ${commit} /path/to/file #撤销指定文件到指定版本
git revert <$id>    # 恢复某次提交的状态，恢复动作本身也创建了一次提交对象
git revert HEAD     # 恢复最后一次提交的状态
git reset <file>    # 从暂存区恢复某一文件
git reset -- .      # 从暂存区恢复所有文件
git reset  –hard HEAD^/HEAD~  #回退到上一版本
git reset  –hard <commit_id>    #回退到指定版本
git reset HEAD file  #取消add文件

git revert <commit>  # 撤销提交
git add (--all)/git rm/... # 当上次提交异常时，不能成功撤销，需要针对冲突进行处理，LOG 也会相应提示
git revert --continue # 处理完后，重新提交
```


##### commit

```sh
git commit  <file> #提交单个文件
git commit –m “description”   #提交暂存区到服务器
git commit -a           # 等同执行git add、 git rm及git commit
git commit -am "some comments"
git commit --amend      # 修改最后一次提交记录
```


##### 查看状态记录

```sh
git status        #查看仓库状态
git show ($id)  # 显示某次提交的内容
git log   (file)       #查看（文件）提交记录
git log -p <file>   # 查看每次详细修改内容的diff
git log -p -2       # 查看最近两次详细修改内容的diff
git log --stat      # 查看提交统计信息
git reflog       #查看历史版本号
git log -g #同上，用'log'格式输出
git log -- grep "name" # 搜索包含name的log 
git log record-ID  -l -p #查看指定ID记录，-l:显示一行，-p:显示详细修改
```

##### 查看差异

```sh
git diff <file>     # 比较当前文件和暂存区文件差异
git diff   #比较所有文件
git diff master..Andylee-Github/master #比较本地和远端仓库
git diff <$id1> <$id2>   # 比较两次提交之间的差异
git diff <branch1>..<branch2> #比较分支
git diff --staged   # 比较暂存区和版本库差异
git diff --cached   # 比较暂存区和版本库差异
git diff --stat     # 仅仅比较统计信息
```

##### 本地分支管理

```sh
git branch  #查看本地分支
git branch  -r    # 查看远程分支
git branch  -a     #查看包括远程文件在内的所有分支 
git branch   <new_branch> # 创建新分支
git branch   -v           # 查看各个分支最后提交信息
git branch   --merged     # 查看已经被合并到当前分支的分支
git branch   --no-merged  # 查看尚未被合并到当前分支的分支

git checkout <branch>  #切换分支
git checkout –b <new_branch>#创建新分支，并切换到新分支
git merge dev    #在当前的分支上合并dev分支
git checkout -b <new_branch> <branch>  # 基于branch创建新的new_branch
git checkout  $id          # 把某次历史提交记录checkout出来，但无分支信息，切换到其他分支会自动删除
git checkout  $id -b <new_branch>  # 把某次历史提交记录checkout出来，创建成一个分支

git branch-d <branch>  # 删除分支
git branch-D <branch>  # 强制删除分支 (未被合并的分支被删除的时需要强制)

git merge <branch>               # 将branch分支合并到当前分支
git merge origin/master --no-ff  # 不要Fast-Foward合并，这样可以生成merge提交
git rebase master <branch>       # 将master rebase到branch，等同于：
#git checkout   <branch> + git rebase master + git checkout  master + git merge <branch>

git cherry-pick <commit>  # 合并其它分支的某一次提交
# 合并其它分支一系列提交，first_commit ~ last_commit
git checkout -b newbranch <last_commit> # 依据需要合并的最后一条 commit 创建新分支
git rebase --onto master <first_commit>^  # 从新分支中需要合并的第一条 commit 开始合并
```

##### 补丁应用

```sh
git diff > ../sync.patch         # 生成补丁
git apply ../sync.patch          # 打补丁
git apply --check ../sync.patch  # 测试补丁能否成功
```

##### 暂存管理

```sh
git stash  #暂存当前工作，恢复现场后可继续工作
git stash list  #查看暂存文件列表
git stash apply  #恢复暂存内容，暂存区不删除
git stash drop  #删除暂存文件
git stash pop  #恢复并删除文件
```

##### 远程分支管理

```sh
git pull                         # 抓取远程仓库所有分支更新并合并到本地
git pull --no-ff                 # 抓取远程仓库所有分支更新并合并到本地，不要快进合并
git fetch origin                 # 抓取远程仓库更新，加下一条指令等同于git pull
git merge origin/master          # 将远程主分支合并到本地当前分支
git checkout   --track origin/branch     # 跟踪某个远程分支创建相应的本地分支
git checkout   -b <local_branch> origin/<remote_branch>  # 基于远程分支创建本地分支，功能同上

git push                         # push所有分支
git push origin branch   # 将本地分支推到远程分支
git push –u origin branch   #推送本地分支到远程仓库，首次提交需要加-u 
git push origin <local_branch>   # 创建远程分支， origin是远程仓库名
git push origin <local_branch>:<remote_branch>  # 创建远程分支
git push origin :<remote_branch>  #先删除本地分支(git br -d <branch>)，然后再push删除远程分支
```

##### 远程仓库管理

```sh
git remote  #查看远程库的信息
git remote –v  #查看远程库地址和名称
git remote show origin           # 查看远程服务器仓库状态
git remote add origin git@github:robbin/robbin_site.git         # 添加远程仓库地址
git remote set-url origin git@github.com:robbin/robbin_site.git # 设置远程仓库地址(用于修改远程仓库地址)
git remote rm <repository>       # 删除远程仓库

git clone https://github.com/AndyLee-Github/cartboon.git   #从远程仓库中克隆
git clone --bare robbin_site robbin_site.git  # 用带版本的项目创建纯版本仓库
scp -r my_project.git git@git.csdn.net:~      # 将纯仓库上传到服务器上

mkdir robbin_site.git + cd robbin_site.git + git --bare init # 在服务器创建纯仓库
git remote add origin git@github.com:robbin/robbin_site.git    # 设置远程仓库地址
git push -u origin master                                      # 客户端首次提交
git push -u origin develop  # 首次将本地develop分支提交到远程develop分支，并且track
git remote set-head origin master   # 设置远程仓库的HEAD指向master分支
```

##### 命令设置跟踪远程库和本地库

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
