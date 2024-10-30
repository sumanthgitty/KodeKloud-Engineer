## Question
The Nautilus DevOps team is working on to setup some pre-requisites for an application that will send the greetings to different users. There is a sample deployment, that needs to be tested. Below is a scenario which needs to be configured on Kubernetes cluster. Please find below more details about it.

Create a pod named print-envars-greeting.
Configure spec as, the container name should be print-env-container and use bash image.

Create three environment variables:

a. GREETING and its value should be Welcome to

b. COMPANY and its value should be DevOps

c. GROUP and its value should be Industries

Use command ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"'] (please use this exact command), also set its restartPolicy policy to Never to avoid crash loop back.

You can check the output using kubectl logs -f print-envars-greeting command.

## Solution

#### 1. Create the Pod Manifest
Create a YAML file named pod.yaml with the following contents:

- [pod.yaml](./pod.yaml)

#### 2. Apply the Pod Manifest
Run the following command to create the Pod in your Kubernetes cluster:

```sh
kubectl apply -f pod.yaml
```

#### 3. Verify the Pod Creation
Ensure the Pod is running using:

```sh
kubectl get pods
```

#### 4. Check the Pod Logs
View the output of the Pod using:

```sh
kubectl logs -f print-envars-greeting
```

__Expected Output__
```sh
Welcome to DevOps Industries
```