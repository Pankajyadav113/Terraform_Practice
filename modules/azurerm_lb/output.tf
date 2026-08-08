output "load_balancer_id" {
  value = {
    for _, v in azurerm_lb.lb :
    v.name => v.id
  }
}

output "frontend_ip_configuration_name" {
  value = {
    for _, v in azurerm_lb.lb :
    v.name => v.frontend_ip_configuration[0].name
  }
}