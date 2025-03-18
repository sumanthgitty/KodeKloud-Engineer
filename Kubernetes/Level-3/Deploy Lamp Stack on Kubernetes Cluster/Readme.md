#### Question
---
#### LAMP Stack Deployment on Kubernetes
1) Create a config map php-config for php.ini with variables_order = "EGPCS" data.

2) Create a deployment named lamp-wp.

3) Create two containers under it. First container must be httpd-php-container using image webdevops/php-apache:alpine-3-php7 and second container must be mysql-container from image mysql:5.6. Mount php-config configmap in httpd container at /opt/docker/etc/php/php.ini location.

4) Create kubernetes generic secrets for mysql related values like myql root password, mysql user, mysql password, mysql host and mysql database. Set any values of your choice.

5) Add some environment variables for both containers:

a) MYSQL_ROOT_PASSWORD, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD and MYSQL_HOST. Take their values from the secrets you created. Please make sure to use env field (do not use envFrom) to define the name-value pair of environment variables.

6) Create a node port type service lamp-service to expose the web application, nodePort must be 30008.

7) Create a service for mysql named mysql-service and its port must be 3306.

8) We already have /tmp/index.php file on jump_host server.

a) Copy this file into httpd container under Apache document root i.e /app and replace the dummy values for mysql related variables with the environment variables you have set for mysql related parameters. Please make sure you do not hard code the mysql related details in this file, you must use the environment variables to fetch those values.

b) You must be able to access this index.php on node port 30008 at the end, please note that you should see Connected successfully message while accessing this page.

#### Solution
---

This guide walks you through deploying a **LAMP stack (Linux, Apache, MySQL, PHP)** on Kubernetes using **Secrets**, **ConfigMaps**, and **Services**.

## **1️⃣ Prerequisites**
- Kubernetes cluster 
- kubectl installed

---

## **2️⃣ Create Kubernetes Secrets for MySQL Credentials**

```sh
kubectl create secret generic my-secret \
  --from-literal=MYSQL_ROOT_PASSWORD=rootpass \
  --from-literal=MYSQL_DATABASE=wordpress \
  --from-literal=MYSQL_USER=user \
  --from-literal=MYSQL_PASSWORD=pass \
  --from-literal=MYSQL_HOST=mysql-service
```

- [mysql-secrets.yaml](./mysql-secrets.yml)

### **🔹 Why?**
- Stores **sensitive credentials** securely without hardcoding in YAML files.
- Environment variables from Secrets will be used inside the Pods.

---

## **3️⃣ Create ConfigMap for PHP Configuration**

```sh
kubectl create configmap php-config --from-file=php.ini
```
- [config-map.yaml](./config-map.yml)

### **🔹 Why?**
- Stores **non-sensitive configuration** (PHP settings) separately from Pods.
- Allows **dynamic updates** without modifying Pod definitions.

---

## **4️⃣ Deploy the LAMP Stack (Apache + MySQL)**

### **📝 Deployment YAML**
Save the following as `deployment.yaml`:

- [deployment.yaml](./deployment.yml)

### **🔹 Why?**
- Defines **multi-container** Pod for **Apache+PHP** and **MySQL**.
- Uses **Secrets** for MySQL credentials.
- Mounts **ConfigMap for PHP settings**.

---

## **5️⃣ Create Services**

### **Apache Service (Exposing Web App)**
Save as `apache-service.yaml`:

- [apache-service.yaml](./apache-service.yml)

### **🔹 Why?**
- Exposes Apache on **port 30008** to access it externally.

### **MySQL Service (Internal Database Connection)**
Save as `mysql-service.yaml`:

- [mysql-service.yaml](./mysql-service.yml)

### **🔹 Why?**
- Makes MySQL **accessible only inside the cluster** using `mysql-service` as hostname.

---

## **6️⃣ Deploy the Application**

```sh
kubectl apply -f deployment.yaml
kubectl apply -f apache-service.yaml
kubectl apply -f mysql-service.yaml
```

### **🔹 Why?**
- Separates Deployment & Services for better **modularity and reusability**.

---

## **7️⃣ Verify Deployment**

```sh
kubectl get pods
kubectl get svc
```
- Ensure **Pods are Running**.
- Services should have **ClusterIP & NodePort assigned**.

---

## **8️⃣ Test MySQL Connection Inside Apache Container**

```sh
kubectl exec -it <lamp-wp-pod> -c httpd-php-container -- /bin/sh
```
Then inside the shell:
```sh
echo $MYSQL_HOST  # Should print 'mysql-service'
```

### **🔹 Why?**
- Ensures **environment variables** are set correctly.

---

## **9️⃣ Copy `index.php` to Apache Document Root**
Create a sample `index.php`:

```php
<?php
$host = getenv("MYSQL_HOST");
$user = getenv("MYSQL_USER");
$password = getenv("MYSQL_PASSWORD");
$database = getenv("MYSQL_DATABASE");

$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully!";
?>
```

Copy `index.php` inside the Apache container:

```sh
kubectl cp /tmp/index.php <lamp-wp-pod>:/app -c httpd-php-container
```

### **🔹 Why?**
- Places `index.php` inside Apache’s **document root**.
- Allows **Apache to serve PHP pages**.

---

## **Final Notes**
**Your LAMP stack is now running on Kubernetes!** 
- Access your application: `http://<node-ip>:30008`
- MySQL database runs internally and can be accessed via `mysql-service`.