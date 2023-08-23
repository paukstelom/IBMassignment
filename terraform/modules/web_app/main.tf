resource "azurerm_service_plan" "main" {
  name                = "${var.prefix}-SERVICEPLAN"
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  os_type             = "Linux"
  sku_name            = "F1"
  tags                = var.tags
}

resource "azurerm_linux_web_app" "main" {
  name                = "${var.prefix}-WEBAPP"
  resource_group_name = var.resource_group.name
  location            = azurerm_service_plan.main.location
  service_plan_id     = azurerm_service_plan.main.id
  https_only          = true


  site_config {
    always_on = false

    application_stack {
      docker_image_name        = var.registry.image_name
      docker_registry_url      = var.registry.url
      docker_registry_username = var.registry.username
      docker_registry_password = var.registry.password
    }
  }

  app_settings = {
    "WEBSITES_PORT"                   = "3000"
    "REDIS_HOSTNAME"                  = var.redis.hostname
    "REDIS_PORT"                      = var.redis.port
    "REDIS_ACCESS_KEY"                = var.redis.access_key
    "DOCKER_REGISTRY_SERVER_URL"      = var.registry.url
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.registry.username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.registry.password
  }

  tags = var.tags
}


