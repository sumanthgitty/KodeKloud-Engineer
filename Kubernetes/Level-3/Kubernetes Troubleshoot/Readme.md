## Question
One of the Nautilus DevOps team members was working on to update an existing Kubernetes template. Somehow, he made some mistakes in the template and it is failing while applying. We need to fix this as soon as possible, so take a look into it and make sure you are able to apply it without any issues. Also, do not remove any component from the template like pods/deployments/volumes etc.

/home/thor/mysql_deployment.yml is the template that needs to be fixed.

## Solution

#### Issues Identified & Fixes Applied
---
1. **Incorrect API Version for PersistentVolume (PV)**
   - **Issue:** The `PersistentVolume` was using an incorrect API version like `apps/v1`.  
   - **Fix:** Changed it to `apiVersion: v1` since PV belongs to the core API group.

2. **Incorrect Storage Unit in PersistentVolumeClaim (PVC)**
   - **Issue:** The PVC used `storage: 250MB`, but Kubernetes requires `Mi` (Mebibytes).  
   - **Fix:** Changed `250MB` to `250Mi`.

3. **Mismatch in `matchLabels` Key**
   - **Issue:** The `selector.matchLabels` field in the Deployment spec was incorrectly written as `matchLables`.  
   - **Fix:** Corrected it to `matchLabels` to ensure proper pod selection.

4. **Mismatch Between Labels in Deployment and Pod Template**
   - **Issue:** The labels in the `metadata.labels` section of the Deployment did not match those in the Pod template.  
   - **Fix:** Ensured that the labels in `selector.matchLabels` and `template.metadata.labels` are consistent.

5. **Other Formatting and Syntax Fixes**
   - Fixed **indentation issues, incorrect field names, and syntax mismatches** that caused the YAML to fail validation.

#### How to Apply the Fixed YAML

Run the following command to apply the corrected template:
```sh
kubectl apply -f /home/thor/mysql_deployment.yml
```
