# Azure Event Hub Terraform module
Terraform module for creation Azure Event Hub

## Usage
This module is provisioning Azure Event Hub namespace and topics. Below is an example that provisions single namespace with three topics within it.
```
locals {
  eventhub_topic = {
    topic-1 = { partition_count = 1, message_retention = 7, permissions = ["listen","send","manage"] }
    topic-2 = { partition_count = 1, message_retention = 3, permissions = ["listen"] }
    topic-3 = { partition_count = 1, message_retention = 3, permissions = ["listen", "send"] }
  }
  tags = {
    environment = "development"
  }
}

module "eventhub" {
  source  = "data-platform-hq/eventhub/azurerm"

  project        = "datahq"
  env            = "dev"
  location       = "eastus"
  tags           = local.tags
  resource_group = "example"
  eventhub_topic = local.eventhub_topic
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version   |
| ------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 3.23.0 |
| <a name="requirement_random"></a> [random](#requirement\_random)          | >= 3.4.3  |

## Providers

| Name                                                          | Version   |
| ------------------------------------------------------------- | --------- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.24.0 |
| <a name="requirement_random"></a> [random](#provider\_random) | >= 3.4.3  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                           | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [azurerm_eventhub_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace)                                          | resource |
| [azurerm_eventhub_namespace_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_namespace_authorization_rule) | resource |
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub)                                                              | resource |
| [azurerm_eventhub_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule)                        | resource |
| [random_integer.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer)                                                                  | resource |

## Inputs

| Name                                                                                                                                                            | Description                                                                    | Type                                                                                                                                                               | Default                        | Required |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------ | :------: |
| <a name="input_project"></a> [project](#input\_project)                                                                                                         | Project name                                                                   | `string`                                                                                                                                                           | n/a                            |   yes    |
| <a name="input_env"></a> [env](#input\_env)                                                                                                                     | Environment name                                                               | `string`                                                                                                                                                           | n/a                            |   yes    |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group)                                                                                  | The name of the resource group in which the Log Analytics workspace is created | `string`                                                                                                                                                           | n/a                            |   yes    |
| <a name="input_location"></a> [location](#input\_location)                                                                                                      | Specifies the supported Azure location where the resource exists               | `string`                                                                                                                                                           | n/a                            |   yes    |
| <a name="input_custom_namespace_name"></a> [custom\_namespace\_name](#input\_custom\_namespace\_name)                                                           | Specifies the name of the EventHub Namespace resource                          | `string`                                                                                                                                                           | `null`                         |    no    |
| <a name="input_custom_topic_name"></a> [custom\_topic\_name](#input\_custom\_topic\_name)                                                                       | Specifies the name of the EventHub resource                                    | `string`                                                                                                                                                           | `null`                         |    no    |
| <a name="input_custom_namespace_auth_rule_name"></a> [custom\_namespace\_auth\_rule\_name](#input\_custom\_namespace\_auth\_rule\_name)                         | Specifies the name of the Namespace Authorization Rule                         | `string`                                                                                                                                                           | `null`                         |    no    |
| <a name="input_custom_topic_auth_rule_name"></a> [custom\_topic\_auth\_rule\_name](#input\_custom\_topic\_auth\_rule\_name)                                     | Specifies the name of the EventHub Authorization Rule resource                 | `string`                                                                                                                                                           | `null`                         |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                                                                  | A mapping of tags to assign to the resource                                    | `map`                                                                                                                                                              | `{}`                           |    no    |
| <a name="input_sku"></a> [sku](#input\_sku)                                                                                                                     | Event Hub namespace tier type                                                  | `string`                                                                                                                                                           | `"Standard"`                   |    no    |
| <a name="input_capacity"></a> [capacity](#input\_capacity)                                                                                                      | Event Hub namespace capacity                                                   | `number`                                                                                                                                                           | `1`                            |    no    |
| <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count)                                                                               | Event Hub partition count                                                      | `number`                                                                                                                                                           | `2`                            |    no    |
| <a name="input_message_retention"></a> [message\_retention](#input\_message\_retention)                                                                         | Number of days to retain the events                                            | `number`                                                                                                                                                           | `1`                            |    no    |
| <a name="input_eventhub_topic"></a> [eventhub\_topic](#input\_eventhub\_topic)                                                                                  | Map of Event Hub topics                                                        | <pre>map(object({<br> partition_count   = optional(number) <br> message_retention = optional(number) <br> permissions       = optional(list(string)) <br>}))</pre> | `{}`                           |    no    |
| <a name="input_default_namespace_auth_rule_permissions"></a> [default\_namespace\_auth\_rule\_permissions](#input\_default\_namespace\_auth\_rule\_permissions) | Permissions to give Namespace Authorization Rule                               | `list(string)`                                                                                                                                                     | `["listen", "send", "manage"]` |    no    |

## Outputs

| Name                                                                                                                      | Description                                |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| <a name="output_namespace_connection_string"></a> [namespace\_connection\_string](#output\_namespace\_connection\_string) | Event Hub namespace connection string      |
| <a name="output_namespace_name"></a> [namespace\_name](#output\_namespace\_name)                                          | Event Hub namespace name                   |
| <a name="output_namespace_primary_key"></a> [namespace\_primary\_key](#output\_namespace\_primary\_key)                   | Event Hub namespace shared access key      |
| <a name="output_namespace_key_name"></a> [namespace\_key\_name](#output\_namespace\_key\_name)                            | Event Hub namespace shared access key name |
| <a name="output_namespace_endpoint"></a> [namespace\_endpoint](#output\_namespace\_endpoint)                              | Event Hub namespace endpoint               |
| <a name="output_topic"></a> [topic](#output\_topic)                                                                       | Topic map of parameters                    |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-mssql-database/blob/main/LICENSE)
