# Resource Group for all resources
resource "azurerm_resource_group" "rg-infra" {
  name     = "${local.rg_name}-${var.base_name}"
  location = var.location
}

resource "random_string" "random_string" {
  length  = 7
  special = false
  upper   = false
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!%&*()-_=+[]{}<>:?"
}

output "vm_password" {
  value     = azurerm_key_vault_secret.vm-password
  sensitive = true
}

# Test prod