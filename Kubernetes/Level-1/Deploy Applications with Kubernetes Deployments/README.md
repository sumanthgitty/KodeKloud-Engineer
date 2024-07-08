### Question

The Nautilus DevOps team is delving into Kubernetes for app management. One team member needs to create a deployment following these details:

Create a deployment named httpd to deploy the application httpd using the image httpd:latest (ensure to specify the tag)

Note: The kubectl utility on jump_host is set up to interact with the Kubernetes cluster.

### Solution

Steps to Create a Kubernetes Deployment for httpd

1.Open Terminal

Open your terminal application on the system where kubectl is installed and configured.

2.Verify Kubernetes Cluster Access

Run the following command to ensure you have access to your Kubernetes cluster:

```sh
kubectl cluster-info
```

3.Create the Deployment

Execute the following command to create the deployment named httpd using the httpd:latest image:

```sh
kubectl create deployment httpd --image=httpd:latest
```

4.Verify the Deployment

Run the following command to verify the deployment:

```sh
kubectl get deployments
```

You should see the httpd deployment listed in the output.