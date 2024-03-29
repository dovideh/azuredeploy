provider "azurerm" {
  features {}
  version = "~> 2.0"
}

module "aks" {
  source  = "github.com/Azure/terraform-azurerm-aks?ref=main"
  version = "1.0.0" # Use the appropriate version

  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.node_count
    vm_size             = var.vm_size
  }

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = var.tags
}

