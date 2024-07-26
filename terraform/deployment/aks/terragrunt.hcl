terraform {
  source = "."
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "AZ-Resource-GRP"
    storage_account_name = "terragruntstorageaccount"
    container_name       = "terraform-state"
    key                  = "aks/terraform.tfstate"
  }
    generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

inputs = {
  # other input variables for the AKS deployment
}
