provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az-rg-lbl" {
  name     = var.resource_group_name
  location = var.location
}

module "aks" {
  source  = "github.com/Azure/terraform-azurerm-aks"

  resource_group_name = azurerm_resource_group.az-rg-lbl.name
  location            = azurerm_resource_group.az-rg-lbl.location
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  cluster_log_analytics_workspace_name = var.cluster_log_analytics_workspace_name
  prefix          = var.dns_prefix
  rbac_aad = false
  
  node_pools = {
    node_pool_a = {
      name                = var.default_node_pool_name
      node_count          = var.node_count
      vm_size             = var.vm_size
    }
  }

  admin_username = var.admin_username
  public_ssh_key = file(var.ssh_public_key)

  tags = var.tags

  depends_on = [azurerm_resource_group.az-rg-lbl]
}

module "vm" {
  source = "./modules/vm"
  # Add the required variables for the VM module
}
