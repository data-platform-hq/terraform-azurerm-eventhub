# Required
variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to create the storage account"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "sku"
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

# Optional

variable "capacity" {
  type        = number
  description = "Eventhub capacity"
  default     = 1
}

variable "partition_count" {
  type        = number
  description = "Eventhub partition count"
  default     = 1
}

variable "message_retention" {
  type        = number
  description = "Number of days to retain the events"
  default     = 1
}

variable "eventhub_topic" {
  type = map(object({
    partition_count   = optional(number),
    message_retention = optional(number)
    permissions       = optional(list(string))
  }))
  description = "Map of eventhub topics"
  default     = {}
}

variable "default_namespace_auth_rule_permissions" {
  type        = list(string)
  description = "Permissions to give Namespace Authorization Rule"
  default     = ["listen", "send", "manage"]
  validation {
    condition = alltrue([
      for permission in var.default_namespace_auth_rule_permissions : contains(["listen", "send", "manage"], permission)
    ])
    error_message = "Only possible permissions are: listen, send, and manage"
  }
}
