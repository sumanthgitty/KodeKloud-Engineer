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
#### Step 1: Create MySQL Secrets

Use the following commands to create the required Kubernetes secrets:

```sh
kubectl create secret generic mysql-root-pass --from-literal=password=R00t

kubectl create secret generic mysql-user-pass --from-literal=username=kodekloud_joy --from-literal=password=Rc5C9EyvbU

kubectl create secret generic mysql-db-url --from-literal=database=kodekloud_db8

kubectl create secret generic mysql-host --from-literal=host=mysql-service
```
Verify the secrets:

```sh
kubectl get secrets
```
#### Step 2: Create the PHP ConfigMap
Create a ConfigMap php-config for PHP settings:
```sh
kubectl create configmap php-config --from-literal=php.ini
```
Verify the ConfigMap:

```sh
kubectl get configmap php-config -o yaml
```
#### Step 3: Create the LEMP Deployment
Create a YAML file for the Deployment and save it as lemp-wp-deployment.yml:

- [deployment.yaml](./deployment.yaml)


Apply the deployment:

```sh
kubectl apply -f lemp-wp-deployment.yml
```
Verify:

```sh
kubectl get pods
```
#### Step 4: Create Services
1. Expose Nginx-PHP via NodePort
Create a service YAML file lemp-service.yml:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: lemp-service
spec:
  selector:
    app: lemp
  type: NodePort
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30008
```
Apply:

```sh
kubectl apply -f lemp-service.yml
```
2. Create MySQL Service
Create mysql-service.yml:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mysql-service
spec:
  selector:
    app: lemp
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
```
Apply:

```sh
kubectl apply -f mysql-service.yml
```
Verify:

```sh
kubectl get svc
```
#### Step 5: Copy index.php to Nginx-PHP Container
Copy index.php to the container

Copy index.php from /tmp on the jump host to the pod:

```sh
kubectl cp /tmp/index.php <nginx_pod>:/app
```
Update index.php to use environment variables
Modify index.php inside the pod:

```sh
kubectl exec -it <nginx_pod> -- sh
vi /app/index.php
```
Replace hardcoded MySQL values with:

```php
$db_host = getenv('MYSQL_HOST');
$db_user = getenv('MYSQL_USER');
$db_pass = getenv('MYSQL_PASSWORD');
$db_name = getenv('MYSQL_DATABASE');

$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
```
Save and exit.

#### Step 6: Test the Application
Get the Node IP:

```sh
kubectl get nodes -o wide
```
Open the website:

http://<NodeIP>:30008/index.php

You should see the message:

Connected successfully
