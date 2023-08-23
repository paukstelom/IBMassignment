resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-RG"
  location = var.location
  tags     = var.tags
}

module "web_app" {
  source = "./modules/web_app"

  prefix = var.prefix
  resource_group = {
    name     = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
  }

  redis = module.redis_cache.redis
  registry = {
    image_name = var.image_name
    url        = var.image_registry_url
    username   = var.image_registry_username
    password   = var.image_registry_password
  }

  depends_on = [azurerm_resource_group.main, module.redis_cache]
  tags       = var.tags
}

module "redis_cache" {
  source = "./modules/redis_cache"

  prefix = var.prefix
  resource_group = {
    name     = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
  }

  depends_on = [azurerm_resource_group.main]
  tags       = var.tags
}

