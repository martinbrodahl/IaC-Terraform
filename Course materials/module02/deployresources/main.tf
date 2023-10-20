terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  name = "LearnIT"
  tags = {
    environment = "Production"
    costcenter = "IT"
    owner = "Martin B"
  }
}

resource "azurerm_resource_group" "rgwe" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rgwe.name
  location                 = azurerm_resource_group.rgwe.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
  }
}