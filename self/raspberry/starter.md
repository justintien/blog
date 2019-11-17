# Raspbian OS

## SD

> 勿超過 32GB

- SanDisk Ultra 32GB
- 選擇: https://www.yiboard.com/thread-1271-1-1.html
- https://3q.9527.tw/124

## 燒錄sd

`所有操作以 macos 為例`

> 需要使用 balenaEtcher 燒錄 image

```sh
brew cask install balenaetcher

# 啟動 balenaEtcher > 選擇 image (e.g. 2019-xx-xx-raspbian-buster-full.img) > select target (SD) > Flash! (等待燒錄完成)
```

> 直在 SD 卡上，設置設定 (e.g. wifi & 啟用 ssh, hdmi)

- 啟用 ssh

```sh
touch /Volumes/boot ssh
```

- 設置 wifi

```sh
vi /Volumes/boot/wpa_supplicant.conf

# 貼下這一段
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="wifi 的 ssid 請自行更改"
    scan_ssid=1
    priority=1
    psk="wifi的密碼"
    key_mgmt=WPA-PSK
}
# network 有多個的話，可依續填入
network={
    ssid="wifi 的 ssid 請自行更改"
    scan_ssid=1
    priority=1
    psk="wifi的密碼"
    key_mgmt=WPA-PSK
}
```

- 設定 HDMI 輸出

```sh
vi /Volumes/boot/config.txt
# uncomment 這二項，以強制使用 hdmi
hdmi_force_hotplug=1
hdmi_drive=2
```

## SSH

```sh
# default user: pi, password: raspberry
ssh pi@內網ip
```

## docker

http://collabnix.com/installing-docker-18-09-3-on-raspberry-pi-in-2-minutes/

```sh
sudo su
curl -sSL https://get.docker.com/ | sh
```

## VNC

> 使用系统自带VNC，并且开机启动

```sh
sudo raspi-config
# 选择 Interfacing Options -> 找到VNC（远程桌面） 选择 Yes（是）enable

sudo nano /etc/init.d/vncserver
# 貼上以下這一段
#!/bin/sh
### BEGIN INIT INFO
# Provides: vncserver
# Required-Start: $local_fs
# Required-Stop: $local_fs
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Start/stop vncserver
### END INIT INFO
# More details see:
# http://www.penguintutor.com/linux/vnc
### Customize this entry
# Set the USER variable to the name of the user to start vncserver under
export USER='pi'
### End customization required
eval cd ~$USER
case "$1" in
start)
# 启动命令行。此处自定义分辨率、控制台号码或其它参数。
su $USER -c '/usr/bin/vncserver -depth 16 -geometry 1024x768 :1'
echo "Starting VNC server for $USER "
;;
stop)
# 终止命令行。此处控制台号码与启动一致。
su $USER -c '/usr/bin/vncserver -kill :1'
echo "vncserver stopped"
;;
*)
echo "Usage: /etc/init.d/vncserver {start|stop}"
exit 1
;;
esac
exit 0


# 更改權限
sudo chmod 755 /etc/init.d/vncserver
# 設定開機啟動
sudo update-rc.d vncserver defaults
```

## 攝像頭(USB)

> fswebcam  用于访问摄像头、进行拍照等

```sh
sudo apt-get install fswebcam 

# 拍照
fswebcam image.jpg
```

> MJPG-streamer 是一个优秀的开源 project，它可以通过 HTTP 的方式访问 linux 上面的兼容摄像头，从而做到远程视频传输的效果。 

```sh
sudo raspi-config 
# interface -> camera -> enable

sudo apt-get update sudo apt-get install subversion libjpeg8-dev imagemagick libv4l-dev cmake git -y

sudo git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental
make all
sudo make install

# CP
sudo cp mjpg-streamer/mjpg-streamer-experimental/input_uvc.so /usr/local/lib/
sudo cp mjpg-streamer/mjpg-streamer-experimental/output_http.so /usr/local/lib/
sudo cp -R mjpg-streamer/mjpg-streamer-experimental/www/ /usr/local/

# shell 

sudo nano /data/mjpg_streamer.sh 

#!/bin/sh
# /etc/init.d/mjpg_streamer.sh
# v0.2 phillips321.co.uk
### BEGIN INIT INFO
# Provides:          mjpg_streamer.sh
# Required-Start:    $network
# Required-Stop:     $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: mjpg_streamer for webcam
# Description:       Streams /dev/video0 to http://IP/?action=stream
### END INIT INFO

f_message(){
        echo "[+] $1"
}

# Carry out specific functions when asked to by the system
case "$1" in
        start)
                f_message "Starting mjpg_streamer"
                mjpg_streamer -b -i "/usr/local/lib/input_uvc.so -d /dev/video0 -y  -r 160x120 -f 5 -q 30" -o "/usr/local/lib/output_http.so -p 8080 -w /usr/local/www"
                sleep 2
                f_message "mjpg_streamer started"
                ;;
        stop)
                f_message "Stopping mjpg_streamer..."
                killall mjpg_streamer
                f_message "mjpg_streamer stopped"
                ;;
        restart)
                f_message "Restarting daemon: mjpg_streamer"
                killall mjpg_streamer
                mjpg_streamer -b -i "/usr/local/lib/input_uvc.so -d /dev/video0 -y  -r 160x120 -f 5 -q 30" -o "/usr/local/lib/output_http.so -p 8080 -w /usr/local/www"
                sleep 2
                f_message "Restarted daemon: mjpg_streamer"
                ;;
        status)
                pid=`ps -A | grep mjpg_streamer | grep -v "grep" | grep -v mjpg_streamer. | awk '{print $1}' | head -n 1`
                if [ -n "$pid" ];
                then
                        f_message "mjpg_streamer is running with pid ${pid}"
                        f_message "mjpg_streamer was started with the following command line"
                        cat /proc/${pid}/cmdline ; echo ""
                else
                        f_message "Could not find mjpg_streamer running"
                fi
                ;;
        *)
                f_message "Usage: $0 {start|stop|status|restart}"
                exit 1
                ;;
esac
exit 0
```

> motion (搭配 mjpg 香)

```sh
sudo apt-get install motion

# 打开 motion daemon 守护进程，让他可以一直在后台运行

sudo nano /etc/default/motion
# 改成 yes
start_motion_daemon=yes

sudo nano /etc/motion/motion.conf
# 將這些設定 更改為以下 (自行設定自己想要的值)
daemon on
webcontrol_port 8081
webcam_localhost off
netcam_url http://localhost:8080/?action=stream
stream_localhost off
target_dir /home/pi/Downloads   
```

### Tools

- [PRi-Monitor](https://xavierberger.github.io/RPi-Monitor-docs/11_installation.html)
