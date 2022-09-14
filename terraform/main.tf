terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.19.0"
     }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "name" {
  name = "test-rg"
  location = "west europe"
}