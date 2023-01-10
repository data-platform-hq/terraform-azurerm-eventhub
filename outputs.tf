output "namespace_connection_string" {
  value       = azurerm_eventhub_namespace_authorization_rule.this.primary_connection_string
  description = "Event Hub namespace connection string"
}

output "namespace_name" {
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

output "topic" {
  value = length(var.eventhub_topic) == 0 ? {} : {
    for topic, params in var.eventhub_topic : (azurerm_eventhub.this[topic].name) => {
      topic_id                  = azurerm_eventhub.this[topic].id,
      primary_key               = azurerm_eventhub_authorization_rule.this[topic].primary_key
      primary_connection_string = azurerm_eventhub_authorization_rule.this[topic].primary_connection_string
    }
  }
}
