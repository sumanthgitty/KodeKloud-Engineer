## Question
Last week, the Nautilus DevOps team deployed a redis app on Kubernetes cluster, which was working fine so far. This morning one of the team members was making some changes in this existing setup, but he made some mistakes and the app went down. We need to fix this as soon as possible. Please take a look.

The deployment name is redis-deployment. The pods are not in running state

## Solution 

#### Issue Summary
The issue was caused by:

- Wrong image name used in the deployment.
- ConfigMap name mismatch in the Redis deployment configuration.

#### Steps to Fix
#### 1. Verify and Correct the Image Name
The Redis pod is not starting due to an incorrect image name.
Check the image name used in the deployment YAML file:
```bash
kubectl describe deployment redis-deployment
```

Ensure the image field under the containers section is correct:
```yaml
containers:
  - name: redis
    image: redis:latest  # Ensure this is the correct image version
```

If the image name is incorrect, update it to the correct version and apply the changes:
```bash
kubectl apply -f redis-deployment.yaml
```

#### 2. Check for ConfigMap Name Mismatch
The deployment may have been referencing an incorrect ConfigMap name.
List the available ConfigMaps:
```bash
kubectl get configmap
```

Compare the name of the ConfigMap with the one referenced in the redis-deployment.yaml file:
```yaml
volumes:
  - name: redis-config
    configMap:
      name: redis-config-map  # Ensure this matches the actual ConfigMap name
```

If the names don’t match, update the deployment YAML file to reference the correct ConfigMap name and apply the changes:
```bash
kubectl apply -f redis-deployment.yaml
```

#### 3. Check Pod Logs for Further Issues
If the pod is still not starting, check the logs for any further issues:
```bash
kubectl logs <redis-pod-name>
```

Look for any additional errors or misconfigurations that might be causing the pod to fail.

#### 4. Verify Pod Status and Redeploy
After making the necessary changes to the deployment YAML, check the status of the pods:
```bash
kubectl get pods
```

If the pods are still not running, you may need to delete the existing pods and redeploy:
```bash
kubectl delete pod <redis-pod-name>
kubectl apply -f redis-deployment.yaml
```

#### Note: Other Troubleshooting Steps
- Volume Issues: Verify the volume configuration and ensure persistence is correctly set up.
- Network Issues: Check if any network policies are preventing access to Redis.
- Redis Performance: If the pod is running but performance is slow, consider scaling the deployment or adjusting resources.

#### Verification
After applying the fixes, verify that Redis is working correctly by logging into the Redis pod and running a command:

```bash
kubectl exec -it <redis-pod-name> -- redis-cli ping
If Redis is running properly, you should receive a PONG response.