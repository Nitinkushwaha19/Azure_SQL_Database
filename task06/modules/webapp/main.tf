# App Service Plan for Web App
resource "azurerm_service_plan" "ASP" {
  name                = var.app_service_plan_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  os_type             = var.asp_os_type
  sku_name            = var.asp_sku_name

  tags = var.tags
}

# Linux Web App
resource "azurerm_linux_web_app" "webapp" {
  name                = var.linux_webapp_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  service_plan_id     = azurerm_service_plan.ASP.id

  site_config {
    always_on = true

    application_stack {
      dotnet_version = var.app_dotnet_version
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

  tags = var.tags
}
