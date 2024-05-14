1. SSH into the backup server, and login as a root user

2. Check the iptables staus
```
systemctl status iptables
```
![](./img/1.png)

3. Check Apache and Nginx ports.
```
ss -tlnp | grep httpd
ss -tlnp | grep nginx
```
![](./img/2.png)

4. Start the iptables service

![](./img/3.png)

5. As per task, open the nginx port and block apache's to incoming connections
```
iptables -A INPUT -p tcp --dport 8093 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 3000 -m conntrack --ctstate NEW -j REJECT
```

6. Check and change the `icmp` Rule 5 for `prohibited` to `rejected`
```
iptables -L --line-numbers
```
![](./img/4.png)

```
iptables -R INPUT 5 -p icmp -j REJECT
```

```
service iptables save
```
![](./img/5.png)

```
iptables -L --line-numbers
```
![](./img/6.png)

7. Validate the reachabilty of the ports
```
telnet stbkp01 3000
telnet stbkp01 8093
```
![](./img/7.png)