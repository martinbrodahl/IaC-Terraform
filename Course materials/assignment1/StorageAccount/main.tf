terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_string" "random_string" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_resource_group" "sa-rg" {
  name     = var.sa_rg_name
  location = var.sa_location
  
  tags = local.common_tags
}

resource "azurerm_storage_account" "sa" {
  name                     = "${lower(var.sa_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.sa-rg.name
  location                 = azurerm_resource_group.sa-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.common_tags
}

resource "azurerm_storage_container" "sa-container" {
  name                  = var.sa_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}