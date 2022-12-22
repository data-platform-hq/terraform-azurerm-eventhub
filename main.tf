resource "random_integer" "this" {
  min = 99
  max = 999
}

resource "azurerm_eventhub_namespace" "this" {
  name                = "eventhub-${random_integer.this.result}-${var.project}-${var.env}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.sku
  capacity            = var.capacity
}

resource "azurerm_eventhub_namespace_authorization_rule" "this" {
  name                = "eventhub-${var.project}-${var.env}-${var.location}"
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.resource_group

  listen = contains(var.default_namespace_auth_rule_permissions, "listen")
  send   = contains(var.default_namespace_auth_rule_permissions, "send")
  manage = contains(var.default_namespace_auth_rule_permissions, "manage")
}

resource "azurerm_eventhub" "this" {
  for_each = var.eventhub_topic

  name                = "${each.key}-${var.project}-${var.env}-${var.location}"
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.resource_group
  partition_count     = lookup(each.value, "partition_count", var.partition_count)
  message_retention   = lookup(each.value, "message_retention", var.message_retention)
}

resource "azurerm_eventhub_authorization_rule" "this" {
  for_each = length(var.eventhub_topic) == 0 ? {} : var.eventhub_topic

  name                = "access-${random_integer.this.result}-${var.project}-${var.env}-${var.location}"
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = azurerm_eventhub.this[each.key].name
  resource_group_name = var.resource_group
  listen              = contains(each.value.permissions, "listen")
  send                = contains(each.value.permissions, "send")
  manage              = contains(each.value.permissions, "manage")
}
