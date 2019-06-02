Last-Modified: {docsify-updated}

# vscode

> 微软出品

- rg 占 cpu 使用过高
  - 原因:

    ```sh
    # 在中国会使用 cnpm install 替代 npm
    # cnpm install 预设安装 node_modules 采用 symlink 方式
    ```

  - 解决方法:

    ```sh
    # 方法一
    # 使用 npm 的方式安装 node_modules
    cnpm install --by=npm

    # 方法二
    # 设置 vscode "search.followSymlinks" to false
    ```

## 使用的 extensins

```sh
# https://code.visualstudio.com/docs/editor/extension-gallery
code --list-extensions
# code --install-extension {extension id}
# code --uninstall-extension {extension id}
# code --disable-extensions
AlanWalk.markdown-toc
alefragnani.Bookmarks
bungcip.better-toml
DavidAnson.vscode-markdownlint
dbaeumer.vscode-eslint
dracula-theme.theme-dracula
eamodio.gitlens
EditorConfig.EditorConfig
esbenp.prettier-vscode
felipecaputo.git-project-manager
felixfbecker.php-intellisense
formulahendry.auto-close-tag
formulahendry.auto-complete-tag
formulahendry.auto-rename-tag
foxundermoon.shell-format
jakebathman.mysql-syntax
jebbs.plantuml
joelday.docthis
junstyle.php-cs-fixer
kumar-harsh.graphql-for-vscode
Leopotam.csharpfixformat
liximomo.sftp
mrmlnc.vscode-apache
mrmlnc.vscode-less
ms-azuretools.vscode-cosmosdb
MS-CEINTL.vscode-language-pack-zh-hant
ms-mssql.mssql
ms-vscode.azure-account
ms-vscode.cpptools
ms-vscode.csharp
ms-vscode.Go
ms-vsliveshare.vsliveshare
octref.vetur
oderwat.indent-rainbow
PeterJausovec.vscode-docker
redhat.java
shd101wyy.markdown-preview-enhanced
shuworks.vscode-table-formatter
spoonscen.es6-mocha-snippets
spywhere.guides
streetsidesoftware.code-spell-checker
sysoev.language-stylus
VisualStudioExptTeam.vscodeintellicode
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
wayou.vscode-todo-highlight
xabikos.JavaScriptSnippets
```

> 我的使用者设定:

```json
// @se https://code.visualstudio.com/docs/getstarted/settings
// Windows %APPDATA%\Code\User\settings.json
// macOS $HOME/Library/Application Support/Code/User/settings.json
// Linux $HOME/.config/Code/User/settings.json
{
    "workbench.colorTheme": "Dracula",
    "workbench.iconTheme": "vs-minimal",
    "shellformat.path": "/usr/local/bin/shfmt",
    "todohighlight.keywords": [
        "XXX", "NOTE"
    ],
    "gitlens.keymap": "alternate",
    "java.errors.incompleteClasspath.severity": "ignore",
    "cSpell.userWords": [
        "Gerender",
        "PAYPAL",
        "Sendmail",
        "esdoc",
        "gmail",
        "lifecycle",
        "lolimeow",
        "playmeow",
        "spritesheet",
        "stringlize",
        "stringutil"
    ],
    "gitlens.advanced.messages": {
        "suppressCommitHasNoPreviousCommitWarning": false,
        "suppressCommitNotFoundWarning": false,
        "suppressFileNotUnderSourceControlWarning": false,
        "suppressGitVersionWarning": false,
        "suppressLineUncommittedWarning": false,
        "suppressNoRepositoryWarning": false,
        "suppressResultsExplorerNotice": false,
        "suppressShowKeyBindingsNotice": true
    },
    "editor.renderIndentGuides": false,
    "editor.renderWhitespace": "all",
    "workbench.startupEditor": "newUntitledFile",
    "eslint.autoFixOnSave": true,
    "php-cs-fixer.onsave": true,
    "search.followSymlinks": false,
    "editor.wordWrap": "on",
    "files.exclude": {
        "**/.git": true,
        "**/.svn": true,
        "**/.hg": true,
        "**/CVS": true,
        "**/.DS_Store": true,
        "**/bower_components": true,
        "**/jspm_packages": true,
        "**/node_modules": true
    },
    "gitlens.historyExplorer.enabled": true,
    "window.zoomLevel": -1,
    "http.proxy": "http://127.0.0.1:1087",
    "csharp.format.enable": false,
    "eslint.validate": [
        "javascript",
        "javascriptreact",
        { "language": "vue", "autoFix": true }
    ],
    "editor.fontSize": 14,
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
    "gitlens.hovers.currentLine.over": "line",
    "search.exclude": {
        "**/dist": true
    }
}
```