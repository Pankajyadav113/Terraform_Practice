resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each = var.backend_pools

  name            = each.value.name
  loadbalancer_id = var.load_balancer_ids[each.value.load_balancer_name]
}