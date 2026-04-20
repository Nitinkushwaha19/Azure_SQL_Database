# locals.tf
locals {
  # Resource names using join function as required
  rg_name         = join("-", [var.name_prefix, "rg"])
  sql_server_name = join("-", [var.name_prefix, "sql"])
  sql_db_name     = join("-", [var.name_prefix, "sql", "db"])
  asp_name        = join("-", [var.name_prefix, "asp"])
  app_name        = join("-", [var.name_prefix, "app"])

  # Key Vault secret names (as specified in task parameters)
  sql_admin_name_secret     = "sql-admin-name"
  sql_admin_password_secret = "sql-admin-password"

  # Firewall rule name
  firewall_rule_name = "allow-verification-ip"

  # SQL admin username (can be defined here or in variables)
  sql_admin_username = "sqladmin"
}
