## Question
A new MySQL server needs to be deployed on Kubernetes cluster. The Nautilus DevOps team was working on to gather the requirements. Recently they were able to finalize the requirements and shared them with the team members to start working on it. Below you can find the details:

**1.** Create a PersistentVolume mysql-pv, its capacity should be 250Mi, set other parameters as per your preference.

**2.** Create a PersistentVolumeClaim to request this PersistentVolume storage. Name it as mysql-pv-claim and request a 250Mi of storage. Set other parameters as per your preference.

**3.** Create a deployment named mysql-deployment, use any mysql image as per your preference. Mount the PersistentVolume at mount path /var/lib/mysql.

**4.** Create a NodePort type service named mysql and set nodePort to 30007.

**5.** Create a secret named mysql-root-pass having a key pair value, where key is password and its value is YUIidhb667, create another secret named mysql-user-pass having some key pair values, where frist key is username and its value is kodekloud_pop, second key is password and value is BruCStnMT5, create one more secret named mysql-db-url, key name is database and value is kodekloud_db1

**6.** Define some Environment variables within the container:

- name: MYSQL_ROOT_PASSWORD, should pick value from secretKeyRef name: mysql-root-pass and key: password

- name: MYSQL_DATABASE, should pick value from secretKeyRef name: mysql-db-url and key: database

- name: MYSQL_USER, should pick value from secretKeyRef name: mysql-user-pass key key: username

- name: MYSQL_PASSWORD, should pick value from secretKeyRef name: mysql-user-pass and key: password

## Solution
#### Step 1. Create PersistentVolume (PV)
---
- [mysql-pv.yaml](./pv.yaml)

Command to Apply
```sh
kubectl apply -f mysql-pv.yaml
```

#### Step 2. Create PersistentVolumeClaim (PVC)
---
- [mysql-pvc.yaml](./pvc.yaml)

Command to Apply
```sh
kubectl apply -f mysql-pvc.yaml
```

#### Step 3. Create Kubernetes Secrets
---
Command to Create Secrets
```sh
kubectl create secret generic mysql-root-pass --from-literal=password=YUIidhb667
kubectl create secret generic mysql-user-pass --from-literal=username=kodekloud_pop --from-literal=password=BruCStnMT5
kubectl create secret generic mysql-db-url --from-literal=database=kodekloud_db1
```
Verify Secrets
```sh
kubectl get secrets
kubectl describe secret mysql-root-pass
```

#### Step 4. Deploy MySQL Using a Deployment
---
- [mysql-deployment.yaml](./deployment.yaml)

Command to Apply
```sh
kubectl apply -f mysql-deployment.yaml
```

#### Step 5. Expose MySQL Using a NodePort Service
---
- [mysql-svc.yaml](./mysql-svc.yaml)

Command to Apply
```sh
kubectl apply -f mysql-service.yaml
```

#### 6.Check or Verify Persistent Volumes, secrets, deployment, service 
---
```sh
kubectl get pv
kubectl get pvc
kubectl get secrets
kubectl get deployments
kubectl get pods
kubectl get svc
```