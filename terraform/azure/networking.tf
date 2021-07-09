resource "azurerm_virtual_network" "example" {
  name                = "terragoat-vn-${var.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "904fa394-5ccc-468f-91ac-5c94b2f09b20"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource "azurerm_subnet" "example" {
  name                 = "terragoat-${var.environment}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "ni_linux" {
  name                = "terragoat-linux-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "5593f021-cbc5-4fda-b7ad-1cffad546532"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource "azurerm_network_interface" "ni_win" {
  name                = "terragoat-win-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "71b1b16b-d7a7-412b-a4cb-99979642d74a"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource azurerm_network_security_group "bad_sg" {
  location            = var.location
  name                = "terragoat-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "AllowSSH"
    priority                   = 200
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "22-22"
    destination_address_prefix = "*"
  }

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "AllowRDP"
    priority                   = 300
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "3389-3389"
    destination_address_prefix = "*"
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "992437d1-2342-4b28-9cee-ae10be3fa080"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource azurerm_network_watcher "network_watcher" {
  location            = var.location
  name                = "terragoat-network-watcher-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "b61225ee-e076-4ce5-b97d-16c9fe7747f3"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource azurerm_network_watcher_flow_log "flow_log" {
  enabled                   = false
  network_security_group_id = azurerm_network_security_group.bad_sg.id
  network_watcher_name      = azurerm_network_watcher.network_watcher.name
  resource_group_name       = azurerm_resource_group.example.name
  storage_account_id        = azurerm_storage_account.example.id
  retention_policy {
    enabled = false
    days    = 10
  }
  tags = {
    demo-owner           = "james"
    git_commit           = "2384d4d87f0d949f4e7c31718827a92ad9fdc27d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-06-17 14:08:57"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "6ac1fa33-7d7d-4fba-aa2e-06dd9ac0e022"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}