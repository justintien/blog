Last-Modified: {docsify-updated}

# tmux

## ubuntu 升級 tmux

```sh
sudo apt-get update
sudo apt-get install tmux
# tmux 升級至 2.1 才可用 plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## tpm: <https://github.com/tmux-plugins/tpm>

- prefix + I to install

accepted Assuming your prefix key is still the default of Ctrl-B ^B :resize-p -D 2 ^B :resize-p -U 2 ^B :resize-p -L 2 ^B :resize-p -R 2

<http://harttle.com/2015/11/06/tmux-startup.html>

tmux配置整理 <http://blog.leanote.com/post/du00/tmux%E9%85%8D%E7%BD%AE%E6%95%B4%E7%90%86>

vim mode

V v selecting text

y copy select text

## restart pane

```sh
respawn-pane -k
```

## swap window

```sh
swap-window -s 3 -t 1
swap-window -t 1
move-window -t 1
```

## scroll

```
ctrl + S
```
