#### Question
The Nautilus DevOps teams is planning to set up a Grafana tool to collect and analyze analytics from some applications. They are planning to deploy it on Kubernetes cluster. Below you can find more details.

1.) Create a deployment named grafana-deployment-xfusion using any grafana image for Grafana app. Set other parameters as per your choice.

2.) Create NodePort type service with nodePort 32000 to expose the app.

#### Solution
## Step 1: Create the Grafana Deployment
Open a terminal on the jump host.

Create a deployment YAML file, grafana-deployment.yaml, with the following content:

- [deployment.yml](./deployment.yml)

Apply the deployment:
```bash
kubectl apply -f grafana-deployment.yaml
```

## Step 2: Create the NodePort Service
Create a service YAML file, grafana-service.yaml, with the following content:

- [service.yml](./service.yml)

Apply the service configuration:
```bash
kubectl apply -f grafana-service.yaml
```

## Step 3: Verify the Setup
Check if the deployment is running:
```bash
kubectl get deployments
```

You should see grafana-deployment-xfusion with READY status.

Confirm the service is exposed on NodePort 32000:
```bash
kubectl get svc grafana-service
```
Access the Grafana login page by going to http://<Node_IP>:32000 in a web browser. Replace <Node_IP> with the IP of any node in the cluster.