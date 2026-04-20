output "sql_server_fqdn" {
  description = "SQL Server fully qualified domain name"
  value       = module.sql.sql_server.fqdn
}

output "sql_database_id" {
  description = "Azure SQL Database ID"
  value       = module.sql.sql_database.id
}

output "app_hostname" {
  description = "Linux Web App hostname"
  value       = module.webapp.app_hostname
}

