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

module "ResourceGroups" {
  source             = "./ResourceGroups"
  base_name          = var.rgname
  location           = var.location
  company            = var.company
  project            = var.project
  billing_department = var.billing_department
  owner              = var.owner
}

module "VirtualNetwork" {
  source = "./VirtualNetwork"
  base_name = var.nsgname
  location = var.location
  rgname = module.ResourceGroups.rg_name_output
}


