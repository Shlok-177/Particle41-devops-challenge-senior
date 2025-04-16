output "frontend_endpoint_host_name" {
  description = "The public URL of the Front Door frontend endpoint."
  value       = azurerm_cdn_frontdoor_endpoint.this.host_name
}

output "route_name" {
  description = "The name of the Front Door Route."
  value       = azurerm_cdn_frontdoor_route.this.name
}