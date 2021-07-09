resource "azurerm_sql_firewall_rule" "example" {
  name                = "terragoat-firewall-rule-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  start_ip_address    = "10.0.17.62"
  end_ip_address      = "10.0.17.62"
}

resource "azurerm_sql_server" "example" {
  name                         = "terragoat-sqlserver-${var.environment}${random_integer.rnd_int.result}"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "ariel"
  administrator_login_password = "Aa12345678"
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/sql.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "25c20d7b-d464-4a81-8e5b-80fe3476ad59"
  }
}

resource "azurerm_mssql_server_security_alert_policy" "example" {
  resource_group_name        = azurerm_resource_group.example.name
  server_name                = azurerm_sql_server.example.name
  state                      = "Enabled"
  storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  disabled_alerts = [
    "Sql_Injection",
    "Data_Exfiltration"
  ]
  retention_days = 20
}

resource "azurerm_mysql_server" "example" {
  name                = "terragoat-mysql-${var.environment}${random_integer.rnd_int.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  administrator_login          = "terragoat-${var.environment}"
  administrator_login_password = random_string.password.result

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/sql.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "90704b08-c9f5-4605-ae3d-fd8c7be9f30d"
  }
}

resource "azurerm_postgresql_server" "example" {
  name                         = "terragoat-postgresql-${var.environment}${random_integer.rnd_int.result}"
  location                     = azurerm_resource_group.example.location
  resource_group_name          = azurerm_resource_group.example.name
  sku_name                     = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = "terragoat"
  administrator_login_password = "Aa12345678"
  version                      = "9.5"
  ssl_enforcement_enabled      = false
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/sql.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "20454b6e-b1de-495b-ac3a-9d16574ad31e"
  }
}

resource "azurerm_postgresql_configuration" "thrtottling_config" {
  name                = "connection_throttling"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}

resource "azurerm_postgresql_configuration" "example" {
  name                = "log_checkpoints"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}