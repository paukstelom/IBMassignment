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
    # Set to false due to using Free tier service plan
    always_on = false

    # Specified image and registry credentials
    application_stack {
      docker_image_name        = var.image_name
      docker_registry_url      = var.image_registry_url
      docker_registry_username = var.image_registry_password
      docker_registry_password = var.image_registry_password
    }
  }

  #  Makes a listen on port 3000 as our app is served on this port
  app_settings = {
    "WEBSITES_PORT" = "3000"
  }

  depends_on = [azurerm_service_plan.main]
  tags       = var.tags
}


