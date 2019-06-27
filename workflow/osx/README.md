Last-Modified: {docsify-updated}

# osx

> 使用 osx, init 要安裝的

- [init.sh](https://github.com/justintien/justin-tool/blob/master/osx/init.sh)

## homebrew

- curl: (35) LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection
  - 解法

  ```sh
  echo '--no-alpn' > ~/.curlrc
  export HOMEBREW_CURLRC=1
  brew cask install ...
  ```