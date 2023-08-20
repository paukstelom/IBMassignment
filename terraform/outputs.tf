output "azurerm_linux_web_app_dns" {
  value = "${azurerm_linux_web_app.main.name}.azurewebsites.net"

}

