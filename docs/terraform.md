## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.59 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.68.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project"></a> [project](#module\_project) | git::https://github.com/cloudopsworks/terraform-module-mongoatlas-project.git | v1.0.0 |
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.atlas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_key.atlas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_generate_import"></a> [generate\_import](#input\_generate\_import) | (Optional) Generate OpenTofu import blocks for existing Atlas resources | `bool` | `false` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Is this a hub or spoke configuration? | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) Explicit name for the MongoDB Atlas project; overrides name\_prefix | `string` | `""` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Prefix for the name of the resources | `string` | `""` | no |
| <a name="input_org"></a> [org](#input\_org) | Organization details | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | (Optional) The ID of the MongoDB Atlas organization where the project will be created | `string` | `""` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | (Optional) The name of the MongoDB Atlas organization where the project will be created | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Azure Region to deploy resources into. Example: 'eastus2', defaults to empty string as some of the resources may not require region setting. | `string` | `""` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | (Optional) Module settings object controlling project features: backup compliance, maintenance window, IP access list, alert configurations, and Azure Key Vault encryption at rest | `any` | `{}` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | Spoke ID Number, must be a 3 digit number | `string` | `"001"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_encryption_at_rest_id"></a> [encryption\_at\_rest\_id](#output\_encryption\_at\_rest\_id) | n/a |
| <a name="output_imported_alert_json"></a> [imported\_alert\_json](#output\_imported\_alert\_json) | n/a |
| <a name="output_imported_alert_statement"></a> [imported\_alert\_statement](#output\_imported\_alert\_statement) | n/a |
| <a name="output_project_backup_policy_id"></a> [project\_backup\_policy\_id](#output\_project\_backup\_policy\_id) | n/a |
| <a name="output_project_creation_timestamp"></a> [project\_creation\_timestamp](#output\_project\_creation\_timestamp) | n/a |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
| <a name="output_project_kms_atlas_app_id"></a> [project\_kms\_atlas\_app\_id](#output\_project\_kms\_atlas\_app\_id) | Atlas Azure application ID from cloud provider access setup |
| <a name="output_project_kms_atlas_service_principal_id"></a> [project\_kms\_atlas\_service\_principal\_id](#output\_project\_kms\_atlas\_service\_principal\_id) | Atlas Azure service principal object ID from cloud provider access setup |
| <a name="output_project_kms_key_id"></a> [project\_kms\_key\_id](#output\_project\_kms\_key\_id) | n/a |
| <a name="output_project_kms_key_vault_id"></a> [project\_kms\_key\_vault\_id](#output\_project\_kms\_key\_vault\_id) | n/a |
| <a name="output_project_kms_key_vault_name"></a> [project\_kms\_key\_vault\_name](#output\_project\_kms\_key\_vault\_name) | n/a |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | n/a |
