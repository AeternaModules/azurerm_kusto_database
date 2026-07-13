variable "kusto_databases" {
  description = <<EOT
Map of kusto_databases, attributes below
Required:
    - cluster_name
    - location
    - name
    - resource_group_name
Optional:
    - hot_cache_period
    - soft_delete_period
EOT

  type = map(object({
    cluster_name        = string
    location            = string
    name                = string
    resource_group_name = string
    hot_cache_period    = optional(string)
    soft_delete_period  = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.kusto_databases : (
        length(v.name) <= 260
      )
    ])
    error_message = "[from kustoValidate.DatabaseName: invalid when len(value) > 260]"
  }
  validation {
    condition = alltrue([
      for k, v in var.kusto_databases : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.kusto_databases : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.kusto_databases : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

