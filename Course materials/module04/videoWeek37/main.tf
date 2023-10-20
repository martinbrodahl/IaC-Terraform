terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "ResourceGroup" {
  source    = "./ResourceGroup"         # Legg merke til at dette (./) er altså en pathway. '.' for stående folder, '/' for valg av mappe
  base_name = "tf-demo"
  location  = "westeurope"
}

module "StorageAccount" {
  source    = "./StorageAccount"
  base_name = "TFdemo"
  rgname    = module.ResourceGroup.rg_name_output       # Output blir sendt fra en child-module opp til root-module
  location  = "westeurope"
}