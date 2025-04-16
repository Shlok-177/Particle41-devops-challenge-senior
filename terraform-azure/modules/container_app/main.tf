resource "azurerm_container_app_environment" "aca_env" {
  name                     = "${var.container_app_name}-env"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  infrastructure_subnet_id = var.subnet_id  # Your private subnet (from VNet outputs)

  zone_redundancy_enabled  = true
}

resource "azurerm_container_app" "app" {
  name                         = var.container_app_name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  revision_mode                = "Single"

  template {
    container {
      name   = "my-container"
      image  = var.container_image
      cpu = 0.5
      memory = "1Gi"
    }
    min_replicas = 1
    max_replicas = 10
  }

  ingress {
    external_enabled     = true
    target_port          = 8080
    
    traffic_weight {
      percentage         = 100
      latest_revision    = true
    }
  }

  identity {
    type = "SystemAssigned"
  }
}
