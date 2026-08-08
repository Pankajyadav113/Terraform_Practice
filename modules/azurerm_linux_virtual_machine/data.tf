# data "azurerm_subnet" "subnet" {
#     for_each = var.linux_virtual_machine
#   name = each.value.subnet_name
#   resource_group_name = each.value.resource_group_name
#   virtual_network_name = each.value.virtual_network_name
# }

# data "azurerm_public_ip" "public_ip" {
#     for_each = var.linux_virtual_machine
#   name = each.value.pip_name
#   resource_group_name = each.value.resource_group_name  
# }

# data "azurerm_network_interface" "nic" {
#   for_each = var.linux_virtual_machine

#   name                = each.value.network_interface_name
#   resource_group_name = each.value.resource_group_name
# } 