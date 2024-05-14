1. SSH into the mail server
```
ssh groot@stmail01
sudo su -
```

2. Verify the packages
```
rpm -qa | grep postfix
rpm -qa | grep dovecot
```

3. Install the packages (postfix and dovecot)
```
yum install postfix -y
yum install dovecot -y
```

4. Configure Postfix `vi /etc/postfix/main.cf`
```
Myhostname = stmail01.stratos.xfusioncorp.com (line 13)

My domain = stratos.xfusioncorp.com (line 6)

myorigin = $mydomain (Uncomment)

inet_interfaces = all (Uncomment)

#inet_interfaces = localhost (comment)

#mydestination (comment 1st line, uncomment 2nd line)

my networks = 172.16.238.0/24, 127.0.0.0/8

home_mailbox = Maildir/ (uncomment 2nd line)
```

5. Start postfix service
```
systemctl start postfix
systemctl status postfix
```

6. Create user and password
```
useradd ammar
passwd ammar
cat /etc/passwd | grep ammar
```

7. Verify mail server `telnet stmail01 25`
```
{
    EHLO localhost

    mail from: ammar@stratos.xfusioncorp.com

    rcpt to: ammar@stratos.xfusioncorp.com

    DATA
    
    test mail
    .

    quit
}
```

  * Login as ammar `su - ammar`
  ```
  mailq
  pwd
  ls /home/ammar/Maildir/
  ls /home/ammar/Maildir/new
  cat /home/ammar/Maildir/new/1641516434.V801I13f50c8M95702.stmail01.stratos.xfusioncorp.com
  ```

8. Configure Dovecot 
  * `vi /etc/dovecot/dovecot.conf`
  ```
  protocols = (uncomment)
  esc + :wq
  ```

  * ls /etc/dovecot/conf.d/10-

  * vi /etc/dovecot/conf.d/10-mail.conf
  ```
  mail_location = maildirxxxx (uncomment 1st line)
  ```

  * vi /etc/dovecot/conf.d/10-auth.conf
  ```
  disable_plaintext_auth = yes (uncomment)

  auth_mechanisms = plain login
  ```

  * vi /etc/dovecot/conf.d/10-master.conf
  ```
  unit_listener auth-userdb {
    mode = 0666
    user = postfix
    group = postfix
  }
  ```

9. Start dovecot
```
systemctl start dovecot
systemctl status dovecot
```

10. Validate dovecot `telnet stmail01 110`
```
{
    user ammar

    pass {password}

    retr 1

    test mail 
    .

    quit
}
```