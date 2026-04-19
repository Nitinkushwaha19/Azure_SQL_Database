# Get current client configuration for permissions
data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.rg_key_vault_name
}

# Grant Key Vault access to current service principal/user
resource "azurerm_key_vault_access_policy" "terraform_access" {
  key_vault_id = data.azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore"
  ]

  depends_on = [data.azurerm_key_vault.kv]
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

module "sql" {

  source = "./modules/sql"

  # Passing variables to the SQL module - Mssql Server
  sql_server_name                = local.sql_server_name
  sql_server_version             = var.sql_server_version
  sql_server_admin_login         = local.sql_admin_name_secret
  sql_server_minimum_tls_version = var.sql_server_minimum_tls_version
  rg_name                        = azurerm_resource_group.rg.name
  rg_location                    = azurerm_resource_group.rg.location

  # Passing variables to the SQL module - Mssql Database
  sql_database_name     = local.sql_db_name
  mssql_db_collation    = var.mssql_db_collation
  mssql_db_license_type = var.mssql_db_license_type
  sku_name              = var.sku_name

  mssql_firewall_rule_name = local.firewall_rule_name
  verification_ip          = var.verification_ip

  key_vault_id          = data.azurerm_key_vault.kv.id # existing key vault ID
  key_vault_secret_name = local.sql_admin_name_secret  # secret name in the key vault to store SQL admin password
  tags                  = var.tags

}


module "webapp" {
  source = "./modules/webapp"

  # passing variables to the Web App module - App Service Plan
  app_service_plan_name = local.asp_name
  asp_os_type           = var.asp_os_type
  asp_sku_name          = var.asp_sku_name


  # Passing variables to the Web App module
  linux_webapp_name  = local.app_name
  rg_name            = azurerm_resource_group.rg.name
  rg_location        = azurerm_resource_group.rg.location
  app_dotnet_version = var.app_dotnet_version

  sql_connection_string = module.sql.sql_connection_string
  tags                  = var.tags

}
