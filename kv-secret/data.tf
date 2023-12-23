data "azurerm_key_vault" "kv" {
  name                = "kv-terraform-mattglg"
  resource_group_name = "devops"
}

data "azurerm_key_vault_secret" "secret" {
  name         = "techielasssecret"
  key_vault_id = data.azurerm_key_vault.existing.id
}