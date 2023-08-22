resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-RG"
  location = var.location
  tags     = var.tags

}

resource "azurerm_service_plan" "main" {
  name                = "${var.prefix}-SERVICEPLAN"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"
  sku_name            = "F1"



  depends_on = [azurerm_resource_group.main]
  tags       = var.tags
}

# resource "azurerm_redis_cache" "main" {
#   name                = "${var.prefix}-REDIS"
#   location            = azurerm_resource_group.main.location
#   resource_group_name = azurerm_resource_group.main.name
#   sku_name            = "Basic"
#   capacity            = 1
#   family              = "C"

#   depends_on = [azurerm_resource_group.main]
#   tags       = var.tags
# }

resource "azurerm_linux_web_app" "main" {
  name                = "${var.prefix}-WEBAPP"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_service_plan.main.location
  service_plan_id     = azurerm_service_plan.main.id
  https_only          = true


  site_config {
    always_on = false

    application_stack {
      docker_image_name        = var.image_name
      docker_registry_url      = var.image_registry_url
      docker_registry_username = var.image_registry_password
      docker_registry_password = var.image_registry_password
    }
  }

  app_settings = {
    "WEBSITES_PORT" = "3000"
    # "REDIS_HOSTNAME" = azurerm_redis_cache.main.hostname
    # "REDIS_PORT"     = azurerm_redis_cache.main.ssl_port
    # "REDIS_ACCESS_KEY" = azurerm_redis_cache.main.primary_access_key

    "DOCKER_REGISTRY_SERVER_URL"      = var.image_registry_url
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.image_registry_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.image_registry_password
  }

  depends_on = [azurerm_service_plan.main]
  tags       = var.tags
}


