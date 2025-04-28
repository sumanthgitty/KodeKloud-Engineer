## Question
We need to deploy a Drupal application on Kubernetes cluster. The Nautilus application development team want to setup a fresh Drupal as they will do the installation on their own. Below you can find the requirements, they have shared with us.

1) Configure a persistent volume drupal-mysql-pv with hostPath = /drupal-mysql-data (/drupal-mysql-data directory already exists on the worker Node i.e jump host), 5Gi of storage and ReadWriteOnce access mode.

2) Configure one PersistentVolumeClaim named drupal-mysql-pvc with storage request of 3Gi and ReadWriteOnce access mode.

3) Create a deployment drupal-mysql with 1 replica, use mysql:5.7 image. Mount the claimed PVC at /var/lib/mysql.

4) Create a deployment drupal with 1 replica and use drupal:8.6 image.

4) Create a NodePort type service which should be named as drupal-service and nodePort should be 30095.

5) Create a service drupal-mysql-service to expose mysql deployment on port 3306.

6) Set rest of the configration for deployments, services, secrets etc as per your preferences. At the end you should be able to access the Drupal installation page by clicking on App button.

## Solution
Deploying Drupal Application on Kubernetes
#### Steps:
#### 1. Create a Persistent Volume (PV)
- Define a PersistentVolume named drupal-mysql-pv.
- Use hostPath: /drupal-mysql-data (directory already exists on the node).
- Set storage capacity to 5Gi.
- Set accessModes to ReadWriteOnce.
- [Persistent-Volume.yaml](./pv.yaml)

#### 2. Create a Persistent Volume Claim (PVC)
- Define a PersistentVolumeClaim named drupal-mysql-pvc.
- Request 3Gi of storage.
- Use accessModes: ReadWriteOnce.
- [PVC.yaml](./pvc.yaml)

#### 3. Create a Deployment for MySQL
- Create a Deployment named drupal-mysql.
- Use the mysql:5.7 image.
- Mount the previously created PVC at the path /var/lib/mysql.
- Set replicas to 1.
- [Deployment.yaml](./Deployment.yaml)

#### 4. Create a Deployment for Drupal
- Create a Deployment named drupal.
- Use the drupal:8.6 image.
- Set replicas to 1.
- [Deployment.yaml](./Deployment.yaml)

#### 5. Create Services
- Create a **NodePort Service** named drupal-service.
- Expose port 80.
- Set nodePort to 30095.
- Select pods with label app: drupal.
- Create a **ClusterIP Service** named drupal-mysql-service.
- Expose port 3306.
- Select pods with label app: drupal-mysql.

- [svc.yaml](./svc.yaml)

#### 6. (Optional) Configure MySQL Environment Variables
Set environment variables like MYSQL_ROOT_PASSWORD inside the mysql container for security.

Can be passed via env field in the Deployment or use a Kubernetes Secret.

#### 7. Access the Drupal Installation Page