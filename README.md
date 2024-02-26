Repo that will store PoC file for varius services
in order to deploy code to azure instances or AKS
using:
- Jenkins and buildah 
- Harness / Helm Charts for AKS deployment
- Ansible (possibly not needed)
- Terraform scripts for infrastrucutre initialization and undeployment
- Codefiles that will contain a simple basic app with the follwoing requriements.
   - src/script.sh
    - variable test=123 / change to test=234 in CI part
   - src/test.ini
    - DEBUG=ON / change to DEBUG=OFF in CI part
   - example text file replacement
   - Further tests:
    - compilation or other intractive behavior and see if these can be acted upon on the CI part
   - Refined improvements:
    - instead of a simple archive that has a few files have an app that code will compile on or script that starts, opens a port, listens for connection and accepts traffic, redirecting it to /dev/null ?
    - simulate a primary / secondary relationship using scripts and netcat maybe
- Application may use a base docker image file.
- ACR registry will contain the container image and act as registry based on what Jenkins will build.
- Jenkins will need to deploy the app on a VM, Helm will deploy on AKS cluster
- Container image: 
    - should have some stress test tool to test out io/network flow to evaluate and gather data in Azure Monitor 
- Azure Monitor should be set up such that it will collect custom data through AMA, 
- Log Analytics 
