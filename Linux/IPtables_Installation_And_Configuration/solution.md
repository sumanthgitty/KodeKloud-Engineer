1. SSH into the app server

2. Install IPtables service
```
yum install  -y iptables-services
```

3. Start and enable IPtables service
```
systemctl start iptables
systemctl enable iptables
```

4. Add rules to accept incoming traffic from the load-balancer server and reject incoming traffic from other servers
```
iptables -A INPUT -p tcp --destination-port 3001 -s 172.16.238.14 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 3001 -j DROP

iptables -L --line-numbers
iptables -R INPUT 5 -p icmp -j REJECT
```

5. Save rules to ensure persistent across reboot
```
service iptables save
```

6. Restart IPtables service
```
systemctl restart iptables
systemctl status iptables
```

7. Do this for all app servers