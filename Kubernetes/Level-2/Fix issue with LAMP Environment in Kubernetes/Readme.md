## Question
One of the DevOps team member was trying to install a WordPress website on a LAMP stack which is essentially deployed on Kubernetes cluster. It was working well and we could see the installation page a few hours ago. However something is messed up with the stack now due to a website went down. Please look into the issue and fix it:

FYI, deployment name is lamp-wp and its using a service named lamp-service. The Apache is using http default port and nodeport is 30008. From the application logs it has been identified that application is facing some issues while connecting to the database in addition to other issues. Additionally, there are some environment variables associated with the pods like MYSQL_ROOT_PASSWORD, MYSQL_DATABASE,  MYSQL_USER, MYSQL_PASSWORD, MYSQL_HOST.

Also do not try to delete/modify any other existing components like deployment name, service name, types, labels etc.

## How LAMP Stack Works
The LAMP stack is a standard open-source platform for dynamic web applications:

#### Linux: The operating system that hosts the stack.
#### Apache: The web server that handles client requests.
#### MySQL: The database for storing application data.
#### PHP: The server-side language that generates dynamic content.

When a client requests a webpage, Apache uses PHP to process the request, which may involve retrieving data from MySQL, and serves the content back to the client.

### For reference, you can view the correct configuration file here: [lamp-stack.yml](./Deploy-lamp-stack.yml)

## Solution
### Basic Troubleshooting Steps for LAMP

#### Step 1: Verify Kubernetes Resources
Check Deployments, Services, Secrets, and Pods

Run:

```bash
kubectl get deployment,svc,secrets,pods
```

#### step 2: Describe and Edit Service Ports
Verify that the servicePort, nodePort, and containerPort are set correctly to route traffic to the application. Use kubectl describe to check the configurations, and if needed, use kubectl edit to make adjustments:

```bash
kubectl describe svc lamp-service
```

If adjustments are needed for the ports, run:

```bash
kubectl edit svc/lamp-service
```

Verify the update:

```bash
kubectl get svc
```

```bash 
Example output:
NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
kubernetes      ClusterIP   10.96.0.1      <none>        443/TCP        18m
lamp-service    NodePort    10.96.8.151    <none>        80:30008/TCP   3m45s
mysql-service   ClusterIP   10.96.30.153   <none>        3306/TCP       3m46s
```

#### step 3: Check Pod Logs
View logs for specific pods or containers to diagnose issues:

```bash
kubectl logs <pod-name> -c <container-name>
```

Resource Access
If accessing the app fails, confirm that the nodePort is accessible or port-forwarding is set up correctly.

#### Step 4: Verify and Correct Configuration
Correct PHP File (index.php)
Access the pod, navigate to /app, and edit index.php if required:

```bash
kubectl exec -it <pod-name> -c <container-name> -- sh
cd /app
vi index.php        #correct if any mistakes 
service php-fpm restart 
service php-fpm status
exit
```

#### Step 5: Confirm Access to Application
Access via NodePort: Use a browser to navigate to http://<node-ip>:<nodePort>.

we should see the message: Connected successfully

#### Task Completion Steps
Checked Kubernetes resources using kubectl get deployment,svc,secrets,pods.
Verified service port configurations with kubectl describe svc lamp-service and corrected as necessary using kubectl edit.
Updated index.php in the container and restarted PHP-FPM to apply changes.
Accessed the application to confirm proper functionality.