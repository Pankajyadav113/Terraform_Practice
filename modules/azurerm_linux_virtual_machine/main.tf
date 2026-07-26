resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
    for_each = var.linux_virtual_machine
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = each.value
  admin_username = each.value
  admin_password = each.value
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.network_interface[each.key].id]

   os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }


}