### Question

An application currently running on the Kubernetes cluster employs the nginx web server. The Nautilus application development team has introduced some recent changes that need deployment. They've crafted an image nginx:1.17 with the latest updates.

Execute a rolling update for this application, integrating the nginx:1.17 image. The deployment is named nginx-deployment.

Ensure all pods are operational post-update.

Note: The kubectl utility on jump_host is set up to operate with the Kubernetes cluster

### Solution

Steps

1.Check Current Deployment

First, verify the current state of the deployment to ensure you have the correct deployment name (nginx-deployment) and the current image version.

```sh
kubectl get deployment nginx-deployment
```

2.Perform Rolling Update

Use kubectl set image to update the deployment with the new nginx:1.17 image. Kubernetes will handle the rolling update automatically.

```sh
kubectl set image deployment/nginx-deployment nginx=nginx:1.17
```

This command tells Kubernetes to update the nginx-deployment deployment, specifically changing the image for the container named nginx to nginx:1.17.

3.Monitor the Update

Monitor the progress of the rolling update using kubectl get pods or kubectl rollout status deployment/nginx-deployment.

```sh
kubectl get pods -w  # Watch the status of pods
kubectl rollout status deployment/nginx-deployment  # Check rollout status
```

4.Verify the Deployment

After the update completes, verify that all pods are running the nginx:1.17 image and that the deployment is stable.

```sh
kubectl get deployment nginx-deployment
kubectl get pods -l app=nginx
```