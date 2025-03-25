## Question
One of the DevOps engineers was trying to deploy a python app on Kubernetes cluster. Unfortunately, due to some mis-configuration, the application is not coming up. Please take a look into it and fix the issues. Application should be accessible on the specified nodePort.

The deployment name is python-deployment-datacenter, its using poroko/flask-demo-appimage. The deployment and service of this app is already deployed.

nodePort should be 32345 and targetPort should be python flask app's default port.

## Solution 
#### Step 1. Get the Deployment YAML
---
Since the application is not coming up, first extract the deployment YAML:

```sh
kubectl get deployment python-deployment-datacenter -o yaml > python-deployment.yaml
```
Check the image name and update it if needed. The correct image should be:

```yaml
image: poroko/flask-demo-appimage
```
If it was incorrect, edit the file, Then apply the fix:

```sh
kubectl apply -f python-deployment.yaml
```

Corrected deployment file - [deployment.yaml](./deployment.yaml)

#### Step 2. Get the Service YAML
---
Extract the service YAML to check the ports:

```sh
kubectl get svc python-service-datacenter -o yaml > python-service.yaml
```
Make sure the targetPort is set to 5000 (Flask default port), and nodePort is 32345:

```yaml
ports:
  - protocol: TCP
    port: 80
    targetPort: 5000
    nodePort: 32345
```
If it was incorrect, edit and apply the fix:

```sh
vi python-service.yaml
kubectl apply -f python-service.yaml
```

#### Step 3. Verify Deployment and Pods
---
Check if the deployment and pods are running:

```sh
kubectl get deployments
kubectl get pods
```

#### Step 4. Test the Application
---
Access the app using curl or a browser:

```sh
curl http://<NODE_IP>:32345
```