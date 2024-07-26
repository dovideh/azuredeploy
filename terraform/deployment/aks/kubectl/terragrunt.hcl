terraform {
  source = "../modules/kubectl"
}

include {
  path = find_in_parent_folders()
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "AZ-Resource-GRP"
    storage_account_name = "terragruntstorageaccount"
    container_name       = "terraform-state"
    key                  = "kubectl/terraform.tfstate"
  }
    generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


dependency "akscluster" {
  config_path = "../"
  mock_outputs = {
     host                   = "dummy-host"
     username               = "dummy-username"
     password               = "dummy-password"
     client_certificate     = "dGVzdAo="
     client_key             = "dGVzdAo="
     cluster_ca_certificate = "dGVzdAo="
     }
     mock_outputs_allowed_terraform_commands = ["plan", "validate"]
}
inputs = {
     cluster_config = {
       host                   = dependency.akscluster.outputs.host
       client_certificate     = dependency.akscluster.outputs.client_certificate
       client_key             = dependency.akscluster.outputs.client_key
       cluster_ca_certificate = dependency.akscluster.outputs.cluster_ca_certificate
     }
   }
