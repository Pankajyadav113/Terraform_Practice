resource "azurerm_lb_probe" "probe" {
  for_each        = var.lb_probes
  name            = each.value.name
  loadbalancer_id = var.load_balancer_ids[each.value.load_balancer_name]

  protocol = each.value.protocol
  port     = each.value.port

  interval_in_seconds = each.value.interval_in_seconds
  number_of_probes    = each.value.number_of_probes
}