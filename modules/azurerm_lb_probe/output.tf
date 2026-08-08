output "probe_ids" {
  value = {
    for _, v in azurerm_lb_probe.probe :
    v.name => v.id
  }
}