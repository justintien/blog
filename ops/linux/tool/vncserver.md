# vncserver

> 以 ubuntu 為例:

```sh
# install VNC server dependency
apt-get install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal -y

# install VNC server
apt-get install vnc4server -y

# 首次執行, 會要求輸入 password & 產生 config
vncserver

# 設定 VNC
vim ~/.vnc/xstartup
# 加入這4行
gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &

# kill current vnc server
vncserver -kill :1

# restart vnc server
vncserver :1

# 設定 重開機自動執行 vnc server
crontab -e
# 加入這行
@reboot /usr/bin/vncserver :1

# 如果不小心忘記密碼了
rm .vnc/passwd
vncserver
```
