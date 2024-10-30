#### Question
There is a production deployment planned for next week. The Nautilus DevOps team wants to test the deployment update and rollback on Dev environment first so that they can identify the risks in advance. Below you can find more details about the plan they want to execute.

Create a namespace xfusion. Create a deployment called httpd-deploy under this new namespace, It should have one container called httpd, use httpd:2.4.25 image and 3 replicas. The deployment should use RollingUpdate strategy with maxSurge=1, and maxUnavailable=2. Also create a NodePort type service named httpd-service and expose the deployment on nodePort: 30008.

Now upgrade the deployment to version httpd:2.4.43 using a rolling update.

Finally, once all pods are updated undo the recent update and roll back to the previous/original version.

#### Solution

## 1. Create a Namespace
Create a namespace named xfusion:

```bash
kubectl create namespace xfusion
```

## 2. Create the Deployment
Create a deployment called httpd-deploy with the following specifications:

Container name: httpd
Image: httpd:2.4.25
Replicas: 3
Rolling update strategy with:
maxSurge: 1
maxUnavailable: 2
Create a YAML file named httpd-deployment.yaml with the following content:

- [deployment.yml](./deployment.yml)

__Apply the deployment:__

```bash
kubectl apply -f httpd-deployment.yaml
```

## 3. Create the Service
Create a NodePort service named httpd-service and expose it on nodePort: 30008:

Create a YAML file named httpd-service.yaml with the following content:

- [service.yml](./service.yml)

__Apply the service:__

```bash
kubectl apply -f httpd-service.yaml
```

## 4. Upgrade the Deployment
Upgrade the deployment to use the new image version httpd:2.4.43:

```bash
kubectl set image deployment/httpd-deploy httpd=httpd:2.4.43 -n xfusion
```

## 5. Rollback the Deployment
Once the pods have been updated, rollback to the previous version:

```bash
kubectl rollout undo deployment/httpd-deploy -n xfusion
```

## 6. Verify the Deployment and Service
Check the status of the deployment and service:

```bash
kubectl get deployment -n xfusion
kubectl get service -n xfusion
kubectl get pods -n xfusion
```