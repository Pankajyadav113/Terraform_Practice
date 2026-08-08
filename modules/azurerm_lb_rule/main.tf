resource "azurerm_lb_rule" "rule" {

  for_each = var.lb_rules

  name            = each.value.name
  loadbalancer_id = var.load_balancer_ids[each.value.load_balancer_name]

  protocol = each.value.protocol

  frontend_port = each.value.frontend_port
  backend_port  = each.value.backend_port

  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name

  backend_address_pool_ids = [
    var.backend_pool_ids[each.value.backend_pool_name]
  ]

  probe_id = var.probe_ids[each.value.probe_name]

  disable_outbound_snat   = false
  floating_ip_enabled     = false
  idle_timeout_in_minutes = 4
  load_distribution       = "Default"
}