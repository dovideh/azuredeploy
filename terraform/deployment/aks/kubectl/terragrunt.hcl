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
  client_certificate     = base64decode(dependency.aks-cluster.outputs.client_certificate)
  client_key             = base64decode(dependency.aks-cluster.outputs.client_key)
  cluster_ca_certificate = base64decode(dependency.aks-cluster.outputs.cluster_ca_certificate)
}

inputs = {
      cluster_config = {
        host                   = local.aks_host
        client_key             = local.aks_client_key
        cluster_ca_certificate = local.aks_cluster_ca_certificate
      }
}

dependency "akscluster" {
  config_path = "../"
}
