1. SSH into the app server
```
ssh tony@stapp01
sudo -i
```

2. Open the SSH main conifguration file.
```
vi /etc/ssh/sshd_config
```

3. Change the `PermitRootLogin` to no

![](./img/Screenshot%202022-11-09%20at%2007.23.22.png)

4. Restart sshd service
```
systemctl restart sshd
```

5. Repeat for servers 2 and 3