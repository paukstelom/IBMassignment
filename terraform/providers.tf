terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.65.0"
    }
  }
  required_version = ">= 1.5.4"
  backend "azurerm" {
    resource_group_name  = "IBM-ASSIGNMENT-RG-STATE"
    storage_account_name = "stateaccount"
    container_name       = "statecontainer"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}

  skip_provider_registration = true
}
