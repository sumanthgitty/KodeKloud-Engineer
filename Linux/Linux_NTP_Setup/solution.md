1. SSH into App Server 3
```
ssh banner@stapp03
sudo -i
```

2. Update centos and install `ntp`
```
yum install update -y @@ yum install -y ntp
```

3. Configure NTP Servers
```
vi /etc/ntp.conf
```

* server 0.africa.pool.ntp.org iburst
* server 1.africa.pool.ntp.org iburst
* server 2.africa.pool.ntp.org iburst
* server 3.africa.pool.ntp.org iburst