output "network_security_group_id" {
  value = {
    for _, v in azurerm_network_security_group.nsg :
    v.name => v.id
  }
}

output "network_security_group_name" {
  value = {
    for _, v in azurerm_network_security_group.nsg :
    v.name => v.name
  }
}