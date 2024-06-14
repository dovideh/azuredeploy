terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

resource "random_id" "prefix" {
  byte_length = 8
}

resource "azurerm_resource_group" "az-rg-lbl" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "az-aks-net01" {
  address_space       = ["10.52.0.0/16"]
  location            = azurerm_resource_group.az-rg-lbl.location
  name                = "${random_id.prefix.hex}-vn"
  resource_group_name = azurerm_resource_group.az-rg-lbl.name
}

resource "azurerm_subnet" "test" {
  address_prefixes                               = ["10.52.0.0/24"]
  name                                           = "${random_id.prefix.hex}-sn"
  resource_group_name                            = azurerm_resource_group.az-rg-lbl.name
  virtual_network_name                           = azurerm_virtual_network.az-aks-net01.name
  enforce_private_link_endpoint_network_policies = true
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

/*
module "vm" {
  source = "./modules/vm"
  # Add the required variables for the VM module
}
*/
