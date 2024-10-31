## Question
The Nautilus DevOps team is planning to set up a Jenkins CI server to create/manage some deployment pipelines for some of the projects. They want to set up the Jenkins server on Kubernetes cluster. Below you can find more details about the task:

1) Create a namespace jenkins

2) Create a Service for jenkins deployment. Service name should be jenkins-service under jenkins namespace, type should be NodePort, nodePort should be 30008

3) Create a Jenkins Deployment under jenkins namespace, It should be name as jenkins-deployment , labels app should be jenkins , container name should be jenkins-container , use jenkins/jenkins image , containerPort should be 8080 and replicas count should be 1.

Make sure to wait for the pods to be in running state and make sure you are able to access the Jenkins login screen in the browser before hitting the Check button.

## Solution

#### 1. Create Namespace

```bash
kubectl create namespace jenkins
```

#### 2. Create Service for Jenkins

The service will expose the Jenkins deployment.

- [service.yml](./service.yml)

```bash
kubectl apply -f <service.yaml>
```

#### 3. Create Jenkins Deployment

Deploy a single Jenkins pod using the jenkins/jenkins image.

-[deployment.yml](./deployment.yml)

```bash
kubectl apply -f <deployment.yaml>
```

#### 4. Verification
Check if the namespace, service, and deployment have been created:

```bash
kubectl get namespaces
kubectl get svc -n jenkins
kubectl get deployments -n jenkins
```
Access Jenkins using NodeIP:30008 in your browser.