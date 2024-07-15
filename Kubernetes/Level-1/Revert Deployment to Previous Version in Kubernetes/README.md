### Task
Earlier today, the Nautilus DevOps team deployed a new release for an application. However, a customer has reported a bug related to this recent release. Consequently, the team aims to revert to the previous version.

There exists a deployment named nginx-deployment; initiate a rollback to the previous revision.

Note: The kubectl utility on jump_host is configured to interact with the Kubernetes cluster.

### Solution

### steps

1.Check the current deployment status and history:

```sh
kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment
```

2.Initiate the rollback:

```sh
kubectl rollout undo deployment/nginx-deployment
```

3.Verify the rollback:

```sh
kubectl rollout status deployment/nginx-deployment
kubectl get pods -l app=nginx
```

4.Check the revision history again:

```sh
kubectl rollout history deployment/nginx-deployment
```