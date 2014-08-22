
#debian

####install dependencies
```
#ncurses
apt-get install ncurses-dev
#libevent
wget "https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz" -O libevent.tar.gz
tar -xzf libevent.tar.gz
cd libevent-<version>
./configure
make && make install
```

####install tmux latest
```
wget "http://sourceforge.net/projects/tmux/files/latest/download?source=typ_redirect" -O tmux_latest.tar
tar -xf tmux_latest.tar
cd tmux-<tmux version>
./configure
make && make install
```

####start tmux
```
#check version
tmux -V
#start
tmux
```
