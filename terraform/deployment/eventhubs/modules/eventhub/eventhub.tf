module "eventhub" {
  source  = "avinor/event-hubs/azurerm"
  version = "3.0.2"

  name                = var.eventhub_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.eventhub_sku

  hubs                = var.eventhub_hubs
  diagnostics         = var.eventhub_diagnostics
}
