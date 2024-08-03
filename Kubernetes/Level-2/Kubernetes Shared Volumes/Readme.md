#### Question
We are working on an application that will be deployed on multiple containers within a pod on Kubernetes cluster. There is a requirement to share a volume among the containers to save some temporary data. The Nautilus DevOps team is developing a similar template to replicate the scenario. Below you can find more details about it.

Create a pod named volume-share-nautilus.

For the first container, use image ubuntu with latest tag only and remember to mention the tag i.e ubuntu:latest, container should be named as volume-container-nautilus-1, and run a sleep command for it so that it remains in running state. Volume volume-share should be mounted at path /tmp/official.

For the second container, use image ubuntu with the latest tag only and remember to mention the tag i.e ubuntu:latest, container should be named as volume-container-nautilus-2, and again run a sleep command for it so that it remains in running state. Volume volume-share should be mounted at path /tmp/apps.

Volume name should be volume-share of type emptyDir.

After creating the pod, exec into the first container i.e volume-container-nautilus-1, and just for testing create a file official.txt with any content under the mounted path of first container i.e /tmp/official.

The file official.txt should be present under the mounted path /tmp/apps on the second container volume-container-nautilus-2 as well, since they are using a shared volume.

#### Solution

1.Create the Pod with Shared Volume:

Create a YAML file (volume-share-nautilus.yaml) with the following content to define the pod with two containers and a shared volume:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: volume-share-nautilus
spec:
  containers:
  - name: volume-container-nautilus-1
    image: ubuntu:latest
    command: ["sleep", "3600"]
    volumeMounts:
    - name: volume-share
      mountPath: /tmp/official
  - name: volume-container-nautilus-2
    image: ubuntu:latest
    command: ["sleep", "3600"]
    volumeMounts:
    - name: volume-share
      mountPath: /tmp/apps
  volumes:
  - name: volume-share
    emptyDir: {}
```

Apply the configuration to create the pod:
```bash
kubectl apply -f volume-share-nautilus.yaml
```

2.Test the Shared Volume:

Exec into the first container and create a file in the shared volume:

```bash
kubectl exec -it volume-share-nautilus -c volume-container-nautilus-1 -- /bin/bash
echo "Test content" > /tmp/official/official.txt
exit
```

3.Verify that the file is available in the second container:

```bash
kubectl exec -it volume-share-nautilus -c volume-container-nautilus-2 -- /bin/bash
cat /tmp/apps/official.txt
```
