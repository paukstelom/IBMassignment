output "azurerm_linux_web_app_dns" {
  value = "${azurerm_linux_web_app.main.name}.azurewebsites.net"

}

output "redispassword" {
    value = azurerm_redis_cache.main.primary_access_key
    sensitive = true
  }