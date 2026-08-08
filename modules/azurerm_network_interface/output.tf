output "network_interface_id" {
  value = {
    for _, v in azurerm_network_interface.nic :
    v.name => v.id
  }
}

output "network_interface_name" {
  value = {
    for _, v in azurerm_network_interface.nic :
    v.name => v.name
  }
}