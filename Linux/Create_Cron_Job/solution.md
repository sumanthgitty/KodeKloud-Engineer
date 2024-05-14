1. SSH into the server
```
ssh tony@stapp01
sudo -i
```

2. Install the cronie package and start the service.
```
yum install cronie -y
systemctl start crond.service
systemctl status crond.service
```

3. Check for pre-existing crontab setup.
```
crontab -u root -l
```

4. Add the crontab configuration for the root user.
```
crontab -e
```

5. Step above will open an editor, write the intended config.
```
*/5 * * * * echo hello > /tmp/cron_text
```

6. Watch the temp repository for 5mins to see the creation of the cron_text file
```
watch -n 5 ls /tmp
```

7. Repeat for server 2 and 3