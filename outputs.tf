output "kusto_databases_id" {
  description = "Map of id values across all kusto_databases, keyed the same as var.kusto_databases"
  value       = { for k, v in azurerm_kusto_database.kusto_databases : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kusto_databases_cluster_name" {
  description = "Map of cluster_name values across all kusto_databases, keyed the same as var.kusto_databases"
  value       = { for k, v in azurerm_kusto_database.kusto_databases : k => v.cluster_name if v.cluster_name != null && length(v.cluster_name) > 0 }
}
output "kusto_databases_hot_cache_period" {
  description = "Map of hot_cache_period values across all kusto_databases, keyed the same as var.kusto_databases"
  value       = { for k, v in azurerm_kusto_database.kusto_databases : k => v.hot_cache_period if v.hot_cache_period != null && length(v.hot_cache_period) > 0 }
}
output "kusto_databases_location" {
  description = "Map of location values across all kusto_databases, keyed the same as var.kusto_databases"
  value       = { for k, v in azurerm_kusto_database.kusto_databases : k => v.location if v.location != null && length(v.location) > 0 }
}
output "kusto_databases_name" {
  description = "Map of name values across all kusto_databases, keyed the same as var.kusto_databases"
  value       = { for k, v in azurerm_kusto_database.kusto_databases : k => v.name if v.name != null && length(v.name) > 0 }
}
output "kusto_databases_resource_group_name" {
  description = "Map of resource_group_name values across all kusto_databases, keyed the same as var.kusto_databases"
  value       = { for k, v in azurerm_kusto_database.kusto_databases : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "kusto_databases_size" {
  description = "Map of size values across all kusto_databases, keyed the same as var.kusto_databases"
  value       = { for k, v in azurerm_kusto_database.kusto_databases : k => v.size if v.size != null }
}
output "kusto_databases_soft_delete_period" {
  description = "Map of soft_delete_period values across all kusto_databases, keyed the same as var.kusto_databases"
  value       = { for k, v in azurerm_kusto_database.kusto_databases : k => v.soft_delete_period if v.soft_delete_period != null && length(v.soft_delete_period) > 0 }
}

