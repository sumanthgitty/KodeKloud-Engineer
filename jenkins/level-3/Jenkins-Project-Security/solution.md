# Granting Permissions to Developers on Jenkins

## Overview
This documentation provides a step-by-step guide on how to grant specific permissions to users `sam` and `rohan` for the Jenkins job named `Packages`.

## Steps

1. **Access Jenkins UI:**
   - Open the Jenkins UI by clicking the Jenkins button on the top bar.
   - Login with the following credentials:
     - **Username:** admin
     - **Password:** Adm!n321

2. **Install Necessary Plugins:**
   - Go to `Manage Jenkins` > `Manage Plugins`.
   - Click on the `Available` tab and search for:
     - `Role-based Authorization Strategy`
     - `Matrix Authorization Strategy`
   - Select and install these plugins.

3. **Configure Global Security:**
   - Navigate to `Manage Jenkins` > `Configure Global Security`.
   - Under `Authorization`, select `Matrix-based security`.
   - Add users `sam` and `rohan` with the appropriate permissionsa as mentioned in task question.

4. **Navigate to the Jenkins Job:**
   - Find and open the `Packages` job from the Jenkins dashboard.

5. **Configure Job Permissions:**
   - Click on `Configure` on the left side menu.
   - Scroll to the `Authorization` section.

6. **Set Inheritance Strategy:**
   - Select `Inherit permissions from parent ACL`.

7. **Grant Permissions to Users:**

   - **User `sam`:**
     - Add user `sam`.
     - Grant permissions: `Build`, `Configure`, `Read`.

   - **User `rohan`:**
     - Add user `rohan`.
     - Grant permissions: `Build`, `Cancel`, `Configure`, `Read`, `Update`, `Tag`.

8. **Save the Configuration:**
   - Click `Save` to apply changes.

## Additional Notes
- Ensure users are created in Jenkins with respective passwords.
- To create users, navigate to `Manage Jenkins` > `Manage Users` > `Create User`.

