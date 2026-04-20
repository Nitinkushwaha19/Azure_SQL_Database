# Random Password Generation for SQL Admin
resource "random_password" "sql_admin_password" {
  length  = 16
  special = true
  upper   = true
  lower   = true
  numeric = true
}

# Azure SQL Server
resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = var.sql_server_version
  administrator_login          = var.sql_server_admin_login
  administrator_login_password = random_password.sql_admin_password.result
  minimum_tls_version          = var.sql_server_minimum_tls_version
  tags                         = var.tags
}

# Azure SQL Database
resource "azurerm_mssql_database" "mssql_database" {
  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.mssql_server.id
  collation      = var.mssql_db_collation
  license_type   = var.mssql_db_license_type
  sku_name       = var.sku_name
  zone_redundant = false

  tags = var.tags
}

# Azure SQL Firewall Rule
resource "azurerm_mssql_firewall_rule" "mssql_firewall_rule" {
  name             = var.mssql_firewall_rule_name
  server_id        = azurerm_mssql_server.mssql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Firewall rule for verification IP
resource "azurerm_mssql_firewall_rule" "verification_ip" {
  name             = var.mssql_firewall_rule_name
  server_id        = azurerm_mssql_server.mssql_server.id
  start_ip_address = var.verification_ip
  end_ip_address   = var.verification_ip

}

# Azure Key Vault Secret for SQL Admin name
resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = var.key_vault_secret_name
  value        = var.sql_server_admin_login
  key_vault_id = var.key_vault_id

  tags = var.tags
}

# Azure Key Vault Secret for SQL Admin Password
resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.key_vault_secret_name
  value        = random_password.sql_admin_password.result
  key_vault_id = var.key_vault_id

  tags = var.tags
}
