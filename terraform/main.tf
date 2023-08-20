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

resource "azurerm_linux_web_app" "main" {
  name                = "${var.prefix}-WEBAPP"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_service_plan.main.location
  service_plan_id     = azurerm_service_plan.main.id
  https_only          = true

  site_config {

  }

  depends_on = [azurerm_service_plan.main]
  tags       = var.tags
}


resource "azurerm_app_service_source_control" "main" {
  app_id = azurerm_linux_web_app.main.id

  github_action_configuration {
    container_configuration {
      image_name        = var.image_name
      registry_url      = var.image_registry_url
      registry_username = var.image_registry_username
      registry_password = var.image_registry_password

    }
  }

  depends_on = [azurerm_linux_web_app.main]

}
