terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate-week39"
    storage_account_name = "sabtfstatezzg70n9zod"
    container_name       = "sc-backend-tfstate-week39"
    key                  = "vidWeek42.terraform.tfstate"
  }
  # key                  = "assign2-${local.workspaces_suffix}.terraform.tfstate"
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
