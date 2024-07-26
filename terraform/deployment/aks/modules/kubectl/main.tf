terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      # Setting the provider version is a strongly recommended practice
        version = "~> 2.23.0"
    }
  }
  # Provider functions require Terraform 1.8 and later.
  required_version = ">= 1.8.0"
}

variable "config_path" {
     default = "kubectl-cfg"
   }
   

/*
data "terraform_remote_state" "aks" {
  backend = "azurerm" # Match your root module's backend
  config = {
    resource_group_name  = "AZ-Resource-GRP"
    storage_account_name = "terragruntstorageaccount"
    container_name       = "terraform-state"
    key                  = "aks/terraform.tfstate" # Path to your root state
  }
}
*/
provider "azurerm" {
  features {}
}
provider "kubernetes" {
#        username                = var.cluster_config.username
#        password                = var.cluster_config.password
        host                    = var.cluster_config.host
        client_certificate      = base64decode(var.cluster_config.client_certificate)
        client_key              = base64decode(var.cluster_config.client_key)
        cluster_ca_certificate  = base64decode(var.cluster_config.cluster_ca_certificate)
}

/*
provider "kubernetes" {
       host                   = data.terraform_remote_state.aks.outputs.cluster_config.host
       client_certificate     = base64decode(data.terraform_remote_state.aks.outputs.cluster_config.client_certificate)
       client_key             = base64decode(data.terraform_remote_state.aks.outputs.cluster_config.client_key)
       cluster_ca_certificate = base64decode(data.terraform_remote_state.aks.outputs.cluster_config.cluster_ca_certificate)
     }
*/
# Multi decode YAML, iterate over the object
/*
resource "kubernetes_manifest" "harness_delegate" {
  value = provider::kubernetes::manifest_decode_multi(file("manifest.yaml"))
  manifest = yamldecode(file("harness-delegate.yml"))
}

*/
resource "kubernetes_manifest" "clusterrolebinding" {
  manifest = yamldecode(file("${path.module}/${var.config_path}/clusterrolebinding.yaml"))
}

resource "kubernetes_manifest" "secret" {
  manifest = yamldecode(file("${path.module}/${var.config_path}/secret.yaml"))
}

resource "kubernetes_manifest" "serviceaccount" {
  manifest = yamldecode(file("${path.module}/${var.config_path}/serviceaccount.yaml"))
}
