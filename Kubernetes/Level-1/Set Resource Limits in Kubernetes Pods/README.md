### Question

The Nautilus DevOps team has noticed performance issues in some Kubernetes-hosted applications due to resource constraints. To address this, they plan to set limits on resource utilization. Here are the details:

Create a pod named httpd-pod with a container named httpd-container. Use the httpd image with the latest tag (specify as httpd:latest). Set the following resource limits:

Requests: Memory: 15Mi, CPU: 100m

Limits: Memory: 20Mi, CPU: 100m

Note: The kubectl utility on jump_host is configured to operate with the Kubernetes cluster.

### Solution

Steps to Create the Pod with Resource Limits

1.Open Terminal

Open your terminal application on the system where kubectl is installed and configured.

2.Verify Kubernetes Cluster Access

Ensure you have access to your Kubernetes cluster by running:

```sh
kubectl cluster-info
```

2.Create the YAML File

Save the corrected YAML content to a file named httpd-pod.yaml.

Apply the YAML File

3.Use the kubectl apply command to create the pod:

```sh
kubectl apply -f httpd-pod.yaml
```

3.Verify the Pod

Run the following command to verify that the pod has been created and is running:

```sh
kubectl get pods
```

4.To get detailed information about the pod, including resource requests and limits, use:

```sh
kubectl describe pod httpd-pod
```