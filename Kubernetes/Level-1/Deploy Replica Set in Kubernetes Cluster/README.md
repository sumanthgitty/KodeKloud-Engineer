### Task
The Nautilus DevOps team is gearing up to deploy applications on a Kubernetes cluster for migration purposes. A team member has been tasked with creating a ReplicaSet outlined below:

Create a ReplicaSet using nginx image with latest tag (ensure to specify as nginx:latest) and name it nginx-replicaset.

Apply labels: app as nginx_app, type as front-end.

Name the container nginx-container. Ensure the replica count is 4.

### Solution

### Steps

1.Create the ReplicaSet YAML Configuration

Create a YAML file named nginx-replicaset.yaml with the following content:

```yaml

apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-replicaset
  labels:
    app: nginx_app
    type: front-end
spec:
  replicas: 4
  selector:
    matchLabels:
      app: nginx_app
  template:
    metadata:
      labels:
        app: nginx_app
        type: app
    spec:
      containers:
      - name: nginx-container
        image: nginx:latest
```

Save the above content in a file named nginx-replicaset.yaml.

2.Apply the YAML Configuration

Use the kubectl apply command to create the ReplicaSet:

```sh
kubectl apply -f nginx-replicaset.yaml
```

3.Verify the ReplicaSet and Pods

Verify that the ReplicaSet has been created and that the pods are running:

```sh
kubectl get replicasets
kubectl get pods -l app=nginx_app
```