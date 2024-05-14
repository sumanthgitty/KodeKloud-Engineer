1. SSH into App server 1 & switch to root user
```
ssh tony@stapp01
sudo su -
```

2. Install httpd package on the server
```
yum install httpd -y
```

![](./img/1.png)

3. Edit httpd configuration file; change the port & add Headers at end
```
vi /etc/httpd/conf/httpd.conf
```

![](./img/2.png)

![](./img/3.png)

![](./img/4.png)

4. Create `index.html` file and echo the given content

![](./img/5.png)

5. Start htttpd.

![](./img/6.png)

6. Validate task by Curl

![](./img/7.png)