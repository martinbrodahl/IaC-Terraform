output "vmuser-output" {
  value = azurerm_key_vault_secret.kv-secret-vmuser.value
}

output "vmpass-output" {
  value = azurerm_key_vault_secret.kv-secret-vmpass.value
}