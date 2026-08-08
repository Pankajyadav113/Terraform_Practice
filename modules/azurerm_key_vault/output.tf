output "key_vault_id" {

  value = {
    for k, v in azurerm_key_vault.kv :
    k => v.id
  }

}

output "key_vault_name" {
  value = {
    for k, v in azurerm_key_vault.kv :
    k => v.name
  }
}