terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.65.0"
    }
  }
  required_version = ">= 1.5.4"
}
provider "azurerm" {
  features {}
}