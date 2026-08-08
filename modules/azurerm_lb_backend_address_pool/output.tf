output "backend_pool_ids" {
  value = {
    for _, v in azurerm_lb_backend_address_pool.backend_pool :
    v.name => v.id
  }
}