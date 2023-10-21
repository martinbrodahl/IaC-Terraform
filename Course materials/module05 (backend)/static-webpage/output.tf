output "primary_web_endpoint" {
  value = azurerm_storage_account.sa-web.primary_web_endpoint
}

output "rg_name" {
  value = azurerm_resource_group.rg-web.name
}