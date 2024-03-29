provider "azurerm" {
  features {}
}

module "aks" {
  source                    = "./modules/terraform-azurerm-aks"
  resource_group_name       = var.resource_group_name
  kubernetes_cluster_name   = var.cluster_name
  kubernetes_version        = var.kubernetes_version
  agents_count              = var.node_count
  agents_max_count          = var.agents_max_count
  agents_min_count          = var.agents_min_count
  agents_size               = var.vm_size
  client_id                 = var.client_id
  client_secret             = var.client_secret
  # Add any other required variables from the module
}

module "vm" {
  source = "./modules/vm"
  # Add the required variables for the VM module
}
