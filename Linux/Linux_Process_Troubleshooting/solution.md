1. Identify the faulty server using `telnet`
```
telnet stapp01 3000
telnet stapp02 3000
telnet stapp03 3000
```

![](./img/1.png)

2. SSH into the faulty server (app server 1)
```
ssh tony@stapp01
sudo su -
```

3. Check if Apache HTTPD is running
```
systemctl start httpd
systemctl status httpd
```

![](./img/2.png)

4. Check the service using the port and its PID
```
netstat -tulnp
```

![](./img/4.png)

5. Confirm the PID as per the netstat output and kill the process
```
ps -ef | grep sendmail
kill {PID}
```

![](./img/5.png)

6. Start httpd service 
```
systemctl start httpd
systemctl status httpd
```

![](./img/6.png)

7. Validate the apache connection from jump server
```
telnet stapp01 3000
```
![](./img/7.png)