## Solution
#### 1. Create the Secrets
---
Run the following commands to create the required secrets.

```sh
kubectl create secret generic mysql-root-pass \
  --from-literal=password=R00t

kubectl create secret generic mysql-user-pass \
  --from-literal=username=kodekloud_rin \
  --from-literal=password=Rc5C9EyvbU

kubectl create secret generic mysql-db-url \
  --from-literal=database=kodekloud_db9

kubectl create secret generic mysql-host \
  --from-literal=host=mysql-service
```
Verify that secrets were created:

```sh
kubectl get secrets
```

#### 2. Create the ConfigMap
Create a ConfigMap for php.ini settings.

```sh
kubectl create configmap php-config --from-file=php.ini
```

#### 3. Create the Deployment
Create a file lemp-deployment.yaml and paste the following:

- [deployment.yaml](./deployment.yaml)

Apply the deployment:

```sh
kubectl apply -f lemp-deployment.yaml
```
#### 4. Create the Services
Create lemp-services.yaml and paste the following:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: lemp-service
spec:
  selector:
    app: lemp-wp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30008
  type: NodePort
---
apiVersion: v1
kind: Service
metadata:
  name: mysql-service
spec:
  selector:
    app: lemp-wp
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
```

Apply:

```sh
kubectl apply -f lemp-services.yaml
```

#### 5. Copy index.php to the Container
Copy the index.php file from /tmp on the jump host to the Nginx container.
```sh
kubectl cp /tmp/index.php <nginx-pod-name>:/app -c <container-name>
```
Edit index.php to use environment variables.
Open the file inside the container:
```sh
kubectl exec -it <nginx-pod-name> -- sh
```
Edit the file /app/index.php:
Modify it as follows:
```php
<?php
$dbname = getenv('MYSQL_DATABASE');
$dbuser = getenv('MYSQL_USER');
$dbpass = getenv('MYSQL_PASSWORD');
$dbhost = getenv('MYSQL_HOST');

$connect = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if (!$connect) {
    die("Connection failed: " . mysqli_connect_error());
}

echo "Connected successfully";
?>
Save and exit (ESC + :wq).
```

#### 6. Verify Setup
Check pod logs to confirm containers are running without errors:

```sh
kubectl logs <nginx-pod-name>
kubectl logs <mysql-pod-name>
```
Access the web application using the NodePort:
```sh
http://<node-ip>:30008
```