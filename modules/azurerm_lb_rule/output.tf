output "lb_rule_ids" {
  value = {
    for _, v in azurerm_lb_rule.rule :
    v.name => v.id
  }
}

