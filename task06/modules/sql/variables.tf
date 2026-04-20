# SQL Server Variables
variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "sql_server_version" {
  description = "Version of the SQL Server"
  type        = string
  default     = "12.0"
}

variable "sql_server_admin_login" {
  description = "Administrator login for the SQL Server"
  type        = string
}

variable "sql_server_minimum_tls_version" {
  description = "Minimum TLS version for the SQL Server"
  type        = string
  default     = "1.2"
}

# Firewall Rule Variables
variable "mssql_firewall_internal_rule_name" {
  description = "Name of the internal MSSQL Firewall Rule"
  type        = string
  default     = "AllowLinuxAzureIPs"
}

variable "mssql_firewall_rule_name" {
  description = "Name of the MSSQL Firewall Rule"
  type        = string
}

variable "verification_ip" {
  description = "IP address to be allowed for verification in the firewall rule"
  type        = string
}

# SQL Database Variables
variable "sql_database_name" {
  description = "Name of the SQL Database"
  type        = string
}

variable "mssql_db_collation" {
  description = "Collation of the MSSQL Database"
  type        = string
}

variable "mssql_db_license_type" {
  description = "License type for the MSSQL Database"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the MSSQL Database"
  type        = string
}

# Azure Key Vault Variables
variable "key_vault_id" {
  description = "ID of the Azure Key Vault to store secrets"
  type        = string
}

variable "key_vault_password_name" {
  description = "Secret name for the SQL admin password"
  type        = string
}

variable "key_vault_login_name" {
  type        = string
  description = "Key secret name for the SQL admin username"
}

# Resource Group Variables
variable "rg_name" {}
variable "rg_location" {}


# Tags Variable
variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}
