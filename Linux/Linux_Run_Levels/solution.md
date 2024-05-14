1. SSH into the app server
```
ssh tony@stapp01
sudo -i
```

2. Check current linux run level
```
systemctl get-default
```

3. Change the multi-level target to graphical target
```
systemctl set-default graphical.target
```

4. Repeat steps for server 2 and 3