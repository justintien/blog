Last-Modified: {docsify-updated}

# vscode

> 微軟出品

- rg 佔 cpu 使用過高
  - 原因:

    ```sh
    # 在中國會使用 cnpm install 替代 npm
    # cnpm install 預設安裝 node_modules 採用 symlink 方式
    ```

  - 解決方法:

    ```sh
    # 方法一
    # 使用 npm 的方式安裝 node_modules
    cnpm install --by=npm

    # 方法二
    # 設置 vscode "search.followSymlinks" to false
    ```

## 我個人的設定與延伸模組

> extensins

```sh
# https://code.visualstudio.com/docs/editor/extension-gallery
code --list-extensions
# code --install-extension {extension id}
# code --uninstall-extension {extension id}
# code --disable-extensions
aaron-bond.better-comments
akamud.vscode-caniuse
AlanWalk.markdown-toc
alefragnani.Bookmarks
anseki.vscode-color
bungcip.better-toml
CoenraadS.bracket-pair-colorizer
coolbear.systemd-unit-file
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
GitHub.copilot
golang.go
jakebathman.mysql-syntax
jebbs.plantuml
joelday.docthis
JuanBlanco.solidity
junstyle.php-cs-fixer
kumar-harsh.graphql-for-vscode
Leopotam.csharpfixformat
michelemelluso.code-beautifier
mrmlnc.vscode-apache
mrmlnc.vscode-less
ms-azuretools.vscode-docker
MS-CEINTL.vscode-language-pack-zh-hant
ms-dotnettools.csharp
ms-vscode-remote.remote-containers
ms-vscode.azure-account
octref.vetur
oderwat.indent-rainbow
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
zxh404.vscode-proto3
```

> 我的使用者設定:

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

> 這篇介紹的很好:

- https://github.com/varHarrie/varharrie.github.io/issues/10

### 疑難雜症

- 終端機 split 報錯 `無法啟動終端機處理序命令 '/bin/zsh -l' (結束代碼: 1)`
  - 原因: 當前路徑有中文，先切換到沒有中文的目錄再 split 就可以了
