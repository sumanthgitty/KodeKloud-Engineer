1. SSH into App Server 1

2. cd into the `/scripts` folder and create the requested backup script
```
vi /scripts/beta_backup.sh
```

3. Write a script to create a zip file and save into `/backup` directory of the App Server and Backup Server
```
#!/bin/bash
zip -r /backup/xfusioncorp_beta.zip /var/www/html/beta
scp /backup/xfusioncorp_beta.zip clint@stbkp01:/backup
```

4. Create a keygen, then copy the key to the backup server so that the script will not require password to login
```
ssh-keygen
ssh-copy-id clint@stbkp01
```

5. Give execute permission ont he script and run
```
sudo chmod 777 /scripts/beta_backup.sh

./scripts/beta_backup.sh
OR
sh /scripts/beta_backup.sh
```

6. Check both the App Server and Backup Server if the zip file is present
```
ll /backup
```
