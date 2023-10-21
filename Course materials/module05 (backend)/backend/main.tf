terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.76.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate-week39"
    storage_account_name = "sabtfstatezzg70n9zod"
    container_name       = "sc-backend-tfstate-week39"
    key                  = "backend.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}

resource "random_string" "random_string" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg-backend" {
  name     = var.rg_backend_name
  location = var.rg_backend_location
}

resource "azurerm_storage_account" "sa-backend" {
  name                     = "${lower(var.sa_backend_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg-backend.name
  location                 = azurerm_resource_group.rg-backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc-backend" {
  name                  = var.sc_backend_name
  storage_account_name  = azurerm_storage_account.sa-backend.name
  container_access_type = "private"
}