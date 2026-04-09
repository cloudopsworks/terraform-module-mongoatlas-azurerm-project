##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

module "project" {
  source = "../terraform-module-mongoatlas-project"

  is_hub     = var.is_hub
  spoke_def  = var.spoke_def
  org        = var.org
  extra_tags = var.extra_tags

  name_prefix         = ""
  name                = var.name != "" ? var.name : (var.name_prefix != "" ? format("%s-%s", var.name_prefix, local.system_name_plain) : local.system_name_plain)
  organization_name   = var.organization_name
  organization_id     = var.organization_id
  settings            = var.settings
  generate_import     = var.generate_import
  encryption_provider = try(var.settings.encryption_at_rest.enabled, false) ? "AZURE" : ""
  # client_id, tenant_id, and service_principal_id are sourced directly from
  # mongodbatlas_cloud_provider_access_setup outputs inside the generic module.
  encryption_provider_config = {
    azure_environment   = try(var.settings.encryption_at_rest.azure_environment, "AZURE")
    subscription_id     = data.azurerm_subscription.current.subscription_id
    resource_group_name = local.kv_rg_name
    key_vault_name      = try(azurerm_key_vault.atlas[0].name, null)
    key_identifier      = try(azurerm_key_vault_key.atlas[0].id, null)
  }
}
