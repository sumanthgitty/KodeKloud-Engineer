## Solution 1

1. SSH into the database server

    ```
    ssh peter@stdb01
    sudo -i
    ```

2. Start mariadb service

    ```
    systemctl start mariadb
    ```

3. Check status of failed mariadb service
    
    ```
    systemctl status mariadb
    ```

4. Check the logs

    ```
    cat /var/log/mariadb//mariadb.log
    ```

5. Check Permissions
    
    ```
    ll /var/run/mariadb/ -a
    ```

6. Change Permissions 

    ```
    chmod -R 777 /var/run/mariadb
    ```

7. Restart mariadb

    ```
    systemctl restart mariadb
    ```


## Solution 2

1. Uninstall mariadb and mariadb-server packages

    ```
    yum remove mariadb
    ```

2. delete the /var/lib/mysql directory

    ```
    rm -rf /var/lib/mysql
    ```

3. Reinstall mariadb and mariadb-server packages

    ```
    yum install mariadb -y
    ```

4. Start and Enable mariadb service

    ```
    systemctl start mariadb
    systemctl enable mariadb
    ```

5. Check mariadb status

    ```
    systemctl status mariadb
    ```

