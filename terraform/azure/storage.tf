resource "azurerm_managed_disk" "example" {
  name                 = "terragoat-disk-${var.environment}"
  location             = var.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 1
  encryption_settings {
    enabled = false
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/storage.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "008da894-f841-40ce-9ba9-8dec2f72ecae"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "tgsa${var.environment}${random_integer.rnd_int.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  queue_properties {
    logging {
      delete                = false
      read                  = false
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
    hour_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
    minute_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/storage.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "4de04e14-b193-4bd6-974b-0ebb494f643d"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource "azurerm_storage_account_network_rules" "test" {
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_name = azurerm_storage_account.example.name

  default_action = "Deny"
  ip_rules       = ["127.0.0.1"]
  bypass         = ["Metrics"]
}
