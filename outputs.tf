output "kusto_databases" {
  description = "All kusto_database resources"
  value       = azurerm_kusto_database.kusto_databases
}
output "kusto_databases_cluster_name" {
  description = "List of cluster_name values across all kusto_databases"
  value       = [for k, v in azurerm_kusto_database.kusto_databases : v.cluster_name]
}
output "kusto_databases_hot_cache_period" {
  description = "List of hot_cache_period values across all kusto_databases"
  value       = [for k, v in azurerm_kusto_database.kusto_databases : v.hot_cache_period]
}
output "kusto_databases_location" {
  description = "List of location values across all kusto_databases"
  value       = [for k, v in azurerm_kusto_database.kusto_databases : v.location]
}
output "kusto_databases_name" {
  description = "List of name values across all kusto_databases"
  value       = [for k, v in azurerm_kusto_database.kusto_databases : v.name]
}
output "kusto_databases_resource_group_name" {
  description = "List of resource_group_name values across all kusto_databases"
  value       = [for k, v in azurerm_kusto_database.kusto_databases : v.resource_group_name]
}
output "kusto_databases_size" {
  description = "List of size values across all kusto_databases"
  value       = [for k, v in azurerm_kusto_database.kusto_databases : v.size]
}
output "kusto_databases_soft_delete_period" {
  description = "List of soft_delete_period values across all kusto_databases"
  value       = [for k, v in azurerm_kusto_database.kusto_databases : v.soft_delete_period]
}

