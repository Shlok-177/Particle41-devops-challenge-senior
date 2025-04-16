    resource "azurerm_cdn_frontdoor_profile" "this" {
    name                = var.frontdoor_profile_name
    resource_group_name = var.resource_group_name
    sku_name            = "Standard_AzureFrontDoor"
    }

    resource "azurerm_cdn_frontdoor_endpoint" "this" {
    name                      = var.frontdoor_endpoint_name
    cdn_frontdoor_profile_id  = azurerm_cdn_frontdoor_profile.this.id
    }

    resource "azurerm_cdn_frontdoor_origin_group" "this" {
    name                      = "function-origin-group"
    cdn_frontdoor_profile_id  = azurerm_cdn_frontdoor_profile.this.id

    health_probe {
        interval_in_seconds = 120
        path                = "/"
        protocol            = "Https"
        request_type        = "GET"
    }

    load_balancing {
        sample_size                 = 4
        successful_samples_required = 3
        additional_latency_in_milliseconds = 50
    }
    }

    resource "azurerm_cdn_frontdoor_origin" "function_origin" {
    name                           = "function-origin"
    cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.this.id
    enabled                        = true
    host_name                      = var.app_default_hostname
    origin_host_header             = var.app_default_hostname
    certificate_name_check_enabled = true
    http_port                      = 80
    https_port                     = 443
    priority                       = 1
    weight                         = 1000
    }

    resource "azurerm_cdn_frontdoor_route" "this" {
    name                          = "route-all"
    cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.this.id
    cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id
    cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.function_origin.id]

    patterns_to_match             = ["/*"]
    supported_protocols           = ["Https", "Http"]
    forwarding_protocol           = "HttpsOnly"
    https_redirect_enabled        = true
    }
