output "public_ip_id" {
  value = {
    for _, v in azurerm_public_ip.public_ips :
    v.name => v.id
  }
}