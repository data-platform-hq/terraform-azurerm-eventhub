# Azure Event Hubs Terraform module
Terraform module for creation Azure Event Hubs

## Usage
By default, this module will provision one event hub namespace without event hub topics. For creating event hub topics, necessary to fill them in variable _**"eventhub_topics"**_ at at terraform environment file.

<!-- BEGIN_TF_DOCS -->

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.23.0|

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_eventhub_namespace_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_namespace_authorization_rule) | resource |
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) | resource |
| [random_integer.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group in which the Log Analytics workspace is created | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | map | {} | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Eventhub Namespace subscription | `string` | "Standard" | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Eventhub capacity | number | 1 | no |
| <a name="input_partition_count"></a> [partition_count](#input\_partition_count) | Eventhub partition count | number | 2 | yes |
| <a name="input_message_retention"></a> [message_retention](#input\_message_retention) | Number of days to retain the events | number | 1 | yes |
| <a name="input_eventhub_topic"></a> [eventhub_topic](#input\_eventhub_topic) | Map of eventhub topics | map(any) | {} | no |
| <a name="input_default_namespace_auth_rule_permissions"></a> [default_namespace_auth_rule_permissions](#input\_default_namespace_auth_rule_permissions) | Permissions to give Namespace Authorization Rule | set(string) |  ["listen", "send", "manage"] | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection_string](#output\_connection_string) |Azurerm eventhub namespace connection string |
| <a name="output_name"></a> [name](#output\_name) | Azurerm eventhub namespace name |
| <a name="output_namespace-primary-key"></a> [namespace-primary-key](#output\_namespace-primary-key) | Eventhub namespace primary key |
| <a name="output_namespace-key-name"></a> [namespace-key-name](#output\_namespace-key-name) | Eventhub namespace key name |
| <a name="output_namespace-endpoint"></a> [namespace-endpoint](#output\_namespace-endpoint) | Eventhub namespace endpoint |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-mssql-database/blob/main/LICENSE)
