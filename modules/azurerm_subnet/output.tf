output "subnet_id" {
  value = {
    for _, v in azurerm_subnet.subnets :
    v.name => v.id
  }
}