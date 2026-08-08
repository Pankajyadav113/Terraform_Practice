
resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  for_each = var.linux_virtual_machine

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = each.value.size
  admin_username      = each.value.admin_username

  disable_password_authentication = true

  allow_extension_operations = false

  network_interface_ids = [
    var.network_interface_ids[each.value.nic_name]
  ]

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.public_key
  }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}