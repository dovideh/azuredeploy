Repo that will store PoC file for varius services
in order to deploy code to azure instances or AKS
using:
- Jenkins and buildah 
- Harness / Helm Charts for AKS deployment
- Ansible (possibly not needed)
- Terraform scripts for infrastrucutre initialization and undeployment
- Codefiles that will contain a simple basic app with the follwoing requriements.
   - src/primary/primary.py starts a primary instance
   - src/primary/config.ini set-up the primary instance for variables (the variables would change later on)
   - src/primary/secondary.py start a secondary listener service
   - Dockerfiles added to create the containers
    - a primary and secondary image will exist, ports would need to be exposed and networking would need to be enabled 
    - hostnames for each would be primary_image and secondary_image
    - a solution would be docker compose but in an AKS environment that might change as the intent is to keep a primary and secondary separate
   - we would need to change the variables of either ini files or create say configuration files later on
   - Further tests:
    - compilation or other intractive behavior and see if these can be acted upon on the CI part
   - Refined improvements:
    - instead of a simple archive that has a few files have an app that code will compile on or script that starts, opens a port, listens for connection and accepts traffic, redirecting it to /dev/null ?
- Application may use a base docker image file.
- ACR registry will contain the container image and act as registry based on what Jenkins will build.
- Jenkins will need to deploy the app on a VM, Helm will deploy on AKS cluster
- Container image: 
    - should have some stress test tool to test out io/network flow to evaluate and gather data in Azure Monitor 
- Azure Monitor should be set up such that it will collect custom data through AMA, 
- Log Analytics 
