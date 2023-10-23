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
    key                  = "actworkflow.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa-web.primary_web_endpoint
}

output "rg_name" {
  value = azurerm_resource_group.rg-web.name
}

locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_web_name = terraform.workspace == "default" ? "${var.rg_web_name}" : "${var.rg_web_name}-${local.workspaces_suffix}"
  sa_web_name = terraform.workspace == "default" ? "${var.sa_web_name}" : "${var.sa_web_name}-${local.workspaces_suffix}"

  source_content = "${var.source_content}<p>${local.workspaces_suffix}<p>"
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg-web" {
  name     = local.rg_web_name
  location = var.rg_web_location
}

resource "azurerm_storage_account" "sa-web" {
  name                     = local.sa_web_name
  resource_group_name      = azurerm_resource_group.rg-web.name
  location                 = azurerm_resource_group.rg-web.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  static_website {
    index_document = var.index_document
  }
}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa-web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = local.source_content
}

# Destroy nr 2