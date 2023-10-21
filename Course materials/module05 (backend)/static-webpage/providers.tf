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
    key                  = "static-webpage.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}
