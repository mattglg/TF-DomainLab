output "secret_value" {
  value = sensitive(data.azurerm_key_vault_secret.secret.value)
}