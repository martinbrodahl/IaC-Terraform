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

resource "azurerm_resource_group" "rgwe" {
  name     = var.rgname
  location = var.az_regions[1]
  tags     = local.common_tags
}

resource "azurerm_storage_account" "example" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rgwe.name
  location                 = azurerm_resource_group.rgwe.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.common_tags
}

output "said" {
  value = azurerm_storage_account.example.id
}