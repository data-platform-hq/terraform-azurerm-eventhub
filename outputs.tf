output "connection_string" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.primary_connection_string
  description = "Event Hub namespace connection string"
}

output "name" {
  value       = azurerm_eventhub_namespace.this.name
  description = "Event Hub namespace name"
}

output "namespace_primary_key" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.primary_key
  description = "Event Hub namespace shared access key"
}

output "namespace_key_name" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.name
  description = "Event Hub namespace shared access key name"
}

output "namespace_endpoint" {
  value       = "sb://${azurerm_eventhub_namespace.this.name}.servicebus.windows.net/"
  description = "Event Hub namespace endpoint"
}
