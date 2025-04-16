output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "public_subnets" {
  value = azurerm_subnet.public[*].id
}

output "private_subnets" {
  value = azurerm_subnet.private[*].id
}

output "resource_group_name" {
  value = var.resource_group_name
}
