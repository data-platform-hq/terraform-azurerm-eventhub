output "connection_string" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.primary_connection_string
  description = "Azurerm eventhub namespace connection string"
}

output "name" {
  value       = azurerm_eventhub_namespace.this.name
  description = "Azurerm eventhub namespace name"
}

output "namespace-primary-key" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.primary_key
  description = "Eventhub namespace primary key"
}

output "namespace-key-name" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.name
  description = "Eventhub namespace key name"
}

output "namespace-endpoint" {
  value       = "sb://${azurerm_eventhub_namespace.this.name}.servicebus.windows.net/"
  description = "Eventhub namespace endpoint"
}
