1. SSH into the mail server, then login as a root user
```
ssh groot@stmail01
sudo -i
```

2. Check if postfix is installed
```
rpm -qa | grep postfix
```

3. Check postfix service status wit `-l` flag for detailed error
```
systemctl status postfix -l
```

4. If it gives failed error, cat the `main.cf` file
```
cat /etc/postfix/main.cf | grep inet_interface
```

5. Edit the file, and comment out `inet_interface=localhost`
```
vi /etc/postfix/main.cf
```

6. Restart the service
```
systemctl restart postfix
```

## Postfix Configuration after installation

myhostname = smtp.example.local

mydomain = example.local

myorigin = $mydomain

inet_interfaces = all

inet_protocols = all

mydestination = $myhostname, localhost.$mydomain, localhost,

mynetworks = <your ip>, 127.0.0.0/8