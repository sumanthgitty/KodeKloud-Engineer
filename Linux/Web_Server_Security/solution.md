1. SSH into the server
```
ssh steve@stapp02
sudo su -
```

2. To hide the version number of the Apache server

* Edit the Apache server configuration file
```
vi /etc/httpd/conf/httpd.conf
```

* Add the following to the file
```
ServerTokens Prod
ServerSignature Off
```

3. To Disable Directory Browsing on Apache

* Edit the configuration file
```
vi /etc/httpd/conf/httpd.conf
```

* Find the line
```
Options Indexes FollowSymLinks
```

* and remove Indexes from that line or replace with -Indexes
```
Options FollowSymLinks
```

4. Restart and Validate httpd
```
systemctl start httpd
systemctl status httpd
curl -l http://stapp02:8080
curl -l http://stapp02:8080/ecommerce
```