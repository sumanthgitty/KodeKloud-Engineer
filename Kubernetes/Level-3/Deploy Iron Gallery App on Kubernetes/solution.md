## Solution
#### 1. Create the Namespace
```sh
kubectl create namespace iron-namespace-nautilus
```

#### 2. Deploy Iron Gallery
Create the Deployment YAML:

- [irongallery-deployment](./irongallery-deployment.yaml)

Apply it:

```sh
kubectl apply -f iron-gallery-deployment.yaml
```

#### 3. Deploy Iron DB
Create the Deployment YAML:

- [db-deployment.yaml](./db-deployment.yaml)

Apply it:

```sh
kubectl apply -f iron-db-deployment.yaml
```

#### 4. Create Service for Iron DB
```yaml
apiVersion: v1
kind: Service
metadata:
  name: iron-db-service-nautilus
  namespace: iron-namespace-nautilus
spec:
  selector:
    db: mariadb
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
  type: ClusterIP
```
Apply it:

```sh
kubectl apply -f iron-db-service.yaml
```

#### 5. Create Service for Iron Gallery
```yaml
apiVersion: v1
kind: Service
metadata:
  name: iron-gallery-service-nautilus
  namespace: iron-namespace-nautilus
spec:
  selector:
    run: iron-gallery
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 32678
  type: NodePort
```
Apply it:

```sh
kubectl apply -f iron-gallery-service.yaml
```

#### 6. Verify Deployments & Services
```sh
kubectl get all -n iron-namespace-nautilus
```

#### 7. Access the Application
Find the Node IP (if using Minikube, use minikube ip):

```sh
http://<NODE_IP>:32678
```
