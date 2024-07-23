include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "../modules//kubectl/"
}

dependency "akscluster" {
  config_path = "../"
  mock_outputs = {
     host                   = "dummy-host"
     username               = "dummy-username"
     password               = "dummy-password"
     client_certificate     = "dummy-cert"
     client_key             = "dummy-key"
     cluster_ca_certificate = "dummy-ca-cert"
     }
     mock_outputs_allowed_terraform_commands = ["plan", "validate"]
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "kubernetes" {
  host                   = "${dependency.akscluster.outputs.host}"
  username               = "${dependency.akscluster.outputs.username}"
  password               = "${dependency.akscluster.outputs.password}"
  client_certificate     = base64decode("${dependency.akscluster.outputs.client_certificate}")
  client_key             = base64decode("${dependency.akscluster.outputs.client_key}")
  cluster_ca_certificate = base64decode("${dependency.akscluster.outputs.cluster_ca_certificate}")
}
EOF
}

inputs = {
     cluster_config = {
       host                   = dependency.akscluster.outputs.host
       client_key             = dependency.akscluster.outputs.client_key
       cluster_ca_certificate = dependency.akscluster.outputs.cluster_ca_certificate
     }
   }
   
