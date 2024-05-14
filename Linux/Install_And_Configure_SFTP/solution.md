1. SSH into App Server 1, and login as root user.

2. Create SFTP user and password
```
useradd ammar
passwd ammar
```

3. Make directory and set it as ChrootDirectory.
* Note: `Chroot` (change root) is a unix operation that changes the apparent root directory to the one specified by the user.

```
mkdir -p /var/www/opt
chown root:root /var/www
chmod -R 755 /var/www
ll -lsd /var/www
```

4. Edit the `/etc/ssh/sshd_config` file.
```
vi /etc/ssh/sshd_config

{
    #subsystem      sftp    /usr/libexec/openssh/sftp-server

    Subsystem       sftp    internal-sftp

    Match User ammar

    ForceCommand internal-sftp

    PasswordAuthentication yes

    ChrootDirectory /var/www/opt

    PermitTunnel no

    AllowTcpForwarding no

    X11Forwarding no

    AllowAgentForwarding no
}

cat /etc/ssh/sshd_config | grep sftp -A 10
```

5. Restart the sshd service
```
systemctl restart sshd
systemctl status sshd
```

6. Validate the task by below commands from the jump server as well localhost.
* From jump server:
    `sftp ammar@stapp01`

* From localhost:
    `sftp ammar@localhost`