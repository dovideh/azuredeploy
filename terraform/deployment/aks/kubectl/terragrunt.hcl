include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "../modules//kubectl/"
}

# Kubernetes provider configuration
provider "kubernetes" {
  host                   = dependency.aksclauster.outputs.host
  username               = dependency.akscluster.outputs.username
  password               = dependency.akscluster.outputs.password
  client_certificate     = base64decode(dependency.akscluster.outputs.client_certificate)
  client_key             = base64decode(dependency.akscluster.outputs.client_key)
  cluster_ca_certificate = base64decode(dependency.akscluster.outputs.cluster_ca_certificate)
}

inputs = {
     cluster_config = {
       host                   = dependency.akscluster.outputs.host
       client_key             = dependency.akscluster.outputs.client_key
       cluster_ca_certificate = dependency.akscluster.outputs.cluster_ca_certificate
     }
   }
   
dependency "akscluster" {
  config_path = "../"
}
