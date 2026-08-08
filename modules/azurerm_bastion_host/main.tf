resource "azurerm_bastion_host" "bastion" {

  for_each = var.bastions

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku = each.value.sku

  ip_configuration {

    name = each.value.ip_configuration_name

    subnet_id = var.subnet_ids["AzureBastionSubnet"]

    public_ip_address_id = var.public_ip_ids[each.value.public_ip_name]
  }
}