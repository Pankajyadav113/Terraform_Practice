resource "azurerm_key_vault_secret" "secret" {
  for_each = var.key_vault_secret

  key_vault_id = each.value.key_vault_id
  name         = each.value.name
  value        = each.value.value

  content_type    = "text/plain"
  expiration_date = "2027-08-08T00:00:00Z"
}