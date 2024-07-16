### Question
The Nautilus DevOps team is establishing a ReplicationController to deploy multiple pods for hosting applications that require a highly available infrastructure. Follow the specifications below to create the ReplicationController:

Create a ReplicationController using the nginx image, preferably with latest tag, and name it nginx-replicationcontroller.

Assign labels app as nginx_app, and type as front-end. Ensure the container is named nginx-container and set the replica count to 3.

All pods should be running state post-deployment.

### Solution

### Steps

1.Create YAML File: Save the following YAML content into a file named nginx-replicationcontroller.yaml.

```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-replicationcontroller
spec:
  replicas: 3
  selector:
    app: nginx_app
    type: front-end
  template:
    metadata:
      name: myapp
      labels:
        app: nginx_app
        type: front-end
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest

```

2.Apply the Configuration: Use kubectl to apply the configuration to your Kubernetes cluster.

```bash
kubectl apply -f nginx-replicationcontroller.yaml
```

3.Verify Deployment: Check the status of the ReplicationController and the pods it manages.

```bash
kubectl get replicationcontroller nginx-replicationcontroller
kubectl get pods -l app=nginx_app
```