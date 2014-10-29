

##安裝grunt

- 先安裝 [nodejs] (會一併安裝npm)

######linux可用指令安裝
```sh
apt-get install nodejs
```
######windows請手動安裝(安裝完開啟node command line tool執行以後指令)

- 更新npm
```sh
npm update -g npm
```

- 到專案目錄下產生package.json
```
cd /path/to/your_project
npm init
```

- 安裝grunt
```sh
npm install -g grunt-cli
```

- 安裝grunt常用任務插件

--save表示更新至package.json的Dependencies

--save-dev表示更新至package.json的devDependencies
```sh
#合併檔案
npm install grunt-contrib-concat --save-dev

#for angularjs file前處理
npm install grunt-ng-annotate --save-dev

#minify .js
npm install grunt-contrib-uglify --save-dev

#minify .css
npm install grunt-contrib-cssmin --save-dev

#minify .html
npm install grunt-contrib-htmlmin --save-dev

#偵測檔案若有變動，再次執行job
npm install grunt-contrib-watch --save-dev
```

- 安裝grunt-init(方便自動產生Gruntfile)
```sh
npm install -g grunt-init
```

- 產生Gruntfile
```sh
#git clone https://github.com/gruntjs/grunt-init-gruntfile.git ~/.grunt-init/gruntfile
#TODO how to 下載模組
grunt-init gruntfile
```

- 設定Gruntfile
```js
/*global module:false*/
module.exports = function(grunt) {
    // Project configuration.
    grunt.initConfig({
        //從npm package.json檔讀資料，避免像版本作者還要寫兩次
        package: grunt.file.readJSON('package.json'),
        
        //設定template，通常拿來檔案更動後自動加上comment或是宣告著作權
        banner: '/*! <%= package.name %> - v<%= package.version %> - <%= grunt.template.today("yyyy-mm-dd") %>\n' + '* http://<%= package.url %>/\n' + '* Copyright (c) 2013-<%= grunt.template.today("yyyy") %> <%= package.author %>; Licensed <%= package.license %> */',
        
        // Task configuration.
        //每一種任務在grunt.initConfig底下，都會有關鍵字(ex: grunt-contrib-concat任務關鍵字為concat)
        //不可隨意變換，需查看該任務如何寫設定
        //以下是參考例子
        concat: {
            libs: {
                src: ['src/libs/**/*.js'],
                dest: 'src/libs.js'
            },
            app: {
                options: {
                    banner: '<%= banner %>',
                    stripBanners: true
                },
                src: ['src/js/**/*.js'],
                dest: 'src/app.js'
            }
        },
        ngAnnotate: {
            options: {
                singleQuotes: true,
                remove: true
            },
            all: {
                files: [{
                    expand: true,
                    src: ['<%= concat.app.dest %>'],
                    ext: '.js', // Dest filepaths will have this extension.
                    extDot: 'last', // Extensions in filenames begin after the last dot
                }, ]
            }
        },
        uglify: {
            libs: {
                files: {
                    'js/libs.min.js': ['<%= concat.libs.dest %>']
                }
            },
            app: {
                options: {
                    sourceMap: true,
                    banner: '<%= banner %>'
                },
                files: {
                    'js/app.min.js': ['<%= concat.app.dest %>']
                }
            }
        },
        cssmin: {
            all: {
                options: {
                    banner: '<%= banner %>'
                },
                files: {
                    'css/app.min.css': ['src/css/**/*.css']
                }
            }
        },
        htmlmin: { // Task
            dist: { // Target
                options: { // Target options
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: [{
                    expand: true, // Enable dynamic expansion.
                    cwd: 'src/html/', // Src matches are relative to this path.
                    src: ['**/*.html'], // Actual pattern(s) to match.
                    dest: 'view/', // Destination path prefix.
                }]
            }
        },
        watch: {
            js: {
                files: 'src/js/**/*',
                tasks: ['minifyJs'],
            },
            css: {
                files: 'src/css/**/*',
                tasks: ['cssmin'],
            },
            html: {
                files: 'src/html/**/*',
                tasks: ['htmlmin'],
            }
        }
    });
    
    // These plugins provide necessary tasks.
    //有要用到的任務，必須使用grunt.loadNpmTasks載入
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-ng-annotate');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-htmlmin');
    grunt.loadNpmTasks('grunt-contrib-watch');
    
    //使用grunt.registerTask註冊任務，才能使用command line執行
    //(ex: grunt dev 會先執行一次上面minify的任務之後，再執行watch任務。)
    //default是關鍵字，只輸入grunt時會執行。
    grunt.registerTask('default', ['minify']);
    grunt.registerTask('dev', ['minify', 'watch']);
    grunt.registerTask('minify', ['minifyJs', 'cssmin', 'htmlmin']);
    grunt.registerTask('minifyJs', ['concat', 'ngAnnotate', 'uglify']);
};
```

[nodejs]:http://nodejs.org/download/
