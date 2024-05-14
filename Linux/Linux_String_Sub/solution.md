1. SSH into the backup server
```
ssh clint@stbkp01
sudo -i
```

2. Replace string `Random` to `Marine` using `sed` command
```
sed -i 's/Random/Marine/g' /root/nautilus.xml
```

![](./img/Screenshot%202022-11-07%20at%2007.37.11.png)