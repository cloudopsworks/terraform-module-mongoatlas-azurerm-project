##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  kv_location = var.region != "" ? var.region : "eastus"
  kv_name     = try(var.settings.encryption_at_rest.key_vault_name, format("mdbatlas-%s-kv", local.system_name_short))
  kv_rg_name  = try(var.settings.encryption_at_rest.resource_group_name, null)
  kv_key_opts = try(var.settings.encryption_at_rest.key_opts, ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"])
}

data "azurerm_client_config" "current" {}

# Key Vault for MongoDB Atlas encryption at rest.
# The Atlas service principal (obtained via cloud provider access setup) is granted
# key permissions here; no manually-managed Azure AD application is required.
resource "azurerm_key_vault" "atlas" {
  count                      = try(var.settings.encryption_at_rest.enabled, false) ? 1 : 0
  name                       = local.kv_name
  location                   = local.kv_location
  resource_group_name        = local.kv_rg_name
  tenant_id                  = data.azurerm_subscription.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = try(var.settings.encryption_at_rest.soft_delete_retention_days, 7)
  purge_protection_enabled   = try(var.settings.encryption_at_rest.purge_protection_enabled, true)

  # Terraform operator access — manage keys, rotation policy.
  access_policy {
    tenant_id = data.azurerm_subscription.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "Get", "List", "Create", "Delete", "Update", "Recover", "Purge",
      "GetRotationPolicy", "SetRotationPolicy",
    ]
  }

  # Atlas service principal access — use keys for encryption/decryption.
  # service_principal_id comes from mongodbatlas_cloud_provider_access_setup via module output.
  access_policy {
    tenant_id       = data.azurerm_subscription.current.tenant_id
    object_id       = module.project.cloud_provider_setup_azure_service_principal_id
    key_permissions = ["Get", "List", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey"]
  }

  tags = local.all_tags
}

resource "azurerm_key_vault_key" "atlas" {
  count        = try(var.settings.encryption_at_rest.enabled, false) ? 1 : 0
  name         = format("mongodbatlas-%s-key", local.system_name_short)
  key_vault_id = azurerm_key_vault.atlas[count.index].id
  key_type     = try(var.settings.encryption_at_rest.key_type, "RSA")
  key_size     = try(var.settings.encryption_at_rest.key_size, 2048)
  key_opts     = local.kv_key_opts

  depends_on = [azurerm_key_vault.atlas]
}
