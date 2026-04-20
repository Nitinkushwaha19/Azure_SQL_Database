# Outputs for Azure SQL Server
output "sql_server" {
  value = {
    id   = azurerm_mssql_server.mssql_server.id
    fqdn = azurerm_mssql_server.mssql_server.fully_qualified_domain_name
  }
  description = "Azure SQL Server details"
}

# Output for SQL Connection String
output "sql_connection_string" {
  value       = "Server=tcp:${azurerm_mssql_server.mssql_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.mssql_database.name};Persist Security Info=False;User ID=${var.sql_server_admin_login};Password=${random_password.sql_admin_password.result};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  sensitive   = true
  description = "Connection string for the SQL Database"
}
# Outputs for Azure SQL Database
output "sql_db_id" {
  value       = azurerm_mssql_database.mssql_database.id
  description = "Azure SQL Database ID"
}
