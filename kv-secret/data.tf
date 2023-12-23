data "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  resource_group_name = "devops"
}

data "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  key_vault_id = data.azurerm_key_vault.existing.id
}