resource "azurerm_redis_cache" "main" {
  name                = "${var.prefix}-REDIS"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku_name            = "Basic"
  capacity            = 1
  family              = "C"
  tags                = var.tags
}