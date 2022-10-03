terraform {
  required_version = ">=1.2.9"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.23.0"
     }
  }
  backend "azurerm" {
    
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "this" {
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.this.location
  name = "test-vnet"
  resource_group_name = azurerm_resource_group.this.name
  tags = {
    project = "test"
  }
}

resource "azurerm_subnet" "this" {
  address_prefixes = [ "10.0.0.0/24" ]
  name = "subnet-01"
  resource_group_name = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
}

resource "azurerm_network_interface" "this" {
  name = "nic"
  resource_group_name = azurerm_resource_group.this.name
  location = azurerm_resource_group.this.location
  ip_configuration {
    private_ip_address_allocation = "Dynamic"
    name = "ip1"
    subnet_id = azurerm_subnet.this.id
  }
}