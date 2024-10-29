#### Task 
Some of the Nautilus team developers are developing a static website and they want to deploy it on Kubernetes cluster. They want it to be highly available and scalable. Therefore, based on the requirements, the DevOps team has decided to create a deployment for it with multiple replicas. Below you can find more details about it:

Create a deployment using nginx image with latest tag only and remember to mention the tag i.e nginx:latest. Name it as nginx-deployment. The container should be named as nginx-container, also make sure replica counts are 3.

Create a NodePort type service named nginx-service. The nodePort should be 30011.

#### Solution

## Step 1: Configuration Files

Make sure you have the following configuration files:

- [deployment.yml](./deployment.yml)  
- [service.yml](./service.yml)  

## Step 2: Create the Deployment

**Open your terminal** and navigate to the directory where your `deployment.yml` file is located.

**Apply the Deployment configuration** to your cluster:

   ```
   kubectl apply -f deployment.yml
   ```

## step 3: Verify that the Deployment is running:

    ```
    kubectl get deployments
    kubectl get pods
    ```

## step 4: Create the Service
Navigate to the directory where your service.yml file is located if you aren't already there.

Apply the Service configuration to your cluster:

    ```
    kubectl apply -f service.yml
    ```

Verify that the Service is running:

    ```
    kubectl get services
    ```

## step 5: Access the NGINX Server
Open a web browser or use curl to access the NGINX server using the node’s IP address and the NodePort (30011):

http://<node-ip>:30011        