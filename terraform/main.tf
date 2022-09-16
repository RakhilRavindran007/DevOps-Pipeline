terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.23.0"
     }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "name" {
  name = var.rgname
  location = var.location
}