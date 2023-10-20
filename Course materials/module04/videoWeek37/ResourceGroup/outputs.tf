output "rg_name_output" {
  value = azurerm_resource_group.example.name        # Output blir sendt fra en child-module opp til root-module
}