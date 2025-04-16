resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = "shlok-vnet"
}

module "container_app" {
  source                  = "./modules/container_app"
  resource_group_name     = module.vnet.resource_group_name
  location                = var.location
  container_app_name      = var.container_app_name
  container_image         = var.container_image
  subnet_id               = module.vnet.private_subnets[0]
}

module "frontdoor" {
  source                   = "./modules/frontdoor"
  resource_group_name      = azurerm_resource_group.main.name
  frontdoor_profile_name   = "p41-fd-profile"
  frontdoor_endpoint_name  = "p41-fd-endpoint"
  app_default_hostname     = module.container_app.container_app_url
}

