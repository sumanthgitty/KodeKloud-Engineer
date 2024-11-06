## Question
The Nautilus development team has completed development of one of the node applications, which they are planning to deploy on a Kubernetes cluster. They recently had a meeting with the DevOps team to share their requirements. Based on that, the DevOps team has listed out the exact requirements to deploy the app. Find below more details:

Create a deployment using gcr.io/kodekloud/centos-ssh-enabled:node image, replica count must be 2.

Create a service to expose this app, the service type must be NodePort, targetPort must be 8080 and nodePort should be 30012.

Make sure all the pods are in Running state after the deployment.

## Solution
#### 1. Create a Deployment
Create a deployment using the image gcr.io/kodekloud/centos-ssh-enabled:node with a replica count of 2. The deployment will use the label app: nodeapp to manage and organize the resources.

Deployment YAML: nodeapp-deployment.yml

- [nodeapp-deployment.yml](./deployment.yml)

Create the deployment using the following command:

```bash
kubectl apply -f nodeapp-deployment.yml
```

#### 2. Create a Service
Create a service to expose the Node application. This service will be of type NodePort with a target port of 8080 and a node port of 30012, allowing external access to the application.

Service YAML: nodeapp-service.yml

- [nodeapp-service.yml](./service.yml)

Create the service using the following command:

```bash
kubectl apply -f nodeapp-service.yml
```

#### 3. Verification
To verify that the deployment and service are successfully created and running, use the following commands:

```bash
# Check the status of the deployment
kubectl get deployments

# Verify that all pods are in the Running state
kubectl get pods -l app=nodeapp

# Check the status of the service
kubectl get svc
```

#### 4. Access the Application
Once all the pods are running, you can access the application using the Node's IP and the specified NodePort:

```bash
http://<NodeIP>:30012
```
Replace <NodeIP> with the IP address of any node in your Kubernetes cluster.