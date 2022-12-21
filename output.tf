#output "connection_string" {
#  value       = azurerm_eventhub_authorization_rule.this[keys(var.eventhub_topic)[0]].primary_connection_string
#  description = "Azurerm eventhub authorization rule"
#}
# "db-history-topic"

output "connection_string" {
  value       = azurerm_eventhub_namespace.this.default_primary_connection_string
  description = "Azurerm eventhub namespace authorization rule"
  }

output "name" {
  value       = azurerm_eventhub_namespace.this.name
  description = "Azurerm eventhub namespace name"
}

output "access-primary-key" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.primary_key
  description = "Eventhub primary key"
}

output "access-key-name" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.name
  description = "Eventhub shared access key name"
}

output "access-endpoint" {
  value       = "sb://${azurerm_eventhub_namespace.this.name}.servicebus.windows.net/"
  description = "Eventhub shared access key name"
}
