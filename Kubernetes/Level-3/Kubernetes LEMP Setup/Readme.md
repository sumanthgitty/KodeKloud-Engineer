## Question 
The Nautilus DevOps team want to deploy a static website on Kubernetes cluster. They are going to use Nginx, phpfpm and MySQL for the database. The team had already gathered the requirements and now they want to make this website live. Below you can find more details:

Create some secrets for MySQL.

Create a secret named mysql-root-pass wih key/value pairs as below:
```sh
name: password
value: R00t
```
Create a secret named mysql-user-pass with key/value pairs as below:
```sh
name: username
value: kodekloud_joy

name: password
value: Rc5C9EyvbU
```
Create a secret named mysql-db-url with key/value pairs as below:
```sh
name: database
value: kodekloud_db8
```
Create a secret named mysql-host with key/value pairs as below:
```sh
name: host
value: mysql-service
```
Create a config map php-config for php.ini with variables_order = "EGPCS" data.

Create a deployment named lemp-wp.

Create two containers under it. First container must be nginx-php-container using image webdevops/php-nginx:alpine-3-php7 and second container must be mysql-container from image mysql:5.6. Mount php-config configmap in nginx container at /opt/docker/etc/php/php.ini location.

5) Add some environment variables for both containers:

MYSQL_ROOT_PASSWORD, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD and MYSQL_HOST. Take their values from the secrets you created. Please make sure to use env field (do not use envFrom) to define the name-value pair of environment variables.

6) Create a node port type service lemp-service to expose the web application, nodePort must be 30008.

7) Create a service for mysql named mysql-service and its port must be 3306.

We already have a /tmp/index.php file on jump_host server.

Copy this file into the nginx container under document root i.e /app and replace the dummy values for mysql related variables with the environment variables you have set for mysql related parameters. Please make sure you do not hard code the mysql related details in this file, you must use the environment variables to fetch those values.

Once done, you must be able to access this website using Website button on the top bar, please note that you should see Connected successfully message while accessing this page.

## Solution 

Check the solution here - [Solution](./Solution.md) 
