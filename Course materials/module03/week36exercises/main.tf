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

# Resource groups:
resource "azurerm_resource_group" "rg" {
  count = 2

  name     = var.rgnames[count.index]
  location = var.az_locations[count.index]

  tags = local.common_tags
}

# Security group (I use the same SG on all 4 subnets):
resource "azurerm_network_security_group" "nsg" {
  name                = var.sgname
  location            = azurerm_resource_group.rg[0].location
  resource_group_name = azurerm_resource_group.rg[0].name

  tags = local.common_tags
}

# VNETs, each with two subnets:
resource "azurerm_virtual_network" "vn" {
  count = 2

  name                = var.VNETnames[count.index]
  location            = azurerm_resource_group.rg[0].location
  resource_group_name = azurerm_resource_group.rg[0].name
  address_space       = [var.addressspaces[count.index]]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.subnetnames[count.index]
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = var.subnetnames[count.index + 1]
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  tags = local.common_tags
}

/*
# VNET 2 with two subnets:
resource "azurerm_virtual_network" "vn2" {
  name                = var.VNET2name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.0.0.6", "10.0.0.7"]

  subnet {
    name           = var.subnet3name
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = var.subnet4name
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  tags = local.common_tags
}
*/

##########################################################################################

resource "azurerm_storage_account" "sa" {
  count = 3

  name                     = var.sanames[count.index]
  resource_group_name      = azurerm_resource_group.rg[1].name
  location                 = azurerm_resource_group.rg[1].location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.common_tags
}