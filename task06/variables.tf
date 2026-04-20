# Name Prefix
variable "name_prefix" {
  description = "Prefix for all resource names"
  type        = string
}

# Resource group variables
variable "location" {
  description = "Azure region for the resource group"
  type        = string
}

# Key Vault Variables
variable "key_vault_name" {
  description = "Name of the existing Azure Key Vault"
  type        = string
}

variable "rg_key_vault_name" {
  type        = string
  description = "Resource group of the key vault"
}


# SQL Server Variables
variable "sql_server_version" {
  description = "Version of the SQL Server"
  type        = string
  default     = "12.0"
}

variable "sql_server_minimum_tls_version" {
  description = "Minimum TLS version for the SQL Server"
  type        = string
  default     = "1.2"
}

# Firewall Rule Variables
variable "allowed_ip_address" {
  description = "IP address to be allowed for verification in the firewall rule"
  type        = string
}

# SQL Database Variables

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




# App Service Plan Variables
variable "asp_os_type" {
  description = "Operating system type for the App Service Plan (Windows or Linux)"
  type        = string
}

variable "asp_sku_name" {
  description = "SKU name for the App Service Plan (e.g., B1, S1, P1v2)"
  type        = string
}

# Web App Variables
variable "app_dotnet_version" {
  description = "Version of .NET for the Web App (e.g., 6, 7)"
  type        = string
}


# Tags
variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {}
}
