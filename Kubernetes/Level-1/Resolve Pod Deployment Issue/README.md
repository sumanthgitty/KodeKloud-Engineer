### Question
A junior DevOps team member encountered difficulties deploying a stack on the Kubernetes cluster. The pod fails to start, presenting errors. Let's troubleshoot and rectify the issue promptly.

There is a pod named webserver, and the container within it is named nginx-container, its utilizing the nginx:latest image.

Additionally, there's a sidecar container named sidecar-container using the ubuntu:latest image.

Identify and address the issue to ensure the pod is in the running state and the application is accessible.

Note: The kubectl utility on jump_host is configured to interact with the Kubernetes cluster.

### Solution

### Steps

1.Run this command to see the problem:

```sh
kubectl describe pod webserver
```

2.In this case, image name was assigned with typo, fix "nginx:latests" to "nginx:latest":

```sh
kubectl edit pod webserver
```