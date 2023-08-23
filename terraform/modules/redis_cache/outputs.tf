output "redis" {
  value = {
    hostname   = azurerm_redis_cache.main.hostname
    port       = azurerm_redis_cache.main.ssl_port
    access_key = azurerm_redis_cache.main.primary_access_key
  }
}