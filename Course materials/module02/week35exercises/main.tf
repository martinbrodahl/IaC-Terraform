terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "rg-we" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "sa-we" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rg-we.name
  location                 = azurerm_resource_group.rg-we.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {}
}

resource "azurerm_network_security_group" "sg-we" {
  name                = var.sgname
  location            = azurerm_resource_group.rg-we.location
  resource_group_name = azurerm_resource_group.rg-we.name
}

resource "azurerm_virtual_network" "vn-we" {
  name                = var.vnname
  location            = azurerm_resource_group.rg-we.location
  resource_group_name = azurerm_resource_group.rg-we.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.snname01
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "sn-02-we"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.sg-we.id
  }

  tags = {}
}