terraform {
  backend "azurerm" {}
}

module "eventhub" {
       source = "./modules/eventhub"
       # Pass any required variables to the eventhub module
     }
