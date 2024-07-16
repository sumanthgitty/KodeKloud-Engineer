### Question
The Nautilus DevOps team is crafting jobs in the Kubernetes cluster. While they're developing actual scripts/commands, they're currently setting up templates and testing jobs with dummy commands. Please create a job template as per details given below:

Create a job named countdown-xfusion.

The spec template should be named countdown-xfusion (under metadata), and the container should be named container-countdown-xfusion

Utilize image fedora with latest tag (ensure to specify as fedora:latest), and set the restart policy to Never.

Execute the command sleep 5

### Solution

### Steps

1.Create a YAML Manifest for the Job

Create a YAML file (e.g countdown-xfusion-job.yaml) with the following content:

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: countdown-xfusion
spec:
  template:
    metadata:
      name: countdown-xfusion
    spec:
      containers:
      - name: container-countdown-xfusion
        image: fedora:latest
        command:
        - /bin/sh
        - -c
        - sleep 5
      restartPolicy: Never
```

2.Apply the YAML Manifest

Use kubectl apply to create the job in your Kubernetes cluster.

```sh
kubectl apply -f countdown-xfusion-job.yaml
```

3.Verify the Job

After applying the YAML file, verify that the job has been created.

```sh
kubectl get jobs countdown-xfusion
```