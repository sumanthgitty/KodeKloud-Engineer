## Question
The Nautilus DevOps team is working to deploy some tools in Kubernetes cluster. Some of the tools are licence based so that licence information needs to be stored securely within Kubernetes cluster. Therefore, the team wants to utilize Kubernetes secrets to store those secrets. Below you can find more details about the requirements:

We already have a secret key file ecommerce.txt under /opt location on jump host. Create a generic secret named ecommerce, it should contain the password/license-number present in ecommerce.txt file.

Also create a pod named secret-nautilus.

Configure pod's spec as container name should be secret-container-nautilus, image should be debian preferably with latest tag (remember to mention the tag with image). Use sleep command for container so that it remains in running state. Consume the created secret and mount it under /opt/demo within the container.

To verify you can exec into the container secret-container-nautilus, to check the secret key under the mounted path /opt/demo. Before hitting the Check button please make sure pod/pods are in running state, also validation can take some time to complete so keep patience.

## Solution

#### 1. Create a Secret from the ecommerce.txt File
---
Log in to the jump host and verify that the ecommerce.txt file exists:

```sh
ls -l /opt/ecommerce.txt
cat /opt/ecommerce.txt  # (Optional) Check the content
```

#### 2. Create the secret using the file:
---
```sh
kubectl create secret generic ecommerce --from-file=password=/opt/ecommerce.txt
```

This creates a Kubernetes Secret named ecommerce.
The secret content is stored under the key password.

Verify the secret:

```sh
kubectl get secrets
kubectl describe secret ecommerce
```

#### 3. Create the Pod Definition (YAML)
---
Create a YAML file for the Pod:

- [pod.yaml](./pod.yaml)

#### 4. Deploy the Pod
---
Apply the pod configuration:
```sh
kubectl apply -f pod.yaml
```

Verify the Pod is running:
```sh
kubectl get pods
```

#### 5. Verify the Secret Inside the Pod
---
Exec into the container:
```sh
kubectl exec -it secret-nautilus -- /bin/bash
```

Check if the secret is mounted:
```sh
ls -l /opt/demo
cat /opt/demo/password  # View the secret contents
```