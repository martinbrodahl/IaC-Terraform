resource "azurerm_resource_group" "rg" {
  name     = "rg-we-${var.base_name}"
  location = var.location

  tags = local.common_tags
}