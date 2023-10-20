terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = false
    }
  }
}

resource "random_string" "random_string" {
  length = 6
  special = false
  upper = false
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "kv-rg" {
  name     = var.kv_rg_name
  location = var.kv_location

  tags = local.common_tags
}

resource "azurerm_key_vault" "kv" {
  name                        = "${lower(var.kv_name)}${random_string.random_string.result}"
  location                    = azurerm_resource_group.kv-rg.location
  resource_group_name         = azurerm_resource_group.kv-rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = var.kv_sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","List","Create","Delete",
    ]

    secret_permissions = [
      "Get","Set","List","Delete",
    ]

    storage_permissions = [
      "Get","Set","List","Delete",
    ]
  }

  tags = local.common_tags
}

resource "azurerm_key_vault_secret" "kv-secret-saaccesskey" {
  name         = var.kv_secret_saaccesskey_name
  value        = var.output-001-sa-accesskey
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "kv-secret-vmuser" {
  name         = var.kv_secret_vmuser_name
  value        = var.kv_secret_vmuser
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "kv-secret-vmpass" {
  name         = var.kv_secret_vmpass_name
  value        = var.kv_secret_vmpass
  key_vault_id = azurerm_key_vault.kv.id
}