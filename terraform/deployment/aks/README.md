# Terraform/Terragrunt Infrastructure Deployment

## Overall Directory Layout

- **kubectl/**
  - `terragrunt.hcl` – Terragrunt configuration for Kubernetes-related deployments
- **main.tf** – Entry point of the Terraform configuration, often contains provider configuration
- **modules/** – Directory containing Terraform modules
  - **kubectl/** – Module for Kubernetes configurations
    - `harness-delegate-nsconf.yaml` – Namespace configuration for Harness Delegate
    - `harness-delegate.yml` – YAML file for deploying Harness Delegate
    - **kubectl-cfg/** – Kubernetes RBAC configuration
      - `clusterrolebinding.yaml` – ClusterRoleBinding definition
      - `secret.yaml` – Secret definition for authentication
      - `serviceaccount.yaml` – ServiceAccount definition
    - `main.tf` – Main Terraform file for Kubernetes configuration
    - `namespaces.yaml` – YAML file defining Kubernetes namespaces
    - `variables.tf` – Variables for the Kubernetes module
  - **terraforn-azurerm-aks/** – Module for Azure Kubernetes Service (AKS) deployment
    - `main.tf` – Main Terraform file for AKS setup
  - **vm/** – Module for Virtual Machines (VMs)
    - `vm.tf` – Terraform file for VM provisioning
- **outputs.tf** – Defines outputs from your Terraform configuration
- **README.md** – Project documentation for maintainers and users
- **terraform.tfstate** – Terraform state file (not to be committed to version control)
- **terraform.tfstate.backup** – Backup of the Terraform state file
- **terraform.tfvars** – Contains values for the defined variables
- **terragrunt.hcl** – Configuration file for Terragrunt
- **variables.tf** – Defines variables used across the project
- **versions.tf** – Specifies Terraform version and provider requirements

```
## File and Directory Roles

### Root-Level Files

- **main.tf**: The primary Terraform configuration file, which typically defines provider configurations and invokes modules.
- **variables.tf**: Defines input variables to be used across Terraform configurations.
- **outputs.tf**: Defines output values, which allow you to retrieve information about provisioned resources.
- **terraform.tfvars**: Specifies actual values for declared variables. Sensitive values should not be committed to version control.
- **terraform.tfstate / terraform.tfstate.backup**: Terraform state files used to track infrastructure changes. These should be managed remotely (e.g., in an S3 bucket or Azure Storage).
- **terragrunt.hcl**: Configuration file for Terragrunt, which simplifies Terraform module management.
- **versions.tf**: Defines Terraform and provider version constraints to ensure compatibility.
- **README.md**: Documentation for setting up and managing the project.

### Modules Directory

The `modules/` directory contains reusable Terraform configurations for different infrastructure components.

- **kubectl/**: Manages Kubernetes-related resources, including namespace configurations, service accounts, and Harness Delegate setup.
- **terraforn-azurerm-aks/**: Handles the deployment of Azure Kubernetes Service (AKS).
- **vm/**: Contains Terraform configuration for provisioning Virtual Machines.

## Usage Instructions

1. **Ensure Terraform and Terragrunt are installed**  
   - Install Terraform: [Terraform Download](https://www.terraform.io/downloads)
   - Install Terragrunt: [Terragrunt Installation](https://terragrunt.gruntwork.io/docs/getting-started/install/)

2. **Initialize Terraform/Terragrunt**  
   ```sh
   terraform init
   # OR for Terragrunt
   terragrunt init


