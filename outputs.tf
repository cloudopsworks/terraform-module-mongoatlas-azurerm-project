##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "project_name" {
  value = module.project.project_name
}

output "project_id" {
  value = module.project.project_id
}

output "project_creation_timestamp" {
  value = module.project.project_creation_timestamp
}

output "project_backup_policy_id" {
  value = module.project.project_backup_policy_id
}

output "project_kms_key_vault_id" {
  value = try(var.settings.encryption_at_rest.enabled, false) ? azurerm_key_vault.atlas[0].id : null
}

output "project_kms_key_vault_name" {
  value = try(var.settings.encryption_at_rest.enabled, false) ? azurerm_key_vault.atlas[0].name : null
}

output "project_kms_key_id" {
  value = try(var.settings.encryption_at_rest.enabled, false) ? azurerm_key_vault_key.atlas[0].id : null
}

output "project_kms_atlas_app_id" {
  description = "Atlas Azure application ID from cloud provider access setup"
  value       = module.project.cloud_provider_setup_azure_app_id
}

output "project_kms_atlas_service_principal_id" {
  description = "Atlas Azure service principal object ID from cloud provider access setup"
  value       = module.project.cloud_provider_setup_azure_service_principal_id
}

output "encryption_at_rest_id" {
  value = module.project.encryption_at_rest_id
}

output "imported_alert_statement" {
  value = module.project.imported_alert_statement
}

output "imported_alert_json" {
  value = module.project.imported_alert_json
}
