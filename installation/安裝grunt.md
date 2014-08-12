
####先安裝nodejs(會一併安裝npm)
```sh
apt-get install nodejs
```

####更新npm
```sh
npm update -g npm
```

####安裝grunt
```sh
npm install -g grunt-cli
```

####安裝grunt-init(方便自動產生Gruntfile)
```sh
npm install -g grunt-init
```

####先產生出package.json
```
npm init
```

####產生Gruntfile
```sh
#git clone https://github.com/gruntjs/grunt-init-gruntfile.git ~/.grunt-init/gruntfile
grunt-init gruntfile
```

####安裝angularjs minify基本所需

--save表示更新至package.json的Dependencies

--save-dev表示更新至package.json的devDependencies
```sh
//合併檔案
npm install grunt-contrib-concat --save-dev
//ng file前處理
npm install grunt-ngmin --save-dev
//minify js檔
npm install grunt-contrib-uglify --save-dev
//偵測檔案變動重複job
//方面開發
npm install grunt-contrib-watch --save-dev
```
