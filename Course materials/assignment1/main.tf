terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}


# Modules:
module "Network" {
  source              = "./Network"
  vnet_rg_name        = var.vnet_rg_name
  vnet_location       = var.vnet_location
  nsg_name            = var.nsg_name
  nsg_personal_pip    = var.nsg_personal_pip
  vnet_name           = var.vnet_name
  vnet_subnet_name    = var.vnet_subnet_name
  common_tags_name    = var.common_tags_name
  common_tags_company = var.common_tags_company
  common_tags_project = var.common_tags_project
}

module "StorageAccount" {
  source              = "./StorageAccount"
  sa_rg_name          = var.sa_rg_name
  sa_location         = var.sa_location
  sa_name             = var.sa_name
  sa_container_name   = var.sa_container_name
  common_tags_name    = var.common_tags_name
  common_tags_company = var.common_tags_company
  common_tags_project = var.common_tags_project
}

module "VirtualMachine" {
  source               = "./VirtualMachine"
  vm_rg_name           = var.vm_rg_name
  vm_location          = var.vm_location
  vm_pip_name          = var.vm_pip_name
  vm_nic_name          = var.vm_nic_name
  output-001-subnet-id = module.Network.subnet-id-output
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  vm_satype            = var.vm_satype
  vm_sku               = var.vm_sku
  output-002-vmuser    = module.KeyVault.vmuser-output
  output-003-vmpass    = module.KeyVault.vmpass-output
  common_tags_name     = var.common_tags_name
  common_tags_company  = var.common_tags_company
  common_tags_project  = var.common_tags_project
}

module "KeyVault" {
  source                     = "./KeyVault"
  kv_rg_name                 = var.kv_rg_name
  kv_location                = var.kv_location
  kv_name                    = var.kv_name
  kv_sku_name                = var.kv_sku_name
  kv_secret_saaccesskey_name = var.kv_secret_saaccesskey_name
  output-001-sa-accesskey    = module.StorageAccount.sa-accesskey-output
  kv_secret_vmuser_name      = var.kv_secret_vmuser_name
  kv_secret_vmuser           = var.kv_secret_vmuser
  kv_secret_vmpass_name      = var.kv_secret_vmpass_name
  kv_secret_vmpass           = var.kv_secret_vmpass
  common_tags_name           = var.common_tags_name
  common_tags_company        = var.common_tags_company
  common_tags_project        = var.common_tags_project
}