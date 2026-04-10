##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

variable "name_prefix" {
  # (Optional) Prefix prepended to the auto-generated project name when `name` is not set. Default: "".
  description = "(Optional) Prefix for the name of the resources"
  type        = string
  default     = ""
}

variable "name" {
  # (Optional) Explicit name for the MongoDB Atlas project. When set, overrides `name_prefix`. Default: "".
  description = "(Optional) Explicit name for the MongoDB Atlas project; overrides name_prefix"
  type        = string
  default     = ""
}

variable "organization_name" {
  # (Optional) Name of the MongoDB Atlas organization. Used to look up the org ID when `organization_id` is not provided.
  description = "(Optional) The name of the MongoDB Atlas organization where the project will be created"
  type        = string
  default     = ""
}

variable "organization_id" {
  # (Optional) Direct MongoDB Atlas organization ID. Takes precedence over `organization_name` lookup.
  description = "(Optional) The ID of the MongoDB Atlas organization where the project will be created"
  type        = string
  default     = ""
}

## Settings object structure (all keys are optional unless noted):
#
# settings:
#   default_alerts_settings: true | false
#   collect_database_specifics_statistics_enabled: true | false
#   data_explorer_enabled: true | false
#   extended_storage_sizes_enabled: true | false
#   performance_advisor_enabled: true | false
#   schema_advisor_enabled: true | false
#   backup_compliance: { ... }      # see terraform-module-mongoatlas-project for full schema
#   maintenance: { ... }            # see terraform-module-mongoatlas-project for full schema
#   access_list: { ... }            # see terraform-module-mongoatlas-project for full schema
#   alerts: [ ... ]                 # see terraform-module-mongoatlas-project for full schema
#
#   encryption_at_rest:
#     enabled: true | false                        # (Optional) Enable Azure Key Vault encryption at rest. Default: false.
#     resource_group_name: string                  # (Required when enabled) Resource group for the Key Vault.
#     key_vault_name: string                       # (Optional) Key Vault name. Default: auto-generated (max 24 chars).
#     azure_environment: string                    # (Optional) Azure cloud environment. Values: "AZURE", "AZURE_CHINA", "AZURE_GERMANY", "AZURE_US_GOVERNMENT". Default: "AZURE".
#     soft_delete_retention_days: number           # (Optional) Soft-delete retention days (7–90). Default: 7.
#     purge_protection_enabled: true | false       # (Optional) Enable purge protection on the Key Vault. Default: true.
#     key_type: string                             # (Optional) Key Vault key type. Values: "RSA", "EC". Default: "RSA".
#     key_size: number                             # (Optional) RSA key size in bits. Values: 2048, 3072, 4096. Default: 2048.
#     key_opts: list(string)                       # (Optional) Allowed key operations. Default: ["decrypt","encrypt","sign","unwrapKey","verify","wrapKey"].
variable "settings" {
  description = "(Optional) Module settings object controlling project features: backup compliance, maintenance window, IP access list, alert configurations, and Azure Key Vault encryption at rest"
  type        = any
  default     = {}
}

variable "generate_import" {
  # (Optional) When true, generates import blocks for existing Atlas resources. Default: false.
  description = "(Optional) Generate OpenTofu import blocks for existing Atlas resources"
  type        = bool
  default     = false
}
