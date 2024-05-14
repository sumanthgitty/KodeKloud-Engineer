1. SSH into the app server
```
ssh tony@stapp01
sudo -i
```

2. Check user and its sudo permission
```
id james
su - james
sudo cat /etc/sudoers | grep james
```

![](./img/1.png)


3. Switch back to root user and provide sudo permission without password
```
visudo
```

![](./img/2.png)

![](./img/3.png)

![](./img/4.png)

4. Repeat these steps for other app servers