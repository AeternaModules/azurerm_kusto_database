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
  # --- Unconfirmed validation candidates, derived from azurerm_kusto_database's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from kustoValidate.DatabaseName] regexp.MustCompile(`^[\s]+$`).MatchString(name)
  # path: name
  #   source:    [from kustoValidate.DatabaseName] !regexp.MustCompile(`^[a-zA-Z0-9\s._-]+$`).MatchString(name)
  # path: name
  #   condition: length(value) <= 260
  #   message:   [from kustoValidate.DatabaseName: invalid when len(value) > 260]
  #   source:    [from kustoValidate.DatabaseName: invalid when len(value) > 260]
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: cluster_name
  #   source:    [from kustoValidate.ClusterName] !regexp.MustCompile(`^[a-z][a-z0-9\-]+$`).MatchString(name)
  # path: cluster_name
  #   source:    [from kustoValidate.ClusterName] len(name) < 4 || len(name) > 22
  # path: soft_delete_period
  #   source:    [from validate.ISO8601Duration] !ok
  # path: soft_delete_period
  #   source:    [from validate.ISO8601Duration] err != nil
  # path: hot_cache_period
  #   source:    [from validate.ISO8601Duration] !ok
  # path: hot_cache_period
  #   source:    [from validate.ISO8601Duration] err != nil
}

