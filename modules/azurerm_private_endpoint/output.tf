output "private_endpoint_id" {
  value = azurerm_private_endpoint.private_endpoint.id
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.dns_zone.id
}

output "private_ip_address" {
  value = azurerm_private_endpoint.private_endpoint.private_service_connection[0].private_ip_address
}