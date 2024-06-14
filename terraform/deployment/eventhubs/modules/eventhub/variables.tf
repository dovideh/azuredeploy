variable "eventhub_name" {
  description = "Name of the Event Hub namespace"
  type        = string
}

variable "location" {
  description = "Location of the Event Hub namespace"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to deploy the Event Hub namespace"
  type        = string
}

variable "eventhub_sku" {
  description = "SKU of the Event Hub namespace"
  type        = string
  default     = "Standard"
}

variable "eventhub_hubs" {
  description = "List of event hubs to create within the namespace"
  type = list(object({
    name              = string
    partitions        = number
    message_retention = number
    consumers         = list(string)
    keys = list(object({
      name   = string
      listen = bool
      send   = bool
    }))
  }))
  default = []
}

variable "eventhub_diagnostics" {
  description = "Diagnostic settings for the Event Hub namespace"
  type = object({
    destination   = string
    eventhub_name = string
    logs          = list(string)
    metrics       = list(string)
  })
  default = null
}
