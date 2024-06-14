eventhub_name         = "my-eventhub"
location              = "westeurope"
resource_group_name   = "my-resource-group"
eventhub_sku          = "Standard"

eventhub_hubs = [
  {
    name              = "hub1"
    partitions        = 8
    message_retention = 1
    consumers         = ["app1", "app2"]
    keys = [
      {
        name   = "app1"
        listen = true
        send   = false
      },
      {
        name   = "app2"
        listen = true
        send   = true
      }
    ]
  }
]

eventhub_diagnostics = {
  destination   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-resource-group/providers/Microsoft.OperationalInsights/workspaces/my-log-analytics"
  eventhub_name = null
  logs          = ["ArchiveLogs", "OperationalLogs", "AutoScaleLogs", "KafkaCoordinatorLogs", "KafkaUserErrorLogs", "EventHubVNetConnectionEvent"]
  metrics       = ["AllMetrics"]
}
