#### Question
The Nautilus DevOps team is working on a Kubernetes template to deploy a web application on the cluster. There are some requirements to create/use persistent volumes to store the application code, and the template needs to be designed accordingly. Please find more details below:

Create a PersistentVolume named as pv-datacenter. Configure the spec as storage class should be manual, set capacity to 3Gi, set access mode to ReadWriteOnce, volume type should be hostPath and set path to /mnt/sysops (this directory is already created, you might not be able to access it directly, so you need not to worry about it).

Create a PersistentVolumeClaim named as pvc-datacenter. Configure the spec as storage class should be manual, request 1Gi of the storage, set access mode to ReadWriteOnce.

Create a pod named as pod-datacenter, mount the persistent volume you created with claim name pvc-datacenter at document root of the web server, the container within the pod should be named as container-datacenter using image httpd with latest tag only (remember to mention the tag i.e httpd:latest).

Create a node port type service named web-datacenter using node port 30008 to expose the web server running within the pod.

#### Solution 

1. PersistentVolume (PV)
---
- [persistentvolume.yaml](pv.yaml)

2. PersistentVolumeClaim (PVC)
---
- [persistentvolumeclaim.yaml](pvc.yaml)

3. Pod with Volume Mount
---
- [pod.yaml](pod.yaml)

4. NodePort Service
---
- [svc.yaml](./svc.yaml)

5. Steps to Apply the Configurations
---
Apply the PV, PVC, Pod, Service

```sh
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f pod.yaml
kubectl apply -f service.yaml
```

6. Verify Resources
---
```sh
kubectl get pv
kubectl get pvc
kubectl get pods
kubectl get svc
```

**Accesss the website.**