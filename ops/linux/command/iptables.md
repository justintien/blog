# iptables

> 將範圍的 ports 映射到目標 port

```sh
sudo iptables -t nat -A PREROUTING -p tcp --dport 10001:65000 -j REDIRECT --to-ports 10001

# 刪除
iptables -t nat -D PREROUTING -p tcp --dport 10001:65000 -j REDIRECT --to-ports 10001

# 保存設定
service iptables save
sudo iptables-save # coreos

# check
sudo iptables -L -n -t nat

sudo iptables -t nat -A PREROUTING -p tcp --dport 10001:65000 -j REDIRECT --to-ports 10001 && sudo iptables-save
```
