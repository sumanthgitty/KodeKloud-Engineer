## Question 
There are a number of parameters that are used by the applications. We need to define these as environment variables, so that we can use them as needed within different configs. Below is a scenario which needs to be configured on Kubernetes cluster. Please find below more details about the same.

Create a pod named envars.

Container name should be fieldref-container, use image busybox preferable latest tag, use command 'sh', '-c' and args should be

'while true; do
      echo -en '/n';
                                  printenv NODE_NAME POD_NAME;
                                  printenv POD_IP POD_SERVICE_ACCOUNT;
              sleep 10;
         done;'

(Note: please take care of indentations)

Define Four environment variables as mentioned below:
a.) The first env should be named as NODE_NAME, set valueFrom fieldref and fieldPath should be spec.nodeName.

b.) The second env should be named as POD_NAME, set valueFrom fieldref and fieldPath should be metadata.name.

c.) The third env should be named as POD_IP, set valueFrom fieldref and fieldPath should be status.podIP.

d.) The fourth env should be named as POD_SERVICE_ACCOUNT, set valueFrom fieldref and fieldPath shoulbe be spec.serviceAccountName.

Set restart policy to Never.

To check the output, exec into the pod and use printenv command.

## Solution
#### 1. Create the Pod YAML file
---
Save the following YAML as envars-pod.yaml:

- [envars-pod.yaml](./pod.yaml)

#### 2: Apply the YAML to create the pod
---
```sh
kubectl apply -f envars-pod.yaml
```
Verify the pod status
```sh
kubectl get pods
```

Make sure the pod is in the Running state.

#### 3. Exec into the pod to check the environment variables
---
```sh
kubectl exec -it envars -- sh
```
Inside the pod, check the environment variables
```sh
printenv NODE_NAME POD_NAME POD_IP POD_SERVICE_ACCOUNT
or 
printenv
```
