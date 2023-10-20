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

resource "azurerm_resource_group" "fd-rg" {         # "First deploy resource group"
  name     = "rg-demo-we"                           # "Resource group demo West Eu"
  location = "West Europe"
}

resource "azurerm_storage_account" "sa-demo" {                          # "Storage account demo"
  name                     = "mbdemo1234"                               # "Martin Brodahl demo 1234x"
  resource_group_name      = azurerm_resource_group.fd-rg.name
  location                 = azurerm_resource_group.fd-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}