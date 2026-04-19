# Variables for App Service Plan
variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "asp_os_type" {
  description = "Operating system type for the App Service Plan (e.g., Windows or Linux)"
  type        = string
}

variable "asp_sku_name" {
  description = "SKU name for the App Service Plan (e.g., F1, B1, S1)"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}

# Variables for Linux Web App
variable "linux_webapp_name" {
  description = "Name of the Linux Web App"
  type        = string
}

variable "app_dotnet_version" {
  description = "Version of .NET to be used in the Web App (e.g., 6.0, 7.0)"
  type        = string
}

variable "sql_connection_string" {
  description = "Connection string for the SQL Database"
  type        = string
  sensitive   = true
}

# Resource group variables
variable "rg_name" {}
variable "rg_location" {}
