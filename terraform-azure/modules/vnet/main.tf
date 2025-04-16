
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "public" {
  count               = 2
  name                = "public-subnet-${count.index}"
  resource_group_name = var.resource_group_name
  virtual_network_name= azurerm_virtual_network.vnet.name
  address_prefixes    = ["10.0.${count.index}.0/24"]
}

resource "azurerm_subnet" "private" {
  count               = 2
  name                = "private-subnet-${count.index}"
  resource_group_name = var.resource_group_name
  virtual_network_name= azurerm_virtual_network.vnet.name
  address_prefixes    = ["10.0.${count.index * 2 + 2}.0/23"]  # <-- /23 for Container Apps

# delegation {
#     name = "containerapp-delegation"
#     service_delegation {
#       name    = "Microsoft.App/managedEnvironments"
#       actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
#     }
#   }
}
