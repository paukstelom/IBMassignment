resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-RG"
  location = var.location
  tags     = var.tags
}

module "web_app" {
  source = "./modules/web_app"

  redis_access_key = module.redis_cache.redis_access_key
  redis_hostname   = module.redis_cache.redis_hostname
  redis_port       = module.redis_cache.redis_port

  image_registry_url      = var.image_registry_url
  image_name              = var.image_name
  image_registry_username = var.image_registry_username
  image_registry_password = var.image_registry_password

  prefix = var.prefix
  tags   = var.tags
  resource_group = {
    name     = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
  }
  depends_on = [azurerm_resource_group.main, module.redis_cache]
}

module "redis_cache" {
  source = "./modules/redis_cache"

  prefix = var.prefix
  tags   = var.tags
  resource_group = {
    name     = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
  }
  depends_on = [azurerm_resource_group.main]  
}
  
