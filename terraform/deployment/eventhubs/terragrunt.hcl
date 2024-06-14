terraform {
  source = "."
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "AZ-Resource-GRP"
    storage_account_name = "terragruntstorageaccount"
    container_name       = "terraform-state"
    key                  = "eventhubs/terraform.tfstate"
  }
}

inputs = {
  # other input variables for the Event Hubs deployment
}
