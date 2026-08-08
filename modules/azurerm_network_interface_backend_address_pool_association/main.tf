resource "azurerm_network_interface_backend_address_pool_association" "association" {
  for_each                = var.nic_associations
  network_interface_id    = var.nic_ids[each.value.nic_name]
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = var.backend_pool_ids[each.value.backend_pool_name]
}