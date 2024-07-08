### Question

The Nautilus DevOps team is planning to deploy some micro services on Kubernetes platform. The team has already set up a Kubernetes cluster and now they want to set up some namespaces, deployments etc. Based on the current requirements, the team has shared some details as below:

Create a namespace named dev and deploy a POD within it. Name the pod dev-nginx-pod and use the nginx image with the latest tag. Ensure to specify the tag as nginx:latest.

Note: The kubectl utility on jump_host is configured to operate with the Kubernetes cluster.

### Solution

Steps to Create a Namespace and Deploy a Pod in Kubernetes

1.Open Terminal

Open your terminal application on the system where kubectl is installed and configured.

2.Verify Kubernetes Cluster Access

Run the following command to ensure you have access to your Kubernetes cluster:

```sh
kubectl cluster-info
```

3.Create the Namespace

Execute the following command to create a namespace named dev:

```sh
kubectl create namespace dev
```

4.Create the Pod in the Namespace

Run the following command to create a pod named dev-nginx-pod using the nginx:latest image within the dev namespace:

```sh
kubectl run dev-nginx-pod --image=nginx:latest --namespace=dev
```
5.Verify the Namespace

Run the following command to verify that the dev namespace has been created:

```sh
kubectl get namespaces
```
You should see the dev namespace listed in the output.

6.Verify the Pod

Run the following command to verify that the dev-nginx-pod has been created in the dev namespace:

```sh
kubectl get pods --namespace=dev
```
You should see the dev-nginx-pod listed in the output.