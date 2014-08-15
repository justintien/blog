
```
git init
git add .

#check files
git status

#set user
git config --local user.name "up9cloud"
git config --local user.email "up9cloud.net@gmail.com"

#check config
git config --local -l

git commit -m "first commit"

#refer to fixed-host up9cloud.github.com
git remote set-url origin git@up9cloud.github.com:up9cloud/public-resume.git

git push -u origin master
```
