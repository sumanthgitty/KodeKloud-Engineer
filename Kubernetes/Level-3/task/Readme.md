## Question
---
There are some applications that need to be deployed on Kubernetes cluster and these apps have some pre-requisites where some configurations need to be changed before deploying the app container. Some of these changes cannot be made inside the images so the DevOps team has come up with a solution to use init containers to perform these tasks during deployment. Below is a sample scenario that the team is going to test first.

1) Create a Deployment named as ic-deploy-xfusion.

2) Configure spec as replicas should be 1, labels app should be ic-xfusion, template's metadata lables app should be the same ic-xfusion.

- The initContainers should be named as ic-msg-xfusion, use image fedora, preferably with latest tag and use command '/bin/bash', '-c' and 'echo Init Done - Welcome to xFusionCorp Industries > /ic/blog'. The volume mount should be named as ic-volume-xfusion and mount path should be /ic.

- Main container should be named as ic-main-xfusion, use image fedora, preferably with latest tag and use command '/bin/bash', '-c' and 'while true; do cat /ic/blog; sleep 5; done'. The volume mount should be named as ic-volume-xfusion and mount path should be /ic.

3) Volume to be named as ic-volume-xfusion and it should be an emptyDir type.

## Solution
---
#### 1. Create the Deployment YAML File

- [deployment.yaml](./deployment.yaml)

#### 2. Apply the Deployment to Kubernetes
Run the following command to deploy it:

```bash
kubectl apply -f deployment.yaml
```

#### 3. Verify the Deployment
Check the status of the pod:

```bash
kubectl get pods
```
Look for a pod with the name starting with ic-deploy-xfusion.

#### 4. Check Logs to Verify InitContainer Execution
Check the init container logs:

```bash
kubectl logs <pod-name> -c ic-msg-xfusion
```
Expected output:

```sh
Init Done - Welcome to xFusionCorp Industries
```

Check the main container logs:

```bash
kubectl logs <pod-name> -c ic-main-xfusion
```
Expected output (repeats every 5 seconds):

```sh
Init Done - Welcome to xFusionCorp Industries
```