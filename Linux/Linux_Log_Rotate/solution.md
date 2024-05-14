1. SSH into the App Server, login as root user.
```
ssh tony@stapp01
sudo -i
```

2. Install `haproxy` as per task
```
yum install haproxy -y
```

3. Navigate to logrotate folder and check existing folder
```
ll /etc/logrotate.d/
```

4. Edit the `/etc/logrotate.d/haproxy` file from daily to monthly with 3 rotations
```
vi /etc/logrotate.d/haproxy

from this:

/var/log/squid/*.log {

    daily

    rotate 10

    compress

    notifempty

    missingok

    nocreate

    sharedscripts

    postrotate

      # Asks squid to reopen its logs. (logfile_rotate 0 is set in squid.conf)

      # errors redirected to make it silent if squid is not running

      /usr/sbin/squid -k rotate 2>/dev/null

      # Wait a little to allow Squid to catch up before the logs is compressed

    sleep 1
    
    endscript
}

to this:

/var/log/squid/*.log {

    monthly

    rotate 3

    compress

    notifempty

    missingok

    nocreate

    sharedscripts

    postrotate

      # Asks squid to reopen its logs. (logfile_rotate 0 is set in squid.conf)

      # errors redirected to make it silent if squid is not running

      /usr/sbin/squid -k rotate 2>/dev/null

      # Wait a little to allow Squid to catch up before the logs is compressed

    sleep 1
    
    endscript
}
```

5. Restart the package and check status
```
systemctl restart haproxy
systemctl status haproxy
```

6. Repeat these steps for stapp02 and stapp03