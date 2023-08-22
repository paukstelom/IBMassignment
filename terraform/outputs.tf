output "azurerm_linux_web_app_dns" {
  value = "https://${azurerm_linux_web_app.main.name}.azurewebsites.net"
}

