output "redis_hostname" {
  value = azurerm_redis_cache.main.hostname
}

output "redis_port" {
  value = azurerm_redis_cache.main.ssl_port
}

output "redis_access_key" {
  value = azurerm_redis_cache.main.primary_access_key
}