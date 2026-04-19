output "app_hostname" {
  description = "Web App hostname"
  value       = azurerm_linux_web_app.webapp.default_hostname
}

output "app_service_plan_id" {
  description = "App Service Plan ID"
  value       = azurerm_service_plan.ASP.id
}

output "web_app_id" {
  description = "Web App ID"
  value       = azurerm_linux_web_app.webapp.id
}
