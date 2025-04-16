output "frontdoor_url" {
  value = "https://${module.frontdoor.frontend_endpoint_host_name}"
}

output "frontdoor_route_name" {
  value = module.frontdoor.route_name
}