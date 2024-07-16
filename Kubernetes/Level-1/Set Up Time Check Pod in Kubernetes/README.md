### Question
The Nautilus DevOps team needs a time check pod created in a specific Kubernetes namespace for logging purposes. Initially, it's for testing, but it may be integrated into an existing cluster later. Here's what's required:

Create a pod called time-check in the devops namespace. The pod should contain a container named time-check, utilizing the busybox image with the latest tag (specify as busybox:latest).

Create a config map named time-config with the data TIME_FREQ=7 in the same namespace.

Configure the time-check container to execute the command: while true; do date; sleep $TIME_FREQ;done. Ensure the result is written /opt/devops/time/time-check.log. Also, add an environmental variable TIME_FREQ in the container, fetching its value from the config map TIME_FREQ key.

Create a volume log-volume and mount it at /opt/devops/time within the container.

### Solution

### Steps

1.Create the Namespace

Ensure the devops namespace exists. If it doesn't, create it:

```sh
kubectl create namespace devops
```

2.Create the ConfigMap

Create a ConfigMap named time-config in the devops namespace with the data TIME_FREQ=7.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: time-config
  namespace: devops
data:
  TIME_FREQ: "7"
```

Save this as time-config.yaml and apply it:

```sh
kubectl apply -f time-config.yaml
```

3.Create the Pod

Create a YAML file for the time-check pod with the specified configurations:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: time-check
  namespace: devops
spec:
  containers:
  - name: time-check
    image: busybox:latest
    command: 
    - /bin/sh
    - -c 
    - while true; do date; sleep $TIME_FREQ; done >> /opt/devops/time/time-check.log
    env:
    - name: TIME_FREQ
      valueFrom:
        configMapKeyRef:
          name: time-config
          key: TIME_FREQ
    volumeMounts:
    - name: log-volume
      mountPath: /opt/devops/time
  volumes:
  - name: log-volume
    emptyDir: {}
```

Save this as time-check-pod.yaml and apply it:

```sh
kubectl apply -f time-check-pod.yaml
```

4.Verify the Pod and ConfigMap

Check if the pod and config map have been created correctly:

```sh
kubectl get pod time-check -n devops
kubectl get configmap time-config -n devops
```