## Question
cluster. The development team had a meeting with the DevOps team to share the requirements and application scope. The team is ready to setup an application stack for it under their existing cluster. Below you can find the details for this:

Create a namespace named tomcat-namespace-devops.

Create a deployment for tomcat app which should be named as tomcat-deployment-devops under the same namespace you created. Replica count should be 1, the container should be named as tomcat-container-devops, its image should be gcr.io/kodekloud/centos-ssh-enabled:tomcat and its container port should be 8080.

Create a service for tomcat app which should be named as tomcat-service-devops under the same namespace you created. Service type should be NodePort and nodePort should be 32227.

## Solution
#### 1. Create a Namespace
First, create a new namespace called tomcat-namespace-devops.

```bash
kubectl create namespace tomcat-namespace-devops
```

#### 2. Create a Deployment
Create a deployment for the Tomcat application named tomcat-deployment-devops within the tomcat-namespace-devops namespace. The deployment should have the following specifications:

Replica Count: 1
Container Name: tomcat-container-devops
Container Image: gcr.io/kodekloud/centos-ssh-enabled:tomcat
Container Port: 8080
Deployment YAML: tomcat-deployment.yml

- [deployment.yml](./deployment.yml)

Deploy the application using:

```bash
kubectl apply -f tomcat-deployment.yml
```

#### 3. Create a Service
Create a NodePort service named tomcat-service-devops under the same namespace. This service will allow external access to the Tomcat application.

Service YAML: tomcat-service.yml

- [service.yml](./service.yml)

Create the service using:

```bash
kubectl apply -f tomcat-service.yml
```

#### 4. Verification
To verify that the deployment and service have been created successfully, run the following commands:

```bash
# Check if the namespace is created
kubectl get namespaces

# Check if the deployment is running
kubectl get deployments -n tomcat-namespace-devops

# Check if the service is created
kubectl get svc -n tomcat-namespace-devops
```

#### 5. Accessing the Application
You can access the Tomcat application by navigating to http://<NodeIP>:32227 in your web browser, where <NodeIP> is the IP address of any of your Kubernetes cluster nodes.