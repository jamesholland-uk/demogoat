resource azurerm_app_service_plan "example" {
  name                = "terragoat-app-service-plan-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Dynamic"
    size = "S1"
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/app_service.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "2d44bf6d-66a5-4569-bc6f-0b622a918ec4"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource azurerm_app_service "app-service1" {
  app_service_plan_id = azurerm_app_service_plan.example.id
  location            = var.location
  name                = "terragoat-app-service-${var.environment}${random_integer.rnd_int.result}"
  resource_group_name = azurerm_resource_group.example.name
  https_only          = false
  site_config {
    min_tls_version = "1.1"
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/app_service.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "e0703357-ac3c-463e-b2e8-0f459f96d73a"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource azurerm_app_service "app-service2" {
  app_service_plan_id = azurerm_app_service_plan.example.id
  location            = var.location
  name                = "terragoat-app-service-${var.environment}${random_integer.rnd_int.result}"
  resource_group_name = azurerm_resource_group.example.name
  https_only          = true

  auth_settings {
    enabled = false
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/app_service.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "69084183-e035-4694-9245-96198bd278f8"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

